Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2597483ejm;
        Sun, 23 Apr 2023 22:46:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350baSyHIsa26fW5pK3OK6oFyhgnJnCEPEOHGQj7KTO5Ic0jfihbuhNmWODOuyTDw+EZEs6Mo
X-Received: by 2002:a05:622a:170b:b0:3ef:2fbd:90ba with SMTP id h11-20020a05622a170b00b003ef2fbd90bamr21298090qtk.43.1682315177700;
        Sun, 23 Apr 2023 22:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315177; cv=none;
        d=google.com; s=arc-20160816;
        b=b8P+kQGOHMk7OubiuFZJMRie+FgslA6iBdB4eu74PUo1BX2yOrR6f76ZUSkKUY+8xH
         7LzN0frpTh17TLXnvla4lr7TzB0hpSBa383QMawZphfDvZTjqY6fDB/egHA3I0c3sbL5
         APrzK90qGiGYv4CvTLoBkT640wlDFqb6udEu16ppshKL8IBjiH8NPzQkUGP3HNL79S/l
         g8GpYpXcHwo0ASRM47IIA5orHhbLEZ1JF1Mtw80eOs4UVlRQddc2weux2Lz8SuY/FQZa
         /lntXujpz5UoAG8pUPyUKFtGuGYoBtzFbZvfaucEx9fGxXmlniSe7lWoljHvi09ly0AI
         jIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XFFoGgTSegPUQaI6pnaNFJ9C8ggJbjecIiSqmvyzOfY=;
        b=HkuVV++Eu5m4wagwnssPkpmcenx7UXhVO9rfsxxzUKZKcMFSbg2FNE6bJpjsM7MsEu
         iRV2b4pm1zHMWbetaKkZO6qIUHkpNNOGVtVJyPK45C4LCnwEL+aPlFvZA0V251pEdbSa
         rC9i8nXIt1lkH6pvsatmqwUI3y3YHFy5S6tLR0jaq7boqzncv7tozTTejaWGl+wqWvLl
         xiMNpgNhWBAofpH7lvQHqCdP1SCpNLHekRRmmci3dpXbtOi6zykoOoU1qWq6L81nlvjN
         BycTGqdgoSC9r5AIBTkiUXiptpXZPuz3jiFnVOJJLkzoZd8xRLEZ4wegA5GEyx9OkmoU
         nYZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XrvWg9ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d195-20020a3768cc000000b0074defcc2b9esi6523667qkc.56.2023.04.23.22.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XrvWg9ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqoyz-0008Uh-KX; Mon, 24 Apr 2023 01:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxc-0005fw-Jw
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowy-0004NG-Fx
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso16815825e9.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314879; x=1684906879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFFoGgTSegPUQaI6pnaNFJ9C8ggJbjecIiSqmvyzOfY=;
 b=XrvWg9cehFF2mDIrGMtf5PHCkW4X/uD5344AXr+VPZG8+DwLhOIuzlRwonvA5v2yv0
 hFeDHzpUhxrUDtLfUYCpWbSh6g+vF8IESkeNDDZf0dUDHfFmBTbA4g8cRiN6eOlDFRsS
 UJe8UA+qDwTxT+Jc0sYmK23jSGjadqrdTxDwPJo6OABRE1eA5grICSNqsdFbam3PXTkr
 lxxh+ZVYsTkGYWj3lIJtAuME2X2KEi9Hu04qHa48kDcrDveZxGTp8uYWsy9FJCr6Bw/x
 DIHwmUHhFgTkyPhC9Y01bhrQmreS+C1qrm5UEIMPBBqINI4emKqjUgiyiL7ZL+1zAlV6
 OAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314879; x=1684906879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFFoGgTSegPUQaI6pnaNFJ9C8ggJbjecIiSqmvyzOfY=;
 b=HtvTvnbOC66NTAxo6JHmQf/yPukLo1ns7/J7ZZyDhiBfRul4sUYpLz0xE3v2linaHP
 FMzTZKz1NwwKJwii6NJqGQIVR8lDBSE80t6jM+eiKrctjkqPTvNfe62rp4I0Lgf17EWY
 /526vYNs0b6eqyRUefy/WSqLSBSeGzsMNillMeGjkZqoyyEjn7OU9FxsndwRDsV8neJS
 wczxV/BvJUU+yv0BIEzXqYR88/0J0pZIF0WdbSO2oKsTtu/VJZ/yFzMDYOwSXl9pndCj
 2GIiqnJc1ni570p+s+HuMDLA4lWPFUVSNsMhAIr9qHn+zNgbJZLxe8xgzxz3iXe7ahDN
 BgPw==
X-Gm-Message-State: AAQBX9fRAGUvXs4gweiWl/3GpABsfpTlzsCTCFwfuNDjOzwUdZUq5Z+6
 YDgC7VomoL8vpIlaKxL+xIc+Uw==
