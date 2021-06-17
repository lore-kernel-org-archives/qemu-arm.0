Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp503832lff;
        Thu, 17 Jun 2021 05:45:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybnh6keCvIC6IVK9g7rlzcrnnhq0kc0DSeM4AgP2y9nQd0ysc21zn5B199p9jeBF426t/1
X-Received: by 2002:a67:7087:: with SMTP id l129mr4190966vsc.49.1623933902000;
        Thu, 17 Jun 2021 05:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933901; cv=none;
        d=google.com; s=arc-20160816;
        b=emC6jaVnrXTh3tB2fO9QNeM225AQvBqCGRXHfNSoDPLi0f6Hr+gxPlLFRT5Z6hsGEi
         NeLKUvQDf4TYzhSQhNOKTAR2VIdxrMlKrnAiZOpKKLGbJCgQt+IgpGpnDkDAGEjOZlqo
         Po8L7djLAcPZj4FggbdK3UZYVXEpU9xcEsiFw85OajBcgP0arkP+V6284YunsWTbBfYk
         rQ31M2Vi/MPSckkS5E1zgkQ3S5T/JZYdmJcXDXmyUVncDwuolaMyMhcF5Knd5UHhPH3Q
         RQI3rV7ijkIJdkk9gNLwoAmuVNwkNvAB7w8TGAq3A2JYDuzUztmXlGL1ophPmY8/OeFV
         4FvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VQm7To4uDsX9d9R3fcT1P+/sUfi5TE4lE3GICpU48Sg=;
        b=WIQd79qknnqx/e+0YsBqzaQVVfwFmZEpIPUuUCqiZkTVJtPyzfWHlKbyoehVCVmoZs
         ReqI2aXWFhlp7sdxIigVQRN+igL9kq5MtsbPnPFUJyzwf5RSbH7NM+DMtaK6jIhTZCS8
         ytKqi7y0u1TzOjIpx+LgfzbpG6n/7sv8WPkb9aNk69IGDOeQDpAj3HApCrXcdDqvrqOF
         gND468yrGDfdzb4Uvn5sDNh0F4Puw/f3DicA76DvOWsHXWP4BfvEeC/niVOGrgCXCGiM
         MBOIS7eB+tt7dP590ULegUYr1//HMcELSj1cN4mNmFDm0HNgx/ku90PDF8Ba0bcVxVp+
         6MhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ur5wPI93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y26si302672vsj.142.2021.06.17.05.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ur5wPI93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrOH-0000vg-4c
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxH-00024P-3w
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx4-0007A1-Eu
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id v9so6547014wrx.6
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQm7To4uDsX9d9R3fcT1P+/sUfi5TE4lE3GICpU48Sg=;
 b=Ur5wPI93rfgeF31TDhttFbsf7+R++qJKOVcVsufx7aOz+LgYmwTf23F3J4vBtXYz96
 xwbP52gjjh0w9O0BpOM/DqFmW1s4wMITGogxc5ACPeA7kqBn5LaLa2UzgV2rvAsa5VmN
 E5/efQzVCL0Zvfr+gzbhnKQYS/A4tGxqYjkteHR/HTx3jfSEPKPzQDAyAiqKYn+kiQch
 v5x09BDn8Qkn6MZL/C0g5kQfZJauk600deuO9L81xi3aHSVlFk5RzihJufdfO82BauRd
 w5ngng8CLG+tQ0tN0gpu+/CRXAJDLB5nbCfxrlZuba7UDOcOUrLTNg73xrBZ80+IzGi4
 wVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQm7To4uDsX9d9R3fcT1P+/sUfi5TE4lE3GICpU48Sg=;
 b=YoAvofNSUTmL0b/YnToKnstzrOAqAHll0jgawfU0NHOZGkGWzxpmBDsGF9vsG/sQ2R
 r8tDvq8Igs4KgCNF+If0W5jgSeYGBP7DF8TwRPZv6mtcH/iNJcStnZj0xQNuVzxy3fj2
 G2i1DBoF+FqJ/5vFvlsBZXXLiJobpsZ5kbpG7BhQ7SfV0FJELPphKfOchRxoZFvIVyXM
 nACskO69X9m5FsF46Dg+occT0tl2iBAshQU5AiHn4SJ+cgxoyMq1tknyGgN9kKoNjzQW
 7o7cYebelgKmi/wAAM6yKLqOTb7Wie7qieABQmlzHQSuoIfa/Jf8d6CNX/WkQunay+Fa
 wEYg==
X-Gm-Message-State: AOAM5315Cf22RGCA+19B2foKvpsWfMRM7ADwWc1fArRl2bl9fAg15l1h
 +2OHImJLF/hAIEOzD36B94ryCO47v+AaFw==
X-Received: by 2002:a5d:49ce:: with SMTP id t14mr5220185wrs.365.1623932213093; 
 Thu, 17 Jun 2021 05:16:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 29/44] target/arm: Implement MVE VQDMULL scalar
