Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1796283wme;
        Tue, 22 May 2018 10:56:51 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpdRBx9CdyzW/Lh0DVECufniFd7RiEHmr1LeHZQiugAGDSrshO5i/ofzYorqF8Mse1qHonm
X-Received: by 2002:ac8:22a1:: with SMTP id f30-v6mr23615186qta.358.1527011811599;
        Tue, 22 May 2018 10:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527011811; cv=none;
        d=google.com; s=arc-20160816;
        b=Nb3kKYu4pQaLpCShPNE5s2UMKmxTwwd7M+j4TaM2mP20woemlgA3Qv1eNRs0d7lkaH
         C3WRgtS6R/+j+tdPWW7TYJchbSBp335dn9dxqjGyOf4KBaxIRlmjAyGI3rW03afUV76w
         t9+XW+aKt3RgrmzK6IMDR+E61Szjx+q6tACLq1SLSZwnzOR9+YgjcI5XCgnsT46cmuop
         0vdj+iEiV5U/s5eYQUUN1Tqz2Z6X8DbXNfwCYa6yWx1Uyyil6q4Q0tSirhX3+DbHYItG
         tw/YmUPAaYZzV5Yd7OpTiirtAT12Ojvr44SShY6yiKEGWHYcu3IyjBHojoKXyf49OWIC
         fJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=WSx0uH6TDE+8MVLnVszQRo6ojFtdilYOH7wvntqDQXw=;
        b=s04EJHLUMokAKGAqdx3FIVIkmg9BJY/sNoM3wkZt/jd2YM7Q64pj2Uzp/5VqKgt9KZ
         LrtYONBUWlO1ZZeL08I2VCFTXAKBNf65rmW/4Ra18pMA1xKLi8tkbc0Lm23bc097upkI
         MPObPyP13BwseSpx1NGOS/Jb2wFN8Kp6CBIrRZVx+COsdu8vvqb2k3GNo8KDUI9W0vjD
         kkm1dDOa12l7S/QsS9Qf1XzNNCE3GXXiUkNqg4//f3q9f77E21GCAxrYO3IjeDxSvtVq
         2GzH8ztfJdt/Yz9Y/cMfHieDSzs8cMTivHCAml8by7NbNJ9J/oyYQJ2nUFdd56//PsZi
         MEPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ivlZSd5O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32-v6si1287040qvr.24.2018.05.22.10.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 10:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ivlZSd5O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLBWl-0002f7-4L
	for alex.bennee@linaro.org; Tue, 22 May 2018 13:56:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fLBWX-0002eZ-Tq
	for qemu-arm@nongnu.org; Tue, 22 May 2018 13:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fLBWS-0004mE-Ra
	for qemu-arm@nongnu.org; Tue, 22 May 2018 13:56:37 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:41769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fLBWS-0004la-I8
	for qemu-arm@nongnu.org; Tue, 22 May 2018 13:56:32 -0400
Received: by mail-pl0-x243.google.com with SMTP id az12-v6so11345968plb.8
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=WSx0uH6TDE+8MVLnVszQRo6ojFtdilYOH7wvntqDQXw=;
	b=ivlZSd5OhFIDNkjBCi1rD/+ISbcuo+QveZVHVkDMea3bu+88yHf7BdM6iuBSeJyvFD
	Qi+BFJmLIaB8/wjr3DNNz5AiTCW8ak4uVjNFLMU6koqfWAHdYSywxvSCyLn57LK56ATG
	vcvcuAOzrTC7Ky8YhhB3LacCT8B1amNPTxu0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WSx0uH6TDE+8MVLnVszQRo6ojFtdilYOH7wvntqDQXw=;
	b=lZ3XmjvizFnZkxIY9rUdnR4VhdNQ+Ekeo3zgLzubPw0WM5/iD9DA6RaL0Vg5Wh6KZb
	z9x4yVI4vKfdi3mPaCH5VFRfl6XFNUJGv2G6haW+dFg4OfBEk+dTJJZRMgu4yCHRmsgs
	o3jxfgjX+4wQACTwJjQUHMiqkIRtkhq97OjhZPtOl4rfy5NSciDk/hVAw9s1v9fuqNaH
	+DOx5gut6vzTZgUDrRLzaaho1JGS0hU5xN++lWPI78wBG+vxmwBGLTDHrdZbHETvgiNs
	sIsqwQg+aSu0qzuoFs8vonYHZriSBpyQrlGeWWgeCXypDRaFiyk3RilTMlyqSxKlehGJ
	Vcww==
