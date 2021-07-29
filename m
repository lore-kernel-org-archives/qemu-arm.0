Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5562973lfc;
        Thu, 29 Jul 2021 04:53:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuEXMWUHNagTgLTACrXXjUdop7vEbOlTVdw+K1khUke53WPXCaDyKbZ0VZWKkbzHb50dsM
X-Received: by 2002:ac8:6b45:: with SMTP id x5mr3771168qts.249.1627559638317;
        Thu, 29 Jul 2021 04:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627559638; cv=none;
        d=google.com; s=arc-20160816;
        b=BeoAUPPetWQwd621zsbA4b37P2Cms8tzhrxAQfyCNkkIRKZm+yPCojDQy03niR2tSa
         BEQmke/SwF9SuM9vZHVkmUoPdBvRtmTGmA4NVtuoFtgbRHbNQubuEOh/ER0OPt/NuWSq
         WfIqXKQWmB+j9Tjug4Xnd5uStEcmojzEvBIhrLK03yKyN+4LjUWFoDl0Gl6F2dE5U8jm
         PwoeMJCQJQ8K3abK7Z2riIU/rkt3Pph7gz4AgB327n6l+gc2FtLdddxC9/bv8Gbhsg3n
         kxj2TwtgrF/svanAYrz4kPWqM5JpIoUol+zDh9zzXTrbduS2M1gMax1pFJNF3VPi+iGs
         ScNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=p/PVosmr3NDaaW48KULGfEDE4gWAQBCxNNHpd5+4wvQ=;
        b=SgnpxjVBkt4XGOVeK3EHSQBVLgQEjPIU8V3vGGGDy/ewf2x1DCiLs46aEaJ/bvuQV/
         +kjNxXO/mo+/Xp/tqpRXJtrCTDGfMryGmMvPXppp4HTjRX5pX2ynXNsoK6IMcF+28IMQ
         eTFLHy793wJaLO1l9pIp8panE0Qw7OZ9W+7kLFOFwxh13P8wtZrLWYe/66wEdHfnAp6X
         WkHPyFlvh5liwK022kJgROca0Wg6wg7aKoS7Dc5GWqj3iH7E9ql3YyQSfME1qRluIMRK
         +YF5WA/vq1bqE2eg6WKDKg28+vMqZVyLvvZ+rSNaKZFHix4pxrZS6P6SvkZdMh5OdfyS
         nAJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYZD9OiF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si1767252qkw.230.2021.07.29.04.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYZD9OiF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94bt-000451-I3
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941Z-0001M7-9i
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9414-0001Pj-Us
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id d8so6457115wrm.4
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p/PVosmr3NDaaW48KULGfEDE4gWAQBCxNNHpd5+4wvQ=;
 b=XYZD9OiFWNXRZANimC6KdeeBOd9/IP8LQwcic3/Rr3WwYgFrxe3bJjVz8xSG0yaAOH
 rAWPsLKED3IpwtUl6dHRiZgAmaVlGkhV3JHkH3ZCEUAxEdKe9l1uMkZo2xYexpNiHkac
 y45+iqJsCP8zqra12ipRDT7YCi5XUbl5P48p4TlvJr7Q+PaEJXDu/SE0l39t4Xcduorf
 N4xpd95zg3pq2UYf3enw+F5Ewe3ulOAscw5WkFnffbG+4DjALaOo5nfV4fPr9RaE0Lua
 gcVlTfGtuOOVSp4869uIJzd3ug2niSENL9OGhjOJ99xG2HaqOoFzPEq56YlHuZNxP0w3
 +PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/PVosmr3NDaaW48KULGfEDE4gWAQBCxNNHpd5+4wvQ=;
 b=d93V7o4CYbB33ZoAm3uwU3I1WWep8CbjNm3FCLZGwL+ZC1LMqgtF8s/lJTrYq2m0+W
 Yxg/JffqQjE/jT4mx9dJldD7//clFV/ULbslTjikq4BVa/MwpTA5lu8rQw5ioF5zIZJw
 hbugLfAmDwpmDOyCw093K/+s5zunaMuB5InIcNZhmd00MrWOS1alBo+JNaTafiKqzQV1
 97CJKk3/ySqdw6rchpbTq8v0u8jw1E69YgeT5HqMr167iNJz6MCq94ipIOoPzY8sJ3GQ
 hMqo6aTB+ysSIOrlH0czwmsedI77wsPMrcOuXrHLorml7eddLWHNnRNBZ/vRL2B1FXUy
 l0Bg==
