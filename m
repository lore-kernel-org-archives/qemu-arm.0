Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp883978ejq;
        Sat, 6 May 2023 00:24:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NhKIZ736J8Z4GvL/iTv13D+w9JnioxVeVgFXh0myi6FpmtUcTgsq6lBwGeUeVTNmBgyxz
X-Received: by 2002:a05:622a:15cd:b0:3e6:3929:e9bc with SMTP id d13-20020a05622a15cd00b003e63929e9bcmr6113141qty.6.1683357845040;
        Sat, 06 May 2023 00:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357845; cv=none;
        d=google.com; s=arc-20160816;
        b=i+FVg+eJB2qoiiFUPrpAR7Y650SV3ii608JOv3NzbjpkFSzWHA7ED4NYhy1h/FyuwK
         xNWedwh73n1JkNnk01v+LwnIo4ayIj6Lp0s95TDCBjstkBw04LwOwlmg6EQt1QQcfKZX
         JNkAU7g4v4XXTReg/PuSFNjz5/CVCfiBdpBXyZqcpqb4urHIA8oMmrZc0iqhwNimg17E
         cvg+xvZKvPmZtbzoDtwenq7c375TTzt30+tqaGXGJGk9v98WUUDmb3iM0/aaLe3omaNq
         hM/3ELRppfQhvjRcWlyGAdFO4J3nYPURhRsxH45sY0yW6BgswDYJB1d4YE1NW52JOhzD
         hn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SdzMRJhqVnkJZuasJRxOLnNhkaxRsl4XQRta0/ryyec=;
        b=WejANzY9PKERONsH5DYTVAuguRr0ys61l7cU9oumriYhefxz6PoAmKN9XWiAdSy6i9
         1Nhr2gKCe65UmqD7EhbEjfdYhK8bD0+LKRLrwHqvZFXrMeMB3usck5eIdS1E1LgBhzEQ
         pVZcNaEq+W/DSXI8GvkugmzKdqsXq3QQajSGziCy2ZvVp7LcpGh5yjFMlUKeEXrc7hoB
         PJDD7tWaf6j/8fC0nw2gV6OKHoMMrqryoTHvFiBaL/61q19IYGXIQER9aHV0aBdtj2ET
         lkk8sfTEZgUy4DjUtt1LoRGmA5gODpfcLk7/ohQNoy36tHiq+Z0xwWChr5XkW3oR0GtR
         5oqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ErxfAaw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os4-20020a05620a810400b0074e03491590si1243132qkn.710.2023.05.06.00.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ErxfAaw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCFl-00040E-A2; Sat, 06 May 2023 03:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFi-0003wm-Me
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:22:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFd-0004Lf-Oe
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:22:46 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315735514so119917735e9.1
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357760; x=1685949760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SdzMRJhqVnkJZuasJRxOLnNhkaxRsl4XQRta0/ryyec=;
 b=ErxfAaw7I4X+I4qJH0bPVZ8LS/xUZKchOihf9LOBrkKdgZEw6ain6WHXWpdJBNAADk
 vXnX5Bi/nIIYJ6sGfsPBT581tjrC8lXOiqqk2qUT34YyVq+b5p2Z9HYMPColU9Ylz4pG
 LlyWemmPIb8H+gIQzxJzxhp/E1YfY83VipeMbjeNxp2sa1quv/xc7E9DYMzamTSRum8c
 86pRmQboPkrJFAydtNLKLZC1xMHQmsbuyiEecxqE9gqE0HE5f3emOLlvT0mRTrHDDo7u
 Atqp4BR3chUEQ/45Vu2+YO3OREw0a8WjeLHjhAPvBOA9F1bGdgWZhrFfGo877FnpJpnn
 FE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357760; x=1685949760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SdzMRJhqVnkJZuasJRxOLnNhkaxRsl4XQRta0/ryyec=;
 b=PFsNmvOZsBksV8zhqykP+WpmIGMeiz2Rm3JhZdoCpCxmA2anedmdB511FevztFSbPh
 BAB3QatSvJ1IjNNhq+ddDi+6OvsKuefYhJVP4n/dT4bSP+iaMCuL34GQDAlQIeG0QuyZ
 Ag56szXDy2mokXV0SYuhLJwAT7JaPDDyX81aFoIdpLGt0qeN5JOXfGMeVxQvTiv4K9vP
 jKVbP4qTT4lQ1PNOaVR0rzgqiznu0Rkl8Xzhe0f/Trze16UKm70wwJsCKm72h+l9c1fE
 fSD/HSr7nF3W17FQT/Qk9o1FQSHLdqwAX4J05VONxyIaPyLmZIQVu480CuFqvFLcEXur
 Ncyw==
