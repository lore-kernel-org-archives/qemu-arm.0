Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2608282lfy;
        Mon, 24 Aug 2020 07:32:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5up1u9FmTHHkSCbGVC8axfVlvrKFqQmEbsu7W6fzR79d75MEBG00eXp8SSHdeEfssEK0E
X-Received: by 2002:a5b:1c4:: with SMTP id f4mr7824963ybp.48.1598279560894;
        Mon, 24 Aug 2020 07:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279560; cv=none;
        d=google.com; s=arc-20160816;
        b=F7d7+9bhiuu0OnMMbBmc04dlzb+a3fcojAPALARXI75rHkAmVUvRCrR4g/yvwHUMxV
         QmSkwD2GHkV+/RxcTYVGfOWBegTTU44Em5U2NGMzEh+J06gfwD63yLwtT0O/VJizQHRY
         ydE3tnnVhkJpABobTxYbt8Lm1+h8jzHQtt5aXYlJOg5i+H5kUgTlN1EEFR89bpUtcYR1
         xcDaf/l+AbAuPOG3HBliXfemox9aWq+kkpZhcaN+cbvEpsLHnKCqEqxqmb3YiiYICiG9
         j1Mzoao3wsBoQdXEVgi/CrLW1X1tKvpf5xAkE/g7ixlndo3x26Ta8zLwnwRC5kV4DE5q
         rlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=smg9lGqy46hEVTqJFbKgHP/m12Tte5t8QZbiLz2o5EQ=;
        b=Vdgqwt9IVZWbAAilfI2j7pIGkOmWfwOsN4h5LeEeRLYke1SDBeg2IyeGlReue2m9m/
         4ycP8CGVCAVCj86pXxP31vumYzbFT5OC6O+ZsBBizhh9+oIVOpcDOER2BHXsihQ2rTEb
         G4XkFuHyedMDBElMk/l4xsnOeJE9MbmCYesqtGSHhdTg1ZmlqQv6aBjOsZmyJdkakrd5
         hoslobiCKJ6yeEd60rDlu/naI/uhX3kxwqzmSirgS3tK+/7BTNUuXqo23DVOxzQWMc0t
         KfQGXSUr0T8OHvk9McjpMFnx4nk/ErBrEi5B8N7C3YWhleytFsuUR9Ajc8JC1gYznPNi
         yNnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwgGauLw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si9718962ybk.472.2020.08.24.07.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwgGauLw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADWa-0004KS-3s
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTn-0008Fw-Vt
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:48 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTk-0002gW-UB
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:47 -0400
Received: by mail-wr1-x444.google.com with SMTP id y3so8898583wrl.4
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=smg9lGqy46hEVTqJFbKgHP/m12Tte5t8QZbiLz2o5EQ=;
 b=XwgGauLwhJUfFIBF+Mls9ZukEr1H8Cc21CjG5IbtPZBzqtGJ9X5GHl43YkNgQkdOyn
 cs3z5Qi/ulbHKEzXVLK2Ig1A/OUpT1GBZ5PtEIjL01grp6t70L0EscFF721lFSTAknW0
 //D0kurfvqLVafSO09l/ndiNLuoujR2dFLpcY4nQBm7345BqiflBY6rwdvaf4Yps6OSQ
 GPDebgJkgpoBWjZdrE2b9yRnKuatRHZDyTSB29SDgrTUQQtb9fbXySHEh+Ul9UN6QZig
 isz+T7osEmDaaAffWibPN55xAsMavnhg4ONDOCWCekFX/7B5egkyKL32Z8N9F7t66C+/
 SizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smg9lGqy46hEVTqJFbKgHP/m12Tte5t8QZbiLz2o5EQ=;
 b=ZsK3TJbS+iEL1J3dM9t/fjpQu91FOLH9HWuzxTpx0pm1qAvcKtF3I+xZHX4k594dw9
 1TglhS0V+ATBOvyGVbiIIxLtola/DK0qsLtiN2VV3FqNNq2VEeX9GnFuy/TGwvX/AAJq
 6mWmZFObR8xxDrncF1qLj0eY6wx9rgPzfXdhW//moSjxtHuBwDiJGe4ZwLebmaaHmfVO
 V+z4eWNWI55giL59X3v04cnQcHRalEuZWJx/+zw7zsm54RqzFeCZg7Li7p2yZ22t9YuE
 l1RP+/ayP3Tu6y50YxVOqfpDbQBtxPniXNDx+y+MqC3JmS/EXCkBqCAi1I80zbpZTGYE
 bvpg==
X-Gm-Message-State: AOAM532LqO4zAAOub8kLyedCQFuhe2vEf8jC+Em2pHbmZHyWtBib274h
 NQU6EskKYsbvIw4ugh1kmlhnVf41i+RH4p5u
X-Received: by 2002:adf:dc83:: with SMTP id r3mr6603790wrj.172.1598279383333; 
 Mon, 24 Aug 2020 07:29:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/22] target/arm: Implement VFP fp16 for fused-multiply-add
Date: Mon, 24 Aug 2020 15:29:18 +0100
Message-Id: <20200824142934.20850-7-peter.maydell@linaro.org>
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
X-TUID: 8a7EJPq1XAdw

