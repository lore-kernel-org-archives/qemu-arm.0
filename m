Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5505205lfc;
        Mon, 15 Feb 2021 02:39:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9IVRKL8gboRTHA7NLzgqB2rAjHiX5dlQZ3I4ciUuc5xS6h2yvLHaiC8nYjlYbd2i7eeLg
X-Received: by 2002:a25:a241:: with SMTP id b59mr23128253ybi.289.1613385554448;
        Mon, 15 Feb 2021 02:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613385554; cv=none;
        d=google.com; s=arc-20160816;
        b=qv/iCRb+I5yjRCM33vv/haZVG61RC1+mANISmkLNzMBQwKVS1sJHRrdZ6ce4zThadv
         A3bFcBQRpsHdMsxeCEmihKnMwLFLkz2VFneisp35cqBiZ4sMfyJO2nTzoYtGDdEZUA6p
         cpNLwPZOvZ4N4L8UuR/NHtk2+iSDkKGc22kMnVwWqKBjyYuoEkwTR5c/Rh/EK6upDZ6V
         CUCfWqABY3vp11F+PQljw0XmERfT4ZmkxUM52aiOi2y/9BL5H1rVF66NcqBvnTiPEOjs
         0yzntBBF5lflt1Ozel7KjfWxYsiwSfqKEmu5e3kgyWHwPb1OB3VZPwCH7J0DZA6kPpFJ
         m3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1wqQuNSScfV3wYUHwareGGzMG2kJiGR91GYUzreZvQc=;
        b=ewkAnP1iFjVr9Mz1WubT4bzIbKnF9CSnfMn+nUCj6FC9foBXI7NV9ujuBAkdKwzZ0M
         sdpUOUHDCJ2dtLKOluIxmhlDxOsP+zqWo89cPiiM8r8cVzVMCzpSo6cYrBWrbzDdNxgZ
         7SeK2S64tfQDIUI6IK9VEDqknEQEMhj0gDN2GeD+hN5u1ZDaYvkPPc/pEl3xleESPufs
         2m9yNHjDyyEjZV63N9PJhUuzfL9Y9XqKmEAB137dvkerTFbp5Afz8RvIrLAXT24Q+x5Q
         ZqgTMLz+k0QJKeQbd43UQk7nBslumXljlz+MwWbOhK7wflKmuiO2tjBVeNU+H8neCzdZ
         gyng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S2vPhc/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si19039118ybb.446.2021.02.15.02.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 02:39:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S2vPhc/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBbHd-000415-Mv
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 05:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB8-0004Pt-FE
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:30 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB1-0001iO-MC
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:30 -0500
Received: by mail-wr1-x435.google.com with SMTP id v1so8243566wrd.6
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 02:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wqQuNSScfV3wYUHwareGGzMG2kJiGR91GYUzreZvQc=;
 b=S2vPhc/W8Bj086kHqYFUFE6pOvKHqXBAhdl0iuxV/+svZQEYnRAKMMiux5RnJZeJq4
 Lmt1ufZ+n5fyBxA7/sN6SPf2qhLi90/09djJjGBjPpIQriNGBRSoTXMR4Deh3af+IWSV
 cFHlQipZ101EeZdwkhnGynXz+kX+JIV3VqyC5m1W7xDRK2Cr59XRjJ2HN4Qy5jd/3Odd
 d+U8Qb8eSNUTB8JQ438myy+4eZY3Pqd7/4JCG4Vs5ohXRvqx4VAlWye+g9r5ZY4uqsa8
 G8OQY8bnYFNSxD6oDamRRHUmfHXKFkRv/CceGF5Mr/L+mgmXLyWExnaPo2aLMEwwW94N
 REfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wqQuNSScfV3wYUHwareGGzMG2kJiGR91GYUzreZvQc=;
 b=pZWap3qVQ2ODdwi/uXHhBax0izLWUQAS3lXATAffK6nrW0YTLtqPq5/U5ZSpUx1rYP
 TWjX0DrimYH1Zwh7Yw2ptI4uEFBIHWMKkmGKfD9tZg8l5XFQdOGxZyeK+3iUHnucMJKN
 zxnkx2G8C9K1YG+sAYDwvqIZelBBHJNRFIK2h4Za2DmJBXySB0LiHdDxjraycbb5Py+8
 6p3f+epoTqAIoudm3F7VGoralU4rKbYuXyr55d/c15pVzj8hviwvcpsxmG8dw2Ft0srW
 h3NeZ9gjJadnLckQ5jaBZtZ/3QMfVmutwDZMmNId2sbQYVA7kkqLJqP3lGQWjaf62Umv
 xmFw==
X-Gm-Message-State: AOAM532Kb0ICc6R8lmvibH9GFvmkOc8BjHKBA4k6fao02J/jgfDrntpM
 7IxdxTg817avgnciKMDnZJYUVyS8a2ainQ==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr15517254wrn.374.1613385141569; 
 Mon, 15 Feb 2021 02:32:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/9] hw/display/omap_lcdc: Expand out macros in template header
