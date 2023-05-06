Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp885037ejq;
        Sat, 6 May 2023 00:27:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+FU+gywnZuSSkgPKOT1jvlrXP1uViZlEPoXh153xETl1Racij/aiLJywz8t5Xgywue6Mm
X-Received: by 2002:ad4:5ceb:0:b0:5ee:f65c:286a with SMTP id iv11-20020ad45ceb000000b005eef65c286amr5472650qvb.50.1683358050929;
        Sat, 06 May 2023 00:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683358050; cv=none;
        d=google.com; s=arc-20160816;
        b=URhiN7qDNGO0P+n9MqCL8wabZQxZ+btzLkoxFGh3S4thFi9vjLiV6ULUEYLfjLzPxW
         U/i45eRASB/R5YIZjKw6IzYfdCQ2TrGT1F9cQ/62T+8BvgIvZdP5BYynPZetPkbJPdaI
         keXg6J9oAXxJlbfG53aMYVjscx7AJDYHMbeQVl5LiRiunUu/NAobc4kw4j/TpPpLm0PT
         3Ded+r5HtNswZc/7af1vfUISKTnwLAzjaMuqzVS9W8yLkU9xC7scgjTeoWocMCd9d6eL
         95Z6Slv7SnLON8HS1vP/ggXhZXre+ypVkzTXj3ZCWXUvSeUMFsJb1qIkfSy48eC6iS4l
         eMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/+D3flHoA+lO9qFOAJD5/z5k4A1tFbbT3jeq7/jtxrQ=;
        b=edPD99no0AoXhsCX1Z8UjQq0P8t7EEneJ6XVWUtmqiXJon2As6oSOfmlVzuv5R41G9
         4A8fqU31tE+r9kcEHT5Teae9ETUlNaZscWaVRHKbmOFGGfYhMguoyDBBxPm4PlaxmLyc
         qCFiWnJx4Jzrh4NZhYX78iNJv1riMNMUL5ADy5FXKN8zdVkVg4bRaDlltTAvvIibTMqe
         oPjrRU31s2eGmA+ummxnm19UA5EgZ7cFXOf8LKzZ+mAcNR0uAf0h4r7LDkD2wbDK3lJ8
         bCrYMYVy6O0PJ6l9RHVYgTmT58rVbLoudGCAr+VC6LXggHGmqgIGH8FbVW8fJUy+8+c2
         1ssw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yGvhL1E6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if4-20020a0562141c4400b00620e47ae4f3si1013590qvb.364.2023.05.06.00.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yGvhL1E6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCFt-0004CQ-8K; Sat, 06 May 2023 03:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFr-00049n-B6
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:22:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFh-0004O2-94
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:22:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307664010fdso2158345f8f.0
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357764; x=1685949764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+D3flHoA+lO9qFOAJD5/z5k4A1tFbbT3jeq7/jtxrQ=;
 b=yGvhL1E6195MFnoDw6ipjhBFWnd3Ms+fRiAJ3YP8ZgaZ1yMeysXAxqqRkymm1hZ0bq
 SC/RITQ9rQZ+4sEY6LAz0ijJMOudCs1JiEy05Spaf4g1MG1QJEZRg+r8lrXOI9YMfh3k
 klK9M9hD0e08Yj1ylkAmjnv/ITZEBgwbU3fHzIfl09XTLyF3oPTkEXiGfS2Jyj56UA1n
 vMwXs7Ggu2s/uOIioXT50YzeMsNIPYvqypvRK2dSOhJ6Tz6Hgq0V5Gf45Ya+fJljxHJ+
 V/jrvP4SLDc38d3lecHgQf2OnAidOhwWkQoqadtdPexxOq3SWX9tTcDvGPIB4JmglwkA
 Mytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357764; x=1685949764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+D3flHoA+lO9qFOAJD5/z5k4A1tFbbT3jeq7/jtxrQ=;
 b=gwWH9VklTo+sn92eQdbnUkwCMiAVBs/rV4t4TCO6jfvtj0jgKR0U4Ka399pr5HnyDn
 6gXkt4tkArNwfE4dgizasZ+43+/Q7VYSutEjCl294tz2hI/lwaeYnXRwi5q/C/ehNWRn
 Oj/Ygn2Ne07M2b+e98paj8NY/wWfcMSWD0pV7+Q0uXC8y/rErCu8BmxUWltegPKgM7/y
 ssJ60cNL07H6LB9jwhTqBEK1ksOylTeo6+a/GZBA1Ak0kDkT2mJCXJFyT34Te7iSz0vH
 AcTMDunxnYg6bZC037bUVHDwMwaZFyeJzeZ8SJUbkat9cJDHmufkqgDmAVKrJBt2JIfR
 QUxQ==
