Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2306515lfc;
        Thu, 11 Feb 2021 06:22:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmIQb6W6lMEyGuK1AEm79vITw58NOoTAsic8xQaVSJA75bA+TkLtcWV2SAnX+DwSL+3aIL
X-Received: by 2002:a25:dc8:: with SMTP id 191mr12294299ybn.246.1613053368558;
        Thu, 11 Feb 2021 06:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613053368; cv=none;
        d=google.com; s=arc-20160816;
        b=YELDYgMAUu4xNqNkRu/6TloZy189VvurcqeLwKRTMLNGBQi5rRaXBXW0nyzWtbTy35
         TTOys5eCY3BJCusglXUbazDxFwS7+DxKxNceoyn6ZuDrwRsc390fZ9zS1mw8yqdZz4II
         6gRDb99nqe/nUkaQ6oELF0yvCmtbxxAVIQjAN0KCrp/KEY/SkqJWBjIzsdz/TicYP7r1
         3rLDNxOnutoRuJCBuy+gr8VO1ekZ/J6Tgq/urK2t93WuQAHZlZuVsYpKhq7r6SXukTfG
         hKBOvKbEIDq90l3idLH8hbXVVZ3nKETsRHk+1/y96YhE3Vo893cvtzZcmX8GjuaQBT1A
         P3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O6dkaa6KUnyKjpOeBlod62XP865fcAhsz6ScpfQ42eo=;
        b=p41LiwvlfqmI9Mn3Hp91HMpROjZ8qg3Qp0XlEyqYkUMIYKInoWjfXO8sKxgx4IdGkM
         IHSPxBkFeIeq+NdOpXMdZvj21pXDtWqNXFfXJu+qyXP4cXcfilwrYIoCUk6swOYOJakH
         pgW+ZfSQPJJpptQBH01mROBgMWJrWCcuIfjzL1ahrrIcnpT/YgvBi+uvOtXCbVL8u/7p
         UdI2hPrU5rV3J15qRSf7WF3417Vu4oohs7NMWujHJY20fBuEPNNojTW1tSMEFoVIP8xP
         cU/SQJ5jQyordenDzfNtd4fsl5fM9QIDsJ7RBKh3d4BhA0JY13sOKx3IwdHIkZHvylWK
         HwRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ayY1H5/E";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si5524901ybs.23.2021.02.11.06.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 06:22:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ayY1H5/E";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lACrn-0006tV-Tp
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 09:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl6-0006aJ-Dk
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:52 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkg-00076T-6n
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i9so5908851wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6dkaa6KUnyKjpOeBlod62XP865fcAhsz6ScpfQ42eo=;
 b=ayY1H5/EYzGBhDdS7iXct/vc035qJ/xoOQa75hM+9gcJ1KKL31720poDmACQJN+YTD
 nRyg9t1Ch6ypkqVBKHoWMs0GQcJxMwuy2wcZ4XtoR3ulYJCyX+1aipV5XoL4wDZTSPbL
 Yh2KFABYLcgP9kK2dvrthL27sYtR8wlL9qGlmD3sgSQIAEsrN5noAxouzsXvaYF+uy8e
 eOdOSzPR3cspV1zSPhbmc1wZnZlmnvOjDwPbzVJdEelxLE29FUSDpJrmSL1ehGDnRZWR
 OHVzoRT5RgMYv0XdAseQmmx7ArAWzTvRNWq7a0rOkP4eUDMEWP9NfkZeQUBhnLl63i8j
 2dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O6dkaa6KUnyKjpOeBlod62XP865fcAhsz6ScpfQ42eo=;
 b=QrKbmUE9AXpdYgeO8pdGvCKOY2UAPBRdtAasYbCtYPlbgiiKWfuJsgkti3yej8U5IE
 D0HjbBkErlWxnbzGR4QXQkqwvqRA7JsqbRIPNC+C6P3uOfYx7jXAJrbsAlbTS5SQ1dVT
 wikAXjLsqB8M4wgA4rgfShEvSNdB2sfG1wDPb6HmeJGnpljjYkcYZ8dltVvbS7P9E5A7
 isL5IaS01hyMqqbiQL4qxGsLj/QzES/V1zjPSpEi7Fgx7AYx/XAVy/OsGQgp1H4Zjq1X
 fa9//yRbe2kQeBJ67mUUQx3uh69gxvyKD6fVm+R7lHskkFvaqozOZRssQDZtn3nVCgPl
 Y9fQ==
X-Gm-Message-State: AOAM530Sox8NavsN2RpZjdn1IF0ZDVkTpUcjSoTW6jE8U83NvEOGVEjf
 Ve6v/xULI/tvdrpA3ZWUQSCCaw==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr5294284wmc.107.1613052924219; 
 Thu, 11 Feb 2021 06:15:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 8/9] hw/display/pxa2xx: Apply whitespace-only coding style
 fixes to template header
Date: Thu, 11 Feb 2021 14:15:14 +0000
Message-Id: <20210211141515.8755-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajp//WupT4h9

