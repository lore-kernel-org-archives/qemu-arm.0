Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087725lfc;
        Thu, 12 Mar 2020 12:42:52 -0700 (PDT)
X-Received: by 2002:a62:1bd6:: with SMTP id b205mr10021281pfb.242.1584042172548;
        Thu, 12 Mar 2020 12:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042172; cv=none;
        d=google.com; s=arc-20160816;
        b=dmF8beD9MSch8LKyTbA82RiXYPRL4Rjt7mH5cAcNQ9hm/qMt6eAMYHR+yxENrUHK6D
         BnD4ML4bYi+gxAb0+eft10ZIPo4pGj8BR/7vx+1WCAWsBctol+Z/kqJUOl8CTDgCW9iO
         DykLerfKYqLV0gerHnkiH7U+CFrvPU6PtIVcaDpgJbyW/NlKxDazMW9j7mkiuuouJWZA
         2vi6a4JbuAqX4vjPDeM09Xb38pT0mJR4vMbgyTOSKu85X6/ursl7lawv0YSsRIO19JDz
         ZiiCQv55z1NOJz152rclfsoloZf3MR4eqcV8WpxYn1ZSLnwOrJZtPZHykl+ziT7LqLEm
         iW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PFt+v48W7QA8GvHg/8rhS6cw302F8aQHkOa+rEb7BHc=;
        b=z0ULjZszwRcVwQLMpb9QixbNMK1sYPj8muocXHc8sacc9UikrVHDVfGjSpf+tksULG
         NgyfSmdqe8/cSCx+2fVn7GpFD9Hr3ibzOM9UuzmPIx7rhvx6mzpQoYlDbHn1k+RtpCBe
         zK8i4LRFPXrU5qpKJbLg7icPzqFK5HCllfs0XXgcsVvfDNRSkkjLHQN5MXRSL1S3rv5W
         TiMYSJtfvL2D/65kVNrPNAFkTCNanOmM13llp/hEwkdjspNB4njHsFwER2T3uRrNMHll
         ZkNPNuePLiVzkf0DAAHwtxS+PCmRcWx1/+2ty9TvMTBhZsdHU1SqKX6LKxRMe6sR5/fz
         76Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hLobWc0V;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z5sor6995438pfz.52.2020.03.12.12.42.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hLobWc0V;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PFt+v48W7QA8GvHg/8rhS6cw302F8aQHkOa+rEb7BHc=;
        b=hLobWc0VI6Hy5e0m6wO/MuAFzcmzEocDmoibUTpv7yQF/RFv2RCrBur5URLhQpZeqi
         LDSXMh2s7dbtik22q8gtaK50eL64AfernpNhyOg6PauiYtHqmHtaShGZ/z0IpM68VpOp
         CpB6UaP9WlFoNto/gLDtdYPDWz+Iw+nImQNgXn7WO3TszMnNdijF/tGr9375gmA8Bq4v
         kYbG6T+mUUw/IRO7oLnvVXqSmAxm0yc3kFf1dFMouywA3Hi1jIKs9M43ZgSJ3lY4Y728
         AyMMtWZKNISfH9mr1/eCwyXJvEZCEb1y1JoAEh1wqvy9nBqihOq5wHzSON2CAh7RAuKG
         /sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PFt+v48W7QA8GvHg/8rhS6cw302F8aQHkOa+rEb7BHc=;
        b=SXXz5Y0SDeaIN+hp4MrSOrtQcxVZrAKl1oia6bcriLIOQ/eQglMWvjVRaqS9RPqQ9Z
         Q/Mmg1Xip2rdB4QU0R+q4zNuwi0hWPEIIqur95F/TUbR7u9Wy1TGPeAQOst8s6WxyX9r
         loc1LMrZ3N0oKdmsU7Y9aVDsf1cm+dmaGt3p5+MIGS5AHhU0gKZS65uuOrx8j9BuQZ8H
         SdkA9de6YpoHYpKyJ8FtILo9doD3GfGXR4YnAdFjQYmZkvbuBh/Ak+dX4D4SfO8P2ws7
         Lm+heM9leCVdgyPOBiUG3g6iNYRqO460JMptZ9NjRNvMyx5taOwCaCC0DJdwdUaTDBMX
         Z+Bw==
X-Gm-Message-State: ANhLgQ05rVQ3m3Z0sakAQHlekKLJSF1OhNXYw5kyo8/ARFb1+Q3DAGHY
	ba8C1sWI3IpXKc7QD7wUi4Bbkqt+
X-Google-Smtp-Source: ADFU+vtiX2cwiWDlrjTjNrZo/+EpXNuE3s5j53IjZvwAhVflgzT3kTjO/5io5vZROfb0mvEqGSjMgQ==
X-Received: by 2002:a63:8342:: with SMTP id h63mr9516183pge.141.1584042171925;
        Thu, 12 Mar 2020 12:42:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 23/42] target/arm: Add gen_mte_check1
Date: Thu, 12 Mar 2020 12:42:00 -0700
Message-Id: <20200312194219.24406-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5of1QfKMjZer

Replace existing uses of check_data_tbi in translate-a64.c that
perform a single logical memory access.  Leave the helper blank
for now to reduce the patch size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  1 +
 target/arm/internals.h     |  8 ++++
 target/arm/translate-a64.h |  2 +
 target/arm/mte_helper.c    |  8 ++++
 target/arm/translate-a64.c | 96 ++++++++++++++++++++++++++++----------
 5 files changed, 91 insertions(+), 24 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7b628d100e..2faa49d0a3 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -104,6 +104,7 @@ DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
