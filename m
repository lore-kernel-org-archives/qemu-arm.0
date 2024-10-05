Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047755njb;
        Sat, 5 Oct 2024 08:25:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIwwSRaOTaRBihEnXDnNouB52vsGLKGHF1PufcKloVAlus+o7s75GQGPWCYFCpjXyuo/tb0RT5QTHfkQ==@linaro.org
X-Received: by 2002:a17:902:d2d0:b0:20b:8924:3a89 with SMTP id d9443c01a7336-20bfdf6b4ccmr98998125ad.12.1728141957134;
        Sat, 05 Oct 2024 08:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141957; cv=none;
        d=google.com; s=arc-20240605;
        b=h8BhGOyOsuKT68aUUKzJZjWTXsTi0f3SITGsLKIXNBMUC59G0Z7Ygh4qOLj04heoF/
         +9ale/NmHQUV5Wofla32n/GcTFiTS/bZ0cdT+MBLh0KZnDnUroIhWM/ungVfDvBzHK1P
         QPjJT9Yp0nLuE14frBDmmAOxL4Pchw5eSgz2t4Kg1aP7XZOgGpLbds2z15h/XkYa4lw3
         GjhCkDI5DVCcqsSDOTYFU8mAR6YKXHgpUQXVA/u7cVvJDKAyXi76zzbIG4vyLznCq8Xa
         lDh+gwY7qISw1L1aOZ38r/PlGkCo94KfQJcJlsiZyY1rGLMtyuSqpJUbLCjE9GkmdAw5
         TNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DH35lHXcbsJC32qCjyMaGZFqdyczAIeo1misqQjkoMQ=;
        fh=xGQWpPPG+bhon5d+dBARStQkUEvInaw0XjFoN8DiUfo=;
        b=fpSCik+D4iptZw+9VQFKOje1JQw6QNJRJVc1lCLQz72IiCHlwszNWQtnRrdOumwIZf
         4gwF4P8YQVW4ocAuaGmDXQMGmJAK3y5Uie6zgGgTr5l0Nrpa7WFVBF+m26Wlhh76WKek
         jqEgzMt0VpPAcp6g5QgHolebOBZVzVDKc1rOVXQlDCcB1aqAXaTZm6LYSONdQsqdL/qK
         NsWKRS1Aqug1UrqHueETW7aQYXC/jsTHlC0Ng4adJAbCDx9dFLncQnfK4yYb13Cw8sIQ
         61OWu55JRfRw7Xou7Wa/TBC7m/AM8IRPYIiWFIyBYkQfOoiXKDxFJLBpJCUoMVItNSo6
         rPWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYgFJHNR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1391087dsor15372335ad.13.2024.10.05.08.25.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYgFJHNR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141957; x=1728746757; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH35lHXcbsJC32qCjyMaGZFqdyczAIeo1misqQjkoMQ=;
        b=NYgFJHNRsuJUr3Kibi5SAwHf3sq6Ye/uv/89x5aadtBi6ENhKGDGFf82R10m9z8leF
         pBkpZvqpX4H9Kqwl4r11yHbYrPcZlrkXSsQrFadb/uCBZjpxAkcxuB7t+KMJzl2WL0Rt
         HEoXrAyqD9wKiTvzGH0fje+HRxGZMP3mdTfyLz+nqcRFPsz0N0g1X3v1ySxtP/uxuikp
         XCO4/erGgKXSXwMVjNYLlhV3oo8iGuap4N2W/lDlCT+mslmfSgo3V47UoDdHpfeunOrK
         MAlK2SOK0dWyRo5ifCwbtTie//uRrcom7qH4Qg6w9xSGOnLVhfKTddJmPDtl9JW4qqdV
         Uf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141957; x=1728746757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH35lHXcbsJC32qCjyMaGZFqdyczAIeo1misqQjkoMQ=;
        b=i3gSlv/3Oyaes7aF96d6D+3QRQ32119PWP1eZ9gbSQU1XQ4O8MRtVZyWPx49qI3U7J
         8pI7O/0onSo6lQttyydEXWnlBIlMNaoGxvkKT/rwsQHGbOOm4JKvsrSn+WnL6MBYn9Ol
         la517GhaaJHPvBMXwPQSx3Z9uQ0SrY8CHWQ9gYEuizMTy1+DyEwnB73QMqgZMFPAjNdx
         zQ5o9Xcb4KE0yPaxu/dvfQr/ZXfoXZv5YITuV2uJTNXdS2LAbuVIH3wvmOZTfC55WBN1
         ShmLv1VKe27EVuNqSiI4rN2ZR8Zvxu3+mQy5iMp47kiV+gD6Dwj5YEwOWuaUB7FyBfWf
         eoxA==
