Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2607904lfy;
        Mon, 24 Aug 2020 07:32:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxckyYXp7zmaWrO5XSorFxSn528SRcci37lItpcXJbuCS2D4zC5qW/f0zGbSEHOdcr3YS06
X-Received: by 2002:a25:db03:: with SMTP id g3mr7770589ybf.373.1598279534259;
        Mon, 24 Aug 2020 07:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279534; cv=none;
        d=google.com; s=arc-20160816;
        b=XUFyc3c59FDhPpoyKNuMc3G3A3MJBUBhi2k+jOyw+KMTHpFHqU9v9zudpr6zKcD474
         lRt+Fuk7Y/UiUmAp+6MpXWsp2jC/0LUZzC7eIxHflmWWGJqm1sswZk993hEChUWHEkzA
         eVe0il2Td2YHJC4p7w5jtrG24YW1iqU1bwmB0YqelA1VvwLlF5NY1xK9S/mi3pprzmTx
         4up/ZqRMEDnntBRd/9+NS6yj7hBxXKyUVff5lrrLbwxzeHuKgZ97JAjZaAvC1EVuOA9I
         Uu7N4T46nOfqyuWZI2B1nOI4bmhIka9JXRwS3oQ+nV1R9BLkVMBx8zbNcJiw8bbx0EP8
         /+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V+kRX7a2XiYIEF+wLaciE51YCWSx382IErtFW6/uTrw=;
        b=CKclJlttug1zXx+iY2dI4ttHVfcyzVhB7hfL8OPvY7rSOJqMz+VDRR0nHaTf3GH6Id
         nIXK252a4AxGfahZyerLvHSuKaIqELW+hJbFENuj5mrLhxz4HHMYZ5rPeg0adkQigL2H
         I/WcDM9LfaKVAKbN6khLVjurnTbsTEdk6ptWp8/QQL4HionMY1c9nh2vEkvLV/Oq7ush
         Sblb2STRUFNZTYe04YlooJ/CC1EBSwIP9hlpF2jzgz1PJzY+KI71jFIXuyAbVTBodkVH
         bhEjkT8TerOs5J1+6VIv6of8vQSF+YsCrnUToBO4LzkrxNp6s+gLQOHz9tU0RZYoRJ4T
         nbKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PsSTm9OW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si11535217ybq.381.2020.08.24.07.32.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PsSTm9OW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADW9-0003Se-DT
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTk-00086T-B0
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:44 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTi-0002fb-CE
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:43 -0400
Received: by mail-wr1-x444.google.com with SMTP id a5so8922645wrm.6
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V+kRX7a2XiYIEF+wLaciE51YCWSx382IErtFW6/uTrw=;
 b=PsSTm9OWXET7Nc3uzNAF0BTbBSrheTecNz/3OPaCdY5rSyGe4Cy0nOcgB4CNixafUX
 P6AaEW9ZqgnqQzoAiTAlVVmHRqCaYXbGPE8+Zori1J4xb8d7yhHu3VGrWsT2LRZqZ7Xe
 lA3ulvZXcXWLt0L8jSYcKZ3/yHy2RA9x6GzD1mMTqDIPIK53OYsn4Iqk0EK/anKJGZ6U
 skzkQWy7Od/6z0bKr1qdAkmVksWlJRXl3+KCAxkPFx6z5AgC6nWKJav73pJzbjHBe7u9
 PM2DVFFG8fTuUOd1SeidjRdv+apu812sHD/zg0GGbMYPj1tD0i/xh4jR4/C6U1KK1ogr
 OxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V+kRX7a2XiYIEF+wLaciE51YCWSx382IErtFW6/uTrw=;
 b=mWs3YNUafWsTUuWSprTUPIFfIA1zrTH0c1kCTCkjZ9dGHF5uzPw/Z5Vjg7pQxlYA2l
 /3EHgTTLW7LoOj565ef8dtMvZqbtykWtHKH7Q+NeYLgEJDVzbgVEbgSur5B3oUeI0HqC
 ZY93MiYeE5dOCbuPuj8x43IaMMfhwN54n7ZtRE2eo1Tz747dlpy6L/Es7NYrw7iLSVIw
 OeC6cEH/jFShv1d/hKjuqBhr1SdRahrGztD/X90B/FFGpOEdWlTfuI77xsdICBYi9331
 GsmNOYV8nc//rY4jMHD9OP1OIAaloZgYW65kxx6l7yVVlNBbNBDQTNf5XYUWJeEPwqWZ
 /1DA==
X-Gm-Message-State: AOAM5301hCiaEAz2O6v5F1mlTSpTUAzIVCgZ6Dt6orLSahpqTUe1v9Y4
 h3A7xTVVReNcFQ75m59SXxtREK9HDzioKaA1
X-Received: by 2002:a5d:5086:: with SMTP id a6mr6122933wrt.304.1598279380285; 
 Mon, 24 Aug 2020 07:29:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/22] target/arm: Implement VFP fp16 for VFP_BINOP operations
Date: Mon, 24 Aug 2020 15:29:15 +0100
Message-Id: <20200824142934.20850-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
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
X-TUID: icsR1X5qauG6