X-Gm-Message-State: AC+VfDxotUG+AdyaomN3p67Nf8wsW8wim4qlkFmFaFfQL6TAw7TiX4sY
 YIDLsn6x1I+6Ses6PVoXLS3t9w==
X-Received: by 2002:a5d:63cd:0:b0:306:31cb:25fb with SMTP id
 c13-20020a5d63cd000000b0030631cb25fbmr5765627wrw.17.1683357760251; 
 Sat, 06 May 2023 00:22:40 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 04/30] tcg/arm: Introduce prepare_host_addr
Date: Sat,  6 May 2023 08:22:09 +0100
Message-Id: <20230506072235.597467-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: ZIxbKnxqTB8a

Merge tcg_out_tlb_load, add_qemu_ldst_label, and some code that lived
in both tcg_out_qemu_ld and tcg_out_qemu_st into one function that
returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 351 ++++++++++++++++++---------------------
 1 file changed, 159 insertions(+), 192 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b6b4ffc546..c744512778 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1434,125 +1434,6 @@ static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
     }
 }
 
-#define TLB_SHIFT	(CPU_TLB_ENTRY_BITS + CPU_TLB_BITS)
-
-/* We expect to use an 9-bit sign-magnitude negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -256);
-
-/* These offsets are built into the LDRD below.  */
-QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
-QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 4);
-
-/* Load and compare a TLB entry, leaving the flags set.  Returns the register
-   containing the addend of the tlb entry.  Clobbers R0, R1, R2, TMP.  */
-
-static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
-                               MemOp opc, int mem_index, bool is_load)
-{
-    int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
-                   : offsetof(CPUTLBEntry, addr_write));
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    unsigned s_mask = (1 << (opc & MO_SIZE)) - 1;
-    unsigned a_mask = (1 << get_alignment_bits(opc)) - 1;
-    TCGReg t_addr;
-
-    /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
-    tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
-
-    /* Extract the tlb index from the address into R0.  */
-    tcg_out_dat_reg(s, COND_AL, ARITH_AND, TCG_REG_R0, TCG_REG_R0, addrlo,
-                    SHIFT_IMM_LSR(TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS));
-
-    /*
-     * Add the tlb_table pointer, creating the CPUTLBEntry address in R1.
-     * Load the tlb comparator into R2/R3 and the fast path addend into R1.
-     */
-    if (cmp_off == 0) {
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_ldrd_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
-        } else {
-            tcg_out_ld32_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
-        }
-    } else {
-        tcg_out_dat_reg(s, COND_AL, ARITH_ADD,
-                        TCG_REG_R1, TCG_REG_R1, TCG_REG_R0, 0);
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_ldrd_8(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
-        } else {
-            tcg_out_ld32_12(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
-        }
-    }
-
-    /* Load the tlb addend.  */
-    tcg_out_ld32_12(s, COND_AL, TCG_REG_R1, TCG_REG_R1,
-                    offsetof(CPUTLBEntry, addend));
-
-    /*
-     * Check alignment, check comparators.
-     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
-     * to reduce the number of sequential conditional instructions.
-     * Almost all guests have at least 4k pages, which means that we need
-     * to clear at least 9 bits even for an 8-byte memory, which means it
-     * isn't worth checking for an immediate operand for BIC.
-     *
-     * For unaligned accesses, test the page of the last unit of alignment.
-     * This leaves the least significant alignment bits unchanged, and of
-     * course must be zero.
-     */
-    t_addr = addrlo;
-    if (a_mask < s_mask) {
-        t_addr = TCG_REG_R0;
-        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
-                        addrlo, s_mask - a_mask);
-    }
-    if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
-        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(TARGET_PAGE_MASK | a_mask));
-        tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
-                        t_addr, TCG_REG_TMP, 0);
-        tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
-    } else {
-        if (a_mask) {
-            tcg_debug_assert(a_mask <= 0xff);
-            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
-        }
-        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t_addr,
-                        SHIFT_IMM_LSR(TARGET_PAGE_BITS));
-        tcg_out_dat_reg(s, (a_mask ? COND_EQ : COND_AL), ARITH_CMP,
-                        0, TCG_REG_R2, TCG_REG_TMP,
-                        SHIFT_IMM_LSL(TARGET_PAGE_BITS));
-    }
-
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_dat_reg(s, COND_EQ, ARITH_CMP, 0, TCG_REG_R3, addrhi, 0);
-    }
-
-    return TCG_REG_R1;
-}
-
-/* Record the context of a call to the out of line helper code for the slow
-   path for a load or store, so that we can later generate the correct
-   helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
-                                MemOpIdx oi, TCGType type,
-                                TCGReg datalo, TCGReg datahi,
-                                TCGReg addrlo, TCGReg addrhi,
-                                tcg_insn_unit *raddr,
-                                tcg_insn_unit *label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = type;
-    label->datalo_reg = datalo;
-    label->datahi_reg = datahi;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr;
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGReg argreg;
@@ -1636,29 +1517,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 #else
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
-                                   TCGReg addrhi, unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
-
-    /* We are expecting a_bits to max out at 7, and can easily support 8. */
-    tcg_debug_assert(a_mask <= 0xff);
-    /* tst addr, #mask */
-    tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
-
-    /* blne slow_path */
-    label->label_ptr[0] = s->code_ptr;
-    tcg_out_bl_imm(s, COND_NE, 0);
-
-    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc24(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -1703,6 +1561,134 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 #endif /* SOFTMMU */
 
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
+                                           TCGReg addrlo, TCGReg addrhi,
+                                           MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    MemOp a_bits = get_alignment_bits(opc);
+    unsigned a_mask = (1 << a_bits) - 1;
+
+#ifdef CONFIG_SOFTMMU
+    int mem_index = get_mmuidx(oi);
+    int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
+                        : offsetof(CPUTLBEntry, addr_write);
+    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    unsigned s_mask = (1 << (opc & MO_SIZE)) - 1;
+    TCGReg t_addr;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addrlo;
+    ldst->addrhi_reg = addrhi;
+
+    /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -256);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 4);
+    tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
+
+    /* Extract the tlb index from the address into R0.  */
+    tcg_out_dat_reg(s, COND_AL, ARITH_AND, TCG_REG_R0, TCG_REG_R0, addrlo,
+                    SHIFT_IMM_LSR(TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS));
+
+    /*
+     * Add the tlb_table pointer, creating the CPUTLBEntry address in R1.
+     * Load the tlb comparator into R2/R3 and the fast path addend into R1.
+     */
+    if (cmp_off == 0) {
+        if (TARGET_LONG_BITS == 64) {
+            tcg_out_ldrd_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
+        } else {
+            tcg_out_ld32_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
+        }
+    } else {
+        tcg_out_dat_reg(s, COND_AL, ARITH_ADD,
+                        TCG_REG_R1, TCG_REG_R1, TCG_REG_R0, 0);
+        if (TARGET_LONG_BITS == 64) {
+            tcg_out_ldrd_8(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
+        } else {
+            tcg_out_ld32_12(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
+        }
+    }
+
+    /* Load the tlb addend.  */
+    tcg_out_ld32_12(s, COND_AL, TCG_REG_R1, TCG_REG_R1,
+                    offsetof(CPUTLBEntry, addend));
+
+    /*
+     * Check alignment, check comparators.
+     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
+     * to reduce the number of sequential conditional instructions.
+     * Almost all guests have at least 4k pages, which means that we need
+     * to clear at least 9 bits even for an 8-byte memory, which means it
+     * isn't worth checking for an immediate operand for BIC.
+     *
+     * For unaligned accesses, test the page of the last unit of alignment.
+     * This leaves the least significant alignment bits unchanged, and of
+     * course must be zero.
+     */
+    t_addr = addrlo;
+    if (a_mask < s_mask) {
+        t_addr = TCG_REG_R0;
+        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
+                        addrlo, s_mask - a_mask);
+    }
+    if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(TARGET_PAGE_MASK | a_mask));
+        tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
+                        t_addr, TCG_REG_TMP, 0);
+        tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
+    } else {
+        if (a_mask) {
+            tcg_debug_assert(a_mask <= 0xff);
+            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
+        }
+        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t_addr,
+                        SHIFT_IMM_LSR(TARGET_PAGE_BITS));
+        tcg_out_dat_reg(s, (a_mask ? COND_EQ : COND_AL), ARITH_CMP,
+                        0, TCG_REG_R2, TCG_REG_TMP,
+                        SHIFT_IMM_LSL(TARGET_PAGE_BITS));
+    }
+
+    if (TARGET_LONG_BITS == 64) {
+        tcg_out_dat_reg(s, COND_EQ, ARITH_CMP, 0, TCG_REG_R3, addrhi, 0);
+    }
+
+    *h = (HostAddress){
+        .cond = COND_AL,
+        .base = addrlo,
+        .index = TCG_REG_R1,
+        .index_scratch = true,
+    };
+#else
+    if (a_mask) {
+        ldst = new_ldst_label(s);
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addrlo;
+        ldst->addrhi_reg = addrhi;
+
+        /* We are expecting a_bits to max out at 7 */
+        tcg_debug_assert(a_mask <= 0xff);
+        /* tst addr, #mask */
+        tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
+    }
+
+    *h = (HostAddress){
+        .cond = COND_AL,
+        .base = addrlo,
+        .index = guest_base ? TCG_REG_GUEST_BASE : -1,
+        .index_scratch = false,
+    };
+#endif
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
                                    TCGReg datahi, HostAddress h)
 {
@@ -1799,37 +1785,28 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    h.cond = COND_AL;
-    h.base = addrlo;
-    h.index_scratch = true;
-    h.index = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, true);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
 
