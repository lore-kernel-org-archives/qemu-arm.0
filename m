Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087880lfc;
        Thu, 12 Mar 2020 12:42:59 -0700 (PDT)
X-Received: by 2002:a63:fd0f:: with SMTP id d15mr9091195pgh.26.1584042179385;
        Thu, 12 Mar 2020 12:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042179; cv=none;
        d=google.com; s=arc-20160816;
        b=p7XVcgzGUr/RGBvucti/NwOAC07T1/ze8g+OtyKxGaT6VEwbMd5j4bhw6+HTf9pUXv
         X5FEbOfSJSbzmJKy17g26NZuXMsqg6/XECGr2qsSOU2ueFz38k6Z3HQA2CndICrrbDHg
         cifsltFBxUTy0JvvSlCo3C+W4aD7+OyRSsDu1pAXi0rgjrIX8sMTjF9Iy2HCDlcomTj5
         EB12zEoHQWjgzg6g0fl45FWW8DC/RH+3cBTcU7Ckd2URjVf+ckh2bPb18w+V217Ki9MC
         N37DI95XNoIOaKyxoJ+cGCWac++6RV6MKrmJl8Axw/6O69nwgNN7QyW8nt9fQkOc7s2k
         4gvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4Zgn64d07+UFzKhr0znCC5cl8O2aEpkp4d53c1uLaxI=;
        b=yiRsCJazH1ViWRAl6e7mAyTcQ3utTl43aa+NnzpV1GZjTbbu6kB9vJMzu3wchPxNb+
         U7irNy2o/APPyRYGgZaOgwF+s9RyBYe8nmqLplgO9XGoxlTFJwI3hc+B9SzHR0ZmTXdo
         M7Ilz/7knPsQiRsyy0m0g9BoVSu4LJGwc/rrfHC0hxKyNmRACqwIJYk/1uMGuegRcf7r
         mIcKVDUL7P1ZfPL29uCNQmnc0NNaVOJJGerjYyYxj54Dd0nPJhmWhwY419S9p4pbDFdZ
         9d4LDaZ9tNrxWDRfnFAOCGBOqRHhxnmqKNy0oNK2F9ajtLbs/eJ6EZIrB6/Z9D2zq9SN
         MYeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSBRRxdF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e14sor7109052pfi.27.2020.03.12.12.42.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSBRRxdF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Zgn64d07+UFzKhr0znCC5cl8O2aEpkp4d53c1uLaxI=;
        b=jSBRRxdFx+8H7x7rxYfvZ+OBGlY65h3RHatJGFXfY/oPdNmoXB7G4wyXBQgNb3T3AD
         6yI7wAFLBVLYMiWpfNx+8lP1Bpsxh97hSg7lr8ELG1tZ8kUZo/InEx/+l0oYezUMzkvH
         8d9ZWDgys5sWHjqGqWtHmMKilXiXYT2OaNbXJXCFbMh+aMqXbzZOTeG0pc0LrD+y9kG+
         j9efijfKsK+hamb7XXHq7/7S6z72acAy6fDxRFSNxPgRlsuwoUAQI59tf6bRoGleJQp5
         VLGRkptRIHyuOYFS6Wfpd9SWLmRFtFP2iGn5C6Cn4H1JUcQ+3Wc7uXvZRw9B5ccDJi7n
         Hspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Zgn64d07+UFzKhr0znCC5cl8O2aEpkp4d53c1uLaxI=;
        b=OtExC16MeiQIV3CWvkwyRmSw589Xxg6yhPyo3IUjnd2lr1voNsGcgtmd3FpWcy12P8
         HHLRlI9NoogigWALFjqiB0ZSxDzw5gswGksAbrpeySkJZlthRXMwQ/aHR28rJTnM9eFh
         1t5E40aKkfdU9uQFlhHIcDf9jQuBttdKqiJGU4c1fKGvaNrS1daIhyb/Sz5PC+59mVbg
         SnTk/6wwBbU67tZtGOf2zdC61/avOW87uF1lZyeZ+d4JO6aHQAzfN2tZK/p1WqSaT/bH
         68so9TMCu4+sVbgW6guGYWG5tkz6JpRNHzK/VOspmDR+TU3a0+NfJYsqvAeCAepuGbo7
         jfjw==
