Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087753lfc;
        Thu, 12 Mar 2020 12:42:54 -0700 (PDT)
X-Received: by 2002:a17:902:d915:: with SMTP id c21mr9575441plz.239.1584042174019;
        Thu, 12 Mar 2020 12:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042174; cv=none;
        d=google.com; s=arc-20160816;
        b=muQeh36XtRcEHAkdH/97BCS9lL/9tFxSaM3ZH0PVL95OO7AlpOszpwU6MJVisngtG9
         oo/xAfAM9hBgb09XeFmNBrG+j4xFaozUbfANmBul8pW4VpnQM67WbsHvCNmH4K+LMGPf
         y/hrUUfbvf3Ej87nmIsOyoCo59Uqn5jiDtLQpmWelAHBwcB9OJtWYZKcUjek/7fVYcdk
         LeYRe+ejBb5OJRbjiI2oZH8l4ZRZq4lYpImYctOKRIPAAreftaQ+YDGx8pcFATmwZzTV
         jjWAmGr2zf2yjtr7d+l4bN0vCj6nZp6dL6cmpeiOvKvh4hugdCRyPkxPB1usID5U2CxY
         RW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VrNJWtbNYR04xVfCscKaMniKIGIvli/mwQv8Bqsi+6U=;
        b=dpIRy72G9q0tW1VoqFQBxvvQzs4hxCnOdxR2lYa7b9ZxPMaE/wI6+gxpTx3ASRI1kc
         M7rgzQVQuq4BDbqMUIp14jXbmdM8HyiJlaRQOqjtgRUykyOUcdv8rM8lzm28axTjE6Ja
         hpGohU5jpQq3GlfrJg93yud9VwmmPr+umPECVoF1Ui5UZMxgynMW8j53eBpYLk5WA5dv
         hhZUE4Ih4aV9aYrS6rh1nyM/d6o+RRVHCWtZeRQMRB2GiM9d5SpgK/OEZwx8hUXuwWpn
         QQvx4JGNwC0vDAWbFg45mNNMnnO9O+2QN8ndv7oeur0W9/z1Bg456zneD1J2lhPjWDWZ
         W1Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQB23GnC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i4sor6836565pjs.26.2020.03.12.12.42.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQB23GnC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VrNJWtbNYR04xVfCscKaMniKIGIvli/mwQv8Bqsi+6U=;
        b=bQB23GnC8RsFCyIQf8D57QMT8ZGW5WIeRbZz1WdFXBfsYgtLiGNPN2VqPukJzI9SQU
         LCYDOWbuQzfE3IKueuw97P1PeMPkrMk04ZwTKMEuBYgooazXPWVGwSY2jnTjTZWoReMO
         oJU+XVyXjf4Dz7XuKcbu7OKu9rub4j4YU3p+nWbENgxH0AQLKVCgmdXD1PhlFPHq1bzQ
         QhMk7m1I1ditlErnEHvRv0TdsJjIdcita1Ql07SYcOmWu2WXUAFxdPUzXCDxXjgJArk0
         c23vLb5KIDazAaR+jISPRn/iAzNmIZfJk/BLiXiEsxv/lbSU5KzM4/H1gYAIP5AatAOW
         o5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VrNJWtbNYR04xVfCscKaMniKIGIvli/mwQv8Bqsi+6U=;
        b=HsV7tngVBwVxidIbEuVG0MfH+Ze6Or0a6sTYSNR/SR6PB1DzbWLLUOw7H0tMjIAetW
         rsoJjfeVzW2BoYorvBoFAn1HHOa1O9EUnPRhQ+aRcxACoqi6fNzXPPotfKtTYKGcgycn
         Vye6fZozLdZQFePFR00369I1WxoiB04h/z0/lmTXuhp08S/dZu9IZlKUV9Rh5hRKN/Go
         UM95wh45vl+B9H2pMMT3Oz3V/0sEGV1zRmlxUFUIVtpc4Jiq/fzIDfzvo2r28w5MVDpR
         /xa5zRRarn2HsZs0YhsDhC7qvhi3QcsFUsd+l1sacQ9JpL6tMni4vj2Yf7B+gIHa/Iev
         m/wA==
X-Gm-Message-State: ANhLgQ38H0efzT2rBVb2oqMRUkHFKHpPCrfy5SARAemy7o5gL9eJltwm
	9k9kjAsBTCsQljGxmjTedhE3lmXP
X-Google-Smtp-Source: ADFU+vv/OEzPKfch7WsF2Rfjks3h2xOV/IB0ak/uuAgL6uoyL7zSQJm3CrHnh2dVO0I3pxGdyhRvNQ==
X-Received: by 2002:a17:902:778c:: with SMTP id o12mr9786734pll.324.1584042173317;
        Thu, 12 Mar 2020 12:42:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 24/42] target/arm: Add gen_mte_checkN
Date: Thu, 12 Mar 2020 12:42:01 -0700
Message-Id: <20200312194219.24406-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qxLWOql7pKbm

