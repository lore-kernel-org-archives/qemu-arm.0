Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp499973lff;
        Thu, 17 Jun 2021 05:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqJOOsGDfBOGqGJyDbvN1mjyE3jgpCrNxY0S2VJO5leh8jeu4PTZU548HFaL7ouo8iUzRa
X-Received: by 2002:a1f:cb05:: with SMTP id b5mr3806595vkg.9.1623933590222;
        Thu, 17 Jun 2021 05:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933590; cv=none;
        d=google.com; s=arc-20160816;
        b=XtiXUlj8tgcagYxEdHuV0Bjzhq/f43IEVsTMIiWAIts17ApQwTk2ilIpU4NRkmONS7
         9w7P6GwbF+CTWNK+djIeruw5YMujuCqWUXUNVxuM57XM6r/A8cNI6kkIcCRCKd3/QF33
         com9baAUa2OIrM8Qkur8FtpdiGk1pzExlw+zVxS7leGf5qYSHXefwximTp7SVGs5PUZJ
         HPgb+Gpz3BMKPf3AgRv3+J34nuuybuVqftSaGuYbE75JzL+WBYy2SBFLXE7sWBMlvmr3
         X7gLTm510riZfozgyFL9zCP8M9NzeZWYtQGoJbEtdvI5Ja7OCQOedmKHSHUfrbQpJ0vO
         0lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LLRNFGfx3pHD+bNxaIzhEjWQfa2o1cI6nDkO6Q1JwyQ=;
        b=zVJQyMV+PCE6znld0PaubKzjcKllxT17ADkA8DDvj3Mr5iDw9ODqdm1+Z9WFOryoIe
         2oonq6ZNgIoJyC7qLuCvfyIdplQZnao3Jrte/cLHdN5fDnrMyMLIiTRKMSF/L9z8dxtl
         k8w2cobytTLOXLyzKsbuaGnmiVvmH/m/EiTOOwl/QAMhabc6eCqOtJmlixeowTkymjWd
         JkOkmjYxvEvqgn5tJBBTHVRSAitf0u58atcyQKMV5RC+1H7iUo9hybOzxrmP/d9Ty5Zj
         P2/qyvoaf1wsnQg+ZYZLzTplBNodPUn1ZzPz49cJRBHjrAoEhQN3KBSi0CJcsMkZnhxs
         mndA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQK6LyTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si4120292vsp.32.2021.06.17.05.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQK6LyTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrJF-0004gB-Cb
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxD-0001vZ-LX
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx2-00078C-VD
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id i94so6537145wri.4
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLRNFGfx3pHD+bNxaIzhEjWQfa2o1cI6nDkO6Q1JwyQ=;
 b=kQK6LyTCYGu2S9N8J3f90DNEdkqyviwVuvBsomhPp00SxMWanIVMvforLWj5wtIA9P
 8ysHOR0WJbwhurcyCt/PtJo92iny+4gl14qAtTow7N7aBnM/7kDCTLTeXT4HcuU1KoL+
 OYDhZQhi2tQsw2cYizaHv/Wd5L1DhjHF4NctUfuwUanrpCUQey8r8tPM0bkHX5/N77h2
 1gRHp32QO4b64M+2Rj4Wb5mq7yzN1wChms8hs2JVr7kESp3BAYG2YKzCJW48YXxbSaeE
 vE2nxUCcoTRBw3rpuziHoB3pw3ZFuTHNiL9YBWqre5VuvEsLw3ySreEIz4TGK5T31anX
 FkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLRNFGfx3pHD+bNxaIzhEjWQfa2o1cI6nDkO6Q1JwyQ=;
 b=Jeehr7w0lwFC/JOvjFFDFoZsN85q9C1I2Q/ylkTrWJe+dylIuaGfY/xZH0k5Olwj7G
 y8opXNM/SsKcpXLRUvqSNVIxsjdj68BG7xSR5c9OUJmHSnRthiCuF1q7aw+lObSCoWv7
 /K/u0NHunaDkEunqcnUi9s4Y/zBABhJt03DOJz7eOr7WPCXqrdSuKDjWPB5doeXJasbv
 T6bsFQ2oEmpCXmbi3qC+OzsR6B4/Mdwq9ctmwx6Itfoub/P44XNJQkWTwBfW/lDcVZSa
 JOT+JlcYM01rvKrbaQ3N4QCFrL+4L8wTdu2uYo4GqAhu7GyS28TYWr1rHIkVVTjjKvBb
 CUUg==
X-Gm-Message-State: AOAM531tKIqT2zeGapsEHeF3BFL2FJ33+F8Ng5vbA5xd7EauRya/I4V5
 V0JF2pEI6em0vijmkdO0NerlTsC0VD7pwA==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr5282757wrd.186.1623932211485; 
 Thu, 17 Jun 2021 05:16:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 27/44] target/arm: Implement MVE VQADD and VQSUB
Date: Thu, 17 Jun 2021 13:16:11 +0100
Message-Id: <20210617121628.20116-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: cLw9tiwGaRsd

