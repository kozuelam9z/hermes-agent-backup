---
name: wechat-scraper
description: Activates whenever a user provides a wechat article link
version: 1.0.0
category: research
---

## Overview
This skill provides a reusable approach to fetch and parse WeChat public account articles using the `wechat-article-parser` Python library.

## When to Use
- User shares a URL matching `https://mp.weixin.qq.com/s/*`
- Need to extract article text, title, author, publish time, and images.

## Steps
1. **Ensure the library is installed** (you can run this once):
   ```bash
   pip install git+https://github.com/huanjuedadehen/wechat-article-parser.git
   ```
2. **Parse the article**
   ```python
   from wechat_article_parser import parse

   article = parse(url)  # url is the WeChat article link
   ```
3. **Extract desired fields**
   - `article.title`
   - `article.author`
   - `article.publish_time`
   - `article.content` (HTML or plain text)
   - `article.images` (list of image URLs)
4. **Save to file** (optional)
   ```python
   with open('article.txt', 'w', encoding='utf-8') as f:
       f.write(f"Title: {article.title}\n")
       f.write(f"Author: {article.author}\n")
       f.write(f"Published: {article.publish_time}\n\n")
       f.write(article.content)
   ```
5. **Summarize** (if needed) – pass the extracted content to a summarization tool or LLM.

## Pitfalls
- The library may require network access; ensure no firewall blocks.
- Some articles employ anti‑scraping measures; the library attempts to bypass basic checks but may fail on heavily protected pages.
- Always respect copyright and the original author's rights.

## Verification
- After parsing, check that `article.title` is not empty and that `article.content` length > 0.
- Compare extracted title with the page title shown in the browser.

## Example
See `scripts/example.py` for a complete runnable script.