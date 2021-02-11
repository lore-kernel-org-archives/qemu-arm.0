Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2303016lfc;
        Thu, 11 Feb 2021 06:19:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMvaP9dVr3sdJeS8xZJTeWiCKjwdxYOs1g6let9mA3S6vGA+Cvb5Ufz23eehYUArEkd9pa
X-Received: by 2002:a25:7902:: with SMTP id u2mr11934203ybc.482.1613053144249;
        Thu, 11 Feb 2021 06:19:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613053144; cv=none;
        d=google.com; s=arc-20160816;
        b=GMehlu47mihvTd1wg3l99/vmXWYEcE+Q3ms7IxPj4opxY5OKdtUQFwpQ8sXPfnHgU1
         k+MlE4ViraIgRt4DzNGgxQT8qHoMl1QNw76OApgU2ixFiqJdVF2g503RLpNOZFQkycx7
         mihfwGSUJW3jnctFjEHtVn4DWqy0/Mw1iwBPrIfroZjcGPT3VrlFnilUTFC27FDUaCp7
         +mszaxYLXFp/JlDODvtpD/NixiNVg/KUHt9LXDBOHVx25Qk0GBcJ/02gwDmEd/M+RU+r
         Qc0hYPdkIUoxQIa+bqlBNVCfVvJPdd/2npLV/mZlAL3xz5bIyOEkBtpCkVkoJAESYyLZ
         uhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=og9KQQdUmxD32yR3FyUcwq5x901q0uWSRIkM9UH1rUs=;
        b=Uxp60w5MKTLyec50Vv5/uK2joQds8sxN5iDkHI4EjGi/GEPtRwfzYP8blvGx/VWiau
         +85UYu4VlKJUExDdkVaD9L1Duh0yTWaLNgmvJqL6oJlbusolGDu3YdkqJPyFZ95OPWhI
         Et2NogRylQWa01ZgWzmSqcQ1//QLnw6K4/DeCUkkFdHGRGdq1b6fR7vphquDuoTf2oFO
         JBvv3CU1PI+HbZW27OdukZVz32TKwUU/dTXyF5xP6KstmD+xrcE/FzCFXaIFcPwu6Ysu
         nxXwFGPMvoQPMcDY+chAvrHNuCBCVNoeHluXA7aXMVRSwaAPwYd51nxIJINfYpRR5rUP
         QSvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wL2Ok7XK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f130si5021285ybg.79.2021.02.11.06.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 06:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wL2Ok7XK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lACoB-0002M4-H5
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 09:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl0-0006Xw-Ax
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:15:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkc-00074X-WD
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:15:44 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w4so5693861wmi.4
 for <qemu-arm@nongnu.org>; Thu, 11 Feb 2021 06:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=og9KQQdUmxD32yR3FyUcwq5x901q0uWSRIkM9UH1rUs=;
 b=wL2Ok7XK8W1C9rWKvBjT9g1uX0m45O/j/RvQ3WD5ySc3MEUZz9XSjO8UTIdXE2l65K
 QMWwvHfWTWAFCKI8O0+j/9I8qrCwgrxDhj2XBbc5EoxND6oodxcloAAl24soB7aP3Zi4
 m4XDGfEQBCQ/MG4KEQji4/iy4Cn3XdKCbElP6jlAl+dZcJFTofN+nK5l14mMMZzpAmXr
 XecpoTDgfrksoRE9j8BAJIKOmNC83X8EtyNTeGkYgFLKgUc8TEGniX3A/goJHiYzgivf
 HVxRxuS2hbNmssV+dPFdvLL1BWiPA/gSXEHeu583Qt4d/Iu26j8r4HoD83wyfUpLnpyF
 RWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=og9KQQdUmxD32yR3FyUcwq5x901q0uWSRIkM9UH1rUs=;
 b=XE8UOaHmxarcnHVRyc3CiO3MmijGVb48bX48kuHpYTiOzhtsySm7nEYP+z2guKpc/C
 VUmYl6Svh2DXfKQUmvwycHyqCjKPgDjvPWfFM2PxbmpuPOo+HAV/GX4FlkZok/v0ru1A
 3t8JY67Ex0FUB8DYO0SnCIECFYN9MFoQYyeP6Jr3OXJG640Mtjnai/+9yg8wsoaVES2S
 Kgn550iswCjADsfDjxkvxKccrbYbQIX7Pen0AxI5+RiqVd5Na2bO8pirkG5Pi/h+Qu49
 7b8UHn1pzm05QmSyt888E4bCHgxJchJ2LNF2Kq23vZLSPi91hSXuMpfHSHi6pscszKmy
 83wQ==
X-Gm-Message-State: AOAM531MlwVqJjirjoGuceaZk6KNJuMMYUW/5tlWcVjFc2h2t+dIdjfY
 oE++3LJvmzCNI9fqcjJHkGftB0I5KC//SQ==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr5334787wmb.69.1613052920013;
 Thu, 11 Feb 2021 06:15:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/9] hw/display/pl110: Remove use of BITS from pl110_template.h
