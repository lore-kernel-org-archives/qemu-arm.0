Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2074814lff;
        Mon, 14 Jun 2021 08:30:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBrtsCYWV6lcXiY27+DP9E6Ajy4ZJmKiYRVimCmK8SzqH1MJlNTzBbpeLmRvTKmtssAMnB
X-Received: by 2002:a1f:4594:: with SMTP id s142mr16726607vka.16.1623684603597;
        Mon, 14 Jun 2021 08:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684603; cv=none;
        d=google.com; s=arc-20160816;
        b=UDrYrP6MLCSuaasalJsYpkFbD0zNuS4oz8xgyVYdusk1wvsNT3eqmdL6MifMAGRf6G
         xzfmA0ER3UwvSYQle8dom6b2fSvZaYj4ejL5GMcrvRV7mZ7HyCKiA5mHrn2Ad+e9SbFB
         tJ2oFMpvvr3V9SWQ4wfIaaUcApsKawwH2ZT/AtD0A0q0/0aKATyPylUuWRW5t19B5mLa
         js/53xWd2yrcxn3ccCIfc80kFHOdDmXydmlWwssxOqLFvqlg3EN6yh21A9SNrevXkrto
         ANrHn7yH4Gfh0TNlTmH18Y0KcqmUnfShl7e79LWizqvMFlHfCOxLnsMrujgXIh5ntmhW
         Syvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=83Cp/UURKvI99iLFiyZ7D/kutxEHtnbb2G2HQXXlXxE=;
        b=SSho7g3Qg/y7mP+SHDLSRiUemvuJKQAJVYSlWC5IEMK9iqZa2w9WUCI5DagD8ZvUeU
         //6vVnpxusQ20Ajn8ZS6+krCMgxZgz3EkWEIdLSV76SEXqViHql6c/iBgsDxk6Y/2tqL
         eeZW4U3/s3D7CXpN5+I0Z1PS/QPWRst8Skc1vWSXOxuacnmzQd5xOdEGTzkhDqh9S+if
         dyoZOG15r5CiX5zNvdD8tu6bsEYtaQgrzAA+JmhfEh19PWoQWqSKDQUNMMZbOXgFCLLx
         nhIeUkWGg0lPkR2dgFeWgDI2erx/bklcjH+/Qnp57B1bxNSgRtgELmk8zOEmwyLknKl3
         ebHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hMz2/z8Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r125si4134093vkf.32.2021.06.14.08.30.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:30:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hMz2/z8Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoXK-000422-Pq
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEp-0001lF-9M
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEa-0000UN-K0
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso187879wmj.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=83Cp/UURKvI99iLFiyZ7D/kutxEHtnbb2G2HQXXlXxE=;
 b=hMz2/z8YPVgl9FChK+MCA1exxzIJx6ryoWHltcn+R1azPxBFyEmu/RtCAQ+gqC09H5
 98cPG+nXwKuOMzsKgzYFgaStfJJibH4ZyupbMl9OgLaUKVLT2MsAXFNs8GApotQpUfLn
 Ds2JTL3p71ItGXs/XOTvXpHuZyYU5dIu7Za6x2CfrXpfhJ3YmXINmtBr0JFwhqx2XDU0
 P9IerI4U+ALEbRJ28PxpoEaQ6VI1sjsSPZ4ojHEcSxKK33UOmXl7IPn6m1g2393AVfeA
 2zALaEY+72VJ4SK1YI4BIrUMrwnFmxEBt6IOniV8zO+wGsJK145QQ2idKLAt4Yf1JMDI
 hzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83Cp/UURKvI99iLFiyZ7D/kutxEHtnbb2G2HQXXlXxE=;
 b=i8vBqy/D/bBsbfnC9jSMZwapR0iqbgP7Wh131jtPMefZZt7faqX27qu9okoCpCi8RZ
 qdbOJkGSJG76cuL8mFAraCwxsmILD5VvMrHL1vMwWXVcb0dWG2AA6UM6eWqdrlebWmvA
 Yxy9TSY8J2F8WCLfJtBAHnrbdprpR6QM9DbNjf0nC0GPdg/Fi7sQ3Ir+vjcuvnJ19tqL
 YhqARZkn7Vzfh5Jj+WV1dFjG/IuSg9PMWjJC4xzti9E678gOYIEJFXg6dNpvSso7MD7l
 Quu+ZyO/5KihoLvAF9kAcvK88MtfdCi1a35mMURVnaMVjBrp2Stm9jNtKkih57dYs8IY
 UcaQ==
X-Gm-Message-State: AOAM531QBq4NhM0Qc9TlfBc+dFJmAI/PNdsLN9BwXBSi4f+lK22ncvOU
 2w0RKlWIn0UNvFMI8BPaBS1sBQUuKjhjHA==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr34383924wme.129.1623683439222; 
 Mon, 14 Jun 2021 08:10:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 35/57] target/arm: Implement MVE VADD (scalar)
Date: Mon, 14 Jun 2021 16:09:45 +0100
Message-Id: <20210614151007.4545-36-peter.maydell@linaro.org>
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
X-TUID: bEEWJK7wtD/8

Implement the scalar form of the MVE VADD insn. This takes the
scalar operand from a general purpose register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  7 ++++++
 target/arm/mve_helper.c    | 22 +++++++++++++++++++
 target/arm/translate-mve.c | 45 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f9d4b242beb..16b974a4270 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -145,6 +145,10 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ac68f072bbe..0ee7a727081 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -26,6 +26,7 @@
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
 &2op qd qm qn size
+&2scalar qd qn rm size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -36,6 +37,8 @@
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
+@2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -154,3 +157,7 @@ VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_no
 VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
 
 VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
+
+# Scalar operations
+
+VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c7e7500e877..32e85e72679 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -506,6 +506,28 @@ DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
 
+#define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], FN(n[H##ESIZE(e)], m), mask);    \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* provide unsigned 2-op scalar helpers for all sizes */
+#define DO_2OP_SCALAR_U(OP, FN)                 \
+    DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
+    DO_2OP_SCALAR(OP##h, 2, uint16_t, FN)       \
+    DO_2OP_SCALAR(OP##w, 4, uint32_t, FN)
+
+DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
+
 /*
  * Multiply add long dual accumulate ops.
  */
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9767a2306f3..97ce0f2ff40 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -31,6 +31,7 @@
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
@@ -383,6 +384,50 @@ DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
 
+static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
+                          MVEGenTwoOpScalarFn fn)
+{
+    TCGv_ptr qd, qn;
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qn) ||
+        !fn) {
+        return false;
+    }
+    if (a->rm == 13 || a->rm == 15) {
+        /* UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qn = mve_qreg_ptr(a->qn);
+    rm = load_reg(s, a->rm);
+    fn(cpu_env, qd, qn, rm);
+    tcg_temp_free_i32(rm);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qn);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_2OP_SCALAR(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
+    {                                                           \
+        static MVEGenTwoOpScalarFn * const fns[] = {            \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_2op_scalar(s, a, fns[a->size]);               \
+    }
+
+DO_2OP_SCALAR(VADD_scalar, vadd_scalar)
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
 {
-- 
2.20.1

