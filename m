Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6588990ejq;
        Mon, 15 May 2023 08:23:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4g4uYEJnj9jAzMx0g9MmipMkpi7hNDx7HHijaLs9A9fDZceRLQH9KyUx7AWq7RcXsem0hr
X-Received: by 2002:a05:6214:260c:b0:614:da60:f45d with SMTP id gu12-20020a056214260c00b00614da60f45dmr62424872qvb.30.1684164194590;
        Mon, 15 May 2023 08:23:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684164194; cv=none;
        d=google.com; s=arc-20160816;
        b=1EhGGhuEIB+OhcIW62kL/EEO+5iYLOYzI4e15mVfWJyckeJI54HBBp5IhSABnM01rH
         NGLuksH/g53CfkvlF53S6Jy1euhFnQ9yYdU7TWvVM2RbehOuNtu8aStJLS0HddllfsFS
         yxPrQ4aKRz0gj8ap6H61L2wJJA0XNNN2CXZ5/9wPS6iD/XmokYpU+bIsmhEgDedi6s0q
         Y4nyVnGIYMuzVFO6KNvSBojZ/+YH4PqUMGhpvr3mFBs5+/aiOlNOxwNaXnlU8yz/3FsK
         Qp3+EH2Ru1SFy7Eqn0hW7HcZjh0+NkJ3GVPVhwa29CEYaqrGUawjdvYpCLv8eFm6qCX2
         5Siw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s0UJEF5x7D/tJuynxyknIi5yS26S+uTp0Nck/e1vPAw=;
        b=IKdpun3uWZKK71niiCh9eJf2tWP1+7gOOLHiMH+n5k4xFeiApXl37LcX6FgDb78iKo
         ngSWLg//PaIdsFkzMLr2if2bMAfl/2zBUT5w/3l8ftJm8QYNIx1EaNjb2JXDq4jZfho8
         bM4yvijH0jMCfWuL7XykeCJyd/aqQnPI2nMDTtAJfG3gRjwmzB2X7ALdSZ3+VYNtFgyS
         7mXSdk5cM+t7fGpTjJFCJKhpBW4uqlIYmM7lYqrQ2uScRbUow6UxYq889/7WzLzzNw39
         0y+V8NphNzfal66SP4h8z+Mvjeb+xhBrJ6USFdcOfne4wuBeujF7nAc2zWWHp/BXicJm
         zZig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OLl8LNwU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs2-20020a056214226200b0062025424f4fsi9955092qvb.611.2023.05.15.08.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:23:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OLl8LNwU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZLN-0008Qm-Ex; Mon, 15 May 2023 10:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZK4-0005mY-3J
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:12 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJr-00061n-7i
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:11 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ab1b79d3a7so88134415ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161418; x=1686753418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s0UJEF5x7D/tJuynxyknIi5yS26S+uTp0Nck/e1vPAw=;
 b=OLl8LNwUg4e06GWQk1+Kq07UpHHMf+UlLRlAml3aUT3xOrnqVYVpkyt06G+hhSvzEH
 iEQ+twXDmUK6+mmlRgOuKdQEvDuZ3w6/o0rVPGc54k7uLYDeFCVgqF/2GxYwJT/oMLSC
 I6G6UEFMv1G/xs3rOZpLBM57Bvt/CnKpPDpoyIayRXPnkEXpWy8Sl8x/ZxjSaRpXHkcm
 JmN+JXfqhnxlz3Zo95/A4PWwvrbz2Qpl2/zfhOsoRtIc1QCgRaEJfuxLCl8vHfZcBLYj
 ug8b+VYmEgMyEstOEoBVygnzoEHaOyHG3QkOoKsndTZipxONsHwW5iK0KyQKh6zAjOw0
 44iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161418; x=1686753418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s0UJEF5x7D/tJuynxyknIi5yS26S+uTp0Nck/e1vPAw=;
 b=N301sNx0lLyPxJfv8QTGqHuIInIjnG7jv27TWyuc29gsT1cfUHYu4/ocLEJpVlzKhh
 siF3F562WV3pHk2P25z3CVPa+coQ13XIqQVSU/TMw/kA1l2IrKlWTSQmXL79ciy/T62e
 8H9QvhUXOYG/0lSLN6/Hx3Gp8HuAoIUT0PVR5Is5EAQ6W1DfUvqdw+FC9J3z58SOvuhk
 C8dPo/hisqXeRWkYGxMsyykA2YCZ1cbsHzxmxl8QCCcgrPOQmqSuGxAfsgzl+Ut7sqdx
 cXm02OVmqXG3j7Rw+EXMX+5M/61ARGeA5eOYjBITIyvuHzqM9aSZgETsCmRX7jd9Y0Vi
 iXew==