X-Gm-Message-State: ALKqPwf8G2402UkbsDxJYiIVWaZSOR9AZTtBWUvfcP+x4uFyrngUHVVZ
	z85Pw92d/fqw3JpUF3m5NVKvCA==
X-Received: by 2002:a17:902:850a:: with SMTP id
	bj10-v6mr25174875plb.239.1527011791205; 
	Tue, 22 May 2018 10:56:31 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net.
	[97.113.173.254]) by smtp.gmail.com with ESMTPSA id
	v16-v6sm29617724pfl.12.2018.05.22.10.56.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 May 2018 10:56:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 22 May 2018 10:56:29 -0700
Message-Id: <20180522175629.24932-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH] tcg: Fix helper function vs host abi for float16
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WzLpVozmdazN

Depending on the host abi, float16, aka uint16_t, values are
passed and returned either zero-extended in the host register
or with garbage at the top of the host register.

The tcg code generator has so far been assuming garbage, as that
matches the x86 abi, but this is incorrect for other host abis.
Further, target/arm has so far been assuming zero-extended results,
so that it may store the 16-bit value into a 32-bit slot with the
high 16-bits already clear.

Rectify both problems by mapping "f16" in the helper definition
to uint32_t instead of (a typedef for) uint16_t.  This forces
the host compiler to assume garbage in the upper 16 bits on input
and to zero-extend the result on output.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h |  2 +-
 target/arm/helper-a64.c    | 35 +++++++++--------
 target/arm/helper.c        | 80 +++++++++++++++++++-------------------
 3 files changed, 59 insertions(+), 58 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index 15b6a68de3..276dd5afce 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -39,7 +39,7 @@
 #define dh_ctype_int int
 #define dh_ctype_i64 uint64_t
 #define dh_ctype_s64 int64_t
-#define dh_ctype_f16 float16
+#define dh_ctype_f16 uint32_t
 #define dh_ctype_f32 float32
 #define dh_ctype_f64 float64
 #define dh_ctype_ptr void *
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index f92bdea732..6ee5f684cf 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -85,12 +85,12 @@ static inline uint32_t float_rel_to_flags(int res)
     return flags;
 }
 
-uint64_t HELPER(vfp_cmph_a64)(float16 x, float16 y, void *fp_status)
+uint64_t HELPER(vfp_cmph_a64)(uint32_t x, uint32_t y, void *fp_status)
 {
     return float_rel_to_flags(float16_compare_quiet(x, y, fp_status));
 }
 
-uint64_t HELPER(vfp_cmpeh_a64)(float16 x, float16 y, void *fp_status)
+uint64_t HELPER(vfp_cmpeh_a64)(uint32_t x, uint32_t y, void *fp_status)
 {
     return float_rel_to_flags(float16_compare(x, y, fp_status));
 }
@@ -214,7 +214,7 @@ uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, void *fpstp)
 #define float64_three make_float64(0x4008000000000000ULL)
 #define float64_one_point_five make_float64(0x3FF8000000000000ULL)
 
-float16 HELPER(recpsf_f16)(float16 a, float16 b, void *fpstp)
+uint32_t HELPER(recpsf_f16)(uint32_t a, uint32_t b, void *fpstp)
 {
     float_status *fpst = fpstp;
 
@@ -259,7 +259,7 @@ float64 HELPER(recpsf_f64)(float64 a, float64 b, void *fpstp)
     return float64_muladd(a, b, float64_two, 0, fpst);
 }
 