X-Gm-Message-State: ANhLgQ27jD2bsR6Z58Mcu/LwaBCDI+bxgOcM4g9sUZQ3xEBnvcpk1/e7
	GWbrVxx/U40U8yHHSQKKHls1AzS7Kp9xZA==
X-Google-Smtp-Source: ADFU+vs8j4jzwLyPg5SZ3pMX1ji1pqwWtB7zLIP19HAmKvcBYC7C7C+8dZR4y2QDxjIMrZ5E1U3c1g==
X-Received: by 2002:aa7:98c9:: with SMTP id e9mr9587574pfm.204.1584042178425;
        Thu, 12 Mar 2020 12:42:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 28/42] target/arm: Use mte_checkN for sve unpredicated loads
Date: Thu, 12 Mar 2020 12:42:05 -0700
Message-Id: <20200312194219.24406-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +wQCLcmMJnWa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 +
 target/arm/sve_helper.c    | 74 ++++++++++++++++++++++++++++--
 target/arm/translate-sve.c | 93 ++++++++++++++++----------------------
 3 files changed, 110 insertions(+), 59 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2f47279155..82ea70cf63 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1123,6 +1123,8 @@ DEF_HELPER_FLAGS_5(sve_ftmad_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_ldr, TCG_CALL_NO_WG, void, env, ptr, tl, int)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 80453953ad..ede72a2989 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3967,10 +3967,6 @@ void HELPER(sve_fcmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
     } while (i != 0);
 }
 
-/*
- * Load contiguous data, protected by a governing predicate.
- */
-
 /*
  * Load elements into @vd + @reg_off, from @host,
  * or the reverse for stores.
@@ -4194,6 +4190,76 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
     return true;
 }
 
+/*
+ * Load contiguous data, unpredicated.
+ *
+ * Note that unpredicated load/store of vector/predicate registers
+ * are defined as a stream of bytes, which equates to little-endian
+ * operations on larger quantities.
+ *
+ * Note any MTE check is already handled.
+ */
+
+void HELPER(sve_ldr)(CPUARMState *env, void *vd, target_ulong addr, int size)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    int in_page = -((int)addr | TARGET_PAGE_MASK);
+    uintptr_t ra = GETPC();
+    uint64_t val;
+    int i;
+
+    /* Small loads are expanded inline. */
+    tcg_debug_assert(size > 2 * 8);
+
+    /* Bulk copy the data from memory to the register. */
+    if (likely(size <= in_page)) {
+        void *host = probe_read(env, addr, size, mmu_idx, ra);
+
+        if (unlikely(!host)) {
+            goto mmio;
+        }
+        memcpy(vd, host, size);
+    } else {
+        void *h1 = probe_read(env, addr, in_page, mmu_idx, ra);
+        void *h2 = probe_read(env, addr + in_page, size - in_page, mmu_idx, ra);
+
+        if (unlikely(!h1 || !h2)) {
+            goto mmio;
+        }
+        memcpy(vd, h1, in_page);
+        memcpy(vd + in_page, h2, size - in_page);
+    }
+
+    /* Predicate load length may be any multiple of 2; ensure high bits 0. */
+    if (unlikely(size & 7)) {
+        memset(vd + size, 0, 8 - (size & 7));
+    }
+
+    /*
+     * The memcpy and memset above kept the bytes in memory order.
+     * The in-register format has uint64_t in host order, so for
+     * big-endian host we need to bswap.
+     */
+    for (i = 0; i < size; i += 8) {
+        le64_to_cpus(vd + i);
+    }
+    return;
+
+ mmio:
+    for (i = 0; i + 8 <= size; i += 8) {
+        val = cpu_ldq_data_ra(env, addr + i, ra);
+        val = le_bswap64(val);
+        *(uint64_t *)(vd + i) = val;
+    }
+
+    /* Predicate load length may be any multiple of 2. */
+    if (unlikely(i != size)) {
+        val = cpu_ldq_data_ra(env, addr + i, ra);
+        val = le_bswap64(val);
+        val >>= (size - i) * 8;
+        *(uint64_t *)(vd + i + 8) = val;
+    }
+}
 
 /*
  * Analyse contiguous data, protected by a governing predicate.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7bd7de80e6..e55f8835bb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4352,8 +4352,13 @@ static bool trans_UCVTF_dd(DisasContext *s, arg_rpr_esz *a)
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
 
-/* Subroutine loading a vector register at VOFS of LEN bytes.
+/*
+ * Subroutine loading a vector register at VOFS of LEN bytes.
  * The load should begin at the address Rn + IMM.
+ *
+ * Note that unpredicated load/store of vector/predicate registers
+ * are defined as a stream of bytes, which equates to little-endian
+ * operations on larger quantities.
  */
 
 static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