X-Gm-Message-State: AC+VfDwkIXRp5vvVrIRTLIbj3jKFY0ikE4lM+Sj233Neqr8IlNSpl7B7
 /SUg56f1vW5iypzTBPbF9Czh9A==
X-Received: by 2002:a17:902:e888:b0:1ad:d500:19d3 with SMTP id
 w8-20020a170902e88800b001add50019d3mr17358339plg.23.1684161417918; 
 Mon, 15 May 2023 07:36:57 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 51/54] tcg/aarch64: Rename temporaries
Date: Mon, 15 May 2023 07:33:10 -0700
Message-Id: <20230515143313.734053-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: eezUhwEwQ8tB

We will need to allocate a second general-purpose temporary.
Rename the existing temps to add a distinguishing number.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 50 ++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ea4108d59c..1ed5be2c00 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -80,8 +80,8 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 bool have_lse;
 bool have_lse2;
 
-#define TCG_REG_TMP TCG_REG_X30
-#define TCG_VEC_TMP TCG_REG_V31
+#define TCG_REG_TMP0 TCG_REG_X30
+#define TCG_VEC_TMP0 TCG_REG_V31
 
 #ifndef CONFIG_SOFTMMU
 /* Note that XZR cannot be encoded in the address base register slot,
@@ -998,7 +998,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
 static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg r, TCGReg base, intptr_t offset)
 {
-    TCGReg temp = TCG_REG_TMP;
+    TCGReg temp = TCG_REG_TMP0;
 
     if (offset < -0xffffff || offset > 0xffffff) {
         tcg_out_movi(s, TCG_TYPE_PTR, temp, offset);
@@ -1150,8 +1150,8 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
     }
 
     /* Worst-case scenario, move offset to temp register, use reg offset.  */
-    tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, offset);
-    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP);
+    tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, offset);
+    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP0);
 }
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
@@ -1367,8 +1367,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *target)
     if (offset == sextract64(offset, 0, 26)) {
         tcg_out_insn(s, 3206, BL, offset);
     } else {
-        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP);
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, (intptr_t)target);
+        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP0);
     }
 }
 
@@ -1505,7 +1505,7 @@ static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
     AArch64Insn insn;
 
     if (rl == ah || (!const_bh && rl == bh)) {
-        rl = TCG_REG_TMP;
+        rl = TCG_REG_TMP0;
     }
 
     if (const_bl) {
@@ -1522,7 +1522,7 @@ static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
                possibility of adding 0+const in the low part, and the
                immediate add instructions encode XSP not XZR.  Don't try
                anything more elaborate here than loading another zero.  */
-            al = TCG_REG_TMP;
+            al = TCG_REG_TMP0;
             tcg_out_movi(s, ext, al, 0);
         }
         tcg_out_insn_3401(s, insn, ext, rl, al, bl);
