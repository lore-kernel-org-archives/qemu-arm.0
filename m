Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5F1C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHeN-0000Yf-77; Wed, 26 Aug 2026 13:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHe2-0000Ao-9I
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdz-0004qa-Ss
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:37 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-852c481415fso1518496b3a.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766154; x=1788370954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SmXUq+fsPwyO80LzQiEP88Q3vooswSB7fXANN1O62Rw=;
 b=nOGf0HvUMUtoZFmmemxbBUFOdfcRVb3kfS4Xdv5yktk0rDdrtnVXOU+Q6sjYPVP5Q+
 tc5xGuG4bbuxY5hbJkTH4v25U1vReW381cBT7hxyYMALi7OvvuZAtfGhbIp6EQdjyRs5
 ezyMoKVvmr46WPU53q+ttqxIcmkS8EJHXKmeaeDtfo7vfA6n2UohqnbOrvYvxjdL3+xK
 y68hqwgK+6Pf3oRbLS9Mrk8rGCiKRY/Qktt8DppbCSPmILY87Re4cdUm5IAVNdxxAeAm
 fJOE5HnSAULVxMTIPObPAMsGomjx4ClgmOHjyPjzofhLcnbjusveFS/0Yee+qLZu4Ae3
 GlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766154; x=1788370954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SmXUq+fsPwyO80LzQiEP88Q3vooswSB7fXANN1O62Rw=;
 b=SeFWYBrMYQf3q5vjR/0UZLXzY/7Hu+wM0JYaxvNZheN9k+jaKxCJyor8ZdnoGLuSnQ
 046+dZALyBTaoXeleHXnz/ReO9MyEjCWh7EsfluRaaLD8RoJDISXisGodOUrE/ONO35K
 8zNItiaU0RUn15g0ADDLu19V6st6etLg9VDavoZIV/mAd3qw+6VCvOn0zjm+Vdo4kd5D
 WfjBT680I2UX+xBVAShvcdUXCck6Bh4Vv8YiLuUiGEvw9gxEn6dLHRKD0dvSM8mUD54N
 D4vJQAR9BoK2oO1yCYFnQEkgRfbl2YpHzkfIuM0Cug0WrEANFGBz+hSuuU/Kp7B2TV53
 p00A==
X-Gm-Message-State: AFuF++mCqT/Ronnodx6zecCbOsMJJoDH9E5CUSFicyPeNb+6QQHRPbcZ
 foCt6h3uAIywNZHhpf3JXTTNR+jQc85JyEotVSoxAEp2HNRjSEgEsdl1wPzsxZQFIQM=
X-Gm-Gg: AR+sD11h8xWQfO3DyC9Jjt+Nzay9e/64Th15l35KLztmm7brhF16tKCsTZN+OqkamJ6
 OFRpaEuLbFVMOyw/viRj31M+NllviCTbkki2m/s068j9bGDrjA5+4W6paMPBQLFU84MtZ2UB4Ym
 ScVEfBdZXNFrP0+zUA+Er1q/Z7FEL9eJNBURMvL2dp7Dc4OtWPYgFFAsr8GhbjKZj15B/WctJIY
 NsFcd4U0ea+ss6r6ikryyuDhbRj5bXNR7sQWYY6dpbF26BHVRlvGJeWVlgMgvgqwKbA3faBrmAL
 1U5L/JzpjYnkXBVviyleCwaTEynlfWBAcdvlX2t4LHljGP1DGHLoZfUvjBo5rKLn+p0Yx1ZlPvW
 Ixu8rmHnKMcZr6QvnYPzH/ImdJ/u0MofM13uyQKQSamKB87B5NRTNKPSKsGlxAW/tCbv/3mZ+Hi
 HtA+eEZ9Lzrq9JOg+Up6qUX/yQxEzJgWh/sRnISEn0ps0fDc5T1PKhUicS3hJu5F/qsnnbXXFQ8
 WYj4DjfA1/8g6y5Rg==
X-Received: by 2002:a05:6a00:6c83:b0:851:92fe:504b with SMTP id
 d2e1a72fcca58-85372faee4amr3814823b3a.7.1787766154492; 
 Wed, 26 Aug 2026 10:42:34 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 17/25] target/arm: Rename isar_feature_aa64_sve_sha3
Date: Wed, 26 Aug 2026 10:42:04 -0700
Message-ID: <20260826174213.614571-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Rename from isar_feature_aa64_sve2_sha3 to match
the feature name: FEAT_SVE_SHA3.

Reorg trans_RAX1 to use TRANS_FEAT_STREAMING_IF.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/aarch64/target_arch_elf.h |  2 +-
 target/arm/cpu-features.h          |  2 +-
 linux-user/aarch64/elfload.c       |  2 +-
 target/arm/tcg/translate-sve.c     | 13 ++-----------
 4 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/bsd-user/aarch64/target_arch_elf.h b/bsd-user/aarch64/target_arch_elf.h
index 818b6f690a3..8669f3f8330 100644
--- a/bsd-user/aarch64/target_arch_elf.h
+++ b/bsd-user/aarch64/target_arch_elf.h
@@ -129,7 +129,7 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sve_aes, ARM_HWCAP2_A64_SVEAES);
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
     GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
-    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve_sha3, ARM_HWCAP2_A64_SVESHA3);
     GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 857adf4ee07..f94e8efe471 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1549,7 +1549,7 @@ static inline bool isar_feature_aa64_sme_sve_bf16(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, BFLOAT16) != 0;
 }
 
-static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_sve_sha3(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SHA3) != 0;
 }
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 0569350e376..83791768c6e 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -195,7 +195,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_sve_aes, ARM_HWCAP2_A64_SVEAES);
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
     GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
-    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve_sha3, ARM_HWCAP2_A64_SVESHA3);
     GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 87d6b5785c4..cf5445870cc 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8307,17 +8307,8 @@ TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
 TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
                         gen_helper_crypto_sm4ekey, a, 0)
 
-static bool trans_RAX1(DisasContext *s, arg_RAX1 *a)
-{
-    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
-        return false;
-    }
-    if (!dc_isar_feature(aa64_sme2p1, s)) {
-        /* SME2p1 adds this as valid in streaming SVE mode */
-        s->is_nonstreaming = true;
-    }
-    return gen_gvec_fn_arg_zzz(s, gen_gvec_rax1, a);
-}
+TRANS_FEAT_STREAMING_IF(RAX1, aa64_sve_sha3, aa64_sme2p1,
+                        gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
 
 TRANS_FEAT(FCVTNT_sh_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)
-- 
2.53.0


