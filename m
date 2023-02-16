Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp79422ejb;
        Wed, 15 Feb 2023 19:11:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8nRkwgyYu/8tesAoECjHbaaMqt3qykuRkvYJW6hmAw3irSBDoDfMhQbSIPM/gvboQ+1YyY
X-Received: by 2002:a05:6214:19e3:b0:56e:fad0:48f2 with SMTP id q3-20020a05621419e300b0056efad048f2mr1082156qvc.16.1676517083181;
        Wed, 15 Feb 2023 19:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517083; cv=none;
        d=google.com; s=arc-20160816;
        b=QSftlmrexv5UxR8aDYxr9JtbxyABGVhDaswmyIkNMPO/Ges6HAmM96pPgbVsHHLCBQ
         t9RaIqfkGHd4EPlioIv1aXGrMXB11zlzLe4ohTfg51kq9xMSZkYvsBevpaOul+Q9LvDr
         gqU4pzIyfETHTOFuYxLUS3huXJlDByCCvmm2jP6wcyFHaafcrbUTzld7gbwNs6ydnGYU
         rNeGqriV5po47zixsvSP5o5R3CKD/uWYlVsIpohOVSeweIUO9C6rYxnaY0k9Q+aBAfUK
         coo5NG6IW5oD0eRSvAwmLlAX553a3tYa97rjPMoAS1b6dfdob7kvcHeRl24sFdzs/3PW
         tK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kXKMqzkqPC/8m+v36uY3rxvmxE+IMTE35FoSDFgpNdc=;
        b=0Qsi0BxAxrGq7ETU4KppK29UGYp5o5JFh4tt8bvfB/Wjn1SiH/10ys2JFUDpBWLXJW
         nX9C70pim4Y235Y6z3clAx/QNviOYdtWQafCkrWTQPU411sxiPnjJArfJot5Gb9vl1+M
         646GI9ierEUE9pZAIre1V9PTvo8QZXKx0vunx7sByqFTUCmOgw5kQL0l9reDRIhUTGWK
         VJD7cm50xHT1ul8tpMDqDg9mew2+LexP3e6cWlbtPq7JGcT4mwsx0ZRvvG5xynBiG4Ot
         0zep9r/zcP24rwLAY8++nepoHxTeHV0DtVpoBUN5fk5wgFOV99uNT8xlDmzNIX1Ow52A
         nDlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G3rwrV9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020a0ce4d3000000b0056ea051a8f9si110418qvm.332.2023.02.15.19.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:11:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G3rwrV9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSUeB-0007Qp-2g; Wed, 15 Feb 2023 22:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe4-0007LP-9O
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:16 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe2-00009M-1k
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:16 -0500
Received: by mail-pf1-x433.google.com with SMTP id bt14so575929pfb.13
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 19:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXKMqzkqPC/8m+v36uY3rxvmxE+IMTE35FoSDFgpNdc=;
 b=G3rwrV9qj12efaf7G56zBGN3bJqLyP2/NJIsvQpUEWSZkPe8xc22C4jx1EQiCYKKnl
 sa6O4jBzboAj0kF8eJimJqvpkz3F57BbgXDXQT4P4XQUdAYkSLUirTL4Zu8SYkq3QAP/
 /7ZgUIpNgrRW0dwtmO4lhTra81Qk7/xiqk5IrHF3lk4SFZAbmfTiUBY2ugUri/guKbkZ
 JMt7GXCZ75xjj0skuy5xwhrFIGPCeHp2oBaHVuSvJF880mFQ7HtP9uVj4jo8z7EIfteT
 9jlxEOaLISv5lBu2PhNIjd0MfCWyzbnsTn5snvGEv/ktSi086jUdrXAyVr3e50ah6lOZ
 SugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXKMqzkqPC/8m+v36uY3rxvmxE+IMTE35FoSDFgpNdc=;
 b=Sr4Kmgo/OEEOWdYXrWV9XQQZMW4bmEodS6TdjvMy68iO+9ks0PmN0VH4MYZhoV6pYU
 7s5in+JzAnukiEmk7W6+OiMYXMiiRKiWE3bKxkJdxxLcQKp79ctzfIKGi8SPg/uzsDmm
 sreaLPKr+xlyZeesSFYoQOWOzOHkmGeH1yyvDJo30YghcUB22nC7eH3+JtSJ0ckVYZ6e
 c0ToAZRyrqNmbMzKda3ArSg6yHQEiZ0PnTN7TVwnUDgone03kdfTKfIczmhcegCyZu5B
 FOlFQQqo/uS0ogc2fD37yOAf/MxvuR8MzFFpc2sm4HI6bNiEsLOUkEQULI2aRBy6Touj
 MKLA==
