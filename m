Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACDDCD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:28:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPldG-0006Ig-Ig; Wed, 20 May 2026 14:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcN-0004Jq-1p
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:08 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcI-0002C0-Kx
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2bd2c147abaso31125175ad.3
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301558; x=1779906358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PuGasVrTDp5bV7ix67mPvlZpXL4SBKk180Og/sZBgEE=;
 b=ikCmdbvPpacFphfOKz2IfMFxCnwBgIB3O231WWkg2xclCdOHl9Clj1bE1T6mqUnHV7
 U05kR3Sv8g3rts+jehi8ZDZnz8zsoRpaQnTIjOfC/uAWHRG+3V0JJOfpsenZ4yVv/cg0
 X20Lx8Dh5672Iuv9LkLenADm4Y8AU1gfy/+Xfzl7nShzHly+VWcUG4zU3Gcm9TN6ae4h
 vAkPOTm3Iaszt9wezvqRHHi47y1iZPRCUEYC2ky4tSFYn8sbe6q8ShZLTPmUS56Hasbn
 o2AHOmHsaCEhZWNysCW/0REFFP++oPDsbSV45IG6fmX810xGsxLsLix3NOytR+4Kyagf
 BH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301558; x=1779906358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PuGasVrTDp5bV7ix67mPvlZpXL4SBKk180Og/sZBgEE=;
 b=WrIAcF2fjRCsKqfhZl4hxChaMwNz8x7Wln3Utku28esCjPJkhpT3sv050Yj+XExbW1
 F91Zz00KtednxfPJmfgd49xOrdohd8K3yh7LlX0DS8KC78gup2g/HWhvlj1lJxuAIq/N
 Norm7kLv6e0hE2J1LNuWN2LhT1UTauzKfb5BEgq9tqNpT4GGy1z9MG5hAWDTQwItymV2
 UIeIlDXgRmAuMODJue4mEWncdSLaY05kAsMEtWZylhl9EyngDKS4SOP/LBdMNjKoelyc
 KZHbk7fdYLkWMZEKp+Q8f8B9HN89tyY8PxWOB7plQ7zIVSDVzWyKfHiza5WSwlmloOJZ
 15Qg==
X-Gm-Message-State: AOJu0Yxtt/mrtPKzNaZXWxM1R85OwgTnOn2p2cmbiWDU9M2zAje1Bnug
 M+meKfeW8YYfIfvmVvY5lqNBMx3FLgsHvG25chXeas5m4xL+oHGAWxt203oopt5vRtXj13kD8DN
 w095rwL4=
X-Gm-Gg: Acq92OEdzof+J68AHsWg/Vynay7czai3df8TjazW4TCpNq3y7OtQFc72accWq7wAVOz
 X8uj5U7+Voz4RZfhRcR/lplUstS2BxCGQhdSuRGa2pTgQZY9Xvlxgg1vbaLC5XWRrzqXXKqazlK
 /4lUoKn1/71ylM+zWasAKMsecFVkUqTYYGUuUvQS+LYU8TYw0cmpswhOBk4N6n/WhcpLmYHde1W
 gXoFqFrqjPzlZqxxZdK90xOzJ89CihlfgNiDS2MsPjk7vctFGXdhuRtsbnXzhs1Cqhp4Y4gmuJ2
 qXDziDFzzlIzVwtl4RvID+Z6QgnV07AJdpZJHjGSVkiF5eHwQyLTxoMsTXEgbwuLLAk9Hcm+KES
 pbZEGSYNA0ULcwk1RCSvOrFerQ26fKB/w35012F0+oxMCiqpb02tHIeFo5F9VDmiDOy+AgypPx3
 jruxcuX5i6MkF43JoICI0zw5KDugwE
X-Received: by 2002:a17:902:d2c9:b0:2bd:b50f:c1bf with SMTP id
 d9443c01a7336-2bdb50fc703mr189938475ad.38.1779301558341; 
 Wed, 20 May 2026 11:25:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 59/64] target/arm: Enable FEAT_F8F32MM for -cpu max
Date: Wed, 20 May 2026 11:22:08 -0700
Message-ID: <20260520182213.872945-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a43b6367a4..7a47af9f5a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1398,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8MM8, 1);    /* FEAT_F8F32MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 875716d18f..83967da12d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -66,6 +66,7 @@ the following architecture extensions:
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
+- FEAT_F8F32MM (8-bit floating-point matrix multiply-accumulate to single-precision)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
 - FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
-- 
2.43.0