Date: Thu, 11 Feb 2021 14:15:09 +0000
Message-Id: <20210211141515.8755-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: TEMyRDAyKDam

BITS is always 32, so remove all uses of it from the template header,
by dropping the trailing '32' from the draw function names and
not constructing the name of rgb_to_pixel32() via the glue() macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/pl110_template.h |  20 +++----
 hw/display/pl110.c          | 113 ++++++++++++++++++------------------
 2 files changed, 65 insertions(+), 68 deletions(-)

diff --git a/hw/display/pl110_template.h b/hw/display/pl110_template.h
index 0d8471db636..877419aa817 100644
--- a/hw/display/pl110_template.h
+++ b/hw/display/pl110_template.h
@@ -14,18 +14,18 @@
 #endif
 
 #if ORDER == 0
-#define NAME glue(glue(lblp_, BORDER), BITS)
+#define NAME glue(lblp_, BORDER)
 #ifdef HOST_WORDS_BIGENDIAN
 #define SWAP_WORDS 1
 #endif
 #elif ORDER == 1
-#define NAME glue(glue(bbbp_, BORDER), BITS)
+#define NAME glue(bbbp_, BORDER)
 #ifndef HOST_WORDS_BIGENDIAN
 #define SWAP_WORDS 1
 #endif
 #else
 #define SWAP_PIXELS 1
-#define NAME glue(glue(lbbp_, BORDER), BITS)
+#define NAME glue(lbbp_, BORDER)
 #ifdef HOST_WORDS_BIGENDIAN
 #define SWAP_WORDS 1
 #endif