X-Gm-Message-State: AO0yUKWSYe0KJpAh9j0Qt4HC5iTsyoUrWY0VClKDrR18zhLOsJ0bNQfJ
 rttqR0dTPgtTcm0Slh2K5P9V8w==
X-Received: by 2002:a62:1708:0:b0:5a8:b2a1:66a4 with SMTP id
 8-20020a621708000000b005a8b2a166a4mr3580198pfx.5.1676516952586; 
 Wed, 15 Feb 2023 19:09:12 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 10/19] target/arm: Hoist finalize_memop out of do_gpr_{ld,
 st}
Date: Wed, 15 Feb 2023 17:08:45 -1000
Message-Id: <20230216030854.1212208-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: BYdHcek+5gpJ

We are going to need the complete memop beforehand,
so let's not compute it twice.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 61 ++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c0d55c9204..fd499a208d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -888,7 +888,6 @@ static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
                              unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    memop = finalize_memop(s, memop);
     tcg_gen_qemu_st_i64(source, tcg_addr, memidx, memop);
 
     if (iss_valid) {
@@ -923,7 +922,6 @@ static void do_gpr_ld_memidx(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
                              bool iss_valid, unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    memop = finalize_memop(s, memop);
     tcg_gen_qemu_ld_i64(dest, tcg_addr, memidx, memop);
 
     if (extend && (memop & MO_SIGN)) {
@@ -2772,6 +2770,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
     int o2_L_o1_o0 = extract32(insn, 21, 3) * 2 | is_lasr;
     int size = extract32(insn, 30, 2);
     TCGv_i64 clean_addr;
+    MemOp memop;
 
     switch (o2_L_o1_o0) {
     case 0x0: /* STXR */
@@ -2808,10 +2807,11 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_check_sp_alignment(s);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+        /* TODO: ARMv8.4-LSE SCTLR.nAA */
+        memop = finalize_memop(s, size | MO_ALIGN);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     true, rn != 31, size);
-        /* TODO: ARMv8.4-LSE SCTLR.nAA */
-        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, true, rt,
+        do_gpr_st(s, cpu_reg(s, rt), clean_addr, memop, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
 
@@ -2826,10 +2826,11 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
+        /* TODO: ARMv8.4-LSE SCTLR.nAA */
+        memop = finalize_memop(s, size | MO_ALIGN);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     false, rn != 31, size);
-        /* TODO: ARMv8.4-LSE SCTLR.nAA */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, false, true,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, memop, false, true,
                   rt, disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -2937,9 +2938,9 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
     } else {
         /* Only unsigned 32bit loads target 32bit registers.  */
         bool iss_sf = opc != 0;
+        MemOp memop = finalize_memop(s, size + is_signed * MO_SIGN);
 
-        do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
-                  false, true, rt, iss_sf, false);
+        do_gpr_ld(s, tcg_rt, clean_addr, mop, false, true, rt, iss_sf, false);
     }
 }
 
@@ -3199,7 +3200,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     bool post_index;
     bool writeback;
     int memidx;
-
+    MemOp memop;
     TCGv_i64 clean_addr, dirty_addr;
 
     if (is_vector) {
@@ -3226,7 +3227,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
             return;
         }
         is_store = (opc == 0);
-        is_signed = extract32(opc, 1, 1);
+        is_signed = !is_store && extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
     }
 
@@ -3260,6 +3261,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     }
 
     memidx = is_unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    memop = finalize_memop(s, size + is_signed * MO_SIGN);
+
     clean_addr = gen_mte_check1_mmuidx(s, dirty_addr, is_store,
                                        writeback || rn != 31,
                                        size, is_unpriv, memidx);
