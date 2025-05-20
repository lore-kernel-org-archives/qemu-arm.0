Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476462njc;
        Tue, 20 May 2025 05:55:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4b43:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30e7e770605mr26843309a91.13.1747745712029;
        Tue, 20 May 2025 05:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745712; cv=none;
        d=google.com; s=arc-20240605;
        b=i4FL+1a1pr0kqrFEQFuhEB3UyMpYpb6/beLTfk7K5GlW0J/NmGYVSpOKL0kKI64gWH
         frBI3fwgc8cUB6MO9c1ALCLdJtIgdDeqT7yrIqcrOc8ixpuomvSpvwZyIcRoB/h4fiPe
         n1kKPb7kGQE4evfd9n9vh2Gt4o22iNcZBlCIW4Is9REQGGY+YjpM6LxeVnxnrn1EupQF
         cw/JWXc5tBtE60GorzLhg9UqfeHEKe04mvrSLGj2ur8pvYxSDUvwDxtSewwRykOb5rxQ
         WT/6pcE3xQeJLLgvTw5+bhPGmpuT6RrzM9PETjXhEbf3e8WIzfGzhFO+Cj3dKxvQ7sH5
         +8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D01VAfUBGZHAoC2ddrbmO4/0n/qVM5JIZp6Wbld3EfA=;
        fh=Y7XATsftxmJRZAvGZr1BhsXcyTpth3P9wZcXh+b5oyU=;
        b=Zqy9hG0xP22io+wwTsC+6iJMA6UY9yu9pzU87vHxCdPRwf5PJbFoy2XFhaVX4j7ohZ
         lirfN7YIAbeO2OJ416s4t+9Q6cYTKUDbQd1F4ln9bZ9q9UcwqqGpdC1WFJzAcc2Uzv5C
         J2uaaQ0qmRDfz9/KhuAVZFBlBVKY7jpUe56HoQ63mykIoGyUeuO4LtjpfSuFfb0fSa+T
         9fq2id90i4bnYgKr+F2zANLZMW4kME4mN/1peBN941GGvL38BPt8OAq3HQA5MBXWPOU1
         rSWjvfKGyjXXJ2bHe5ad3qS27eMrHaYAxmR8lzUjx+aoQ6+Ct8yHLBqefqZu8rLsaqFq
         rUBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=T1tzyYHa;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e331a200bsor9408945a91.0.2025.05.20.05.55.11
        (Google Transport Security);
        Tue, 20 May 2025 05:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=T1tzyYHa;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745711; x=1748350511; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D01VAfUBGZHAoC2ddrbmO4/0n/qVM5JIZp6Wbld3EfA=;
        b=T1tzyYHaNATFk/W4yQneAiGaacUPCeChU9mlpT4JB0D3bUg+7ixFJ/Fz+f4EZIqckq
         wJtyC59IH6HXryZmA8FvQBwIQr50KYZ7nTUzDliwJpLMu235953ZrWWKw1uXnb4POZTB
         mEfP2jbwRDHeVIUPUEanS1S2l3HXWR73SJQH+Z1Zs1ELZtdquQf+H23yAPK/Z+od5wtx
         FxfIf9FVBh8JuR35YKKaVBE5ejc4RRPr9i+r2RVyJpSpcML3/vXKNVtDwve7GU/2j3NH
         4bzf+476OF2Kz3MmhYWnnnmkyzPwFx+SKLFei65J67E9Jy16g/Enh9+co9fOcTRoUNVF
         049g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745711; x=1748350511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D01VAfUBGZHAoC2ddrbmO4/0n/qVM5JIZp6Wbld3EfA=;
        b=hIRztiRjDiaNp0bYkX5RiZdBNMp82ixJVn6zzBei3R+mUkv79tZIxtw8XWM7ZGO5V4
         n2X0LS3DNUnA0a0j3jPMM13EFkRhuUu6Zm/GV8pW0rQEPrlCCvVXITeDmZTb82dQ/V/3
         APA72r/ShxkdD0BCBe6TCHvDTlaxw+VHE5r86iYQN2myZ6GVvd/2YuD3Oq2EsA/Gfq1N
         ptmKm2WUQKP5g8BTFpRnzVxy7egOtoLA4jM/vPRxVXOH9IhLoCnVc7Su/9N5zkmXpDPY
         notVNZATF11bZHcakwB8aBSTS5boB5URxlBlnygPcnfaS5/Joxrmc0E+NKEqO5wb7IIR
         UUWg==
