Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087614lfc;
        Thu, 12 Mar 2020 12:42:47 -0700 (PDT)
X-Received: by 2002:a17:90a:185:: with SMTP id 5mr5670529pjc.157.1584042167506;
        Thu, 12 Mar 2020 12:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042167; cv=none;
        d=google.com; s=arc-20160816;
        b=NfuPaKhK/RKQkBEo4Vu3omfu7S6TKoTeWyZm1yh+EswZeCCwufZuPF724OhLtYffAZ
         VQiJI1QgjWLqcWjNrgWinzgtZ4JdCeHMk3U/nJEC4mh/FBH9POf8e0WbbMJb1TuZEZDI
         1JNAEkuNwgww3kw24hpuREgHvTA+tvoeB7LM/Xie1mY/NQEcrORmTCZeRN4cXYTaQZuW
         XypA076Ku2v6M9sZXgFH9zKmCjGJ0XorKWMqq2oLZsJKI7FihIj4o+82MfLOQVfJKEIw
         9LfVySbeEEng3Hv3z1czGVoylBgAhMaQ28X2Gg1V1q1vpOaYpTJoR20jTFO59CkdtdjZ
         w4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FUO/6qc4Htz4N9YorwroOFAZWSwiCJ/idNRsOjS2/d8=;
        b=E8j/f7CEMJr94uRrXwoMZP40AaFcVWpcLNFxNeuDWran4F/yE36vJpkn7b9ZRkI+Ix
         ManG9K3TRzFVljbngsEcMJk4zCeRMA6hFkjpa0nDqcoSb5rA2DehWZ1vjxPSrIZkTwAv
         1k5oTYthe4V8OFzYbD7zjNSys8pcUCBTwRHgOuGpcRCNGj6MlvAY1by+7SLk5R1YEPxb
         Wx06dilXF6CC0wkplvP5szlZcPITTgB+goSCbZTWslxAzUyrwgjw3wGqPpnra10L8tRQ
         Rk8f2lhscYBGcFQq6XJ9oE1ES6mYljoHSchmjdOZWQStsetuc81iRflDzSsTVqhwtsui
         kOmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtRudqkV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p190sor6336408pfb.35.2020.03.12.12.42.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtRudqkV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FUO/6qc4Htz4N9YorwroOFAZWSwiCJ/idNRsOjS2/d8=;
        b=UtRudqkVsfteSSXAgitf/56/vSopMj4lUOqAN6wAY4Ww7Mtwr8Sj45v30zYlxApM0m
         xoccCsSG9ho/CQs0Jb7zyjyFBfmiVIsG9OS88ghSXZB00IzERsPpjUn7KoOy3RPzXE/j
         gTagKpgBiu3TpqcosR5Bxvi36T2jK5SZVDogfT49SRxsXX4cwhV65S2ZMSwEX7X7B1yt
         ZOQcPDARQ580/DYUw9GmMFeLHHeUoLxthsog5KmFsOPiEXPH9RHMSEpnZBY7W6FQHuLd
         HdTxWNXZ92/FkatEhwpjZzadlSF950xDDKRUHeb4ATYRaj2sPsfAIqpgGy+NWWhWqIr7
         LSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FUO/6qc4Htz4N9YorwroOFAZWSwiCJ/idNRsOjS2/d8=;
        b=oqF87CjecJ/4Jz7tQrXipvHTSwF0qebw/VI9o1gcdsP+In8ZyCUYe3RGwPFlVEvvVR
         +UOh4aDYX+tHSk6VXWGljWFU7Yt98+9vnQCBweLmmkT3qNE/vTmtq71DW4e78CFF7iZa
         jVp3vAJeDA/bWF8rVCTSxtq7Lo/fCGZJExYe6P0+afpOBbR1qmgPMSf/SSL4DvwP1aWD
         GKDM6TK4ylWtJ3/F0AokVxjvL/Fakj7xyhoBQbya9ymIgkGfTrJhYWuJBqkm3Fq0UM95
         C2XfTJ8VT73xv2UsauTIsUVLRCCmNfKUUL7PeQbua5SvzFhDx5aXeqUTqcboYoEUrkSg
         eRtw==
X-Gm-Message-State: ANhLgQ2qNhnjhWA5G/USkITwfw5R5NrkHt+RPrQOSL5wFRTO6cpIQSRy
	A/qjrCAGNuMv+H3CGPN0w3wujifK