@@ -4362,81 +4367,59 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     int len_remain = len % 8;
     int nparts = len / 8 + ctpop8(len_remain);
     int midx = get_mem_index(s);
-    TCGv_i64 addr, t0, t1;
+    TCGv_i64 dirty_addr, clean_addr, t0, t1;
+    int i;
 
-    addr = tcg_temp_new_i64();
-    t0 = tcg_temp_new_i64();
+    dirty_addr = read_cpu_reg_sp(s, rn, true);
+    tcg_gen_addi_i64(dirty_addr, dirty_addr, imm);
 
-    /* Note that unpredicated load/store of vector/predicate registers
-     * are defined as a stream of bytes, which equates to little-endian
-     * operations on larger quantities.  There is no nice way to force
-     * a little-endian load for aarch64_be-linux-user out of line.
-     *
-     * Attempt to keep code expansion to a minimum by limiting the
-     * amount of unrolling done.
-     */
-    if (nparts <= 4) {
-        int i;
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
 
-        for (i = 0; i < len_align; i += 8) {
-            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
-            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
-            tcg_gen_st_i64(t0, cpu_env, vofs + i);
-        }
-    } else {
-        TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+    /* Limit tcg code expansion by doing large loads out of line. */
+    if (nparts > 4) {
+        TCGv_ptr t_rd = tcg_temp_new_ptr();
+        TCGv_i32 t_len = tcg_const_i32(len);
 
-        gen_set_label(loop);
-
-        /* Minimize the number of local temps that must be re-read from
-         * the stack each iteration.  Instead, re-compute values other
-         * than the loop counter.
-         */
-        tp = tcg_temp_new_ptr();
-        tcg_gen_addi_ptr(tp, i, imm);
-        tcg_gen_extu_ptr_i64(addr, tp);
-        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
-
-        tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
-
-        tcg_gen_add_ptr(tp, cpu_env, i);
-        tcg_gen_addi_ptr(i, i, 8);
-        tcg_gen_st_i64(t0, tp, vofs);
-        tcg_temp_free_ptr(tp);
-
-        tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
-        tcg_temp_free_ptr(i);
+        tcg_gen_addi_ptr(t_rd, cpu_env, vofs);
+        gen_helper_sve_ldr(cpu_env, t_rd, clean_addr, t_len);
+        tcg_temp_free_ptr(t_rd);
+        tcg_temp_free_i32(t_len);
+        return;
     }
 
-    /* Predicate register loads can be any multiple of 2.
-     * Note that we still store the entire 64-bit unit into cpu_env.
+    t0 = tcg_temp_new_i64();
+    for (i = 0; i < len_align; i += 8) {
+        tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
+        tcg_gen_st_i64(t0, cpu_env, vofs + i);
+        tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+    }
+
+    /*
+     * Predicate register loads can be any multiple of 2.
+     * Note that we still store the entire 64-bit unit into cpu_env
+     * so that the high bits are zeroed.
      */
     if (len_remain) {
-        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
-
         switch (len_remain) {
         case 2:
-        case 4:
-        case 8:
-            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUW);
+            break;
+        case 4:
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL);
             break;
-
         case 6:
             t1 = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEUL);
-            tcg_gen_addi_i64(addr, addr, 4);
-            tcg_gen_qemu_ld_i64(t1, addr, midx, MO_LEUW);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 4);
+            tcg_gen_qemu_ld_i64(t1, clean_addr, midx, MO_LEUW);
             tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
             tcg_temp_free_i64(t1);
             break;
-
         default:
             g_assert_not_reached();
         }
         tcg_gen_st_i64(t0, cpu_env, vofs + len_align);
     }
-    tcg_temp_free_i64(addr);
     tcg_temp_free_i64(t0);
 }
 
-- 
2.20.1