-float16 HELPER(rsqrtsf_f16)(float16 a, float16 b, void *fpstp)
+uint32_t HELPER(rsqrtsf_f16)(uint32_t a, uint32_t b, void *fpstp)
 {
     float_status *fpst = fpstp;
 
@@ -366,7 +366,7 @@ uint64_t HELPER(neon_addlp_u16)(uint64_t a)
 }
 
 /* Floating-point reciprocal exponent - see FPRecpX in ARM ARM */
-float16 HELPER(frecpx_f16)(float16 a, void *fpstp)
+uint32_t HELPER(frecpx_f16)(uint32_t a, void *fpstp)
 {
     float_status *fpst = fpstp;
     uint16_t val16, sbit;
@@ -695,7 +695,7 @@ void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
 #define ADVSIMD_HELPER(name, suffix) HELPER(glue(glue(advsimd_, name), suffix))
 
 #define ADVSIMD_HALFOP(name) \
-float16 ADVSIMD_HELPER(name, h)(float16 a, float16 b, void *fpstp) \
+uint32_t ADVSIMD_HELPER(name, h)(uint32_t a, uint32_t b, void *fpstp) \
 { \
     float_status *fpst = fpstp; \
     return float16_ ## name(a, b, fpst);    \
@@ -755,7 +755,8 @@ ADVSIMD_HALFOP(mulx)
 ADVSIMD_TWOHALFOP(mulx)
 
 /* fused multiply-accumulate */
-float16 HELPER(advsimd_muladdh)(float16 a, float16 b, float16 c, void *fpstp)
+uint32_t HELPER(advsimd_muladdh)(uint32_t a, uint32_t b, uint32_t c,
+                                 void *fpstp)
 {
     float_status *fpst = fpstp;
     return float16_muladd(a, b, c, 0, fpst);
@@ -786,14 +787,14 @@ uint32_t HELPER(advsimd_muladd2h)(uint32_t two_a, uint32_t two_b,
 
 #define ADVSIMD_CMPRES(test) (test) ? 0xffff : 0
 
-uint32_t HELPER(advsimd_ceq_f16)(float16 a, float16 b, void *fpstp)
+uint32_t HELPER(advsimd_ceq_f16)(uint32_t a, uint32_t b, void *fpstp)
 {
     float_status *fpst = fpstp;
     int compare = float16_compare_quiet(a, b, fpst);
     return ADVSIMD_CMPRES(compare == float_relation_equal);
 }
 
-uint32_t HELPER(advsimd_cge_f16)(float16 a, float16 b, void *fpstp)
+uint32_t HELPER(advsimd_cge_f16)(uint32_t a, uint32_t b, void *fpstp)
 {
     float_status *fpst = fpstp;
     int compare = float16_compare(a, b, fpst);
@@ -801,14 +802,14 @@ uint32_t HELPER(advsimd_cge_f16)(float16 a, float16 b, void *fpstp)
                           compare == float_relation_equal);
 }
 
-uint32_t HELPER(advsimd_cgt_f16)(float16 a, float16 b, void *fpstp)
+uint32_t HELPER(advsimd_cgt_f16)(uint32_t a, uint32_t b, void *fpstp)
 {
     float_status *fpst = fpstp;
     int compare = float16_compare(a, b, fpst);
     return ADVSIMD_CMPRES(compare == float_relation_greater);
 }
 
-uint32_t HELPER(advsimd_acge_f16)(float16 a, float16 b, void *fpstp)
+uint32_t HELPER(advsimd_acge_f16)(uint32_t a, uint32_t b, void *fpstp)
 {
     float_status *fpst = fpstp;
     float16 f0 = float16_abs(a);
@@ -818,7 +819,7 @@ uint32_t HELPER(advsimd_acge_f16)(float16 a, float16 b, void *fpstp)
                           compare == float_relation_equal);
 }
 
-uint32_t HELPER(advsimd_acgt_f16)(float16 a, float16 b, void *fpstp)
+uint32_t HELPER(advsimd_acgt_f16)(uint32_t a, uint32_t b, void *fpstp)
 {
     float_status *fpst = fpstp;
     float16 f0 = float16_abs(a);
@@ -828,12 +829,12 @@ uint32_t HELPER(advsimd_acgt_f16)(float16 a, float16 b, void *fpstp)
 }
 
 /* round to integral */
-float16 HELPER(advsimd_rinth_exact)(float16 x, void *fp_status)
+uint32_t HELPER(advsimd_rinth_exact)(uint32_t x, void *fp_status)
 {
     return float16_round_to_int(x, fp_status);
 }
 
-float16 HELPER(advsimd_rinth)(float16 x, void *fp_status)
+uint32_t HELPER(advsimd_rinth)(uint32_t x, void *fp_status)
 {
     int old_flags = get_float_exception_flags(fp_status), new_flags;
     float16 ret;
@@ -857,7 +858,7 @@ float16 HELPER(advsimd_rinth)(float16 x, void *fp_status)
  * setting the mode appropriately before calling the helper.
  */
 
-uint32_t HELPER(advsimd_f16tosinth)(float16 a, void *fpstp)
+uint32_t HELPER(advsimd_f16tosinth)(uint32_t a, void *fpstp)
 {
     float_status *fpst = fpstp;
 
@@ -869,7 +870,7 @@ uint32_t HELPER(advsimd_f16tosinth)(float16 a, void *fpstp)
     return float16_to_int16(a, fpst);
 }
 
-uint32_t HELPER(advsimd_f16touinth)(float16 a, void *fpstp)
+uint32_t HELPER(advsimd_f16touinth)(uint32_t a, void *fpstp)
 {
     float_status *fpst = fpstp;
 
@@ -885,7 +886,7 @@ uint32_t HELPER(advsimd_f16touinth)(float16 a, void *fpstp)
  * Square Root and Reciprocal square root
  */
 
-float16 HELPER(sqrt_f16)(float16 a, void *fpstp)
+uint32_t HELPER(sqrt_f16)(uint32_t a, void *fpstp)
 {
     float_status *s = fpstp;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c0f739972e..a4bfac3932 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11344,35 +11344,35 @@ DO_VFP_cmp(d, float64)
 
 /* Integer to float and float to integer conversions */
 
-#define CONV_ITOF(name, fsz, sign) \
-    float##fsz HELPER(name)(uint32_t x, void *fpstp) \
-{ \
-    float_status *fpst = fpstp; \
-    return sign##int32_to_##float##fsz((sign##int32_t)x, fpst); \
+#define CONV_ITOF(name, ftype, fsz, sign)                           \
+ftype HELPER(name)(uint32_t x, void *fpstp)                         \
+{                                                                   \
+    float_status *fpst = fpstp;                                     \
+    return sign##int32_to_##float##fsz((sign##int32_t)x, fpst);     \
 }
 
-#define CONV_FTOI(name, fsz, sign, round) \
-uint32_t HELPER(name)(float##fsz x, void *fpstp) \
-{ \
-    float_status *fpst = fpstp; \
-    if (float##fsz##_is_any_nan(x)) { \
-        float_raise(float_flag_invalid, fpst); \
-        return 0; \
-    } \
-    return float##fsz##_to_##sign##int32##round(x, fpst); \
+#define CONV_FTOI(name, ftype, fsz, sign, round)                \
+uint32_t HELPER(name)(ftype x, void *fpstp)                     \
+{                                                               \
+    float_status *fpst = fpstp;                                 \
+    if (float##fsz##_is_any_nan(x)) {                           \
+        float_raise(float_flag_invalid, fpst);                  \
+        return 0;                                               \
+    }                                                           \
+    return float##fsz##_to_##sign##int32##round(x, fpst);       \
 }
 
-#define FLOAT_CONVS(name, p, fsz, sign) \
-CONV_ITOF(vfp_##name##to##p, fsz, sign) \
-CONV_FTOI(vfp_to##name##p, fsz, sign, ) \
-CONV_FTOI(vfp_to##name##z##p, fsz, sign, _round_to_zero)
+#define FLOAT_CONVS(name, p, ftype, fsz, sign)            \
+    CONV_ITOF(vfp_##name##to##p, ftype, fsz, sign)        \
+    CONV_FTOI(vfp_to##name##p, ftype, fsz, sign, )        \
+    CONV_FTOI(vfp_to##name##z##p, ftype, fsz, sign, _round_to_zero)
 
-FLOAT_CONVS(si, h, 16, )
-FLOAT_CONVS(si, s, 32, )
-FLOAT_CONVS(si, d, 64, )
-FLOAT_CONVS(ui, h, 16, u)
-FLOAT_CONVS(ui, s, 32, u)
-FLOAT_CONVS(ui, d, 64, u)
+FLOAT_CONVS(si, h, uint32_t, 16, )
+FLOAT_CONVS(si, s, float32, 32, )
+FLOAT_CONVS(si, d, float64, 64, )
+FLOAT_CONVS(ui, h, uint32_t, 16, u)
+FLOAT_CONVS(ui, s, float32, 32, u)
+FLOAT_CONVS(ui, d, float64, 64, u)
 
 #undef CONV_ITOF
 #undef CONV_FTOI
@@ -11465,22 +11465,22 @@ static float16 do_postscale_fp16(float64 f, int shift, float_status *fpst)
     return float64_to_float16(float64_scalbn(f, -shift, fpst), true, fpst);
 }
 
-float16 HELPER(vfp_sltoh)(uint32_t x, uint32_t shift, void *fpst)
+uint32_t HELPER(vfp_sltoh)(uint32_t x, uint32_t shift, void *fpst)
 {
     return do_postscale_fp16(int32_to_float64(x, fpst), shift, fpst);
 }
 
-float16 HELPER(vfp_ultoh)(uint32_t x, uint32_t shift, void *fpst)
+uint32_t HELPER(vfp_ultoh)(uint32_t x, uint32_t shift, void *fpst)
 {
     return do_postscale_fp16(uint32_to_float64(x, fpst), shift, fpst);
 }
 
-float16 HELPER(vfp_sqtoh)(uint64_t x, uint32_t shift, void *fpst)
+uint32_t HELPER(vfp_sqtoh)(uint64_t x, uint32_t shift, void *fpst)
 {
     return do_postscale_fp16(int64_to_float64(x, fpst), shift, fpst);
 }
 
-float16 HELPER(vfp_uqtoh)(uint64_t x, uint32_t shift, void *fpst)
+uint32_t HELPER(vfp_uqtoh)(uint64_t x, uint32_t shift, void *fpst)
 {
     return do_postscale_fp16(uint64_to_float64(x, fpst), shift, fpst);
 }
@@ -11504,32 +11504,32 @@ static float64 do_prescale_fp16(float16 f, int shift, float_status *fpst)
     }
 }
 
-uint32_t HELPER(vfp_toshh)(float16 x, uint32_t shift, void *fpst)
+uint32_t HELPER(vfp_toshh)(uint32_t x, uint32_t shift, void *fpst)
 {
     return float64_to_int16(do_prescale_fp16(x, shift, fpst), fpst);
 }
 
-uint32_t HELPER(vfp_touhh)(float16 x, uint32_t shift, void *fpst)
+uint32_t HELPER(vfp_touhh)(uint32_t x, uint32_t shift, void *fpst)
 {
     return float64_to_uint16(do_prescale_fp16(x, shift, fpst), fpst);
 }
 
-uint32_t HELPER(vfp_toslh)(float16 x, uint32_t shift, void *fpst)
+uint32_t HELPER(vfp_toslh)(uint32_t x, uint32_t shift, void *fpst)
 {
     return float64_to_int32(do_prescale_fp16(x, shift, fpst), fpst);
 }
 
-uint32_t HELPER(vfp_toulh)(float16 x, uint32_t shift, void *fpst)
+uint32_t HELPER(vfp_toulh)(uint32_t x, uint32_t shift, void *fpst)
 {
     return float64_to_uint32(do_prescale_fp16(x, shift, fpst), fpst);
 }
 
-uint64_t HELPER(vfp_tosqh)(float16 x, uint32_t shift, void *fpst)
+uint64_t HELPER(vfp_tosqh)(uint32_t x, uint32_t shift, void *fpst)
 {
     return float64_to_int64(do_prescale_fp16(x, shift, fpst), fpst);
 }
 
-uint64_t HELPER(vfp_touqh)(float16 x, uint32_t shift, void *fpst)
+uint64_t HELPER(vfp_touqh)(uint32_t x, uint32_t shift, void *fpst)
 {
     return float64_to_uint64(do_prescale_fp16(x, shift, fpst), fpst);
 }
@@ -11565,7 +11565,7 @@ uint32_t HELPER(set_neon_rmode)(uint32_t rmode, CPUARMState *env)
 }
 
 /* Half precision conversions.  */
-float32 HELPER(vfp_fcvt_f16_to_f32)(float16 a, void *fpstp, uint32_t ahp_mode)
+float32 HELPER(vfp_fcvt_f16_to_f32)(uint32_t a, void *fpstp, uint32_t ahp_mode)
 {
     /* Squash FZ16 to 0 for the duration of conversion.  In this case,
      * it would affect flushing input denormals.
@@ -11578,7 +11578,7 @@ float32 HELPER(vfp_fcvt_f16_to_f32)(float16 a, void *fpstp, uint32_t ahp_mode)
     return r;
 }
 
-float16 HELPER(vfp_fcvt_f32_to_f16)(float32 a, void *fpstp, uint32_t ahp_mode)
+uint32_t HELPER(vfp_fcvt_f32_to_f16)(float32 a, void *fpstp, uint32_t ahp_mode)
 {
     /* Squash FZ16 to 0 for the duration of conversion.  In this case,
      * it would affect flushing output denormals.
@@ -11591,7 +11591,7 @@ float16 HELPER(vfp_fcvt_f32_to_f16)(float32 a, void *fpstp, uint32_t ahp_mode)
     return r;
 }
 
-float64 HELPER(vfp_fcvt_f16_to_f64)(float16 a, void *fpstp, uint32_t ahp_mode)
+float64 HELPER(vfp_fcvt_f16_to_f64)(uint32_t a, void *fpstp, uint32_t ahp_mode)
 {
     /* Squash FZ16 to 0 for the duration of conversion.  In this case,
      * it would affect flushing input denormals.
@@ -11604,7 +11604,7 @@ float64 HELPER(vfp_fcvt_f16_to_f64)(float16 a, void *fpstp, uint32_t ahp_mode)
     return r;
 }
 
-float16 HELPER(vfp_fcvt_f64_to_f16)(float64 a, void *fpstp, uint32_t ahp_mode)
+uint32_t HELPER(vfp_fcvt_f64_to_f16)(float64 a, void *fpstp, uint32_t ahp_mode)
 {
     /* Squash FZ16 to 0 for the duration of conversion.  In this case,
      * it would affect flushing output denormals.
@@ -11742,7 +11742,7 @@ static bool round_to_inf(float_status *fpst, bool sign_bit)
     g_assert_not_reached();
 }
 
-float16 HELPER(recpe_f16)(float16 input, void *fpstp)
+uint32_t HELPER(recpe_f16)(uint32_t input, void *fpstp)
 {
     float_status *fpst = fpstp;
     float16 f16 = float16_squash_input_denormal(input, fpst);
@@ -11937,7 +11937,7 @@ static uint64_t recip_sqrt_estimate(int *exp , int exp_off, uint64_t frac)
     return extract64(estimate, 0, 8) << 44;
 }
 
-float16 HELPER(rsqrte_f16)(float16 input, void *fpstp)
+uint32_t HELPER(rsqrte_f16)(uint32_t input, void *fpstp)
 {
     float_status *s = fpstp;
     float16 f16 = float16_squash_input_denormal(input, s);
-- 
2.17.0

