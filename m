Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA03CD6E56
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:31:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIZ-0007J3-2R; Tue, 02 Jun 2026 23:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIK-0006wA-No
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:28 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcII-0003mt-4k
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:28 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-84275887a3fso84131b3a.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457365; x=1781062165; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TwhrK5xY8MqHIVp+UxD/XyCeJ7xCC3dcRnmxkpZ4IXA=;
 b=ejLNvnxpUXtcBeOWGOzAAPRaefAmQoZBqvQpzE+WNBXNY7quLKmVNcYXoV/5wyyJkz
 4ethaD6AEMzEMAgsIeE9fp+Jd0hYCkRXGsuQVh/c+c8TtTUraM9WI4LEqyiH6+FV6+sF
 548KbtNYb2O3OPHUtImTa1DI+KbLQOERtqZlYooDeIpYk0DD6ZljXm2ai+/saR/GqfmL
 KPkmnv6xkaay8TJfQAXWiCPOUvMV82xj2hv80SmEsT9BQZGe+sLnYGlg4xOwrwSZrhKE
 gbANC7S2k9VeCGz2fSSfBLMtzPE2LD07uDquSidzKA66Sl5XyS9prmU0yG8Mzu4z/sS9
 oX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457365; x=1781062165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TwhrK5xY8MqHIVp+UxD/XyCeJ7xCC3dcRnmxkpZ4IXA=;
 b=LqtMXu4+xUV275P6xNBTRs6/aHqy9EgRUe+HitfjjI5aO1pQKCIuSvTXb6zROTaHXy
 IAJP7W5pTX0AEd9TKt+utn5mB05WnNnX1dz2DsFWraCdTE4+Ty3R+Ej0Q3jxQu/oTE7w
 YjngCyItZJwOJTEbnGKV77p894U34BrJL4Wug8XIUVnZUvNaxoXrfbWObSEy9M+FEsnX
 /CwCreNmV1AHfgJkYMPLsL9EQAnle0NzTulZUSEkLJnhSVptzP4x2ZmewTc8vmZSxArg
 RjTK7nn9jVfAYkxZu9Yb/vcv/6M1t8pD3o6/xZGkdjMgVlyMHofECq5WvxkPVGOxYKho
 DZXQ==
X-Gm-Message-State: AOJu0Yw9KjZR9c8YFAgtfc6GCDXd5/dCgHjH65uQuc+g3aSQkJx9ERL8
 eE2XAEIzJInEczsMo9odpPEX5QgBfWYNjszYoTqe9CgmQVQBL762xozl9uOtPLII2fuzQA4Ma44
 NfqRsyRw=
X-Gm-Gg: Acq92OF06JFNke40fePxgNxC6xrY2LoabVb0CZ/GYBvgFz4VFUx1/RMV7Ak95iGDBNH
 65Q6Z9KjVFEOJl6nzkuG7ktltyhdXl5S3zQBbIjelqxSjhHxXjXp1W0zLIIMqVBOppiTTeVAzk3
 r8v4Rt88io6hNv/OlzIcUIBdPAUVnDFt/hkvkAiUDzuiGrtgm07VzptVxinBYdrFR8X90eBq+I5
 VqjVbbrIktxTMumW8qo6cEzi2hUzVnjDSfea2iqrADQuxNz3dsdr9ZnB3UiLn5/z6vCSzmZb07p
 gZXP6rBatt92zbfkK/77HYaurxOfI5VDNWAysazpSPay2KALOYsmIyAtyGCuit0ZYgJ2avzy+br
 XidSGzB4YkoRT9XG82ZJcNZkZWFPgkplomuQJCdbkF8DKhfZtnTvfLllD+9CZ+cGFqFNO9R0SDi
 +i6UTfGYCLXzRVZHyeSW6qJrBnhuVchyp0od2Vh8I=
X-Received: by 2002:a05:6a00:4c0a:b0:842:68d3:e2ae with SMTP id
 d2e1a72fcca58-84285cbad37mr1084099b3a.15.1780457364652; 
 Tue, 02 Jun 2026 20:29:24 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 39/45] target/arm: Enable FEAT_FP8DOT2,
 FEAT_SSVE_FP8DOT2 for -cpu max
Date: Tue,  2 Jun 2026 20:28:48 -0700
Message-ID: <20260603032855.106930-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 linux-user/aarch64/elfload.c  | 2 ++
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index be33fede6b..d40e39169b 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -228,8 +228,10 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
                                ARM_HWCAP2_A64_F8E5M2);
     GET_FEATURE_ID(aa64_f8fma, ARM_HWCAP2_A64_F8FMA);
     GET_FEATURE_ID(aa64_f8dp4, ARM_HWCAP2_A64_F8DP4);
+    GET_FEATURE_ID(aa64_f8dp2, ARM_HWCAP2_A64_F8DP2);
     GET_FEATURE_ID(aa64_ssve_f8fma, ARM_HWCAP2_A64_SME_SF8FMA);
     GET_FEATURE_ID(aa64_ssve_f8dp4, ARM_HWCAP2_A64_SME_SF8DP4);
+    GET_FEATURE_ID(aa64_ssve_f8dp2, ARM_HWCAP2_A64_SME_SF8DP2);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 1e2d1311b9..893e20f0eb 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1378,6 +1378,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP2, 1);   /* FEAT_SSVE_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
@@ -1398,6 +1399,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8d786f9dae..f1c8f5aa68 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -76,6 +76,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8DOT2 (FP8 2-way dot product to half-precision instructions)
 - FEAT_FP8DOT4 (FP8 4-way dot product to single-precision instructions)
 - FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
@@ -163,6 +164,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8DOT2 (SVE2 FP8 2-way dot product to half-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
-- 
2.43.0


