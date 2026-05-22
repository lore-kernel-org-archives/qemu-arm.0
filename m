Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F36CD5BB3
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:11:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2Q-0000zX-Pf; Fri, 22 May 2026 18:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1W-0006sT-59
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1K-0002qe-K3
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:13 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2bdeed4f717so38753745ad.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487622; x=1780092422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeprYmNv0oPRh8wAhRuE+DLu92G/3KJF89zekXQItmA=;
 b=dMOqWhefpqDcB/B8zw6JzI8wKJaRrTI+5H4VMPsO9vgRPXAK4QYeys8YjEKm+Ys5MO
 TPSk4Z+AQzX+alwfqdCVGyFUt6vyTtD3I3znF1cme30vKytPNzODz/LqUq8AZ6rk3/tz
 ourVRbRdz9Px/Ww2XIasOK2EZGT15wqnNlhxVCGQCZKV/Qm+6NsRjUsEp+/vhmi6vNme
 Ht4Q9EUUbpKfqfqLeExGxu7+goc+tTf5TIGuyeiIijAtbyxNkHYL+ptTtWctJDAuqf0Q
 yqYAS715spTNOoyaMeAL5rjg3nUhcS+9bzMmJHyrFbHNW0vlGX3xLVFStVNHMGmTAyMN
 LVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487622; x=1780092422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AeprYmNv0oPRh8wAhRuE+DLu92G/3KJF89zekXQItmA=;
 b=CsdKGFOFZADXWLT01rwDS7posqPOyTGICLBMgWlhkJFBRNMXrHC4DF+lvELVbWM3YI
 BKN/l8M221cby6Qp3wuJOdDw3tezAk8b7k5t50SIjkMQS0swubanqWM1gvtHgrQ/9giT
 FHjl10CBp5maBUz/+VY7Pm3yL0PF3rECy2yNGKONfRPWNG6n6bSlB63XgBCh72bmKCPS
 OapwKhpv9FXsVvQDk4dlg/2i/i/INOE1kVx3zHgjW0BlfUTguL6SEaIYzUy1mv6jMzGM
 +XJEDzqpE6rdoJx4yQBXaot71jGiU+g/Vc8MCceW6eAm3Hcjw5vwipu/DN3TeKiU9Zsf
 /T2A==
X-Gm-Message-State: AOJu0Yz/XqB8WZEeYquhXU/Nv/tCo0JgljH/o5Kt+E5DwDB+YPA26uRh
 4atL1aP/2R5RJMbdeKiOCGf10SFvTkeZeGdnVUQmiEnpuQiBCPYpsgMI3YxOyQbkMY0QFsgpCDU
 vacUZ
X-Gm-Gg: Acq92OFAwdiXJmxWfQHFtf/5MQ1BEesB3wUlheZabYrqwbVE2KXRUrIfeSMxRWDCqW/
 jhtkIcvcOyJPn7wXZVBusFTAgyka42mCDzPXcbPOomkuJHQ7rvdA26yruFFbA3wrPcenxn+dP8J
 w6Sod1UnKgnP68F6D3xSPe3/p6KAT8ppswlqEP9RKsIXqXePTABpVKUiJ1yrLyFxWge0cAl+VAc
 K5wMEYhlJQqvTVBjD2kXwRkQzKYQVoJAJn9fGOg4YhdvilLGNwD4/jDEeL5GR0FsADRq2fgTbd2
 w/16/v0r7S0ybuueUeMV4lyXcpc7VXvYVA3OUq4/yCgsK0olh/RgUZE0sY9Pf75KEqMfO0m0elh
 MReiYCENBFZGb81+hoBfESTTxMGi+NMd17z4M5JlY7vImuEG2NTGPFo14ekLDAY545U66MIF8Gj
 4yN2Y+il2VbX4c1GuIpi4LWnUOofv9
X-Received: by 2002:a17:903:1a2f:b0:2ba:7749:f89a with SMTP id
 d9443c01a7336-2beb035c500mr55359015ad.11.1779487622005; 
 Fri, 22 May 2026 15:07:02 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:07:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 58/64] target/arm: Enable FEAT_FP8DOT2,
 FEAT_SSVE_FP8DOT2 for -cpu max
Date: Fri, 22 May 2026 15:03:00 -0700
Message-ID: <20260522220306.235200-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
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
 linux-user/aarch64/elfload.c  | 2 ++
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index eb3db355f0..c9ab26b2f5 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -227,8 +227,10 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
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
index 6dec7e045d..a43b6367a4 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1377,6 +1377,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP2, 1);   /* FEAT_SSVE_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
@@ -1397,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 31f637fb1b..91e66096ca 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8DOT2 (FP8 2-way dot product to half-precision instructions)
 - FEAT_FP8DOT4 (FP8 4-way dot product to single-precision instructions)
 - FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
@@ -161,6 +162,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8DOT2 (SVE2 FP8 2-way dot product to half-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
-- 
2.43.0


