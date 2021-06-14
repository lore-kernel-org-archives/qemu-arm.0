Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2089323lff;
        Mon, 14 Jun 2021 08:48:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD9MHCGbKVg45C0HEcLJP6LKruE1KIPTFFb/tVA8Hlx1ltg/n9QfJpEXwDVRA9krCxEd6D
X-Received: by 2002:ab0:b03:: with SMTP id b3mr12878050uak.25.1623685702023;
        Mon, 14 Jun 2021 08:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623685702; cv=none;
        d=google.com; s=arc-20160816;
        b=epwCli3IudVeh2uNKKul69dTE0ik2U9FG+RyzZG6bS4oLPN+HwlyKagghB2VJPnKQt
         7BNWus/bxsn1DXoMKPhnkHRho+UNNOdYQPh1SWfrzhYxAcaXnUts39nSnMTn34Be8eK+
         Ne2IS/pQUK1jnzv/SlpFzaxXxUxJVkWG34LYAdciH3/KBA2SY7klzz8i7HEjSmZTbCQA
         qDEN7uAmKJDmIL0wLGC8CviX0ioEFKk4pwT0K35hOETmWJ5ttmIhAiA23VKjl9WumGEd
         gSjkcHKJ3MWI0+huz0G1xESPQlL5U9y/2SJwXtcM5WgFpK5+3jZbBg50V/TSzQDapII0
         EhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LQIZ2hXFKAozxTxF683FfwFrKB+OECd//iRpd2UZwGI=;
        b=d/HUOkZOqKtSlIJIDmmK81nQ9h5aqKGwLPgliraqIrTxVCqhACYbbNdTtffq+sFhGG
         DwrJPPSqzqLxSB+t8sXeDIVOgi6XkRTQkByu6lFP1pdjjPKTFMc1VMeDtaiqq1dtOEIN
         0tlPwCNxlIH0lrUQ9n3ShjmgWtBfX8+BTn7eJyUlYcCx9h4B5bs/Aks2iE2KVkj12Td5
         b+ZQyFQJb2Ri47BYqTM/9rSgwezguDNkAJ5T6o99CbNUkDlXi3KU5/IWfy6QynCZnBGP
         4Hqp4Prj+GQp/h63FgPzPSS13xfmB58/b8FcHfxRXr1P18rzDmsU0lIenXKt73xh6uGW
         Tlbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lqRpgi3g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b143si6437838vsd.226.2021.06.14.08.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lqRpgi3g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsop3-00017i-99
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEz-0002FD-GH
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0000Z9-1x
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso13337418wmg.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQIZ2hXFKAozxTxF683FfwFrKB+OECd//iRpd2UZwGI=;
 b=lqRpgi3gobY7/KFSNDWLv4Yg22FIbQawBOlMaFEZ7hQrlrSh8oCTtRRycR845Yp87U
 eE56OgVrUwIQW/6Sp8+819eGM6vm5M8plRL4NPr60csz5/9kfE8UgVruB+gNkMPyV4Rx
 Y49tTBj9ZvWYxh/z03fJaUVrfM9EQlDiAIf9/YMuyg3C3/TGOrWpLWEROV8cVmqIYZKZ
 mEJnN91gWYUB8KAcsQ/sf/8kaAM6d4qlo0BCzNs78IiH+2K07n2FPW8O44U2bET4oMNw
 ChNzstWve4Lwc+e2t8k+6qUDrCoOCBgIkU/S+XJGoqxooWsjBpyZkM9+qXXmy4suOltU
 15VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQIZ2hXFKAozxTxF683FfwFrKB+OECd//iRpd2UZwGI=;
 b=BVu0SKpwhD9EvTInFM3cA0CFMUuMmYRV6chRF5QUy2GnFEV3cz9BBWUbGwgVMCds0X
 Cw8bxbmPWSmc8JIYF1f2RFDbuLRAKpCXyYfc3oEsKiUVifK6btA5aKxo1cvf0cpIgmFk
 mkUooNpztgyq3Gz9g2o1ubY0HyGR1N/cdNDdvR2Yl6phPWS1+KW09k7eoSPTxp7XQK0b
 kw/lMZEGcTG2dTm13dIlCbz2SK4rH/AGfNQsKk+Uf1m6/8ubUbm0wk8Yhe1GdqGuDa15
 KBgEL7V6bVUcl+oC5Dg7Dz9PavVxELVLLI5AkMwMhYGSiv3NnIGRSt4GjaUsz1tBNVJk
 xTwQ==
X-Gm-Message-State: AOAM530b/AQNyTBqctzatN/4KGQO2zUED3kEb1zITWTt0uhTF2YyWDr4
 ea1PuWrlATaPVjz4lQPoE5WJBamrIDbslg==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr33186077wmq.143.1623683445106; 
 Mon, 14 Jun 2021 08:10:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 43/57] target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
Date: Mon, 14 Jun 2021 16:09:53 +0100
Message-Id: <20210614151007.4545-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: G2zQeXgpxdo6

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
index 2f401f72bb3..0f4c10c46ef 100644
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
index eb69084c183..baf587c118f 100644
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