X-Google-Smtp-Source: ADFU+vtTCDyCkaP7u990Rh530Kcc0gATmhJn0YIv9+Su6HdtJHbti1zovZvq1aq/9h9CqiQnpxuiEw==
X-Received: by 2002:a63:3f81:: with SMTP id m123mr9558730pga.335.1584042166879;
        Thu, 12 Mar 2020 12:42:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 19/42] target/arm: Implement the LDGM, STGM, STZGM instructions
Date: Thu, 12 Mar 2020 12:41:56 -0700
Message-Id: <20200312194219.24406-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZqbmurhOow6m

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Require pre-cleaned addresses.
v6: Check full mte enabled.  Reorg the helpers.
---
 target/arm/helper-a64.h    |  3 ++
 target/arm/translate.h     |  2 +
 target/arm/mte_helper.c    | 84 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 74 +++++++++++++++++++++++++++++----
 4 files changed, 154 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 2fa61b86fa..7b628d100e 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -113,3 +113,6 @@ DEF_HELPER_FLAGS_2(stg_stub, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_3(st2g, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(st2g_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
+DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index e0f5d0be63..5552ee5a94 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -91,6 +91,8 @@ typedef struct DisasContext {
      *  < 0, set by the current instruction.
      */
     int8_t btype;
+    /* A copy of cpu->dcz_blocksize. */
+    uint8_t dcz_blocksize;
     /* True if this page is guarded.  */
     bool guarded_page;
     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 7ec7930dfc..27d4b4536c 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -274,3 +274,87 @@ void HELPER(st2g_stub)(CPUARMState *env, uint64_t ptr)
         probe_write(env, ptr + TAG_GRANULE, TAG_GRANULE, mmu_idx, ra);
     }
 }
+
+#define LDGM_STGM_SIZE  (4 << GMID_EL1_BS)
+
+uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
+    void *tag_mem;
+
+    ptr = QEMU_ALIGN_DOWN(ptr, LDGM_STGM_SIZE);
+
+    /* Trap if accessing an invalid page.  */
+    tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD,
+                                 LDGM_STGM_SIZE, MMU_DATA_LOAD,
+                                 LDGM_STGM_SIZE / (2 * TAG_GRANULE), ra);
+
+    /* The tag is squashed to zero if the page does not support tags.  */
+    if (!tag_mem) {
+        return 0;
+    }
+
+    QEMU_BUILD_BUG_ON(GMID_EL1_BS != 6);
+    /*
+     * We are loading 64-bits worth of tags.  The ordering of elements
+     * within the word corresponds to a 64-bit little-endian operation.
+     */
+    return ldq_le_p(tag_mem);
+}
+
+void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
+    void *tag_mem;
+
+    ptr = QEMU_ALIGN_DOWN(ptr, LDGM_STGM_SIZE);
+
+    /* Trap if accessing an invalid page.  */
+    tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE,
+                                 LDGM_STGM_SIZE, MMU_DATA_LOAD,
+                                 LDGM_STGM_SIZE / (2 * TAG_GRANULE), ra);
+
+    /*
+     * Tag store only happens if the page support tags,
+     * and if the OS has enabled access to the tags.
+     */
+    if (!tag_mem) {
+        return;
+    }
+
+    QEMU_BUILD_BUG_ON(GMID_EL1_BS != 6);
+    /*
+     * We are storing 64-bits worth of tags.  The ordering of elements
+     * within the word corresponds to a 64-bit little-endian operation.
+     */
+    stq_le_p(tag_mem, val);
+}
+
+void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = cpu_mmu_index(env, false);
+    int log2_dcz_bytes, log2_tag_bytes;
+    intptr_t dcz_bytes, tag_bytes;
+    uint8_t *mem;
+
+    /*
+     * In arm_cpu_realizefn, we assert that dcz > LOG2_TAG_GRANULE+1,
+     * i.e. 32 bytes, which is an unreasonably small dcz anyway,
+     * to make sure that we can access one complete tag byte here.
+     */
+    log2_dcz_bytes = env_archcpu(env)->dcz_blocksize + 2;
+    log2_tag_bytes = log2_dcz_bytes - (LOG2_TAG_GRANULE + 1);
+    dcz_bytes = (intptr_t)1 << log2_dcz_bytes;
+    tag_bytes = (intptr_t)1 << log2_tag_bytes;
+    ptr &= -dcz_bytes;
+
+    mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE, dcz_bytes,
+                             MMU_DATA_STORE, tag_bytes, ra);
+    if (mem) {
+        int tag_pair = (val & 0xf) * 0x11;
+        memset(mem, tag_pair, tag_bytes);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 048140ddc0..f010aa2b58 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3781,7 +3781,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
     uint64_t offset = sextract64(insn, 12, 9) << LOG2_TAG_GRANULE;
     int op2 = extract32(insn, 10, 2);
     int op1 = extract32(insn, 22, 2);
-    bool is_load = false, is_pair = false, is_zero = false;
+    bool is_load = false, is_pair = false, is_zero = false, is_mult = false;
     int index = 0;
     TCGv_i64 addr, clean_addr, tcg_rt;
 
@@ -3797,13 +3797,18 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
      * > 0 : pre-index, writeback
      */
     switch (op1) {
-    case 0: /* STG */
+    case 0:
         if (op2 != 0) {
             /* STG */
             index = op2 - 2;
-            break;
+        } else {
+            /* STZGM */
+            if (s->current_el == 0 || offset != 0) {
+                goto do_unallocated;
+            }
+            is_mult = is_zero = true;
         }
-        goto do_unallocated;
+        break;
     case 1:
         if (op2 != 0) {
             /* STZG */
@@ -3819,17 +3824,27 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
             /* ST2G */
             is_pair = true;
             index = op2 - 2;
-            break;
+        } else {
+            /* STGM */
+            if (s->current_el == 0 || offset != 0) {
+                goto do_unallocated;
+            }
+            is_mult = true;
         }
-        goto do_unallocated;
+        break;
     case 3:
         if (op2 != 0) {
             /* STZ2G */
             is_pair = is_zero = true;
             index = op2 - 2;
-            break;
+        } else {
+            /* LDGM */
+            if (s->current_el == 0 || offset != 0) {
+                goto do_unallocated;
+            }
+            is_mult = is_load = true;
         }
-        goto do_unallocated;
+        break;
 
     default:
     do_unallocated:
@@ -3837,7 +3852,9 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
         return;
     }
 
-    if (!dc_isar_feature(aa64_mte_insn_reg, s)) {
+    if (is_mult
+        ? !dc_isar_feature(aa64_mte, s)
+        : !dc_isar_feature(aa64_mte_insn_reg, s)) {
         goto do_unallocated;
     }
 
@@ -3851,6 +3868,44 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
         tcg_gen_addi_i64(addr, addr, offset);
     }
 
+    if (is_mult) {
+        tcg_rt = cpu_reg(s, rt);
+
+        if (is_zero) {
+            int size = 4 << s->dcz_blocksize;
+
+            if (s->ata) {
+                gen_helper_stzgm_tags(cpu_env, addr, tcg_rt);
+            }
+            /*
+             * The non-tags portion of STZGM is mostly like DC_ZVA,
+             * except the alignment happens before the access.
+             */
+            clean_addr = clean_data_tbi(s, addr);
+            tcg_gen_andi_i64(clean_addr, clean_addr, -size);
+            gen_helper_dc_zva(cpu_env, clean_addr);
+        } else if (s->ata) {
+            if (is_load) {
+                gen_helper_ldgm(tcg_rt, cpu_env, addr);
+            } else {
+                gen_helper_stgm(cpu_env, addr, tcg_rt);
+            }
+        } else {
+            MMUAccessType acc = is_load ? MMU_DATA_LOAD : MMU_DATA_STORE;
+            int size = 4 << GMID_EL1_BS;
+
+            clean_addr = clean_data_tbi(s, addr);
+            tcg_gen_andi_i64(clean_addr, clean_addr, -size);
+            gen_probe_access(s, clean_addr, acc, size);
+
+            if (is_load) {
+                /* The result tags are zeros.  */
+                tcg_gen_movi_i64(tcg_rt, 0);
+            }
+        }
+        return;
+    }
+
     if (is_load) {
         tcg_rt = cpu_reg(s, rt);
         if (s->ata) {
@@ -14623,6 +14678,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
     dc->features = env->features;
+    dc->dcz_blocksize = arm_cpu->dcz_blocksize;
 
     /* Single step state. The code-generation logic here is:
      *  SS_ACTIVE == 0:
-- 
2.20.1
