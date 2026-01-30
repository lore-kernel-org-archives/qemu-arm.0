Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CD4D79768
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Jan 2026 11:57:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vm9am-00066W-7a; Sat, 31 Jan 2026 06:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vm9ak-00064I-Gd
 for qemu-arm@nongnu.org; Sat, 31 Jan 2026 06:56:42 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vm9ai-0002we-Qf
 for qemu-arm@nongnu.org; Sat, 31 Jan 2026 06:56:42 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b883c8dfb00so705920066b.1
 for <qemu-arm@nongnu.org>; Sat, 31 Jan 2026 03:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769860598; x=1770465398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tTQnyXkt6mPVo9KR5GxpqCjbhjPBX727ATjE1sQOZSc=;
 b=tISLVktp8byO6jQoC2GJcjRhV0PMmdr9Y03gE/F4eTW/KHOmyRcNf837UI8sfMP2FV
 Ck4/VZN+if4H/rRQCOGbawRkx1JdaFM0dHPTVFeHSvYlSK1Ge8Xb+bzxkvIPnzIF5wEw
 IMT/h8/vHwQcSEXIZf/xmfAWixs3ObSF5uqCa/h7qxgJUkhw9onPpYIRhymGHdwYHrqA
 0UpMfCUtlAidtb7/nOs73oO7LGuCp373f0CZGbDbdPdFD6z52a3TV/citNiZN/zbCgmh
 0zo+NRE4pZx2r6uXLp+U4KN7BPlLRujSCdYqRs7cpkIkQW9YNov7f+Jdd6cXcpoo4FVV
 GjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769860598; x=1770465398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTQnyXkt6mPVo9KR5GxpqCjbhjPBX727ATjE1sQOZSc=;
 b=rMnehWMT/NGh5VgbiVLzyHqWh+Z5gJgCiNF+VsdLlZ5UE8CrzVpksBf4KQBSP7fWR4
 Az8Yw7vjdlXmWMxKfzNvbFCJoaOOsWeJqSnIaHHmyE6fIqVU1N7wVUpd90k4HaRCx0Nw
 5CWvcEYQC8wwAbBF8io5/ulkyrFO0CMwp8t4LhEFCp5EMIQWv6MFV7uL/FdpID2MkiuJ
 i3mdDgUMysWtWhMYH3f1IT8RdfUzL49oEI3raEeZXsx2nxMTKDCNJbdvWglxCUnsAgfr
 yfslhqn9CbruY2du7BNY0NIQWrutPIjPVRSNFaE4nfWSgHiUWxHknkIB0Exu9EoJ5fYb
 je6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhcqg8O/AuCCqU6dtV6Jf4MPtPS0G94XnrD1XO9MzOeCs03c7BluEevRp6F72Fe5WkfRbCW8m4rA==@nongnu.org
X-Gm-Message-State: AOJu0YxmGGnAz4IRUL/8eoaNHFeGGyarXT7JWkSSfG+uyXpX28eKZGc1
 8hX9tycpVayausMIHXd3IhTyALd+ZAtuGgyjbqdGBiQ2FxfiySKJwSuauIsuhCLlWy8=
X-Gm-Gg: AZuq6aL367NEm2Ul2SUUISIDZ7caFK4VvYTSQzVD1I2qiJJ+5BAzsitgRLghSmC/gsm
 LuTIitc4s30uxSbCz1Rtatsw8ve7B502gC3qlblflVtTWlg1OOm397NWwcBjwWrUnxk9eQyLz3f
 NwY6Idqw/aJkupL1w/rbaZ9IbQhw8Uq3h8LP0hgSnRt6ccBPxrF4wWFuMgNAWABAEz3uM082Uhn
 LoMKaGxp5kadlm/IinLyAGlAUnDmRZtQsQ/hIgrqg4FZQP9xASZBFA95EEoEPNTfcCodG3UndLt
 DX6XG9IkLp5GsSfBOuGjYePWKe6VQiR2tkIG5gNcdEbJAMQIXxQ7ZorNdj39s3gOBF5yUv5lJgD
 J5lo3v9l5BPAqHZZ4H63T0SMwMFU6Vr1oqDTjcPQ+gGTWku+5l8SqDeQl3XnKQS2qxGxmEbeIYI
 SX43CGKAwVbko=