@@ -174,14 +174,14 @@ static void glue(pl110_draw_line16_,NAME)(void *opaque, uint8_t *d, const uint8_
         MSB = (data & 0x1f) << 3;
         data >>= 5;
 #endif
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
         LSB = (data & 0x1f) << 3;
         data >>= 5;
         g = (data & 0x3f) << 2;
         data >>= 6;
         MSB = (data & 0x1f) << 3;
         data >>= 5;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
 #undef MSB
 #undef LSB
         width -= 2;
@@ -211,7 +211,7 @@ static void glue(pl110_draw_line32_,NAME)(void *opaque, uint8_t *d, const uint8_
         g = (data >> 16) & 0xff;
         MSB = (data >> 8) & 0xff;
 #endif
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
 #undef MSB
 #undef LSB
         width--;
@@ -242,14 +242,14 @@ static void glue(pl110_draw_line16_555_,NAME)(void *opaque, uint8_t *d, const ui
         data >>= 5;
         MSB = (data & 0x1f) << 3;
         data >>= 5;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
         LSB = (data & 0x1f) << 3;
         data >>= 5;
         g = (data & 0x1f) << 3;
         data >>= 5;
         MSB = (data & 0x1f) << 3;
         data >>= 6;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
 #undef MSB
 #undef LSB
         width -= 2;
@@ -280,14 +280,14 @@ static void glue(pl110_draw_line12_,NAME)(void *opaque, uint8_t *d, const uint8_
         data >>= 4;
         MSB = (data & 0xf) << 4;
         data >>= 8;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
         LSB = (data & 0xf) << 4;
         data >>= 4;
         g = (data & 0xf) << 4;
         data >>= 4;
         MSB = (data & 0xf) << 4;
         data >>= 8;
-        COPY_PIXEL(d, glue(rgb_to_pixel,BITS)(r, g, b));
+        COPY_PIXEL(d, rgb_to_pixel32(r, g, b));
 #undef MSB
 #undef LSB
         width -= 2;
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index ce300662e8b..4bf15c1da51 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -123,7 +123,6 @@ static const unsigned char *idregs[] = {
     pl111_id
 };
 
-#define BITS 32
 #define COPY_PIXEL(to, from) do { *(uint32_t *)to = from; to += 4; } while (0)
 
 #undef RGB
@@ -145,65 +144,63 @@ static const unsigned char *idregs[] = {
 #include "pl110_template.h"
 #undef BORDER
 
-static drawfn pl110_draw_fn_32[48] = {
-    pl110_draw_line1_lblp_bgr32,
-    pl110_draw_line2_lblp_bgr32,
-    pl110_draw_line4_lblp_bgr32,
-    pl110_draw_line8_lblp_bgr32,
-    pl110_draw_line16_555_lblp_bgr32,
-    pl110_draw_line32_lblp_bgr32,
-    pl110_draw_line16_lblp_bgr32,
-    pl110_draw_line12_lblp_bgr32,
-
-    pl110_draw_line1_bbbp_bgr32,
-    pl110_draw_line2_bbbp_bgr32,
-    pl110_draw_line4_bbbp_bgr32,
-    pl110_draw_line8_bbbp_bgr32,
-    pl110_draw_line16_555_bbbp_bgr32,
-    pl110_draw_line32_bbbp_bgr32,
-    pl110_draw_line16_bbbp_bgr32,
-    pl110_draw_line12_bbbp_bgr32,
-
-    pl110_draw_line1_lbbp_bgr32,
-    pl110_draw_line2_lbbp_bgr32,
-    pl110_draw_line4_lbbp_bgr32,
-    pl110_draw_line8_lbbp_bgr32,
-    pl110_draw_line16_555_lbbp_bgr32,
-    pl110_draw_line32_lbbp_bgr32,
-    pl110_draw_line16_lbbp_bgr32,
-    pl110_draw_line12_lbbp_bgr32,
-
-    pl110_draw_line1_lblp_rgb32,
-    pl110_draw_line2_lblp_rgb32,
-    pl110_draw_line4_lblp_rgb32,
-    pl110_draw_line8_lblp_rgb32,
-    pl110_draw_line16_555_lblp_rgb32,
-    pl110_draw_line32_lblp_rgb32,
-    pl110_draw_line16_lblp_rgb32,
-    pl110_draw_line12_lblp_rgb32,
-
-    pl110_draw_line1_bbbp_rgb32,
-    pl110_draw_line2_bbbp_rgb32,
-    pl110_draw_line4_bbbp_rgb32,
-    pl110_draw_line8_bbbp_rgb32,
-    pl110_draw_line16_555_bbbp_rgb32,
-    pl110_draw_line32_bbbp_rgb32,
-    pl110_draw_line16_bbbp_rgb32,
-    pl110_draw_line12_bbbp_rgb32,
-
-    pl110_draw_line1_lbbp_rgb32,
-    pl110_draw_line2_lbbp_rgb32,
-    pl110_draw_line4_lbbp_rgb32,
-    pl110_draw_line8_lbbp_rgb32,
-    pl110_draw_line16_555_lbbp_rgb32,
-    pl110_draw_line32_lbbp_rgb32,
-    pl110_draw_line16_lbbp_rgb32,
-    pl110_draw_line12_lbbp_rgb32,
-};
-
-#undef BITS
 #undef COPY_PIXEL
 
+static drawfn pl110_draw_fn_32[48] = {
+    pl110_draw_line1_lblp_bgr,
+    pl110_draw_line2_lblp_bgr,
+    pl110_draw_line4_lblp_bgr,
+    pl110_draw_line8_lblp_bgr,
+    pl110_draw_line16_555_lblp_bgr,
+    pl110_draw_line32_lblp_bgr,
+    pl110_draw_line16_lblp_bgr,
+    pl110_draw_line12_lblp_bgr,
+
+    pl110_draw_line1_bbbp_bgr,
+    pl110_draw_line2_bbbp_bgr,
+    pl110_draw_line4_bbbp_bgr,
+    pl110_draw_line8_bbbp_bgr,
+    pl110_draw_line16_555_bbbp_bgr,
+    pl110_draw_line32_bbbp_bgr,
+    pl110_draw_line16_bbbp_bgr,
+    pl110_draw_line12_bbbp_bgr,
+
+    pl110_draw_line1_lbbp_bgr,
+    pl110_draw_line2_lbbp_bgr,
+    pl110_draw_line4_lbbp_bgr,
+    pl110_draw_line8_lbbp_bgr,
+    pl110_draw_line16_555_lbbp_bgr,
+    pl110_draw_line32_lbbp_bgr,
+    pl110_draw_line16_lbbp_bgr,
+    pl110_draw_line12_lbbp_bgr,
+
+    pl110_draw_line1_lblp_rgb,
+    pl110_draw_line2_lblp_rgb,
+    pl110_draw_line4_lblp_rgb,
+    pl110_draw_line8_lblp_rgb,
+    pl110_draw_line16_555_lblp_rgb,
+    pl110_draw_line32_lblp_rgb,
+    pl110_draw_line16_lblp_rgb,
+    pl110_draw_line12_lblp_rgb,
+
+    pl110_draw_line1_bbbp_rgb,
+    pl110_draw_line2_bbbp_rgb,
+    pl110_draw_line4_bbbp_rgb,
+    pl110_draw_line8_bbbp_rgb,
+    pl110_draw_line16_555_bbbp_rgb,
+    pl110_draw_line32_bbbp_rgb,
+    pl110_draw_line16_bbbp_rgb,
+    pl110_draw_line12_bbbp_rgb,
+
+    pl110_draw_line1_lbbp_rgb,
+    pl110_draw_line2_lbbp_rgb,
+    pl110_draw_line4_lbbp_rgb,
+    pl110_draw_line8_lbbp_rgb,
+    pl110_draw_line16_555_lbbp_rgb,
+    pl110_draw_line32_lbbp_rgb,
+    pl110_draw_line16_lbbp_rgb,
+    pl110_draw_line12_lbbp_rgb,
+};
 
 static int pl110_enabled(PL110State *s)
 {
-- 
2.20.1

