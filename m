Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FD1C5DF97
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:45:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHeY-0000qc-QS; Wed, 26 Aug 2026 13:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHe0-00009H-MS
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:38 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdy-0004qC-Sx
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:36 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84e04df8c46so1565803b3a.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766153; x=1788370953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8GEIXtO4rp0D+9hTzQSxGBOw3vUbRaLs8o9XlHapoI4=;
 b=jlkJ9WqW7xBI5mlFqXNZGwHX9RNgKWfqRPv6hZ/DEZIzqRKQIaWwd3SSDi+JlDl3mS
 dSpCVBzPjG8NhWVQTNtcrH/oYl/7vssXCe6kDcx88euMOSiSRqGgYPcLliD73g7ssgV+
 QO2to+nOfpkKl2RE/ssrSPximenBfFx24MhXD3eT7W5No0Q7JjUwgWetFRUar+XBl+J9
 2GqehT/BSzJRiAgYpvlOzT0wlfdUKyE7LRsUrqxl1GntfRGJyyPREbkjV2ZrVhvfejFu
 p3z9pmOa5VjuIbmNc4DALPwCIG2nxqmmkQy3UgbHkRhqPJ/rdQMzcV1Is7EKPLb5KeOt
 084w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766153; x=1788370953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8GEIXtO4rp0D+9hTzQSxGBOw3vUbRaLs8o9XlHapoI4=;
 b=qeAL6zhTspBtTIdz5MimUI3JxZxnZq2bOga2MwdsTTKe83v9MGN0xskpCWYM+AUlcw
 HME6+kA7UWX/3Gm7f6p4tHtZHV6gudxkAAe83B7Jz5cemFDJU0DYQ47A0hpOUpVrgAa6
 BV76+7a6+Z38ggqBfOHH+Gt8Z3G7+jcqufDmZIPTh1J7/akjByKcvTQLX2+/RHXcl9HT
 RjAy32aMD9Rbenk2U8+5aP2xwusWs5U/jr7VvrN1xFTxh+LyMCDvsUzkCzMLXFTFzjfN
 +qDOVl/HvStQ6/byIujW+SGrCjto1/Xnn1wY9v+ZUxLZPeCtlwtMEyDQzbV39iSA6Opv
 Oh5Q==
X-Gm-Message-State: AFuF++kM0LZTclHu9u9Gq7xxWOnoYlSo2ZWVS55hP2MrMOzCyIYAD6s4
 54KMIF/5axe9zSQgQz0SwkAb/FoCFZXNwkuXt+yKZB3CkqI1SWtrPziIJXByVHt4vYE=
X-Gm-Gg: AR+sD10ED//3U1fzA42MAIwZY0ZyHm6kKdnHEiXdIEnQ9S5CwXYuuEZ6ypzqSRRZu+H
 0ySdLxALowe9rUOS3pUdPkk6Vpj1XhZC2i6izqyXUr0tGt7caJSWNhqAcCUdCIrXfH3QpF2Eksr
 VrNhFaRQxL9tN8yTleUx/dsorMSU6PQuXoyLwaNiELU0icgg5bF2MBMRjE94aWF9+HlQpJD0YQi
 FN1WE7RnIQb2D1YEBBV2+EWfwCbhFNsTb49Kj8ZbpDrxwfaZVW59YObI57UEI1WzZOFdNLtwxY2
 axSqJX0twmDErNfBkoSLzSq5QrRGJwhp/XguXP4B0cvtnZSYcinLPWTf8C6FQvo4NBdfnW3oeRs
 W3P3nM+56kwVEbYhqoczC1Lq1uSCfm7NwF1a7j8gTcJaWeVqcJhY0/CwfidSIZdh08bfsAEZ+g+
 gnt2UULyWx4c9nQ5DgdnEatIMKeijPwhNs5TlfdkKveY/12iLPBvQ4zYRBainWjpdXWjtsOq011
 juj2Suv9AuvuYuKMQ==
X-Received: by 2002:a05:6a21:e082:b0:3c3:88a5:83e4 with SMTP id
 adf61e73a8af0-3cf83e350eemr13682661637.10.1787766153437; 
 Wed, 26 Aug 2026 10:42:33 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 16/25] target/arm: Rename isar_feature_aa64_sve_bitperm
Date: Wed, 26 Aug 2026 10:42:03 -0700
Message-ID: <20260826174213.614571-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Rename from isar_feature_aa64_sve2_bitperm to match
the feature name: FEAT_SVE_BITPERM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/aarch64/target_arch_elf.h | 2 +-
 target/arm/cpu-features.h          | 2 +-
 linux-user/aarch64/elfload.c       | 2 +-
 target/arm/tcg/translate-sve.c     | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/bsd-user/aarch64/target_arch_elf.h b/bsd-user/aarch64/target_arch_elf.h
index 6f9d192b4ff..818b6f690a3 100644
--- a/bsd-user/aarch64/target_arch_elf.h
+++ b/bsd-user/aarch64/target_arch_elf.h
@@ -128,7 +128,7 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
     GET_FEATURE_ID(aa64_sve_aes, ARM_HWCAP2_A64_SVEAES);
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
-    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
+    GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
     GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
     GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 750be9b1b1a..857adf4ee07 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1539,7 +1539,7 @@ static inline bool isar_feature_aa64_sve_pmull128(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) >= 2;
 }
 
-static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_sve_bitperm(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, BITPERM) != 0;
 }
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 40c5e1dbd38..0569350e376 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -194,7 +194,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
     GET_FEATURE_ID(aa64_sve_aes, ARM_HWCAP2_A64_SVEAES);
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
-    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
+    GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
     GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
     GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 773e4ba4e7b..87d6b5785c4 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7430,21 +7430,21 @@ static gen_helper_gvec_3 * const bext_fns[4] = {
     gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
     gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
 };
-TRANS_FEAT_NONSTREAMING(BEXT, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+TRANS_FEAT_NONSTREAMING(BEXT, aa64_sve_bitperm, gen_gvec_ool_arg_zzz,
                         bext_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bdep_fns[4] = {
     gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
     gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
 };
-TRANS_FEAT_NONSTREAMING(BDEP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+TRANS_FEAT_NONSTREAMING(BDEP, aa64_sve_bitperm, gen_gvec_ool_arg_zzz,
                         bdep_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bgrp_fns[4] = {
     gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
     gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
 };
-TRANS_FEAT_NONSTREAMING(BGRP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+TRANS_FEAT_NONSTREAMING(BGRP, aa64_sve_bitperm, gen_gvec_ool_arg_zzz,
                         bgrp_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const cadd_fns[4] = {
-- 
2.53.0