X-Forwarded-Encrypted: i=1; AJvYcCWBnFkmOxK/4Dhdd5WP4xHGHWO8BSxniqhdYEuO9/hrrnFTIBWPtxYjfkh3/hn54C/dDQFrZ+av1yt8bg==@linaro.org
X-Gm-Message-State: AOJu0Yztj7593UH8EKBi3KPkZ7y//jRZyeG9qKAGbKxdVLaVZJRa3+XC
	kBxfcnjXtpLRA2vT8kjrryU4vq4B5a73h5IIiK88Sa/UDOIW4KpmmHMzAe54gWFrDQ==
X-Google-Smtp-Source: AGHT+IHT5o1cj1/9FCBXAXC0/1+PVD5HvqkowrTIKtKub8G3zTkYo3PO7CJQAs6NH7O9Krc3Ois1eQ==
X-Received: by 2002:a17:902:e94e:b0:20b:ce4e:b9e4 with SMTP id d9443c01a7336-20bfe044af6mr97224115ad.29.1728141956662;
        Sat, 05 Oct 2024 08:25:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 04/20] include/exec/memop: Rename get_alignment_bits
Date: Sat,  5 Oct 2024 08:25:35 -0700
Message-ID: <20241005152551.307923-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vg8GtQJgaijl

Rename to use "memop_" prefix, like other functions
that operate on MemOp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h           | 4 ++--
 accel/tcg/cputlb.c             | 4 ++--
 accel/tcg/user-exec.c          | 4 ++--
 target/arm/tcg/translate-a64.c | 4 ++--
 target/xtensa/translate.c      | 2 +-
 tcg/tcg-op-ldst.c              | 6 +++---
 tcg/tcg.c                      | 2 +-
 tcg/arm/tcg-target.c.inc       | 4 ++--
 tcg/sparc64/tcg-target.c.inc   | 2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 97720a8ee7..f53bf618c6 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -171,12 +171,12 @@ static inline bool memop_big_endian(MemOp op)
 }
 
 /**
- * get_alignment_bits
+ * memop_alignment_bits:
  * @memop: MemOp value
  *
  * Extract the alignment size from the memop.
  */
-static inline unsigned get_alignment_bits(MemOp memop)
+static inline unsigned memop_alignment_bits(MemOp memop)
 {
     unsigned a = memop & MO_AMASK;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 58960969f4..b5bff220a3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1693,7 +1693,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
 
     /* Handle CPU specific unaligned behaviour */
-    a_bits = get_alignment_bits(l->memop);
+    a_bits = memop_alignment_bits(l->memop);
     if (addr & ((1 << a_bits) - 1)) {
         cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
     }
@@ -1781,7 +1781,7 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     MemOp mop = get_memop(oi);
-    int a_bits = get_alignment_bits(mop);
+    int a_bits = memop_alignment_bits(mop);
     uintptr_t index;
     CPUTLBEntry *tlbe;
     vaddr tlb_addr;
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7ddc47b0ba..08a6df9987 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -959,7 +959,7 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 static void *cpu_mmu_lookup(CPUState *cpu, vaddr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-    int a_bits = get_alignment_bits(mop);
+    int a_bits = memop_alignment_bits(mop);
     void *ret;
 
     /* Enforce guest required alignment.  */
@@ -1241,7 +1241,7 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
                                int size, uintptr_t retaddr)
 {
     MemOp mop = get_memop(oi);
-    int a_bits = get_alignment_bits(mop);
+    int a_bits = memop_alignment_bits(mop);
     void *ret;
 
     /* Enforce guest required alignment.  */
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 071b6349fc..ec0b1ee252 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -294,7 +294,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ALIGN, get_alignment_bits(memop));
+        desc = FIELD_DP32(desc, MTEDESC, ALIGN, memop_alignment_bits(memop));
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, memop_size(memop) - 1);
 
         ret = tcg_temp_new_i64();
