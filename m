Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087464lfc;
        Thu, 12 Mar 2020 12:42:41 -0700 (PDT)
X-Received: by 2002:a63:7453:: with SMTP id e19mr9213475pgn.50.1584042161332;
        Thu, 12 Mar 2020 12:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042161; cv=none;
        d=google.com; s=arc-20160816;
        b=CJH7U8BzsB5JEaUsVUyV12XyCm7y94MdCF7proydhh1hyb6ryOiZN38hN75wrrrmL1
         aZXKJqfXiTlKIdiDblj7xTEdJgDiwg9beKsuL40wpub53WAJcSSMCKRTVNcE4M7QEa5x
         i73hP6BcmJwtn+Y67w/Nmk/CB1RFVqBC26ZWeqyc+ej1ExFmOZJs7GAXoztWqgCYbVaF
         YtQ6UYSETbTET2OdyEctP+PkJ7pth/2aLYyfoBWuVFloXkZ/bib7ZGTegaWg3d5it/YO
         VEcyt0q7RU+OITSPKfEwU6BjmwQH/ZMhr2mtiVVVCk6abfJFnnx1LfoqacU9BG+Cm+Iy
         Ygdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pP1dvr+8mMGE4aiaEn/CgZyRo+Wwo9NHJ10+vzr0sFU=;
        b=0KCObsg+Vl/f1C9QBM8VkkIur8ecVUC3fXLho8POdf3m8DKmYo1SGllaO/rkFNdREk
         qDJvTlYFLTEst2yPkRnxuQc+B+q+mWbcch/0X5oEquz93JEwsBF1Si5QsqyJojz1YRoU
         WmwYEteuxiZQgLendph0j5PH0T1FbnpHehtRtDlQvpqyyU1E76xMW6jz68uP43l58AHa
         2clD18zGJgwGpxuzzirCXkQe8oOM/x9uZZmAYz3TdgygdPq+/5hv8h7jYMFMSjYTNAMi
         6lPbzFtAQAf8ziY2eo9do0olMLUk1OadqmAcoPWRSCo2HZYgaln7RUxxrBVKJK0/uJJd
         XprA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wSbzAwfM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h10sor7716542plk.64.2020.03.12.12.42.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wSbzAwfM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pP1dvr+8mMGE4aiaEn/CgZyRo+Wwo9NHJ10+vzr0sFU=;
        b=wSbzAwfM41yD0bAICuen+cvMmL4umpV2Px3YjXtvl6lMXZ7eniE9iOyC0z6ycdD9eh
         vKcXFYthyDMUqc0EarEAr6hslAsBF+0uCaeswH9tSNnqoPzyR+dxDqSg6uu64zBDkdOF
         MQsnsovhWaUwX9UVH2UDuTTXCn4X0CwgAUSEvGUrdfbLrflF47tPunAJW515gw21Q9Le
         4zZK7INcdI4rw0qaxmR4iaU2dW/r1jJDIbYBRF7OUeXUXeNgOKxLVOyQ2lRFRvwoGUmF
         yCX5LKdwwqPcsEaM5Z2+Gj5Ww+c5He42M0fYyR0BBS96whs5mRljBax7B3px1A0Sto0z
         1MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pP1dvr+8mMGE4aiaEn/CgZyRo+Wwo9NHJ10+vzr0sFU=;
        b=tnXubwaJlq5Op5iuY9W1EmazjGqn4U+ZQc9PiZX6dT51Gok/YIOam5FFMCjJAl7Gkh
         JFlyhrhT1LTedJUpDDHRA4WeFvWJ0vQX/qN/Le534aQ3IeFqkIKHrJEfMGIuooSAnswY
         4A5H9K5mujYirIpLaRJ5AhCfnqeN2cG4DSwFwmpFli74mtb0b7SscaktVK1xy9EwDVVh
         +3XIRAwl1yEsixCf5CDWd4RwD4RQ7B5+aJsnJGuSuDgRlujKtFGlJ0QXiHL2IcenjE2Z
         Hu/OiUDn4jZo7JVCxSjq4AvQSbmJ3WQDMIwiKKdgDgQPeBWXt7WkNLJMBis1nq5W5nOZ
         34MA==
X-Gm-Message-State: ANhLgQ0KC52Ku1xHDpFFNZll/YbZBNVQeyLAfO/oG0wGUNRmbYNQKOlb
	e5dK2Sz+qp8x0KPqnzA0JTT2B5R9
