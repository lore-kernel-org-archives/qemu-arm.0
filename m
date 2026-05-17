Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05842CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPT0-0001vX-PP; Sat, 16 May 2026 20:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSL-0007Bm-4o
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:12 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSG-0006tN-4z
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:07 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-36643b96b99so1022109a91.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978042; x=1779582842; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oa3HEHnmujGMzO7KfPn4oNwAR87TmXmXSZa7aCzJKgA=;
 b=W1/tAeE4c5y4HzheFwKIJwayffdMWPWLD5C3cybF0cINmIYnZWewXQHMNKfv+7s6qM
 7cT+U7cKLC3aus3yRrKqrujFYogdshMbQBXERNOweqDDn3tlIc4iaPNLsbqfiFM2O1HI
 55tkKtgm8ZS+65PkRrLsvMP3WG4QJeie34dh+upDgvI6v3NhASQ6jzsraH13XFczlcW0
 na99JEbkGT920ub+GZwOlUgobcHZT9IVfjA9DNJxZNzv/59VUZbdNYO9730XiAxwHKsF
 2MvadSicZ9Cdfl8hH8zpH+5QU2GwnEJhnfDpOga3P8GhKULWfw1QoOYXmwCp51PiZFSu
 JiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978042; x=1779582842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oa3HEHnmujGMzO7KfPn4oNwAR87TmXmXSZa7aCzJKgA=;
 b=P+YUYuwhmPUWmza7UX76VBFt/I8kMZNGQA4/yQjOeidkdH1mMda4Lc4dnBHPA/Lptd
 Zk4uy/UXk+AAZOuMC5lA0vxeR2r+DmR/1elyWLwS+UJMWIHb8whMqr7xZrM85t9XcoEJ
 +gpklAifF1394UxiaKuSnwQz84ZntQ/rkcmEOUkf9IumbtzCi6IKY7BANnT74teQVhTR
 VnCWH1gWNGfuOkpA7+MMTvhGqNYmcrRnu/WFakxwfvmIF2TVHiTWYu2Hg6r8PkUHZ7hT
 P+IxkGt7+c75QcCdka+Xh1biiol//sYw9wcox/+P4iWhCzWorZTPT1mbG+NNOO6FsfTg
 sS9Q==
X-Gm-Message-State: AOJu0Yz5JKCLlinugEyrzz42S8gd+++WELGLKlLq/tO3zh7PqXzMBGp2
 nIHdjyTgu/+Wpt1I0saD4pIcPEyjI5Wc0p5SYeFvw+3lFNFioYldjejSWqvo1qmIUsheLT2gEyg
 YoRza
X-Gm-Gg: Acq92OHjVggX/BL3YGrBnCCSYuFewFU8exJ5OGBtpGWOA8BW5ubkQXXDp4VZuolyda+
 Cz8Sw7MEqnUrki+XnuPYwW/EtNjpCcoN+fsSByR1tmPuXX915zF7dcuPPj3Xp00ts8ClXM9O1+a
 XNTFqsWGAjau8u40alAibf8x00g/41HXB+oPz4UNu4mkA1pkAMV73RF74ls2wG94Z5IqKKodJVx
 sbNDrE2xrNQOC/hPsk3YqVnbsVhvYiyvwL0D8qyJUHQhwhVZ6ALkQjkG0VmPB+frI5KOdonHstV
 xiHW9GUk9pTnyZfyjh/jRCUUX28jSOLAfTdsV+IhOPfG23p5ceqMzoV9ek5HLs2hcPr0V2mMs9V
 lSHxaX+eBIp4AZe1Mt6v4N7A12VlNDnB+GDa7KHacsoInZs3fFgI77OJQdWKSqrycDpHuExMkVB
 TNFTa5Wt9Vi1RyejazsRKvIEo0A+/q75OKvtgSTQU=
X-Received: by 2002:a05:6a20:7294:b0:398:9d5f:e093 with SMTP id
 adf61e73a8af0-3b22e75954bmr10779513637.19.1778978041677; 
 Sat, 16 May 2026 17:34:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:34:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 61/63] target/arm: Enable FEAT_F8F16MM for -cpu max
Date: Sat, 16 May 2026 17:30:00 -0700
Message-ID: <20260517003002.321430-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 7a47af9f5a..492f70fc8d 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1398,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8MM4, 1);    /* FEAT_F8F16MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8MM8, 1);    /* FEAT_F8F32MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83967da12d..2580246a1d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -66,6 +66,7 @@ the following architecture extensions:
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
+- FEAT_F8F16MM (8-bit floating-point matrix multiply-accumulate to half-precision)
 - FEAT_F8F32MM (8-bit floating-point matrix multiply-accumulate to single-precision)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
-- 
2.43.0