@@ -326,7 +326,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ALIGN, get_alignment_bits(single_mop));
+        desc = FIELD_DP32(desc, MTEDESC, ALIGN, memop_alignment_bits(single_mop));
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
 
         ret = tcg_temp_new_i64();
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 75b7bfda4c..f4da4a40f9 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -521,7 +521,7 @@ static MemOp gen_load_store_alignment(DisasContext *dc, MemOp mop,
         mop |= MO_ALIGN;
     }
     if (!option_enabled(dc, XTENSA_OPTION_UNALIGNED_EXCEPTION)) {
-        tcg_gen_andi_i32(addr, addr, ~0 << get_alignment_bits(mop));
+        tcg_gen_andi_i32(addr, addr, ~0 << memop_alignment_bits(mop));
     }
     return mop;
 }
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index 23dc807f11..a318011229 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -45,7 +45,7 @@ static void check_max_alignment(unsigned a_bits)
 
 static MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
 {
-    unsigned a_bits = get_alignment_bits(op);
+    unsigned a_bits = memop_alignment_bits(op);
 
     check_max_alignment(a_bits);
 
@@ -559,7 +559,7 @@ static void tcg_gen_qemu_ld_i128_int(TCGv_i128 val, TCGTemp *addr,
     TCGv_i64 ext_addr = NULL;
     TCGOpcode opc;
 
-    check_max_alignment(get_alignment_bits(memop));
+    check_max_alignment(memop_alignment_bits(memop));
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
 
     /* In serial mode, reduce atomicity. */
@@ -676,7 +676,7 @@ static void tcg_gen_qemu_st_i128_int(TCGv_i128 val, TCGTemp *addr,
     TCGv_i64 ext_addr = NULL;
     TCGOpcode opc;
 
-    check_max_alignment(get_alignment_bits(memop));
+    check_max_alignment(memop_alignment_bits(memop));
     tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
 
     /* In serial mode, reduce atomicity. */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 34e3056380..5decd83cf4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -5506,7 +5506,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 static TCGAtomAlign atom_and_align_for_opc(TCGContext *s, MemOp opc,
                                            MemOp host_atom, bool allow_two_ops)
 {
-    MemOp align = get_alignment_bits(opc);
+    MemOp align = memop_alignment_bits(opc);
     MemOp size = opc & MO_SIZE;
     MemOp half = size ? size - 1 : 0;
     MemOp atom = opc & MO_ATOM_MASK;
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 3de5f50b62..56072d89a2 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1587,7 +1587,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_debug_assert((datalo & 1) == 0);
         tcg_debug_assert(datahi == datalo + 1);
         /* LDRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64) {
+        if (memop_alignment_bits(opc) >= MO_64) {
             if (h.index < 0) {
                 tcg_out_ldrd_8(s, h.cond, datalo, h.base, 0);
                 break;
@@ -1691,7 +1691,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_debug_assert((datalo & 1) == 0);
         tcg_debug_assert(datahi == datalo + 1);
         /* STRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64) {
+        if (memop_alignment_bits(opc) >= MO_64) {
             if (h.index < 0) {
                 tcg_out_strd_8(s, h.cond, datalo, h.base, 0);
             } else {
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 176c98740b..32f9ec24b5 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1133,7 +1133,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * Otherwise, test for at least natural alignment and defer
      * everything else to the helper functions.
      */
-    if (s_bits != get_alignment_bits(opc)) {
+    if (s_bits != memop_alignment_bits(opc)) {
         tcg_debug_assert(check_fit_tl(a_mask, 13));
         tcg_out_arithi(s, TCG_REG_G0, addr_reg, a_mask, ARITH_ANDCC);
 
-- 
2.43.0
