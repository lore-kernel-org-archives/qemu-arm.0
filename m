Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp884817ejq;
        Sat, 6 May 2023 00:26:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79GCaVih0j6cee57hoILbk0CjW/DXzHPAilPMBNt6sfhZFKw+FncOz8AEsrlTPCfETgmSb
X-Received: by 2002:a05:622a:1aa4:b0:3f2:1c13:b5a0 with SMTP id s36-20020a05622a1aa400b003f21c13b5a0mr5989279qtc.64.1683357995687;
        Sat, 06 May 2023 00:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357995; cv=none;
        d=google.com; s=arc-20160816;
        b=okwFun4vHG4xea9h7uYGX0Zdsjqu/zwb5XDkh7w0/sSk/3/cpDaj5JUaMIUuvFJnt0
         g9k+jFOqb4wDn061JleAGfiXHq1gSoeXVGj6uEUqqUjNMi7ZSniwjW5B8rNclCZ16SdK
         HOWTnf2VbrWsLctx+JX8Rhh2CfBu+b69PZhFAlOV3NyxU3qb9Ue213Tr8lIbGwFp08Gq
         H6syMC9300vaaafPFlZR8bTrwov9K8f3JS7pEgLGSLzrV31RRN9iyHurDg7fPwscOQuS
         +gFx30b1lk1mNL9jm8pG+QPCxCTDr+W2VoWGoZu+PUBo+U6usQrBGDsfQzz1d2qaXeg1
         Wb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kF/KuD0+uQLXuYT2v2A5wco+ARF0bjd47P8BXDbif68=;
        b=yFNu5g0gNdDnkV9FKe5RW0leMl3HpmZVlDNy/jz3MjJzxQwyXrv6p6mZ/JQ37KlfQX
         yvS0oJvmurfN3SQmR6+JxozLvWDVFVmoMX8+94IStmDJFnlRi2Ceo2wC2GT9ZsOpzBPJ
         eoS/ju3V0SkxHhO62y7bhjKmG/qmpxycmGauKCngzo7q1Leo7oj2pG5gjnXro9luqnV9
         5nzQZXj/LQIsGJv7Q+me1dx0Ko3jRpvPhexCOXYaWQaT7xTgUuyUI5jhRhmw3CFhqaR6
         DucGYZXhGXf0fTP0KuSkxYgetVaIOLMYUTssWpDuB0i8h8OZjA23SiWJQ30SZVfwd5mw
         +Lxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mv14RF7j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020a05620a126600b0074fb646790csi1248006qkl.631.2023.05.06.00.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mv14RF7j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCG6-0004ZE-Ck; Sat, 06 May 2023 03:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCG4-0004SA-6O
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFm-0004RM-3i
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30639daee76so1725633f8f.1
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357768; x=1685949768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kF/KuD0+uQLXuYT2v2A5wco+ARF0bjd47P8BXDbif68=;
 b=Mv14RF7j6oK1HepClJ8lQVXqr4edH3XWDmFJfnvFINlbqy/uUeif83mU2McgdlwGBU
 pCigGeRLFA1Guy+Nh67Rgc5wh1rrA6IV4FnDwOXmHsV0YqIrc8O8MHiXg72ETz+qpe7h
 Ym+TyVE3TM3e21H/W1fMlp2IKndN09WzDhQbPBoaYeG+mjZjTMfzdoQ+ZVcf5vLSOKr/
 XlQ5qAdDyJiH4k2r58jBmtX0dXZlK/f/X59EFFGQD8Azed0kQ0AcTYZi6G9OfaPvArTU
 50X7O6VybLX1wEjoy3wDCgwZoEA/Bwoay8ejSGMPzFiHjXmh/90FT5vkN9CY9r/UCwG5
 2vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357768; x=1685949768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kF/KuD0+uQLXuYT2v2A5wco+ARF0bjd47P8BXDbif68=;
 b=QAuBNsyh55DOqaKC9/i+BjFn2/Qm+ZtPGoAwvQEwaAYSe8c4HOxdMLh6jZqYiuUJ8o
 3Cbcf84aEgtaSzFwUU9KG003SLqDT9db3SLtXmxD6pQ8SgNnWV5ibj7HZYSraCiDrPZY
 B1e13TyhHLGA4Y1U7W26OkP1JfuUPFdnNKxQfvpg6oEx0KTm5P+DnCB1iu0A87cfs3RG
 P2zkFZ0jIJn9iSsnVIZLGSUt7borcNGnL1iGrqNkmvSI1LpEO4JGhfHRpr5bnT12xlnb
 MXx3pYzzTGv+pXPvlgV8pcMkw+QHsvsDInZlZsD6KIUOW+UtajauUtuVy37hwDjkixkM
 R9ZA==
X-Gm-Message-State: AC+VfDzpbnIzZcfNwtKMrkuIv2HxUFRqXw7wyBfhZzukiWZf3UI3jadk
 pZlfrk5aLg7edeB5PG5xAUcdizpk09a7VmEsQQ2U4g==
X-Received: by 2002:adf:e80e:0:b0:2f9:85ee:e031 with SMTP id
 o14-20020adfe80e000000b002f985eee031mr2866134wrm.26.1683357768633; 
 Sat, 06 May 2023 00:22:48 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 16/30] tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Sat,  6 May 2023 08:22:21 +0100
Message-Id: <20230506072235.597467-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: /78Ymvwc72ia

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  This allows our local
tcg_out_arg_* infrastructure to be removed.

We are no longer filling the call or return branch
delay slots, nor are we tail-calling for the store,
but this seems a small price to pay.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 154 ++++++--------------------------------
 1 file changed, 22 insertions(+), 132 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 94708e6ea7..022960d79a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1115,79 +1115,15 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