X-Gm-Message-State: AC+VfDxbDg7/9cmo4EWUNF4frxHy74Li42D/Tls7Gs84Ctbme9hI1T7g
 wDzZZoq8x92zmaoVshAHn1Iihb5kUWzXeGFsasHzKA==
X-Received: by 2002:a5d:6112:0:b0:306:2e62:7716 with SMTP id
 v18-20020a5d6112000000b003062e627716mr2507523wrt.56.1683357763837; 
 Sat, 06 May 2023 00:22:43 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 09/30] tcg/s390x: Introduce prepare_host_addr
Date: Sat,  6 May 2023 08:22:14 +0100
Message-Id: <20230506072235.597467-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: gzYW/BZuc2Yx

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
tcg_prepare_user_ldst, and some code that lived in both tcg_out_qemu_ld
and tcg_out_qemu_st into one function that returns HostAddress and
TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 263 ++++++++++++++++---------------------
 1 file changed, 113 insertions(+), 150 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index da7ee5b085..c3157d22be 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1718,78 +1718,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 #if defined(CONFIG_SOFTMMU)
-/* We're expecting to use a 20-bit negative offset on the tlb memory ops.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
-
-/* Load and compare a TLB entry, leaving the flags set.  Loads the TLB
-   addend into R2.  Returns a register with the santitized guest address.  */
-static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
-                               int mem_index, bool is_ld)
-{
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_mask = (1 << s_bits) - 1;
-    unsigned a_mask = (1 << a_bits) - 1;
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
-    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    int ofs, a_off;
-    uint64_t tlb_mask;
-
-    tcg_out_sh64(s, RSY_SRLG, TCG_REG_R2, addr_reg, TCG_REG_NONE,
-                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_insn(s, RXY, NG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, mask_off);
-    tcg_out_insn(s, RXY, AG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, table_off);
-
-    /* For aligned accesses, we check the first byte and include the alignment
-       bits within the address.  For unaligned access, we check that we don't
-       cross pages using the address of the last byte of the access.  */
-    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
-    tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
-    if (a_off == 0) {
-        tgen_andi_risbg(s, TCG_REG_R3, addr_reg, tlb_mask);
-    } else {
-        tcg_out_insn(s, RX, LA, TCG_REG_R3, addr_reg, TCG_REG_NONE, a_off);
-        tgen_andi(s, TCG_TYPE_TL, TCG_REG_R3, tlb_mask);
-    }
-
-    if (is_ld) {
-        ofs = offsetof(CPUTLBEntry, addr_read);
-    } else {
-        ofs = offsetof(CPUTLBEntry, addr_write);
-    }
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_insn(s, RX, C, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
-    } else {
-        tcg_out_insn(s, RXY, CG, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
-    }
-
-    tcg_out_insn(s, RXY, LG, TCG_REG_R2, TCG_REG_R2, TCG_REG_NONE,
-                 offsetof(CPUTLBEntry, addend));
-
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        return TCG_REG_R3;
-    }
-    return addr_reg;
-}
-
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGType type, TCGReg data, TCGReg addr,
-                                tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = type;
-    label->datalo_reg = data;
-    label->addrlo_reg = addr;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr;
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGReg addr_reg = lb->addrlo_reg;
@@ -1842,26 +1770,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 #else
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld,
-                                   TCGReg addrlo, unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *l = new_ldst_label(s);
-
-    l->is_ld = is_ld;
-    l->addrlo_reg = addrlo;
-
-    /* We are expecting a_bits to max out at 7, much lower than TMLL. */
-    tcg_debug_assert(a_bits < 16);
-    tcg_out_insn(s, RI, TMLL, addrlo, a_mask);
-
-    tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
-    l->label_ptr[0] = s->code_ptr;
-    s->code_ptr += 1;
-
-    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
@@ -1888,91 +1796,146 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     return tcg_out_fail_alignment(s, l);
 }
