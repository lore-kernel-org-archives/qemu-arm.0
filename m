Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1689899lfc;
        Fri, 28 Aug 2020 11:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRZwpu9YMax7Qg3ywo6EaUsF9Ww85TweZrlP0S7wVGF2bChv0hgzO/OuMvvmLDMnKdJCWu
X-Received: by 2002:a25:846:: with SMTP id 67mr4264215ybi.474.1598639823970;
        Fri, 28 Aug 2020 11:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598639823; cv=none;
        d=google.com; s=arc-20160816;
        b=0AgeV614P2r8pvCgWtaXcMA0YammdNcXstDc1McR6c6I3pJE68Y442MhGWDLLqFUnX
         gUXIuYO7OAeUutQJKa+KpY6MsdU6CvQdGd623LCwMC6JwaoIOmRYRqjbibvaHaQwr2Ma
         mk8zoRp4Op05VMdHyklVa1BLdyqnnSxJW1THCFZBzuXvb2L0lubtX/rDrOAt/gwngPzV
         PKZ7UnTZQPcue3wMbcBacYlGUCh3xiEF+BcXcTtf9G+ofna0+Ro8eop7ainILxkcWeH+
         ye/kRTyLydOlrAw+2/SROQalBSrWODDKSvI2UcvSAy12h+l1N77KrGjFTJVKPWnvhbSG
         ezBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=h8Y81SV2BHJwRYSGbiFUoFZOvLcZcRtp+4/jdrQZKg4=;
        b=IHOuf0ovSDHX6D8ohCBURnKtt84W036RHH4xfaA+8OHtQuNh78j7QGflRYFpoOHPo1
         Yx4hkj/HyhjiJLKGH1Mkp2y9W/wDU/7Gg6NGi8zENic9aiT0A3qcftGwiMV3h648QWFh
         rTkrv4S2IFx11zOBiZdCkpzP88gDQ9diqD2K7YRO+K0Wija5i1bh7xFLDwJlSLpPexp9
         uh5+qu9AJE2tzaPeO60tMA153m6LAQ7OCdTm0uHDzof59fw2MCu9CYXxzBJzMYryzMM4
         5THGQ86JzbcAT/Zgn0UtmZZ/og266bfhSEhr6fzhOWkioMqf7c3PpvunVGMQgLpkQjJw
         +s/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pIPsQw2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h141si66115ybg.294.2020.08.28.11.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:37:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pIPsQw2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjFH-0006bV-3Z
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCc-0002GD-W8
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:32970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCT-0005wc-0a
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id y8so186221wma.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h8Y81SV2BHJwRYSGbiFUoFZOvLcZcRtp+4/jdrQZKg4=;
 b=pIPsQw2W5nNBtsNekCqVE07DOtKo4R1xOGYF4BJVEUIMAU/bdOPd5L15dEPs4yGUMv
 pRtju7cFmTqtUS0oUG1kba4lupoYhndTjpPU3Xmw7k0rLAhxTxnsl4i96oQw1svcVSDc
 GRAPnQUafxnl6revSROzsCffxg37lSUwdAiYfVuL80awKRDMi+s4DyxXWcYCT4aR9zeC
 VqjVC1MYA19b6iASmSzdc0bz7o7yoSInK3eGgKldLmH8lzkqSevfHxdHfWtHgBy3bl1F
 XktQOI4N1VxcnJmbYHJjnWm6oCM3gEuF2B8HQtQ8RZN0KSaMMUzXs7KtLasLWE9ZxrKI
 nifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8Y81SV2BHJwRYSGbiFUoFZOvLcZcRtp+4/jdrQZKg4=;
 b=DpajVrafADL3VkipwHfsErW6gWJBQuOvMLnYPOZDHYgCKAfiS7F10k5ilzIwvEuigq
 orawvyKdZb2f25eNDPE5aMWKxkmUq2R6jMt6D0XBXdgvzJ34nrIOj5bcclwIccun5Ph6
 WQKKmrYFQyRr0xubneLl+YAR5gvWxPZ3uivX4i7NFQOEoSwlyysazjjHq8O4seAp+7Gq
 96PJbdfsEYDZx2J1qH8KEhOQfDXIaECFNuzWiI8PRbtSgEEL5ZjcTX85fs+cXcne75Qp
 o7xtNexY9TYbbQ4Bac7PRnm7bVu9LnWWTxaBW70ggHZ5ZxV7oFNn1aKPvpUNmtKDoDDj
 fcLg==
X-Gm-Message-State: AOAM530OvrSfoydE9DJ/lcRSHLG1xK59xgL15AMwI9C2Khy+gis/BKEy
 jb6A+eW10K0eeJxUmQIcf3UZNphYbgln+/sj
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr24767wmh.31.1598639646597;
 Fri, 28 Aug 2020 11:34:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/45] target/arm: Implement VFP fp16 for VABS, VNEG, VSQRT
Date: Fri, 28 Aug 2020 19:33:17 +0100
Message-Id: <20200828183354.27913-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: oCUzqdUc7Wom

Implement VFP fp16 for VABS, VNEG and VSQRT. This is all
the fp16 insns that use the DO_VFP_2OP macro, because there
is no fp16 version of VMOV_reg.