-/* Helper routines for marshalling helper function arguments into
- * the correct registers and stack.
- * I is where we want to put this argument, and is updated and returned
- * for the next call. ARG is the argument itself.
- *
- * We provide routines for arguments which are: immediate, 32 bit
- * value in register, 16 and 8 bit values in register (which must be zero
- * extended before use) and 64 bit value in a lo:hi register pair.
- */
-
-static int tcg_out_call_iarg_reg(TCGContext *s, int i, TCGReg arg)
-{
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tcg_out_mov(s, TCG_TYPE_REG, tcg_target_call_iarg_regs[i], arg);
-    } else {
-        /* For N32 and N64, the initial offset is different.  But there
-           we also have 8 argument register so we don't run out here.  */
-        tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
-        tcg_out_st(s, TCG_TYPE_REG, arg, TCG_REG_SP, 4 * i);
-    }
-    return i + 1;
-}
-
-static int tcg_out_call_iarg_reg8(TCGContext *s, int i, TCGReg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tmp = tcg_target_call_iarg_regs[i];
-    }
-    tcg_out_ext8u(s, tmp, arg);
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_reg16(TCGContext *s, int i, TCGReg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tmp = tcg_target_call_iarg_regs[i];
-    }
-    tcg_out_opc_imm(s, OPC_ANDI, tmp, arg, 0xffff);
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_imm(TCGContext *s, int i, TCGArg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (arg == 0) {
-        tmp = TCG_REG_ZERO;
-    } else {
-        if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-            tmp = tcg_target_call_iarg_regs[i];
-        }
-        tcg_out_movi(s, TCG_TYPE_REG, tmp, arg);
-    }
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_reg2(TCGContext *s, int i, TCGReg al, TCGReg ah)
-{
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
-    i = (i + 1) & ~1;
-    i = tcg_out_call_iarg_reg(s, i, (MIPS_BE ? ah : al));
-    i = tcg_out_call_iarg_reg(s, i, (MIPS_BE ? al : ah));
-    return i;
-}
+/* We have four temps, we might as well expose three of them. */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 3, .tmp = { TCG_TMP0, TCG_TMP1, TCG_TMP2 }
+};
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg v0;
-    int i;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
@@ -1196,29 +1132,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         return false;
     }
 
-    i = 1;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        i = tcg_out_call_iarg_reg2(s, i, l->addrlo_reg, l->addrhi_reg);
-    } else {
-        i = tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
-    }
-    i = tcg_out_call_iarg_imm(s, i, oi);
-    i = tcg_out_call_iarg_imm(s, i, (intptr_t)l->raddr);
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
+
     tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)], false);
     /* delay slot */
-    tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+    tcg_out_nop(s);
 
-    v0 = l->datalo_reg;
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        /* We eliminated V0 from the possible output registers, so it
-           cannot be clobbered here.  So we must move V1 first.  */
-        if (MIPS_BE) {
-            tcg_out_mov(s, TCG_TYPE_I32, v0, TCG_REG_V1);
-            v0 = l->datahi_reg;
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_V1);
-        }
-    }
+    tcg_out_ld_helper_ret(s, l, true, &ldst_helper_param);
 
     tcg_out_opc_br(s, OPC_BEQ, TCG_REG_ZERO, TCG_REG_ZERO);
     if (!reloc_pc16(s->code_ptr - 1, l->raddr)) {
@@ -1226,22 +1146,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* delay slot */
-    if (TCG_TARGET_REG_BITS == 64 && l->type == TCG_TYPE_I32) {
-        /* we always sign-extend 32-bit loads */
-        tcg_out_ext32s(s, v0, TCG_REG_V0);
-    } else {
-        tcg_out_opc_reg(s, OPC_OR, v0, TCG_REG_V0, TCG_REG_ZERO);
-    }
+    tcg_out_nop(s);
     return true;
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    int i;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
@@ -1250,41 +1162,19 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         return false;
     }
 
-    i = 1;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        i = tcg_out_call_iarg_reg2(s, i, l->addrlo_reg, l->addrhi_reg);
-    } else {
-        i = tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
-    }
-    switch (s_bits) {
-    case MO_8:
-        i = tcg_out_call_iarg_reg8(s, i, l->datalo_reg);
-        break;
-    case MO_16:
-        i = tcg_out_call_iarg_reg16(s, i, l->datalo_reg);
-        break;
-    case MO_32:
-        i = tcg_out_call_iarg_reg(s, i, l->datalo_reg);
-        break;
-    case MO_64:
-        if (TCG_TARGET_REG_BITS == 32) {
-            i = tcg_out_call_iarg_reg2(s, i, l->datalo_reg, l->datahi_reg);
-        } else {
-            i = tcg_out_call_iarg_reg(s, i, l->datalo_reg);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    i = tcg_out_call_iarg_imm(s, i, oi);
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
 
-    /* Tail call to the store helper.  Thus force the return address
-       computation to take place in the return address register.  */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (intptr_t)l->raddr);
-    i = tcg_out_call_iarg_reg(s, i, TCG_REG_RA);
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], true);
+    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], false);
     /* delay slot */
-    tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+    tcg_out_nop(s);
+
+    tcg_out_opc_br(s, OPC_BEQ, TCG_REG_ZERO, TCG_REG_ZERO);
+    if (!reloc_pc16(s->code_ptr - 1, l->raddr)) {
+        return false;
+    }
+
+    /* delay slot */
+    tcg_out_nop(s);
     return true;
 }
 
-- 
2.34.1