X-Google-Smtp-Source: ADFU+vuccg9gnvWKbtXJerff2mlhLRwt0ZTUCv6WfrtMn06+pfsrZlMBat/oD4GWoUpCBK8nJJqt9Q==
X-Received: by 2002:a17:902:bb82:: with SMTP id m2mr9729434pls.197.1584042160695;
        Thu, 12 Mar 2020 12:42:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 15/42] target/arm: Implement LDG, STG, ST2G instructions
Date: Thu, 12 Mar 2020 12:41:52 -0700
Message-Id: <20200312194219.24406-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: puph+iyowhzm

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Split out allocation_tag_mem.  Handle atomicity of stores.
v3: Add X[t] input to these insns; require pre-cleaned addresses.
v5: Fix !32-byte aligned operation of st2g.
v6: Fix op2 extract, stg pre/post-index, stores vs sp, commentary;
    use pre-computed ata.
---
 target/arm/helper-a64.h    |   7 ++
 target/arm/mte_helper.c    | 194 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 158 +++++++++++++++++++++++++++++-
 3 files changed, 354 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 6c116481e8..2fa61b86fa 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -106,3 +106,10 @@ DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
+DEF_HELPER_FLAGS_3(ldg, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(stg, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_3(stg_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_2(stg_stub, TCG_CALL_NO_WG, void, env, i64)
+DEF_HELPER_FLAGS_3(st2g, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_3(st2g_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 9ab9ed749d..7ec7930dfc 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -44,6 +44,40 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
     return tag;
 }
 
+/**
+ * allocation_tag_mem:
+ * @env: the cpu environment
+ * @ptr_mmu_idx: the addressing regime to use for the virtual address
+ * @ptr: the virtual address for which to look up tag memory
+ * @ptr_access: the access to use for the virtual address
+ * @ptr_size: the number of bytes in the normal memory access
+ * @tag_access: the access to use for the tag memory
+ * @tag_size: the number of bytes in the tag memory access
+ * @ra: the return address for exception handling
+ *
+ * Our tag memory is formatted as a sequence of little-endian nibbles.
+ * That is, the byte at (addr >> (LOG2_TAG_GRANULE + 1)) contains two
+ * tags, with the tag at [3:0] for the lower addr and the tag at [7:4]
+ * for the higher addr.
+ *
+ * Here, resolve the physical address from the virtual address, and return
+ * a pointer to the corresponding tag byte.  Exit with exception if the
+ * virtual address is not accessible for @ptr_access.
+ *
+ * The @ptr_size and @tag_size values may not have an obvious relation
+ * due to the alignment of @ptr, and the number of tag checks required.
+ *
+ * If there is no tag storage corresponding to @ptr, return NULL.
+ */
+static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
+                                   uint64_t ptr, MMUAccessType ptr_access,
+                                   int ptr_size, MMUAccessType tag_access,
+                                   int tag_size, uintptr_t ra)
+{
+    /* Tag storage not implemented.  */
+    return NULL;
+}
+
 uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
 {
     int rtag;
@@ -80,3 +114,163 @@ uint64_t HELPER(addsubg)(CPUARMState *env, uint64_t ptr,
 
     return address_with_allocation_tag(ptr + offset, rtag);
 }
+
+static int load_tag1(uint64_t ptr, uint8_t *mem)
+{
+    int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
+    return extract32(*mem, ofs, 4);
+}
+
+uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    uint8_t *mem;
+    int rtag = 0;
+
+    /* Trap if accessing an invalid page.  */
+    mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD, 1,
+                             MMU_DATA_LOAD, 1, GETPC());
+
+    /* Load if page supports tags. */
+    if (mem) {
+        rtag = load_tag1(ptr, mem);
+    }
+
+    return address_with_allocation_tag(xt, rtag);
+}
+
+static void check_tag_aligned(CPUARMState *env, uint64_t ptr, uintptr_t ra)
+{
+    if (unlikely(!QEMU_IS_ALIGNED(ptr, TAG_GRANULE))) {
+        arm_cpu_do_unaligned_access(env_cpu(env), ptr, MMU_DATA_STORE,
+                                    cpu_mmu_index(env, false), ra);
+        g_assert_not_reached();
+    }
+}
+
+/* For use in a non-parallel context, store to the given nibble.  */
+static void store_tag1(uint64_t ptr, uint8_t *mem, int tag)
+{
+    int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
+    *mem = deposit32(*mem, ofs, 4, tag);
+}
+
+/* For use in a parallel context, atomically store to the given nibble.  */
+static void store_tag1_parallel(uint64_t ptr, uint8_t *mem, int tag)
+{
+    int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
+    uint8_t old = atomic_read(mem);
+
+    while (1) {
+        uint8_t new = deposit32(old, ofs, 4, tag);
+        uint8_t cmp = atomic_cmpxchg(mem, old, new);
+        if (likely(cmp == old)) {
+            return;
+        }
+        old = cmp;
+    }
+}
+
+typedef void stg_store1(uint64_t, uint8_t *, int);
+
+static inline void do_stg(CPUARMState *env, uint64_t ptr, uint64_t xt,
+                          uintptr_t ra, stg_store1 store1)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    uint8_t *mem;
+
+    check_tag_aligned(env, ptr, ra);
+
+    /* Trap if accessing an invalid page.  */
+    mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE, TAG_GRANULE,
+                             MMU_DATA_STORE, 1, ra);
+
+    /* Store if page supports tags. */
+    if (mem) {
+        store1(ptr, mem, allocation_tag_from_addr(xt));
+    }
+}
+
+void HELPER(stg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+{
+    do_stg(env, ptr, xt, GETPC(), store_tag1);
+}
+
+void HELPER(stg_parallel)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+{
+    do_stg(env, ptr, xt, GETPC(), store_tag1_parallel);
+}
+
+void HELPER(stg_stub)(CPUARMState *env, uint64_t ptr)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
+
+    check_tag_aligned(env, ptr, ra);
+    probe_write(env, ptr, TAG_GRANULE, mmu_idx, ra);
+}
+
+static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
+                           uintptr_t ra, stg_store1 store1)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    int tag = allocation_tag_from_addr(xt);
+    uint8_t *mem1, *mem2;
+
+    check_tag_aligned(env, ptr, ra);
+
+    /*
+     * Trap if accessing an invalid page(s).
+     * This takes priority over !allocation_tag_access_enabled.
+     */
+    if (ptr & TAG_GRANULE) {
+        /* Two stores unaligned mod TAG_GRANULE*2 -- modify two bytes. */
+        mem1 = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE,
+                                  TAG_GRANULE, MMU_DATA_STORE, 1, ra);
+        mem2 = allocation_tag_mem(env, mmu_idx, ptr + TAG_GRANULE,
+                                  MMU_DATA_STORE, TAG_GRANULE,
+                                  MMU_DATA_STORE, 1, ra);
+
+        /* Store if page(s) support tags. */
+        if (mem1) {
+            store1(TAG_GRANULE, mem1, tag);
+        }
+        if (mem2) {
+            store1(0, mem2, tag);
+        }
+    } else {
+        /* Two stores aligned mod TAG_GRANULE*2 -- modify one byte. */
+        mem1 = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE,
+                                  2 * TAG_GRANULE, MMU_DATA_STORE, 1, ra);
+        if (mem1) {
+            tag |= tag << 4;
+            atomic_set(mem1, tag);
+        }
+    }
+}
+
+void HELPER(st2g)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+{
+    do_st2g(env, ptr, xt, GETPC(), store_tag1);
+}
+
+void HELPER(st2g_parallel)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+{
+    do_st2g(env, ptr, xt, GETPC(), store_tag1_parallel);
+}
+
+void HELPER(st2g_stub)(CPUARMState *env, uint64_t ptr)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
+    int in_page = -(ptr | TARGET_PAGE_MASK);
+
+    check_tag_aligned(env, ptr, ra);
+
+    if (likely(in_page >= 2 * TAG_GRANULE)) {
+        probe_write(env, ptr, 2 * TAG_GRANULE, mmu_idx, ra);
+    } else {
+        probe_write(env, ptr, TAG_GRANULE, mmu_idx, ra);
+        probe_write(env, ptr + TAG_GRANULE, TAG_GRANULE, mmu_idx, ra);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 45a95d8ea0..b99973b5b1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3743,6 +3743,153 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     }
 }
 