X-Received: by 2002:a1c:7912:0:b0:3f1:9525:7bb6 with SMTP id
 l18-20020a1c7912000000b003f195257bb6mr6172799wme.5.1682314878812; 
 Sun, 23 Apr 2023 22:41:18 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 22/57] tcg/mips: Introduce prepare_host_addr
Date: Mon, 24 Apr 2023 06:40:30 +0100
Message-Id: <20230424054105.1579315-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: JIvY8OxJhr1d

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
into one function that returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 404 ++++++++++++++++----------------------
 1 file changed, 172 insertions(+), 232 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index ef8350e9cd..94708e6ea7 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1181,120 +1181,6 @@ static int tcg_out_call_iarg_reg2(TCGContext *s, int i, TCGReg al, TCGReg ah)
     return i;
 }
 
-/* We expect to use a 16-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
-
-/*
- * Perform the tlb comparison operation.
- * The complete host address is placed in BASE.
- * Clobbers TMP0, TMP1, TMP2, TMP3.
- */
-static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
-                             TCGReg addrh, MemOpIdx oi,
-                             tcg_insn_unit *label_ptr[2], bool is_load)
-{
-    MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1 << a_bits) - 1;
-    unsigned s_mask = (1 << s_bits) - 1;
-    int mem_index = get_mmuidx(oi);
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
-    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    int add_off = offsetof(CPUTLBEntry, addend);
-    int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
-                   : offsetof(CPUTLBEntry, addr_write));
-    target_ulong tlb_mask;
-
-    /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP1, TCG_AREG0, table_off);
-
-    /* Extract the TLB index from the address into TMP3.  */
-    tcg_out_opc_sa(s, ALIAS_TSRL, TCG_TMP3, addrl,
-                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_opc_reg(s, OPC_AND, TCG_TMP3, TCG_TMP3, TCG_TMP0);
-
-    /* Add the tlb_table pointer, creating the CPUTLBEntry address in TMP3.  */
-    tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, TCG_TMP1);
-
-    /* Load the (low-half) tlb comparator.  */
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
-    } else {
-        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
-                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
-                     TCG_TMP0, TCG_TMP3, cmp_off);
-    }
-
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrl);
-        addrl = base;
-    }
-
-    /*
-     * Mask the page bits, keeping the alignment bits to compare against.
-     * For unaligned accesses, compare against the end of the access to
-     * verify that it does not cross a page boundary.
-     */
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
-    if (a_mask >= s_mask) {
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
-    } else {
-        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrl, s_mask - a_mask);
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
-    }
-
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
-    }
-
-    label_ptr[0] = s->code_ptr;
-    tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
-
-    /* Load and test the high half tlb comparator.  */
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        /* delay slot */
-        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
-
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
-
-        label_ptr[1] = s->code_ptr;
-        tcg_out_opc_br(s, OPC_BNE, addrh, TCG_TMP0);
-    }
-
-    /* delay slot */
-    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrl);
-}
-
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
-                                TCGType ext,
-                                TCGReg datalo, TCGReg datahi,
-                                TCGReg addrlo, TCGReg addrhi,
-                                void *raddr, tcg_insn_unit *label_ptr[2])
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = ext;
-    label->datalo_reg = datalo;
-    label->datahi_reg = datahi;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr[0];
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        label->label_ptr[1] = label_ptr[1];
-    }
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
@@ -1403,32 +1289,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 
 #else
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
-                                   TCGReg addrhi, unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *l = new_ldst_label(s);
-
-    l->is_ld = is_ld;
-    l->addrlo_reg = addrlo;
-    l->addrhi_reg = addrhi;
-
-    /* We are expecting a_bits to max out at 7, much lower than ANDI. */
-    tcg_debug_assert(a_bits < 16);
-    tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, addrlo, a_mask);
-
-    l->label_ptr[0] = s->code_ptr;
-    if (use_mips32r6_instructions) {
-        tcg_out_opc_br(s, OPC_BNEZALC_R6, TCG_REG_ZERO, TCG_TMP0);
-    } else {
-        tcg_out_opc_br(s, OPC_BNEL, TCG_TMP0, TCG_REG_ZERO);
-        tcg_out_nop(s);
-    }
-
-    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     void *target;
@@ -1478,6 +1338,154 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 #endif /* SOFTMMU */
 
