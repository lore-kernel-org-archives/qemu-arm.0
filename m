Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1825306lfa;
        Tue, 13 Oct 2020 03:36:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzosTHfxfP2ClywdT2N5mM3vpyGCv7H1tdaXQspvpdiXry1vsM6agj9ZvMXrkW+RiEcv3nP
X-Received: by 2002:a25:cb53:: with SMTP id b80mr13677888ybg.518.1602585369844;
        Tue, 13 Oct 2020 03:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602585369; cv=none;
        d=google.com; s=arc-20160816;
        b=DFIUpuVkR+szEbWxJmN8oojlwULYOw6FN5B2dgDSq0DC6CoxZ6shhQHzZ3qwjR00Gp
         252UlFG0tUoJi3rzo7P4pbt95O/tuTWAI9qfJ2xW/akPmVxloMNwfIPFO1fCi/gp5jMa
         o+SRWKBUSV22GWpMm+m6kWnwxhOELkkXGLcyODFZxbpfGXgE984h3IikzZm9B6IeqP6F
         oDmzplHZs3fuPADIaJgRaBy8OnCtFvDS26rGSMF+9zBspZ7gGux2PPqQzCrg2dxu4Oa7
         +pN3cjBC2sbQcx3XNXarIBQgKkCJT/BagEiVhKO9jKN0fCrGx2q3b+gknqjES8gB+mT/
         oKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Rxq0YUJRRCjXNE+EXdh2OUkpg0FaXGP4WAIeZPZ2iAI=;
        b=Y78oihd/m9O7TQymqsx6sAGlKKEx2z2OGTFfQp0BL6E5gnOEpGMMUDEHZCV/oyMzSZ
         8SQgr8zWmi1+czkvZxSoXshTviHsZ4D6A/gjvBtXodi7GLdV3NZChQSdfK7mT23tx8Fq
         /xo/l+I994LkN7iXEPzM6JBO7Ij9/q5S0/Z8jGkp9WYGCsr7SZy6R/rPuCDUA1px5fOi
         XNas0yD3REIZWmX6tEjQBN8qhkCSf+ZizUk2RYehjFhIeWcdkbyJvjoeYrQYQwcNJsff
         yr34EkY8T1xEO1+gz3p9qzohNHu1OFmhdEKRICdu3V7K3zWovfc+77OU5j9Wy6O4kcQn
         3T+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F646NddO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f197si16926156yba.276.2020.10.13.03.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 03:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F646NddO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSHf7-000287-6C
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 06:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSHee-00027O-J6
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 06:35:41 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSHea-0003rS-14
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 06:35:40 -0400
Received: by mail-wr1-x442.google.com with SMTP id e18so23373195wrw.9
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 03:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rxq0YUJRRCjXNE+EXdh2OUkpg0FaXGP4WAIeZPZ2iAI=;
 b=F646NddOxB2034Gv1d9nAVWy2VH3kJTfA90etQ/sigizEJpekMDX2c34J3jpykfAqH
 i+5JHbT2uLaUt8XZxbKoz2G5veZtulkfofEvHJKMUEvFtXsziUOjbn1w2L0REJBzmu7b
 qQ4VA17NtrHE4ZApPoD5lIBtcqqfeWUjLG/jnixSMBWQw4GBUtjOHtR+qJ4XhI1nugbS
 dVXjgVUg4UYOgghnWtXw9qOZKzJ98UzpGZeqiq7GmA4O3vrcYfpLn88OHmcI7XhDtXHL
 OvqW++VsTDBrAuOmIGGTNqjMhliAQopGnWGYl7AO+jI2+A60NZl3+t+6nKLyKSex5oiK
 BJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rxq0YUJRRCjXNE+EXdh2OUkpg0FaXGP4WAIeZPZ2iAI=;
 b=Z35j8P9J85rvGWppVYQtRHDx2we3t4KugWvYZyaMeJlTowI8yHc9tp/iLKdETt/aWP
 hcse2Es0H6egcxXMUjwYgWfQPy++EfoD3Vo2nmy1ZpdaTVQ6qqYt3wWCnnF32xx7BOEk
 W7G/uAC0WdmdYEQ5QrVJGAUhv3zuXwAyrw3k/5XA48ZJOg3+Fv3StfCbxmLASaPOhIyr
 36Yo7UVoyOA20rvYVIFHtEAuWxDyAixYJ78ZRhTAJgbFYi8YOAdjPcXuybfrJh9XWzMV
 AO+X+3P2oRA4RfrhjjLU67Bl2OANPMhoASELEjmBOuEXuw60z2Qt4InZBgOA8ajgSLiH
 ogHg==
