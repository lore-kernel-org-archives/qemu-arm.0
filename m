Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp603332lfc;
        Tue, 13 Jul 2021 06:48:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy+vmgtjsmol7RT/HDoeHjxcRoPf4u4axD8D2Ngw7c7nNJhTl5l8hpaoGHYMDALLLf26or
X-Received: by 2002:a9f:3f81:: with SMTP id k1mr6127081uaj.7.1626184118206;
        Tue, 13 Jul 2021 06:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184118; cv=none;
        d=google.com; s=arc-20160816;
        b=nHiw2ygJ+kAuzUq8Wxhd3PFy8A8hMsjNSoElqmRlNmgqUdT2je3vOBnbu768PiGYE/
         i30hMKx/76kapjne5YyhAPVUslWEWt7B04EecYydmiwMMLw6mFm4M29MPcS2j/6XocnY
         Lja4bnfmxif2TwMNsfSDXH0Pg2eZDlVbDFnSe/ofK1RzKH4eBmSHbz8Dg0/uLVBeCra3
         5UooGoLALqAqwjSBgBmxyHsj5pmxrtsyUcDiO6u16Lr0lmX0Xyt2g8u414RNRTw1PedN
         V6z73/nLxOuRPKhxNDDgCDJzwtUEN3R+nk2WDeuc6sVlmt5UWaa5y3Iramiz7SDuDsP6
         rgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=R4xeSVi6VBIk/RfAx9WizQtWx2u9jg9p3hJQ3Wj3J9M=;
        b=zAGcgXTFTtjC7dnz8y8CPuZRQ3Of6q49EhsTCKXS0kEZgB10824WLDzLzJxX5bntzc
         jrni/bzQf0j6wJ6OaNMwrjPydjLaTN37sXrR0LUP+IgGtko/ll/dc6x81FcrHomrAbb0
         7MkPb69ea5tazlZ7PuyrffxTa6MSdY3ds/PwH0PufSYEehEJT7y1mAdVSqyfEPfvn73Q
         Y4PdJVWUpoRmmLo4JUfzkQoToqv/UlxbbMKnvLWtsLXrJfm2OTsnRvRF8FrWuRp2HUo3
         Crx1LoZ9Fv7X5ZftOeiB59QtWY9YktVLBC/r74ORR3C/G+lMX13qLeeZSA9hjegvfgrh
         wYyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q7qSAeuz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si20227219vsa.205.2021.07.13.06.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q7qSAeuz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Im5-0003mt-FH
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibe-00004s-1t
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbX-0003hU-73
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so30501256wri.4
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R4xeSVi6VBIk/RfAx9WizQtWx2u9jg9p3hJQ3Wj3J9M=;
 b=q7qSAeuzsb1dN5a9s0PtXeu3tMrlz54zFmI6gNLb+K5SXmXmqyC6g+esKvC1u7FiO0
 4Z/Kcc7Jp/D2c0uDS6aIG87cgRTdDrC5xfeMwuxR7bY8LG2+GVQaBS3wzV5uR/DkAgJO
 hVczQ+WHnn+QGQ3iP7SmwLYHtZdPEwXR8F6QZWz4ctnUAiaI0NMi3aNWOcL1LDOiwtOG
 aPv3pYfbNWKOy4SZqEcjEZkIMz+M+acAPTx1EFWePfD3f8zKZY5zbRqs2SiNePf++gRF
 r7imfGjTxLYvaWYwu1MUam5C5qvZCadRmhL+5HTF+njiX8a5GqYRw65L72uNrGFDzFqw
 be1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4xeSVi6VBIk/RfAx9WizQtWx2u9jg9p3hJQ3Wj3J9M=;
 b=mB01SvlMYakxk932YAAHXQbXSCXv5o0ScdyJ0YsiWblnwqGIjslhaSPX7wqz7jh/q5
 XaSL4CxM/+tH0zu4CLMUNDaiTdgv+OUqAt9PXiHT5dnGslQ/X/yUKa1R38GTLVyX9S2K
 fM6uMeYKeyMwgQc+mS7VKra7M52FXQQ5KRX2QIbDEHOjDFpqb/3D74VNMF3e+3RLhxw4
 3c0hobKAS3B1uCHvacKBkjLbu660DQ9uDzjW/JUa0SZV/p3lB1ImLe2y3L6MIcNkwVZ5
 fPmam5Rn4Lv/wqlaJlEE2Ob8PQvPrLexGXg/aAWRL+UlfpS06ODrWUYEZ7QXFmVALRjB
 IO2w==
