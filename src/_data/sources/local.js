// src/_data/sources/local.js

// We will enable this later when you are ready to process real local images.
// You will need to run: npm install glob @11ty/eleventy-img

module.exports = async function() {
  console.log("Skipping Local fetch (Using dummy data for now)");
  return [];
};

/* --- SAVE FOR LATER (Real Implementation) ---
const glob = require("glob");
const path = require("path");
const Image = require("@11ty/eleventy-img");

module.exports = async function() {
  const files = glob.sync("./src/images/portfolio/*.{jpg,jpeg,png,webp}");
  
  const photos = await Promise.all(files.map(async (file) => {
    const metadata = await Image(file, {
      widths: [600, 1200],
      formats: ["webp", "jpeg"],
      outputDir: "./_site/img/",
      urlPath: "/img/"
    });

    const data = metadata.jpeg[metadata.jpeg.length - 1];
    const thumb = metadata.jpeg[0];

    return {
      id: path.basename(file, path.extname(file)),
      src: data.url,
      thumb: thumb.url,
      width: data.width,
      height: data.height,
      aspectRatio: data.width / data.height,
      alt: "Local Portfolio Image",
      date: new Date(),
      source: "local"
    };
  }));

  return photos;
};
*/