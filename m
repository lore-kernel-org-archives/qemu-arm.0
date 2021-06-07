Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3699273lfa;
        Mon, 7 Jun 2021 10:31:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1TYaUgZIeFAKoReCiD2fDPWI0WDTkvUvyIDJVnI3iL/xAUdSMQ6k3SDtQ1VGgla3fKd/x
X-Received: by 2002:a67:b349:: with SMTP id b9mr10132096vsm.12.1623087076753;
        Mon, 07 Jun 2021 10:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623087076; cv=none;
        d=google.com; s=arc-20160816;
        b=tCIETfFqI5W2FU32fS34uCIthkWacPhP73VPeHDh6WWTQYlCDYFYH2T4todlwvAe+N
         EmXV88RZItEcdFv/igjmJYNrgaJWJ5/47ZdD8b9TMrkf+xKuAdio6LkK/IH+I/9cFlCx
         zlbZfMsMNjfO6icD/lqgyQutzNe9/sgd5gp6O9il8NOzzMZj50IkSMYcDIDFh8qxYhQ3
         vgHV63O5cNZq334NDqwmpj1tZym3klYUFmHkm59DVYMk0wpnQ1PI5C0Zq4j1qGRq/V8Y
         GgXUPbEsl53stIlWWEKN1X2qMJnjS5EWVkuLnXbcUe+a8QEeCMjEQRUkVFA/ZY2ZPkFa
         G5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ll1o4H4hjGJjZN7SasnUUT+6rPv7CGDnQZjVe64C6OU=;
        b=kvIk1rxJ79mBkA+ytFFmIsynwWgvYoRPFmscfFCJSBrLA4Srii1ZMG4QyTLOUMQY/j
         Hc1jyeFTjMhABmyH4iM7RgHSx2pvvclE3XEUzMKuigDTDTatYurHEJv3An1alcslHJrS
         mk6qWQIHbKBHJp8m9uLD1Ih2LCkGzCwPZpvyRhCI3o9J5DkTG2mwGDkb4jhOSkz5bhbX
         YG94iyfFA5aonP96xAEAJjr/aSaHjRAOG5prhM2Z73KdG0TUB/VwHv1JaQ0BJnIlahZn
         gNWlPEUlY/8AHI6vugtGeTSZ8pcUPm/Rj/UCEP7Bfy/2aV93FHW/vb1ILaVbJYM8F1pE
         r9XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gfc82jKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23si248440uaf.12.2021.06.07.10.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gfc82jKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJ5n-0000Ob-Tn
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbK-00009R-3H
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIae-00086t-Ih
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id z8so18396497wrp.12
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ll1o4H4hjGJjZN7SasnUUT+6rPv7CGDnQZjVe64C6OU=;
 b=gfc82jKaIMjqR+9xRWBxCCcsocYykY8Xysq8Ggxx1Jwqx7myk7faJDBVFOviK04jlM
 HRuIMz2RwAwvEsIn7ZnKkCcTo17H0PBAussoBH/2JUf8UGaSTrkfr67zl20Tr7p2irgF
 lfe3loeSZQZn5EJGZlv3Wax8RY3aPLrQ7iCZbvpL1qA7V9M9Qkv/Wt2IxBsOcmC3twVd
 POalNE9TSHMIqI5NwyEQ0xoTfd+Bwb+95vx00VQNM1c45YThq3bPwqx35pdxp68NEaQq
 AKF2KQ7zhrkPmqwSrFC5FvqMeEBtIEmjOeZgEqKgJmjGrrU05zXG5YVoRDjPkstkGixf
 ceyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ll1o4H4hjGJjZN7SasnUUT+6rPv7CGDnQZjVe64C6OU=;
 b=rgsTLQcvUvhEXIap39Si062y2O+uF2GK6XdZn2vkt0v3qTMpa2Va8vWBeZv0xvvtgJ
 Z6tP9ZvBJtcLt6JNFh3F9Kw5R0AGpgs2kZACUiFzhyW66bcqTR6BI/DUEK/Nav8BlvLi
 y0C9BYnR9GdsNgEElQRIXq1buGtLTSDZiWi0ULajiDL8hJZCGwOPJAKbcSYWNGQ8Rf2w
 FhcnT03d8OdyCb4vTLJ3/hmHEPajRuJxs3R16rvc6BSSgAthc+AdFboX68iffh1rAKgv
 LSjnnK2ihJCdh78oE37OB8/qX3znbdlUEXiwsoEK/D301/+oM0//d10zebhbfYBsqujA
 gh6w==
