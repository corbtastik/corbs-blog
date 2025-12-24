#!/bin/bash

# Configuration
TARGET_DIR="src/posts"
mkdir -p "$TARGET_DIR"

echo "Generating 50 sample posts in $TARGET_DIR..."

# Arrays for random content generation
TITLES=(
  "The Future of JAMstack" "Understanding CSS Grid" "The Joy of Markdown" 
  "Eleventy vs Gatsby" "Node.js Performance Tips" "A Guide to SEO" 
  "My Developer Setup" "Coffee and Coding" "Debugging Nightmares" 
  "The History of the Web" "Linux Command Line" "Vim vs Emacs"
  "Automating Workflows" "Database 101" "API Design Patterns"
)

TAGS=("coding" "lifestyle" "setup" "tutorial" "web-dev" "thoughts" "serverless")

# Public Domain / Placeholder Text (Lorem Ipsum & Moby Dick excerpts)
TEXT_SHORT="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Call me Ishmael. Some years ago—never mind how long precisely—having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world."

TEXT_LONG="It is a way I have of driving off the spleen and regulating the circulation. Whenever I find myself growing grim about the mouth; whenever it is a damp, drizzly November in my soul; whenever I find myself involuntarily pausing before coffin warehouses, and bringing up the rear of every funeral I meet; and especially whenever my hypos get such an upper hand of me that it requires a strong moral principle to prevent me from deliberately stepping into the street, and methodically knocking people's hats off—then, I account it high time to get to sea as soon as I can. This is my substitute for pistol and ball."

# Loop to create 50 posts
for i in {0..49}; do
  
  # 1. gdate Calculation (Going back from Dec 23, 2025)
  # Note: 'gdate -d' is GNU (Linux) syntax. 
  # If on macOS without coreutils, you might need to install 'coreutils' or run this in a Docker/Linux env.
  POST_gdate=$(gdate -d "2025-12-23 - $i days" +%Y-%m-%d)
  
  # 2. Random Selection
  RAND_TITLE=${TITLES[$((RANDOM % ${#TITLES[@]}))]}
  RAND_TAG=${TAGS[$((RANDOM % ${#TAGS[@]}))]}
  
  # Ensure unique filename
  FILENAME="$TARGET_DIR/generated-post-$i.md"
  
  # 3. Determine Size (0=Small, 1=Medium, 2=Large)
  SIZE=$((RANDOM % 3))

  # 4. Write Frontmatter
  cat <<EOF > "$FILENAME"
---
title: "$RAND_TITLE (Sample $i)"
gdate: $POST_gdate
tags: ["$RAND_TAG", "demo"]
description: "A generated sample post to test the layout and search capabilities."
layout: base.njk
---
EOF

  # 5. Write Content based on Size
  if [ $SIZE -eq 0 ]; then
    # --- SMALL POST ---
    cat <<EOF >> "$FILENAME"
## Quick Upgdate

$TEXT_SHORT

*Generated Size: Small*
EOF

  elif [ $SIZE -eq 1 ]; then
    # --- MEDIUM POST ---
    cat <<EOF >> "$FILENAME"
## Overview

$TEXT_SHORT

### Key Takeaways
*   Understanding the basics is crucial.
*   Always check your console for errors.
*   Deploy early, deploy often.

![A random abstract banner](https://placehold.co/600x200/2980b9/ffffff?text=Medium+Post+Banner)

$TEXT_LONG

*Generated Size: Medium*
EOF

  else
    # --- LARGE POST ---
    cat <<EOF >> "$FILENAME"
## Deep Dive Analysis

$TEXT_SHORT

> "The web is a canvas, and code is your paint."

### Detailed Breakdown

$TEXT_LONG

#### Code Example
Here is how we might handle this logic in JavaScript:

\`\`\`javascript
function calculateMetrics(data) {
  return data.reduce((acc, curr) => acc + curr, 0);
}

console.log("Processing complete.");
\`\`\`

### Data Comparison

| Metric | Value | Status |
| :--- | :--- | :--- |
| Speed | 98ms | Optimal |
| Size | 12kb | Good |
| SEO | 100% | Perfect |

### Visual Gallery

<div style="display: flex; gap: 10px; flex-wrap: wrap; margin-top: 20px;">
  <img src="https://placehold.co/150x150/e74c3c/ffffff?text=Img+A" alt="Gallery A">
  <img src="https://placehold.co/150x150/f1c40f/333333?text=Img+B" alt="Gallery B">
  <img src="https://placehold.co/150x150/8e44ad/ffffff?text=Img+C" alt="Gallery C">
</div>

$TEXT_LONG

*Generated Size: Large*
EOF
  fi

done

echo "Success! 50 posts generated in $TARGET_DIR."