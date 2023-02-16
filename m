Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp79017ejb;
        Wed, 15 Feb 2023 19:10:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8hI4fu2prSEtO5kcFHgMcsASaLIa0hK+pTvgZB4soGj1jQyHERQOmwoF+AENS9bkjr+82Q
X-Received: by 2002:ac8:7d03:0:b0:3b8:3629:7cb7 with SMTP id g3-20020ac87d03000000b003b836297cb7mr7968000qtb.64.1676517051033;
        Wed, 15 Feb 2023 19:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517051; cv=none;
        d=google.com; s=arc-20160816;
        b=a64uoNxWwl2fTs2incXzy+KChwJ38LV4pjOecGCddmPS2SuXcuY3qSm3mPMk2wDm6t
         V475pax5F99xLCcOxuqGYzVrf5+yhPcjDIp7xYm71aYoFKoXo75vHw+6uq7/SvswOlPm
         j02MRlCpJ9yvv9P0CbE5I0z5qbfyj6cNK3HSVZU90hg+O/fzTijI69ZVGdfw2+7ymi2B
         tUjsVap9txodNRgu9qsn3wVDXhrKFxBe7NYYf92yAy6oN7CM3FQfSiWcj5zcpuM7fYLN
         pe5pFxqU+UTRxDsIUdrOqv7EOj4/n+FzbWi4+cYv38SI3IKd8DmVHBdHSMLhdtB5npbF
         h65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GZYYZEVvI22BciR3iXbZ7vWiYF2DcV/x+9GdZEBopmI=;
        b=bBMn7hETY8MEmQKDGT/0oanFTASTli5QxgRhsjoiL59ydofV3Ch8qx/5bfWo7dM7RL
         PS8AzNdIAGVN/7Du1lwlqB4MzgTsxI0+b/+XBd0dOBgbeb+m1l17HBL5MJ8NW5iJYPik
         RruPboKaGU5QAciDBqkTaXgTg74YRUfdOqDnJ7LIjyR7dQuQj6wKlVO2iH4wlafUv9lE
         YVKMhvs5GZgRI39gaFMNECzdXBIwKYVR/PL9xbcZDot4Z2eQgSvYAOEDXIf+BqqzOh+P
         M3tMegIUaZXHqJgSIohz1SJeoKmxKiPafM8VdXSGzJ1w03jdyec3P9qw/TdjpOTiDX68
         BHDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJCgHeNM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a409200b0073b6a31f0e0si409253qko.160.2023.02.15.19.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJCgHeNM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeD-0007T7-7w; Wed, 15 Feb 2023 22:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeB-0007Ra-Gx
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:23 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe5-00008p-Vu
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:23 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r18so413379pgr.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZYYZEVvI22BciR3iXbZ7vWiYF2DcV/x+9GdZEBopmI=;
 b=lJCgHeNMrPuFJ31M1PIdz+YuQp4AZjYmYLrvNFOcdqnjyngCm/Unm+PyYNYq/DfFHZ
 G3/SSzPTt7wZPQIpjcpAkL8M/0jrWeAY68nHiemqRRP7RKj0dtYc5QMleVj7aSiku2p9
 2RZxHkPGBJXJcK3DJavUGWWaqByMGKKQZ/2QoU1yzTiaPoF1xH6R0oMCoE4qACjbznaL
 OQxo/PYFOZ3vsAuYog28w1JW4GFkxUoMPZJVYywkci3dsltAh0Xc8M7LDeFOrTzbx901
 hOYjW3a8fhvzT2d6PUAYV4eiP96p9lE6WuVNQyL62iY/27Jw1561H08KE29jtl+r7UMr
 Jnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GZYYZEVvI22BciR3iXbZ7vWiYF2DcV/x+9GdZEBopmI=;
 b=uLpPp9ZmfXom9HxXfFU1kkfRWuAEf6kgYaJ2MyruY9f/f5LO3uX72/wzb7tCGWSxF2
 Tavg0z9wsjBxchiuFDemOhOp0NlT+ngrnKhAVmyoJtpqZTMCk7+Sjk+qc6NHPMCa8KSP
 IdiwH74M5Gcaw65Lr8DwH+626UXdb1B+jVdyNwnXIsAzi89syj9SPuZPr+u65i+NCzo0
 ghcI3j+YIwziLadHvQDow/AeGa2TFWhmO5guX23Wa3SEYeYV+3Q5b9IXzJqbR2b4KbAT
 NzKEuUlUkRvdPCg2JlD/tsr19ZwPYkoYb2xc33nGWC27gddJwOhpUsCuSldWBTSZ5fMU
 wTAQ==
