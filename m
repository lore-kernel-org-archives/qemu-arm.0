Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp35222lfc;
        Tue, 2 Jun 2020 18:21:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyycjSY+HBhgmEdpC2CyWSJ8RU3BUfTWu82MTHkAU+iiWCwyC3y0EVh4TZK4D0a0i5axFr7
X-Received: by 2002:a5b:305:: with SMTP id j5mr41778656ybp.89.1591147295850;
        Tue, 02 Jun 2020 18:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147295; cv=none;
        d=google.com; s=arc-20160816;
        b=CIVWVA+I+vgSy45KkbFue3QU1qitgj+xvusfAcrxrMnhX1T9DDtQWb0Z+Nb1tL79NL
         TOtDM2SMEkNGOYXykDqA3Z/qxl0/yKyNsPPFHXjUdPGmxFJwLHvRi/7fQHtz5RGm42dK
         wL550Gwj+F8LQot173q508YhRNPyz73qsyEj9bK6P31EwdcCgJOy6Il5uGJpb3WZkYcm
         ekhdAP+jL2bi28h/PnbRaat9QhYfFFrWFA9HxIrXhP7onOLuPijXfRc/kdJYnouHICTN
         hyRnrbulNFDE3dqx60R4v03r/9gV4zlTue3N0ScxNFR5HvOBj5Jx0J04qozWmFS/1bfv
         i9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Mw9HZ5O96PBG/BuNXk71tQFvBrPmiee6xG1sg1z+/Y=;
        b=Ape36/N/bJB1K05ALunTgP5MHWbzAPEZaOpuno9wcP94GCSk0dsh8Rc0uxED66P7zT
         to87heucvp2sFTJ1XFWhjMjOZZGyarVRQgrd9+aKC9K4u9WjQFXvxqZvghAPx/Ngu020
         wtj+GeCk2N5lF3HTmxdG+AxrDr1C3ahY1bwwA1oyVwysJ11HuDHmR56WM7pA/NOIVgBr
         p2mCM0lrSx3c3xqDd12pLNDpYJ4z81SYblR20t9uD4cbCw5oB9EJ6IHyZQiJxAu5NorW
         ZVkb6c1z9OV5bXRibObxmp6CutnemviIVeEpFT32ilToQPq8dTa1RMgsboCXAJphjiCN
         Kvrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HtWNy+DI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si311167ybu.422.2020.06.02.18.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HtWNy+DI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI63-0002ql-4p
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyc-0004Kq-Ew
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:54 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyZ-0003cM-DK
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:54 -0400
Received: by mail-pg1-x52d.google.com with SMTP id p21so516937pgm.13
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Mw9HZ5O96PBG/BuNXk71tQFvBrPmiee6xG1sg1z+/Y=;
 b=HtWNy+DIUGY37xvd4nPRKltCFg9fCFaSHu13nSSlrjXK/M+l8/GyZjsvhPezBO2Fu7
 uLVuE8CId9wtwXmh33qtthl+aWTX+ZDjgyCraMUphbZIKjfzTgwBUP5QOO+B11t8Ig/8
 ueiMWcR5pauT7Q2S0QDOFZsbsWUmCnQ5bCn8cjDl3wC2A/Mg1SQbR1LzJCIfmRGc8Lig
 zyCSfwBZG3RHGpdSQ3/W6JBzHGfpyC2SR8YNISofYke7gQrQJHPE0GUH+MbhK3e1Hgb+
 ihnl05lVo2TY35PZNBScLrwb1UnVIeYPtXKKxBxSYuQleSDsISQJI1APPGgF5bguQ9gD
 X7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Mw9HZ5O96PBG/BuNXk71tQFvBrPmiee6xG1sg1z+/Y=;
 b=Gnbpdwh65sbk6S2hrh9CODQeUb8A2An1TE9TKP6RAn86swMz/bjEhHwZ6YSvBkyrsT
 vBYwpYvPFKBUpU3e6IaR/l3v1MozHs0jdNknbNc4TwCvwDGg+Z03xOgyJB8AVS0hfcpl
 6m5BqBUzDScvO0sSQWYheoUPkmQpSpgiELd1ZbaG9T1CKjyi2UVdMyqxQdnGR54Lkcws
 ++NpJV3CZE7+AkRoai88HSE5Yazy24tS2Seri+AiaVrINjuVx3Ay2AS/VGJgkzcsv9/V
 lXX1WWV6twq9gOAMxAgkbXoyCO1pgSz+H7mAxB+uZh9yQL3O+EXlQxLc5b1UBr6lRXgi
 OR3w==
X-Gm-Message-State: AOAM5310k7BdSHX6mVgkXUM9dyQNYVFjCSoLlj7bjtJBoXsT7B+NniQK
 AeP8S1HOfdvRy9uxk9OkMyyHLw==
X-Received: by 2002:a17:90a:df82:: with SMTP id
 p2mr2315787pjv.217.1591146830059; 
 Tue, 02 Jun 2020 18:13:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 24/42] target/arm: Add gen_mte_checkN
Date: Tue,  2 Jun 2020 18:12:59 -0700
Message-Id: <20200603011317.473934-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h0V98j0xpy88

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
index 1ab033e4c1..d0f2e131b3 100644
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
index 9f8ae99cc0..f40eee5a14 100644
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
@@ -2835,7 +2863,10 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
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
@@ -3501,7 +3532,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
     MemOp endian = s->be_data;
 
-    int ebytes;   /* bytes per element */
+    int total;    /* total bytes */
     int elements; /* elements per vector */
     int rpt;    /* num iterations */
     int selem;  /* structure elements */
@@ -3571,19 +3602,26 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
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
@@ -3617,7 +3655,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
 
     if (is_postidx) {
         if (rm == 31) {
-            tcg_gen_addi_i64(tcg_rn, tcg_rn, rpt * elements * selem * ebytes);
+            tcg_gen_addi_i64(tcg_rn, tcg_rn, total);
         } else {
             tcg_gen_add_i64(tcg_rn, tcg_rn, cpu_reg(s, rm));
         }
@@ -3663,7 +3701,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int selem = (extract32(opc, 0, 1) << 1 | R) + 1;
     bool replicate = false;
     int index = is_q << 3 | S << 2 | size;
-    int ebytes, xs;
+    int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
 
     if (extract32(insn, 31, 1)) {
@@ -3717,16 +3755,17 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
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
@@ -3753,7 +3792,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     if (is_postidx) {
         if (rm == 31) {
-            tcg_gen_addi_i64(tcg_rn, tcg_rn, selem * ebytes);
+            tcg_gen_addi_i64(tcg_rn, tcg_rn, total);
         } else {
             tcg_gen_add_i64(tcg_rn, tcg_rn, cpu_reg(s, rm));
         }
-- 
2.25.1