X-Gm-Message-State: AOAM532YpcAUIVRbkfXmlGqOFr8nt663x5ra2VcCfWeJmJEEIM05qTZY
 wbNguIg3OYMhlihWe91DICwvxqcWeLjU191R
X-Received: by 2002:adf:8bc9:: with SMTP id w9mr17826751wra.378.1623085142327; 
 Mon, 07 Jun 2021 09:59:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 49/55] target/arm: Implement MVE VQDMULL (vector)
Date: Mon,  7 Jun 2021 17:58:15 +0100
Message-Id: <20210607165821.9892-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: k1IuXpDFlRK6

Implement the vector form of the MVE VQDMULL insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 30 ++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index e25299b229e..ffddbd72377 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -235,6 +235,11 @@ DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmullbh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmullth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulltw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index fa4fb1b2038..3a2a7e75a3a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -39,6 +39,8 @@
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
+@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
+     size=%size_28
 
 # The _rev suffix indicates that Vn and Vm are reversed. This is
 # the case for shifts. In the Arm ARM these insns are documented
@@ -152,6 +154,9 @@ VQDMLSDHX        1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
 VQRDMLSDH        1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
 VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 
+VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
+VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ed0da8097dc..68a2339feae 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1103,6 +1103,36 @@ DO_2OP_SAT_SCALAR_L(vqdmullt_scalarh, 1, int16_t, H2, 4, int32_t, H4, \
 DO_2OP_SAT_SCALAR_L(vqdmullt_scalarw, 1, int32_t, H4, 8, int64_t, , \
                     do_qdmullw, SATMASK32)
 
+/*
+ * Long saturating ops
+ */
+#define DO_2OP_SAT_L(OP, TOP, TYPE, H, LESIZE, LTYPE, LH, FN, SATMASK)  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                void *vm)                               \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            LTYPE op1 = n[H(le * 2 + TOP)], op2 = m[H(le * 2 + TOP)];   \
+            LTYPE r = FN(op1, op2, &sat);                               \
+            uint64_t bytemask = mask_to_bytemask##LESIZE(mask);         \
+            d[LH(le)] &= ~bytemask;                                     \
+            d[LH(le)] |= (r & bytemask);                                \
+            if (sat && (mask & SATMASK)) {                              \
+                env->vfp.qc[0] = 1;                                     \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_2OP_SAT_L(vqdmullbh, 0, int16_t, H2, 4, int32_t, H4, do_qdmullh, SATMASK16B)
+DO_2OP_SAT_L(vqdmullbw, 0, int32_t, H4, 8, int64_t, , do_qdmullw, SATMASK32)
+DO_2OP_SAT_L(vqdmullth, 1, int16_t, H2, 4, int32_t, H4, do_qdmullh, SATMASK16T)
+DO_2OP_SAT_L(vqdmulltw, 1, int32_t, H4, 8, int64_t, , do_qdmullw, SATMASK32)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 0048aec1e9e..b227b72e5b6 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -438,6 +438,36 @@ DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
 
+static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
+{
+    MVEGenTwoOpFn *fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullbh,
+        gen_helper_mve_vqdmullbw,
+        NULL,
+    };
+    if (a->size == MO_32 && (a->qd == a->qm || a->qd == a->qn)) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op(s, a, fns[a->size]);
+}
+
+static bool trans_VQDMULLT(DisasContext *s, arg_2op *a)
+{
+    MVEGenTwoOpFn *fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullth,
+        gen_helper_mve_vqdmulltw,
+        NULL,
+    };
+    if (a->size == MO_32 && (a->qd == a->qm || a->qd == a->qn)) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op(s, a, fns[a->size]);
+}
+
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
 {
-- 
2.20.1

