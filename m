Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2602316ejm;
        Sun, 23 Apr 2023 22:58:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBefnq7fGVm2Auu50Tt6fV1HmkDxZLBBZfIeLZ5j6rfeXyKM6+1f8XWO2UAkGc85ck6e8I
X-Received: by 2002:a05:6214:404:b0:5ef:4435:f1bb with SMTP id z4-20020a056214040400b005ef4435f1bbmr22454530qvx.28.1682315895910;
        Sun, 23 Apr 2023 22:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315895; cv=none;
        d=google.com; s=arc-20160816;
        b=tml3QnAyn4iHhEjEy1cjYy0RRvEn77X8kU59/IGnrHOdQL4/LJ57HYMCsfOoFHgdAJ
         pz5WswTpq/bKBdmknsHYBSInlt++M3HB44DOvJKIB0vP8IgGpUmiTdsnjQXzAdfovFB8
         2I2KLmUbdFzQ70hZ5DqvgUJ7dTKEeoVvv6L1OwRvDfWL422Z7ipZBZ9khFbEO6zX6qnL
         MupT1yYYZvqsY00cHv4aiAe8DJ4v5wME8C++u7VoJ6zAmW5pCl9oQIRG1+DUqXGNWoYf
         2Wk33gwGK9QcmACqChTxAakHko7bf6oJEf12zzb9qZ7wluVUf4Yh2x6/2mrVTBx5Phzt
         717w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZSVOud/5oKlAnVwpslEtFRK+Oix2rv19Z5C3zjX6ptc=;
        b=WYe8e4JKLLmS259tvn4+2b8F12hyQkLX7dIj85RKuzg+y5R8b+cGZ786Km+TKiFF8I
         RnEhxDnI1aLDOamOuJdGmlVaHk3CBPru0M3/wELo9S4lFT4er4wZ4NARWMAtdUy9N/bm
         krytG5yU3k+Vdr0NpodoU2fCgvamXc1Zmm55vpa0uyf4Ohny9YnOTJNVoYbLQOs7dUD8
         cfid6tIwGoiedRVqQeqU4+ucQsXzz72QcoGchGLjE11Lb425Rak6wu4nGTOAnPfthrf1
         c45iROrgUmzmSWzNTh2We9+tGmHJeaPme4pr+KJTwAve5OfrBhh6DQZFEEUMfXP2rksB
         ajBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nkIHh03S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk28-20020a056214509c00b005f24d617fb2si6688075qvb.107.2023.04.23.22.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nkIHh03S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoyu-0008H2-E5; Mon, 24 Apr 2023 01:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxa-0005dh-JK
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowy-0004Mm-GP
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f87c5b4635so3626965f8f.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314878; x=1684906878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSVOud/5oKlAnVwpslEtFRK+Oix2rv19Z5C3zjX6ptc=;
 b=nkIHh03ShYQ3dr9nbdCRUB+fB5ZGwUSQugO7Oj9W087ILy8YwuHW00CJTqvYA1qwik
 sGmxPafrw9dcXOHJHlcxtX/s+J0JQpYopDLCnIvb1cCmAaGJtTp3u8TzkCuKXjCfjP7+
 H58DJEKHgyeDx3TLSF+PlhllTHlN10zfpTYIb2BFGJbMIyWuUqNfIHo5YrFa5f1Uc3VP
 669Vn4RjZOUsgEnA8U8O7kmwpQSC184amifZn8H9zOR1WoQfpRJ2NwMdzImdaF/usdDO
 v0vnGyuUAj1C/PujL6APII/67u3PDlHvtRV/cHjpU/w2SRgGtFYKmtBIk4w5KVWk0ilc
 0GCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314878; x=1684906878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSVOud/5oKlAnVwpslEtFRK+Oix2rv19Z5C3zjX6ptc=;
 b=B+43zmpFYfZXmyfil9kzH8u8xA2Izqr+u94Z7eSnK0SOO/s+n7/cCzdjou+YFaO6pf
 f0HFy7BUpoGAUmEjaLCsqZJof6KB7atpQ9OAjyHzFGytjeL/Qg5Zm4X2Uz7RKtG7QnJj
 UIPD2HWrpTWXTA/X10YizbPtMCMOhAH2mgX5SSx+9ouqF5XkqUxPES9/oN8UXIQ/QubG
 4sy3e8TKuLDyUlVdPJCyrQQHrnMWCrmV7Zhs2Dhii84nLA3auYOgpvad6lnoGn+D/JtE
 E/bGrbp0cvnzWq154NSiGhuNarIdrV+Mtn+th0Lco2Gb54s4EIWlvIYDDFErtpFbxIR4
 ZRlQ==