@@ -1563,7 +1563,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
 {
     TCGReg a1 = a0;
     if (is_ctz) {
-        a1 = TCG_REG_TMP;
+        a1 = TCG_REG_TMP0;
         tcg_out_insn(s, 3507, RBIT, ext, a1, a0);
     }
     if (const_b && b == (ext ? 64 : 32)) {
@@ -1572,7 +1572,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
         AArch64Insn sel = I3506_CSEL;
 
         tcg_out_cmp(s, ext, a0, 0, 1);
-        tcg_out_insn(s, 3507, CLZ, ext, TCG_REG_TMP, a1);
+        tcg_out_insn(s, 3507, CLZ, ext, TCG_REG_TMP0, a1);
 
         if (const_b) {
             if (b == -1) {
@@ -1585,7 +1585,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
                 b = d;
             }
         }
-        tcg_out_insn_3506(s, sel, ext, d, TCG_REG_TMP, b, TCG_COND_NE);
+        tcg_out_insn_3506(s, sel, ext, d, TCG_REG_TMP0, b, TCG_COND_NE);
     }
 }
 
@@ -1602,7 +1602,7 @@ bool tcg_target_has_memory_bswap(MemOp memop)
 }
 
 static const TCGLdstHelperParam ldst_helper_param = {
-    .ntmp = 1, .tmp = { TCG_REG_TMP }
+    .ntmp = 1, .tmp = { TCG_REG_TMP0 }
 };
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
@@ -1862,7 +1862,7 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
 
     set_jmp_insn_offset(s, which);
     tcg_out32(s, I3206_B);
-    tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
+    tcg_out_insn(s, 3207, BR, TCG_REG_TMP0);
     set_jmp_reset_offset(s, which);
 }
 
@@ -1881,7 +1881,7 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
         ptrdiff_t i_offset = i_addr - jmp_rx;
 
         /* Note that we asserted this in range in tcg_out_goto_tb. */
-        insn = deposit32(I3305_LDR | TCG_REG_TMP, 5, 19, i_offset >> 2);
+        insn = deposit32(I3305_LDR | TCG_REG_TMP0, 5, 19, i_offset >> 2);
     }
     qatomic_set((uint32_t *)jmp_rw, insn);
     flush_idcache_range(jmp_rx, jmp_rw, 4);
@@ -2075,13 +2075,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_rem_i64:
     case INDEX_op_rem_i32:
-        tcg_out_insn(s, 3508, SDIV, ext, TCG_REG_TMP, a1, a2);
-        tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP, a2, a1);
+        tcg_out_insn(s, 3508, SDIV, ext, TCG_REG_TMP0, a1, a2);
+        tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP0, a2, a1);
         break;
     case INDEX_op_remu_i64:
     case INDEX_op_remu_i32:
-        tcg_out_insn(s, 3508, UDIV, ext, TCG_REG_TMP, a1, a2);
-        tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP, a2, a1);
+        tcg_out_insn(s, 3508, UDIV, ext, TCG_REG_TMP0, a1, a2);
+        tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP0, a2, a1);
         break;
 
     case INDEX_op_shl_i64:
@@ -2125,8 +2125,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (c2) {
             tcg_out_rotl(s, ext, a0, a1, a2);
         } else {
-            tcg_out_insn(s, 3502, SUB, 0, TCG_REG_TMP, TCG_REG_XZR, a2);
-            tcg_out_insn(s, 3508, RORV, ext, a0, a1, TCG_REG_TMP);
+            tcg_out_insn(s, 3502, SUB, 0, TCG_REG_TMP0, TCG_REG_XZR, a2);
+            tcg_out_insn(s, 3508, RORV, ext, a0, a1, TCG_REG_TMP0);
         }
         break;
 
@@ -2528,8 +2528,8 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                             break;
                         }
                     }
-                    tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP, 0);
-                    a2 = TCG_VEC_TMP;
+                    tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP0, 0);
+                    a2 = TCG_VEC_TMP0;
                 }
                 if (is_scalar) {
                     insn = cmp_scalar_insn[cond];
@@ -2938,9 +2938,9 @@ static void tcg_target_init(TCGContext *s)
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_FP);
-    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_X18); /* platform register */
-    tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP0);
 }
 
 /* Saving pairs: (X19, X20) .. (X27, X28), (X29(fp), X30(lr)).  */
-- 
2.34.1

