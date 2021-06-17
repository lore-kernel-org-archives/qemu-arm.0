Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp500858lff;
        Thu, 17 Jun 2021 05:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQRxHQfWzgaZmaBctC/AAGU6u8f+EaIbBzXAyL75roIabYcEONWI+mifsRtivEZO3unzBa
X-Received: by 2002:a67:eccc:: with SMTP id i12mr4227864vsp.45.1623933659275;
        Thu, 17 Jun 2021 05:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933659; cv=none;
        d=google.com; s=arc-20160816;
        b=JpsbY2UPrz5VQI8CO2RWldcbKFa6RpMlQtzMUC0r5fRRET6V8M/AUS0zv0oXzGYNVI
         pZUKoKZN9L4bbes/4NXB9+CrIVzJh1TkYNHCYmscycgaDMCocuX1IGkPVFdQZcCp3z5J
         GO4TzV5/jC3xhfj7FzsBjT2xLZ0pdQ17a/yeGiNnrzKkuUdrM5+p+c3SvVuhzVx4XE4m
         qZI7AaMcZBHLAzJAe9R1/houTueVs4vMYrRIdIx36reh8JEUNNUFoFbJZ9CdDwez6Fgf
         V6VEaFh2wqco5oK0kwbcYZmvZKyDTuugBMe9N6upmuwu5eTqPOoETPy4635LfraXrrjQ
         BjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=W+IiRg0/uIDtxqfm2zAjCe848g0evJop7egM4ojduX4=;
        b=DUTE43TVaiRkrjxWuooCBkBQEEiB9TgdNs9Oc8B1ZGoi8VG7NvbjwZ85Rmc+xmGczl
         kIG+dI1MzkySye/18jxR9gP3Ox0EEB0TsoR48k5rVEH5Hsg2MgD6ptFNncj0myWcSYGa
         dDwQXolOmpVORt+pGA3/47wjD5BopDPppLa8WPanipWmpJB+bV7uMaHhXnISnJQGZ43z
         l84wZtB2DOGhSbOrahL03tzCXg3ancr9pYo3ENJozzlEdvKU6stPQIB4exHTOU4k3Jpj
         HVUFucevOQmAl3emSXHUMmEJsfzjsVam7W0YF9ubmGN2Yq/x8nyTNfacsJ2w51BhbuVC
         KVUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccvT4do9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si3316679vsa.140.2021.06.17.05.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccvT4do9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrKM-0006Wq-IP
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxG-000231-MJ
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx5-0007AR-A2
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z8so6514360wrp.12
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W+IiRg0/uIDtxqfm2zAjCe848g0evJop7egM4ojduX4=;
 b=ccvT4do9tdoTKddmHn761Pnowom7qG/YtHsvh7/wsRja4n7m4Wp2Ai/fLiqrQdimAB
 DK4BeAXZ9qqpIjpqEuo92z7t0TZOQpIHsGAiPcgSlq8F4/vrQPqUsKUxEKNsnAo+CXfk
 bvoxFWDPK468eDMeFpIwSdESzlM9GvjYrLVFsvLlZvi/NSyFO7TzSmfTsrEkAOVxthMO
 cl6UUWDZCaYgVCRY2Va8olFN+2aT2hoyilO9yeX4QNKoT3uJEsZqinJvp5ViAoCwFPVp
 TZxCAS8k+DPK8mAjZ2rmEux7VeIdXQHarb0dTUVAPhKPbRa5m0WPvELooZxNowsYo3pj
 t64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W+IiRg0/uIDtxqfm2zAjCe848g0evJop7egM4ojduX4=;
 b=lcrJxuieKLxbw/BLitd97oYrmJ5gR22l4CsHB41tDfYVnVEdRpFWib8pmokdEsZN7V
 LLM+RZVkEvq+fYycwXxCPJoIXM7RdBZb6tY0PF1Vw4BvLVr0acQb51351vFefPYP8orL
 co0fVH7KnZ7wVzhhVNDA1vublgIJ7BPo2tLC5gGSzVNfRm1ZQ2pzJ981mECQy3lo4+eD
 zkWxwa+oEJKct8OB962BpjQLjNEyK/H7tFZwHpcNwOeLWWztywn4ycQ9qfWFjdL4vSPk
 /1scrmdmtlHIEFt0vq97UXo2Vfeb7TBRuzuSowN4cZ0O9Lhc1+91WWxI3uHCE0atCSMr
 JGaA==
X-Gm-Message-State: AOAM532qd3HPcRogwiOXSEw2ljcSuPJ0REOCjkwNpSvMYZdZ+2wrONqK
 Is7e24dZ7Cf/yq8q1HMdYjxhtPdvxE1qaQ==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr5379420wrm.229.1623932213886; 
 Thu, 17 Jun 2021 05:16:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 30/44] target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
Date: Thu, 17 Jun 2021 13:16:14 +0100
Message-Id: <20210617121628.20116-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: 23FlkALeRBTJ

Implement the vector forms of the MVE VQDMULH and VQRDMULH insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 27 +++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 41dd61264e0..c4e766c6511 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -145,6 +145,14 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index a71ad7252bf..9860d43f73c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -113,6 +113,9 @@ VMULL_BU         111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
 VMULL_TS         111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 
+VQDMULH          1110 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
+VQRDMULH         1111 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c9f506e260c..d17c5e4588b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -385,6 +385,25 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT(OP, ESIZE, TYPE, FN)                                 \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        bool qc = false;                                                \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            TYPE r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);          \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -551,6 +570,14 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 #define DO_QRDMULH_W(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 30)) >> 31, \
                                          INT32_MIN, INT32_MAX, s)
 
+DO_2OP_SAT(vqdmulhb, 1, int8_t, DO_QDMULH_B)
+DO_2OP_SAT(vqdmulhh, 2, int16_t, DO_QDMULH_H)
+DO_2OP_SAT(vqdmulhw, 4, int32_t, DO_QDMULH_W)
+
+DO_2OP_SAT(vqrdmulhb, 1, int8_t, DO_QRDMULH_B)
+DO_2OP_SAT(vqrdmulhh, 2, int16_t, DO_QRDMULH_H)
+DO_2OP_SAT(vqrdmulhw, 4, int32_t, DO_QRDMULH_W)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f73b36cae49..ec9a9852868 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -396,6 +396,8 @@ DO_2OP(VMULL_BS, vmullbs)
 DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
+DO_2OP(VQDMULH, vqdmulh)
+DO_2OP(VQRDMULH, vqrdmulh)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