X-Gm-Message-State: AOAM531btboFq53RxAGNVN+12fqXuCBRfcdUmsLwevzsVs6x2ZHuXl09
 ScUiLdpqj66znlF/f0vIaKScBrC+IWssRQ==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr4209511wrm.59.1627557350653; 
 Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 43/53] target/arm: Implement MVE fp-with-scalar VFMA,
 VFMAS
Date: Thu, 29 Jul 2021 12:15:02 +0100
Message-Id: <20210729111512.16541-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GFlg9JTcJEJx

Implement the MVE fp-with-scalar VFMA and VFMAS insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      | 14 +++++++++++---
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 091ec4b4270..cb7b6423239 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -809,3 +809,9 @@ DEF_HELPER_FLAGS_4(mve_vfsub_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vfmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vfmul_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfma_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfma_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfmas_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfmas_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 5ba8b6deeaa..d2bd6815bc3 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -508,9 +508,17 @@ VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
   VQRDMULH_scalar 1111  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 }
 
-# The U bit (28) is don't-care because it does not affect the result
-VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
-VMLAS            111- 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+{
+  VFMA_scalar     111 . 1110 0 . 11 ... 1 ... 0 1110 . 100 .... @2op_fp_scalar
+  # The U bit (28) is don't-care because it does not affect the result
+  VMLA            111 - 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
+}
+
+{
+  VFMAS_scalar    111 . 1110 0 . 11 ... 1 ... 1 1110 . 100 .... @2op_fp_scalar
+  # The U bit (28) is don't-care because it does not affect the result
+  VMLAS           111 - 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+}
 
 VQRDMLAH         1110 1110 0 . .. ... 0 ... 0 1110 . 100 .... @2scalar
 VQRDMLASH        1110 1110 0 . .. ... 0 ... 1 1110 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 4175bacfaa4..3b243aaefa2 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3080,3 +3080,40 @@ DO_2OP_FP_SCALAR(vfsub_scalarh, 2, uint16_t, float16_sub)
 DO_2OP_FP_SCALAR(vfsub_scalars, 4, uint32_t, float32_sub)
 DO_2OP_FP_SCALAR(vfmul_scalarh, 2, uint16_t, float16_mul)
 DO_2OP_FP_SCALAR(vfmul_scalars, 4, uint32_t, float32_mul)
+
+#define DO_2OP_FP_ACC_SCALAR(OP, ESIZE, TYPE, FN)                       \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, uint32_t rm)        \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE r, m = rm;                                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(n[H##ESIZE(e)], m, d[H##ESIZE(e)], 0, fpst);         \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* VFMAS is vector * vector + scalar, so swap op2 and op3 */
+#define DO_VFMAS_SCALARH(N, M, D, F, S) float16_muladd(N, D, M, F, S)
+#define DO_VFMAS_SCALARS(N, M, D, F, S) float32_muladd(N, D, M, F, S)
+
+/* VFMA is vector * scalar + vector */
+DO_2OP_FP_ACC_SCALAR(vfma_scalarh, 2, uint16_t, float16_muladd)
+DO_2OP_FP_ACC_SCALAR(vfma_scalars, 4, uint32_t, float32_muladd)
+DO_2OP_FP_ACC_SCALAR(vfmas_scalarh, 2, uint16_t, DO_VFMAS_SCALARH)
+DO_2OP_FP_ACC_SCALAR(vfmas_scalars, 4, uint32_t, DO_VFMAS_SCALARS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bc4b3f840a0..3627ba227f2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -979,6 +979,8 @@ static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
 DO_2OP_FP_SCALAR(VADD_fp_scalar, vfadd_scalar)
 DO_2OP_FP_SCALAR(VSUB_fp_scalar, vfsub_scalar)
 DO_2OP_FP_SCALAR(VMUL_fp_scalar, vfmul_scalar)
+DO_2OP_FP_SCALAR(VFMA_scalar, vfma_scalar)
+DO_2OP_FP_SCALAR(VFMAS_scalar, vfmas_scalar)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
-- 
2.20.1