Date: Thu, 17 Jun 2021 13:16:13 +0100
Message-Id: <20210617121628.20116-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wyjEClaxHwL4

Implement the MVE VQDMULL scalar insn. This multiplies the top or
bottom half of each element by the scalar, doubles and saturates
to a double-width result.

Note that this encoding overlaps with VQADD and VQSUB; it uses
what in VQADD and VQSUB would be the 'size=0b11' encoding.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++
 target/arm/mve.decode      | 23 +++++++++++---
 target/arm/mve_helper.c    | 65 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 30 ++++++++++++++++++
 4 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index a0a01d0cc3b..41dd61264e0 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -201,6 +201,11 @@ DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 47ce6ebb83b..a71ad7252bf 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -23,6 +23,9 @@
 %qm 5:1 1:3
 %qn 7:1 17:3
 
+# VQDMULL has size in bit 28: 0 for 16 bit, 1 for 32 bit
+%size_28 28:1 !function=plus_1
+
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
 &2op qd qm qn size
@@ -38,6 +41,7 @@
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 @2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
+@2scalar_nosz .... .... .... .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 
 # Vector loads and stores
 
@@ -168,15 +172,26 @@ VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 
-VQADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
-VQADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
-VQSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
-VQSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+{
+  VQADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+  VQADD_U_scalar  1111  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+  VQDMULLB_scalar 111 . 1110 0 . 11 ... 0 ... 0 1111 . 110 .... @2scalar_nosz \
+                  size=%size_28
+}
+
+{
+  VQSUB_S_scalar  1110  1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+  VQSUB_U_scalar  1111  1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+  VQDMULLT_scalar 111 . 1110 0 . 11 ... 0 ... 1 1111 . 110 .... @2scalar_nosz \
+                  size=%size_28
+}
+
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
+
 # Predicate operations
 %mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 0e168ab47f2..c9f506e260c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -625,6 +625,71 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+/*
+ * Long saturating scalar ops. As with DO_2OP_L, TYPE and H are for the
+ * input (smaller) type and LESIZE, LTYPE, LH for the output (long) type.
+ * SATMASK specifies which bits of the predicate mask matter for determining
+ * whether to propagate a saturation indication into FPSCR.QC -- for
+ * the 16x16->32 case we must check only the bit corresponding to the T or B
+ * half that we used, but for the 32x32->64 case we propagate if the mask
+ * bit is set for either half.
+ */
+#define DO_2OP_SAT_SCALAR_L(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN, SATMASK) \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn;                                                   \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        bool qc = false;                                                \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            LTYPE r = FN((LTYPE)n[H##ESIZE(le * 2 + TOP)], m, &sat);    \
+            mergemask(&d[H##LESIZE(le)], r, mask);                      \
+            qc |= sat && (mask & SATMASK);                              \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+static inline int32_t do_qdmullh(int16_t n, int16_t m, bool *sat)
+{
+    int64_t r = ((int64_t)n * m) * 2;
+    return do_sat_bhw(r, INT32_MIN, INT32_MAX, sat);
+}
+
+static inline int64_t do_qdmullw(int32_t n, int32_t m, bool *sat)
+{
+    /* The multiply can't overflow, but the doubling might */
+    int64_t r = (int64_t)n * m;
+    if (r > INT64_MAX / 2) {
+        *sat = true;
+        return INT64_MAX;
+    } else if (r < INT64_MIN / 2) {
+        *sat = true;
+        return INT64_MIN;
+    } else {
+        return r * 2;
+    }
+}
+
+#define SATMASK16B 1
+#define SATMASK16T (1 << 2)
+#define SATMASK32 ((1 << 4) | 1)
+
+DO_2OP_SAT_SCALAR_L(vqdmullb_scalarh, 0, 2, int16_t, 4, int32_t, \
+                    do_qdmullh, SATMASK16B)
+DO_2OP_SAT_SCALAR_L(vqdmullb_scalarw, 0, 4, int32_t, 8, int64_t, \
+                    do_qdmullw, SATMASK32)
+DO_2OP_SAT_SCALAR_L(vqdmullt_scalarh, 1, 2, int16_t, 4, int32_t, \
+                    do_qdmullh, SATMASK16T)
+DO_2OP_SAT_SCALAR_L(vqdmullt_scalarw, 1, 4, int32_t, 8, int64_t, \
+                    do_qdmullw, SATMASK32)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 84a7320cf80..f73b36cae49 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -454,6 +454,36 @@ DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
 DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
+static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
+{
+    static MVEGenTwoOpScalarFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullb_scalarh,
+        gen_helper_mve_vqdmullb_scalarw,
+        NULL,
+    };
+    if (a->qd == a->qn && a->size == MO_32) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op_scalar(s, a, fns[a->size]);
+}
+
+static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
+{
+    static MVEGenTwoOpScalarFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullt_scalarh,
+        gen_helper_mve_vqdmullt_scalarw,
+        NULL,
+    };
+    if (a->qd == a->qn && a->size == MO_32) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op_scalar(s, a, fns[a->size]);
+}
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
 {
-- 
2.20.1

