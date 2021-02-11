Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2307570lfc;
        Thu, 11 Feb 2021 06:23:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFihm8qgMJfP0NG8F3zbhhNl053vlEDSZ1ZKpKDoKcwS87MrbKf59lhhW2+6MG0bOhSb0u
X-Received: by 2002:a05:6902:6a2:: with SMTP id j2mr11520981ybt.48.1613053436859;
        Thu, 11 Feb 2021 06:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613053436; cv=none;
        d=google.com; s=arc-20160816;
        b=ugTBgYAkGCOovZhbNkgK7SR58DadWj71K3U2jSqqQ3Mhzae5Sp64orlURQLJ177nja
         z4PRKn77RHPYdAr2FjPO6+8v7AAciA+jy96OHvDfvpBgoWa3CEHjVpA6J4IVYq2fHDYR
         N3FdaVZZ6u/f+VzgpFXkqbDjgyolDQ+1Qub/Mnag6XRwGwyW3H4Yl4wQ5gJCGRKSwOxq
         Z/RK9YGuLCUPWVB3glHRQvHf4sCdhPRsz6tIkC37sXGbbB4SZ3IgXrtanM+MPFbBhVGh
         mEf9ziKojVswtpX8lByGRgsIz3V02QY5EpwUAoWvTYRLp50e1twonQ9mQWmlF9k9Z7O8
         hmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zv2u6w5q5esrZorBsQrCABmG0xarOvGvSZxOFdFbVVI=;
        b=i6zSanhAI8Ty5MSA2tqI8RuNrdaXd6Y/VkLnjyL+vv7zQcEkmkjAkfJ2wCgm3SjtF1
         h2bgEuk/3GXuIujBBvxKsYAWdzpN+pZ2xMobYVFc7CnB/5OeFsz45v4azAKDtWULdk/k
         2Eko1KWT7GjR+KNwxOZpFumeV/Yf+3fILD7VOvU4z5EKc5zbbTmta3kP5+6ylf1adDrl
         jjknzl1Ao5JtHnjatY2SKQM0EF6xwc2UlhXXfUp2mYb/dPgW8yzk91tbiDwc+EZkcoUk
         NN40Yl1fUwz4905pzBAI4PP87bjmtLTmJ2QkE3jwOeiZAFsdmdHXvlPsy+CHn+pgu75g
         AbiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fv742X9N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si5036629ybg.471.2021.02.11.06.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 06:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fv742X9N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lACsu-0000gc-7G
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 09:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl3-0006ZD-53
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:15:50 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkf-000767-Bx
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:15:48 -0500
Received: by mail-wm1-x334.google.com with SMTP id 190so5704713wmz.0
 for <qemu-arm@nongnu.org>; Thu, 11 Feb 2021 06:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zv2u6w5q5esrZorBsQrCABmG0xarOvGvSZxOFdFbVVI=;
 b=fv742X9Nt8cveRnXPyo09PvWLstprnTaR/YEPp/wPBtMKGRishaVE//PM1xEPjFe5Q
 jf4kerKGv2lLYAiyNJVuwb3KTbc4LPuNw5+ySOBHzcpIYvF9xw3hNctd5K+Ka+xd73fI
 VOl7IhQaPvDqhcWYyANW6PHui3VC0awdEcgdCrgKCG4wq7i+RAQcK2VbtiszRDxkEVN0
 IgODshJ0AAAU7CKLe71HwNFxlitrM48m3Z03zLYXKZ6qbRMh04+gHchUsYqsPIMakr6v
 6q7rhL39PozC0QAwjlwHNQhFWkvlCS871OeqX36lkq/5sJfN6CbL+nmI5bVbwPeUXubw
 2RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zv2u6w5q5esrZorBsQrCABmG0xarOvGvSZxOFdFbVVI=;
 b=eWs5/f6v6/fke0ytQAOGdgYu1cpW6Z/0u9KaEdPnoaLf9MUJhGs2e6Omj2prLNI3m/
 uTFU0uCBdaSSbdvcjRVASA4Dh/r2GBrSZgcVQq0ZU3U6KOo2FC8M+xkejfeWOzEtnFHS
 isFVZqRbaX8YvvxIRJSTvJZWvJTYslO3ZTOIJMZEPe2rAKhTWhTsaBOVaACMx+WNuITQ
 PXghRGlPkTWDID1N36DeIhmGlqFJ4yR+vTGql1j4ks71VfqONJvjRegoKOE/SK9d+2nO
 DvEkEd6PO+TfEjE5dHdr9Afp+CtpgIDIl6+Yxx+G6VEjy9cSRKycfsm+7s8vzgqv3pX+
 GjrA==
X-Gm-Message-State: AOAM533UnmSKQlmoZ0JAST9Y8BwkDZHPxLvI8oQRPRhxhCc+zgfxPYAU
 hV2Avz1xOJaP3tYtxP5GHrcNaYKbD9g4sg==
