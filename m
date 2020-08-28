Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1693108lfc;
        Fri, 28 Aug 2020 11:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI57PvOruLdGMlAm6pQMpdPcClAjp3pBhKTWyB/0o+2bAT5eh2U2OxjMxGRBlfl0T6Cyl5
X-Received: by 2002:a25:a423:: with SMTP id f32mr4760390ybi.69.1598640161059;
        Fri, 28 Aug 2020 11:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640161; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbZ7etPc8yjez8AYf8tTdR2x2yFc5zN+r4QUVW+ocgRFro980WWVmFuEmWqfrWmbC0
         hFsiPBFoheD7KbXtrsaSNS/+BETEHfhJEz+Ps3MlAggFZcuNB3N+RJTaTO1mthuGSeCD
         zXn6JEjHt0k5hqpbuf+eRqSN9T6BgU21wqod4yENF6vy7OnkUs3drvpR3XyHM/txrKb2
         tPaAHYGNqToFMXmYmLQCsCVSflh+o4w65hqGjmpgWAK8C74E8rw0WeS6iZlxVRNQTO53
         6/r2eeFZGrfbHjS1vZ6frLrvJ7pnoG0wesw7Ahb3Kax00nJ4gRXAWy8cni610KRFv8n1
         GiVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L3poJgA9EWLGwO8d4CxrPwuuiVol61jXvpwTOON3sKg=;
        b=RJ/CedlKhz24NbdLD8UB4SH1oUOg7I1XAd9G6Ce5tvhokKEPlM0sU3loE3Bbw165pB
         TZRmtMC6P//WTzdkC8V1favgqYaCVOJJj+pa0tQBO/lk22PehckfQdtSxA1FXDsZ2QiG
         tSC1Q91jyruFzCPiNFeEtYIjMoHxe9AE1HkyRiVNvjD1Xcc8jYfVGGqRQtRPYHjzUe5s
         cVl8qNpVDoc3bLr225JygGxZcc2Uwz87j/cxdTpifN/gxaKKa70/CydMooNjLnoj4LRD
         mZz3KC31hw6GwJ5VoPrLlKxfr+TzT5sieAscjyXrHFpcJwk3QUxCar9ftNzQx60v8Oxm
         g5/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSWQfvjE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si63693ybd.491.2020.08.28.11.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSWQfvjE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjKi-0006qb-DB
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCl-0002bz-4y
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:27 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCe-0005zN-Ex
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:26 -0400
Received: by mail-wm1-x342.google.com with SMTP id q9so127077wmj.2
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L3poJgA9EWLGwO8d4CxrPwuuiVol61jXvpwTOON3sKg=;
 b=MSWQfvjEf+7m+hu8bnOdQTtgNOGmMpiFKxcPI/x7f3ZZcrA/JhEivQd+Qz9rQlzZMi
 h4KDyw+8If98lqT3w7rlN/apXSDKRSd5X1piAbgTxNUtY+KIn3fNRfl88KPra425n/8P
 Nod9flFg0Z7UzUVsEkGvTE75xFUhCHpjCgXAiFfEioMU5wtZdOiitAtoY+HitisAbT5z
 fmd5lelzoFPErd12QyQ76rzqo4qtPlol54SuDEqnGNVKDxHUwp9E6o3Thsvka8RSOrq6
 hvaHRZXfRLgYOJ2q3evKEZhGSBktRJklrr49bOTW66XQ6Q7AqdrQ3z97LcCoubc360dR
 L2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3poJgA9EWLGwO8d4CxrPwuuiVol61jXvpwTOON3sKg=;
 b=AwuEh4xyfBSPd5uea84g7wnej4HEFlXEoy6+JJZpN/F3+68Jn172ffHbn/biwHko+Y
 Kyf4DTXYAmUl+hUdJDuMRYUp245eZns3zpyi1PoaNLau8QYFVATVRSjpKT0Wlq/8UD2k
 nQLVoeEnGlw2mIl0LNMVClHfJeovXR+qbOFbfcR0T86vH/Hhh3Y4nJ0Ag8xCV3EF4fuS
 qZu1dsjImPYUdPqcMKnjgKkHbzQF1QL44LaH/sV6IlPpl2Cu9ol8lRCwnq8jAbMwqbPZ
 KEMsliojwtMlEmJxSXosFadQenQf+315f3fv67jgaoRYEvskty+KueBDCX3HmWkRxc/q
 kGYA==
X-Gm-Message-State: AOAM531OV12cKSfYzKRcg0lvu5/wQ3kVcwNTbdVCkj62LgHz81vAvXWq
 Hs7RH+8G2zbnldJz8ZZuI6Vm0mU0zzM03UML
