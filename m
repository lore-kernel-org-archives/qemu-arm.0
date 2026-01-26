Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BBDC88E58
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:31:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGtM-0005Rz-5C; Mon, 26 Jan 2026 02:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGg6-0003AA-Og
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:34 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGfu-0004af-9m
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:19 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-8220bd582ddso2076129b3a.2
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411169; x=1770015969; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gtxjc4P9KZdhf2nG4OzkL8PYW4imVdTh5iwwh9lw5D0=;
 b=dqnGP/xi24xnZppnAqii2Blp8i7N/d3ACwiG+lWohjgVz0b3YNxelPjKHk3x7rCeU4
 g3zvcX3NX5iL2fHu3l209aAgQOPZrzMeeu51hSgb5Er1R+1dBjtdcrGw0As2hTKgh7tk
 Jltstx88O2K8OAzguzulxer915Qfnv6Bq3B6G/bMUPzwOyifZ4q19FZr1WqIX5OtRK3I
 LZ7L8eHNsZ1i0YLNqzYfj9w+GCgwvPaz8uQnL7E+GPrOMmuA4P1E6WjL7HA9xYCF+jtm
 b0t9U51X19E77qsX/CfV+sOyrkQH9C649aYPDLeewxsk2AS4/f7qif+UX/yf5dD3YmSb
 xGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411169; x=1770015969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gtxjc4P9KZdhf2nG4OzkL8PYW4imVdTh5iwwh9lw5D0=;
 b=Ev1MLghbhsWzUR07hGURs+XxZ8lq5DsDPfEgQkpHEauymE4Lw8VY9jJd1sROmPU6CB
 uJ0TtREmpNai6lJ0J/8UX1Tcb7h94ZqRNAEbQuJ4DaDqkpnlO9/ftOCJNyy9QOOcpB+8
 Ns6NSi6ky6uUHFQJfTfNzlnC5MKvyoTRhpye6Dl5qQcRoxhpC6FyiZ6kFsx5mhXC9YQl
 na0xOO+1SG8om5Z4BB1VvkJYRFkvUzY14Z69IRIInGXp1jVR5m6Q0zy91s6+xrkgmtad
 PDcdBX78GnIQTfEp8lk/ma8ipHTvBfcq17w1OX2p7CvCFVbSotD2n1w8Ik83ZDWs5tNG
 ti3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNqBmQzI0RGOrceblR4sbd46ELP+r/b+YLMbaWEYodukmJqGFE5dXkk89k2U+V8ePHfPBF6vqsWg==@nongnu.org
X-Gm-Message-State: AOJu0YzDDSDY08R6wJQ3kciUXfbWffHem/d5ECm3dUacPgevPrOgzdzr
 WvjI+W138aeIHG2RglXF3mBIHV4UefGm1c8cnl4vkn6KLOg+RKPAmP/r
X-Gm-Gg: AZuq6aKgK8uwm6oKIjM4VgCo/KvMKlz2DyKFn4JI25ktwi/2PyIiCfCOj/eSrbZkRcJ
 +RdZ3CweUKBOfPOzP0QsbyJg2SrmxT15i7uRGq1XzoHDVKRzdrRdzL6cgxZ77PDJpFLM1fH9q7K
 sctvBiPOB6Ct0WovRiEoJ3o5GPtF+4hp9roN+3yYA4Nxn89ReV0txg9ODq6LZUTHoG4f9If4a2u
 2q2gBwaUtesOkPLYZodmPb6U/duEmy4etxQI7QcI83vu9iAwsPDfOOqLgZX9peGYGI6F1X0TObF
 5r2p5GjKABO18Z6wXONqjDQevAtNFZWRcA0fBoeQjxDjsDcLDGPW42Eytm34KsaldPg962LEI9T
 4Dz+ZBRVepvVYsuzx4gYPkMumQoenrKvoVvvGsQsMuvP8g3u7oDb+XOJFal6Y1HmoIVByiWUlx5
 UrNXXXep+jF3wuAY+7a/ADHBvXTdhdId4SvaP7FXIjCg==
