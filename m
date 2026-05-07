Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EE0CD37AD
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8SC-00087L-DJ; Thu, 07 May 2026 19:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rw-0007Hc-9i
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:12 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rq-000292-U0
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:11 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-404254ffe8aso1234638fac.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197685; x=1778802485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfvM4tnhG/6BVEOEoQSi0TAhQsUGcLPgZYrpPCn+HNY=;
 b=ZYDPOqrtMwV4ZLPLU5jwO5gQ6iyh1AA9BMSbqDPla055JLGQ7tS1LcrBnS/8WycPnE
 f93JSvMHqz5tWf2E1pLSP4OmgVeyPGXMOLORw20oER9ZTCZIbg/wHOdLg/d6OWk1vaKO
 7cy+7fZ/HMZrLSVB+1JOkmbc61o3s2KM0ZP5IogPeMUrWwIHgCJkeW/meTI4oSrPmZFq
 wswyyetXbkdSmQtG1bgr/3hlh9HOeHxixXJ5o9DqQIb9h0RZsGSpOsNRKkAo+zzCM8QG
 fwQHhXB2UzRIeARgGIHm761aYOt4MmAFP8LiVROedRaMjZG3LMHXJ4xo2bDARIYno7wm
 PL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197685; x=1778802485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WfvM4tnhG/6BVEOEoQSi0TAhQsUGcLPgZYrpPCn+HNY=;
 b=er6gFDBX6tIT4h/crcFhAvJiaa5iDN33+9yLapAUGDFFgB5Ki67Z09RUCo9/huc0Hx
 CfUJZnsB9YLi/nLKimXltmgUADQU6z9WStPAnjTWWZ7QuLZtHLrCfmgCh11SPPazq1dd
 kRVv0jK7NkL3R8M/0//vSqRtf3pUk7g/Lm+7ykTHxvFQHWGYmrFzJhiU4NntypRLy1XF
 k8UUDFvBwUiEFGa2Llf4phPD4xGajaAL/dypwIMCKtjaBPtk7xlv2u87fRNYQKvwZz92
 0H7sy3j39+ifC1cwJ/oX0lKe19y1BzUXorm3Q9p3NGVhD+nuTwGhvkTn1GQZDLS8+T9j
 +G2A==
X-Gm-Message-State: AOJu0YzkCrc1tyn8uc0m5nvZj0ytfmAp12Z7qx452/dLW+N/zfyKJ/F7
 FBt6goD5IedDUXosj5YRpqk6eALy8D8wPHsNtDsBv+p+9tN31Zmg2wmOCebX0oB0BVN5MvVADfy
 savwA
X-Gm-Gg: AeBDiev8snCJYwHeInbIoVWCwaIoq0r61yBLome30x1e2oceDx9ynJ5e1jcuKHilYbi
 hZf/tOI0xwi/4PQjqkvo381YxSF5vHkruaLw7EYLoQw/aGd2Xj2WX3MRNj4CumyIqZo9W1PX+sc
 WYw96M8R1yC1XONZBe6ZMO/4qfT3EtrfFEoQ2IyxlLHbbeiTDmGwQjjp1qQWyfy6lfFwyoNS/or
 Z5wRZFV0BxOSVK1MCiMsleDdW5h/3Tf5OPlh/mjX+zLKsqvjozCRilaQAU3Cm5fBCuAhrRj4aRw
 0Y1EpQrKOlRRq4OZUlILKIcBW3/vOXr932ek7sw01oB4go/B8VvqJ1mWg5cnIJQtnfF0/XbFnzB
 wZhFa6okjRXaG6WWMBNnLipnsP1Z/PhL+WjzMcj+Rn9oXQTxBvCfJjiIQaUF0lj3tL2yZLIMaeV
 2sVE9UOtAbYK0gDNXzKoL917JM1aDY/CA6iDE8jzQuzLBwyQ==
X-Received: by 2002:a05:6870:8256:b0:423:1cc1:f878 with SMTP id
 586e51a60fabf-43526b03e9bmr2820957fac.29.1778197685231; 
 Thu, 07 May 2026 16:48:05 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:48:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 51/60] target/arm: Enable FEAT_FP8DOT4,
 FEAT_SSVE_FP8DOT4 for -cpu max
Date: Thu,  7 May 2026 18:44:04 -0500
Message-ID: <20260507234413.643512-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 93cd7ee1a6..6dec7e045d 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1377,6 +1377,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, BI32I32, 1);  /* FEAT_SME2 */
@@ -1396,6 +1397,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
     SET_IDREG(isar, ID_AA64FPFR0, t);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index a6b48f9c60..bee4e36dc6 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8DOT4 (FP8 4-way dot product to single-precision instructions)
 - FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
@@ -160,6 +161,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
-- 
2.43.0