X-Received: by 2002:a1c:2543:: with SMTP id l64mr37589wml.96.1598639658610;
 Fri, 28 Aug 2020 11:34:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 18/45] target/arm: Implement VFP fp16 VRINT*
Date: Fri, 28 Aug 2020 19:33:27 +0100
Message-Id: <20200828183354.27913-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uMmHxZac6Zjs

Implement the fp16 version of the VFP VRINT* insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  2 +
 target/arm/vfp-uncond.decode   |  6 ++-
 target/arm/vfp.decode          |  3 ++
 target/arm/vfp_helper.c        | 21 ++++++++
 target/arm/translate-vfp.c.inc | 98 +++++++++++++++++++++++++++++++---
 5 files changed, 122 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 03193728476..f5ad5088bf1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -242,8 +242,10 @@ DEF_HELPER_3(shr_cc, i32, env, i32, i32)
 DEF_HELPER_3(sar_cc, i32, env, i32, i32)
 DEF_HELPER_3(ror_cc, i32, env, i32, i32)
 
+DEF_HELPER_FLAGS_2(rinth_exact, TCG_CALL_NO_RWG, f16, f16, ptr)
 DEF_HELPER_FLAGS_2(rints_exact, TCG_CALL_NO_RWG, f32, f32, ptr)
 DEF_HELPER_FLAGS_2(rintd_exact, TCG_CALL_NO_RWG, f64, f64, ptr)
+DEF_HELPER_FLAGS_2(rinth, TCG_CALL_NO_RWG, f16, f16, ptr)
 DEF_HELPER_FLAGS_2(rints, TCG_CALL_NO_RWG, f32, f32, ptr)
 DEF_HELPER_FLAGS_2(rintd, TCG_CALL_NO_RWG, f64, f64, ptr)
 
diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index 8ba7b1703e0..9615544623a 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -60,10 +60,12 @@ VMINNM_sp   1111 1110 1.00 .... .... 1010 .1.0 ....         @vfp_dnm_s
 VMAXNM_dp   1111 1110 1.00 .... .... 1011 .0.0 ....         @vfp_dnm_d
 VMINNM_dp   1111 1110 1.00 .... .... 1011 .1.0 ....         @vfp_dnm_d
 
+VRINT       1111 1110 1.11 10 rm:2 .... 1001 01.0 .... \
+            vm=%vm_sp vd=%vd_sp sz=1
 VRINT       1111 1110 1.11 10 rm:2 .... 1010 01.0 .... \
-            vm=%vm_sp vd=%vd_sp dp=0
+            vm=%vm_sp vd=%vd_sp sz=2
 VRINT       1111 1110 1.11 10 rm:2 .... 1011 01.0 .... \
-            vm=%vm_dp vd=%vd_dp dp=1
+            vm=%vm_dp vd=%vd_dp sz=3
 
 # VCVT float to int with specified rounding mode; Vd is always single-precision
 VCVT        1111 1110 1.11 11 rm:2 .... 1001 op:1 1.0 .... \
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index a8f1137be1e..9a79e99f1b0 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -195,12 +195,15 @@ VCVT_f16_f32 ---- 1110 1.11 0011 .... 1010 t:1 1.0 .... \
 VCVT_f16_f64 ---- 1110 1.11 0011 .... 1011 t:1 1.0 .... \
              vd=%vd_sp vm=%vm_dp
 
+VRINTR_hp    ---- 1110 1.11 0110 .... 1001 01.0 ....        @vfp_dm_ss
 VRINTR_sp    ---- 1110 1.11 0110 .... 1010 01.0 ....        @vfp_dm_ss
 VRINTR_dp    ---- 1110 1.11 0110 .... 1011 01.0 ....        @vfp_dm_dd
 
+VRINTZ_hp    ---- 1110 1.11 0110 .... 1001 11.0 ....        @vfp_dm_ss
 VRINTZ_sp    ---- 1110 1.11 0110 .... 1010 11.0 ....        @vfp_dm_ss
 VRINTZ_dp    ---- 1110 1.11 0110 .... 1011 11.0 ....        @vfp_dm_dd
 
+VRINTX_hp    ---- 1110 1.11 0111 .... 1001 01.0 ....        @vfp_dm_ss
 VRINTX_sp    ---- 1110 1.11 0111 .... 1010 01.0 ....        @vfp_dm_ss
 VRINTX_dp    ---- 1110 1.11 0111 .... 1011 01.0 ....        @vfp_dm_dd
 
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index ab3f0b170a7..586dfd22e5e 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1019,6 +1019,11 @@ float64 VFP_HELPER(muladd, d)(float64 a, float64 b, float64 c, void *fpstp)
 }
 
 /* ARMv8 round to integral */
