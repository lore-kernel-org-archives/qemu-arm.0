Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1700027lfc;
        Fri, 28 Aug 2020 11:53:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypx+f2oJPMOIHyjglX0kJUNtZ6UyAocWwgep2m9RZFvge+9pt4p3I/xhAiOBz+uOrFF/Ff
X-Received: by 2002:a25:5056:: with SMTP id e83mr4463607ybb.507.1598640837472;
        Fri, 28 Aug 2020 11:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640837; cv=none;
        d=google.com; s=arc-20160816;
        b=vVIGW9ZmyGEbAwSlP2d1wdTnEah/BJSGkIyt6D04l22+qyjvcu7+CUdu0vumMT5YZ/
         IHsU9m2BdCujOFEErpnBVQEJACdtOIWmikSeX0Q7wsUVhlPPH+nrM8f3FKIxHIUvTytz
         7jvQok8x6d17JS+x4eK9krKiZwHiXGQqsbilpeuYvCYlqb0WlYLmVdbSiR5IA1WcJpMU
         F3R7oIXblCTntdoGFfg+nQcMrRcOWGL/6rI3QaVHpv7jmD4+ORf4mZLGXfClpcbOP1Wk
         1OMgqjGLLSU7fzL3Je5giBt9wlxdT2mDNZW6SOBxXR1KzWSZWCORt5+uvO3Au2fn5tFv
         gt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HSD4Ok+lVOk3ozBpF+h1bA5KfuR9MqRLk2CJgQiIC48=;
        b=HulqzlrF6/uHPh7pFWd0NfNrhG4cgH3NFZVTFprKYmr7J8BMRPUP5iKmEYmgAq8q3E
         ovfhTCRh771GGzc2w3P69Bj4DTl3+dBzr9A/x8r6/kNsMyyaKRP+4fG+1JGSsO9/Iwbr
         KE1UFGmxW2fEiuT5cGH2b8UjuEufQoGrderJSpeOaW8Z432ybRYK0IxXEVwetIDNsUm9
         TCxSqcOz9HiNj/7mf2jYCOhg8BkN6el2jcyPTj+6MuR6OIop6Lsehmv5LXphgO+MyzDX
         oPVmYxRdJkaFqVH3zjBnygHbvypSepz5rR2Vz/CF6sQlA7uqPoNfcMachQ/uHkuN1Lk1
         ioWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HAdC00iK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i67si146030ybb.71.2020.08.28.11.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HAdC00iK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjVc-0007vQ-Mr
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCr-0002s0-7G
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:33 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCo-00062P-72
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:32 -0400
Received: by mail-wm1-x342.google.com with SMTP id s13so119636wmh.4
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HSD4Ok+lVOk3ozBpF+h1bA5KfuR9MqRLk2CJgQiIC48=;
 b=HAdC00iKnQkLsrhG6SOxQAikMk1ibWzq/ScOgWV5TeG6ax87GKUWzhJZBChIwnere3
 gK4usvnEwSvpDZUXwOvHkQD/59XmI4hxNu3yywWMI2BfaJJAH0FG9HL9P9K3elfWlyzB
 BrTrfz/3Wcetx8VfFmrUdowZF1XZi/J7pWhLGh/i+jtIEdDelyVGW3qhMD+o7j3yOmtw
 6lvIuBClD/UMkeK1vjrBgBMkAXnjwigJT2BExaP/Z0S0THpWPhrW7AwhGK9KKgTwfRHP
 1fFA2vRAVqO/wflZQcQqJ2sQfwjYXizxMj/rvafbsPsEPpNcCnpt0r7g5yAZmA3AKX4v
 bReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSD4Ok+lVOk3ozBpF+h1bA5KfuR9MqRLk2CJgQiIC48=;
 b=uU85BEJm7SZdafRan0RxKmARHRjnkOsxod5hv7wXR1/9ltMe+d9HB7m3KhoQLHooAe
 CiUnJ8zwWW2LYgmkfJSFio9YEUQfRi2RgXm2d71+ZkjtDOFlAN82ZxT1QlsvPycVwqJr
 u8aNaoGGI4/fIHV03zsctXijCDW2cYzbLyIlqvsQ3WaewEKZSB/9BabyZ9Wiz8G5eSCd
 RWRPMq8f2PezZaiY77K6nSGijtjA69AUZCG6q8/lMGotgX4NdyKZxmGMyQ/iGi6NKNls
 lxiFmI60ENn3xxdtUPUkncE2YTMoLO+oucgMApiWjriSTJ8qKsLtBnIJ8aHI9ROddgrU
 +evg==
X-Gm-Message-State: AOAM532Ym7Z0TRMZihFrGEUZAgwynMjlRkoBgwwVI9QVuSc8SoJbg/Ii
 QQSIpXQZJdJVfNUZjLyIs6jXfI4epH4Be54d
X-Received: by 2002:a1c:e907:: with SMTP id q7mr4155wmc.155.1598639668351;
 Fri, 28 Aug 2020 11:34:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 26/45] target/arm: Implement fp16 for VCEQ, VCGE,
 VCGT comparisons
