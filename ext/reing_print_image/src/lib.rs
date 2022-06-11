use magnus::{define_class, function, method, prelude::*, Error};
use reing_text2image::TextImage;
use std::path::Path;

#[magnus::wrap(class = "ReingPrintImage")]
struct ReingPrintImage {
    text_image: TextImage
}

impl ReingPrintImage {
    fn internal_new(text: String, brand: String, rgb_color: (u8, u8, u8)) -> Self {
        Self {
            text_image: TextImage::new(text, brand, rgb_color)
        }
    }

    fn save(&self, path: String) {
        self.text_image.save_image(&Path::new(&path))
    }
}

#[magnus::init]
fn init() -> Result<(), Error> {
    let class = define_class("ReingPrintImage", Default::default())?;
    class.define_singleton_method("internal_new", function!(ReingPrintImage::internal_new, 3))?;
    class.define_method("save", method!(ReingPrintImage::save, 1))?;
    Ok(())
}
