Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2799554lfm;
        Tue, 16 Jun 2020 10:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjIhHZb5ASeglDqnK70uYA8Rc4Ha1W3INn2DcJlS3W/MCw3Pb146f5/7con3R8CB6PsA+w
X-Received: by 2002:a25:bb0d:: with SMTP id z13mr5634274ybg.417.1592327368882;
        Tue, 16 Jun 2020 10:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592327368; cv=none;
        d=google.com; s=arc-20160816;
        b=vfv/n5WACv25HK/3LC4Qo080fR6WFrFo2cknPKlu2CPc6fOuHLzDSb7NvqrExJ/iNV
         JuF/Vgox0QzAOshx0ifpaStmpNNLACv6hycVv4Z3W2+RvpRS4uGQOgSIuCkXP5cnnuK1
         tMjBR56PMKOpRNgESK8kbttdcwVfJJj0VnXDQ18dAevUZaaSkP4Nl3UinNsnOOjTJTnI
         NOLoI50ojHgp1S6LepAChNI2N0dbupCo+BOKuNJ6dsoUnBQ0eMHp/JS0U15XmW33OxaP
         EoJDAfMlpPMc3O3GJvYQvlToenw8uBkJY8UJWFhcXkzfncRKOtcHFlD21g5YC0wC7brC
         RzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9Sp05zSviKK/vex9tstJEZpczFuX6qw9ndOqIxUFQRg=;
        b=dFA3vsltBCEvHhXnxenskPdQqPxEXUu6H20bhq6G0OG6O3LMQe64EM4sO3cZWtn+Lf
         Ri08vt9tm2WIZ7QU64XA5oighMfgdRsJF6Wxow77NashfLpEHNKh0kAYg+AJJG1VoYCw
         8QYVBpvBUT8N/glV0vSYAZLdMtQInDPwOQB83FuxhI9QUKfGTRIwWFQ3wQulVthQMLqX
         LRbpzi3bPxKNf4xFrmu8pphPaDnK5aLhEKsvUeqFriFZmMR96CarRYfdJGECPvTxxBTa
         jQpYXYG67CwxAfn6Ggdg0EZzvv22z/gUYJZv42PMP7e4mwfxz5Yt9fM6f6tHvGv1sXfX
         Ygbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCbxYBdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si13411999ybm.137.2020.06.16.10.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 10:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCbxYBdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlF5U-00025O-5u
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 13:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF52-0001Em-73
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:09:00 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF50-0007Sl-7K
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:08:59 -0400
Received: by mail-wr1-x444.google.com with SMTP id b6so2418606wrs.11
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 10:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Sp05zSviKK/vex9tstJEZpczFuX6qw9ndOqIxUFQRg=;
 b=gCbxYBdAGWZ+mXkZAWZFO3kyxY2u0IO+FMn/5EZoKKIgUXRU0V7qgFP0MJpox7XOJq
 BkXqe8e8FPzapEQVnVJGoujWwPVr7FkEXIpSqY8vuFB9zUxi4a9oU5MEUH3EcOYeX5df
 xyHPWipBAvYaWKfdplxJwIoxZOjfmPAdonZEh6ku20/EMs6uXWbGe8J4dkNKz+Ce9J0Y
 Tlm/5+WJ+eFhM/AQfJASZDoxPTENIFDStdZlC30D80tz+kERRjuVotJm1JtkXOLTchoA
 PsQS5LVjYuRh7mtIlDaKshKaCSLr7RMcjePz1ZOWy8c+ivhaIMXXMgjjKT8lbZ9hcVJV
 sXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Sp05zSviKK/vex9tstJEZpczFuX6qw9ndOqIxUFQRg=;
 b=KV/VK8gOEeepWHCpX8i2rJhr0Xfs/f+K4G29YcbD9ipDzD81GDGXahSZEKt1sG1vvq
 aHV9LCd9Q/08GfLrZG1OyiemyUkQNLhZ6/qzDPRE8yVWKTBoMG4/z60TMLS6egaJlkEg
 xY8s+dNSQGL6f49bDd0/5Pd+Ae7FvHbYdu/QV8y7NX7CF/z0eGXbcSuCj/gO9f7sB2Rp
 oFLmsrlNVyAA1+lQaNTPicqoJCeQ4DZ5St2yz44eA5NeQCX3LzXqsybY3fvCbUP+XbR0
 3PeZqs0WIyo/IdxGsnkLYezV85asGM20McXIqK9xlV8fRQ8aKW0LfTQRthVGoJnCdRKf
 klxg==
