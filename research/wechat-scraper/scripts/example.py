#!/usr/bin/env python3
"""
Example script for wechat-scraper skill.
Demonstrates how to parse a WeChat article and save its content.
"""

import sys
from wechat_article_parser import WechatArticleParser

def main():
    if len(sys.argv) < 2:
        print("Usage: python example.py <wechat_article_url>")
        sys.exit(1)
    
    url = sys.argv[1]
    print(f"Parsing article: {url}")
    
    try:
        parser = WechatArticleParser()
        article = parser.parse(url)
        
        print(f"Title: {article.title}")
        print(f"Author: {article.author}")
        print(f"Published: {article.publish_time}")
        print(f"Content length: {len(article.content)} characters")
        print(f"Number of images: {len(article.images)}")
        
        # Save to file
        with open('article_output.txt', 'w', encoding='utf-8') as f:
            f.write(f"Title: {article.title}\n")
            f.write(f"Author: {article.author}\n")
            f.write(f"Published: {article.publish_time}\n\n")
            f.write(article.content)
        
        print("\nArticle saved to article_output.txt")
        
        # Show first 500 characters of content as preview
        preview = article.content[:500] + "..." if len(article.content) > 500 else article.content
        print(f"\nContent preview:\n{preview}")
        
    except Exception as e:
        print(f"Error parsing article: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()