Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2391647ejb;
        Tue, 30 May 2023 12:17:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hZ7AFeccCPcPhWJwCmoBYYAdAfxKHe5V9ViLOXBWSGa2LT3YVGxVYug9vN+rOi5A+cP5q
X-Received: by 2002:a05:622a:648:b0:3f6:b505:ec94 with SMTP id a8-20020a05622a064800b003f6b505ec94mr3818944qtb.17.1685474235658;
        Tue, 30 May 2023 12:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474235; cv=none;
        d=google.com; s=arc-20160816;
        b=qmAVWHZ8xBqSwopHuys1zN4UUMMC/zYQSVCx0huNe2IBIodriOyqV8TdYmZwiABwob
         zazHRdOhoRdbEueHCsMXcpqtq7tsL3EiIVJVi0RzqL6tdKATzNDyU0BW4jO4Uj4MZk+u
         kbM+JRF7qlT+whnKcayyAJtvYFGWltWnHR+4aw/Dm86vjdr2PlyIC5sMVinJe0uuL1kl
         W1RfL8g70/9nHgHF+voIiurTwg8A1mms+aqiZ0yBS3gGC4ZHhXkA/BdRG4HRf1YuTIWi
         KX7Md3JozlahJjuz0quDMGLglg+qmm2q43d9pkpn3L0Fp1mgr8+15TaH/jfYYI0CrOul
         UYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YCRe18lX4hxzOUj7mXv+qMuB6xU6vkt8dgfEQPLSZ34=;
        b=mfAisc+0hcRvTtZbOYYVSVrZUepn9RKzrDptUp6GWj/P4dRCQgKI/iLnXA9njWg4Qx
         FL2XrTsNe0XYfhMHyAqqS/phn8pWO2pC980/Ba0ekaXrFQWb7P9FoOkQjwWR7JhKunJG
         hoyvu/BQSrqD5x/HfjDankOlbtu31laC8x4SzVkOibGYdBN02pWQzrXU5JdsngXb+ApF
         6R0xlpo3GR33Zsct8WjneJJG+zKf5BH0PwwL0Ha+ciz4/JH088rAn8yTi641O1b/ZiCZ
         9qpyuBxFo7h9wCFxI5dCz0txB2XkukbzHmTYtjjisQNIDzjYo/S5E0jARa6ka9p3AuoZ
         aZrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khCfcyT3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a05622a04c700b003f38a88e82dsi7224720qtx.295.2023.05.30.12.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:17:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khCfcyT3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44o8-00075E-Lb; Tue, 30 May 2023 15:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o1-0006Jc-Oo
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:53 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44nz-0004hL-3i
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:53 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-256422ad25dso2614494a91.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474089; x=1688066089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCRe18lX4hxzOUj7mXv+qMuB6xU6vkt8dgfEQPLSZ34=;
 b=khCfcyT3LN1DoQS32lffB5fZP/VfNAodmxdBKiof7Q97/6nfjMESxlgR5Qt2h+X9lh
 s5T8dKrFYCxjMAeRg6oqpV/yhxE2rGbpEH1UTO6D1KlTYTBpsDPzbgx1il7iSQinFt+Z
 QWvxSIzo+9/FFeJ/rggMpke28PF26cC9aO1fcatTgMPENeCAlyy/WKGGTZzCOtdFbzgc
 zwUhA9xpmMcjpqJt89VPXQ5bAwEAyaF48LxJ+OrCeBxyGDEpNAswbXvfTkX1kdzWleJ4
 7kMhfl7FJ9bZ27mr+T5ZKpBYSxF7PWcZ5258ErXqQkE2ylO5MuPdt0WXmG01wrPQ4m+B
 bwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474089; x=1688066089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCRe18lX4hxzOUj7mXv+qMuB6xU6vkt8dgfEQPLSZ34=;
 b=c+EfYwkaJYULCP+aFTn/rQa16yBSzZjTmU4lOqJQ3ZMNZTy2OkiN0+9fWj1/omIxI3
 e+eqB2RerNy3mJ/pwfkriyrcJEubc7xLAjrB5DsNtUyz+frpjd0YIy8Tj+2vDIN6TpTK
 NQllYPGXC4m5Mg9tN3cv0F3OkmZoOBUycjNSWRuvHHS5Hode8TYSPsOCSeqnisPCWpyw
 IkFEYb75yoKw9FovFjJPVSL37Z3jpEhMa8teuG8M6q2Y3dGzlEBNectnS5KOyWqO/6AE
 n/GvdsHlDqLE9dC72nyHVxLplnTf9QMJ6LH+Sm7zQXU6fzLMufl5jgtvLH6bW96Uj6sp
 FOQg==
X-Gm-Message-State: AC+VfDwyPzPFJk+XhctrF5INoko+fNszXTRzCv9Y6/eKkSKHwKS3Il9K
 ZL4+nhPKXIgdbAd7sLrTSR5hWQ==
X-Received: by 2002:a17:90b:3e8c:b0:256:3afb:3b98 with SMTP id
 rj12-20020a17090b3e8c00b002563afb3b98mr3296464pjb.38.1685474089605; 
 Tue, 30 May 2023 12:14:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 12/20] target/arm: Pass memop to gen_mte_check1*
