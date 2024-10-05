Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147611njb;
        Sat, 5 Oct 2024 13:06:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdTeBnOUft1OwgNLG20L1besOfbByLQZy69tHelW9y3uve9Ggt8X8hNqT/VLE4VRNRBu+uG6CDy8tm2Q==@linaro.org
X-Received: by 2002:a17:902:d2c5:b0:20b:b26e:c143 with SMTP id d9443c01a7336-20bff17dfeamr108234965ad.57.1728158765777;
        Sat, 05 Oct 2024 13:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158765; cv=none;
        d=google.com; s=arc-20240605;
        b=Eul3f12VH6n7wVidchM3P3pH/fxj6XIqph9P9cGKEPB/YaK4DRO486PmXkOBiV8WSw
         x0bD/ulqxUHEZYn2r+EZYZ5UJkVv6+TRr1C9y9M0DOwYuDfCFmSZcyyN0I6UgcP3Jj+6
         QIVLM8cn+yalgYES/wT0000gJ3kvqcYfaJLNUdkmzWdnYyVLIZeDCZSCpWnq6RP7XOah
         T5Na9OH3aWlejBH18MOa8Lmk1RaiMGhDky8GARn3RAlBGuCKrliEVGV9yUtZAMb2tPBI
         wSGRo4skdVRAw6j3SdTAC8ospdhkd69Wurwbr4HfXVs/PurnZHx39y8IDEL9m5CXQbEl
         EIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DH35lHXcbsJC32qCjyMaGZFqdyczAIeo1misqQjkoMQ=;
        fh=AXjhch9FfspWaq2kYmP+kgPhfOWCQquk0/2aDEeeJRM=;
        b=bQ5z7WnxVg/gEUSoLtngKtM1tP1vdLoUul8yuFQPSWzKCUxDhorD2INaHUeyBPLQ2B
         +cYG7amxGW6/D9sFVxxjBAUKLa6Z07f3y38atPZM4DyK5dZuS5n7GkhGYk0BHzvrarZb
         CkWswAlOnfXmcgzNZqLDdVtYq1QxNHiiR3jvCMAPptkY/s5iAcHBEz5M+VsKvJ8kqe5v
         GtbjoXkllQ56+CAoX3vZw1gZhWAQHH/wYNkBxe0D5SfgZ4oVyf0B8Vj9eGVy5VJRM02t
         7aP4NULTcjd7QKugwyP45ZxgXJSZA9/gdkJkSKBF7/NxCQ2Ra/fAy+Raq31heMJGqq8/
         Zj7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D7YXB7Zw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c13919941sor17911025ad.14.2024.10.05.13.06.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D7YXB7Zw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158765; x=1728763565; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH35lHXcbsJC32qCjyMaGZFqdyczAIeo1misqQjkoMQ=;
        b=D7YXB7Zw9bFnvKJ21BidgGEhjRIs7q1ASh6RQHZLFsp7wbwyLFZYBrdb/N1V2JXuMb
         H9hcYaU66vRx9ulDHFzNMfLZ+EoW6waycZpL0sqN0VHhpKIxCgD7dQ5UoKbeuHbUWuc/
         hwbV2TwfabHXyPcPOOVze9LglW7SDQWMAjdIdd/fWYPts9VdtcNoFNkXO7YYjqhSN/Tp
         AS2yK7/vUT4D6cPikVzapIfVYGPhGbAjXTPBDhXGifwZxmOzBFehUd6lBcA6gvUWKV5V
         55F15n53ho5Kg7Zz+Z9aGJV938/ngDJ4h4v0lWK8idDtTRi2L259Go6wkQLoENloA+C0
         UhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158765; x=1728763565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH35lHXcbsJC32qCjyMaGZFqdyczAIeo1misqQjkoMQ=;
        b=dDfW1+SLcQkSAj0b7ktDNkJv/pm2S6EYqIfIemo5wR6JRV7FzwNcFRc4sN4rbqyCEb
         R39OiYU4e9AYTMzLz1+ZzDCcRc9i+sRP/qi5uB0kooGyrucuurwAf+cc0vHmXr7KbG3W
         WLAk2S0YxgXClDOZPsYVj7bsXB7kVFp3PuWmm4wbxGX4Mqtsp21jx8YsaYpNDDpgeiJd
         J6o56by7nmO4xu9ucH8pHPlhd3FzdhILgIh6gRI7jL307Jp1KDHqhpC90Hf+vyFfcYoi
         CfHPSvCEcoHF5rCuFGg8M4jam/MeBe1zvrVBsGNaBBs3KlBagQf2uH3Cevg6RlN9sGTI
         Fykg==
X-Forwarded-Encrypted: i=1; AJvYcCU4kSIXkmNUWNEZ5pb0M6Q/99vQXQEX/Onmubewkp7nuPgSFQquR22AQYjRrc32ydh4axsPMy7foA/Gzg==@linaro.org
X-Gm-Message-State: AOJu0Yw3p5Tp/1RvYouwKV/YH0p9g+mbgCAHB7IkXP6XwyOj9srylvni
	b/+54tREivgeVjuCBKiYcpG+4DT/nW4usHZIChqZggk9nGE7z1fqW1cLJFry1bbL8w==
X-Google-Smtp-Source: AGHT+IHIb0nvq4eNPHU0RqWZQLaosTrrxJaEwg0X9iadpDKgGULb2krdXNgtY4yg4RXKinwxw3yncg==
X-Received: by 2002:a17:903:40ce:b0:20b:a8d9:2a02 with SMTP id d9443c01a7336-20bfe072971mr98365935ad.36.1728158765269;
        Sat, 05 Oct 2024 13:06:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 04/21] include/exec/memop: Rename get_alignment_bits
Date: Sat,  5 Oct 2024 13:05:43 -0700
Message-ID: <20241005200600.493604-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: F/5eJ+pGDNtH

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