+/*
+ * Load/Store memory tags
+ *
+ *  31 30 29         24     22  21     12    10      5      0
+ * +-----+-------------+-----+---+------+-----+------+------+
+ * | 1 1 | 0 1 1 0 0 1 | op1 | 1 | imm9 | op2 |  Rn  |  Rt  |
+ * +-----+-------------+-----+---+------+-----+------+------+
+ */
+static void disas_ldst_tag(DisasContext *s, uint32_t insn)
+{
+    int rt = extract32(insn, 0, 5);
+    int rn = extract32(insn, 5, 5);
+    uint64_t offset = sextract64(insn, 12, 9) << LOG2_TAG_GRANULE;
+    int op2 = extract32(insn, 10, 2);
+    int op1 = extract32(insn, 22, 2);
+    bool is_load = false, is_pair = false, is_zero = false;
+    int index = 0;
+    TCGv_i64 addr, clean_addr, tcg_rt;
+
+    /* We checked insn bits [29:24,21] in the caller.  */
+    if (extract32(insn, 30, 2) != 3) {
+        goto do_unallocated;
+    }
+
+    /*
+     * @index is a tri-state variable which has 3 states:
+     * < 0 : post-index, writeback
+     * = 0 : signed offset
+     * > 0 : pre-index, writeback
+     */
+    switch (op1) {
+    case 0: /* STG */
+        if (op2 != 0) {
+            /* STG */
+            index = op2 - 2;
+            break;
+        }
+        goto do_unallocated;
+    case 1:
+        if (op2 != 0) {
+            /* STZG */
+            is_zero = true;
+            index = op2 - 2;
+        } else {
+            /* LDG */
+            is_load = true;
+        }
+        break;
+    case 2:
+        if (op2 != 0) {
+            /* ST2G */
+            is_pair = true;
+            index = op2 - 2;
+            break;
+        }
+        goto do_unallocated;
+    case 3:
+        if (op2 != 0) {
+            /* STZ2G */
+            is_pair = is_zero = true;
+            index = op2 - 2;
+            break;
+        }
+        goto do_unallocated;
+
+    default:
+    do_unallocated:
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!dc_isar_feature(aa64_mte_insn_reg, s)) {
+        goto do_unallocated;
+    }
+
+    if (rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+
+    addr = read_cpu_reg_sp(s, rn, true);
+    if (index >= 0) {
+        /* pre-index or signed offset */
+        tcg_gen_addi_i64(addr, addr, offset);
+    }
+
+    if (is_load) {
+        tcg_rt = cpu_reg(s, rt);
+        if (s->ata) {
+            gen_helper_ldg(tcg_rt, cpu_env, addr, tcg_rt);
+        } else {
+            clean_addr = clean_data_tbi(s, addr);
+            gen_probe_access(s, clean_addr, MMU_DATA_LOAD, MO_8);
+            gen_address_with_allocation_tag0(tcg_rt, addr);
+        }
+    } else {
+        tcg_rt = cpu_reg_sp(s, rt);
+        if (!s->ata) {
+            /*
+             * For STG and ST2G, we need to check alignment and probe memory.
+             * TODO: For STZG and STZ2G, we could rely on the stores below,
+             * at least for system mode; user-only won't enforce alignment.
+             */
+            if (is_pair) {
+                gen_helper_st2g_stub(cpu_env, addr);
+            } else {
+                gen_helper_stg_stub(cpu_env, addr);
+            }
+        } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+            if (is_pair) {
+                gen_helper_st2g_parallel(cpu_env, addr, tcg_rt);
+            } else {
+                gen_helper_stg_parallel(cpu_env, addr, tcg_rt);
+            }
+        } else {
+            if (is_pair) {
+                gen_helper_st2g(cpu_env, addr, tcg_rt);
+            } else {
+                gen_helper_stg(cpu_env, addr, tcg_rt);
+            }
+        }
+    }
+
+    if (is_zero) {
+        TCGv_i64 clean_addr = clean_data_tbi(s, addr);
+        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        int mem_index = get_mem_index(s);
+        int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
+
+        tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index,
+                            MO_Q | MO_ALIGN_16);
+        for (i = 1; i < n; i += 8) {
+            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+            tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_Q);
+        }
+        tcg_temp_free_i64(tcg_zero);
+    }
+
+    if (index != 0) {
+        /* pre-index or post-index */
+        if (index < 0) {
+            /* post-index */
+            tcg_gen_addi_i64(addr, addr, offset);
+        }
+        tcg_gen_mov_i64(cpu_reg_sp(s, rn), addr);
+    }
+}
+
 /* Loads and stores */
 static void disas_ldst(DisasContext *s, uint32_t insn)
 {
@@ -3767,13 +3914,14 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
     case 0x0d: /* AdvSIMD load/store single structure */
         disas_ldst_single_struct(s, insn);
         break;
-    case 0x19: /* LDAPR/STLR (unscaled immediate) */
-        if (extract32(insn, 10, 2) != 0 ||
-            extract32(insn, 21, 1) != 0) {
+    case 0x19:
+        if (extract32(insn, 21, 1) != 0) {
+            disas_ldst_tag(s, insn);
+        } else if (extract32(insn, 10, 2) == 0) {
+            disas_ldst_ldapr_stlr(s, insn);
+        } else {
             unallocated_encoding(s);
-            break;
         }
-        disas_ldst_ldapr_stlr(s, insn);
         break;
     default:
         unallocated_encoding(s);
-- 
2.20.1
