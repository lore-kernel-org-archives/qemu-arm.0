Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp607797lfb;
        Thu, 26 Aug 2021 06:23:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg0K0kknmxzzkgTXkuqr2H8IA/efN647sFbIaQVB5FskuMNw2mOVDaWWikH/Gb/uWiMqlV
X-Received: by 2002:a5d:538e:: with SMTP id d14mr4012074wrv.192.1629984186085;
        Thu, 26 Aug 2021 06:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984186; cv=none;
        d=google.com; s=arc-20160816;
        b=q/2lfhGD9dKMxz1rGSjR7BCWRLUHkmt6+zdzyg0dwVNmDchHiJcL6VURI1XmMqgnA5
         XHAcl8P4QxPvm57KmssuGknlqpE2lXWT9KRnbq7aCVE1Y3CPPTxmL3LEOB8j/ZsWjHQy
         84OGJTNAKUcS8ela+BW3O3prLZ8VZ0Y1qktw/d8XPbDWaar7xwUNvW4Yvl/O0dDR1dzA
         bo414geB4NjKdgV46K8BCqeqF1KS7yAnq8rUEQkbva977G1kyvOu1sBT5hIhTpYWUNAl
         4SzjUY81l2w/F6V+QJlYJDQFH/cXdlQFbkh5kYBcR93RM28IM7IDS4ZisKXT1/6W4k5S
         ud2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aPwZlZ+FcfCF18SiaZV3J9Dj2i/qKu0DetW7U/gVdig=;
        b=SI/fPIYcNyF7GuYMpXgkWJ9/ax56DTBrB1uLBs0PryErva/TOUdr8zjFYjbyxZGArI
         2/k17iL0NWXz587HIrApDbVDL/kENLCzWZPSMSNs0MWJSCeEki9OdKF8Jk0o2SHXXoP4
         CB+GPJZunVs5Y+j+kXFjM6u1gZev+nhQyrUMeIWC9wAbyQ9pFZ+W14YXEE8S9i8htfjR
         +HcQdwIz6MozdGMzu0c4vKy8JVVv7Xl/vGnqkHv33xPaCa6mdrB6d9V8FkU9g5ytYRI6
         Toc1chcRw3YCsQ9fJo0wY5f2uNrvCCTBzz2hRUC8N4JX6LZtW8xyF6pusK7vXw3YzwvX
         /fSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nT0Vpmgr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 103si3767566wrm.270.2021.08.26.06.23.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nT0Vpmgr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFLV-0007Od-3D
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGM-0005qS-U7
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:47 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGI-00056W-3Q
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u16so5039236wrn.5
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aPwZlZ+FcfCF18SiaZV3J9Dj2i/qKu0DetW7U/gVdig=;
 b=nT0VpmgriOT6oKk7xoejJHi7lQsEFh+nq4CtyBzNr6vrYwVNL/IXURh17qHGfmHMqV
 4XgGqxi4lAtQGFyupBPJyfMTbSIze8T3BrxhP4nLTLBrDyrCuGHY7mW+IPL1+yz3Ejgm
 gcaOvIrptOGWocJ+zL0fWrM/1Fvn1Xh4Nl4xwxSW69Xxl2N7oOvz/9elLjER4hKEQa0z
 FHdsxZblZRxhYA++TppaiPZ36DT//mq5bDi83ixGKnoPBs5Qm5IAIE4Re4M8PSzV6M4H
 X0u3sK0bnk9k9MGXmzDOaN1I9chvOyn4aStmlG0fXXNytfzjwX8dEyrcnF8q48Vd834O
 fQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aPwZlZ+FcfCF18SiaZV3J9Dj2i/qKu0DetW7U/gVdig=;
 b=myqD690iufrVFU8MxK7p0VCH8HonH9L6gpKDtCsYk4DKfEKUDIZTh5CTKbpu6fN9vF
 D3cUMdhlUFXWKCFdAnY77Ca4ZkJAKhNkWoJY+NZY2h3sc1zXqUGLmOQA+1pM/UT6PWJC
 WudpnfXxZvrCsyezZJbQElwsHpJZ4PPUGiU2arwz6HcMm2zPtr5fvBDd8o1TLHJuILpb
 ojeznQrBRijkb0+RO7XEspltknDhai4Bvnzf/aJoJMOr3MiKL5egSQvUIg04qP28RbbX
 wfzVyVC008cxt8VIpIr1rR4ZsrjHXNE/GF8dhGiHZ8yi2ga9Z6W9tQUwaprjqQI/EP4I
 lwwg==
X-Gm-Message-State: AOAM531xP5Xm4YyOoJ1UhN1bGF/+qA13wFxPXRIFJaIHlHn1O7mrxkCy
 DhHOOhibIvQx+vwhPr38vXGDRXI+AYFUEQ==
X-Received: by 2002:a5d:6e0c:: with SMTP id h12mr4019571wrz.334.1629983859935; 
 Thu, 26 Aug 2021 06:17:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/18] target/arm: Implement MVE VCVT with specified
 rounding mode
Date: Thu, 26 Aug 2021 14:17:22 +0100
Message-Id: <20210826131725.22449-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: VTkMDCDARyUH

Implement the MVE VCVT which converts from floating-point to integer
using a rounding mode specified by the instruction.  We implement
this similarly to the Neon equivalents, by passing the required
rounding mode as an extra integer parameter to the helper functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index d829ffe12d6..a793199fbee 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3294,3 +3294,41 @@ DO_VCVT_FIXED(vcvt_sf, 4, int32_t, helper_vfp_sltos)
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

