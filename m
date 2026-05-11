Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ECECD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:04:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRDy-0005MT-FI; Mon, 11 May 2026 10:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRDo-0005I0-2T
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:03:03 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRDm-0006Vp-AD
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:02:59 -0400
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-8b7ec7bedcbso19859886d6.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778508177; x=1779112977; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z0It7ZRSCTmVvD9ADLP48nXZfmNmQA+tr9NQ0jfyGKw=;
 b=o2tTHkfgAYwHIVIfM09K1zno74ald0u0VTcd9cDAvjr5OTgfwGHUJ9+5mNXRgvfClF
 yyNZhAYfcc2qEqcJZ5pEHqmbxxGt1FjUqXhYczP2LF+KIxwGl81O6NQy+8VtYoZIv24e
 QIrSpbu/tIdXRHmFZ2IM0g0KhglGETKsr2EjLE/ODHTdXC/owHAucLzvEuvB0HlmrUuf
 kC36aMeXn6RRXYhpv0A9NBIVqIbmW/bHriwxdylib8XMX2vxkT/jIw7i58GWXFys/2Jr
 7rJEGngsu19cKai3bJ+izt4i8jjqADkEEuw2XSYsM68dFlBSSMWbDga8aozSlQlAAPWw
 NOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778508177; x=1779112977;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z0It7ZRSCTmVvD9ADLP48nXZfmNmQA+tr9NQ0jfyGKw=;
 b=ViixbJqn2zHIDnsXRWqo8UtmEFfKB89YYdUvsfBa1DrbfOAJV/E9slr/Bn1LAqkiVE
 o1315mRUy2Mvk6iv1UcfOW6MVjH2e4+FOg61lrUPD/UH0AURMyqge3DXgPVRhHGvaxMZ
 CbDax9Bwunw4vqvP0s/9R/XlbVWYso1il+6D5FJf7bIzlOTiU6UmCfF5bTRO1Gktvjvd
 S3z3ywvnTZvHJy1ENx6EFDZyPbviMYAP8PP7kzhhS8SUwaovxoMiEM37bywCKRCFxjjp
 H2fdw0kCe3GlGUz9RnA5aQrHE4MSpe/hrJxGQcNCFVc2IiyGQU6jJhS8aqfvUAP0UAO8
 1S2g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8IPaA5y+XCpWFYHO2T/QBCbIQLLG1caBPvPk4BrLpTwNL9iONDI6/p9O9VK+rnXgPz6F//sxMavg==@nongnu.org
X-Gm-Message-State: AOJu0Yxlt8TvE3YXjBT0l/7ezw9E+5MQcmxT91tREwbqLezavcYb6aqE
 lZT62ifdpaS4G3g2psoCbF4uDeixAxXk605gYq4nXEjV7GeWQyxm90BH
X-Gm-Gg: Acq92OEBDWIfOKXH0mGzZRkPR3jsFvEyX9a9ESg45sn7rGf8k3M7ExX2jVMv1p+GMLF
 bbGXnP1fe19DKQFPJhzIAcaWgZ1ELKnur0YUvAuKR2OXVmMs4T1kBZqRwQxiAJLq8Epg5X7KtdJ
 FuzjP7niHlpeuEX+HNoGfu7V6u4bDdb/rgyr9a2ZkOKD/0qR28DNv9cPlIwB9HZzUZ2Rz1g8bg2
 KZU4uPL+UnxxMDgV3ppGJKaQxjXldyT6kG0jLpnjj+zCPoFNn5+n/sEij+4tSGuhmCds9Zyz3YS
 itaP2V+PDg3cyFb/GztNycl5SLi68QEYdtX1esb4mrwcwL3glfRxbX2Yv9ImcIj7oPR4FgAPm3t
 A1+QViVnIUURRkRPQqNwK90uysiNsa2hajWJu44ooR3HGe2v7PFFyfGaBXd90BPGuP5V7KsjOaq
 Sj2tml3K+MvQkabjRK+qRbCwCAykVykDamx3Q3ga5FvWR9amkBGLs=
