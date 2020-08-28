Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1690026lfc;
        Fri, 28 Aug 2020 11:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR5O1Yu4tZIOF3amTZGSF//TCRgZmvfUQcbA4Le8gacRCdu5ksWRG6UTtzz058hy2iUnfa
X-Received: by 2002:a25:cc43:: with SMTP id l64mr3953410ybf.289.1598639837268;
        Fri, 28 Aug 2020 11:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598639837; cv=none;
        d=google.com; s=arc-20160816;
        b=qGztpaUoD/zjmd32faZ8dUefTEpz1ZCm+fLLTfFXbo3L6LPjGrgnaQEGr1NnijS1ih
         aXxrENwcV2ZgAENTIGg2BCrLr32aKLrVndMvFpwgrqwCD6Dn4P50RoyiLbEg9GAFywmX
         MgI6UabWM1q8t/gpTqQeB213grDj9D/AxzCvQ+RKlP9dhyAbGe3GRG+y8IAvX8BVtqEg
         vlCYu/W4ub+mtxhZ7pZMtxtOuyb9HbxSG0fGOwWI+0f6404iEeuYDpBVrSJkWvw3lUnR
         IrsA5DhFzWgWBYYx6Z/cwdz1tfgH7UTKrg7MPYWZVuQIN/LaeVDvtw5vz8fhLjZWuuOc
         JMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CYOYh3fW4PMtwewY4tYeCU7uwNMTYjLcjrUorSe/iMI=;
        b=MU7LtOilACaJHZBbcDVMOQ5qCJt3cWOZvIld0zwoi8gLS9m8YY+X5wY/QW/2nRAdSh
         S0KbZpZ/f3iw9TlEt5mG1eHhme+fDpUgcAp30LOQ+BN0vJNeoIfYXcizh79KDnkwLjZh
         wTPCeimEz0eUN5fvK7+pd3BDnsIfXPU1SSuboLTFgri9ZtCkmi8/eWvaYJotPV4VNb2O
         OzqGf9ew7zcgrRp0Y+vfNNFPXTkw19Jrg+sR2gcqruFJxX2oxuqrbykOog0guGNwwxJz
         gHvfOmb+QHZmdhtbr9WmL/0viniFiwVWuXVUnAbOcTVyjoSZtHl+jP3fU4pk5B+ielnC
         lZmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ya31YZ8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o186si64433ybo.358.2020.08.28.11.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ya31YZ8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjFU-00072R-6h
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCd-0002Hj-Kt
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:19 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCV-0005xA-RG
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:19 -0400
Received: by mail-wr1-x444.google.com with SMTP id w13so59308wrk.5
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CYOYh3fW4PMtwewY4tYeCU7uwNMTYjLcjrUorSe/iMI=;
 b=ya31YZ8f5yFp00c6dD9HQ88r9RGZmTwgM00z70UaI2YV8ftstFV8jvbWIdelG0AjfQ
 TKZ9Ygy2oUCChYvVV6zzdMnMUv27VrpA4vgGMZEenFLjlYnB7vbkEh5uoATlojiWQiT5
 SHcooCTYUJetKWXs7BE2TE4k6TSMJEgkfbPFR06e9ao5K4gUeJyBB5W+LaeeR7swh/KS
 i67tcTwLAAfPVVWOc7KobuheKeVcjCt+I4q10BrtGsyEzYDcqsGeiPVzYhFclXzZmb/m
 ryvk6m6ySjH3TNdCxjoEkddjN55Wem+8W1NYkcuCzdKKKPb1xbfTI6DPsJ5m7rTkFrcb
 EGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYOYh3fW4PMtwewY4tYeCU7uwNMTYjLcjrUorSe/iMI=;
 b=t2ZujTO9Yt2pAodAUOIHyKgEkYX6w8owOqVQzzT6+2BgGRbTPsT8GGvybXi/WHXX+G
 3JJXirGfF2a7N85h8YRljrO15w6Jq7UFQp8pqzY5Zqd2h+xWdF7MWQ6qv3JRMgdu/TM3
 ccjfEziUPiHpDvt+z2KXZPAjWKufecY2EZpi2Pp6pY1IPDMb2N/OTMiGC9rjzShBcCp7
 WU53/xcCQvDqAlJDlYTwTwToJUOdSDXgIonjbLZsw72UhSM4Ng8n3xzo1BewlVIPIU0O
 2Gs5JWp/XmpKOJzt6XZAtx7mxeMIzq50ugvr+rdnV3eKpEtkO24f79UbhAogbx/hX++Y
 FZdg==
X-Gm-Message-State: AOAM533ADWBOq24yszOrVuU/qbaDnJFNNrlwqCLyo+s41ZOilMEWEROX
 zcSyrJSbXygZFO71Km8a/xYSIlg1yeIqiCgS
