Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2390814ejb;
        Tue, 30 May 2023 12:15:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5aIYYRFVjlQwhKAEl/jI+JQm4+q4RXu2g1zGNZvR0WlUFSQCwkJbQoGgrSR7lh52SHSmvK
X-Received: by 2002:a05:622a:1a92:b0:3f7:f8bb:71c with SMTP id s18-20020a05622a1a9200b003f7f8bb071cmr3441798qtc.45.1685474150076;
        Tue, 30 May 2023 12:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474150; cv=none;
        d=google.com; s=arc-20160816;
        b=lVwhKmjU1eJ80swFsdCpjMYLD4mB6lX5nEFAlJme3XsT5mEOLM0fAOvhue6v2YFGsA
         mz/Ddt7bPvZYWUBMhekbLZ+C3o5GOLVUQlvyLBtUICD9yMqu+SocztoCxmYqhhOdG7u/
         AyuaU8UKgH7Za2Q34F01+7x29I2UkXpeJJRz2i+9OSIoRTjmq0AoZ1W7rAaXwoe6YjSx
         wlj7c2ldpsuSBCX6CRyJ21z+HB7m5gDZkjdoGINMW/J2em6KsRT1DLZs7SHEUlVKHgSS
         7Khaesso+02S6gFVqOw01Bd6Fj+ZAGzCAxsAlilrLAUGB4joh1vWrPhr3P418yt31k5r
         ljMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2QxG0bahKcXSUtA6+ptPNjNIckP34vwB5oyRvje+RLk=;
        b=IVTDI7RfpckI0459tU59m0KRl5JaIOQNPjjFH1L4IM/MVE9Uwo8+MFlm3Bnd8pv8ZO
         LHrgWaYwlNBDqNGfKrnPtbhEjCGZys2AQokzZ2TUcE58MRXErmCB3tc5c1MaeADv15A1
         ZlpQ04BunVnbG9VIMJHHDw0UbVgmWR+zsSkE2ZxaVOFzzddvhg8FvflRIbWGCQlSm24S
         PP3VM+GDQmwdSxyuANa7DqsXV/LGz8tfMJP5DOgIz6jH3nT1BU8M7Dyq4hrHFRbiCCDs
         V/MwRXHotX13m9PebzCU+qdAQ5Djn+NLZbjCroYrzIA/nl1na3Pm9fRR6AkyPKgy7Mba
         pCXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HMnYSCtg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05622a14ca00b003f6c609e9edsi7075513qtx.367.2023.05.30.12.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HMnYSCtg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44oE-0007E5-Lr; Tue, 30 May 2023 15:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o1-0006Kw-U6
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44nz-0004hs-Qh
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2562cc85d3dso4083148a91.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474090; x=1688066090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2QxG0bahKcXSUtA6+ptPNjNIckP34vwB5oyRvje+RLk=;
 b=HMnYSCtgMSNKMf9kyS9pmrCKj5oxdROVDhfHzQyTmRqhJJ3NOchCBkTzTVkNelXEBR
 WH12Kyduh+2CE8VTkahx3dBwm8kqNEnZByRdNkYz3kJj0H/OJqkCeb2vaDJeky0nKQrK
 29cLi7HXZl107IfI8Rx8PDVnrYLSlQR+YXTyzuX/zfdDaH2mEzy1vGvFYKqfGafxie25
 arE0r4z8g0N4ls7oDCR5/zvWzO0g2heqqBo/waUAg+bMxj43GnVcqKa7K/CpZS1crylI
 Hz+PdyubBCD/YY/wQ4qYhYbqrPqLltsjCmjl/qd3sDueGUl1oxrVC4byHAfz4/sDXT8Q
 481A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474090; x=1688066090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2QxG0bahKcXSUtA6+ptPNjNIckP34vwB5oyRvje+RLk=;
 b=WDDydsJqRkjlDQRLIzRYeenmSVIIBiaRECYUfDtHP/sij4sQ0cdWEj+vMIIPaFF/q0
 mY9a0nGkDk7khdRskCwI0kSWdAazQGb5x30VM0FsHIWbCdweXrQhMSE9y3Q1p2+xmBSZ
 Oz8b2yk/x93XFYbaEEb8w0VOEOf87eIo7WNd8Wo0a5PmtKN4zhwKpyG2PPqpxzGvj9/r
 +Z5AsTJXNdKnrZceN4/eCEzaW3WU2gepOD5xCoftKxo2HfzfpN8sEYBri8+nVgdI7R+Z
 g91ttJn8crcI51/OvmrRQy5dY5JNJzLLxuUQA+aVu4Bx3pdebT59GVbw0nz4BMEF6zsx
 4pkw==