-    /*
-     * This a conditional BL only to load a pointer within this opcode into
-     * LR for the slow path.  We will not be using the value for a tail call.
-     */
-    tcg_insn_unit *label_ptr = s->code_ptr;
-    tcg_out_bl_imm(s, COND_NE, 0);
+        /*
+         * This a conditional BL only to load a pointer within this
+         * opcode into LR for the slow path.  We will not be using
+         * the value for a tail call.
+         */
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_bl_imm(s, COND_NE, 0);
 
-    tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
-
-    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+        tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    } else {
+        tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
     }
-
-    h.cond = COND_AL;
-    h.base = addrlo;
-    h.index = guest_base ? TCG_REG_GUEST_BASE : -1;
-    h.index_scratch = false;
-    tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
-#endif
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
@@ -1891,35 +1868,25 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    h.cond = COND_EQ;
-    h.base = addrlo;
-    h.index_scratch = true;
-    h.index = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
-    tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, false);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
 
-    /* The conditional call must come last, as we're going to return here.  */
-    tcg_insn_unit *label_ptr = s->code_ptr;
-    tcg_out_bl_imm(s, COND_NE, 0);
-
-    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-
-    h.cond = COND_AL;
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
         h.cond = COND_EQ;
-    }
+        tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
 
-    h.base = addrlo;
-    h.index = guest_base ? TCG_REG_GUEST_BASE : -1;
-    h.index_scratch = false;
-    tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
-#endif
+        /* The conditional call is last, as we're going to return here. */
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_bl_imm(s, COND_NE, 0);
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    } else {
+        tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
+    }
 }
 
 static void tcg_out_epilogue(TCGContext *s);
-- 
2.34.1