+dh_ctype_f16 HELPER(rinth_exact)(dh_ctype_f16 x, void *fp_status)
+{
+    return float16_round_to_int(x, fp_status);
+}
+
 float32 HELPER(rints_exact)(float32 x, void *fp_status)
 {
     return float32_round_to_int(x, fp_status);
@@ -1029,6 +1034,22 @@ float64 HELPER(rintd_exact)(float64 x, void *fp_status)
     return float64_round_to_int(x, fp_status);
 }
 
+dh_ctype_f16 HELPER(rinth)(dh_ctype_f16 x, void *fp_status)
+{
+    int old_flags = get_float_exception_flags(fp_status), new_flags;
+    float16 ret;
+
+    ret = float16_round_to_int(x, fp_status);
+
+    /* Suppress any inexact exceptions the conversion produced */
+    if (!(old_flags & float_flag_inexact)) {
+        new_flags = get_float_exception_flags(fp_status);
+        set_float_exception_flags(new_flags & ~float_flag_inexact, fp_status);
+    }
+
+    return ret;
+}
+
 float32 HELPER(rints)(float32 x, void *fp_status)
 {
     int old_flags = get_float_exception_flags(fp_status), new_flags;
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 869b67b2b93..7ce044fa896 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -341,7 +341,7 @@ static const uint8_t fp_decode_rm[] = {
 static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
 {
     uint32_t rd, rm;
-    bool dp = a->dp;
+    int sz = a->sz;
     TCGv_ptr fpst;
     TCGv_i32 tcg_rmode;
     int rounding = fp_decode_rm[a->rm];
@@ -350,12 +350,16 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         return false;
     }
 
-    if (dp && !dc_isar_feature(aa32_fpdp_v2, s)) {
+    if (sz == 3 && !dc_isar_feature(aa32_fpdp_v2, s)) {
+        return false;
+    }
+
+    if (sz == 1 && !dc_isar_feature(aa32_fp16_arith, s)) {
         return false;
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_simd_r32, s) &&
+    if (sz == 3 && !dc_isar_feature(aa32_simd_r32, s) &&
         ((a->vm | a->vd) & 0x10)) {
         return false;
     }
@@ -367,12 +371,16 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         return true;
     }
 
-    fpst = fpstatus_ptr(FPST_FPCR);
+    if (sz == 1) {
+        fpst = fpstatus_ptr(FPST_FPCR_F16);
+    } else {
+        fpst = fpstatus_ptr(FPST_FPCR);
+    }
 
     tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
 
-    if (dp) {
+    if (sz == 3) {
         TCGv_i64 tcg_op;
         TCGv_i64 tcg_res;
         tcg_op = tcg_temp_new_i64();
@@ -388,7 +396,11 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         tcg_op = tcg_temp_new_i32();
         tcg_res = tcg_temp_new_i32();
         neon_load_reg32(tcg_op, rm);
-        gen_helper_rints(tcg_res, tcg_op, fpst);
+        if (sz == 1) {
+            gen_helper_rinth(tcg_res, tcg_op, fpst);
+        } else {
+            gen_helper_rints(tcg_res, tcg_op, fpst);
+        }
         neon_store_reg32(tcg_res, rd);
         tcg_temp_free_i32(tcg_op);
         tcg_temp_free_i32(tcg_res);
@@ -2638,6 +2650,29 @@ static bool trans_VCVT_f16_f64(DisasContext *s, arg_VCVT_f16_f64 *a)
     return true;
 }
 
+static bool trans_VRINTR_hp(DisasContext *s, arg_VRINTR_sp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i32();
+    neon_load_reg32(tmp, a->vm);
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    gen_helper_rinth(tmp, tmp, fpst);
+    neon_store_reg32(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
 static bool trans_VRINTR_sp(DisasContext *s, arg_VRINTR_sp *a)
 {
     TCGv_ptr fpst;
@@ -2693,6 +2728,34 @@ static bool trans_VRINTR_dp(DisasContext *s, arg_VRINTR_dp *a)
     return true;
 }
 
+static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+    TCGv_i32 tcg_rmode;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i32();
+    neon_load_reg32(tmp, a->vm);
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_helper_rinth(tmp, tmp, fpst);
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    neon_store_reg32(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tcg_rmode);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
 static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
 {
     TCGv_ptr fpst;
@@ -2758,6 +2821,29 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     return true;
 }
 
+static bool trans_VRINTX_hp(DisasContext *s, arg_VRINTX_sp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i32();
+    neon_load_reg32(tmp, a->vm);
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    gen_helper_rinth_exact(tmp, tmp, fpst);
+    neon_store_reg32(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
 static bool trans_VRINTX_sp(DisasContext *s, arg_VRINTX_sp *a)
 {
     TCGv_ptr fpst;
-- 
2.20.1