Date: Mon, 15 Feb 2021 10:32:11 +0000
Message-Id: <20210215103215.4944-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvazrpAs1viY

The omap_lcdc template header is already only included once, for
DEPTH==32, but it still has all the macro-driven parameterization
for other depths. Expand out all the macros in the header.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/omap_lcd_template.h | 67 ++++++++++++++--------------------
 1 file changed, 28 insertions(+), 39 deletions(-)

diff --git a/hw/display/omap_lcd_template.h b/hw/display/omap_lcd_template.h
index 1025ff3825d..c7c5025fb04 100644
--- a/hw/display/omap_lcd_template.h
+++ b/hw/display/omap_lcd_template.h
@@ -27,18 +27,11 @@
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#if DEPTH == 32
-# define BPP 4
-# define PIXEL_TYPE uint32_t
-#else
-# error unsupport depth
-#endif
-
 /*
  * 2-bit colour
  */
-static void glue(draw_line2_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line2_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
 {
     uint16_t *pal = opaque;
     uint8_t v, r, g, b;
@@ -48,26 +41,26 @@ static void glue(draw_line2_, DEPTH)(void *opaque,
         r = (pal[v & 3] >> 4) & 0xf0;
         g = pal[v & 3] & 0xf0;
         b = (pal[v & 3] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         v >>= 2;
         r = (pal[v & 3] >> 4) & 0xf0;
         g = pal[v & 3] & 0xf0;
         b = (pal[v & 3] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         v >>= 2;
         r = (pal[v & 3] >> 4) & 0xf0;
         g = pal[v & 3] & 0xf0;
         b = (pal[v & 3] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         v >>= 2;
         r = (pal[v & 3] >> 4) & 0xf0;
         g = pal[v & 3] & 0xf0;
         b = (pal[v & 3] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         s ++;
         width -= 4;
     } while (width > 0);
@@ -76,8 +69,8 @@ static void glue(draw_line2_, DEPTH)(void *opaque,
 /*
  * 4-bit colour
  */
-static void glue(draw_line4_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line4_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
 {
     uint16_t *pal = opaque;
     uint8_t v, r, g, b;
@@ -87,14 +80,14 @@ static void glue(draw_line4_, DEPTH)(void *opaque,
         r = (pal[v & 0xf] >> 4) & 0xf0;
         g = pal[v & 0xf] & 0xf0;
         b = (pal[v & 0xf] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         v >>= 4;
         r = (pal[v & 0xf] >> 4) & 0xf0;
         g = pal[v & 0xf] & 0xf0;
         b = (pal[v & 0xf] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
-        d += BPP;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
         s ++;
         width -= 2;
     } while (width > 0);
@@ -103,8 +96,8 @@ static void glue(draw_line4_, DEPTH)(void *opaque,
 /*
  * 8-bit colour
  */
-static void glue(draw_line8_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line8_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
 {
     uint16_t *pal = opaque;
     uint8_t v, r, g, b;
@@ -114,17 +107,17 @@ static void glue(draw_line8_, DEPTH)(void *opaque,
         r = (pal[v] >> 4) & 0xf0;
         g = pal[v] & 0xf0;
         b = (pal[v] << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         s ++;
-        d += BPP;
+        d += 4;
     } while (-- width != 0);
 }
 
 /*
  * 12-bit colour
  */
-static void glue(draw_line12_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line12_32(void *opaque, uint8_t *d, const uint8_t *s,
+                           int width, int deststep)
 {
     uint16_t v;
     uint8_t r, g, b;
@@ -134,17 +127,17 @@ static void glue(draw_line12_, DEPTH)(void *opaque,
         r = (v >> 4) & 0xf0;
         g = v & 0xf0;
         b = (v << 4) & 0xf0;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         s += 2;
-        d += BPP;
+        d += 4;
     } while (-- width != 0);
 }
 
 /*
  * 16-bit colour
  */
-static void glue(draw_line16_, DEPTH)(void *opaque,
-                uint8_t *d, const uint8_t *s, int width, int deststep)
+static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
+                           int width, int deststep)
 {
 #if defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
     memcpy(d, s, width * 2);
@@ -157,13 +150,9 @@ static void glue(draw_line16_, DEPTH)(void *opaque,
         r = (v >> 8) & 0xf8;
         g = (v >> 3) & 0xfc;
         b = (v << 3) & 0xf8;
-        ((PIXEL_TYPE *) d)[0] = glue(rgb_to_pixel, DEPTH)(r, g, b);
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         s += 2;
-        d += BPP;
+        d += 4;
     } while (-- width != 0);
 #endif
 }
-
-#undef DEPTH
-#undef BPP
-#undef PIXEL_TYPE
-- 
2.20.1

