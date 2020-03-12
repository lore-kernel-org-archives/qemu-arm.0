Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087907lfc;
        Thu, 12 Mar 2020 12:43:00 -0700 (PDT)
X-Received: by 2002:a17:90b:8cf:: with SMTP id ds15mr5121923pjb.153.1584042180639;
        Thu, 12 Mar 2020 12:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042180; cv=none;
        d=google.com; s=arc-20160816;
        b=eeYcYpGIfXv0cC+iVDYDGmWPkKtR+5P1kfvmm2HrKZUFe/o16HKDKs/Mm1/+QdkQWJ
         agJzgns0W2Xuq8NH62JnNmctSWyXubeDUSNgKGusysoaPyc+eIGL9+m759Y9LEOidv08
         BEQgFyHBYgHC/Mukv7DBAYAe8rgn6RSiNlBAlNq+sE2wnuxPFnrKrQc3loE64lR1SlJD
         jVIoxwbqsJAOQiXKxXd8JfrMxEZsgr5Yz70QkkQBI9FTvaSRpuhCzW/JVLyJW9ihtlCx
         KbEZtMR0/UnXiQqDV0E51rr2P8d+MY2eVhAU+YKs3nVm52wkj5PfJUFZRm1StpWOJPrP
         RIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QJvhSRp707cxdamQl0vVDLxpjNb38jwO6L+jNT02qis=;
        b=ZRvteLLnXHyC8S4b+6uh84UNHNtN7w99l+RxguGZSOmfedVilK5qBaoULOQVbwCu6G
         tkBadQEwLSieLdndGk6WBFVgA+roxT/RHnHxq7zyaBPwL4GgLqHAHakhWXcc9AqMDfgs
         UKRMPk9Hm6lq/we7BZ4FdGOHm28eAXe/SoWfKP09KEhvcGEvAoHKmFpMjZArqZRAAX9q
         SPIgUOvxP1WB37WnsHvEIkHMK29W6TWnyKG3wu6Wj0SGdsOPJRRXqQ8bGfcgES4e3xLm
         pptzLxJch4x6BJtukYrqwMCCYp/akeSp9mtOzpCV36aAfLQbilNfOVHW+UX3xkV6oK/6
         T1IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Htm7rd1q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q127sor7105556pfq.38.2020.03.12.12.43.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Htm7rd1q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QJvhSRp707cxdamQl0vVDLxpjNb38jwO6L+jNT02qis=;
        b=Htm7rd1qhbD8wYpn5xGztYpEq7moH6Jqt1IzRBbiBRgtuNx6WRyILUK157ppeHE11z
         Ntq3SN/Mx+rNPDIH7aP7HoowgFWkZvaidtuf7SAyJ7gd7Duns+0n9KNCTJAwiAtMlmdT
         P2AuJ8hxcGowmVL0H+ZMvv5REOrgO5E+0vSgMKVTQ5R5LOalwjkw9MYBegqfUdGbvCIx
         n4BUVwtAnUMqp4gwyrr1xJwpWBc3ETjt0+MoXvkZgU41btzfrAD7tH93PxZGikxW/lxJ
         6ViOLGedLDXtWkYtdHM9TsDZHJFfBTarLgN8ssPXDz8enlXnG/uZk1qR8WBYv1Pj98Zi
         Pekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QJvhSRp707cxdamQl0vVDLxpjNb38jwO6L+jNT02qis=;
        b=pHM82+mIg8Co8tnQ80au91xGfkFX0+KVgj8b50yf2d3AGLWOKh1F/fJ+bGcuNFBGyG
         VyNMUc9Iirpu7nHHzCz623fzLZvCg6CoahHWJO19CDFr4yCaOY7z7R7fx1xeDcsgImDF
         Ja20xc6+JVXAqfYizd0MlQRLUpUgYHuLR17h+SpA672Ulg/3+CpsQT+z81zjU1ZaFmPO
         jCMiK/k/KhJ2TVzeEw5EScl1aOTomPOFQw8mvMoT613cSSpJex2nYk9f/dGScdwoBRWN
         R8ORWFj+qQNMNp6kXuMd3LIu7IV9bEgWM35+tEfbfbfIKzD7q4TzXQqPvq4CWIPgUgvF
         waZA==
