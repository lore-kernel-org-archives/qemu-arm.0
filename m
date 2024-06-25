Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp584797njc;
        Mon, 24 Jun 2024 22:09:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3GaF3ciK3N2qiQPonCjyHWnJtFcjk4sOTwZg98Y89Xf9lbPun22jWzte+aTxiKe9YeuJR9gzQBAXAh/MuLuFMxlEyxL2l
X-Google-Smtp-Source: AGHT+IG7G35gFnHKnVeMQVzHYTQNOsGRg7s/4LdyDcjM4Huv2iz7sC/CSta1A9GZpHTrFjhmUq9y
X-Received: by 2002:ac8:57cf:0:b0:444:a849:6500 with SMTP id d75a77b69052e-444d65d1337mr82874961cf.67.1719292141380;
        Mon, 24 Jun 2024 22:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719292141; cv=none;
        d=google.com; s=arc-20160816;
        b=RTuG4m2ULqJveUGDqfPCtJHZMTN4LEI9/v+2cAYSC1jjCi+luVxYVy1WiJ7dWmxNt0
         rgMVgjDw2pEXTXSJC/C8ZNuEIqKJQDkU8AJ8gXvjJujaki1Sx+VJ0H+rT6XtpC/QnkQ1
         rFt65NNPgWgPi6G/52A41qnBEGRXhWRA87RDkLw0BLQuZu3TcqmTDDffOrwj7NqlxfiV
         GfUg1Q9aM+I2+cdBb3Vbj/0sU6xqjwqzDDJC9psnQydwuIKfmyqWianlFbrEZf/XwWN5
         Nz3onfHCKhcDG2j43mb4m+DAEpYcGGMIzBjdi5OiPV0Chyf65aE4UDqNXiOrLUuaDCk3
         +qGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/Pg6/3MNS2vx+BkKofM6RgZsGJ5t7KT/lobWOjzWfJo=;
        fh=quVKJN+JogokNzsp4kwoA7mheGRSBID5PxcC4hooSO8=;
        b=WuuQRgV4rbuE/d73kvnvIMG6S8GxXQIrNZu1JnyjfX/AaX7S9W8XRzJ7vAFae/uAaF
         xUGUBJFhilQJt7Bynzj5hNZlTc8z4DjDOSy8Y+l+/NKcXm+QSHbHkvnFa2Xxwk7AhUTY
         JcERY3kS8lpDOQixH/yCdvd8VoKaLVIbjzwJOGKwfxV7ktZoG4UNZp9pg36KCST5jvpY
         1eDfiraqAq7X/FnkbWX6gZ2cQwvvaUgfBtonrcWQgUa5fp3knhFjLyLM2gQcxRy+7ZCH
         Jg4lAmboZj0EWRXB7+rzUXSMlS+YdDOeHvfxyJtyPmS1ORo+GGbPkH24JzFDeb/OYNmV
         q9hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qjo/tohw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c65b32si97181331cf.614.2024.06.24.22.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 22:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qjo/tohw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLyPm-00014T-FF; Tue, 25 Jun 2024 01:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPi-00012P-Oy
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 01:08:19 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPg-0001Vt-Ro
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 01:08:18 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f44b45d6abso39664085ad.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 22:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719292095; x=1719896895; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Pg6/3MNS2vx+BkKofM6RgZsGJ5t7KT/lobWOjzWfJo=;
 b=qjo/tohw2kgcn4zqsCgSb0Q+qmDoeH1H0z4kjLMW6QZ/6SQh7OBk/aFg1E5+S2wycL
 BZ/pFyxBEtwTF7itIBopr80LefytEyhIra5QcsFMqenX9hZaG1X6HqeKvWRLNYfOExq7
 L8Xw8QhQC+BgZ9JyJFpdD1TCOKNqCv9ctj5MKskH0oiefNX7lbksKWoNUnXl6BoKnEYc
 WzC/M86jOzBC46cG+dP/xjiUgLkqDMNVtc+Fac+18K92brVCre9KxBvQcVrqNiWaattw
 S9C5LErSXHFo1FIuVDTVrqN6jL+fdmJxgWDPbfQcAoonPca/YjkxGUNHOR3OytPd7Doz
 zvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719292095; x=1719896895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Pg6/3MNS2vx+BkKofM6RgZsGJ5t7KT/lobWOjzWfJo=;
 b=A+NROZN3nLmgvLLlc2J4RuK7uw5UAaX7va2yObXOwncndrt/+LVH7NXxzN7fPsGg1Y
 hrcnzjYBBU0okzzJ0h6iDwFKX5hVCJ/w6GWCarzvIq/WxgH5/bvS+5FYpAwrzdydgbQZ
 9CtgSr7rIehJzL38QJ09ILeMgsOpQqaLUTeaAX+gblB1z5fCeW1opb8pq0xTKVWyQ9+e
 zFlP4aYJKQ6br9IVhjtbEERoK4pnTr2UkCalHDOG14ZpZRb8xdc5NTM+nXD8gdldhD4k
 pJ8O9ZGu9Pfc+y6DjHKtel0Urff7UAtsBTTsh+M/j5qgaNObRK7A98ujvWC1WBwhBleb
 prEg==
