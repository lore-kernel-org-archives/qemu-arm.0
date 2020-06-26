Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp53348lfm;
        Thu, 25 Jun 2020 20:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8op9+U95XxeuJBQZgGhFIamU6lhju2wqnHCt0Sosw1WTQj+vOZ7bkMx/FbzB3kBiHFU9Z
X-Received: by 2002:a25:e8b:: with SMTP id 133mr1747046ybo.13.1593142994844;
        Thu, 25 Jun 2020 20:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142994; cv=none;
        d=google.com; s=arc-20160816;
        b=FeyUgP5Hs5Hb7ceLaQa2bzFZzRBdgZOS6D0b+UftUxK9VvIZi07bPdHHpMuiblVu7L
         yoBkgzXEVeuK+/Lm0yPMMYWsZEkDhjdbSA3I4VddbCThm7lANSxpDxaRFVvhKUG9LwkA
         b/cqbG+yokl9/bndQWzzkvTppqvDWCuWt19y0cHzyAZFakTC+6XeLflMPVK5FQxQQZwN
         1kGwZu29+RG+5urEK2HPdey06EO6oFprT1l4oCN6vJtin7m0cfhbQMRqvjBlUf5ouXd3
         JEKnXWKgVMEt1TSzz4+jbfDHaaFRFR99eoGpiP2XDcnGujRZZ1SKucAiG9VFrGqxz6Pz
         MRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=opU7qvGQgsJmU81/QyV++/QDOyWp+6uKIJELkWkGvDs=;
        b=iM3bwP8CHKqRpAjxQD6mQsQVWnKjvAiFkN8irr5YGFRfUDWmzIIwrBIf5OxZ+oD9z3
         vE56lveSEtnjTLaTlgzwCYmEKqXgLiHCXllNmLyG8Ne+DS1qqRcsbGgaV2bNuNVm1klk
         osBB/tYHBY2o5irO93riWp5UWgbhC26eCfjfKX23zmM2Kr2vEAe72mNwTcFrX0NZk5a/
         320VASGQ4PSwtRUa/PvXAOQc26oGWchMDht1CfKOPhCAoxTBdXPaXW7nCVw3VIiaGL3x
         tzvOeXPGYCIpo3R2oY948BZtZOZFIfLG3cCmAwA3Uj7WUAp4ZWpTnsIJEk27TVZr9jlZ
         fVNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zkouGSkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k136si3488195ybk.342.2020.06.25.20.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zkouGSkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofGk-0003nI-73
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6D-0000Nk-Mg
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:21 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6B-0001vn-H9
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:21 -0400
Received: by mail-pg1-x532.google.com with SMTP id d194so985092pga.13
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=opU7qvGQgsJmU81/QyV++/QDOyWp+6uKIJELkWkGvDs=;
 b=zkouGSklCj3nZZtALGftYCxm77feH5NCv8s3YIiIELHPRR54IzryTW1nHF7r44w1/U
 V6dunbBWy9c5DU2ZNWCP37lV6UMLtywrtc6kaLUpty9TOPLH81Ume4fGv1OuOfKsapS6
 FZTz/AYTHTm+Yv3mTJDcrzb7JF2uAoh3aOTfEdlEiy0pL5/c93XFWjIKYYE9rHriuc8X
 HCcUAtVHbtTs4IAtdq+MXAfOEI35TG17Zjh3bUjG1R4wRy19qSbBjJvu+mgWIHsNtQKl
 LU6Ke9JAdJ2u5yqGSg8Hx5IZpO1mDVi3ySCbkV49qNUd0mwa+c67+hLTLVdXhCELAFub
 HMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=opU7qvGQgsJmU81/QyV++/QDOyWp+6uKIJELkWkGvDs=;
 b=psHLm9yaCi4esJb1tOIcsucM2a1o6+0SgWWmaKJo9yzpDl+ACP4OzMPhU635A6w8Bg
 v1j8hZOe59feM/FSVGfBF8r/tkAR5hmZT6AVN1yI6L6OFil4MRLSVIVOX5KCyHzmjK8Q
 tCUMZ6+LF7b0KEKwerFGKZGROrBo4lLNLa0keF7/zS0cFLOrJPnVn/IutW2eNXPRqY8c
 UGo4nQkX1z0kwYJfE4PBqhkgMyBxWIffdT8LNGySxR7HDzXQYeSpFCb9xG/oO6bbyyCN
 lTLsHjTDTfDtyaFEHETeZxucro0ls90zot2A/VNaLk+aKejPI5uGr/tyXh1kdL7bOJTJ
 J7ZA==
X-Gm-Message-State: AOAM532lqAFJmnyeNK6IJZOW3/CylWzbYvJ4hto59cvGhZV76U1TFvF1
 vuiCdWIbSmb+RnoGfGTptFE13Q==
X-Received: by 2002:a63:9201:: with SMTP id o1mr833121pgd.99.1593142338207;
 Thu, 25 Jun 2020 20:32:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 24/46] target/arm: Add gen_mte_checkN
Date: Thu, 25 Jun 2020 20:31:22 -0700
Message-Id: <20200626033144.790098-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jQ9d4gAYsPx1

Replace existing uses of check_data_tbi in translate-a64.c that
perform multiple logical memory access.  Leave the helper blank
for now to reduce the patch size.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index daab6a9666..781c441399 100644
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
index 4d0453c895..52be0400d7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -284,6 +284,34 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
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
@@ -2848,7 +2876,10 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
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
@@ -3514,7 +3545,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
     MemOp endian = s->be_data;
 
-    int ebytes;   /* bytes per element */
+    int total;    /* total bytes */
     int elements; /* elements per vector */
     int rpt;    /* num iterations */
     int selem;  /* structure elements */
@@ -3584,19 +3615,26 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
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
@@ -3630,7 +3668,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
 
     if (is_postidx) {
         if (rm == 31) {
-            tcg_gen_addi_i64(tcg_rn, tcg_rn, rpt * elements * selem * ebytes);
+            tcg_gen_addi_i64(tcg_rn, tcg_rn, total);
         } else {
             tcg_gen_add_i64(tcg_rn, tcg_rn, cpu_reg(s, rm));
         }
@@ -3676,7 +3714,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int selem = (extract32(opc, 0, 1) << 1 | R) + 1;
     bool replicate = false;
     int index = is_q << 3 | S << 2 | size;
-    int ebytes, xs;
+    int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
 
     if (extract32(insn, 31, 1)) {
@@ -3730,16 +3768,17 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
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
@@ -3766,7 +3805,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     if (is_postidx) {
         if (rm == 31) {
-            tcg_gen_addi_i64(tcg_rn, tcg_rn, selem * ebytes);
+            tcg_gen_addi_i64(tcg_rn, tcg_rn, total);
         } else {
             tcg_gen_add_i64(tcg_rn, tcg_rn, cpu_reg(s, rm));
         }
-- 
2.25.1

