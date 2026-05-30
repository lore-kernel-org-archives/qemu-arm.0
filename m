Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D769ACD4F54
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:21:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSre-0000X0-CV; Sat, 30 May 2026 19:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrb-0000Ud-Qd
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:13:07 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSra-0007eL-4O
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:13:07 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-36d98c9b596so94206a91.3
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182785; x=1780787585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/P/bsLRa8Km1ZFwwN9fhqKy4ONbgc9/cxj6UUIH6cY=;
 b=CVZxLvi4Tsh6Ef1lSfFFuNqyGzP2qhAQBiBeGROnV05iU8xnO9aiS4RAQ9y5Dnzb7C
 OoOTY3KWmHfCXcWBZO5FUyqnRewM7oTJqoIq5wDJ86XzpnBfEg52B4s1zP/+lR16d1R6
 zdDK4Aq8Vx373V0r5BjJH0jePRHxemP7rKwjEI9Si+aEV54ugKqazFgLrFDtXRb8s5/b
 P4m4k4HE498Z0AaHXZ8olCUN86h9WOkZH3GJ2B5BuACpqzoyr/Q6Qzb2AmyfsuRKuJLc
 LuOg/r/lMf3/p+UCC3iMqU/qgUUOns0K3gXT8M703/HRgZXtZ/KZBuXUvLNdNzxYXlV8
 Ztmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182785; x=1780787585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P/P/bsLRa8Km1ZFwwN9fhqKy4ONbgc9/cxj6UUIH6cY=;
 b=faBua4dksIgyGo+yWvC1oxXo7ZYULEnNGKuS++SkbR2bBIZNDMNNdAd1LPIbbsKghj
 gPFUANHpRXUI1X2ua7RU/DGyJfhH4/8HE/1enAI2N4mbCVr4nNDMo2G/jxSV4JenQjd6
 K0JYvuPack+1e5PUsAW7nAHRJeYo0n0gc+h1/XUovxwaA+eJhQHHKoGURcQnJ+on6a1q
 J0sj2GwdbDITtg5UJL/1nLywoIvGSF0HbXnix0D4w3f6COeLmhWfL47dUA2yTIj2WDZ9
 UEeda76uXyPzItcCGe93EeavD16K5QFMFBSygLtX+4kXVzBV+im3zD9wRCFA+cABAub5
 cCOg==
X-Gm-Message-State: AOJu0YxtYbPVW+77BulsE2+ayQ8Dmz75Pp1qN/2Yy8GaXxrNhsr1V5DA
 573A+GJKYiRzyPTy2+N4uASpY7rgl9cXAeN4KLGumyIGYxlD6XhxLXGP9cU6YQoiQVSDQi6qp4X
 4d2XlpK0=
X-Gm-Gg: Acq92OHL5mAOrvHLjO9NFHTri5jo6v+RIY9kXo8vqwOdnUu81RbI5QW4+zouAFzReSH
 Ip4FWa4j7AQis2o9ocH0Bpcb0BRFYeWiCveUU0x1cEpKcdmuzkwkiQozRUSKSSfHNugAtGvEhFy
 lJWQJsGiY0Xs8nMg0PWURpbFKSSofLPlS2gsXZ7a9u6g/fVDKyYpf8Jvfr+Zsk10KvgJWbm9Mjl
 mpA6MWwtlz4cmjOYJHLD2alCkZf9gdFKWd6n9TPi4ZMeUTJ/romzQU8jCsZL8A679TmDa+QOgiR
 Z4EVvPFOQ4++fP+T5OWsAhFlyGRTx529AHq+tYqiFwgBviULJk44sSrzopun4b3n5jJD3Ynnag/
 6Z9t7L6mtWVN7E4cT5RDt3luF3TSP8EZJ7AklCFmte0hjjEV/9OdLni4Ln7wVzzXLXHeas18/WX
 YquYdzjLAd6bv0Je4k2NdasXdkxcC4WXL/Q68I0PI=
X-Received: by 2002:a05:6a20:2d13:b0:3aa:f9cb:d43e with SMTP id
 adf61e73a8af0-3b427eb2dfdmr5399873637.18.1780182784666; 
 Sat, 30 May 2026 16:13:04 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:13:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 38/41] target/arm: Enable FEAT_F8F32MM for -cpu max
Date: Sat, 30 May 2026 16:12:26 -0700
Message-ID: <20260530231229.400441-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index d40e39169b..7864765ba0 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -171,6 +171,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
     GET_FEATURE_ID(aa64_gcs, ARM_HWCAP_A64_GCS);
     GET_FEATURE_ID(aa64_cmpbr, ARM_HWCAP_A64_CMPBR);
+    GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 893e20f0eb..15dafb9aee 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1399,6 +1399,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8MM8, 1);    /* FEAT_F8F32MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f1c8f5aa68..dcfb4f2073 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -67,6 +67,7 @@ the following architecture extensions:
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
+- FEAT_F8F32MM (8-bit floating-point matrix multiply-accumulate to single-precision)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
 - FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
-- 
2.43.0


