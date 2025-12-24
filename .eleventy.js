// .eleventy.js
const { DateTime } = require("luxon"); // Optional: helper for dates if needed later

module.exports = function(eleventyConfig) {
    // Copy the `assets` folder to the output
    eleventyConfig.addPassthroughCopy("src/assets");
    
    // Create a collection for search
    eleventyConfig.addCollection("posts", function(collection) {
        return collection.getFilteredByGlob("src/posts/*.md");
    });

    return {
        dir: {
            input: "src",
            output: "_site", // The folder where plain HTML lands
            includes: "_includes"
        }
    };
};