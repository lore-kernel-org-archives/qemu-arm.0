Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B494CD37A7
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8S6-0007l5-0y; Thu, 07 May 2026 19:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rv-0007Gv-Be
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:12 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Ro-00028M-2R
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:08 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-42321c8b8f5so1138326fac.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197682; x=1778802482; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnvL1dEdpYA1y9JJcxfkHku7n0bLCdQETh28Vu/3wxA=;
 b=BAjL1TASmH7FLn/vIBELkWBlrPlG1FAl19rg5Qyb1yV48fFzBmJnJwyV//SWLMjj37
 OAVyr3arnkmcWHFIPMDCumcDwefdQsnEIXH86/zxxjk3fgp1fbZWXCiekFUG9By2LL8h
 28OmkAJRJkjAyVoeF4zlNl+4IkszkMNvbdhrBk5jcLcbYxNduAf2RSxvcDqEfI/8jDti
 MpxNT3o7XJL2WI4GqflbVd3dU9go4QUyPHOK6uusqt+1KZq91AB/3qPxhY2MDcaVipv3
 QlihWaVpQtr/TwIuEN4MmMq0eFMKajo5cqD29+ZvO1t8VQCmos/y/uYM5zfzbp88zTiK
 9mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197682; x=1778802482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xnvL1dEdpYA1y9JJcxfkHku7n0bLCdQETh28Vu/3wxA=;
 b=hhyXMsSlwtcW6xqdNCvJoPzsMkXfarYMrv9w6rTz2u90dOUnHJKAHrOjRdadDZyN9t
 CrA5SpWUxqTPvp/cCGX/BPifb4gjvDrgCyth6ObbsnY4HUopPS8wNrXhcB1jxL0o9zUw
 OUCQ+wnRCDOfx+KXpeCIwF6eJGBxli1NS8bs2DcS7lYNnYG0wBKgO8h+AW8notM/dOPV
 VFKx+HM7PpB8qRzqM5wF82Er74p6QuZzIvV8IVwCZN1NO1KtR5PU7UJ0/nfaxLRReltj
 wUKiSLPBYNF1G1HIAJc4uziDYO2QkXusa7Q1y/6D3oMi0+0EcVnR5kaeQUZnClLCct2K
 FbfA==
X-Gm-Message-State: AOJu0YyomymqXnQa/McQb/uizz3GGmgaY5bJrZRtNuizcIa06rbcAO10
 +wRAMKIHsbCXDN9RsBWpszluTMr3JtzHS3nBjSwMKJ7ToO2NG36XtYlEI1jBraT5Ge4XJLs/hHs
 7Oosa
X-Gm-Gg: Acq92OEKz9uYC2Kuu4UjJdFCmqEtHGyYOoqHRKV8RWhuExoGzhyHHivkDw3y4Xne/b3
 7mWaQ1dllgqb3x5a0KjOLzJS+cl4cYvGC6wmH2h7ukdX7gldC7bXCq15dcIFqaJWpM88Wdn5IaC
 jJESFvNZj6Oq2mA7NLQw9JpDVHnZ3M8wwHFZNXuXWsmieF5iXmVIJ7OLOLN/+Su50QhL76DwX28
 VZCaOTEqiK8Gi5esP/p5zNKxoGWlcdfP4yr1g1L2sL9mMrkq8eWmzPgk4QEbTmcFBeeZIf/D3Rj
 b3I3/KDNf8DddJUw0eZZoUP7Y347cPV4oMcV7EoOW5R9qaQoIsl8qs0XSQrNCUAiD73ohD35rOy
 kcgtnEDXAtS+yY7RdrAPjEwB+C2NNiw3OkJYCeAfPGRvwYz+H1StkTjv2oGzJP9JM+lKRhiKUvG
 U9ry7szE6cvGItgWVLlviygkVwREfLLCAIq4ssC7NeldEFMPgT5nU2/yLO
X-Received: by 2002:a05:6870:d0c5:b0:430:17bc:5e37 with SMTP id
 586e51a60fabf-435269bfc07mr3017094fac.14.1778197682021; 
 Thu, 07 May 2026 16:48:02 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:48:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 48/60] target/arm: Enable FEAT_FP8FMA,
 FEAT_SSVE_FP8FMA for -cpu max
Date: Thu,  7 May 2026 18:44:01 -0500
Message-ID: <20260507234413.643512-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 90214a355a..93cd7ee1a6 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1377,6 +1377,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, BI32I32, 1);  /* FEAT_SME2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
@@ -1395,6 +1396,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
     SET_IDREG(isar, ID_AA64FPFR0, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0dd6b554a0..a6b48f9c60 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
@@ -159,6 +160,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
-- 
2.43.0