X-Gm-Message-State: ANhLgQ3R9Sw99Ljy7gwrvDkidLJQnQe84EgA9lfphfTl0i2NOoVFE+eA
	fjCG10foIsOjQbEXyd+MRP9tDcCZRhQDbQ==
X-Google-Smtp-Source: ADFU+vuTJzcTioii6xrC8Sx0g8tv+L/giG2Iml54SBRGew7tYRXGyHeSXVM1pQghu8G39Rarzzs3VQ==
X-Received: by 2002:a62:16d2:: with SMTP id 201mr7235600pfw.295.1584042180076;
        Thu, 12 Mar 2020 12:43:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 29/42] target/arm: Use mte_checkN for sve unpredicated stores
Date: Thu, 12 Mar 2020 12:42:06 -0700
Message-Id: <20200312194219.24406-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5UdokA8k56v8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  1 +
 target/arm/sve_helper.c    | 63 ++++++++++++++++++++++++++-
 target/arm/translate-sve.c | 88 ++++++++++++++------------------------
 3 files changed, 94 insertions(+), 58 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 82ea70cf63..4e71501838 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1124,6 +1124,7 @@ DEF_HELPER_FLAGS_5(sve_ftmad_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_ldr, TCG_CALL_NO_WG, void, env, ptr, tl, int)
+DEF_HELPER_FLAGS_4(sve_str, TCG_CALL_NO_WG, void, env, ptr, tl, int)
 
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ede72a2989..2396737420 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4191,7 +4191,7 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
 }
 
 /*
- * Load contiguous data, unpredicated.
+ * Load/store contiguous data, unpredicated.
  *
  * Note that unpredicated load/store of vector/predicate registers
  * are defined as a stream of bytes, which equates to little-endian
@@ -4261,6 +4261,67 @@ void HELPER(sve_ldr)(CPUARMState *env, void *vd, target_ulong addr, int size)
     }
 }
 
+void HELPER(sve_str)(CPUARMState *env, void *vd, target_ulong addr, int size)
+{
+    int mem_idx = cpu_mmu_index(env, false);
+    int in_page = -((int)addr | TARGET_PAGE_MASK);
+    uintptr_t ra = GETPC();
+    uint64_t val;
+    void *host;
+    int i;
+
+    /* Small stores are expanded inline. */
+    tcg_debug_assert(size > 2 * 8);
+
+    if (likely(size <= in_page)) {
+        host = probe_write(env, addr, size, mem_idx, ra);
+        if (likely(host != NULL)) {
+            for (i = 0; i + 8 <= size; i += 8) {
+                stq_le_p(host + i, *(uint64_t *)(vd + i));
+            }
+
+            /* Predicate load length may be any multiple of 2. */
+            if (unlikely(i != size)) {
+                val = *(uint64_t *)(vd + i);
+                if (size & 4) {
+                    stl_le_p(host + i, val);
+                    i += 4;
+                    val >>= 32;
+                }
+                if (size & 2) {
+                    stw_le_p(host + i, val);
+                }
+            }
+            return;
+        }
+    } else {
+        (void)probe_write(env, addr, in_page, mem_idx, ra);
+        (void)probe_write(env, addr + in_page, size - in_page, mem_idx, ra);
+    }
+
+    /*
+     * Note there is no endian-specific target store function, so to handle
+     * aarch64_be-linux-user we need to bswap the big-endian store.
+     */
+    for (i = 0; i + 8 <= size; i += 8) {
+        val = *(uint64_t *)(vd + i);
+        cpu_stq_data_ra(env, addr + i, le_bswap64(val), ra);
+    }
+
+    /* Predicate load length may be any multiple of 2. */
+    if (unlikely(i != size)) {
+        val = *(uint64_t *)(vd + i);
+        if (size & 4) {
+            cpu_stl_data_ra(env, addr + i, le_bswap32(val), ra);
+            i += 4;
+            val >>= 32;
+        }
+        if (size & 2) {
+            cpu_stw_data_ra(env, addr + i, le_bswap16(val), ra);
+        }
+    }
+}
+
 /*
  * Analyse contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e55f8835bb..49d2e68564 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4430,78 +4430,52 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     int len_remain = len % 8;
     int nparts = len / 8 + ctpop8(len_remain);
     int midx = get_mem_index(s);
-    TCGv_i64 addr, t0;
+    TCGv_i64 dirty_addr, clean_addr, t0;
+    int i;
+
+    dirty_addr = read_cpu_reg_sp(s, rn, true);
+    tcg_gen_addi_i64(dirty_addr, dirty_addr, imm);
+
+    clean_addr = gen_mte_checkN(s, dirty_addr, true, rn != 31, len, MO_8);
+
+    /* Limit tcg code expansion by doing large loads out of line. */
+    if (nparts > 4) {
+        TCGv_ptr t_rd = tcg_temp_new_ptr();
+        TCGv_i32 t_len = tcg_const_i32(len);
+
+        tcg_gen_addi_ptr(t_rd, cpu_env, vofs);
+        gen_helper_sve_str(cpu_env, t_rd, clean_addr, t_len);
+        tcg_temp_free_ptr(t_rd);
+        tcg_temp_free_i32(t_len);
+        return;
+    }
 
