Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3708575lfa;
        Mon, 7 Jun 2021 10:44:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFNETdqtdJpGOHe/67813iljxETzVk1VjVMhX1CxQynhLiLcm0D64w4hZRThZ9FDVAqprt
X-Received: by 2002:a05:6602:240c:: with SMTP id s12mr12516221ioa.149.1623087862431;
        Mon, 07 Jun 2021 10:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623087862; cv=none;
        d=google.com; s=arc-20160816;
        b=xYTWR0fbrxI9cF8uY11WgofdGsO1sAIQXLWDf8E9dSS3La6J7E98e1M/vRUtvNteMl
         dxkS0TuIdniDlfB4JXthcd7ikzXYDjcL61zaviq/U2tRjVL25VneerjwgoZo5IdGT74Q
         OSQo7spf2+dE1gIB87MdUXsacxLEH1NhZPPjXl7yd65tS3QFL4KwS26GhNichbz2RBIo
         kePEnds7tBpBPNjz7c0W6ccRQSrKcjq7pf1+6yDtlGZ/3Ed5ODvSehzMR3gHIFkKB/ln
         qeiT7LU/sxHRjhu3VxzIri0ypsOhi4ds3KCcFhLmeZg/15I5ceBtdYeIVsJ4Pti5ufSs
         hxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1WD5R16SCIkydee14wkB4oUuOr6qYBE+bCok0uIGeuo=;
        b=RrWy0TQWu0nRUJcQmRRSRJNYrSWtBg8KVLSdi4QMeUi2cKjFxK1b3P8+37MqDvD9cB
         QcQhV+7B0Yrx+sjnwT2hU75Hk/TBbh1fPGwZSTqinHWc20ZvTbmEjlgZjFeQKOzqBa1B
         vht1PBzmJKTigTrtXm+1NlgcAFrDKbejdx4hCUwJBcAVUr6T7EogOpYBwWUQfbkxOLMi
         097W8kktUADOKQLOfWel1993ya1vBdM0xu6zBXZqeQ9xZiJS+3wuLjUHyczpryIAt8dv
         YMAeMcg8y8qbxBPkGBcO2riF5vQC9Mv631vGsvh5CCR3+LbzJjysirc+jlKX39f+j3nH
         q1cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r071pn/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h41si3692922jaa.50.2021.06.07.10.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r071pn/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJIT-000793-LY
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb7-00082O-Eo
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:33 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-00084E-Ts
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:33 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso103092wmh.4
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1WD5R16SCIkydee14wkB4oUuOr6qYBE+bCok0uIGeuo=;
 b=r071pn/D6zqXKvFKFgzX/p1/Z6w3tE054xAmt4Ps7O9t0d2pFvNW6x12mRwRzkY3v4
 hHoK3uQ3o7li+vBBzZv0mXgRuEh8FwQr63AupLlbq9IDtvM2juqttwXFjRbprMm+ebnL
 qU/kuG/gA4vy+HEOqAIo5b0d4l+WGhxKZYIeyzJ+sESVMSy4WZcTAZdi2N//AZwyb/6s
 Pnmp10lPjwx3S2x0fG4egWe6L/oXNBZRjoueMFhmw2N4yathE78Xt271fkQzGKjAtQtZ
 ClBaEjtwLrIsRjFa0MCmtwX/75hjiOf1Ncs4eMUVK5BquFVclndmm1lKm9/AcvMljJvF
 1gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1WD5R16SCIkydee14wkB4oUuOr6qYBE+bCok0uIGeuo=;
 b=IOYqFws6Xs8QPY5uJ1ALGlgY61+YaU3zP9XrfyKhVNGyerV3oHZW3RpWq8lWi4lkCv
 r2/s9/AlZ//BxEoL1n0LIVzYewvDuVjRaA92OD14R0M9IersFAuOSECNZ4kjVJEBaSA1
 /XeRD9yQ9HUQTZReGAONNNwARLOpBFuTAxi76BDG4CPYNj/0K5UOc+/n5oDJ09cGuaCy
 meVUUf9UfBKGgMkUWewhB1LR9jWO+YPQm8MQhipWSPwbbkG43WBoq7H0bIbyXbXmQGZj
 2fGqaks3ujPHDYY6uE7oma2aEvb3uBjGJwvq+lS5+3sBDkeY5eilgI9VmFT14B4lyn+N
 sbSA==
X-Gm-Message-State: AOAM531k96J63kr751ikWsYzJcxGObV11SmBJ01B9N2KHk+fTWw0/dYe
 Vjlk13m7b+05+90hDq2l52hkc/y4OfoleKbM
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr65164wmr.41.1623085136048; 
 Mon, 07 Jun 2021 09:58:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 41/55] target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
Date: Mon,  7 Jun 2021 17:58:07 +0100
Message-Id: <20210607165821.9892-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: n38+K6MLjO6A

Implement the vector forms of the MVE VQDMULH and VQRDMULH insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 27 +++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 55c4e41deff..a7eddf3d488 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -147,6 +147,14 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 97529531ed0..7d65bcef56c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -357,6 +357,25 @@ DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT(OP, ESIZE, TYPE, H, FN)                              \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            TYPE r = FN(n[H(e)], m[H(e)], &sat);                        \
+            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
+            d[H(e)] &= ~bytemask;                                       \
+            d[H(e)] |= (r & bytemask);                                  \
+            if (sat && (mask & 1)) {                                    \
+                env->vfp.qc[0] = 1;                                     \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -523,6 +542,14 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 #define DO_QRDMULH_W(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 30)) >> 31, \
                                          INT32_MIN, INT32_MAX, s)
 
+DO_2OP_SAT(vqdmulhb, 1, int8_t, H1, DO_QDMULH_B)
+DO_2OP_SAT(vqdmulhh, 2, int16_t, H2, DO_QDMULH_H)
+DO_2OP_SAT(vqdmulhw, 4, int32_t, H4, DO_QDMULH_W)
+
+DO_2OP_SAT(vqrdmulhb, 1, int8_t, H1, DO_QRDMULH_B)
+DO_2OP_SAT(vqrdmulhh, 2, int16_t, H2, DO_QRDMULH_H)
+DO_2OP_SAT(vqrdmulhw, 4, int32_t, H4, DO_QRDMULH_W)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2bb7482e6af..213a90b59b6 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -415,6 +415,8 @@ DO_2OP(VMULL_BS, vmullbs)
 DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
+DO_2OP(VQDMULH, vqdmulh)
+DO_2OP(VQRDMULH, vqrdmulh)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