Replace existing uses of check_data_tbi in translate-a64.c that
perform multiple logical memory access.  Leave the helper blank
for now to reduce the patch size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  1 +
 target/arm/translate-a64.h |  2 ++
 target/arm/mte_helper.c    |  8 +++++
 target/arm/translate-a64.c | 71 +++++++++++++++++++++++++++++---------
 4 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 2faa49d0a3..005af678c7 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -105,6 +105,7 @@ DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_3(mte_check1, TCG_CALL_NO_WG, i64, env, i32, i64)
+DEF_HELPER_FLAGS_3(mte_checkN, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
 DEF_HELPER_FLAGS_3(ldg, TCG_CALL_NO_WG, i64, env, i64, i64)
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index cc77e6ce8b..452b4764d0 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -42,6 +42,8 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
 bool sve_access_check(DisasContext *s);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
+TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
+                        bool tag_checked, int count, int log2_esize);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index ec12768dfc..907a12b366 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -366,3 +366,11 @@ uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     return ptr;
 }
+
+/*
+ * Perform an MTE checked access for multiple logical accesses.
+ */
+uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    return ptr;
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 683a8a3dba..c6187ccd60 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -301,6 +301,34 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                                  false, get_mem_index(s));
 }
 
+/*
+ * For MTE, check multiple logical sequential accesses.  
+ */
+TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
+                        bool tag_checked, int log2_esize, int total_size)
+{
+    if (tag_checked && s->mte_active[0] && total_size != (1 << log2_esize)) {
+        TCGv_i32 tcg_desc;
+        TCGv_i64 ret;
+        int desc = 0;
+
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << log2_esize);
+        desc = FIELD_DP32(desc, MTEDESC, TSIZE, total_size);
+        tcg_desc = tcg_const_i32(desc);
+
+        ret = new_tmp_a64(s);
+        gen_helper_mte_checkN(ret, cpu_env, tcg_desc, addr);
+        tcg_temp_free_i32(tcg_desc);
+
+        return ret;
+    }
+    return gen_mte_check1(s, addr, is_write, tag_checked, log2_esize);
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -2889,7 +2917,10 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         }
     }
 
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = gen_mte_checkN(s, dirty_addr, !is_load,
+                                (wback || rn != 31) && !set_tag,
+                                size, 2 << size);
+
     if (is_vector) {
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, size);
@@ -3555,7 +3586,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
     MemOp endian = s->be_data;
 
-    int ebytes;   /* bytes per element */
+    int total;    /* total bytes */
     int elements; /* elements per vector */
     int rpt;    /* num iterations */
     int selem;  /* structure elements */
@@ -3625,19 +3656,26 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
         endian = MO_LE;
     }
 
-    /* Consecutive little-endian elements from a single register
+    total = rpt * selem * (is_q ? 16 : 8);
+    tcg_rn = cpu_reg_sp(s, rn);
+
+    /*
+     * Issue the MTE check vs the logical repeat count, before we
+     * promote consecutive little-endian elements below.
+     */
+    clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
+                                size, total);
+
+    /*
+     * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
     if (selem == 1 && endian == MO_LE) {
         size = 3;
     }
-    ebytes = 1 << size;
-    elements = (is_q ? 16 : 8) / ebytes;
-
-    tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
-    tcg_ebytes = tcg_const_i64(ebytes);
+    elements = (is_q ? 16 : 8) >> size;
 
+    tcg_ebytes = tcg_const_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
         for (e = 0; e < elements; e++) {
@@ -3671,7 +3709,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
 
     if (is_postidx) {
         if (rm == 31) {
-            tcg_gen_addi_i64(tcg_rn, tcg_rn, rpt * elements * selem * ebytes);
+            tcg_gen_addi_i64(tcg_rn, tcg_rn, total);
         } else {
             tcg_gen_add_i64(tcg_rn, tcg_rn, cpu_reg(s, rm));
         }
@@ -3717,7 +3755,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int selem = (extract32(opc, 0, 1) << 1 | R) + 1;
     bool replicate = false;
     int index = is_q << 3 | S << 2 | size;
-    int ebytes, xs;
+    int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
 
     if (extract32(insn, 31, 1)) {
@@ -3771,16 +3809,17 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         return;
     }
 
-    ebytes = 1 << scale;
-
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
 
+    total = selem << scale;
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
-    tcg_ebytes = tcg_const_i64(ebytes);
 
+    clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
+                                scale, total);
+
+    tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
         if (replicate) {
             /* Load and replicate to all elements */
@@ -3807,7 +3846,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     if (is_postidx) {
         if (rm == 31) {
-            tcg_gen_addi_i64(tcg_rn, tcg_rn, selem * ebytes);
+            tcg_gen_addi_i64(tcg_rn, tcg_rn, total);
         } else {
             tcg_gen_add_i64(tcg_rn, tcg_rn, cpu_reg(s, rm));
         }
-- 
2.20.1
