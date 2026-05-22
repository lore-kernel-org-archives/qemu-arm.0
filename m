Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ADFCD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:12:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2I-0008Jn-E4; Fri, 22 May 2026 18:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1K-0006no-Tf
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:13 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1C-0002fK-V3
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2bd2c147abaso47543525ad.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487617; x=1780092417; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HSbz0rz1Vzev+MKaGO1lYcCzTIBBWb6RJtlaZ74LNDs=;
 b=Dfeu6lCLMcy9nj9zrOr33IOCMCv6/RVzITnzOvsGNgCkv3pnl4++3tpMLPSfDC8QSs
 TEIIqNMFShtOo1e6RxPOwRry99908FUQBYcbi8OF29G1h9CjXDz4oV2iPGhP+BCCXob4
 zSpJ+nZyI6gdlwqyeNTm+hM5664k10KZcrFSbzhlKA1jUBHhLsK1yZvTreK6y//R02cb
 3db0em2iPFlUnEF8esg3liVGFS82jjYudQKCxotsxdU1MuDWCmZ76cmEYExCtdkRtWfq
 QxZfDkE0gREURl+981q1HzDOEV9s+FXjnA6zS8d2KaO3m+hGbmPNXyeMBRZxFSZqR6MP
 qFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487617; x=1780092417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HSbz0rz1Vzev+MKaGO1lYcCzTIBBWb6RJtlaZ74LNDs=;
 b=Aia5VB160JauLzU1JIzonVWuSbL8xdaPN+dtYgylwspk2GXk/YeUJMg1piSDKVbM2F
 hMkwv0nxx75HIiZQltEmbnaKqv7hEvz2/agdUtqlE5iuky7g101kKeJjK+0tVTLnULWd
 xxflaSgrn4gnyBKPxuRgupR2qcnk9h5y4uW4f75N+F1ghf272i5PlzCeEltDCQ4t4sEN
 L317NRuPoWfSjxQXQj2It5N0S1WcDQJSYTz5hGybrhZzGAYDMP7vt5Dr2poTd85xJDSJ
 aDFHm0yJXsCx94GJEm7UK+B6GuifW3RELWkM4fSVjoaY/dmqubhzpvcSwpSNVp7ImXuP
 AOQw==
X-Gm-Message-State: AOJu0YyTx3GDM4CsmKRgR6CU/s8vlc2N5oy53eBc7B84HaG/d1LqsRmo
 q8upOhu4rzCBvciy/hnXflmOuMLl0As42y+Kv2uu1m6wgQ7zfGXDUzCQ5qBmDAbMiKE=
X-Gm-Gg: Acq92OE3r01GBZqsF9tXS7Z6MDxMT98wkTwFcL1rhsnyD3MIhLaWwltUOKEgy3YJ9IP
 2eRs+3Mbk923Kg+CRUuylmgEIrmzkCL9VF9u9cOO5G40nkeEQdHRjJS2ylez5ni4vWjpKepYpmN
 PB34G4+cFXyuK+9qBx2QXkr3hSZAZeoW1OoG3VFVtEih0QhDsuOnshlRB1lr1/FhZFyhpMw2AY2
 JksF7S9KqF1/4Ok0sHm5yfuNSyRnDMyx1wPu3blhubDdWbAv8bHI1Q+s4Z8A8xGWwPI6nCyg6IF
 W5XNgZkL7VdNP7LbIMV9LZHeOAf9ZImWbh+53neA5EevuCIVrD++bxyrbHD5QRus5E6k73bVlJZ
 sI/YwhXkrXsXjEDxY/zwolDRmsBnQtQgkGFcu5JY92imK98xpRu/GIv8j1s3vneMAr4SmXXf4ip
 KwV3hM9Cews1zMm2S5wICjOxUL9RKJ
X-Received: by 2002:a17:902:da88:b0:2b7:ca38:975f with SMTP id
 d9443c01a7336-2beb05b57c8mr59728445ad.23.1779487617396; 
 Fri, 22 May 2026 15:06:57 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:06:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 52/64] target/arm: Enable FEAT_FP8FMA,
 FEAT_SSVE_FP8FMA for -cpu max
Date: Fri, 22 May 2026 15:02:54 -0700
Message-ID: <20260522220306.235200-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
index 08ee5fd192..2fb43d51e1 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -225,6 +225,8 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_f8cvt, ARM_HWCAP2_A64_F8CVT |
                                ARM_HWCAP2_A64_F8E4M3 |
                                ARM_HWCAP2_A64_F8E5M2);
+    GET_FEATURE_ID(aa64_f8fma, ARM_HWCAP2_A64_F8FMA);
+    GET_FEATURE_ID(aa64_ssve_f8fma, ARM_HWCAP2_A64_SME_SF8FMA);
 
     return hwcaps;
 }
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
index 9c82df136d..c7128f1cec 100644
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