+DEF_HELPER_FLAGS_3(mte_check1, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
 DEF_HELPER_FLAGS_3(ldg, TCG_CALL_NO_WG, i64, env, i64, i64)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 56fb07f2b6..a993e8ca0a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1306,6 +1306,14 @@ void arm_log_exception(int idx);
 #define LOG2_TAG_GRANULE 4
 #define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
 
+/* Bits within a descriptor passed to the helper_mte_check* functions. */
+FIELD(MTEDESC, MIDX,  0, 4)
+FIELD(MTEDESC, TBI,   4, 2)
+FIELD(MTEDESC, TCMA,  6, 2)
+FIELD(MTEDESC, WRITE, 8, 1)
+FIELD(MTEDESC, ESIZE, 9, 5)
+FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
+
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
     return extract64(ptr, 56, 4);
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 4c2c91ae1b..cc77e6ce8b 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -40,6 +40,8 @@ TCGv_ptr get_fpstatus_ptr(bool);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
+                        bool tag_checked, int log2_size);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 27d4b4536c..ec12768dfc 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -358,3 +358,11 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
         memset(mem, tag_pair, tag_bytes);
     }
 }
+
+/*
+ * Perform an MTE checked access for a single logical or atomic access.
+ */
+uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    return ptr;
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f010aa2b58..683a8a3dba 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -221,20 +221,20 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 }
 
 /*
- * Return a "clean" address for ADDR according to TBID.
- * This is always a fresh temporary, as we need to be able to
- * increment this independently of a dirty write-back address.
+ * Handle MTE and/or TBI.
+ *
+ * For TBI, ideally, we would do nothing.  Proper behaviour on fault is
+ * for the tag to be present in the FAR_ELx register.  But for user-only
+ * mode, we do not have a TLB with which to implement this, so we must
+ * remote the top byte now.
+ *
+ * Always return a fresh temporary that we can increment independently
+ * of the write-back address.
  */
+
 static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
-    /*
-     * In order to get the correct value in the FAR_ELx register,
-     * we must present the memory subsystem with the "dirty" address
-     * including the TBI.  In system mode we can make this work via
-     * the TLB, dropping the TBI during translation.  But for user-only
-     * mode we don't have that option, and must remove the top byte now.
-     */
 #ifdef CONFIG_USER_ONLY
     gen_top_byte_ignore(s, clean, addr, s->tbid);
 #else
@@ -262,6 +262,45 @@ static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
     tcg_temp_free_i32(t_size);
 }
 
+/*
+ * For MTE, check a single logical or atomic access.  This probes a single
+ * address, the exact one specified.  The size and alignment of the access
+ * is not relevant to MTE, per se, but watchpoints do require the size,
+ * and we want to recognize those before making any other changes to state.
+ */
+static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
+                                      bool is_write, bool tag_checked,
+                                      int log2_size, bool is_unpriv,
+                                      int core_idx)
+{
+    if (tag_checked && s->mte_active[is_unpriv]) {
+        TCGv_i32 tcg_desc;
+        TCGv_i64 ret;
+        int desc = 0;
+
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, core_idx);
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << log2_size);
+        tcg_desc = tcg_const_i32(desc);
+
+        ret = new_tmp_a64(s);
+        gen_helper_mte_check1(ret, cpu_env, tcg_desc, addr);
+        tcg_temp_free_i32(tcg_desc);
+
+        return ret;
+    }
+    return clean_data_tbi(s, addr);
+}
+
+TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
+                        bool tag_checked, int log2_size)
+{
+    return gen_mte_check1_mmuidx(s, addr, is_write, tag_checked, log2_size,
+                                 false, get_mem_index(s));
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -2412,7 +2451,7 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size);
     tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memidx,
                                size | MO_ALIGN | s->be_data);
 }
@@ -2430,7 +2469,9 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+
+    /* This is a single atomic access, despite the "pair". */
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size + 1);
 
     if (size == 2) {
         TCGv_i64 cmp = tcg_temp_new_i64();
@@ -2555,7 +2596,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size);
         gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
         return;
 
@@ -2564,7 +2605,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, size);
         s->is_ldex = true;
         gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
         if (is_lasr) {
@@ -2584,7 +2625,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_check_sp_alignment(s);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2600,7 +2641,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, size);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -2614,7 +2655,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
+                                        true, rn != 31, size);
             gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
             return;
         }
@@ -2632,7 +2674,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (rn == 31) {
                 gen_check_sp_alignment(s);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
+                                        false, rn != 31, size);
             s->is_ldex = true;
             gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
             if (is_lasr) {
@@ -2926,6 +2969,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     bool iss_valid = !is_vector;
     bool post_index;
     bool writeback;
+    int memidx;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2983,7 +3027,11 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     if (!post_index) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, imm9);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+
+    memidx = is_unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    clean_addr = gen_mte_check1_mmuidx(s, dirty_addr, is_store,
+                                       writeback || rn != 31,
+                                       size, is_unpriv, memidx);
 
     if (is_vector) {
         if (is_store) {
@@ -2993,7 +3041,6 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
-        int memidx = is_unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
         bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
 
         if (is_store) {
@@ -3090,7 +3137,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     ext_and_shift_reg(tcg_rm, tcg_rm, opt, shift ? size : 0);
 
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = gen_mte_check1(s, dirty_addr, is_store, true, size);
 
     if (is_vector) {
         if (is_store) {
@@ -3175,7 +3222,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     dirty_addr = read_cpu_reg_sp(s, rn, 1);
     offset = imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, size);
 
     if (is_vector) {
         if (is_store) {
@@ -3268,7 +3315,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, size);
 
     if (o3_opc == 014) {
         /*
@@ -3345,7 +3392,8 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = gen_mte_check1(s, dirty_addr, false,
+                                is_wback || rn != 31, size);
 
     tcg_rt = cpu_reg(s, rt);
     do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
-- 
2.20.1