X-Forwarded-Encrypted: i=1; AJvYcCUAzEJrWk41GQHSL6SRug8diXSsmXpC7WMrvx9w1H8vazsmlDa5w842HXYDdT9DjMDwSt1q4ni96L6MGCxjfIdiQA==@linaro.org, AJvYcCWO3N3e2TH4pY3Jpr5OaCtHKc07qcOMymn8VaY+nURI6VEcUaAH8TFi0PuwiBKEtgNqUffjZCtTwwwnIot5Wgm9lsg=@linaro.org, AJvYcCWseijPgr2BfLlYHnvDN3wYXe8YncmU9vUN0WTdt6IbWeFPMumyxMRudl0yPkFDpCye0MU4TJk=@linaro.org
X-Gm-Message-State: AOJu0YyKXkN9bNb9yapmHdq9tQYa552xYXMv+TxoXSAIq7jgIQaTK1aH
	p/uqwS7tJsZ5NUBuBUPeojZuJm5HaIwTX02DS1we8Ou4x8YkEDvt8y/M
X-Gm-Gg: ASbGncsIS78tp3wLEByGCPWaaxJhHwLHIoZ54FzeimL+vQ1u9v4/ZgfGVxDUlPz0aRl
	hufAO9WngdkbpFBhabKGMOJvi2ik7Rhn8XyqxdqhXrHzKja2eiSklnk5eiG/e8Bmc4CYUdsDxR2
	MgDlMvoUjLYOu6vjeEBmlMmGiRtQV/6/MnVUkY6NHAtU7H6NSejECHGYftKTfG7g/D4zGx/zRUs
	UGl+RZVkPhIE8myzo4hEZ/AmuzBTN7RC/26Yqc5Uotc+BWfPR9FqwWNo5fbhCdNQBPxh/HcgHSg
	u6Ot36HkjvjnSmpodN9cjiHE0iMFfjWdzKAfLx3xixYtV864G/8=
X-Google-Smtp-Source: AGHT+IGOMOt/FkM/rdBI6wkt/aJrDNn9TYfU+or40zKKV8LX/mutFAggKceozq56SFUpc/Yq4TPZPg==
X-Received: by 2002:a17:90b:3d86:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-30e7dc1e956mr27665623a91.2.1747745711292;
        Tue, 20 May 2025 05:55:11 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:55:10 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 31/33] tcg/wasm32: Enable TLB lookup
Date: Tue, 20 May 2025 21:51:33 +0900
Message-ID: <746962847ecb7947fa9315342d9ea953ad849607.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8zXl3p7ir8oy

This commit enables qemu_ld and qemu_st to perform TLB lookups, following
the approach used in other backends such as RISC-V. Unlike other backends,
the Wasm backend cannot use ldst labels, as jumping to specific code
addresses (e.g. raddr) is not possible in Wasm. Instead, each TLB lookup is
followed by a if branch: if the lookup succeeds, the memory is accessed
directly; otherwise, a fallback helper function is invoked. Support for
MO_BSWAP is not yet implemented, so has_memory_bswap is set to false.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 223 +++++++++++++++++++++++++++++++++++-
 1 file changed, 221 insertions(+), 2 deletions(-)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index f0c51a5d3d..a2815db6b5 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
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
@@ -364,6 +368,10 @@ static void tcg_wasm_out_op_i64_eqz(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x50);
 }
+static void tcg_wasm_out_op_i64_eq(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x51);
+}
 static void tcg_wasm_out_op_br(TCGContext *s, int i)
 {
     tcg_wasm_out8(s, 0x0c);
@@ -436,6 +444,10 @@ static void tcg_wasm_out_op_local_set(TCGContext *s, uint8_t i)
 {
     tcg_wasm_out_op_var(s, 0x21, i);
 }
+static void tcg_wasm_out_op_local_tee(TCGContext *s, uint8_t i)
+{
+    tcg_wasm_out_op_var(s, 0x22, i);
+}
 
 #define tcg_wasm_out_i64_calc(op)                                       \
     static void tcg_wasm_out_i64_calc_##op(                             \
@@ -1993,12 +2005,161 @@ static void *qemu_ld_helper_ptr(uint32_t oi)
     }
 }
 