X-Gm-Message-State: AOAM530io92e50noWvzbCtGJyewTIlcskZFnN9QjVatNslMuzaB1NkYp
 ARgFxByrp/Y9Zw23isEjkqsmNiHjuUeVZw==
X-Received: by 2002:a5d:5449:: with SMTP id w9mr4147375wrv.106.1592327336310; 
 Tue, 16 Jun 2020 10:08:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y80sm5263216wmc.34.2020.06.16.10.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 10:08:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/21] target/arm: Convert Neon VCVT f16/f32 insns to
 decodetree
Date: Tue, 16 Jun 2020 18:08:29 +0100
Message-Id: <20200616170844.13318-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616170844.13318-1-peter.maydell@linaro.org>
References: <20200616170844.13318-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O1kIho5N0RxH

Convert the Neon insns in the 2-reg-misc group which are
VCVT between f32 and f16 to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  3 ++
 target/arm/translate-neon.inc.c | 96 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 65 ++--------------------
 3 files changed, 102 insertions(+), 62 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 0102aa7254b..8174f2f92f4 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -461,6 +461,9 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
     VQMOVN_U     1111 001 11 . 11 .. 10 .... 0 0101 1 . 0 .... @2misc_q0
 
     VSHLL        1111 001 11 . 11 .. 10 .... 0 0110 0 . 0 .... @2misc_q0
+
+    VCVT_F16_F32 1111 001 11 . 11 .. 10 .... 0 1100 0 . 0 .... @2misc_q0
+    VCVT_F32_F16 1111 001 11 . 11 .. 10 .... 0 1110 0 . 0 .... @2misc_q0
   ]
 
   # Subgroup for size != 0b11
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 78239ec1c1b..d37be597cf4 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -3354,3 +3354,99 @@ static bool trans_VSHLL(DisasContext *s, arg_2misc *a)
     tcg_temp_free_i32(rm1);
     return true;
 }
+
+static bool trans_VCVT_F16_F32(DisasContext *s, arg_2misc *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 ahp, tmp, tmp2, tmp3;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON) ||
+        !dc_isar_feature(aa32_fp16_spconv, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vm & 1) || (a->size != 1)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(true);
+    ahp = get_ahp_flag();
+    tmp = neon_load_reg(a->vm, 0);
+    gen_helper_vfp_fcvt_f32_to_f16(tmp, tmp, fpst, ahp);
+    tmp2 = neon_load_reg(a->vm, 1);
+    gen_helper_vfp_fcvt_f32_to_f16(tmp2, tmp2, fpst, ahp);
+    tcg_gen_shli_i32(tmp2, tmp2, 16);
+    tcg_gen_or_i32(tmp2, tmp2, tmp);
+    tcg_temp_free_i32(tmp);
+    tmp = neon_load_reg(a->vm, 2);
+    gen_helper_vfp_fcvt_f32_to_f16(tmp, tmp, fpst, ahp);
+    tmp3 = neon_load_reg(a->vm, 3);
+    neon_store_reg(a->vd, 0, tmp2);
+    gen_helper_vfp_fcvt_f32_to_f16(tmp3, tmp3, fpst, ahp);
+    tcg_gen_shli_i32(tmp3, tmp3, 16);
+    tcg_gen_or_i32(tmp3, tmp3, tmp);
+    neon_store_reg(a->vd, 1, tmp3);
+    tcg_temp_free_i32(tmp);
+    tcg_temp_free_i32(ahp);
+    tcg_temp_free_ptr(fpst);
+
+    return true;
+}
+
+static bool trans_VCVT_F32_F16(DisasContext *s, arg_2misc *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 ahp, tmp, tmp2, tmp3;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON) ||
+        !dc_isar_feature(aa32_fp16_spconv, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vd & 1) || (a->size != 1)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(true);
+    ahp = get_ahp_flag();
+    tmp3 = tcg_temp_new_i32();
+    tmp = neon_load_reg(a->vm, 0);
+    tmp2 = neon_load_reg(a->vm, 1);
+    tcg_gen_ext16u_i32(tmp3, tmp);
+    gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
+    neon_store_reg(a->vd, 0, tmp3);
+    tcg_gen_shri_i32(tmp, tmp, 16);
+    gen_helper_vfp_fcvt_f16_to_f32(tmp, tmp, fpst, ahp);
+    neon_store_reg(a->vd, 1, tmp);
+    tmp3 = tcg_temp_new_i32();
+    tcg_gen_ext16u_i32(tmp3, tmp2);
+    gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
+    neon_store_reg(a->vd, 2, tmp3);
+    tcg_gen_shri_i32(tmp2, tmp2, 16);
+    gen_helper_vfp_fcvt_f16_to_f32(tmp2, tmp2, fpst, ahp);
+    neon_store_reg(a->vd, 3, tmp2);
+    tcg_temp_free_i32(ahp);
+    tcg_temp_free_ptr(fpst);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 94d5e34fff4..1ea09695546 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4860,7 +4860,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int pass;
     int u;
     int vec_size;
