Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5541893lfc;
        Thu, 29 Jul 2021 04:22:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf2yjSvzrRxnFMr9/7KnHeXQfYdoKRrtiESFpUnHUDo61XC3/+43c3yt7A75GjGuC2BLog
X-Received: by 2002:a92:d790:: with SMTP id d16mr3396430iln.185.1627557762133;
        Thu, 29 Jul 2021 04:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557762; cv=none;
        d=google.com; s=arc-20160816;
        b=k9q85uqMuzqlxnwp4sKr+syrq6X4Bf6GIlQWfmBihcXEQFaYP8lFk4EBdMofs2Q0C6
         iC+kRJRLFMGZdtLXDxlgrpyCg0LIBjdfvwyt6V2fn/+nlhNhpXWFQo5VZfDcK02J+Tph
         Be79hUMUMIh0Blj1I/foh+9wuR9rgguTmsK/VnTNOmZPXY2iphrxlCtUGsITtkhKbdUd
         iGQ2dQ91BYk1AOHQUUnzxkRvmbp008ahtkJJqJ7lznSb10vEGrd4+JsLI83rxWBtCcSn
         XhpQyKV6Y4mpUp30Ky927e9kR91jUepbuPUolr+YnjzBpSC0pS0a5tlywHNcl3HV9MDZ
         iT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ByVPvCjeaXnuNCmNSTqYK/dafUjEZDazMD4qmT4NIMQ=;
        b=KTEl/0HDUhloanOzXuUmNyFJ0mTnMnOYCyLai+okr73US+s8bNTJ/0uNb1K61xqhbp
         ZjwIefDPxbN5WqiTIO2HWKAH9J0LdW9+WnC+8dxGIf0Qm7A6bZRmhzelpJfdmO25V7R3
         LN1XsN7AiiQ93GrViCAW+IcSY8U2S2keH8mIp2PgFxV4UmxRKXpVAk6LXAUkiwzsZGEY
         T/on9LAqICSGQeqVZ66g9RCdFKwuW0qkkh4pnLsG80V4NSAD8eJXA3dtBGQ0gmB6io9n
         aAEGtWwxFgzbSkspe0ItIqZ9OWyvgDuOUEOjLxCPJ2hdzll0mJsOFQ8v56RJHQK0zhoA
         g8Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BELPXcfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si2922707ils.46.2021.07.29.04.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BELPXcfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m947d-0006jE-Dn
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940v-0000dC-6G
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940e-00017x-Ta
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso140091wms.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ByVPvCjeaXnuNCmNSTqYK/dafUjEZDazMD4qmT4NIMQ=;
 b=BELPXcfazIFo32Q5v5xVEhvFb6jb+0JWMkAKNiiZChKhJXlH9kODFd2XcHCXmSk4wk
 sTMKAFzzw5XNUeq/dX4rBXizyC4u6OsgV/+sMS7UzHKA37uNRpNghoIO1Qii9JxjwCX9
 Bg4t2QfjgaIUoJmxH0IQgdp9X+srENE4WIxnvxltkuj7qjd/bhoZJhXfHLE48MTXYEQ1
 V77/QH/4BFBm8uVc/9xe2gHl4DCc2vu+6k8WOOkFs5sSJOeOdo1I574yGsbGPOfu8T+e
 R8ioSCZ6CyneXQqoTKkaUZCjF3JWShjmZBQkOp8VRM8tSAaRihezGi4B+iP8nU0DhIsU
 Nl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByVPvCjeaXnuNCmNSTqYK/dafUjEZDazMD4qmT4NIMQ=;
 b=BZeMq3SuWJP/mVR2dz84N8jbeYjRT4IqlLNeoQp+Vmrv/q5eRJOOSvkZpw0SqK5F1K
 I67YZeq7SpsBs78qR3OsNs1/VMmSEnpZ+fpQ40USQcweoPGkwicBYp4xztkI7i+a0J1b
 gzb1x9OiL65x9VUku8EeTuhldiAFBgI0smk2e1Dc6N7aiPtxECVs1mNXT7B63h5fTARB
 fKUOGYeONFYDcmKdyLPjYsgFkE1ymKEliX79J1DRryrSOZ9fWUb27xaE5g0X8Ut5DSFV
 q/PmuB9vibjof3qdaRtl8wlXdLGcK8A43RQlJNPM1sMm2Yg4X7CCKz5/6+a7xLWCXL/c
 fQ1Q==
X-Gm-Message-State: AOAM5337Kc7LFzqaPsWNdLdDuoR0CkEcvH0N2jtrVMXuZwE1RoxwiHMb
 pUT5whepSgqX8SUW7OAglNqbnOKrxLofkg==
X-Received: by 2002:a05:600c:4141:: with SMTP id
 h1mr4131651wmm.83.1627557327315; 
 Thu, 29 Jul 2021 04:15:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 15/53] target/arm: Implement MVE integer vector
 comparisons
Date: Thu, 29 Jul 2021 12:14:34 +0100
Message-Id: <20210729111512.16541-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: RGb8Kukto0fZ

Implement the MVE integer vector comparison instructions.  These are
"VCMP (vector)" encodings T1, T2 and T3, and "VPT (vector)" encodings
T1, T2 and T3.