+static void tcg_wasm_out_i32_load_s(TCGContext *s, int off)
+{
+    if (off < 0) {
+        tcg_wasm_out_op_i32_const(s, off);
+        tcg_wasm_out_op_i32_add(s);
+        off = 0;
+    }
+    tcg_wasm_out_op_i32_load(s, 0, off);
+}
+
+static void tcg_wasm_out_i64_load_s(TCGContext *s, int off)
+{
+    if (off < 0) {
+        tcg_wasm_out_op_i32_const(s, off);
+        tcg_wasm_out_op_i32_add(s);
+        off = 0;
+    }
+    tcg_wasm_out_op_i64_load(s, 0, off);
+}
+
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
+
+    if (!tcg_use_softmmu) {
+        g_assert_not_reached();
+    }
+
+    *hit_var = TMP64_LOCAL_0_IDX;
+    tcg_wasm_out_op_i64_const(s, 0);
+    tcg_wasm_out_op_local_set(s, *hit_var);
+
+    aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1u << aa.align) - 1;
+
+    /* Get the CPUTLBEntry offset */
+    tcg_wasm_out_op_global_get_r(s, addr_reg);
+    tcg_wasm_out_op_i64_const(s, s->page_bits - CPU_TLB_ENTRY_BITS);
+    tcg_wasm_out_op_i64_shr_u(s);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_global_get_r_i32(s, TCG_AREG0);
+    tcg_wasm_out_i32_load_s(s, mask_ofs);
+    tcg_wasm_out_op_i32_and(s);
+
+    /* Get the pointer to the target CPUTLBEntry */
+    tcg_wasm_out_op_global_get_r_i32(s, TCG_AREG0);
+    tcg_wasm_out_i32_load_s(s, table_ofs);
+    tcg_wasm_out_op_i32_add(s);
+    tcg_wasm_out_op_local_tee(s, TMP32_LOCAL_0_IDX);
+
+    /* Load the tlb copmarator */
+    tcg_wasm_out_i64_load_s(
+        s, is_ld ? offsetof(CPUTLBEntry, addr_read)
+        : offsetof(CPUTLBEntry, addr_write));
+
+    /*
+     * For aligned accesses, we check the first byte and include the
+     * alignment bits within the address.  For unaligned access, we
+     * check that we don't cross pages using the address of the last
+     * byte of the access.
+     */
+    tcg_wasm_out_op_global_get_r(s, addr_reg);
+    if (a_mask < s_mask) {
+        tcg_wasm_out_op_i64_const(s, s_mask - a_mask);
+        tcg_wasm_out_op_i64_add(s);
+    }
+    compare_mask = (uint64_t)s->page_mask | a_mask;
+    tcg_wasm_out_op_i64_const(s, compare_mask);
+    tcg_wasm_out_op_i64_and(s);
+
+    /* Compare masked address with the TLB entry. */
+    tcg_wasm_out_op_i64_eq(s);
+    tcg_wasm_out_op_if_noret(s);
+
+    /* TLB Hit - translate address using addend.  */
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_i32_load_s(s, add_off);
+    tcg_wasm_out_op_global_get_r(s, addr_reg);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_i32_add(s);
+    tcg_wasm_out_op_local_set(s, TMP32_LOCAL_1_IDX);
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_local_set(s, *hit_var);
+
+    tcg_wasm_out_op_end(s);
+
+    return TMP32_LOCAL_1_IDX;
+}
+
+static void tcg_wasm_out_qemu_ld_direct(
+    TCGContext *s, TCGReg r, uint8_t base, MemOp opc)
+{
+    switch (opc & (MO_SSIZE)) {
+    case MO_UB:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_i64_load8_u(s, 0, 0);
+        tcg_wasm_out_op_global_set_r(s, r);
+        break;
+    case MO_SB:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_i64_load8_s(s, 0, 0);
+        tcg_wasm_out_op_global_set_r(s, r);
+        break;
+    case MO_UW:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_i64_load16_u(s, 0, 0);
+        tcg_wasm_out_op_global_set_r(s, r);
+        break;
+    case MO_SW:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_i64_load16_s(s, 0, 0);
+        tcg_wasm_out_op_global_set_r(s, r);
+        break;
+    case MO_UL:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_i64_load32_u(s, 0, 0);
+        tcg_wasm_out_op_global_set_r(s, r);
+        break;
+    case MO_SL:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_i64_load32_s(s, 0, 0);
+        tcg_wasm_out_op_global_set_r(s, r);
+        break;
+    case MO_UQ:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_i64_load(s, 0, 0);
+        tcg_wasm_out_op_global_set_r(s, r);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
                                  TCGReg addr_reg, MemOpIdx oi)
 {
     int helper_idx;
     int func_idx;
     bool addr64 = s->addr_type == TCG_TYPE_I64;
+    MemOp mop = get_memop(oi);
+    uint8_t base_var, hit_var;
 
     helper_idx = (uint32_t)qemu_ld_helper_ptr(oi);
     func_idx = get_helper_idx(s, helper_idx);
@@ -2012,6 +2173,14 @@ static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
         addr_reg = TCG_REG_TMP;
     }
 
+    base_var = prepare_host_addr_wasm(s, &hit_var, addr_reg, oi, true);
+    tcg_wasm_out_op_local_get(s, hit_var);
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_i64_eq(s);
+    tcg_wasm_out_op_if_noret(s);
+    tcg_wasm_out_qemu_ld_direct(s, data_reg, base_var, mop); /* fast path */
+    tcg_wasm_out_op_end(s);
+
     /*
      * update the block index so that the possible rewinding will
      * skip this block
@@ -2020,6 +2189,10 @@ static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
     tcg_wasm_out_op_global_set(s, BLOCK_PTR_IDX);
     tcg_wasm_out_new_block(s);
 
+    tcg_wasm_out_op_local_get(s, hit_var);
+    tcg_wasm_out_op_i64_eqz(s);
+    tcg_wasm_out_op_if_noret(s);
+
     /* call helper */
     tcg_wasm_out_op_global_get_r(s, TCG_AREG0);
     tcg_wasm_out_op_i32_wrap_i64(s);
@@ -2030,6 +2203,8 @@ static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
     tcg_wasm_out_op_call(s, func_idx);
     tcg_wasm_out_op_global_set_r(s, data_reg);
     tcg_wasm_out_handle_unwinding(s);
+
+    tcg_wasm_out_op_end(s);
 }
 
 static void *qemu_st_helper_ptr(uint32_t oi)