+#endif /* CONFIG_SOFTMMU */
 
-static HostAddress tcg_prepare_user_ldst(TCGContext *s, TCGReg addr_reg)
+/*
+ * For softmmu, perform the TLB load and compare.
+ * For useronly, perform any required alignment tests.
+ * In both cases, return a TCGLabelQemuLdst structure if the slow path
+ * is required and fill in @h with the host address for the fast path.
+ */
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
+                                           TCGReg addr_reg, MemOpIdx oi,
+                                           bool is_ld)
 {
-    TCGReg index;
-    int disp;
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned a_mask = (1u << a_bits) - 1;
 
+#ifdef CONFIG_SOFTMMU
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned s_mask = (1 << s_bits) - 1;
+    int mem_index = get_mmuidx(oi);
+    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
+    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
+    int ofs, a_off;
+    uint64_t tlb_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+
+    tcg_out_sh64(s, RSY_SRLG, TCG_REG_R2, addr_reg, TCG_REG_NONE,
+                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
+    tcg_out_insn(s, RXY, NG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, mask_off);
+    tcg_out_insn(s, RXY, AG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, table_off);
+
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
+    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
+    tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
+    if (a_off == 0) {
+        tgen_andi_risbg(s, TCG_REG_R3, addr_reg, tlb_mask);
+    } else {
+        tcg_out_insn(s, RX, LA, TCG_REG_R3, addr_reg, TCG_REG_NONE, a_off);
+        tgen_andi(s, TCG_TYPE_TL, TCG_REG_R3, tlb_mask);
+    }
+
+    if (is_ld) {
+        ofs = offsetof(CPUTLBEntry, addr_read);
+    } else {
+        ofs = offsetof(CPUTLBEntry, addr_write);
+    }
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_insn(s, RX, C, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
+    } else {
+        tcg_out_insn(s, RXY, CG, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
+    }
+
+    tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
+    ldst->label_ptr[0] = s->code_ptr++;
+
+    h->index = TCG_REG_R2;
+    tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
+                 offsetof(CPUTLBEntry, addend));
+
+    h->base = addr_reg;
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
+        h->base = TCG_REG_R3;
+    }
+    h->disp = 0;
+#else
+    if (a_mask) {
+        ldst = new_ldst_label(s);
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+
+        /* We are expecting a_bits to max out at 7, much lower than TMLL. */
+        tcg_debug_assert(a_bits < 16);
+        tcg_out_insn(s, RI, TMLL, addr_reg, a_mask);
+
+        tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
+        ldst->label_ptr[0] = s->code_ptr++;
+    }
+
+    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
         tcg_out_ext32u(s, TCG_TMP0, addr_reg);
-        addr_reg = TCG_TMP0;
+        h->base = TCG_TMP0;
     }
     if (guest_base < 0x80000) {
-        index = TCG_REG_NONE;
-        disp = guest_base;
+        h->index = TCG_REG_NONE;
+        h->disp = guest_base;
     } else {
-        index = TCG_GUEST_BASE_REG;
-        disp = 0;
+        h->index = TCG_GUEST_BASE_REG;
+        h->disp = 0;
     }
-    return (HostAddress){ .base = addr_reg, .index = index, .disp = disp };
+#endif
+
+    return ldst;
 }
-#endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
-    tcg_insn_unit *label_ptr;
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, true);
+    tcg_out_qemu_ld_direct(s, get_memop(oi), data_reg, h);
 
-    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
-    h.index = TCG_REG_R2;
-    h.disp = 0;
-
-    tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
-    label_ptr = s->code_ptr;
-    s->code_ptr += 1;
-
-    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
-
-    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    h = tcg_prepare_user_ldst(s, addr_reg);
-    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
-#endif
 }
 
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
-    tcg_insn_unit *label_ptr;
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, false);
+    tcg_out_qemu_st_direct(s, get_memop(oi), data_reg, h);
 
-    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
-    h.index = TCG_REG_R2;
-    h.disp = 0;
-
-    tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
-    label_ptr = s->code_ptr;
-    s->code_ptr += 1;
-
-    tcg_out_qemu_st_direct(s, opc, data_reg, h);
-
-    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    h = tcg_prepare_user_ldst(s, addr_reg);
-    tcg_out_qemu_st_direct(s, opc, data_reg, h);
-#endif
 }
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
-- 
2.34.1

