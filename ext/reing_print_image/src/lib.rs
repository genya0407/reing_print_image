use image::codecs::png::PngEncoder;
use image::ColorType;
use magnus::{define_class, function, method, prelude::*, r_string::RString, Error};
use reing_text2image::TextImage;
use std::path::Path;

#[magnus::wrap(class = "ReingPrintImage")]
struct ReingPrintImage {
    text_image: TextImage,
}

impl ReingPrintImage {
    fn internal_new(text: String, brand: String, rgb_color: (u8, u8, u8)) -> Self {
        Self {
            text_image: TextImage::new(text, brand, rgb_color),
        }
    }

    fn save(&self, path: String) {
        self.text_image.save_image(&Path::new(&path))
    }

    fn encode_as_png(&self) -> RString {
        let rgb_image = self.text_image.text2image();
        let width = rgb_image.width();
        let height = rgb_image.height();
        let raw = rgb_image.into_raw();
        let mut output = vec![];
        PngEncoder::new(&mut output)
            .encode(&raw, width, height, ColorType::Rgb8)
            .unwrap();
        RString::from_slice(&output)
    }
}

#[magnus::init]
fn init() -> Result<(), Error> {
    let class = define_class("ReingPrintImage", Default::default())?;
    class.define_singleton_method("internal_new", function!(ReingPrintImage::internal_new, 3))?;
    class.define_method("save", method!(ReingPrintImage::save, 1))?;
    class.define_method("encode_as_png", method!(ReingPrintImage::encode_as_png, 0))?;
    Ok(())
}