X-Gm-Message-State: AOAM530X7LTjRCTTAZM3oamccYj1GCU3DdPwKuA+GqV3FY6FbQKkuZtE
 1VVAXzZodumNoJLXR05qN3dHqwBeQkfBg6k1
X-Received: by 2002:a5d:480a:: with SMTP id l10mr13930722wrq.279.1602585334076; 
 Tue, 13 Oct 2020 03:35:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x6sm27724713wmb.17.2020.10.13.03.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 03:35:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: AArch32 VCVT fixed-point to float is always
 round-to-nearest
Date: Tue, 13 Oct 2020 11:35:32 +0100
Message-Id: <20201013103532.13391-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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
X-TUID: K5kiOO1LORBA

For AArch32, unlike the VCVT of integer to float, which honours the
rounding mode specified by the FPSCR, VCVT of fixed-point to float is
always round-to-nearest. (AArch64 fixed-point-to-float conversions
always honour the FPCR rounding mode.)

Implement this by providing _round_to_nearest versions of the
relevant helpers which set the rounding mode temporarily when making
the call to the underlying softfloat function.

We only need to change the VFP VCVT instructions, because the
standard- FPSCR value used by the Neon VCVT is always set to
round-to-nearest, so we don't need to do the extra work of saving
and restoring the rounding mode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h            | 13 +++++++++++++
 target/arm/vfp_helper.c        | 23 ++++++++++++++++++++++-
 target/arm/translate-vfp.c.inc | 24 ++++++++++++------------
 3 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 8defd7c8019..774d2cddb5c 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -213,6 +213,19 @@ DEF_HELPER_3(vfp_ultoh, f16, i32, i32, ptr)
 DEF_HELPER_3(vfp_sqtoh, f16, i64, i32, ptr)
 DEF_HELPER_3(vfp_uqtoh, f16, i64, i32, ptr)
 
+DEF_HELPER_3(vfp_shtos_round_to_nearest, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_sltos_round_to_nearest, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_uhtos_round_to_nearest, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_ultos_round_to_nearest, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_shtod_round_to_nearest, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_sltod_round_to_nearest, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_uhtod_round_to_nearest, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_ultod_round_to_nearest, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_shtoh_round_to_nearest, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_uhtoh_round_to_nearest, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_sltoh_round_to_nearest, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_ultoh_round_to_nearest, f16, i32, i32, ptr)
+
 DEF_HELPER_FLAGS_2(set_rmode, TCG_CALL_NO_RWG, i32, i32, ptr)
 
 DEF_HELPER_FLAGS_3(vfp_fcvt_f16_to_f32, TCG_CALL_NO_RWG, f32, f16, ptr, i32)
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 5666393ef79..abfdb6a8e23 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -393,12 +393,32 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
     return float64_to_float32(x, &env->vfp.fp_status);
 }
 
