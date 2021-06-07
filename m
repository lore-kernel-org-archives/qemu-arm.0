Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3694949lfa;
        Mon, 7 Jun 2021 10:25:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXQTneF1hyOVQ3SNk3Ic2JWFx2P97vErDvtA+ckLPW8sdXSCmwl6qP7lLzOWXgejS6FxkV
X-Received: by 2002:a9d:6287:: with SMTP id x7mr8198066otk.132.1623086710945;
        Mon, 07 Jun 2021 10:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086710; cv=none;
        d=google.com; s=arc-20160816;
        b=ZhanNaqqvngvp6z81e4QL8eSm/jGZpO9PKKvI6zB/6E+4QGnYAWMfrdK1GuVDgDyBS
         NlBFn31V/6ZOmHYGhdIGUrKvedIxFMKnYAglpq2Szbx0QihMIC0WGeSoBCjorA4+kgi5
         N0ys2CXzm1gpIyhJnxX8n2HErxydMM3gBSTeueXfrmkc4RF88RuPU/mf/5xaiPOsWgVE
         HSPnSUyVohuV86/1MBpYpFsqBVDz2jXVQXXW7FPfbDZEgA95AMTb5qPkF1s47Gu9qEli
         JRYCPfjWCoZRHGsEjBR5R+nBg908XutNLDim/zogPINmYDblSSzd0m0wsk1cSCCyxlBN
         Tffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iG+V472YKemSSADYbYtYqkhlhqc8Dpeb6zyxo7Ks0x8=;
        b=ApkL2ZjSp5D7jZMpteErgT4gcTohvp9wwyEp5szyOdn3UvUMUwCALICDgMEl6zaVYP
         7iJ1fAHURioGY6GVd5l4eVMBnRzBx9u5qCuVzbJYp8KHvVR3Y7NbzMrlsD7MHVOCXFr8
         0i2eYyAbngPj0Qio6Bx6iD509dteqHftThKxQaQmy1wTd7diZwVW/6ZxsxeXR314SLxu
         h1tEj5JeM78EK3H1wHJtnWx6L1HczZ2bVnhcZUdCy5wVv3oTdp5geRQ3DUeTRa/Y43Vi
         zd6uWcwo9f10pDK5zE9MXa8OyMniWAg/nKaIc7NAcCKSrcB+NaJDUv5zwWNaQ5rMJGM3
         RFfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wu980KzS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si11049593otg.298.2021.06.07.10.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wu980KzS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIzt-0005cX-RQ
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaw-0007jJ-Md
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaS-00081u-7x
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l2so18466153wrw.6
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iG+V472YKemSSADYbYtYqkhlhqc8Dpeb6zyxo7Ks0x8=;
 b=wu980KzSVq27gEqlIvfWXtQiLgFeXuGBN4gy70Z98XHA3DlHxdnXcdbUNPCEL+8OXz
 N2wJYKBev98UvcumkePT+dtp1BlFUSt+hpIHfoduW7zAiZpM65eHPCqAtNFNk2CVc29l
 EvOXhVAUaaCxQHW4Wwr10uGbS8APhknnQtm6No0v2yPCFPnP+d6PGtGgGDZKPv4X1JeL
 ypGvJ5TG1NGnqGl0n2bvCAEM8qisGFLYZGb3S5yu9gdGHzYHzkjwKA3hEnzYLWy6y1F8
 2yChqQzxawo0m01Au9J+tJDekd/gDky+Vemd/WGktJ3IMp3pekgbEXD1FvgTitv9ozu3
 fWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iG+V472YKemSSADYbYtYqkhlhqc8Dpeb6zyxo7Ks0x8=;
 b=LCOHIkRd6HEz9S0RW6bP1zPkyZs+KIQXBDv9RY+SNr+yR3rXZUk4bY1mtAn3V/dukI
 4OlcqsqvuDUbLiKvwWpPGtN3anczlz0NisR6lh50ejM2413SubOQiphEnr3t8wdUZGzq
 KQDPINZIsd7zpy8IYd+4ePvbQDA1DF/c+jCt0yx1QWboIgQJW9Iy4CQ0uz2L9DBJX98H
 h3comKSgcaC3jMAnlkb8Y+zz6EYvsO/RSgqu1nd2JfnjlZNYIfn7J3JuCdRm43s1fs/d
 nkJPDIYkMWt3S722H0ofHYsl1/YW9+PjxJbazg0vzHIBCrctPSVQFYdQdDz9BB+wHZEb
 U2hw==
X-Gm-Message-State: AOAM531VUgY9h5mhUB4pMqU++tm9auUc1ArvXPEWIM1GGkLT8hwgaMr4
 TlVElGculfdamt+MJ9XJzVyH9oeG9IcxldVt
X-Received: by 2002:a5d:6111:: with SMTP id v17mr8370728wrt.20.1623085129843; 
 Mon, 07 Jun 2021 09:58:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 33/55] target/arm: Implement MVE VADD (scalar)
Date: Mon,  7 Jun 2021 17:57:59 +0100
Message-Id: <20210607165821.9892-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: rnRPDfdDSUrp

Implement the scalar form of the MVE VADD insn. This takes the
scalar operand from a general purpose register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  7 ++++++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++
 target/arm/translate-mve.c | 49 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 723bef4a83a..d2626810aaf 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -147,6 +147,10 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index b22a7535308..8d9811c5473 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -478,6 +478,31 @@ DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
 
+#define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            TYPE r = FN(n[H(e)], m);                                    \
+            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
+            d[H(e)] &= ~bytemask;                                       \
+            d[H(e)] |= (r & bytemask);                                  \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* provide unsigned 2-op scalar helpers for all sizes */
+#define DO_2OP_SCALAR_U(OP, FN)                 \
+    DO_2OP_SCALAR(OP##b, 1, uint8_t, H1, FN)    \
+    DO_2OP_SCALAR(OP##h, 2, uint16_t, H2, FN)   \
+    DO_2OP_SCALAR(OP##w, 4, uint32_t, H4, FN)
+
+DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
+
 /*
  * Multiply add long dual accumulate ops.
  */
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6792fca798d..89e5aa50284 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -31,6 +31,7 @@
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
@@ -415,6 +416,54 @@ DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
 
+static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
+                          MVEGenTwoOpScalarFn fn)
+{
+    TCGv_ptr qd, qn;
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (a->qd > 7 || a->qn > 7 || !fn) {
+        return false;
+    }
+    if (a->rm == 13 || a->rm == 15) {
+        /* UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+    if (!vfp_access_check(s)) {
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
+        MVEGenTwoOpScalarFn *fns[] = {                          \
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