X-Gm-Message-State: AAQBX9fEYJasijgRgbuMCMLqcezFwFMeaEejUBwa8IpUd5cURBxBpq/7
 Sip3PSM4LLnBPrsd1bSBnnqFx+cLwRm70gaYPFyy/w==
X-Received: by 2002:a5d:690e:0:b0:2f8:f3da:72cf with SMTP id
 t14-20020a5d690e000000b002f8f3da72cfmr7720638wru.18.1682314878278; 
 Sun, 23 Apr 2023 22:41:18 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 21/57] tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
Date: Mon, 24 Apr 2023 06:40:29 +0100
Message-Id: <20230424054105.1579315-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dZuJAxCNuvsx

Interpret the variable argument placement in the caller.  There are
several places where we already convert back from bool to type.
Clean things up by using type throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 186 +++++++++++++++++++-------------------
 1 file changed, 95 insertions(+), 91 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a83ebe8729..ef8350e9cd 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1479,7 +1479,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, MemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, TCGType type)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
@@ -1503,7 +1503,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
         break;
     case MO_UL | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
                 tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
@@ -1528,7 +1528,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
     case MO_UL:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
             break;
         }
@@ -1583,7 +1583,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 }
 
 static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
-                                    TCGReg base, MemOp opc, bool is_64)
+                                    TCGReg base, MemOp opc, TCGType type)
 {
     const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
     const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
@@ -1623,7 +1623,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_UL:
         tcg_out_opc_imm(s, lw1, lo, base, 0);
         tcg_out_opc_imm(s, lw2, lo, base, 3);
-        if (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn) {
             tcg_out_ext32u(s, lo, lo);
         }
         break;
@@ -1634,18 +1634,18 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, lw1, lo, base, 0);
             tcg_out_opc_imm(s, lw2, lo, base, 3);
             tcg_out_bswap32(s, lo, lo,
-                            TCG_TARGET_REG_BITS == 64 && is_64
+                            TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64
                             ? (sgn ? TCG_BSWAP_OS : TCG_BSWAP_OZ) : 0);
         } else {
             const tcg_insn_unit *subr =
-                (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn
+                (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn
                  ? bswap32u_addr : bswap32_addr);
 
             tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0);
             tcg_out_bswap_subr(s, subr);
             /* delay slot */
             tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 3);
-            tcg_out_mov(s, is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, lo, TCG_TMP3);
+            tcg_out_mov(s, type, lo, TCG_TMP3);
         }
         break;
 
@@ -1702,68 +1702,59 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
-#else
-#endif
-    unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
-
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    TCGReg base;
 
     /*
      * R6 removes the left/right instructions but requires the
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
+    tcg_insn_unit *label_ptr[2];
+
+    base = TCG_REG_A0;
+    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 1);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
-        tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
     }
-    add_qemu_ldst_label(s, 1, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
+    base = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
     }
-    if (guest_base == 0 && data_regl != addr_regl) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
         if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
         } else {
-            tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
         }
     }
 #endif
@@ -1902,67 +1893,60 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         g_assert_not_reached();
     }
 }
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
-{
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
-#endif
-    unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
 
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
+{
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    TCGReg base;
 
     /*
      * R6 removes the left/right instructions but requires the
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 0);
+    tcg_insn_unit *label_ptr[2];
+
+    base = TCG_REG_A0;
+    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 0);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
-        tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
     }
-    add_qemu_ldst_label(s, 0, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
+    base = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
     }
-    if (guest_base == 0) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
-        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
         if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+            tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
         } else {
-            tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+            tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
         }
     }
 #endif
@@ -2425,16 +2409,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_add2_i32:
-- 
2.34.1