+typedef struct {
+    TCGReg base;
+    MemOp align;
+} HostAddress;
+
+/*
+ * For softmmu, perform the TLB load and compare.
+ * For useronly, perform any required alignment tests.
+ * In both cases, return a TCGLabelQemuLdst structure if the slow path
+ * is required and fill in @h with the host address for the fast path.
+ */
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
+                                           TCGReg addrlo, TCGReg addrhi,
+                                           MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGReg base;
+
+#ifdef CONFIG_SOFTMMU
+    unsigned s_mask = (1 << s_bits) - 1;
+    int mem_index = get_mmuidx(oi);
+    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
+    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
+    int add_off = offsetof(CPUTLBEntry, addend);
+    int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
+                        : offsetof(CPUTLBEntry, addr_write);
+    target_ulong tlb_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addrlo;
+    ldst->addrhi_reg = addrhi;
+    base = TCG_REG_A0;
+
+    /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP1, TCG_AREG0, table_off);
+
+    /* Extract the TLB index from the address into TMP3.  */
+    tcg_out_opc_sa(s, ALIAS_TSRL, TCG_TMP3, addrlo,
+                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_out_opc_reg(s, OPC_AND, TCG_TMP3, TCG_TMP3, TCG_TMP0);
+
+    /* Add the tlb_table pointer, creating the CPUTLBEntry address in TMP3.  */
+    tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, TCG_TMP1);
+
+    /* Load the (low-half) tlb comparator.  */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
+    } else {
+        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
+                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
+                     TCG_TMP0, TCG_TMP3, cmp_off);
+    }
+
+    /* Zero extend a 32-bit guest address for a 64-bit host. */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, base, addrlo);
+        addrlo = base;
+    }
+
+    /*
+     * Mask the page bits, keeping the alignment bits to compare against.
+     * For unaligned accesses, compare against the end of the access to
+     * verify that it does not cross a page boundary.
+     */
+    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
+    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
+    if (a_mask >= s_mask) {
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
+    } else {
+        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrlo, s_mask - a_mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
+    }
+
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+    }
+
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
+
+    /* Load and test the high half tlb comparator.  */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        /* delay slot */
+        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
+
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+
+        ldst->label_ptr[1] = s->code_ptr;
+        tcg_out_opc_br(s, OPC_BNE, addrhi, TCG_TMP0);
+    }
+
+    /* delay slot */
+    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrlo);
+#else
+    if (a_mask && (use_mips32r6_instructions || a_bits != s_bits)) {
+        ldst = new_ldst_label(s);
+
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addrlo;
+        ldst->addrhi_reg = addrhi;
+
+        /* We are expecting a_bits to max out at 7, much lower than ANDI. */
+        tcg_debug_assert(a_bits < 16);
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, addrlo, a_mask);
+
+        ldst->label_ptr[0] = s->code_ptr;
+        if (use_mips32r6_instructions) {
+            tcg_out_opc_br(s, OPC_BNEZALC_R6, TCG_REG_ZERO, TCG_TMP0);
+        } else {
+            tcg_out_opc_br(s, OPC_BNEL, TCG_TMP0, TCG_REG_ZERO);
+            tcg_out_nop(s);
+        }
+    }
+
+    base = addrlo;
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
+    }
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
+    }
+#endif
+
+    h->base = base;
+    h->align = a_bits;
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc, TCGType type)
 {
@@ -1707,57 +1715,23 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    TCGReg base;
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
 
-    /*
-     * R6 removes the left/right instructions but requires the
-     * system to support misaligned memory accesses.
-     */
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, true);
 
-    base = TCG_REG_A0;
-    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 1);
-    if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
+    if (use_mips32r6_instructions || h.align >= (opc & MO_SIZE)) {
+        tcg_out_qemu_ld_direct(s, datalo, datahi, h.base, opc, data_type);
     } else {
-        tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
+        tcg_out_qemu_ld_unalign(s, datalo, datahi, h.base, opc, data_type);
     }
-    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    base = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_A0, base);
-        base = TCG_REG_A0;
+
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    if (guest_base) {
-        if (guest_base == (int16_t)guest_base) {
-            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
-        } else {
-            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
-                            TCG_GUEST_BASE_REG);
-        }
-        base = TCG_REG_A0;
-    }
-    if (use_mips32r6_instructions) {
-        if (a_bits) {
-            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-        }
-        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
-    } else {
-        if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-        }
-        if (a_bits >= s_bits) {
-            tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
-        } else {
-            tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
-        }
-    }
-#endif
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
@@ -1899,57 +1873,23 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    TCGReg base;
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
 
-    /*
-     * R6 removes the left/right instructions but requires the
-     * system to support misaligned memory accesses.
-     */
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, false);
 
-    base = TCG_REG_A0;
-    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 0);
-    if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
+    if (use_mips32r6_instructions || h.align >= (opc & MO_SIZE)) {
+        tcg_out_qemu_st_direct(s, datalo, datahi, h.base, opc);
     } else {
-        tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
+        tcg_out_qemu_st_unalign(s, datalo, datahi, h.base, opc);
     }
-    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    base = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_A0, base);
-        base = TCG_REG_A0;
+
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    if (guest_base) {
-        if (guest_base == (int16_t)guest_base) {
-            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
-        } else {
-            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
-                            TCG_GUEST_BASE_REG);
-        }
-        base = TCG_REG_A0;
-    }
-    if (use_mips32r6_instructions) {
-        if (a_bits) {
-            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-        }
-        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
-    } else {
-        if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-        }
-        if (a_bits >= s_bits) {
-            tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
-        } else {
-            tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
-        }
-    }
-#endif
 }
 
 static void tcg_out_mb(TCGContext *s, TCGArg a0)
-- 
2.34.1

