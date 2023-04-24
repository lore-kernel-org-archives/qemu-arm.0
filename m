Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600847ejm;
        Sun, 23 Apr 2023 22:54:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350bGBDhzsqv2GETRGPm27kEFOcUTfJoisQ2tTu6G13MZiP96E4dq+fxxLlWQDDKmIoGmByRZ
X-Received: by 2002:a05:622a:178b:b0:3ef:4a9b:5dca with SMTP id s11-20020a05622a178b00b003ef4a9b5dcamr20974253qtk.29.1682315640663;
        Sun, 23 Apr 2023 22:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315640; cv=none;
        d=google.com; s=arc-20160816;
        b=khHqfN3smpffNvaYebzdJzypK3cas/LJ1qu2vpr6QlgG065rBZBqOcFEV/i0n6agvY
         LbXiCP18IbeFJcSwhflvTqJ+K31nV5uMK9ev+4UjTx/kJgw9NJ367+tle+UjK+LeseXb
         41+8uS+WwJiAH7ZXSaoJKCyKfEl6y3kV4cGANWgNnvIFPISTkIz7gAHnrXl8xrA3vFzC
         TLgMpaWUwqQ3paUOQRBhXlLnH/URYAq4EXi0VgcpSfTypa7J/204vqlMlaPt4zaeAFH0
         oAlZILHotlkisJyAulCAe6mIEpOgjjDQArP9MNW4xHeIeARt/RIKh78iG+tZYXJkAxOW
         J1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e67Crv76HZSCg/mw2UfCxuP3kRlNk2dyxOLXgebiI/I=;
        b=bbElG9bgnx3Nk2DJ1Z2eslp/r0T+OBN2+qfN8vjFhk+RQITTEyhUYDF1XerXpO48oc
         nt68X/VNXPhKxFNHw2EmF1uMoUmogbR5LaB2rrz/k3wxGdGLuOZDTazARdI/iWhfsd+3
         0q/r0Jb3PhXDFvwqY19WXXE0SI9q73PT3aF5LgphxcLDMhYzad/R1PNqArsHj0UmSai1
         gUlA7t6kajpIdJ9g9Wone6ccUVTV5yv8SRHx6WEslSQVKls3q89sOBuQp0o3I9UfcjXs
         ydV12q4NbmkM6b7QBocx9tTdrMR4WaJAFoav88OnQghRoBiT7QuMBL2afC13xGYpchMd
         HQrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V5R0e9oJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020ac87f94000000b003ea1a62d281si6852105qtj.81.2023.04.23.22.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V5R0e9oJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp2U-0000fg-2t; Mon, 24 Apr 2023 01:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0C-0005tl-BX
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:44:43 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp04-0005Gq-HV
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:44:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1950f569eso16301175e9.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315071; x=1684907071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e67Crv76HZSCg/mw2UfCxuP3kRlNk2dyxOLXgebiI/I=;
 b=V5R0e9oJ1k3/iy/GfS3btBIZK9PMyzOkPGpML3uDDAkjWsyrcdV4cnlttM+GcHBL4X
 L5VkO9cnL08vbAVhO5M760t6w9pGWh3HhKF1/0eEmjDhuoTgkQhbD9KKkRKcD3yWQZLQ
 0KDnRJRa825Ao3zkies8fHbIy+zx4b6hffb1RfV9KoNzoYgcNlcreObX6K/Jn19EOQyj
 O3Ets6nDRNOomD15Z+TzRNNTHgfmQF3p9tRKNcQKf00fzLQ4xd+k35kK9igMForXbq2c
 cABddqN/lnk4J3NeJ74EjR0RqqRon/D7VsvT+jE9UNQrh5ICvpeKQBXdwYQJQTiezzgk
 9n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315071; x=1684907071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e67Crv76HZSCg/mw2UfCxuP3kRlNk2dyxOLXgebiI/I=;
 b=RA9A616GOmrpZSLB5GUg+CuZlSEm3++72NEH0cEbbjEM7qMmGBmgW3NsHKl5xPp31C
 cRwi90ge+arl3qMXP3aZQlcO2LSbl4mV+og6AOsHOlaN6cDD1AJqFmbpWrkxujyZmsRD
 OK3usgy/W31rDHCTTjvuIYPdAD0d3tMio7zDiHUl7FmmeK5g7gAvHY97rE17KfYXMRH7
 Y7/CNKcOxGf7NVqZCDDiVADyWv3X3tI2r3cLxW5z08IpqFoyuggaVQlkmXBWSMlhyVIf
 ddR9MA38KuVBUIgNmilspn+njKB6rYsEEreh2xsaf9TsSHalSMNVdowUZU5y96Bprahk
 aweQ==
X-Gm-Message-State: AAQBX9fuEcmlk4/Q2kXVVI6Krp2CE1YAHc+pbUuJXLyum/uaGsAw0nOs
 8U7dd5Xx6Xpu1WVcrq9gXzPl6g==
X-Received: by 2002:a1c:f715:0:b0:3f0:5887:bea3 with SMTP id
 v21-20020a1cf715000000b003f05887bea3mr7041346wmh.27.1682315071091; 
 Sun, 23 Apr 2023 22:44:31 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 42/57] tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 24 Apr 2023 06:40:50 +0100