Implmeent VFP fp16 support for simple binary-operator VFP insns VADD,
VSUB, VMUL, VDIV, VMINNM and VMAXNM:

 * make the VFP_BINOP() macro generate float16 helpers as well as
   float32 and float64
 * implement a do_vfp_3op_hp() function similar to the existing
   do_vfp_3op_sp()
 * add decode for the half-precision insn patterns

Note that the VFP_BINOP macro use creates a couple of unused helper
functions vfp_maxh and vfp_minh, but they're small so it's not worth
splitting the BINOP operations into "needs halfprec" and "no
halfprec" groups.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h            |  8 ++++
 target/arm/vfp-uncond.decode   |  3 ++
 target/arm/vfp.decode          |  4 ++
 target/arm/vfp_helper.c        |  5 ++
 target/arm/translate-vfp.c.inc | 86 ++++++++++++++++++++++++++++++++++
 5 files changed, 106 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 759639a63a2..2c0c89a34b6 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -101,20 +101,28 @@ DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
 
+DEF_HELPER_3(vfp_addh, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_adds, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_addd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_subh, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_subs, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_subd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_mulh, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_muls, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_muld, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_divh, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_divs, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_divd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_maxh, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_maxs, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_maxd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_minh, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_mins, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_mind, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_maxnumh, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_maxnums, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_maxnumd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_minnumh, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_minnums, f32, f32, f32, ptr)
 DEF_HELPER_3(vfp_minnumd, f64, f64, f64, ptr)
 DEF_HELPER_1(vfp_negs, f32, f32)
diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index 34ca164266f..ee700e51972 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -49,6 +49,9 @@ VSEL        1111 1110 0. cc:2 .... .... 1010 .0.0 .... \
 VSEL        1111 1110 0. cc:2 .... .... 1011 .0.0 .... \
             vm=%vm_dp vn=%vn_dp vd=%vd_dp dp=1
 
+VMAXNM_hp   1111 1110 1.00 .... .... 1001 .0.0 ....         @vfp_dnm_s
+VMINNM_hp   1111 1110 1.00 .... .... 1001 .1.0 ....         @vfp_dnm_s
+
 VMAXNM_sp   1111 1110 1.00 .... .... 1010 .0.0 ....         @vfp_dnm_s
 VMINNM_sp   1111 1110 1.00 .... .... 1010 .1.0 ....         @vfp_dnm_s
 
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 2c793e3e87f..1ecd5e28ca0 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -115,18 +115,22 @@ VNMLS_dp     ---- 1110 0.01 .... .... 1011 .0.0 ....        @vfp_dnm_d
 VNMLA_sp     ---- 1110 0.01 .... .... 1010 .1.0 ....        @vfp_dnm_s
 VNMLA_dp     ---- 1110 0.01 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
+VMUL_hp      ---- 1110 0.10 .... .... 1001 .0.0 ....        @vfp_dnm_s
 VMUL_sp      ---- 1110 0.10 .... .... 1010 .0.0 ....        @vfp_dnm_s
 VMUL_dp      ---- 1110 0.10 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
 VNMUL_sp     ---- 1110 0.10 .... .... 1010 .1.0 ....        @vfp_dnm_s
 VNMUL_dp     ---- 1110 0.10 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
+VADD_hp      ---- 1110 0.11 .... .... 1001 .0.0 ....        @vfp_dnm_s
 VADD_sp      ---- 1110 0.11 .... .... 1010 .0.0 ....        @vfp_dnm_s
 VADD_dp      ---- 1110 0.11 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
+VSUB_hp      ---- 1110 0.11 .... .... 1001 .1.0 ....        @vfp_dnm_s
 VSUB_sp      ---- 1110 0.11 .... .... 1010 .1.0 ....        @vfp_dnm_s
 VSUB_dp      ---- 1110 0.11 .... .... 1011 .1.0 ....        @vfp_dnm_d
 
+VDIV_hp      ---- 1110 1.00 .... .... 1001 .0.0 ....        @vfp_dnm_s
 VDIV_sp      ---- 1110 1.00 .... .... 1010 .0.0 ....        @vfp_dnm_s
 VDIV_dp      ---- 1110 1.00 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 02ab8d7f2d8..38473315996 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -236,6 +236,11 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val)
 #define VFP_HELPER(name, p) HELPER(glue(glue(vfp_,name),p))
 
 #define VFP_BINOP(name) \