X-Gm-Message-State: AOJu0YzXq84xrlrttTsdwGP9o+jqPMgKJx9l9sUcGDkhzyBBZwyB1jzL
 EgyaZszG9XAJgbaiv4EqgznV5XX0LUf94+3egz6LUV8nIC1r2JTsfjWpAG94HlSWF1c10YqaIID
 o
X-Received: by 2002:a17:902:cecc:b0:1f9:d99f:61ab with SMTP id
 d9443c01a7336-1fa1d685713mr71326665ad.62.1719292095275; 
 Mon, 24 Jun 2024 22:08:15 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbc72e9sm70843865ad.296.2024.06.24.22.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 22:08:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH 03/13] target/arm: Fix FJCVTZS vs flush-to-zero
Date: Mon, 24 Jun 2024 22:08:00 -0700
Message-Id: <20240625050810.1475643-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625050810.1475643-1-richard.henderson@linaro.org>
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m69nF6m5wif8

Input denormals cause the Javascript inexact bit
(output to Z) to be set.

Cc: qemu-stable@nongnu.org
Fixes: 6c1f6f2733a ("target/arm: Implement ARMv8.3-JSConv")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2375
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c           | 18 +++++++++---------
 tests/tcg/aarch64/test-2375.c     | 20 ++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  3 ++-
 3 files changed, 31 insertions(+), 10 deletions(-)
 create mode 100644 tests/tcg/aarch64/test-2375.c

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index ce26b8a71a..50d7042fa9 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1091,8 +1091,8 @@ const FloatRoundMode arm_rmode_to_sf_map[] = {
 uint64_t HELPER(fjcvtzs)(float64 value, void *vstatus)
 {
     float_status *status = vstatus;
-    uint32_t inexact, frac;
-    uint32_t e_old, e_new;
+    uint32_t frac, e_old, e_new;
+    bool inexact;
 
     e_old = get_float_exception_flags(status);
     set_float_exception_flags(0, status);
@@ -1100,13 +1100,13 @@ uint64_t HELPER(fjcvtzs)(float64 value, void *vstatus)
     e_new = get_float_exception_flags(status);
     set_float_exception_flags(e_old | e_new, status);
 
-    if (value == float64_chs(float64_zero)) {
-        /* While not inexact for IEEE FP, -0.0 is inexact for JavaScript. */
-        inexact = 1;
-    } else {
-        /* Normal inexact or overflow or NaN */
-        inexact = e_new & (float_flag_inexact | float_flag_invalid);
-    }
+    /* Normal inexact, denormal with flush-to-zero, or overflow or NaN */
+    inexact = e_new & (float_flag_inexact |
+                       float_flag_input_denormal |
+                       float_flag_invalid);
+
+    /* While not inexact for IEEE FP, -0.0 is inexact for JavaScript. */
+    inexact |= value == float64_chs(float64_zero);
 
     /* Pack the result and the env->ZF representation of Z together.  */
     return deposit64(frac, 32, 32, inexact);
diff --git a/tests/tcg/aarch64/test-2375.c b/tests/tcg/aarch64/test-2375.c
new file mode 100644
index 0000000000..f83af8b3ea
--- /dev/null
+++ b/tests/tcg/aarch64/test-2375.c
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* See https://gitlab.com/qemu-project/qemu/-/issues/2375 */
+
+#include <assert.h>
+
+int main()
+{
+   int r, z;
+
+   asm("msr fpcr, %2\n\t"
+       "fjcvtzs %w0, %d3\n\t"
+       "cset %1, eq"
+       : "=r"(r), "=r"(z)
+       : "r"(0x01000000L),	/* FZ = 1 */
+         "w"(0xfcff00L));       /* denormal */
+
+    assert(r == 0);
+    assert(z == 0);
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 70d728ae9a..4ecbca6a41 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -41,8 +41,9 @@ endif
 
 # Pauth Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
-AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
+AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5 test-2375
 pauth-%: CFLAGS += -march=armv8.3-a
+test-2375: CFLAGS += -march=armv8.3-a
 run-pauth-1: QEMU_OPTS += -cpu max
 run-pauth-2: QEMU_OPTS += -cpu max
 # Choose a cpu with FEAT_Pauth but without FEAT_FPAC for pauth-[45].
-- 
2.34.1