X-Received: by 2002:a05:6a00:a87:b0:81c:5694:c543 with SMTP id
 d2e1a72fcca58-823412c45e4mr3639986b3a.64.1769411168726; 
 Sun, 25 Jan 2026 23:06:08 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:06:08 -0800 (PST)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 27/33] tcg/wasm64: Enable TLB lookup
Date: Mon, 26 Jan 2026 07:03:40 +0000
Message-ID: <2119981edccda75bf3a2276b0a86c2da12286030.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This commit enables Wasm module's qemu_ld and qemu_st to perform TLB
lookups, following the approach used in other backends such as
RISC-V. Unlike other backends, the Wasm backend cannot use ldst labels, as
jumping to specific code addresses (e.g. raddr) is not possible in
Wasm. Instead, each TLB lookup is followed by a if branch: if the lookup
succeeds, the memory is accessed directly; otherwise, a fallback helper
function is invoked. Support for MO_BSWAP is not yet implemented, so
has_memory_bswap is set to false.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64/tcg-target.c.inc | 225 +++++++++++++++++++++++++++++++++++-
 1 file changed, 222 insertions(+), 3 deletions(-)

diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index 8e62f6a237..7c414a8a36 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -3,8 +3,12 @@
  * Tiny Code Generator for QEMU
  *
  * Copyright (c) 2009, 2011 Stefan Weil
+ * Copyright (c) 2018 SiFive, Inc
+ * Copyright (c) 2008-2009 Arnaud Patard <arnaud.patard@rtp-net.org>
+ * Copyright (c) 2009 Aurelien Jarno <aurelien@aurel32.net>
+ * Copyright (c) 2008 Fabrice Bellard
  *
- * Based on tci/tcg-target.c.inc
+ * Based on tci/tcg-target.c.inc and riscv/tcg-target.c.inc
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -154,6 +158,11 @@ static const uint8_t tcg_target_reg_index[TCG_TARGET_NB_REGS] = {
 /* Local variable pointing to WasmContext */
 #define CTX_IDX 0
 
+/* Temporary local variables */
+#define TMP32_LOCAL_0_IDX 1
+#define TMP64_LOCAL_0_IDX 2
+#define TMP64_LOCAL_1_IDX 3
+
 /* Function index */
 #define CHECK_UNWINDING_IDX 0 /* A function to check the Asyncify status */
 #define HELPER_IDX_START 1 /* The first index of helper functions */
@@ -170,6 +179,8 @@ typedef enum {
     OPC_RETURN = 0x0f,
     OPC_CALL = 0x10,
     OPC_LOCAL_GET = 0x20,
+    OPC_LOCAL_SET = 0x21,
+    OPC_LOCAL_TEE = 0x22,
     OPC_GLOBAL_GET = 0x23,
     OPC_GLOBAL_SET = 0x24,
 
@@ -1217,11 +1228,156 @@ static void *qemu_ld_helper_ptr(uint32_t oi)
     }
 }
 