X-Received: by 2002:a17:907:3d43:b0:b87:6f58:a845 with SMTP id
 a640c23a62f3a-b8dff667670mr334444866b.36.1769860598187; 
 Sat, 31 Jan 2026 03:56:38 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbeff5629sm566720166b.27.2026.01.31.03.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 03:56:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A36295F747;
 Fri, 30 Jan 2026 18:16:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] target/arm: implement FEAT_E2H0
Date: Fri, 30 Jan 2026 18:16:48 +0000
Message-ID: <20260130181648.628364-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

FEAT_E2H0 is a formalisation of the existing behaviour of HCR_EL2.E2H
being programmable to switch between EL2 host mode and the
"traditional" nVHE EL2 mode. This implies at some point we might want
to model CPUs without FEAT_E2H0 which will always have EL2 host mode
enabled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
comment: I've left a fixme? for HCR_EL2.NV1, I await guidance on if
I'm reading the spec wrong.
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-features.h     |  6 ++++++
 target/arm/helper.c           | 14 +++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3f30ea5a30e..74359f3e844 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -53,6 +53,7 @@ the following architecture extensions:
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
 - FEAT_E0PD (Preventing EL0 access to halves of address maps)
+- FEAT_E2H0 (Programming of HCR_EL2.E2H)
 - FEAT_EBF16 (AArch64 Extended BFloat16 instructions)
 - FEAT_ECV (Enhanced Counter Virtualization)
 - FEAT_EL0 (Support for execution at EL0)
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index a7ca410dcb4..b6ef328fe0a 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -347,6 +347,7 @@ FIELD(ID_AA64MMFR3, ADERR, 56, 4)
 FIELD(ID_AA64MMFR3, SPEC_FPACC, 60, 4)
 
 FIELD(ID_AA64MMFR4, ASID2, 8, 4)
+FIELD(ID_AA64MMFR4, E2H0, 24, 4)
 
 FIELD(ID_AA64DFR0, DEBUGVER, 0, 4)
 FIELD(ID_AA64DFR0, TRACEVER, 4, 4)
@@ -1376,6 +1377,11 @@ static inline bool isar_feature_aa64_asid2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR4, ASID2) != 0;
 }
 
+static inline bool isar_feature_aa64_e2h0(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR4, E2H0) == 0;
+}
+
 static inline bool isar_feature_aa64_mec(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR3, MEC) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 655ce73ee1b..27b5fb01827 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3773,7 +3773,8 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     }
 
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-        if (cpu_isar_feature(aa64_vh, cpu)) {
+        if (cpu_isar_feature(aa64_vh, cpu) &&
+            cpu_isar_feature(aa64_e2h0, cpu)) {
             valid_mask |= HCR_E2H;
         }
         if (cpu_isar_feature(aa64_ras, cpu)) {
@@ -3797,6 +3798,11 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_rme, cpu)) {
             valid_mask |= HCR_GPF;
         }
+        /*
+         * FIXME? HCR_EL2.NV1 is only meant to be RES0 if
+         * FEAT_E2H0 is not implemented with 0b1110 although the Arm
+         * ARM doesn't explicitly state it is RES1 with 0b1111.
+         */
         if (cpu_isar_feature(aa64_nv, cpu)) {
             valid_mask |= HCR_NV | HCR_NV1 | HCR_AT;
         }
@@ -3820,6 +3826,12 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         value |= HCR_RW;
     }
 
+    /* Strictly E2H is RES1 unless FEAT_E2H0 relaxes the requirement */
+    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+        !cpu_isar_feature(aa64_e2h0, cpu)) {
+        value |= HCR_E2H;
+    }
+
     /*
      * These bits change the MMU setup:
      * HCR_VM enables stage 2 translation
-- 
2.47.3


