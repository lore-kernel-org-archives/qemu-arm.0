Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600483ejm;
        Sun, 23 Apr 2023 22:53:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZsLh84zi9BVVd87RaNDW9tUdI/cm9+oESaLszuzaJN9evt+h3TBl4mM1kLUbMyQILCNciF
X-Received: by 2002:a05:6214:c88:b0:5ef:4bc2:c03d with SMTP id r8-20020a0562140c8800b005ef4bc2c03dmr21510200qvr.1.1682315597079;
        Sun, 23 Apr 2023 22:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315597; cv=none;
        d=google.com; s=arc-20160816;
        b=liBnVSd3wm4j4eCnBvsncdwf3r3k+hRDFuqk/q/31J/ja0xGKaAts6tyrJQMDyJOma
         TMJRQMJiG3Uvg/buDWb7oFZsooWZgEQ0obLtMxhhdk0hjCtoNfvdq4MYyUUBlUSeDrtK
         xWTphQcwZ4d8kR/kubslLfV+sRQ7RKQz+xiW/+LJAj152GdDpKSPANmzgj73ASzBvMQl
         aMt+ydusaj6Bk0xKlapR+oYYLkHIOR6P3Pa6pDym61yfMgwhT6z7OYWxwwUsMOntPTyG
         HB9WihMaaibwX3mwVbhEe4YVzcIs/IDH2fLtQr8AnatE3M0M8IAf46pcKCpIeRZEYic7
         plAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/+D3flHoA+lO9qFOAJD5/z5k4A1tFbbT3jeq7/jtxrQ=;
        b=W/KorsTXWk9oucJMzZAlktKKpPhEag/tTOJhJ/K7luvaqoZ+eVMgSDPzrA7X+oRurs
         b4Q7FvTdZk+Nr9LuAtjrM9jUv7pxjqLNDVRLlYlGA4XueS19Ru5VkLxUIQruNqEK1Ovs
         R5Wvi0+EMqbrNKVvKwKxRD+1ilAWPlEMS0bIYbLHeKD5EqY9LCadUrHo8cg73sSJRAZl
         FD9CyfrRrsallwcwRZrA8SnQIE2XSZVoZepgb/sTTMGW1rrYesOySuzEB0qAoiKv8K3C
         CJhnT2gDml1BeepXb6x5wn7jFEnN/UiFn05Mxy0b2n/8Y1rNNqdxPUYs6fCT2gzfYC/n
         qI3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pqT7yj5C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r27-20020ae9d61b000000b00745bbaa74afsi6511758qkk.298.2023.04.23.22.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pqT7yj5C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqozm-0003up-2i; Mon, 24 Apr 2023 01:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxt-00061I-E8
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox4-0004EF-Nl
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so63435585e9.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314884; x=1684906884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+D3flHoA+lO9qFOAJD5/z5k4A1tFbbT3jeq7/jtxrQ=;
 b=pqT7yj5CA1NrmUALzhtHqiNXuBpNUkdlbmsNqMwyMo08N31S8BN7H7GFQOysoiUkad
 deVQs87Q7TA/5fioVJs5SzjyCdair7tHQKb5GgEJ1E22nNN2Jzq+BG2Zyx9Cn3xdpPMA
 5ghjlr/5yxKOmtcqOQYNOxmLus9ie+s+yOnDuNsi5AW9ok1++SxgomjjLQu9WQKsfnqN
 VrXFE9U6FTpAXzKZXPSK4hvDxeqhHY22NlEWBzYurRZ5mYj7dsf9XvQkEJzVAHjlqdf8
 73xf7NKDrRw7SLPRf6cZvR3tbRkuJr1ZBqxrSw0R9NIfRQqUO9wdcql+FQ2p/h52lfop
 nwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314884; x=1684906884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+D3flHoA+lO9qFOAJD5/z5k4A1tFbbT3jeq7/jtxrQ=;
 b=HJFX+oVLPcEsm5j/1jY51JX6aNEcgV64i36j9UBMCY8wLiHhtULbZ3g0VFW0vE+u8J
 /ECUttm/hnDQ0LMZxyXHLQqo9s2srDjMkim03CmWpNlXiKhaPzRDxF148b4BRW7DBOMX
 ibEM2P1X8VEZcZ03L8AN52wmigjlYfRGDHrEHiCcXndTmSN/P5JkbPwyEcQ0m2e9ChKV
 5lCqwtX3Iyby4cMqEwclJ6yUNNoua/2A41thqxuFAYfxRVonHJx+W/tvHvaoovhYb8uy
 g5R3KNdy33jxSw4NUiYq1IhrcAFAB7Sz/kvw+fsbsOzjGSgytzAte3QBguWOiy+6gxbd
 KwSA==
X-Gm-Message-State: AAQBX9frVijMnj+1YrPfKVHRQgmydCVfCMe8Zmty8xhFPulDt6KntFZy
 IQIoI+3lyRHM5XNM9CrqpVpqPS+Cgw0eaa0YFbpGjg==
X-Received: by 2002:a5d:4c4e:0:b0:2f6:1a6d:a6c3 with SMTP id
 n14-20020a5d4c4e000000b002f61a6da6c3mr13188212wrt.21.1682314884229; 
 Sun, 23 Apr 2023 22:41:24 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 31/57] tcg/s390x: Introduce prepare_host_addr
Date: Mon, 24 Apr 2023 06:40:39 +0100
Message-Id: <20230424054105.1579315-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: qWKTYUBcJod6

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