@@ -3275,10 +3278,10 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
 
         if (is_store) {
-            do_gpr_st_memidx(s, tcg_rt, clean_addr, size, memidx,
+            do_gpr_st_memidx(s, tcg_rt, clean_addr, memop, memidx,
                              iss_valid, rt, iss_sf, false);
         } else {
-            do_gpr_ld_memidx(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+            do_gpr_ld_memidx(s, tcg_rt, clean_addr, memop,
                              is_extended, memidx,
                              iss_valid, rt, iss_sf, false);
         }
@@ -3327,8 +3330,8 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     bool is_signed = false;
     bool is_store = false;
     bool is_extended = false;
-
     TCGv_i64 tcg_rm, clean_addr, dirty_addr;
+    MemOp memop;
 
     if (extract32(opt, 1, 1) == 0) {
         unallocated_encoding(s);
@@ -3355,7 +3358,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
             return;
         }
         is_store = (opc == 0);
-        is_signed = extract32(opc, 1, 1);
+        is_signed = !is_store && extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
     }
 
@@ -3368,6 +3371,8 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     ext_and_shift_reg(tcg_rm, tcg_rm, opt, shift ? size : 0);
 
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
+
+    memop = finalize_memop(s, size + is_signed * MO_SIGN);
     clean_addr = gen_mte_check1(s, dirty_addr, is_store, true, size);
 
     if (is_vector) {
@@ -3379,11 +3384,12 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
+
         if (is_store) {
-            do_gpr_st(s, tcg_rt, clean_addr, size,
+            do_gpr_st(s, tcg_rt, clean_addr, memop,
                       true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+            do_gpr_ld(s, tcg_rt, clean_addr, memop,
                       is_extended, true, rt, iss_sf, false);
         }
     }
@@ -3415,12 +3421,11 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     int rn = extract32(insn, 5, 5);
     unsigned int imm12 = extract32(insn, 10, 12);
     unsigned int offset;
-
     TCGv_i64 clean_addr, dirty_addr;
-
     bool is_store;
     bool is_signed = false;
     bool is_extended = false;
+    MemOp memop;
 
     if (is_vector) {
         size |= (opc & 2) << 1;
@@ -3442,7 +3447,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
             return;
         }
         is_store = (opc == 0);
-        is_signed = extract32(opc, 1, 1);
+        is_signed = !is_store && extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
     }
 
@@ -3452,6 +3457,8 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     dirty_addr = read_cpu_reg_sp(s, rn, 1);
     offset = imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
+
+    memop = finalize_memop(s, size + is_signed * MO_SIGN);
     clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, size);
 
     if (is_vector) {
@@ -3464,10 +3471,9 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
         if (is_store) {
-            do_gpr_st(s, tcg_rt, clean_addr, size,
-                      true, rt, iss_sf, false);
+            do_gpr_st(s, tcg_rt, clean_addr, memop, true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+            do_gpr_ld(s, tcg_rt, clean_addr, memop,
                       is_extended, true, rt, iss_sf, false);
         }
     }
@@ -3497,7 +3503,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     bool a = extract32(insn, 23, 1);
     TCGv_i64 tcg_rs, tcg_rt, clean_addr;
     AtomicThreeOpFn *fn = NULL;
-    MemOp mop = s->be_data | size | MO_ALIGN;
+    MemOp mop = finalize_memop(s, size | MO_ALIGN);
 
     if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
         unallocated_encoding(s);
@@ -3558,7 +3564,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
          * full load-acquire (we only need "load-acquire processor consistent"),
          * but we choose to implement them as full LDAQ.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, mop, false,
                   true, rt, disas_ldst_compute_iss_sf(size, false, 0), true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -3604,6 +3610,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     bool use_key_a = !extract32(insn, 23, 1);
     int offset;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
+    MemOp memop;
 
     if (size != 3 || is_vector || !dc_isar_feature(aa64_pauth, s)) {
         unallocated_encoding(s);
@@ -3630,12 +3637,14 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     offset = sextract32(offset << size, 0, 10 + size);
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
+    memop = finalize_memop(s, size);
+
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
     clean_addr = gen_mte_check1(s, dirty_addr, false,
                                 is_wback || rn != 31, size);
 
     tcg_rt = cpu_reg(s, rt);
-    do_gpr_ld(s, tcg_rt, clean_addr, size,
+    do_gpr_ld(s, tcg_rt, clean_addr, memop,
               /* extend */ false, /* iss_valid */ !is_wback,
               /* iss_srt */ rt, /* iss_sf */ true, /* iss_ar */ false);
 
@@ -3677,7 +3686,7 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
     }
 
     /* TODO: ARMv8.4-LSE SCTLR.nAA */
-    mop = size | MO_ALIGN;
+    mop = finalize_memop(s, size | MO_ALIGN);
 
     switch (opc) {
     case 0: /* STLURB */
-- 
2.34.1