-    TCGv_i32 tmp, tmp2, tmp3;
+    TCGv_i32 tmp, tmp2;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return 1;
@@ -4927,6 +4927,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 case NEON_2RM_VZIP:
                 case NEON_2RM_VMOVN: case NEON_2RM_VQMOVN:
                 case NEON_2RM_VSHLL:
+                case NEON_2RM_VCVT_F16_F32:
+                case NEON_2RM_VCVT_F32_F16:
                     /* handled by decodetree */
                     return 1;
                 case NEON_2RM_VTRN:
@@ -4942,67 +4944,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         goto elementwise;
                     }
                     break;
-                case NEON_2RM_VCVT_F16_F32:
-                {
-                    TCGv_ptr fpst;
-                    TCGv_i32 ahp;
-
-                    if (!dc_isar_feature(aa32_fp16_spconv, s) ||
-                        q || (rm & 1)) {
-                        return 1;
-                    }
-                    fpst = get_fpstatus_ptr(true);
-                    ahp = get_ahp_flag();
-                    tmp = neon_load_reg(rm, 0);
-                    gen_helper_vfp_fcvt_f32_to_f16(tmp, tmp, fpst, ahp);
-                    tmp2 = neon_load_reg(rm, 1);
-                    gen_helper_vfp_fcvt_f32_to_f16(tmp2, tmp2, fpst, ahp);
-                    tcg_gen_shli_i32(tmp2, tmp2, 16);
-                    tcg_gen_or_i32(tmp2, tmp2, tmp);
-                    tcg_temp_free_i32(tmp);
-                    tmp = neon_load_reg(rm, 2);
-                    gen_helper_vfp_fcvt_f32_to_f16(tmp, tmp, fpst, ahp);
-                    tmp3 = neon_load_reg(rm, 3);
-                    neon_store_reg(rd, 0, tmp2);
-                    gen_helper_vfp_fcvt_f32_to_f16(tmp3, tmp3, fpst, ahp);
-                    tcg_gen_shli_i32(tmp3, tmp3, 16);
-                    tcg_gen_or_i32(tmp3, tmp3, tmp);
-                    neon_store_reg(rd, 1, tmp3);
-                    tcg_temp_free_i32(tmp);
-                    tcg_temp_free_i32(ahp);
-                    tcg_temp_free_ptr(fpst);
-                    break;
-                }
-                case NEON_2RM_VCVT_F32_F16:
-                {
-                    TCGv_ptr fpst;
-                    TCGv_i32 ahp;
-                    if (!dc_isar_feature(aa32_fp16_spconv, s) ||
-                        q || (rd & 1)) {
-                        return 1;
-                    }
-                    fpst = get_fpstatus_ptr(true);
-                    ahp = get_ahp_flag();
-                    tmp3 = tcg_temp_new_i32();
-                    tmp = neon_load_reg(rm, 0);
-                    tmp2 = neon_load_reg(rm, 1);
-                    tcg_gen_ext16u_i32(tmp3, tmp);
-                    gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
-                    neon_store_reg(rd, 0, tmp3);
-                    tcg_gen_shri_i32(tmp, tmp, 16);
-                    gen_helper_vfp_fcvt_f16_to_f32(tmp, tmp, fpst, ahp);
-                    neon_store_reg(rd, 1, tmp);
-                    tmp3 = tcg_temp_new_i32();
-                    tcg_gen_ext16u_i32(tmp3, tmp2);
-                    gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
-                    neon_store_reg(rd, 2, tmp3);
-                    tcg_gen_shri_i32(tmp2, tmp2, 16);
-                    gen_helper_vfp_fcvt_f16_to_f32(tmp2, tmp2, fpst, ahp);
-                    neon_store_reg(rd, 3, tmp2);
-                    tcg_temp_free_i32(ahp);
-                    tcg_temp_free_ptr(fpst);
-                    break;
-                }
                 case NEON_2RM_AESE: case NEON_2RM_AESMC:
                     if (!dc_isar_feature(aa32_aes, s) || ((rm | rd) & 1)) {
                         return 1;
-- 
2.20.1