Date: Tue, 30 May 2023 12:14:30 -0700
Message-Id: <20230530191438.411344-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6bejkFVrYHOH

Pass the completed memop to gen_mte_check1_mmuidx.
For the moment, do nothing more than extract the size.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.h |  2 +-
 target/arm/tcg/translate-a64.c | 82 ++++++++++++++++++----------------
 target/arm/tcg/translate-sve.c |  7 +--
 3 files changed, 49 insertions(+), 42 deletions(-)

diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index 0576c4ea12..cecf2bab8f 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -49,7 +49,7 @@ static inline bool sme_smza_enabled_check(DisasContext *s)
 
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int log2_size);
+                        bool tag_checked, MemOp memop);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int size);
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 02dbf76feb..2a7be5c745 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -263,7 +263,7 @@ static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
  */
 static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
                                       bool is_write, bool tag_checked,
-                                      int log2_size, bool is_unpriv,
+                                      MemOp memop, bool is_unpriv,
                                       int core_idx)
 {
     if (tag_checked && s->mte_active[is_unpriv]) {
@@ -274,7 +274,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, memop_size(memop) - 1);
 
         ret = tcg_temp_new_i64();
         gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
@@ -285,9 +285,9 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
 }
 
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int log2_size)
+                        bool tag_checked, MemOp memop)
 {
-    return gen_mte_check1_mmuidx(s, addr, is_write, tag_checked, log2_size,
+    return gen_mte_check1_mmuidx(s, addr, is_write, tag_checked, memop,
                                  false, get_mem_index(s));
 }
 
@@ -2381,19 +2381,31 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
                                int size, bool is_pair)
 {
     int idx = get_mem_index(s);
-    MemOp memop;
     TCGv_i64 dirty_addr, clean_addr;
+    MemOp memop;
+
+    /*
+     * For pairs:
+     * if size == 2, the operation is single-copy atomic for the doubleword.
+     * if size == 3, the operation is single-copy atomic for *each* doubleword,
+     * not the entire quadword, however it must be quadword aligned.
+     */
+    memop = size + is_pair;
+    if (memop == MO_128) {
+        memop = finalize_memop_atom(s, MO_128 | MO_ALIGN,
+                                    MO_ATOM_IFALIGN_PAIR);
+    } else {
+        memop = finalize_memop(s, memop | MO_ALIGN);
+    }
 
     s->is_ldex = true;
     dirty_addr = cpu_reg_sp(s, rn);
-    clean_addr = gen_mte_check1(s, dirty_addr, false, rn != 31, size);
+    clean_addr = gen_mte_check1(s, dirty_addr, false, rn != 31, memop);
 
     g_assert(size <= 3);
     if (is_pair) {
         g_assert(size >= 2);
         if (size == 2) {
-            /* The pair must be single-copy atomic for the doubleword.  */
-            memop = finalize_memop(s, MO_64 | MO_ALIGN);
             tcg_gen_qemu_ld_i64(cpu_exclusive_val, clean_addr, idx, memop);
             if (s->be_data == MO_LE) {
                 tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 0, 32);
@@ -2403,16 +2415,8 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
                 tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 0, 32);
             }
         } else {
-            /*
-             * The pair must be single-copy atomic for *each* doubleword, not
-             * the entire quadword, however it must be quadword aligned.
-             * Expose the complete load to tcg, for ease of tlb lookup,
-             * but indicate that only 8-byte atomicity is required.
-             */
             TCGv_i128 t16 = tcg_temp_new_i128();
 
-            memop = finalize_memop_atom(s, MO_128 | MO_ALIGN_16,
-                                        MO_ATOM_IFALIGN_PAIR);
             tcg_gen_qemu_ld_i128(t16, clean_addr, idx, memop);
 
             if (s->be_data == MO_LE) {
@@ -2426,7 +2430,6 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
             tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
         }
     } else {
-        memop = finalize_memop(s, size | MO_ALIGN);
         tcg_gen_qemu_ld_i64(cpu_exclusive_val, clean_addr, idx, memop);
         tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
     }
@@ -2451,9 +2454,13 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     TCGLabel *fail_label = gen_new_label();
     TCGLabel *done_label = gen_new_label();
     TCGv_i64 tmp, dirty_addr, clean_addr;
+    MemOp memop;
+
+    memop = (size + is_pair) | MO_ALIGN;
+    memop = finalize_memop(s, memop);
 
     dirty_addr = cpu_reg_sp(s, rn);
-    clean_addr = gen_mte_check1(s, dirty_addr, true, rn != 31, size);
+    clean_addr = gen_mte_check1(s, dirty_addr, true, rn != 31, memop);
 
     tcg_gen_brcond_i64(TCG_COND_NE, clean_addr, cpu_exclusive_addr, fail_label);
 
@@ -2467,8 +2474,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             }
             tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr,
                                        cpu_exclusive_val, tmp,