Date: Fri, 28 Aug 2020 19:33:35 +0100
Message-Id: <20200828183354.27913-27-peter.maydell@linaro.org>
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
X-TUID: tDR/mz3aF+id

Convert the Neon floating-point vector comparison ops VCEQ,
VCGE and VCGT over to using a gvec helper and use this to
implement the fp16 case.

(We put the float16_ceq() etc functions above the DO_2OP()
macro definition because later when we convert the
compare-against-zero instructions we'll want their
definitions to be visible at that point in the source file.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             |  9 +++++++
 target/arm/vec_helper.c         | 44 +++++++++++++++++++++++++++++++++
 target/arm/translate-neon.c.inc |  6 ++---
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index aa1ac75571f..a05a0d1a427 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -632,6 +632,15 @@ DEF_HELPER_FLAGS_5(gvec_fmul_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fabd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fabd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fceq_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fceq_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fcge_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcge_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fcgt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcgt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 988d5784e83..f60968f4997 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -656,6 +656,41 @@ void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+/*
+ * Floating point comparisons producing an integer result (all 1s or all 0s).
+ * Note that EQ doesn't signal InvalidOp for QNaNs but GE and GT do.
+ * Softfloat routines return 0/1, which we convert to the 0/-1 Neon requires.
+ */
+static uint16_t float16_ceq(float16 op1, float16 op2, float_status *stat)
+{
+    return -float16_eq_quiet(op1, op2, stat);
+}
+
+static uint32_t float32_ceq(float32 op1, float32 op2, float_status *stat)
+{
+    return -float32_eq_quiet(op1, op2, stat);
+}
+
+static uint16_t float16_cge(float16 op1, float16 op2, float_status *stat)
+{
+    return -float16_le(op2, op1, stat);
+}
+
+static uint32_t float32_cge(float32 op1, float32 op2, float_status *stat)
+{
+    return -float32_le(op2, op1, stat);
+}
+
+static uint16_t float16_cgt(float16 op1, float16 op2, float_status *stat)
+{
+    return -float16_lt(op2, op1, stat);
+}
+
+static uint32_t float32_cgt(float32 op1, float32 op2, float_status *stat)
+{
+    return -float32_lt(op2, op1, stat);
+}
+
 #define DO_2OP(NAME, FUNC, TYPE) \
 void HELPER(NAME)(void *vd, void *vn, void *stat, uint32_t desc)  \
 {                                                                 \
@@ -747,6 +782,15 @@ DO_3OP(gvec_ftsmul_d, float64_ftsmul, float64)
 DO_3OP(gvec_fabd_h, float16_abd, float16)
 DO_3OP(gvec_fabd_s, float32_abd, float32)
 
+DO_3OP(gvec_fceq_h, float16_ceq, float16)
+DO_3OP(gvec_fceq_s, float32_ceq, float32)
+
+DO_3OP(gvec_fcge_h, float16_cge, float16)
+DO_3OP(gvec_fcge_s, float32_cge, float32)
+
+DO_3OP(gvec_fcgt_h, float16_cgt, float16)
+DO_3OP(gvec_fcgt_s, float32_cgt, float32)
+
 #ifdef TARGET_AARCH64
 
 DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index a1bf8dcee09..94871f8597d 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -1112,6 +1112,9 @@ DO_3S_FP_GVEC(VADD, gen_helper_gvec_fadd_s, gen_helper_gvec_fadd_h)
 DO_3S_FP_GVEC(VSUB, gen_helper_gvec_fsub_s, gen_helper_gvec_fsub_h)
 DO_3S_FP_GVEC(VABD, gen_helper_gvec_fabd_s, gen_helper_gvec_fabd_h)
 DO_3S_FP_GVEC(VMUL, gen_helper_gvec_fmul_s, gen_helper_gvec_fmul_h)
+DO_3S_FP_GVEC(VCEQ, gen_helper_gvec_fceq_s, gen_helper_gvec_fceq_h)
+DO_3S_FP_GVEC(VCGE, gen_helper_gvec_fcge_s, gen_helper_gvec_fcge_h)
+DO_3S_FP_GVEC(VCGT, gen_helper_gvec_fcgt_s, gen_helper_gvec_fcgt_h)
 
 /*
  * For all the functions using this macro, size == 1 means fp16,
@@ -1127,9 +1130,6 @@ DO_3S_FP_GVEC(VMUL, gen_helper_gvec_fmul_s, gen_helper_gvec_fmul_h)
         return do_3same_fp(s, a, FUNC, READS_VD);                   \
     }
 
-DO_3S_FP(VCEQ, gen_helper_neon_ceq_f32, false)
-DO_3S_FP(VCGE, gen_helper_neon_cge_f32, false)
-DO_3S_FP(VCGT, gen_helper_neon_cgt_f32, false)
 DO_3S_FP(VACGE, gen_helper_neon_acge_f32, false)
 DO_3S_FP(VACGT, gen_helper_neon_acgt_f32, false)
 DO_3S_FP(VMAX, gen_helper_vfp_maxs, false)
-- 
2.20.1