Implement VFP fp16 support for fused multiply-add insns
VFNMA, VFNMS, VFMA, VFMS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h            |  1 +
 target/arm/vfp.decode          |  5 +++
 target/arm/vfp_helper.c        |  6 ++++
 target/arm/translate-vfp.c.inc | 64 ++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 662076d54a6..3c3be97a4b0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -213,6 +213,7 @@ DEF_HELPER_FLAGS_3(vfp_fcvt_f64_to_f16, TCG_CALL_NO_RWG, f16, f64, ptr, i32)
 
 DEF_HELPER_4(vfp_muladdd, f64, f64, f64, f64, ptr)
 DEF_HELPER_4(vfp_muladds, f32, f32, f32, f32, ptr)
+DEF_HELPER_4(vfp_muladdh, f32, f32, f32, f32, ptr)
 
 DEF_HELPER_3(recps_f32, f32, env, f32, f32)
 DEF_HELPER_3(rsqrts_f32, f32, env, f32, f32)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index e5545076a51..af4829e201b 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -139,6 +139,11 @@ VDIV_hp      ---- 1110 1.00 .... .... 1001 .0.0 ....        @vfp_dnm_s
 VDIV_sp      ---- 1110 1.00 .... .... 1010 .0.0 ....        @vfp_dnm_s
 VDIV_dp      ---- 1110 1.00 .... .... 1011 .0.0 ....        @vfp_dnm_d
 
+VFMA_hp      ---- 1110 1.10 .... .... 1001 .0. 0 ....       @vfp_dnm_s
+VFMS_hp      ---- 1110 1.10 .... .... 1001 .1. 0 ....       @vfp_dnm_s
+VFNMA_hp     ---- 1110 1.01 .... .... 1001 .0. 0 ....       @vfp_dnm_s
+VFNMS_hp     ---- 1110 1.01 .... .... 1001 .1. 0 ....       @vfp_dnm_s
+
 VFMA_sp      ---- 1110 1.10 .... .... 1010 .0. 0 ....       @vfp_dnm_s
 VFMS_sp      ---- 1110 1.10 .... .... 1010 .1. 0 ....       @vfp_dnm_s
 VFNMA_sp     ---- 1110 1.01 .... .... 1010 .0. 0 ....       @vfp_dnm_s
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 410f0216db0..c492e8ef876 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1062,6 +1062,12 @@ uint32_t HELPER(rsqrte_u32)(uint32_t a)
 }
 
 /* VFPv4 fused multiply-accumulate */
+float32 VFP_HELPER(muladd, h)(float32 a, float32 b, float32 c, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    return float16_muladd(a, b, c, 0, fpst);
+}
+
 float32 VFP_HELPER(muladd, s)(float32 a, float32 b, float32 c, void *fpstp)
 {
     float_status *fpst = fpstp;
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 9937fa569e4..b5eb9d66b3d 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1913,6 +1913,69 @@ static bool trans_VMAXNM_dp(DisasContext *s, arg_VMAXNM_dp *a)
                          a->vd, a->vn, a->vm, false);
 }
 
+static bool do_vfm_hp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
+{
+    /*
+     * VFNMA : fd = muladd(-fd,  fn, fm)
+     * VFNMS : fd = muladd(-fd, -fn, fm)
+     * VFMA  : fd = muladd( fd,  fn, fm)
+     * VFMS  : fd = muladd( fd, -fn, fm)
+     *
+     * These are fused multiply-add, and must be done as one floating
+     * point operation with no rounding between the multiplication and
+     * addition steps.  NB that doing the negations here as separate
+     * steps is correct : an input NaN should come out with its sign
+     * bit flipped if it is a negated-input.
+     */
+    TCGv_ptr fpst;
+    TCGv_i32 vn, vm, vd;
+
+    /*
+     * Present in VFPv4 only, and only with the FP16 extension.
+     * Note that we can't rely on the SIMDFMAC check alone, because
+     * in a Neon-no-VFP core that ID register field will be non-zero.
+     */
+    if (!dc_isar_feature(aa32_fp16_arith, s) ||
+        !dc_isar_feature(aa32_simdfmac, s) ||
+        !dc_isar_feature(aa32_fpsp_v2, s)) {
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
+    vn = tcg_temp_new_i32();
+    vm = tcg_temp_new_i32();
+    vd = tcg_temp_new_i32();
+
+    neon_load_reg32(vn, a->vn);
+    neon_load_reg32(vm, a->vm);
+    if (neg_n) {
+        /* VFNMS, VFMS */
+        gen_helper_vfp_negh(vn, vn);
+    }
+    neon_load_reg32(vd, a->vd);
+    if (neg_d) {
+        /* VFNMA, VFNMS */
+        gen_helper_vfp_negh(vd, vd);
+    }
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    gen_helper_vfp_muladdh(vd, vn, vm, vd, fpst);
+    neon_store_reg32(vd, a->vd);
+
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(vn);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_i32(vd);
+
+    return true;
+}
+
 static bool do_vfm_sp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
 {
     /*
@@ -2062,6 +2125,7 @@ static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
     MAKE_ONE_VFM_TRANS_FN(VFNMA, PREC, false, true) \
     MAKE_ONE_VFM_TRANS_FN(VFNMS, PREC, true, true)
 
+MAKE_VFM_TRANS_FNS(hp)
 MAKE_VFM_TRANS_FNS(sp)
 MAKE_VFM_TRANS_FNS(dp)
 
-- 
2.20.1