X-Received: by 2002:a5d:61d2:: with SMTP id q18mr263136wrv.404.1598639648946; 
 Fri, 28 Aug 2020 11:34:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/45] target/arm: Implement VFP fp16 VCMP
Date: Fri, 28 Aug 2020 19:33:19 +0100
Message-Id: <20200828183354.27913-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KzqatNIIu35G

Implement fp16 version of VCMP.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  2 ++
 target/arm/vfp.decode          |  2 ++
 target/arm/vfp_helper.c        | 15 +++++++------
 target/arm/translate-vfp.c.inc | 39 ++++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 37739b0e788..18afad634c9 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -134,8 +134,10 @@ DEF_HELPER_1(vfp_absd, f64, f64)
 DEF_HELPER_2(vfp_sqrth, f16, f16, env)
 DEF_HELPER_2(vfp_sqrts, f32, f32, env)
 DEF_HELPER_2(vfp_sqrtd, f64, f64, env)
+DEF_HELPER_3(vfp_cmph, void, f16, f16, env)
 DEF_HELPER_3(vfp_cmps, void, f32, f32, env)
 DEF_HELPER_3(vfp_cmpd, void, f64, f64, env)
+DEF_HELPER_3(vfp_cmpeh, void, f16, f16, env)
 DEF_HELPER_3(vfp_cmpes, void, f32, f32, env)
 DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
 
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index c898183771b..b213da4b55d 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -176,6 +176,8 @@ VSQRT_hp     ---- 1110 1.11 0001 .... 1001 11.0 ....        @vfp_dm_ss
 VSQRT_sp     ---- 1110 1.11 0001 .... 1010 11.0 ....        @vfp_dm_ss
 VSQRT_dp     ---- 1110 1.11 0001 .... 1011 11.0 ....        @vfp_dm_dd
 
+VCMP_hp      ---- 1110 1.11 010 z:1 .... 1001 e:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
 VCMP_sp      ---- 1110 1.11 010 z:1 .... 1010 e:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCMP_dp      ---- 1110 1.11 010 z:1 .... 1011 e:1 1.0 .... \
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index cc7fb6ddb6a..55aa38f0ce8 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -330,19 +330,20 @@ static void softfloat_to_vfp_compare(CPUARMState *env, FloatRelation cmp)
 }
 
 /* XXX: check quiet/signaling case */
-#define DO_VFP_cmp(p, type) \
-void VFP_HELPER(cmp, p)(type a, type b, CPUARMState *env)  \
+#define DO_VFP_cmp(P, FLOATTYPE, ARGTYPE, FPST) \
+void VFP_HELPER(cmp, P)(ARGTYPE a, ARGTYPE b, CPUARMState *env)  \
 { \
     softfloat_to_vfp_compare(env, \
-        type ## _compare_quiet(a, b, &env->vfp.fp_status)); \
+        FLOATTYPE ## _compare_quiet(a, b, &env->vfp.FPST)); \
 } \
-void VFP_HELPER(cmpe, p)(type a, type b, CPUARMState *env) \
+void VFP_HELPER(cmpe, P)(ARGTYPE a, ARGTYPE b, CPUARMState *env) \
 { \
     softfloat_to_vfp_compare(env, \
-        type ## _compare(a, b, &env->vfp.fp_status)); \
+        FLOATTYPE ## _compare(a, b, &env->vfp.FPST)); \
 }
-DO_VFP_cmp(s, float32)
-DO_VFP_cmp(d, float64)
+DO_VFP_cmp(h, float16, dh_ctype_f16, fp_status_f16)
+DO_VFP_cmp(s, float32, float32, fp_status)
+DO_VFP_cmp(d, float64, float64, fp_status)
 #undef DO_VFP_cmp
 
 /* Integer to float and float to integer conversions */
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index c864178ad4e..00a6363e1e1 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -2325,6 +2325,45 @@ DO_VFP_2OP(VSQRT, hp, gen_VSQRT_hp)
 DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp)
 DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp)
 
+static bool trans_VCMP_hp(DisasContext *s, arg_VCMP_sp *a)
+{
+    TCGv_i32 vd, vm;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    /* Vm/M bits must be zero for the Z variant */
+    if (a->z && a->vm != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vd = tcg_temp_new_i32();
+    vm = tcg_temp_new_i32();
+
+    neon_load_reg32(vd, a->vd);
+    if (a->z) {
+        tcg_gen_movi_i32(vm, 0);
+    } else {
+        neon_load_reg32(vm, a->vm);
+    }
+
+    if (a->e) {
+        gen_helper_vfp_cmpeh(vd, vm, cpu_env);
+    } else {
+        gen_helper_vfp_cmph(vd, vm, cpu_env);
+    }
+
+    tcg_temp_free_i32(vd);
+    tcg_temp_free_i32(vm);
+
+    return true;
+}
+
 static bool trans_VCMP_sp(DisasContext *s, arg_VCMP_sp *a)
 {
     TCGv_i32 vd, vm;
-- 
2.20.1