X-Received: by 2002:a05:6214:2b06:b0:8ae:655f:28a4 with SMTP id
 6a1803df08f44-8bc45c270ffmr360030436d6.40.1778508086545; 
 Mon, 11 May 2026 07:01:26 -0700 (PDT)
Received: from [192.168.1.160] ([2600:4041:54f3:a400:c013:3550:ed5f:a59a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8bf39c7dd09sm94773756d6.31.2026.05.11.07.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 07:01:25 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 11 May 2026 10:01:10 -0400
Subject: [PATCH v6 12/15] target/arm: tag is not a part of PAuth with MTX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-feat-mte4-v6-12-8557cc1313b9@gmail.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778508062; l=3172;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=RY4Y7584EbsvGKO7XdM6s/BdRq7/FYp1wZOaWE4e+g8=;
 b=wDdxEc5bBmuhLGAaiwwac1GCFN6HDD+2N0iVSfXtEx38PtsXzaLwpyewr7ePbIzKf/t+cp+ky
 u6OCE78UDb4Dvd1OGp0hTttbVthDOT4WUdcz2DKnwN1mu+GHkHFuI/Q
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

As described in the section on MTX, tag bits should not be used to store
or compute the PAC when MTX is set. See also Authenticate(),
InsertPAC(), and Strip().

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h        | 12 +++++++++++-
 target/arm/tcg/pauth_helper.c | 18 +++++++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d313d36603..31b7e1c85e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1809,7 +1809,17 @@ static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
     int bot_pac_bit = 64 - param.tsz;
     int top_pac_bit = 64 - 8 * param.tbi;
 
-    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+    uint64_t mask = MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+
+    /*
+     * If mtx is enabled, second nibble is not part of PAC. See
+     * InsertPAC().
+     */
+    if (param.mtx) {
+        mask &= ~MAKE_64BIT_MASK(56, 4);
+    }
+
+    return mask;
 }
 
 /* Add the cpreg definitions for debug related system registers */
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 67c0d59d9e..3d83ca4c3c 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -342,9 +342,16 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     }
 
     /* Build a pointer with known good extension bits.  */
-    top_bit = 64 - 8 * param.tbi;
+    top_bit = 64 - 8 * (param.tbi || param.mtx);
     bot_bit = 64 - param.tsz;
     ext_ptr = deposit64(ptr, bot_bit, top_bit - bot_bit, ext);
+    /*
+     * If mtx is active but not tbi, then the top 4 bits are replaced with the
+     * ext bit, while leaving bits 56-59 alone. See InsertPAC().
+     */
+    if (param.mtx && !param.tbi) {
+        ext_ptr = deposit64(ext_ptr, 60, 4, ext);
+    }
 
     pac = pauth_computepac(env, ext_ptr, modifier, *key);
 
@@ -377,6 +384,11 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     if (param.tbi) {
         ptr &= ~MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1);
         pac &= MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
+    } else if (param.mtx) {
+        ptr &= ~(MAKE_64BIT_MASK(60, 4) |
+                 MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1));
+        pac &= MAKE_64BIT_MASK(60, 4) |
+               MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
     } else {
         ptr &= MAKE_64BIT_MASK(0, bot_bit);
         pac &= ~(MAKE_64BIT_MASK(55, 1) | MAKE_64BIT_MASK(0, bot_bit));
@@ -424,6 +436,10 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     cmp_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit);
     cmp_mask &= ~MAKE_64BIT_MASK(55, 1);
 
+    if (param.mtx) {
+        cmp_mask &= ~MAKE_64BIT_MASK(56, 4);
+    }
+
     if (pauth_feature >= PauthFeat_2) {
         ARMPauthFeature fault_feature =
             is_combined ? PauthFeat_FPACCOMBINED : PauthFeat_FPAC;

-- 
2.54.0


