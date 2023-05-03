Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2653642ejm;
        Wed, 3 May 2023 00:11:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yjyAkrJbDCBaR9AT4UZj4w4mRERXDXRZG7H4t6tuTMByKVTift4vPRkNKdAw4hMM/jgP5
X-Received: by 2002:ac8:5f07:0:b0:3ef:5d8c:20c3 with SMTP id x7-20020ac85f07000000b003ef5d8c20c3mr27268478qta.27.1683097861355;
        Wed, 03 May 2023 00:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097861; cv=none;
        d=google.com; s=arc-20160816;
        b=mFWJLyOf7Y6D95RIK/L9u4TLHUOtu+iL0dBWY8g9lNKPXZjf9K08asJF7e7pvza9iK
         IScNe33he8/Dh1EA6CYkF/VB6VYzmU3l3fBrf9bYnlzljXZ/pi4FI0ljG7XYbtm6fG6N
         adQqU0I/gi9t9o4QWQhvnUYbd/dB1KsBWoO2rsQf27aXEUM60EkCIF49UfL1DWVjQJUf
         kpL24fN9hK/oAqTehmg5ocw55tlC8DH75qbDORPzB+lm6MW3ehU1a1jzn0DFy3NoOHXb
         wdrd+kvSYyeKkjvP1l3Z3pDTRCdhypX3PfJALr8yyX1NscUd7RGDhX6sQLAFr76lmvmW
         LVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e67Crv76HZSCg/mw2UfCxuP3kRlNk2dyxOLXgebiI/I=;
        b=N0kzjsbL+pOQIqPEh2boVBeOYdW8Dln1th0wa1FbfPao8vdY/nSk22rABePfNtVxLe
         WBENa2YKMo8/O3U8HIgKxCHrtDFUzJKyjBhhD5/68SeRqzx8geKkpJLQ+SkokvFMcW37
         Ad95fsk0vIXMYpwfoLZfXnUsxf8Byfp8aALNQ8IgQgJBKAm+l+oRaA0wRqh1zndsm1p3
         c5QuMwcIqP34gRmNLuO+WjN/ZFAO/630ikIQRNty7ARDbeMYdHvz9zyje8BYmPhwyUJ9
         JS5FvLgdapBqiDdpz5a7PW9r/XHHQibQlUSHzIO2er0X+CtoggEFD6u7Ut+5WH5Y4s8z
         PaHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajqJktg2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020a05620a404200b0074e2d182f71si18757574qko.691.2023.05.03.00.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajqJktg2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6SQ-00025h-7p; Wed, 03 May 2023 02:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Ro-0000FZ-9k
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R6-0001jS-Ib
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:43 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f37a36b713so6950245e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097079; x=1685689079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e67Crv76HZSCg/mw2UfCxuP3kRlNk2dyxOLXgebiI/I=;
 b=ajqJktg2gaGXbu9RfJwCSG/JFZRM9yI/pYmIKBK4DfXvVXBx3v2ej8nLjDO6lktifd
 2+GZ/9WhKZJADemrF5rDKgthdne15z8DDLLqpfIqWWxRVkDFDd848K0uFY7l4kh5RVit
 9ry+y7pc/mIAveXZkdvGy3VY3Yl3HscjokRzKtrsTrGEKC8Qtzca1Pj4tms//VkjVqus
 j8x1YefL64rY64ykDNGOq2GLTFA+oP/R9qZJ5BbvGfG5R4cdZOMhLJdLNlBDWnMgkpYK
 C5UWqB25dQhSIK6we+txswU3zSXt1wrGoFP17zQtMjW5lPCMosFA55PeZxo5PD8NZVrR
 5zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097079; x=1685689079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e67Crv76HZSCg/mw2UfCxuP3kRlNk2dyxOLXgebiI/I=;
 b=LbrdcNe/ZB/cXeTm3p17eAVFO+GUbANNyZpRW+zYZ8tvX7T2K7d1HNKzEH5Bd+ZiIX
 3v5sZZ8C+TlFJz0qPgfoBh7RlfpsVNi4DvK+fux165gbg7MI2NDVt9nXo4iHFemeV2nJ
 7bn/ODA4M5XXh/oPiIEh43WZvgNiVRpAPd3t9gxYAQ6e+wtZ+eSuYVjWzR+q173Ao1mO
 RSPHD3QvEHNScxPa1ACDk3xmu4yFEWG3ZWLWuUdNPAeuUWY8tpKgQYK5I+EOzo1LnnmU
 kdTB38tIGFUHmdnpOVM/cItXmwpr9CnTrA92e0WL7eOC0lx1nlC7T4sm/Xtl51oGzEZo
 1l2A==
X-Gm-Message-State: AC+VfDyoXBdLUK3tiBCZlDvMyjh2ejEjppA9sto3F4cG+uttuYZx/sZ3
 BYRNsf9Li/8wnoSxZIR+/lDP4blMsk+ykfwVw4n5PQ==
X-Received: by 2002:adf:fac8:0:b0:306:36ee:3c17 with SMTP id
 a8-20020adffac8000000b0030636ee3c17mr3406897wrs.71.1683097079687; 
 Tue, 02 May 2023 23:57:59 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 38/54] tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Wed,  3 May 2023 07:57:13 +0100
Message-Id: <20230503065729.1745843-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WejH5MQmwN1e

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