X-Gm-Message-State: AC+VfDwcPuvb07toTVdk+tpNxqDxPpKidyPzgLJmizjI3KZzF9Zyv4sx
 7E+Bv6m+WZKqEzUCUtpKtvKYjQ==
X-Received: by 2002:a17:90a:38c7:b0:255:5a5e:df22 with SMTP id
 x65-20020a17090a38c700b002555a5edf22mr3391662pjb.43.1685474090444; 
 Tue, 30 May 2023 12:14:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 13/20] target/arm: Pass single_memop to gen_mte_checkN
Date: Tue, 30 May 2023 12:14:31 -0700
Message-Id: <20230530191438.411344-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Gj4Qd7IgpEpq

Pass the individual memop to gen_mte_checkN.
For the moment, do nothing with it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.h |  2 +-
 target/arm/tcg/translate-a64.c | 31 +++++++++++++++++++------------
 target/arm/tcg/translate-sve.c |  4 ++--
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index cecf2bab8f..b55dc435fc 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -51,7 +51,7 @@ TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, MemOp memop);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int size);
+                        bool tag_checked, int total_size, MemOp memop);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2a7be5c745..214a9b1638 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -295,7 +295,7 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
  * For MTE, check multiple logical sequential accesses.
  */
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int size)
+                        bool tag_checked, int total_size, MemOp single_mop)
 {
     if (tag_checked && s->mte_active[0]) {
         TCGv_i64 ret;
@@ -305,7 +305,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
 
         ret = tcg_temp_new_i64();
         gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
@@ -2853,14 +2853,12 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     bool is_vector = extract32(insn, 26, 1);
     bool is_load = extract32(insn, 22, 1);
     int opc = extract32(insn, 30, 2);
-
     bool is_signed = false;
     bool postindex = false;
     bool wback = false;
     bool set_tag = false;
-
     TCGv_i64 clean_addr, dirty_addr;
-
+    MemOp mop;
     int size;
 
     if (opc == 3) {
@@ -2943,12 +2941,17 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         }
     }
 
+    if (is_vector) {
+        mop = finalize_memop_asimd(s, size);
+    } else {
+        mop = finalize_memop(s, size);
+    }
     clean_addr = gen_mte_checkN(s, dirty_addr, !is_load,
-                                (wback || rn != 31) && !set_tag, 2 << size);
+                                (wback || rn != 31) && !set_tag,
+                                2 << size, mop);
 
     if (is_vector) {
-        MemOp mop = finalize_memop_asimd(s, size);
-
+        /* LSE2 does not merge FP pairs; leave these as separate operations. */
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, mop);
         } else {
@@ -2963,9 +2966,11 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         TCGv_i64 tcg_rt2 = cpu_reg(s, rt2);
-        MemOp mop = size + 1;
 
         /*
+         * We built mop above for the single logical access -- rebuild it
+         * now for the paired operation.
+         *
          * With LSE2, non-sign-extending pairs are treated atomically if
          * aligned, and if unaligned one of the pair will be completely
          * within a 16-byte block and that element will be atomic.
@@ -2975,6 +2980,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
          * This treats sign-extending loads like zero-extending loads,
          * since that reuses the most code below.
          */
+        mop = size + 1;
         if (s->align_mem) {
             mop |= (size == 2 ? MO_ALIGN_4 : MO_ALIGN_8);
         }
@@ -3753,7 +3759,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * promote consecutive little-endian elements below.
      */
     clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
-                                total);
+                                total, finalize_memop(s, size));
 
     /*
      * Consecutive little-endian elements from a single register
@@ -3911,10 +3917,11 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     total = selem << scale;
     tcg_rn = cpu_reg_sp(s, rn);
 
-    clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
-                                total);
     mop = finalize_memop(s, scale);
 
+    clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
+                                total, mop);
+
     tcg_ebytes = tcg_constant_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
         if (replicate) {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 18ab5bf7c6..1eea6ab5ac 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4187,7 +4187,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
 
     /*
      * Note that unpredicated load/store of vector/predicate registers
@@ -4289,7 +4289,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
 
     /* Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
-- 
2.34.1