X-Received: by 2002:a05:600c:28d3:: with SMTP id
 h19mr5358567wmd.147.1613052922726; 
 Thu, 11 Feb 2021 06:15:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/display/pxa2xx: Remove use of BITS in pxa2xx_template.h
Date: Thu, 11 Feb 2021 14:15:12 +0000
Message-Id: <20210211141515.8755-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hq42RiEP7fBB

Now that BITS is always 32, expand out all its uses in the template
header, including removing now-useless uses of the glue() macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/pxa2xx_template.h | 110 ++++++++++++++---------------------
 1 file changed, 45 insertions(+), 65 deletions(-)

diff --git a/hw/display/pxa2xx_template.h b/hw/display/pxa2xx_template.h
index c64eebc4b68..711fd9994e2 100644
--- a/hw/display/pxa2xx_template.h
+++ b/hw/display/pxa2xx_template.h
@@ -10,30 +10,11 @@
  */
 
 # define SKIP_PIXEL(to)		to += deststep
-#if BITS == 8
-# define COPY_PIXEL(to, from)  do { *to = from; SKIP_PIXEL(to); } while (0)
-#elif BITS == 15 || BITS == 16
-# define COPY_PIXEL(to, from)    \
-    do {                         \
-        *(uint16_t *) to = from; \
-        SKIP_PIXEL(to);          \
-    } while (0)
-#elif BITS == 24
-# define COPY_PIXEL(to, from)     \
-    do {                          \
-        *(uint16_t *) to = from;  \
-        *(to + 2) = (from) >> 16; \
-        SKIP_PIXEL(to);           \
-    } while (0)
-#elif BITS == 32
 # define COPY_PIXEL(to, from)    \
     do {                         \
         *(uint32_t *) to = from; \
         SKIP_PIXEL(to);          \
     } while (0)
-#else
-# error unknown bit depth
-#endif
 
 #ifdef HOST_WORDS_BIGENDIAN
 # define SWAP_WORDS	1
@@ -42,7 +23,7 @@
 #define FN_2(x)		FN(x + 1) FN(x)
 #define FN_4(x)		FN_2(x + 2) FN_2(x)
 
