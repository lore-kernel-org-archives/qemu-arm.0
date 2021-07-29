Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5559052lfc;
        Thu, 29 Jul 2021 04:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUe0MBdjUhNyRRxv9N1yTZabxncW9qF0As/HYpbVW+tTJBO60GvCMtmUKS6wEw4A6mBX3O
X-Received: by 2002:a25:888d:: with SMTP id d13mr5987715ybl.508.1627559286521;
        Thu, 29 Jul 2021 04:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627559286; cv=none;
        d=google.com; s=arc-20160816;
        b=Axvs/wu21t+f9RB6t3yjnCax9lryngNhWDOXmOEDUVvWDUq6oBvzAGlEv2KUX8sL7e
         P2JTBtCmtJUqQD73FYoYFtEpgFaCOJRG3bD2DuJLR9Ng9epup72NM09630t9X4hCKVRy
         6f1jRf9Llk7o1RiGObRjA7MKSBmequ00kY1zpKpXfSrL8nMY5I9vU1y/q9ZBhG5U+e3R
         r36tVZAIUootocemkkprf5tLY1FslIfYoRfSQXDqDrut6bhoK40jlDW7Ame5+UMWy2do
         0LUuJEs3yhSx9xPevID4i0P98BetSWIQDJY+fyNW7ZGsCF+7StUTCDdX27BwG+MY3xHI
         58JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/oEQZ2222tqM0a4cMKBeNUf6j4gK7g7+B5zZA/0EG9I=;
        b=vUn/nQEzGgPg0I/a5pQYTh3pCjbThsbjwrTz5NvYB+4g0AebKakRRsJF+8jWRUuT8y
         l8LRHWm9dhZcJ06fXgGexJOCz8voeKwB6HTHZEkDxADoZGlMyxniZ2AS3XaKcIEV4g/O
         tqb8/zmudhh1FHm9dhYmnKE8U9e9DkHkmJH6vNihLXJDY0lK1nhdz7IgG6kucKUjnjDr
         zubyecJZ8OHnxB3eF9sAafRchZcOOHB6UTnlNdy+o1fi0/DGpUEQo7/p9PIJIkso9NzN
         ZHHZYf7KX+Y7O+/RhRn/mLJILe6sBS0WdJYCTErlOwJpUK0gBaY7jtAua/myESldlcH7
         O69g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/jn0Y4t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132si1066137ybd.45.2021.07.29.04.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:48:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/jn0Y4t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94WD-0006Uy-QN
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941a-0001Na-9n
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9419-0001Uf-5q
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id z4so6443772wrv.11
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/oEQZ2222tqM0a4cMKBeNUf6j4gK7g7+B5zZA/0EG9I=;
 b=e/jn0Y4tVLANZeLl8hOFxumPzKGBUvJO6WOhn8R4yPqKs2sBWaeOZH30WLmM5DCsCl
 w2pIL5sftu5U1xRUy0I0vTn47giJFxFXNRe0PaLAvtpJCeDSJKPVNBcDTJc/2UKEo/V5
 widh6y/YDMggu+zsJeysNiam0v9Kw/8/AfnLl8TzdRKG967c+Wxj7ilJnk3OqzMv3jL7
 ZvXtU9ZOoDZidhPTapOvAygD5eErBEiNXDTrptX4lehEqUFv/METKsJo+4LImb64U1O7
 nguNigAVU619i8btG0rIwWtAXHO1uxaabDQCC0MIsov58HqLBoCsNT/K2JOQuWERUxjs
 xPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/oEQZ2222tqM0a4cMKBeNUf6j4gK7g7+B5zZA/0EG9I=;
 b=fUUWxnQUnoLtPUexZbMTV+WWJwInEGxI+ejNDUnGbjIPqD4kdy6FO9UgE2RBQk/+nd
 ls3mDcYAhed+2i7BdNC8dZ4tjCYM4x2sjZcREn5ULUBlu8piCk3eOmL6OMAw7oP2mN/z
 apSoYbg2S2J3tlCxj1/8cxDuBO1Zku24/Z6faesfVH5lnAck/6PGWcHZg1ARSoGJ9Z4s
 aZpvrOYpfjMIwpgPp/IVVNwKqjYgeLY4r+mwbqTluqNEWYkFeZ0uXQxawk19FaITXszm
 f0qkdVK1lc4EcpwnVM/6zmmsMlDjMa+ts/qrQG1PDupPEcu+yq2oygjyd+L465AKVeb8
 M9Pg==
X-Gm-Message-State: AOAM532Qn8MxnnWItnE8bvuy+VD1AZp8EPwiisARKDU93ZR/ggOSdzu0
 cOPfKY0cB9JuLD07ARG6somybO+aWg69WQ==
X-Received: by 2002:adf:8169:: with SMTP id 96mr4213795wrm.424.1627557356482; 
 Thu, 29 Jul 2021 04:15:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 50/53] target/arm: Implement MVE VCVT with specified
 rounding mode
Date: Thu, 29 Jul 2021 12:15:09 +0100
Message-Id: <20210729111512.16541-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: d5QEUcNWUyll