@@ -2049,6 +2224,35 @@ static void *qemu_st_helper_ptr(uint32_t oi)
     }
 }
 
+static void tcg_wasm_out_qemu_st_direct(
+    TCGContext *s, TCGReg lo, uint8_t base, MemOp opc)
+{
+    switch (opc & (MO_SSIZE)) {
+    case MO_8:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_global_get_r(s, lo);
+        tcg_wasm_out_op_i64_store8(s, 0, 0);
+        break;
+    case MO_16:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_global_get_r(s, lo);
+        tcg_wasm_out_op_i64_store16(s, 0, 0);
+        break;
+    case MO_32:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_global_get_r(s, lo);
+        tcg_wasm_out_op_i64_store32(s, 0, 0);
+        break;
+    case MO_64:
+        tcg_wasm_out_op_local_get(s, base);
+        tcg_wasm_out_op_global_get_r(s, lo);
+        tcg_wasm_out_op_i64_store(s, 0, 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
                                  TCGReg addr_reg, MemOpIdx oi)
 {
@@ -2056,6 +2260,7 @@ static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
     int func_idx;
     bool addr64 = s->addr_type == TCG_TYPE_I64;
     MemOp mop = get_memop(oi);
+    uint8_t base_var, hit_var;
 
     helper_idx = (uint32_t)qemu_st_helper_ptr(oi);
     func_idx = get_helper_idx(s, helper_idx);
@@ -2069,6 +2274,14 @@ static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
         addr_reg = TCG_REG_TMP;
     }
 
+    base_var = prepare_host_addr_wasm(s, &hit_var, addr_reg, oi, false);
+    tcg_wasm_out_op_local_get(s, hit_var);
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_i64_eq(s);
+    tcg_wasm_out_op_if_noret(s);
+    tcg_wasm_out_qemu_st_direct(s, data_reg, base_var, mop); /* fast path */
+    tcg_wasm_out_op_end(s);
+
     /*
      * update the block index so that the possible rewinding will
      * skip this block
@@ -2077,6 +2290,10 @@ static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
     tcg_wasm_out_op_global_set(s, BLOCK_PTR_IDX);
     tcg_wasm_out_new_block(s);
 
+    tcg_wasm_out_op_local_get(s, hit_var);
+    tcg_wasm_out_op_i64_eqz(s);
+    tcg_wasm_out_op_if_noret(s);
+
     /* call helper */
     tcg_wasm_out_op_global_get_r(s, TCG_AREG0);
     tcg_wasm_out_op_i32_wrap_i64(s);
@@ -2095,6 +2312,8 @@ static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
 
     tcg_wasm_out_op_call(s, func_idx);
     tcg_wasm_out_handle_unwinding(s);
+
+    tcg_wasm_out_op_end(s);
 }
 
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
@@ -3752,7 +3971,7 @@ static int tcg_out_tb_end(TCGContext *s)
 
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
-    return true;
+    return false;
 }
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-- 
2.43.0