+float32 VFP_HELPER(name, h)(float32 a, float32 b, void *fpstp) \
+{ \
+    float_status *fpst = fpstp; \
+    return float16_ ## name(a, b, fpst); \
+} \
 float32 VFP_HELPER(name, s)(float32 a, float32 b, void *fpstp) \
 { \
     float_status *fpst = fpstp; \
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 4eeafb494ad..01a5fd65115 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1266,6 +1266,54 @@ static bool do_vfp_3op_sp(DisasContext *s, VFPGen3OpSPFn *fn,
     return true;
 }
 
+static bool do_vfp_3op_hp(DisasContext *s, VFPGen3OpSPFn *fn,
+                          int vd, int vn, int vm, bool reads_vd)
+{
+    /*
+     * Do a half-precision operation. Functionally this is
+     * the same as do_vfp_3op_sp(), except:
+     *  - it uses the FPST_FPCR_F16
+     *  - it doesn't need the VFP vector handling (fp16 is a
+     *    v8 feature, and in v8 VFP vectors don't exist)
+     *  - it does the aa32_fp16_arith feature test
+     */
+    TCGv_i32 f0, f1, fd;
+    TCGv_ptr fpst;
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
+    f1 = tcg_temp_new_i32();
+    fd = tcg_temp_new_i32();
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+
+    neon_load_reg32(f0, vn);
+    neon_load_reg32(f1, vm);
+
+    if (reads_vd) {
+        neon_load_reg32(fd, vd);
+    }
+    fn(fd, f0, f1, fpst);
+    neon_store_reg32(fd, vd);
+
+    tcg_temp_free_i32(f0);
+    tcg_temp_free_i32(f1);
+    tcg_temp_free_i32(fd);
+    tcg_temp_free_ptr(fpst);
+
+    return true;
+}
+
 static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
                           int vd, int vn, int vm, bool reads_vd)
 {
@@ -1643,6 +1691,11 @@ static bool trans_VNMLA_dp(DisasContext *s, arg_VNMLA_dp *a)
     return do_vfp_3op_dp(s, gen_VNMLA_dp, a->vd, a->vn, a->vm, true);
 }
 
+static bool trans_VMUL_hp(DisasContext *s, arg_VMUL_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_helper_vfp_mulh, a->vd, a->vn, a->vm, false);
+}
+
 static bool trans_VMUL_sp(DisasContext *s, arg_VMUL_sp *a)
 {
     return do_vfp_3op_sp(s, gen_helper_vfp_muls, a->vd, a->vn, a->vm, false);
@@ -1677,6 +1730,11 @@ static bool trans_VNMUL_dp(DisasContext *s, arg_VNMUL_dp *a)
     return do_vfp_3op_dp(s, gen_VNMUL_dp, a->vd, a->vn, a->vm, false);
 }
 
+static bool trans_VADD_hp(DisasContext *s, arg_VADD_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_helper_vfp_addh, a->vd, a->vn, a->vm, false);
+}
+
 static bool trans_VADD_sp(DisasContext *s, arg_VADD_sp *a)
 {
     return do_vfp_3op_sp(s, gen_helper_vfp_adds, a->vd, a->vn, a->vm, false);
@@ -1687,6 +1745,11 @@ static bool trans_VADD_dp(DisasContext *s, arg_VADD_dp *a)
     return do_vfp_3op_dp(s, gen_helper_vfp_addd, a->vd, a->vn, a->vm, false);
 }
 
+static bool trans_VSUB_hp(DisasContext *s, arg_VSUB_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_helper_vfp_subh, a->vd, a->vn, a->vm, false);
+}
+
 static bool trans_VSUB_sp(DisasContext *s, arg_VSUB_sp *a)
 {
     return do_vfp_3op_sp(s, gen_helper_vfp_subs, a->vd, a->vn, a->vm, false);
@@ -1697,6 +1760,11 @@ static bool trans_VSUB_dp(DisasContext *s, arg_VSUB_dp *a)
     return do_vfp_3op_dp(s, gen_helper_vfp_subd, a->vd, a->vn, a->vm, false);
 }
 
+static bool trans_VDIV_hp(DisasContext *s, arg_VDIV_sp *a)
+{
+    return do_vfp_3op_hp(s, gen_helper_vfp_divh, a->vd, a->vn, a->vm, false);
+}
+
 static bool trans_VDIV_sp(DisasContext *s, arg_VDIV_sp *a)
 {
     return do_vfp_3op_sp(s, gen_helper_vfp_divs, a->vd, a->vn, a->vm, false);
@@ -1707,6 +1775,24 @@ static bool trans_VDIV_dp(DisasContext *s, arg_VDIV_dp *a)
     return do_vfp_3op_dp(s, gen_helper_vfp_divd, a->vd, a->vn, a->vm, false);
 }
 
+static bool trans_VMINNM_hp(DisasContext *s, arg_VMINNM_sp *a)
+{
+    if (!dc_isar_feature(aa32_vminmaxnm, s)) {
+        return false;
+    }
+    return do_vfp_3op_hp(s, gen_helper_vfp_minnumh,
+                         a->vd, a->vn, a->vm, false);
+}
+
+static bool trans_VMAXNM_hp(DisasContext *s, arg_VMAXNM_sp *a)
+{
+    if (!dc_isar_feature(aa32_vminmaxnm, s)) {
+        return false;
+    }
+    return do_vfp_3op_hp(s, gen_helper_vfp_maxnumh,
+                         a->vd, a->vn, a->vm, false);
+}
+
 static bool trans_VMINNM_sp(DisasContext *s, arg_VMINNM_sp *a)
 {
     if (!dc_isar_feature(aa32_vminmaxnm, s)) {
-- 
2.20.1