Implement the MVE VCVT which converts from floating-point to integer
using a rounding mode specified by the instruction.  We implement
this similarly to the Neon equivalents, by passing the required
rounding mode as an extra integer parameter to the helper functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  5 ++++
 target/arm/mve.decode      | 10 ++++++++
 target/arm/mve_helper.c    | 38 ++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 52 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f3c2b43bf43..6d4052a5269 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,11 @@ DEF_HELPER_FLAGS_3(mve_vminab, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vminah, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vminaw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vcvt_rm_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_rm_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_rm_ss, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_rm_us, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 9a40ff9f43c..410ea746fcf 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -797,3 +797,13 @@ VCVT_SF           1111 1111 1 . 11 .. 11 ... 0 011 00 1 . 0 ... 0 @1op
 VCVT_UF           1111 1111 1 . 11 .. 11 ... 0 011 01 1 . 0 ... 0 @1op
 VCVT_FS           1111 1111 1 . 11 .. 11 ... 0 011 10 1 . 0 ... 0 @1op
 VCVT_FU           1111 1111 1 . 11 .. 11 ... 0 011 11 1 . 0 ... 0 @1op
+
+# VCVT from floating point to integer with specified rounding mode
+VCVTAS            1111 1111 1 . 11 .. 11 ... 000 00 0 1 . 0 ... 0 @1op
+VCVTAU            1111 1111 1 . 11 .. 11 ... 000 00 1 1 . 0 ... 0 @1op
+VCVTNS            1111 1111 1 . 11 .. 11 ... 000 01 0 1 . 0 ... 0 @1op
+VCVTNU            1111 1111 1 . 11 .. 11 ... 000 01 1 1 . 0 ... 0 @1op
+VCVTPS            1111 1111 1 . 11 .. 11 ... 000 10 0 1 . 0 ... 0 @1op
+VCVTPU            1111 1111 1 . 11 .. 11 ... 000 10 1 1 . 0 ... 0 @1op
+VCVTMS            1111 1111 1 . 11 .. 11 ... 000 11 0 1 . 0 ... 0 @1op
+VCVTMU            1111 1111 1 . 11 .. 11 ... 000 11 1 1 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8e1184db3b4..4e0d979e643 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3299,3 +3299,41 @@ DO_VCVT_FIXED(vcvt_sf, 4, int32_t, helper_vfp_sltos)
 DO_VCVT_FIXED(vcvt_uf, 4, uint32_t, helper_vfp_ultos)
 DO_VCVT_FIXED(vcvt_fs, 4, int32_t, helper_vfp_tosls_round_to_zero)
 DO_VCVT_FIXED(vcvt_fu, 4, uint32_t, helper_vfp_touls_round_to_zero)
+
+/* VCVT with specified rmode */
+#define DO_VCVT_RMODE(OP, ESIZE, TYPE, FN)                              \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vm, uint32_t rmode)     \
+    {                                                                   \
+        TYPE *d = vd, *m = vm;                                          \
+        TYPE r;                                                         \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        float_status *base_fpst = (ESIZE == 2) ?                        \
+            &env->vfp.standard_fp_status_f16 :                          \
+            &env->vfp.standard_fp_status;                               \
+        uint32_t prev_rmode = get_float_rounding_mode(base_fpst);       \
+        set_float_rounding_mode(rmode, base_fpst);                      \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
+                continue;                                               \
+            }                                                           \
+            fpst = base_fpst;                                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(m[H##ESIZE(e)], 0, fpst);                            \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        set_float_rounding_mode(prev_rmode, base_fpst);                 \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VCVT_RMODE(vcvt_rm_sh, 2, uint16_t, helper_vfp_toshh)
+DO_VCVT_RMODE(vcvt_rm_uh, 2, uint16_t, helper_vfp_touhh)
+DO_VCVT_RMODE(vcvt_rm_ss, 4, uint32_t, helper_vfp_tosls)
+DO_VCVT_RMODE(vcvt_rm_us, 4, uint32_t, helper_vfp_touls)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 351033af1ec..e80a55eb62e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -49,6 +49,7 @@ typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenScalarCmpFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenVABAVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenVCVTRmodeFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -575,6 +576,57 @@ DO_VCVT(VCVT_UF, vcvt_uh, vcvt_uf)
 DO_VCVT(VCVT_FS, vcvt_hs, vcvt_fs)
 DO_VCVT(VCVT_FU, vcvt_hu, vcvt_fu)
 
+static bool do_vcvt_rmode(DisasContext *s, arg_1op *a,
+                          enum arm_fprounding rmode, bool u)
+{
+    /*
+     * Handle VCVT fp to int with specified rounding mode.
+     * This is a 1op fn but we must pass the rounding mode as
+     * an immediate to the helper.
+     */
+    TCGv_ptr qd, qm;
+    static MVEGenVCVTRmodeFn * const fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vcvt_rm_sh, gen_helper_mve_vcvt_rm_uh },
+        { gen_helper_mve_vcvt_rm_ss, gen_helper_mve_vcvt_rm_us },
+        { NULL, NULL },
+    };
+    MVEGenVCVTRmodeFn *fn = fns[a->size][u];
+
+    if (!dc_isar_feature(aa32_mve_fp, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qm) ||
+        !fn) {
+        return false;
+    }
+
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qm, tcg_constant_i32(arm_rmode_to_sf(rmode)));
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VCVT_RMODE(INSN, RMODE, U)                           \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
+    {                                                           \
+        return do_vcvt_rmode(s, a, RMODE, U);                   \
+    }                                                           \
+
+DO_VCVT_RMODE(VCVTAS, FPROUNDING_TIEAWAY, false)
+DO_VCVT_RMODE(VCVTAU, FPROUNDING_TIEAWAY, true)
+DO_VCVT_RMODE(VCVTNS, FPROUNDING_TIEEVEN, false)
+DO_VCVT_RMODE(VCVTNU, FPROUNDING_TIEEVEN, true)
+DO_VCVT_RMODE(VCVTPS, FPROUNDING_POSINF, false)
+DO_VCVT_RMODE(VCVTPU, FPROUNDING_POSINF, true)
+DO_VCVT_RMODE(VCVTMS, FPROUNDING_NEGINF, false)
+DO_VCVT_RMODE(VCVTMU, FPROUNDING_NEGINF, true)
+
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
-- 
2.20.1