-    addr = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
-
-    /* Note that unpredicated load/store of vector/predicate registers
-     * are defined as a stream of bytes, which equates to little-endian
-     * operations on larger quantities.  There is no nice way to force
-     * a little-endian store for aarch64_be-linux-user out of line.
-     *
-     * Attempt to keep code expansion to a minimum by limiting the
-     * amount of unrolling done.
-     */
-    if (nparts <= 4) {
-        int i;
-
-        for (i = 0; i < len_align; i += 8) {
-            tcg_gen_ld_i64(t0, cpu_env, vofs + i);
-            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
-        }
-    } else {
-        TCGLabel *loop = gen_new_label();
-        TCGv_ptr t2, i = tcg_const_local_ptr(0);
-
-        gen_set_label(loop);
-
-        t2 = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(t2, cpu_env, i);
-        tcg_gen_ld_i64(t0, t2, vofs);
-
-        /* Minimize the number of local temps that must be re-read from
-         * the stack each iteration.  Instead, re-compute values other
-         * than the loop counter.
-         */
-        tcg_gen_addi_ptr(t2, i, imm);
-        tcg_gen_extu_ptr_i64(addr, t2);
-        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
-        tcg_temp_free_ptr(t2);
-
-        tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
-
-        tcg_gen_addi_ptr(i, i, 8);
-
-        tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
-        tcg_temp_free_ptr(i);
+    for (i = 0; i < len_align; i += 8) {
+        tcg_gen_ld_i64(t0, cpu_env, vofs + i);
+        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+        tcg_gen_addi_i64(clean_addr, clean_addr, 8);
     }
 
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain) {
         tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
-        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
-
         switch (len_remain) {
-        case 2:
-        case 4:
-        case 8:
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
-            break;
-
         case 6:
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUL);
-            tcg_gen_addi_i64(addr, addr, 4);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_shri_i64(t0, t0, 32);
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUW);
+            /* fall through */
+        case 2:
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW);
+            break;
+        case 4:
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL);
             break;
-
         default:
             g_assert_not_reached();
         }
     }
-    tcg_temp_free_i64(addr);
     tcg_temp_free_i64(t0);
 }
 
-- 
2.20.1