-                                       get_mem_index(s),
-                                       MO_64 | MO_ALIGN | s->be_data);
+                                       get_mem_index(s), memop);
             tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
         } else {
             TCGv_i128 t16 = tcg_temp_new_i128();
@@ -2486,8 +2492,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             }
 
             tcg_gen_atomic_cmpxchg_i128(t16, cpu_exclusive_addr, c16, t16,
-                                        get_mem_index(s),
-                                        MO_128 | MO_ALIGN | s->be_data);
+                                        get_mem_index(s), memop);
 
             a = tcg_temp_new_i64();
             b = tcg_temp_new_i64();
@@ -2505,8 +2510,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         }
     } else {
         tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr, cpu_exclusive_val,
-                                   cpu_reg(s, rt), get_mem_index(s),
-                                   size | MO_ALIGN | s->be_data);
+                                   cpu_reg(s, rt), get_mem_index(s), memop);
         tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
     }
     tcg_gen_mov_i64(cpu_reg(s, rd), tmp);
@@ -2525,13 +2529,15 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     TCGv_i64 tcg_rt = cpu_reg(s, rt);
     int memidx = get_mem_index(s);
     TCGv_i64 clean_addr;
+    MemOp memop;
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size);
-    tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memidx,
-                               size | MO_ALIGN | s->be_data);
+    memop = finalize_memop(s, size | MO_ALIGN);
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, memop);
+    tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt,
+                               memidx, memop);
 }
 
 static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
@@ -2543,13 +2549,15 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     TCGv_i64 t2 = cpu_reg(s, rt + 1);
     TCGv_i64 clean_addr;
     int memidx = get_mem_index(s);
+    MemOp memop;
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
 
     /* This is a single atomic access, despite the "pair". */
-    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size + 1);
+    memop = finalize_memop(s, (size + 1) | MO_ALIGN);
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, memop);
 
     if (size == 2) {
         TCGv_i64 cmp = tcg_temp_new_i64();
@@ -2563,8 +2571,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
             tcg_gen_concat32_i64(cmp, s2, s1);
         }
 
-        tcg_gen_atomic_cmpxchg_i64(cmp, clean_addr, cmp, val, memidx,
-                                   MO_64 | MO_ALIGN | s->be_data);
+        tcg_gen_atomic_cmpxchg_i64(cmp, clean_addr, cmp, val, memidx, memop);
 
         if (s->be_data == MO_LE) {
             tcg_gen_extr32_i64(s1, s2, cmp);
@@ -2583,8 +2590,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
             tcg_gen_concat_i64_i128(cmp, s2, s1);
         }
 
-        tcg_gen_atomic_cmpxchg_i128(cmp, clean_addr, cmp, val, memidx,
-                                    MO_128 | MO_ALIGN | s->be_data);
+        tcg_gen_atomic_cmpxchg_i128(cmp, clean_addr, cmp, val, memidx, memop);
 
         if (s->be_data == MO_LE) {
             tcg_gen_extr_i128_i64(s1, s2, cmp);
@@ -2673,7 +2679,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         /* TODO: ARMv8.4-LSE SCTLR.nAA */
         memop = finalize_memop(s, size | MO_ALIGN);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    true, rn != 31, size);
+                                    true, rn != 31, memop);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, memop, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2692,7 +2698,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         /* TODO: ARMv8.4-LSE SCTLR.nAA */
         memop = finalize_memop(s, size | MO_ALIGN);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    false, rn != 31, size);
+                                    false, rn != 31, memop);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, memop, false, true,
                   rt, disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -3235,7 +3241,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
 
     memop = finalize_memop(s, size + is_signed * MO_SIGN);
-    clean_addr = gen_mte_check1(s, dirty_addr, is_store, true, size);
+    clean_addr = gen_mte_check1(s, dirty_addr, is_store, true, memop);
 
     if (is_vector) {
         if (is_store) {
@@ -3321,7 +3327,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
     memop = finalize_memop(s, size + is_signed * MO_SIGN);
-    clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, size);
+    clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, memop);
 
     if (is_vector) {
         if (is_store) {
@@ -3416,7 +3422,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, size);
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, mop);
 
     if (o3_opc == 014) {
         /*
@@ -3503,7 +3509,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
     clean_addr = gen_mte_check1(s, dirty_addr, false,
-                                is_wback || rn != 31, size);
+                                is_wback || rn != 31, memop);
 
     tcg_rt = cpu_reg(s, rt);
     do_gpr_ld(s, tcg_rt, clean_addr, memop,
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 058f7ef237..18ab5bf7c6 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -5020,6 +5020,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     unsigned msz = dtype_msz(a->dtype);
     TCGLabel *over;
     TCGv_i64 temp, clean_addr;
+    MemOp memop;
 
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
@@ -5049,10 +5050,10 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     /* Load the data.  */
     temp = tcg_temp_new_i64();
     tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm << msz);
-    clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
-    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        finalize_memop(s, dtype_mop[a->dtype]));
+    memop = finalize_memop(s, dtype_mop[a->dtype]);
+    clean_addr = gen_mte_check1(s, temp, false, true, memop);
+    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s), memop);
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.34.1

