Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CA0C61DC6
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:43:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHea-0000vb-9v; Wed, 26 Aug 2026 13:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHe3-0000CT-MV
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:47 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHe1-0004qz-S2
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:39 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-cbe827e3cb4so1349540a12.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766156; x=1788370956; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=98SZj8G2qM95HopKhGAt9krvgt80d6igX2ZzSUH8XYg=;
 b=gExZhvciMHXm8T/WgjrCST3iO9+HGTWTHVz3X5rygcUh/eveaNp6YSEV5xmBWRs3vJ
 HMLXJ+RhlI/1QbCmowpsL903coz0O/IYRVu9iZvLigsspnEh+isKRDJv32jIhGP9L7H9
 vZ51EHPCEIn2gqWzMTuGh301PEuJxvrTlnK89YqOeAnB05cIaFjlvMo/u/2OblNDpm7t
 r4eQHsp2MhaykPTd2eULt4tX7u9+lqWLXszr2eqtTkEuQygidWv9f6vGX+2WiE+JOz5Y
 iHF8EpQTUasMhQltvhMCc12ALqMLPeAlOv3TZHrv2J9tOo4P2q6MVJuG5E42Z+esE5Ih
 SRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766156; x=1788370956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=98SZj8G2qM95HopKhGAt9krvgt80d6igX2ZzSUH8XYg=;
 b=P4PCGYNLK4/MUWUIeZmMFTYFy9fsj8IdjYoTVzd7zVO6UWBlxhlFiF4MqeKhwAStt4
 0vW88FOnjVHBCGdDh87hMtTfgwps5vevgwQneZ6Z3XYE3NTrOGyGsg9jio2eS+cwzvA1
 iVxMyYMQBDX3EvWKQIhnp/CnB4f1q2Hkf85BUmhXos6EjRDdVlxEaHVbP8o/t+NJpYEL
 yJbEazvkzU5Sfk+GA5T6ozGHALKXBLs5LRMhAtDibUG4VpFAH/+6mk3yPs5COJmXNaK/
 s6mLToWCiuF49V66L+zcwOsaqdVqLddW/hw75/8qekyoZkYrtK+QtLmONCUOrJbPmuDb
 RDlQ==
X-Gm-Message-State: AFuF++mc6dYUB8KhLCNfDzoeWWOFt+baUi7dIJ6yDG0Amy1maLKtrmCi
 mcjTqbjVxUsvRoPzqaTwGXQtaHfJlNzNF+R4nNUcBYLEt+eYLruBf1ZMClB6o7jthhc=
X-Gm-Gg: AR+sD13mgmiQXRVXsOjLClBZIHpT+AWJpa6A4+zQNxS597XwcPXru3I9jXEa26XTxuI
 GsuLuXc0pQQgLQJdAYOC/Qt2dbDP9rjBjGaB0dg4cuMaDSkBPDf39QteCXcVZNaYE6oi1af3sX7
 cUzQR2sC1e1yuQgv7Odi4Xsu97jgVw3XY4TE7GPBRMg6/LsVr+Af/jnwIk/qFIbjZ4+lzpZl4JR
 A0jdeOnnUAXnR7EyAYcpc+NMCgFbFnH4TkHvpezgltYiGobfYaXS9HDGdtm1BNbBtC3VpD7Z6Fn
 Yy3g5mJG2sGPJ8Sf3rNjxxz2xy++995yYij/4s4ule4stk66aPrZaWppeOjtTCtop3FqCqTRJDK
 TGT8GO2OARr8HZEPm3ghS+ulfss9NakbTse+/1TU2T/0kGHEwsg7Mp6hzNQhGSjENVIMnZYffAz
 FmR3OQqZ81RzT6UoR8A7XQCVMB1bH+E8CGFLdbyyDjYkU+z6i0jxjYq4WjLOYQXjnavhiZ7owMm
 uTYdZ/PcreUCQs3pw==
X-Received: by 2002:a05:6300:6681:b0:3c3:7ac4:dac0 with SMTP id
 adf61e73a8af0-3cf85676aa1mr19610852637.13.1787766156091; 
 Wed, 26 Aug 2026 10:42:36 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 18/25] target/arm: Rename isar_feature_aa64_sve_sm4
Date: Wed, 26 Aug 2026 10:42:05 -0700
Message-ID: <20260826174213.614571-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Rename from isar_feature_aa64_sve2_sm4 to match
the feature name: FEAT_SVE_SM4.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/aarch64/target_arch_elf.h | 2 +-
 target/arm/cpu-features.h          | 2 +-
 linux-user/aarch64/elfload.c       | 2 +-
 target/arm/tcg/translate-sve.c     | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bsd-user/aarch64/target_arch_elf.h b/bsd-user/aarch64/target_arch_elf.h
index 8669f3f8330..0ec7a7b5859 100644
--- a/bsd-user/aarch64/target_arch_elf.h
+++ b/bsd-user/aarch64/target_arch_elf.h
@@ -130,7 +130,7 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
     GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
     GET_FEATURE_ID(aa64_sve_sha3, ARM_HWCAP2_A64_SVESHA3);
-    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
+    GET_FEATURE_ID(aa64_sve_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
     GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index f94e8efe471..44dfc7d457c 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1554,7 +1554,7 @@ static inline bool isar_feature_aa64_sve_sha3(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SHA3) != 0;
 }
 
-static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_sve_sm4(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SM4) != 0;
 }
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 83791768c6e..7afbfca4183 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -196,7 +196,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
     GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
     GET_FEATURE_ID(aa64_sve_sha3, ARM_HWCAP2_A64_SVESHA3);
-    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
+    GET_FEATURE_ID(aa64_sve_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
     GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index cf5445870cc..3d823674cca 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8302,9 +8302,9 @@ TRANS_FEAT_STREAMING_IF(AESE, aa64_sve_aes, aa64_ssve_aes,
 TRANS_FEAT_STREAMING_IF(AESD, aa64_sve_aes, aa64_ssve_aes,
                         gen_gvec_ool_arg_zzz, gen_helper_crypto_aesd, a, 0)
 
-TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve_sm4, gen_gvec_ool_arg_zzz,
                         gen_helper_crypto_sm4e, a, 0)
-TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve_sm4, gen_gvec_ool_arg_zzz,
                         gen_helper_crypto_sm4ekey, a, 0)
 
 TRANS_FEAT_STREAMING_IF(RAX1, aa64_sve_sha3, aa64_sme2p1,
-- 
2.53.0