X-Gm-Message-State: AO0yUKVOhARKEBLey8MBbe44FKigfayVZbh0/2hmyo5Ny8+MCs5wVjqn
 fRPP6zobr4mkhYb/LxGgc3dhY62b9wQB5TEfTA0=
X-Received: by 2002:aa7:9f8d:0:b0:5a8:4d33:f39e with SMTP id
 z13-20020aa79f8d000000b005a84d33f39emr3840181pfr.24.1676516957150; 
 Wed, 15 Feb 2023 19:09:17 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 13/19] target/arm: Pass single_memop to gen_mte_checkN
Date: Wed, 15 Feb 2023 17:08:48 -1000
Message-Id: <20230216030854.1212208-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5WkfnMkQxaDS

Pass the individual memop to gen_mte_checkN.
For the moment, do nothing with it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  2 +-
 target/arm/translate-a64.c | 26 +++++++++++++++-----------
 target/arm/translate-sve.c |  4 ++--
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 3fc39763d0..b7518f9d34 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -54,7 +54,7 @@ TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, MemOp memop);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int size);
+                        bool tag_checked, int size, MemOp memop);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e02bdd3e7c..1117a1cc41 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -288,7 +288,7 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
  * For MTE, check multiple logical sequential accesses.
  */
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int size)
+                        bool tag_checked, int total_size, MemOp single_mop)
 {
     if (tag_checked && s->mte_active[0]) {
         TCGv_i64 ret;
@@ -298,7 +298,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
 
         ret = new_tmp_a64(s);
         gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
@@ -2983,14 +2983,12 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
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
@@ -3073,11 +3071,13 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         }
     }
 
+    mop = finalize_memop(s, size);
     clean_addr = gen_mte_checkN(s, dirty_addr, !is_load,
-                                (wback || rn != 31) && !set_tag, 2 << size);
+                                (wback || rn != 31) && !set_tag,
+                                2 << size, mop);
 
     if (is_vector) {
-        MemOp mop = finalize_memop(s, size);
+        /* LSE2 does not merge FP pairs; leave these as separate operations. */
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, mop);
         } else {
@@ -3092,9 +3092,11 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         TCGv_i64 tcg_rt2 = cpu_reg(s, rt2);
-        MemOp mop = (size + 1) | s->be_data;
 
         /*
+         * We built mop above for the single logical access -- rebuild it
+         * now for the paired operation.
+         *
          * With LSE2, non-sign-extending pairs are treated atomically if
          * aligned, and if unaligned one of the pair will be completely
          * within a 16-byte block and that element will be atomic.
@@ -3104,6 +3106,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
          * This treats sign-extending loads like zero-extending loads,
          * since that reuses the most code below.
          */
+        mop = (size + 1) | s->be_data;
         mop |= size << MO_ATMAX_SHIFT;
         mop |= s->atom_data;
         if (s->align_mem) {
@@ -3887,7 +3890,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * promote consecutive little-endian elements below.
      */
     clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
-                                total);
+                                total, finalize_memop(s, size));
 
     /*
      * Consecutive little-endian elements from a single register
@@ -4045,10 +4048,11 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f283322cda..6a89126fc5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4321,7 +4321,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
     tcg_temp_free_i64(dirty_addr);
 
     /*
@@ -4450,7 +4450,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
     tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
-- 
2.34.1