+#define MIN_TLB_MASK_TABLE_OFS INT_MIN
+
+static uint8_t prepare_host_addr_wasm(TCGContext *s, uint8_t *hit_var,
+                                      TCGReg addr_reg, MemOpIdx oi,
+                                      bool is_ld)
+{
+    MemOp opc = get_memop(oi);
+    TCGAtomAlign aa;
+    unsigned a_mask;
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned s_mask = (1u << s_bits) - 1;
+    int mem_index = get_mmuidx(oi);
+    int fast_ofs = tlb_mask_table_ofs(s, mem_index);
+    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
+    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
+    int add_off = offsetof(CPUTLBEntry, addend);
+    tcg_target_long compare_mask;
+    int offset;
+
+    uint8_t tmp1 = TMP64_LOCAL_0_IDX;
+    uint8_t tmp2 = TMP64_LOCAL_1_IDX;
+
+    if (!tcg_use_softmmu) {
+        g_assert_not_reached();
+    }
+
+    *hit_var = TMP32_LOCAL_0_IDX;
+    tcg_wasm_out_op_const(s, OPC_I32_CONST, 0);
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_SET, *hit_var);
+
+    aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1u << aa.align) - 1;
+
+    /* Get the CPUTLBEntry offset */
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(addr_reg));
+    tcg_wasm_out_op_const(s, OPC_I64_CONST,
+                          TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_wasm_out_op(s, OPC_I64_SHR_U);
+
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(TCG_AREG0));
+    offset = tcg_wasm_out_norm_ptr(s, mask_ofs);
+    tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, offset);
+    tcg_wasm_out_op(s, OPC_I64_AND);
+
+    /* Get the pointer to the target CPUTLBEntry */
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(TCG_AREG0));
+    offset = tcg_wasm_out_norm_ptr(s, table_ofs);
+    tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, offset);
+    tcg_wasm_out_op(s, OPC_I64_ADD);
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_TEE, tmp1);
+
+    /* Load the tlb copmarator */
+    offset = tcg_wasm_out_norm_ptr(s, is_ld ? offsetof(CPUTLBEntry, addr_read)
+                                   : offsetof(CPUTLBEntry, addr_write));
+    tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, offset);
+
+    /*
+     * For aligned accesses, we check the first byte and include the
+     * alignment bits within the address.  For unaligned access, we
+     * check that we don't cross pages using the address of the last
+     * byte of the access.
+     */
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(addr_reg));
+    if (a_mask < s_mask) {
+        tcg_wasm_out_op_const(s, OPC_I64_CONST, s_mask - a_mask);
+        tcg_wasm_out_op(s, OPC_I64_ADD);
+    }
+    compare_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, compare_mask);
+    tcg_wasm_out_op(s, OPC_I64_AND);
+
+    /* Compare masked address with the TLB entry. */
+    tcg_wasm_out_op(s, OPC_I64_EQ);
+
+    tcg_wasm_out_op_block(s, OPC_IF, BLOCK_NORET);
+
+    /* TLB Hit - translate address using addend.  */
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, tmp1);
+    offset = tcg_wasm_out_norm_ptr(s, add_off);
+    tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, offset);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(addr_reg));
+    tcg_wasm_out_op(s, OPC_I64_ADD);
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_SET, tmp2);
+    tcg_wasm_out_op_const(s, OPC_I32_CONST, 1);
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_SET, *hit_var);
+
+    tcg_wasm_out_op(s, OPC_END);
+
+    return tmp2;
+}
+
+static void tcg_wasm_out_qemu_ld_direct(
+    TCGContext *s, TCGReg r, uint8_t base, MemOp opc)
+{
+    intptr_t ofs;
+    switch (opc & (MO_SSIZE)) {
+    case MO_UB:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_ldst(s, OPC_I64_LOAD8_U, 0, ofs);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(r));
+        break;
+    case MO_SB:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_ldst(s, OPC_I64_LOAD8_S, 0, ofs);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(r));
+        break;
+    case MO_UW:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_ldst(s, OPC_I64_LOAD16_U, 0, ofs);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(r));
+        break;
+    case MO_SW:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_ldst(s, OPC_I64_LOAD16_S, 0, ofs);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(r));
+        break;
+    case MO_UL:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_ldst(s, OPC_I64_LOAD32_U, 0, ofs);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(r));
+        break;
+    case MO_SL:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_ldst(s, OPC_I64_LOAD32_S, 0, ofs);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(r));
+        break;
+    case MO_UQ:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, ofs);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(r));
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
                                  TCGReg addr_reg, MemOpIdx oi)
 {
     intptr_t helper_idx;
     int64_t func_idx;
+    MemOp mop = get_memop(oi);
+    uint8_t base_var, hit_var;
 
     helper_idx = (intptr_t)qemu_ld_helper_ptr(oi);
     func_idx = get_helper_idx(s, helper_idx);
@@ -1230,6 +1386,14 @@ static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
         gen_func_type_qemu_ld(s, oi);
     }
 
+    base_var = prepare_host_addr_wasm(s, &hit_var, addr_reg, oi, true);
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, hit_var);
+    tcg_wasm_out_op_const(s, OPC_I32_CONST, 1);
+    tcg_wasm_out_op(s, OPC_I32_EQ);
+    tcg_wasm_out_op_block(s, OPC_IF, BLOCK_NORET);
+    tcg_wasm_out_qemu_ld_direct(s, data_reg, base_var, mop); /* fast path */
+    tcg_wasm_out_op(s, OPC_END);
+
     /*
      * update the block index so that the possible rewinding will
      * skip this block
@@ -1238,6 +1402,10 @@ static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, BLOCK_IDX);
     tcg_wasm_out_new_block(s);
 
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, hit_var);
+    tcg_wasm_out_op(s, OPC_I32_EQZ);
+    tcg_wasm_out_op_block(s, OPC_IF, BLOCK_NORET);
+
     /* call the target helper */
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(TCG_AREG0));
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(addr_reg));
@@ -1247,6 +1415,8 @@ static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
     tcg_wasm_out_op_idx(s, OPC_CALL, func_idx);
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(data_reg));
     tcg_wasm_out_handle_unwinding(s);
