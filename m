Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp531965njl;
        Tue, 8 Oct 2024 17:04:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSKyrbCsAPRVTBXEuMScn6eNN7lgTENOG0D0O2kUGCwoKM1HNbxo7xkHWRvmi1wAKFncuZP3MYyu36eg==@linaro.org
X-Received: by 2002:a17:902:c401:b0:20b:8bd0:738a with SMTP id d9443c01a7336-20c4e33e92cmr88847165ad.20.1728432298642;
        Tue, 08 Oct 2024 17:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432298; cv=none;
        d=google.com; s=arc-20240605;
        b=P+pw3Lm8uHpVHVFdoABX5zjnxVbrACDBsXkS7InfgfOz02kJitd3uwgW/9kmAdeh/V
         iER+wqxbCYWGQKlz79YiK95GR6nK8i8RSUyaAXH7YUbMMPqFCCgkMmcJWg4hy4RYz4EL
         jNOUH9vE5ISO2+Fk3vNhsVcgA2sAZTfuKnYX++/jX1ccKLmG3Q0zNiHYrH5OgUzw2VM5
         ERFPoo0kGafsu+OmO3nI5QJndQh87fT40GsyClUdwtr1yP/k368cFiUsd0aWiv+g7WsJ
         0+LjfZ/OwSupVzAaxgUDs8Z2yzVf88xCCihpuhm/UeIvpjc+0SdsYUanu1QW2DOlAc+C
         tLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9LebsJbt4uExwr4Anb+4jbY7Oq0PbwNNghgu5qGnqlk=;
        fh=MCfRfFeZOAfZrhrLuIUQYAXueUSLr3RlXbN0h7VmYMs=;
        b=YsV6du3RCK8sifJxmUyrNLJQQCZxAZxtKHWrxSXOXosF8XHOCvrw5JqhJXiqzxVeXd
         aD2ChpMW28V7jgsFYtKG5hNsNfDtKXHh5Ux6qgrZTd/nQlML92FJE614cAp21JlZtw40
         mLKcM07tzWraQJEcK/lCHyYDFMFSwxTEVyhBs5xzbP8APyWsaMpclpNnu0crXH5m+h1j
         KSJP5fVsMBynNdj3DSXZ/g1vR/HUMggvcNB6rQT+ELUjpePsu48DW1HjE56xUBWg1wSH
         fjNySoSqhGBbzrQl0Ns7CXor5QpYOLCpHsma/wP6jlLJC0N8BqKEUxPMKHhG0bP+3FFl
         a5LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEpk2adD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c65600b39sor1514995ad.7.2024.10.08.17.04.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEpk2adD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432298; x=1729037098; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LebsJbt4uExwr4Anb+4jbY7Oq0PbwNNghgu5qGnqlk=;
        b=aEpk2adD/ZL3PvHP2p3JfTTedPAeGRkvjlkumC/RTaBrqfC4k305g1SuxOt/Xtr6PU
         Zs0sG0wBxdh1PdnzHmxa455ugowDqeGssFssNf87pySBj2lKFjwTvlj3Hw4a9DFI7gSA
         YkOLq+M0bHzAj8lYICtbHgjmtKV0g5E4JwMNnDXWob6CD7F9Ne+URt06BVHlpEdHnHKs
         rgHIo4yPADXGesRNl2uz1q0V+vRPBIW7Y1b3c+Ga4nwPelASjlD+ABak+Kwe+/QELDQ3
         zZ65ZYV6Yv+9dV7P9YwuU+4lSsGwqMf/Ro8rJSN2ePJXe0KQkQ1f0UJ44fKqMjDAV2TA
         3RMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432298; x=1729037098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LebsJbt4uExwr4Anb+4jbY7Oq0PbwNNghgu5qGnqlk=;
        b=qDm5oeY6EEGzecVN9F6gQEy3V3AFEku+bV2iYKpU9qNEG+OCK5Iok+OLLmUdkawwU0
         4AzpCrnYk8d3OOUUzs4+dUH11xn5+zbGI0owKU7UXTRjdRH0FafVqUjhgqkJzHYD1pP6
         lhB6v09Io+PAW/tLRKZhFkwjQohPpukBd99/CAtqP2OB+CrloQYqleAKZYc5/igH/LEe
         EpU3geL1RzMNiTLpgHnLJ77LtFevPNWbF9G8UfC315hKV9MR96ZifEGiqd2E8xtUYJDF
         VdooXnJ4pTexef4kw1QGN+cQ6lT1yDDhP9iz37dF0cvEqoNr1Vr5v5uXos1ZoO/J/EEd
         jymQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsMgUIqBMMRqt0Xf3KmSntxO9Es+nfHIg5x5dlk2IC2z5RLcEMUfAD5roXzrI6pl+QHZKMC/Xu95r4PQ==@linaro.org
X-Gm-Message-State: AOJu0YwTlN1Q4ChABaXcPOOF2cwVCKRkG3G0xrE8l0YYVcVQT9E3HmeF
	GnVk75S9zHDrvboj1m3f6E3MCWTSy1uiy1uGSaOJOogOMBHliJYWMwL5K6nMWRc3fA==
X-Google-Smtp-Source: AGHT+IFrjf/KG6jW0dXe87Xq6SyttisiiLp3ocVOdfABD+rqesa5TS+vrbt3d454eeR29R+9AWd9wA==
X-Received: by 2002:a17:903:41cc:b0:206:b5b8:25dd with SMTP id d9443c01a7336-20c6352cdd6mr12193455ad.23.1728432298141;
        Tue, 08 Oct 2024 17:04:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 03/20] include/exec/memop: Rename get_alignment_bits
Date: Tue,  8 Oct 2024 17:04:36 -0700
Message-ID: <20241009000453.315652-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cWYtzCJKSZiG

Rename to use "memop_" prefix, like other functions
that operate on MemOp.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index fd6459b695..a975fe5f89 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1709,7 +1709,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
 
     /* Handle CPU specific unaligned behaviour */
-    a_bits = get_alignment_bits(l->memop);
+    a_bits = memop_alignment_bits(l->memop);
     if (addr & ((1 << a_bits) - 1)) {
         cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
     }
@@ -1797,7 +1797,7 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
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