-/* VFP3 fixed point conversion.  */
+/*
+ * VFP3 fixed point conversion. The AArch32 versions of fix-to-float
+ * must always round-to-nearest; the AArch64 ones honour the FPSCR
+ * rounding mode. (For AArch32 Neon the standard-FPSCR is set to
+ * round-to-nearest so either helper will work.) AArch32 float-to-fix
+ * must round-to-zero.
+ */
 #define VFP_CONV_FIX_FLOAT(name, p, fsz, ftype, isz, itype)            \
 ftype HELPER(vfp_##name##to##p)(uint##isz##_t  x, uint32_t shift,      \
                                      void *fpstp) \
 { return itype##_to_##float##fsz##_scalbn(x, -shift, fpstp); }
 
+#define VFP_CONV_FIX_FLOAT_ROUND(name, p, fsz, ftype, isz, itype)      \
+    ftype HELPER(vfp_##name##to##p##_round_to_nearest)(uint##isz##_t  x, \
+                                                     uint32_t shift,   \
+                                                     void *fpstp)      \
+    {                                                                  \
+        ftype ret;                                                     \
+        float_status *fpst = fpstp;                                    \
+        FloatRoundMode oldmode = fpst->float_rounding_mode;            \
+        fpst->float_rounding_mode = float_round_nearest_even;          \
+        ret = itype##_to_##float##fsz##_scalbn(x, -shift, fpstp);      \
+        fpst->float_rounding_mode = oldmode;                           \
+        return ret;                                                    \
+    }
+
 #define VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype, ROUND, suff) \
 uint##isz##_t HELPER(vfp_to##name##p##suff)(ftype x, uint32_t shift,      \
                                             void *fpst)                   \
@@ -412,6 +432,7 @@ uint##isz##_t HELPER(vfp_to##name##p##suff)(ftype x, uint32_t shift,      \
 
 #define VFP_CONV_FIX(name, p, fsz, ftype, isz, itype)            \
 VFP_CONV_FIX_FLOAT(name, p, fsz, ftype, isz, itype)              \
+VFP_CONV_FIX_FLOAT_ROUND(name, p, fsz, ftype, isz, itype)        \
 VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype,        \
                          float_round_to_zero, _round_to_zero)    \
 VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype,        \
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 28e0dba5f14..9b11b81f80d 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3141,16 +3141,16 @@ static bool trans_VCVT_fix_hp(DisasContext *s, arg_VCVT_fix_sp *a)
     /* Switch on op:U:sx bits */
     switch (a->opc) {
     case 0:
-        gen_helper_vfp_shtoh(vd, vd, shift, fpst);
+        gen_helper_vfp_shtoh_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 1:
-        gen_helper_vfp_sltoh(vd, vd, shift, fpst);
+        gen_helper_vfp_sltoh_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 2:
-        gen_helper_vfp_uhtoh(vd, vd, shift, fpst);
+        gen_helper_vfp_uhtoh_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 3:
-        gen_helper_vfp_ultoh(vd, vd, shift, fpst);
+        gen_helper_vfp_ultoh_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 4:
         gen_helper_vfp_toshh_round_to_zero(vd, vd, shift, fpst);
@@ -3200,16 +3200,16 @@ static bool trans_VCVT_fix_sp(DisasContext *s, arg_VCVT_fix_sp *a)
     /* Switch on op:U:sx bits */
     switch (a->opc) {
     case 0:
-        gen_helper_vfp_shtos(vd, vd, shift, fpst);
+        gen_helper_vfp_shtos_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 1:
-        gen_helper_vfp_sltos(vd, vd, shift, fpst);
+        gen_helper_vfp_sltos_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 2:
-        gen_helper_vfp_uhtos(vd, vd, shift, fpst);
+        gen_helper_vfp_uhtos_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 3:
-        gen_helper_vfp_ultos(vd, vd, shift, fpst);
+        gen_helper_vfp_ultos_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 4:
         gen_helper_vfp_toshs_round_to_zero(vd, vd, shift, fpst);
@@ -3265,16 +3265,16 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
     /* Switch on op:U:sx bits */
     switch (a->opc) {
     case 0:
-        gen_helper_vfp_shtod(vd, vd, shift, fpst);
+        gen_helper_vfp_shtod_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 1:
-        gen_helper_vfp_sltod(vd, vd, shift, fpst);
+        gen_helper_vfp_sltod_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 2:
-        gen_helper_vfp_uhtod(vd, vd, shift, fpst);
+        gen_helper_vfp_uhtod_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 3:
-        gen_helper_vfp_ultod(vd, vd, shift, fpst);
+        gen_helper_vfp_ultod_round_to_nearest(vd, vd, shift, fpst);
         break;
     case 4:
         gen_helper_vfp_toshd_round_to_zero(vd, vd, shift, fpst);
-- 
2.20.1

