Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp185061ejc;
        Mon, 10 Apr 2023 18:11:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350b9aNbFiAm3ezsnHkqbOoDwT0zVgCda1VPVn8t3tgh1+X5MwZz62Mn6DK3v1UZCmFZARF9m
X-Received: by 2002:a05:622a:164d:b0:3c0:3b08:2d80 with SMTP id y13-20020a05622a164d00b003c03b082d80mr20657904qtj.63.1681175480089;
        Mon, 10 Apr 2023 18:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175480; cv=none;
        d=google.com; s=arc-20160816;
        b=Pi5lz0gbGMOv8djhRiPS889yvUNMtYwXbK8JsotPd1rpFQimPFaYXFMFLXxWGOey/M
         RO6y4mm5LrwwAeNsVQGmZMMVGcd2frDdbMTqDImOyOKIYmnXe4NoxtsfoY7UynUdSRtN
         IiW4CesN4iMUwcNUxEQaNIvLMQDYQalhGwZJMN9UG92RtPSRbnM7yk9Oxt+4rnfNQOs4
         8CKxb68gMyNU3MHWAA2fism3Zya/Ki/Bca2hcdaoODvnmwAFtN1AWaiaGwFcqccV4pOS
         3T/KjvCRV0BWqd6WGqT4NfA4uPtMSLDEltpI3dh6bVoZc+zRdJAPVRL3D09/LmL6r7He
         BLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=whk/sbAs9+BgxjsuU75DgmoVbPnFYtMBoe2U/lcKgTQ=;
        b=Omb59qaAFbkAL879aRuEFq2v7Th9O/rcDfF87klfCOMmKrhpd6Ep+/irXPbDuQtWsf
         5pl9lbnGceOkL7+3IbdYZY12J3mAAUEQB2HBJ89Ey9pzxOTNKmw+PnLwiruuyy5TK1x3
         GZOUS2XhJs8REmadeXz96eZUaKvwmibt/c94J/WW5t5LJMu6BwS8oN442lSEQRYT4BbP
         bmagEw3LibYM9ExCpq2WBCWrxbgwtIZEP3U1OEK5bjhEs1u+OdCg86Om5wDEvmdeqiHI
         tyYZ8x4hCphq88MOZmA3EshDwNnZgolxHqKlN/klmbEmnwhw3T57BkfGVEvC37rlqcyO
         rnbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OR2xHDnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020ac87f88000000b003bb73ea08a8si8529054qtj.637.2023.04.10.18.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OR2xHDnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2WY-0004AY-If; Mon, 10 Apr 2023 21:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WQ-0003kD-Mu
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WN-0001uC-0I
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:09 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 pc4-20020a17090b3b8400b0024676052044so6398740pjb.1
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whk/sbAs9+BgxjsuU75DgmoVbPnFYtMBoe2U/lcKgTQ=;
 b=OR2xHDnpp8bhheZrUJB2FxNDewxKz2u5/msylF1TuSGrGk5kWLRLzDb9p1RKMvZ3EP
 gtHBa+tZtM0w/ip1w9k10JtcgXlz4lXN8bhbHXEqXI3PC4s0cC/DK4vyJtq46Qj+LQFN
 T6gbPtsouKNDtSTXu0XSoPGIbGHoU3KnmsEmyuICaFstZF6anOO14RzlkTqjp7bOfasj
 5sGhMwtPjgrKyXy4It8i84r/+Zd1/9v7gucnfYvyy0JwvtJt+IKbk1EgnMjOp4mbUy9X
 cXJhsFxhrUgqHxt8MtHIH0sVsKtCugaGGB2bC0iaO6L+JsJanq1LylsFQB4VrV8/yqTJ
 5hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whk/sbAs9+BgxjsuU75DgmoVbPnFYtMBoe2U/lcKgTQ=;
 b=IxZWtdNoT88ysGQ/RRpOvWNAOLntK7xoyCnsjFRObLZhH/J6oPIBtbvHWTxVwwjDts
 NMdXixQCS7JXkSw+VotGfLea/mrSQ0q0jsIXlYAgcnUqNWtW1oeeyKHiCiByJFw1peaJ
 euOptcNavCOKw9/GFo5dQGiMgBRBcGcRxmrMEX+6vMMPWgpvbY5eBNys+eTcMnnfyfPs
 YPsf2hHbszAMRIB7vFDXK/iRAK/IG/s9ll9wA6r/4nvsaa54S1xPkaN4KSFPDQ68W6Mv
 q+ZM6SFlLc5XqWjPKclYCJv1keZsxOPq2D4j+JzMR84s6swTyamKYdYUibnPxZ9AKS+3
 JM1w==
X-Gm-Message-State: AAQBX9d+Sb7hMAyrUazBuYhXm9oVw6pZNU2Bb9SK43QNNYajKkv5z0tO
 3KIDMXe1mXMRZwFkpyZt8xvcdw==
X-Received: by 2002:a17:903:124a:b0:1a1:d624:2fe2 with SMTP id
 u10-20020a170903124a00b001a1d6242fe2mr16822239plh.17.1681175405708; 
 Mon, 10 Apr 2023 18:10:05 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 42/54] tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:05:00 -0700
Message-Id: <20230411010512.5375-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zADEbZX6aOH+

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 88 ++++++++++++----------------------------
 1 file changed, 26 insertions(+), 62 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 90093a6509..1b60166d2f 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2137,44 +2137,38 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
     label->label_ptr[0] = lptr;
 }
 
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
+{
+    if (arg < 0) {
+        arg = TCG_REG_TMP1;
+    }
+    tcg_out32(s, MFSPR | RT(arg) | LR);
+    return arg;
+}
+
+/*
+ * For the purposes of ppc32 sorting 4 input registers into 4 argument
+ * registers, there is an outside chance we would require 3 temps.
+ * Because of constraints, no inputs are in r3, and env will not be
+ * placed into r3 until after the sorting is done, and is thus free.
+ */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen,
+    .ntmp = 3,
+    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
-
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_REG_R4);
-        tcg_out_mov(s, TCG_TYPE_I32, hi, TCG_REG_R3);
-    } else {
-        tcg_out_movext(s, lb->type, lo,
-                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_R3);
-    }
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tcg_out_b(s, 0, lb->raddr);
     return true;
@@ -2182,43 +2176,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                       arg++, lb->type, s_bits, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
-
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tcg_out_b(s, 0, lb->raddr);
-- 
2.34.1

