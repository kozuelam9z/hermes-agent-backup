---
name: wechat-verification-handling
description: Handles WeChat public platform verification pages to detect bot detection and attempt to click verification button, handling CAPTCHA challenges.
category: browser
---

# WeChat Public Platform Verification Handling

## Description
When attempting to access articles on WeChat Public Platform (mp.weixin.qq.com), automated requests may trigger an environment verification page (bot detection) displaying a heading "环境异常" and a prompt to complete verification. This skill outlines steps to detect this page, interact with the verification button, and handle the subsequent CAPTCHA challenge, ultimately determining when manual intervention is required.

## Trigger Conditions
- URL matches `mp.weixin.qq.com/s/...`
- Page snapshot shows heading "环境异常" or text containing "当前环境异常，完成验证后即可继续访问。"
- Presence of a button/link with text "去验证"

## Steps
1. **Navigate to the target URL** using `browser_navigate`.
2. **Take a snapshot** (`browser_snapshot`) to inspect for verification indicators.
3. If verification indicators are present:
   - Use `browser_vision` (with `annotate:true`) to locate the verification button and obtain its ref ID.
   - Click the button via `browser_click` using the obtained ref.
   - Wait briefly (e.g., 2 seconds) for potential CAPTCHA to appear.
   - Take another snapshot/vision check to see if a CAPTCHA challenge (slider, image selection, etc.) is displayed.
4. If a CAPTCHA challenge is detected:
   - Conclude that automated solving is not feasible with current toolset.
   - Inform the user that manual verification is required and request they provide the article text or complete verification manually.
5. If verification button click leads directly to content (no CAPTCHA), proceed to extract article content using standard methods (snapshot, vision, or text extraction via Jina AI reader, etc.).
6. Save extracted content to a local file using `write_file` and summarize as needed.

## Pitfalls
- The verification page may embed the button inside an iframe; snapshot may not show interactive elements if iframe not switched.
- Clicking the verification button often triggers a Tencent CAPTCHA (slider puzzle) that requires human-like interaction; current toolset cannot solve it.
- Repeated navigation attempts may increase detection severity; limit retries.
- The page may change its DOM structure; rely on text patterns ("环境异常", "去验证") rather than fixed selectors.

## Verification
- After clicking verification button, confirm that the snapshot no longer contains the verification heading and that article content is present.
- If CAPTCHA persists, stop automation and request user assistance.

## References
- None

## Example Usage
```
# Pseudo-code
navigate to URL
snapshot -> if "环境异常" present:
  vision -> get ref for "去验证"
  click ref
  wait
  snapshot -> if CAPTCHA visible:
    inform user manual verification needed
    exit
  else:
    extract content
```