+
+    tcg_wasm_out_op(s, OPC_END);
 }
 
 static void *qemu_st_helper_ptr(uint32_t oi)
@@ -1266,12 +1436,47 @@ static void *qemu_st_helper_ptr(uint32_t oi)
     }
 }
 
+static void tcg_wasm_out_qemu_st_direct(
+    TCGContext *s, TCGReg lo, uint8_t base, MemOp opc)
+{
+    intptr_t ofs;
+    switch (opc & (MO_SSIZE)) {
+    case MO_8:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(lo));
+        tcg_wasm_out_op_ldst(s, OPC_I64_STORE8, 0, ofs);
+        break;
+    case MO_16:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(lo));
+        tcg_wasm_out_op_ldst(s, OPC_I64_STORE16, 0, ofs);
+        break;
+    case MO_32:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(lo));
+        tcg_wasm_out_op_ldst(s, OPC_I64_STORE32, 0, ofs);
+        break;
+    case MO_64:
+        tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, base);
+        ofs = tcg_wasm_out_norm_ptr(s, 0);
+        tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(lo));
+        tcg_wasm_out_op_ldst(s, OPC_I64_STORE, 0, ofs);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
                                  TCGReg addr_reg, MemOpIdx oi)
 {
     intptr_t helper_idx;
     int64_t func_idx;
     MemOp mop = get_memop(oi);
+    uint8_t base_var, hit_var;
 
     helper_idx = (intptr_t)qemu_st_helper_ptr(oi);
     func_idx = get_helper_idx(s, helper_idx);
@@ -1280,6 +1485,14 @@ static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
         gen_func_type_qemu_st(s, oi);
     }
 
+    base_var = prepare_host_addr_wasm(s, &hit_var, addr_reg, oi, false);
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, hit_var);
+    tcg_wasm_out_op_const(s, OPC_I32_CONST, 1);
+    tcg_wasm_out_op(s, OPC_I32_EQ);
+    tcg_wasm_out_op_block(s, OPC_IF, BLOCK_NORET);
+    tcg_wasm_out_qemu_st_direct(s, data_reg, base_var, mop); /* fast path */
+    tcg_wasm_out_op(s, OPC_END);
+
     /*
      * update the block index so that the possible rewinding will
      * skip this block
@@ -1288,6 +1501,10 @@ static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, BLOCK_IDX);
     tcg_wasm_out_new_block(s);
 
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, hit_var);
+    tcg_wasm_out_op(s, OPC_I32_EQZ);
+    tcg_wasm_out_op_block(s, OPC_IF, BLOCK_NORET);
+
     /* call the target helper */
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(TCG_AREG0));
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(addr_reg));
@@ -1305,6 +1522,8 @@ static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
 
     tcg_wasm_out_op_idx(s, OPC_CALL, func_idx);
     tcg_wasm_out_handle_unwinding(s);
+
+    tcg_wasm_out_op(s, OPC_END);
 }
 
 static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
@@ -2162,7 +2381,7 @@ static const TCGOutOpQemuLdSt outop_qemu_st = {
 
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
-    return true;
+    return false;
 }
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
@@ -2394,7 +2613,7 @@ static const uint8_t mod_3[] = {
     0x80, 0x80, 0x80, 0x80, 0x00, /* placeholder for section size*/
     1,                            /* num of codes */
     0x80, 0x80, 0x80, 0x80, 0x00, /* placeholder for code size */
-    0x0,                          /* local variables (none) */
+    0x2, 0x1, 0x7f, 0x2, 0x7e,    /* local variables (32bit*1, 64bit*2) */
 };
 
 #define MOD_3_PH_EXPORT_START_FUNC_IDX 102
-- 
2.43.0