These insns compare corresponding elements in each vector, and update
the VPR.P0 predicate bits with the results of the comparison.  VPT
also sets the VPR.MASK01 and VPR.MASK23 fields -- it is effectively
"VCMP then VPST".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 32 ++++++++++++++++++++++
 target/arm/mve.decode      | 18 +++++++++++-
 target/arm/mve_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 47 ++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index b9af03cc03b..ca5a6ab51cc 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -480,3 +480,35 @@ DEF_HELPER_FLAGS_3(mve_uqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_sqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_uqrshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_sqrshr, TCG_CALL_NO_RWG, i32, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpeqb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpeqh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpeqw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpneb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpneh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpnew, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpcsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpcsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpcsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmphib, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmphih, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmphiw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpgeb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgeh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgew, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpltb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmplth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpltw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpgtb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgtw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpleb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpleh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmplew, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 88c9c18ebf1..76bbf9a6136 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -37,6 +37,7 @@
 &2shift qd qm shift size
 &vidup qd rn size imm
 &viwdup qd rn rm size imm
+&vcmp qm qn size mask
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -86,6 +87,10 @@
 @2_shr_w .... .... .. 1 ..... .... .... .... .... &2shift qd=%qd qm=%qm \
          size=2 shift=%rshift_i5
 
+# Vector comparison; 4-bit Qm but 3-bit Qn
+%mask_22_13      22:1 13:3
+@vcmp    .... .... .. size:2 qn:3 . .... .... .... .... &vcmp qm=%qm mask=%mask_22_13
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -345,7 +350,6 @@ VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 }
 
 # Predicate operations
-%mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
 
 # Logical immediate operations (1 reg and modified-immediate)
@@ -458,3 +462,15 @@ VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_b
 VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_h
 
 VSHLC             111 0 1110 1 . 1 imm:5 ... 0 1111 1100 rdm:4 qd=%qd
+
+# Comparisons. We expand out the conditions which are split across
+# encodings T1, T2, T3 and the fc bits. These include VPT, which is
+# effectively "VCMP then VPST". A plain "VCMP" has a mask field of zero.
+VCMPEQ            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 0 @vcmp
+VCMPNE            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 0 @vcmp
+VCMPCS            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 1 @vcmp
+VCMPHI            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 1 @vcmp
+VCMPGE            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
+VCMPLT            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
+VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
+VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 38b4181db2a..b0b380b94b0 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1758,3 +1758,59 @@ static uint32_t do_sub_wrap(uint32_t offset, uint32_t wrap, uint32_t imm)
 DO_VIDUP_ALL(vidup, DO_ADD)
 DO_VIWDUP_ALL(viwdup, do_add_wrap)
 DO_VIWDUP_ALL(vdwdup, do_sub_wrap)
+
+/*
+ * Vector comparison.
+ * P0 bits for non-executed beats (where eci_mask is 0) are unchanged.
+ * P0 bits for predicated lanes in executed beats (where mask is 0) are 0.
+ * P0 bits otherwise are updated with the results of the comparisons.
+ * We must also keep unchanged the MASK fields at the top of v7m.vpr.
+ */
+#define DO_VCMP(OP, ESIZE, TYPE, FN)                                    \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, void *vm)   \
+    {                                                                   \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        uint16_t beatpred = 0;                                          \
+        uint16_t emask = MAKE_64BIT_MASK(0, ESIZE);                     \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++) {                              \
+            bool r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)]);                \
+            /* Comparison sets 0/1 bits for each byte in the element */ \
+            beatpred |= r * emask;                                      \
+            emask <<= ESIZE;                                            \
+        }                                                               \
+        beatpred &= mask;                                               \
+        env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) |           \
+            (beatpred & eci_mask);                                      \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCMP_S(OP, FN)                       \
+    DO_VCMP(OP##b, 1, int8_t, FN)               \
+    DO_VCMP(OP##h, 2, int16_t, FN)              \
+    DO_VCMP(OP##w, 4, int32_t, FN)
+
+#define DO_VCMP_U(OP, FN)                       \
+    DO_VCMP(OP##b, 1, uint8_t, FN)              \
+    DO_VCMP(OP##h, 2, uint16_t, FN)             \
+    DO_VCMP(OP##w, 4, uint32_t, FN)
+
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_NE(N, M) ((N) != (M))
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_GE(N, M) ((N) >= (M))
+#define DO_LT(N, M) ((N) < (M))
+#define DO_GT(N, M) ((N) > (M))
+#define DO_LE(N, M) ((N) <= (M))
+
+DO_VCMP_U(vcmpeq, DO_EQ)
+DO_VCMP_U(vcmpne, DO_NE)
+DO_VCMP_U(vcmpcs, DO_GE)
+DO_VCMP_U(vcmphi, DO_GT)
+DO_VCMP_S(vcmpge, DO_GE)
+DO_VCMP_S(vcmplt, DO_LT)
+DO_VCMP_S(vcmpgt, DO_GT)
+DO_VCMP_S(vcmple, DO_LE)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6d8da361469..2d7211b5271 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -43,6 +43,7 @@ typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
+typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -1182,3 +1183,49 @@ static bool trans_VDWDUP(DisasContext *s, arg_viwdup *a)
     };
     return do_viwdup(s, a, fns[a->size]);
 }
+
+static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
+{
+    TCGv_ptr qn, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qm) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qn, qm);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+    if (a->mask) {
+        /* VPT */
+        gen_vpst(s, a->mask);
+    }
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VCMP(INSN, FN)                                       \
+    static bool trans_##INSN(DisasContext *s, arg_vcmp *a)      \
+    {                                                           \
+        static MVEGenCmpFn * const fns[] = {                    \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_vcmp(s, a, fns[a->size]);                     \
+    }
+
+DO_VCMP(VCMPEQ, vcmpeq)
+DO_VCMP(VCMPNE, vcmpne)
+DO_VCMP(VCMPCS, vcmpcs)
+DO_VCMP(VCMPHI, vcmphi)
+DO_VCMP(VCMPGE, vcmpge)
+DO_VCMP(VCMPLT, vcmplt)
+DO_VCMP(VCMPGT, vcmpgt)
+DO_VCMP(VCMPLE, vcmple)
-- 
2.20.1