Message-Id: <20230424054105.1579315-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xRfqYiLEmkIo

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  This allows our local
tcg_out_arg_* infrastructure to be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 140 +++++----------------------------------
 1 file changed, 18 insertions(+), 122 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index c744512778..df514e56fc 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -690,8 +690,8 @@ tcg_out_ldrd_rwb(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, TCGReg rm)
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt,
-                           TCGReg rn, int imm8)
+static void __attribute__((unused))
+tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRD_IMM, rt, rn, imm8, 1, 0);
 }
@@ -969,28 +969,16 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_dat_imm(s, COND_AL, ARITH_AND, rd, rn, 0xff);
 }
 
-static void __attribute__((unused))
-tcg_out_ext8u_cond(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
-{
-    tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
-}
-
 static void tcg_out_ext16s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
 {
     /* sxth */
     tcg_out32(s, 0x06bf0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
-static void tcg_out_ext16u_cond(TCGContext *s, ARMCond cond,
-                                TCGReg rd, TCGReg rn)
-{
-    /* uxth */
-    tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rn);
-}
-
 static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
 {
-    tcg_out_ext16u_cond(s, COND_AL, rd, rn);
+    /* uxth */
+    tcg_out32(s, 0x06ff0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
@@ -1382,92 +1370,29 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-/* Helper routines for marshalling helper function arguments into
- * the correct registers and stack.
- * argreg is where we want to put this argument, arg is the argument itself.
- * Return value is the updated argreg ready for the next call.
- * Note that argreg 0..3 is real registers, 4+ on stack.
- *
- * We provide routines for arguments which are: immediate, 32 bit
- * value in register, 16 and 8 bit values in register (which must be zero
- * extended before use) and 64 bit value in a lo:hi register pair.
- */
-#define DEFINE_TCG_OUT_ARG(NAME, ARGTYPE, MOV_ARG, EXT_ARG)                \
-static TCGReg NAME(TCGContext *s, TCGReg argreg, ARGTYPE arg)              \
-{                                                                          \
-    if (argreg < 4) {                                                      \
-        MOV_ARG(s, COND_AL, argreg, arg);                                  \
-    } else {                                                               \
-        int ofs = (argreg - 4) * 4;                                        \
-        EXT_ARG;                                                           \
-        tcg_debug_assert(ofs + 4 <= TCG_STATIC_CALL_ARGS_SIZE);            \
-        tcg_out_st32_12(s, COND_AL, arg, TCG_REG_CALL_STACK, ofs);         \
-    }                                                                      \
-    return argreg + 1;                                                     \
-}
-
-DEFINE_TCG_OUT_ARG(tcg_out_arg_imm32, uint32_t, tcg_out_movi32,
-    (tcg_out_movi32(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg8, TCGReg, tcg_out_ext8u_cond,
-    (tcg_out_ext8u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u_cond,
-    (tcg_out_ext16u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg32, TCGReg, tcg_out_mov_reg, )
-
-static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
-                                TCGReg arglo, TCGReg arghi)
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
-    /* 64 bit arguments must go in even/odd register pairs
-     * and in 8-aligned stack slots.
-     */
-    if (argreg & 1) {
-        argreg++;
-    }
-    if (argreg >= 4 && (arglo & 1) == 0 && arghi == arglo + 1) {
-        tcg_out_strd_8(s, COND_AL, arglo,
-                       TCG_REG_CALL_STACK, (argreg - 4) * 4);
-        return argreg + 2;
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, arglo);
-        argreg = tcg_out_arg_reg32(s, argreg, arghi);
-        return argreg;
-    }
+    /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
+    return TCG_REG_R14;
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen,
+    .ntmp = 1,
+    .tmp = { TCG_REG_TMP },
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    argreg = tcg_out_arg_reg32(s, TCG_REG_R0, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        argreg = tcg_out_arg_reg64(s, argreg, lb->addrlo_reg, lb->addrhi_reg);
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, lb->addrlo_reg);
-    }
-    argreg = tcg_out_arg_imm32(s, argreg, oi);
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
-
-    /* Use the canonical unsigned helpers and minimize icache usage. */
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
-
-    if ((opc & MO_SIZE) == MO_64) {
-        TCGMovExtend ext[2] = {
-            { .dst = lb->datalo_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_R0, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = lb->datahi_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_R1, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
-    } else {
-        tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,
-                       TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
-    }
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tcg_out_goto(s, COND_AL, lb->raddr);
     return true;
@@ -1475,42 +1400,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg, datalo, datahi;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    argreg = TCG_REG_R0;
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        argreg = tcg_out_arg_reg64(s, argreg, lb->addrlo_reg, lb->addrhi_reg);
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, lb->addrlo_reg);
-    }
-
-    datalo = lb->datalo_reg;
-    datahi = lb->datahi_reg;
-    switch (opc & MO_SIZE) {
-    case MO_8:
-        argreg = tcg_out_arg_reg8(s, argreg, datalo);
-        break;
-    case MO_16:
-        argreg = tcg_out_arg_reg16(s, argreg, datalo);
-        break;
-    case MO_32:
-    default:
-        argreg = tcg_out_arg_reg32(s, argreg, datalo);
-        break;
-    case MO_64:
-        argreg = tcg_out_arg_reg64(s, argreg, datalo, datahi);
-        break;
-    }
-
-    argreg = tcg_out_arg_imm32(s, argreg, oi);
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
 
     /* Tail-call to the helper, which will return to the fast path.  */
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
-- 
2.34.1