We're about to move code from the template header into pxa2xx_lcd.c.
Before doing that, make coding style fixes so checkpatch doesn't
complain about the patch which moves the code. This commit is
whitespace changes only:
 * avoid hard-coded tabs
 * fix ident on function prototypes
 * no newline before open brace on array definitions

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/pxa2xx_template.h | 66 +++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/hw/display/pxa2xx_template.h b/hw/display/pxa2xx_template.h
index 1c13d3ac007..d91407592d3 100644
--- a/hw/display/pxa2xx_template.h
+++ b/hw/display/pxa2xx_template.h
@@ -17,20 +17,20 @@
     } while (0)
 
 #ifdef HOST_WORDS_BIGENDIAN
-# define SWAP_WORDS	1
+# define SWAP_WORDS 1
 #endif
 
-#define FN_2(x)		FN(x + 1) FN(x)
-#define FN_4(x)		FN_2(x + 2) FN_2(x)
+#define FN_2(x) FN(x + 1) FN(x)
+#define FN_4(x) FN_2(x + 2) FN_2(x)
 
-static void pxa2xx_draw_line2(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line2(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
 {
     uint32_t *palette = opaque;
     uint32_t data;
     while (width > 0) {
         data = *(uint32_t *) src;
-#define FN(x)		COPY_PIXEL(dest, palette[(data >> ((x) * 2)) & 3]);
+#define FN(x) COPY_PIXEL(dest, palette[(data >> ((x) * 2)) & 3]);
 #ifdef SWAP_WORDS
         FN_4(12)
         FN_4(8)
@@ -48,14 +48,14 @@ static void pxa2xx_draw_line2(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line4(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line4(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
 {
     uint32_t *palette = opaque;
     uint32_t data;
     while (width > 0) {
         data = *(uint32_t *) src;
-#define FN(x)		COPY_PIXEL(dest, palette[(data >> ((x) * 4)) & 0xf]);
+#define FN(x) COPY_PIXEL(dest, palette[(data >> ((x) * 4)) & 0xf]);
 #ifdef SWAP_WORDS
         FN_2(6)
         FN_2(4)
@@ -73,14 +73,14 @@ static void pxa2xx_draw_line4(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line8(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line8(void *opaque, uint8_t *dest, const uint8_t *src,
+                              int width, int deststep)
 {
     uint32_t *palette = opaque;
     uint32_t data;
     while (width > 0) {
         data = *(uint32_t *) src;
-#define FN(x)		COPY_PIXEL(dest, palette[(data >> (x)) & 0xff]);
+#define FN(x) COPY_PIXEL(dest, palette[(data >> (x)) & 0xff]);
 #ifdef SWAP_WORDS
         FN(24)
         FN(16)
@@ -98,8 +98,8 @@ static void pxa2xx_draw_line8(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line16(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line16(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -126,8 +126,8 @@ static void pxa2xx_draw_line16(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line16t(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line16t(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -164,8 +164,8 @@ static void pxa2xx_draw_line16t(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line18(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line18(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -186,8 +186,8 @@ static void pxa2xx_draw_line18(void *opaque,
 }
 
 /* The wicked packed format */
-static void pxa2xx_draw_line18p(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line18p(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
 {
     uint32_t data[3];
     unsigned int r, g, b;
@@ -234,8 +234,8 @@ static void pxa2xx_draw_line18p(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line19(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line19(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -261,8 +261,8 @@ static void pxa2xx_draw_line19(void *opaque,
 }
 
 /* The wicked packed format */
-static void pxa2xx_draw_line19p(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line19p(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
 {
     uint32_t data[3];
     unsigned int r, g, b;
@@ -329,8 +329,8 @@ static void pxa2xx_draw_line19p(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line24(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line24(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -350,8 +350,8 @@ static void pxa2xx_draw_line24(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line24t(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line24t(void *opaque, uint8_t *dest, const uint8_t *src,
+                                int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -376,8 +376,8 @@ static void pxa2xx_draw_line24t(void *opaque,
     }
 }
 
-static void pxa2xx_draw_line25(void *opaque,
-                uint8_t *dest, const uint8_t *src, int width, int deststep)
+static void pxa2xx_draw_line25(void *opaque, uint8_t *dest, const uint8_t *src,
+                               int width, int deststep)
 {
     uint32_t data;
     unsigned int r, g, b;
@@ -403,8 +403,7 @@ static void pxa2xx_draw_line25(void *opaque,
 }
 
 /* Overlay planes disabled, no transparency */
-static drawfn pxa2xx_draw_fn_32[16] =
-{
+static drawfn pxa2xx_draw_fn_32[16] = {
     [0 ... 0xf]       = NULL,
     [pxa_lcdc_2bpp]   = pxa2xx_draw_line2,
     [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
@@ -416,8 +415,7 @@ static drawfn pxa2xx_draw_fn_32[16] =
 };
 
 /* Overlay planes enabled, transparency used */
-static drawfn pxa2xx_draw_fn_32t[16] =
-{
+static drawfn pxa2xx_draw_fn_32t[16] = {
     [0 ... 0xf]       = NULL,
     [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
     [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
-- 
2.20.1