-static void glue(pxa2xx_draw_line2_, BITS)(void *opaque,
+static void pxa2xx_draw_line2(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t *palette = opaque;
@@ -67,7 +48,7 @@ static void glue(pxa2xx_draw_line2_, BITS)(void *opaque,
     }
 }
 
-static void glue(pxa2xx_draw_line4_, BITS)(void *opaque,
+static void pxa2xx_draw_line4(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t *palette = opaque;
@@ -92,7 +73,7 @@ static void glue(pxa2xx_draw_line4_, BITS)(void *opaque,
     }
 }
 
-static void glue(pxa2xx_draw_line8_, BITS)(void *opaque,
+static void pxa2xx_draw_line8(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t *palette = opaque;
@@ -117,7 +98,7 @@ static void glue(pxa2xx_draw_line8_, BITS)(void *opaque,
     }
 }
 
-static void glue(pxa2xx_draw_line16_, BITS)(void *opaque,
+static void pxa2xx_draw_line16(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -133,19 +114,19 @@ static void glue(pxa2xx_draw_line16_, BITS)(void *opaque,
         data >>= 6;
         r = (data & 0x1f) << 3;
         data >>= 5;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         b = (data & 0x1f) << 3;
         data >>= 5;
         g = (data & 0x3f) << 2;
         data >>= 6;
         r = (data & 0x1f) << 3;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 2;
         src += 4;
     }
 }
 
-static void glue(pxa2xx_draw_line16t_, BITS)(void *opaque,
+static void pxa2xx_draw_line16t(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -164,7 +145,7 @@ static void glue(pxa2xx_draw_line16t_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         data >>= 1;
         b = (data & 0x1f) << 3;
         data >>= 5;
@@ -175,13 +156,13 @@ static void glue(pxa2xx_draw_line16t_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 2;
         src += 4;
     }
 }
 
-static void glue(pxa2xx_draw_line18_, BITS)(void *opaque,
+static void pxa2xx_draw_line18(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -196,14 +177,14 @@ static void glue(pxa2xx_draw_line18_, BITS)(void *opaque,
         g = (data & 0x3f) << 2;
         data >>= 6;
         r = (data & 0x3f) << 2;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
 /* The wicked packed format */
-static void glue(pxa2xx_draw_line18p_, BITS)(void *opaque,
+static void pxa2xx_draw_line18p(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data[3];
@@ -226,32 +207,32 @@ static void glue(pxa2xx_draw_line18p_, BITS)(void *opaque,
         data[0] >>= 6;
         r = (data[0] & 0x3f) << 2;
         data[0] >>= 12;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         b = (data[0] & 0x3f) << 2;
         data[0] >>= 6;
         g = ((data[1] & 0xf) << 4) | (data[0] << 2);
         data[1] >>= 4;
         r = (data[1] & 0x3f) << 2;
         data[1] >>= 12;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         b = (data[1] & 0x3f) << 2;
         data[1] >>= 6;
         g = (data[1] & 0x3f) << 2;
         data[1] >>= 6;
         r = ((data[2] & 0x3) << 6) | (data[1] << 2);
         data[2] >>= 8;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         b = (data[2] & 0x3f) << 2;
         data[2] >>= 6;
         g = (data[2] & 0x3f) << 2;
         data[2] >>= 6;
         r = data[2] << 2;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 4;
     }
 }
 
-static void glue(pxa2xx_draw_line19_, BITS)(void *opaque,
+static void pxa2xx_draw_line19(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -270,14 +251,14 @@ static void glue(pxa2xx_draw_line19_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
 /* The wicked packed format */
-static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
+static void pxa2xx_draw_line19p(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data[3];
@@ -303,7 +284,7 @@ static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
         if (data[0] & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         data[0] >>= 6;
         b = (data[0] & 0x3f) << 2;
         data[0] >>= 6;
@@ -314,7 +295,7 @@ static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
         if (data[1] & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         data[1] >>= 6;
         b = (data[1] & 0x3f) << 2;
         data[1] >>= 6;
@@ -325,7 +306,7 @@ static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
         if (data[2] & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         data[2] >>= 6;
         b = (data[2] & 0x3f) << 2;
         data[2] >>= 6;
@@ -336,12 +317,12 @@ static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
         if (data[2] & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 4;
     }
 }
 
-static void glue(pxa2xx_draw_line24_, BITS)(void *opaque,
+static void pxa2xx_draw_line24(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -356,13 +337,13 @@ static void glue(pxa2xx_draw_line24_, BITS)(void *opaque,
         g = data & 0xff;
         data >>= 8;
         r = data & 0xff;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
-static void glue(pxa2xx_draw_line24t_, BITS)(void *opaque,
+static void pxa2xx_draw_line24t(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -381,13 +362,13 @@ static void glue(pxa2xx_draw_line24t_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
-static void glue(pxa2xx_draw_line25_, BITS)(void *opaque,
+static void pxa2xx_draw_line25(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -406,39 +387,38 @@ static void glue(pxa2xx_draw_line25_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
 /* Overlay planes disabled, no transparency */
-static drawfn glue(pxa2xx_draw_fn_, BITS)[16] =
+static drawfn pxa2xx_draw_fn_32[16] =
 {
     [0 ... 0xf]       = NULL,
-    [pxa_lcdc_2bpp]   = glue(pxa2xx_draw_line2_, BITS),
-    [pxa_lcdc_4bpp]   = glue(pxa2xx_draw_line4_, BITS),
-    [pxa_lcdc_8bpp]   = glue(pxa2xx_draw_line8_, BITS),
-    [pxa_lcdc_16bpp]  = glue(pxa2xx_draw_line16_, BITS),
-    [pxa_lcdc_18bpp]  = glue(pxa2xx_draw_line18_, BITS),
-    [pxa_lcdc_18pbpp] = glue(pxa2xx_draw_line18p_, BITS),
-    [pxa_lcdc_24bpp]  = glue(pxa2xx_draw_line24_, BITS),
+    [pxa_lcdc_2bpp]   = pxa2xx_draw_line2,
+    [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
+    [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
+    [pxa_lcdc_16bpp]  = pxa2xx_draw_line16,
+    [pxa_lcdc_18bpp]  = pxa2xx_draw_line18,
+    [pxa_lcdc_18pbpp] = pxa2xx_draw_line18p,
+    [pxa_lcdc_24bpp]  = pxa2xx_draw_line24,
 };
 
 /* Overlay planes enabled, transparency used */
-static drawfn glue(glue(pxa2xx_draw_fn_, BITS), t)[16] =
+static drawfn pxa2xx_draw_fn_32t[16] =
 {
     [0 ... 0xf]       = NULL,
-    [pxa_lcdc_4bpp]   = glue(pxa2xx_draw_line4_, BITS),
-    [pxa_lcdc_8bpp]   = glue(pxa2xx_draw_line8_, BITS),
-    [pxa_lcdc_16bpp]  = glue(pxa2xx_draw_line16t_, BITS),
-    [pxa_lcdc_19bpp]  = glue(pxa2xx_draw_line19_, BITS),
-    [pxa_lcdc_19pbpp] = glue(pxa2xx_draw_line19p_, BITS),
-    [pxa_lcdc_24bpp]  = glue(pxa2xx_draw_line24t_, BITS),
-    [pxa_lcdc_25bpp]  = glue(pxa2xx_draw_line25_, BITS),
+    [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
+    [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
+    [pxa_lcdc_16bpp]  = pxa2xx_draw_line16t,
+    [pxa_lcdc_19bpp]  = pxa2xx_draw_line19,
+    [pxa_lcdc_19pbpp] = pxa2xx_draw_line19p,
+    [pxa_lcdc_24bpp]  = pxa2xx_draw_line24t,
+    [pxa_lcdc_25bpp]  = pxa2xx_draw_line25,
 };
 
-#undef BITS
 #undef COPY_PIXEL
 #undef SKIP_PIXEL
 
-- 
2.20.1