Notes:
 * the gen_helper_vfp_negh already exists as we needed to create
   it for the fp16 multiply-add insns
 * as usual we need to use the f16 version of the fp_status;
   this is only relevant for VSQRT

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  2 ++
 target/arm/vfp.decode          |  3 +++
 target/arm/vfp_helper.c        | 10 +++++++++
 target/arm/translate-vfp.c.inc | 40 ++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 538b1a20ce5..37739b0e788 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -128,8 +128,10 @@ DEF_HELPER_3(vfp_minnumd, f64, f64, f64, ptr)
 DEF_HELPER_1(vfp_negh, f16, f16)
 DEF_HELPER_1(vfp_negs, f32, f32)
 DEF_HELPER_1(vfp_negd, f64, f64)
+DEF_HELPER_1(vfp_absh, f16, f16)
 DEF_HELPER_1(vfp_abss, f32, f32)
 DEF_HELPER_1(vfp_absd, f64, f64)
+DEF_HELPER_2(vfp_sqrth, f16, f16, env)
 DEF_HELPER_2(vfp_sqrts, f32, f32, env)
 DEF_HELPER_2(vfp_sqrtd, f64, f64, env)
 DEF_HELPER_3(vfp_cmps, void, f32, f32, env)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index af4829e201b..5c64701dde0 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -162,12 +162,15 @@ VMOV_imm_dp  ---- 1110 1.11 .... .... 1011 0000 .... \
 VMOV_reg_sp  ---- 1110 1.11 0000 .... 1010 01.0 ....        @vfp_dm_ss
 VMOV_reg_dp  ---- 1110 1.11 0000 .... 1011 01.0 ....        @vfp_dm_dd
 
+VABS_hp      ---- 1110 1.11 0000 .... 1001 11.0 ....        @vfp_dm_ss
 VABS_sp      ---- 1110 1.11 0000 .... 1010 11.0 ....        @vfp_dm_ss
 VABS_dp      ---- 1110 1.11 0000 .... 1011 11.0 ....        @vfp_dm_dd
 
+VNEG_hp      ---- 1110 1.11 0001 .... 1001 01.0 ....        @vfp_dm_ss
 VNEG_sp      ---- 1110 1.11 0001 .... 1010 01.0 ....        @vfp_dm_ss
 VNEG_dp      ---- 1110 1.11 0001 .... 1011 01.0 ....        @vfp_dm_dd
 
+VSQRT_hp     ---- 1110 1.11 0001 .... 1001 11.0 ....        @vfp_dm_ss
 VSQRT_sp     ---- 1110 1.11 0001 .... 1010 11.0 ....        @vfp_dm_ss
 VSQRT_dp     ---- 1110 1.11 0001 .... 1011 11.0 ....        @vfp_dm_dd
 
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 579ca3832d1..cc7fb6ddb6a 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -276,6 +276,11 @@ float64 VFP_HELPER(neg, d)(float64 a)
     return float64_chs(a);
 }
 
+dh_ctype_f16 VFP_HELPER(abs, h)(dh_ctype_f16 a)
+{
+    return float16_abs(a);
+}
+
 float32 VFP_HELPER(abs, s)(float32 a)
 {
     return float32_abs(a);
@@ -286,6 +291,11 @@ float64 VFP_HELPER(abs, d)(float64 a)
     return float64_abs(a);
 }
 
+dh_ctype_f16 VFP_HELPER(sqrt, h)(dh_ctype_f16 a, CPUARMState *env)
+{
+    return float16_sqrt(a, &env->vfp.fp_status_f16);
+}
+
 float32 VFP_HELPER(sqrt, s)(float32 a, CPUARMState *env)
 {
     return float32_sqrt(a, &env->vfp.fp_status);
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f891d860bb9..99b722b75bd 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1469,6 +1469,38 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
     return true;
 }
 
+static bool do_vfp_2op_hp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
+{
+    /*
+     * Do a half-precision operation. Functionally this is
+     * the same as do_vfp_2op_sp(), except:
+     *  - it doesn't need the VFP vector handling (fp16 is a
+     *    v8 feature, and in v8 VFP vectors don't exist)
+     *  - it does the aa32_fp16_arith feature test
+     */
+    TCGv_i32 f0;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (s->vec_len != 0 || s->vec_stride != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    f0 = tcg_temp_new_i32();
+    neon_load_reg32(f0, vm);
+    fn(f0, f0);
+    neon_store_reg32(f0, vd);
+    tcg_temp_free_i32(f0);
+
+    return true;
+}
+
 static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
 {
     uint32_t delta_m = 0;
@@ -2244,12 +2276,19 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
 DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32)
 DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64)
 
+DO_VFP_2OP(VABS, hp, gen_helper_vfp_absh)
 DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss)
 DO_VFP_2OP(VABS, dp, gen_helper_vfp_absd)
 
+DO_VFP_2OP(VNEG, hp, gen_helper_vfp_negh)
 DO_VFP_2OP(VNEG, sp, gen_helper_vfp_negs)
 DO_VFP_2OP(VNEG, dp, gen_helper_vfp_negd)
 
+static void gen_VSQRT_hp(TCGv_i32 vd, TCGv_i32 vm)
+{
+    gen_helper_vfp_sqrth(vd, vm, cpu_env);
+}
+
 static void gen_VSQRT_sp(TCGv_i32 vd, TCGv_i32 vm)
 {
     gen_helper_vfp_sqrts(vd, vm, cpu_env);
@@ -2260,6 +2299,7 @@ static void gen_VSQRT_dp(TCGv_i64 vd, TCGv_i64 vm)
     gen_helper_vfp_sqrtd(vd, vm, cpu_env);
 }
 
+DO_VFP_2OP(VSQRT, hp, gen_VSQRT_hp)
 DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp)
 DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp)
 
-- 
2.20.1