X-Gm-Message-State: AOAM530Pp72RlcZsujLo5O9Jxe1zdslIp8G2GjbG2RzC7UhzV/+wI70v
 o57XV2PER/bOJeBl1hbRB2WqwoANKqhlXumA
X-Received: by 2002:a5d:6b91:: with SMTP id n17mr5767682wrx.385.1626183462037; 
 Tue, 13 Jul 2021 06:37:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 17/34] target/arm: Implement MVE VMLAS
Date: Tue, 13 Jul 2021 14:37:09 +0100
Message-Id: <20210713133726.26842-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: OnsYjpiPmM4e

Implement the MVE VMLAS insn, which multiplies a vector by a vector
and adds a scalar.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f1a54aba5d4..6f2cc5c2929 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -351,6 +351,14 @@ DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i3
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vmlassb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlassh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlassw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vmlasub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlasuh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlasuw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 4bd20a9a319..05c30735545 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -345,6 +345,9 @@ VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
+VMLAS_S          1110 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+VMLAS_U          1111 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+
 # Vector add across vector
 {
   VADDV          111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rdalo
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index be67e7cea26..98c3a418dcb 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -955,6 +955,22 @@ DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, 1, 1, do_vqdmlsdh_w)
         mve_advance_vpt(env);                                           \
     }
 
+/* "accumulating" version where FN takes d as well as n and m */
+#define DO_2OP_ACC_SCALAR(OP, ESIZE, TYPE, FN)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)],                                  \
+                      FN(d[H##ESIZE(e)], n[H##ESIZE(e)], m), mask);     \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 /* provide unsigned 2-op scalar helpers for all sizes */
 #define DO_2OP_SCALAR_U(OP, FN)                 \
     DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
@@ -965,6 +981,15 @@ DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, 1, 1, do_vqdmlsdh_w)
     DO_2OP_SCALAR(OP##h, 2, int16_t, FN)        \
     DO_2OP_SCALAR(OP##w, 4, int32_t, FN)
 
+#define DO_2OP_ACC_SCALAR_U(OP, FN)             \
+    DO_2OP_ACC_SCALAR(OP##b, 1, uint8_t, FN)    \
+    DO_2OP_ACC_SCALAR(OP##h, 2, uint16_t, FN)   \
+    DO_2OP_ACC_SCALAR(OP##w, 4, uint32_t, FN)
+#define DO_2OP_ACC_SCALAR_S(OP, FN)             \
+    DO_2OP_ACC_SCALAR(OP##b, 1, int8_t, FN)     \
+    DO_2OP_ACC_SCALAR(OP##h, 2, int16_t, FN)    \
+    DO_2OP_ACC_SCALAR(OP##w, 4, int32_t, FN)
+
 DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
 DO_2OP_SCALAR_U(vsub_scalar, DO_SUB)
 DO_2OP_SCALAR_U(vmul_scalar, DO_MUL)
@@ -994,6 +1019,12 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+/* Vector by vector plus scalar */
+#define DO_VMLAS(D, N, M) ((N) * (D) + (M))
+
+DO_2OP_ACC_SCALAR_S(vmlass, DO_VMLAS)
+DO_2OP_ACC_SCALAR_U(vmlasu, DO_VMLAS)
+
 /*
  * Long saturating scalar ops. As with DO_2OP_L, TYPE and H are for the
  * input (smaller) type and LESIZE, LTYPE, LH for the output (long) type.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 689e15c069b..011d1d6bcd9 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -596,6 +596,8 @@ DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
 DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
 DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
+DO_2OP_SCALAR(VMLAS_S, vmlass)
+DO_2OP_SCALAR(VMLAS_U, vmlasu)
 
 static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
 {
-- 
2.20.1