Implement the MVE VQADD and VQSUB insns, which perform saturating
addition of a scalar to each element.  Note that individual bytes of
each result element are used or discarded according to the predicate
mask, but FPSCR.QC is only set if the predicate mask for the lowest
byte of the element is set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++
 target/arm/mve.decode      |  5 +++
 target/arm/mve_helper.c    | 62 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 +++
 4 files changed, 87 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1b807e1cf5f..092efdab475 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -173,6 +173,22 @@ DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqadds_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqadds_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqadds_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqaddu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqaddu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqaddu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqsubs_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqsubs_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqsubs_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e189e2de648..c85227c675a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -167,6 +167,11 @@ VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+
+VQADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+VQADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+VQSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+VQSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 
 # Predicate operations
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 775c667561e..0ae2aeadbb2 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -505,6 +505,33 @@ DO_2OP_U(vhaddu, do_vhadd_u)
 DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
+static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
+{
+    if (val > max) {
+        *s = true;
+        return max;
+    } else if (val < min) {
+        *s = true;
+        return min;
+    }
+    return val;
+}
+
+#define DO_SQADD_B(n, m, s) do_sat_bhw((int64_t)n + m, INT8_MIN, INT8_MAX, s)
+#define DO_SQADD_H(n, m, s) do_sat_bhw((int64_t)n + m, INT16_MIN, INT16_MAX, s)
+#define DO_SQADD_W(n, m, s) do_sat_bhw((int64_t)n + m, INT32_MIN, INT32_MAX, s)
+
+#define DO_UQADD_B(n, m, s) do_sat_bhw((int64_t)n + m, 0, UINT8_MAX, s)
+#define DO_UQADD_H(n, m, s) do_sat_bhw((int64_t)n + m, 0, UINT16_MAX, s)
+#define DO_UQADD_W(n, m, s) do_sat_bhw((int64_t)n + m, 0, UINT32_MAX, s)
+
+#define DO_SQSUB_B(n, m, s) do_sat_bhw((int64_t)n - m, INT8_MIN, INT8_MAX, s)
+#define DO_SQSUB_H(n, m, s) do_sat_bhw((int64_t)n - m, INT16_MIN, INT16_MAX, s)
+#define DO_SQSUB_W(n, m, s) do_sat_bhw((int64_t)n - m, INT32_MIN, INT32_MAX, s)
+
+#define DO_UQSUB_B(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT8_MAX, s)
+#define DO_UQSUB_H(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT16_MAX, s)
+#define DO_UQSUB_W(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT32_MAX, s)
 
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
@@ -520,6 +547,27 @@ DO_2OP_U(vhsubu, do_vhsub_u)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT_SCALAR(OP, ESIZE, TYPE, FN)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        bool qc = false;                                                \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            mergemask(&d[H##ESIZE(e)], FN(n[H##ESIZE(e)], m, &sat),     \
+                      mask);                                            \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 /* provide unsigned 2-op scalar helpers for all sizes */
 #define DO_2OP_SCALAR_U(OP, FN)                 \
     DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
@@ -538,6 +586,20 @@ DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
 DO_2OP_SCALAR_S(vhsubs_scalar, do_vhsub_s)
 DO_2OP_SCALAR_U(vhsubu_scalar, do_vhsub_u)
 
+DO_2OP_SAT_SCALAR(vqaddu_scalarb, 1, uint8_t, DO_UQADD_B)
+DO_2OP_SAT_SCALAR(vqaddu_scalarh, 2, uint16_t, DO_UQADD_H)
+DO_2OP_SAT_SCALAR(vqaddu_scalarw, 4, uint32_t, DO_UQADD_W)
+DO_2OP_SAT_SCALAR(vqadds_scalarb, 1, int8_t, DO_SQADD_B)
+DO_2OP_SAT_SCALAR(vqadds_scalarh, 2, int16_t, DO_SQADD_H)
+DO_2OP_SAT_SCALAR(vqadds_scalarw, 4, int32_t, DO_SQADD_W)
+
+DO_2OP_SAT_SCALAR(vqsubu_scalarb, 1, uint8_t, DO_UQSUB_B)
+DO_2OP_SAT_SCALAR(vqsubu_scalarh, 2, uint16_t, DO_UQSUB_H)
+DO_2OP_SAT_SCALAR(vqsubu_scalarw, 4, uint32_t, DO_UQSUB_W)
+DO_2OP_SAT_SCALAR(vqsubs_scalarb, 1, int8_t, DO_SQSUB_B)
+DO_2OP_SAT_SCALAR(vqsubs_scalarh, 2, int16_t, DO_SQSUB_H)
+DO_2OP_SAT_SCALAR(vqsubs_scalarw, 4, int32_t, DO_SQSUB_W)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 7c4c06e434c..27c69d9c7dd 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -446,6 +446,10 @@ DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
 DO_2OP_SCALAR(VHADD_U_scalar, vhaddu_scalar)
 DO_2OP_SCALAR(VHSUB_S_scalar, vhsubs_scalar)
 DO_2OP_SCALAR(VHSUB_U_scalar, vhsubu_scalar)
+DO_2OP_SCALAR(VQADD_S_scalar, vqadds_scalar)
+DO_2OP_SCALAR(VQADD_U_scalar, vqaddu_scalar)
+DO_2OP_SCALAR(VQSUB_S_scalar, vqsubs_scalar)
+DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
-- 
2.20.1

