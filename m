Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1945700wrq;
        Sun, 10 Feb 2019 17:14:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZBuZRlCiQcx3P+W9BPF0x4/vzg0WEXTz0wVbkdX09wA5J+lqzgQBZY8Nl/XM0r021Lk/0h
X-Received: by 2002:adf:d08f:: with SMTP id y15mr19069989wrh.104.1549847699587;
        Sun, 10 Feb 2019 17:14:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847699; cv=none;
        d=google.com; s=arc-20160816;
        b=O4iPGlfiseZe3iUsqW1L7CO9SrsjOSotlGGfRVIhY4ilRiXtGeVWVBxattr1TcybDb
         aKiFSVhYlyn9u3jVrdVr3ji9EDqUJEWhYdGJkACxDqHWrWApKcjmvU5L7G/PF3NB5KL+
         NfTTTivlFnX1LVPQWDeTS1kW1h88yX0Ev2llm3lrA+ME+3E1WVvzDJyGbkK9nu9POZig
         k9N3t2OjelwrZjBy5uIjwvo+Y7OU56KRcKTMGgGRl9+402MF1NtiUymydl/BStZt2bVE
         Yb9g2Z2KdrtnkvPhByjmEf11Bccp7rkKQYOaSAoBXZSYXidpMhSxNQQZz9DqffvnevLZ
         P6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EWm2iSaAOLbuCw7Om0ASn9c3AgIfiLyR0Kyc+wT9FkU=;
        b=BeTMO+muRRPbrKEvStxGnQtFY2wVlU0m1vZK+cRQ6IRXu5kFP6aFyGMvcPrOtQ8rjq
         zEESo6B0BQ7wsdcSIoZYSlE0w/rrN+VT9TZ9BfZTfhAC+AfWXqpvMOVgPCbHNGZxYPu3
         ZtKIDHe3rsqORrJHj2aOu7Xexv0kIIfPCBdGU+1u72Hdw/RajCLIr+NiY6FlXIr+FiJM
         /fAjvIhm8as53Rbpa04gt9xb47n+gFYayxGvyd1nICGNM4jFHDHHQouldKmsGPevjScJ
         2TirbcyrYF8X+HYEB3K6GaaUAXqv+9lt5HF43u4Lz39jWedB8TjnyMLa+2CEwJE8Cmzx
         SS/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lvp2di77;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si6663290wmc.53.2019.02.10.17.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:14:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lvp2di77;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0BW-0001bo-Aa
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0005ee-43
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05g-0008L9-An
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05d-00086W-3Q
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:56 -0500
Received: by mail-pl1-x644.google.com with SMTP id bj4so1844710plb.7
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EWm2iSaAOLbuCw7Om0ASn9c3AgIfiLyR0Kyc+wT9FkU=;
	b=lvp2di77SaCF2rO1WxM3Ab50ZSnlL+YNt85x5N2OAnMxt6yZDHlEmu8BR/oLnuja/+
	kjMAR8nPTUsS7K1uxU5+nQOl1wHpBjeZYHS4yYphnlLJolCBwTGJc/uwbyYKYdEjFfSt
	tUynHLBQQWXTSutERZCiQ3S1HI48d1/hg1FbtAM39hungjsoAFPpGHliYBID4LJ/R+6U
	eObr83lTBdk/j0uZwCqWIHAh+HJnw+Y2BLvtaL75bmggrxnKia6Nkq30n3cjMmYeUjqa
	1RmyW71Q7PjhBrkX0MsZ2TIfj8Gvvs7T0kyf/t2CXNUAuqJxjkYZQ/1arU7InlMwM/9/
	KGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EWm2iSaAOLbuCw7Om0ASn9c3AgIfiLyR0Kyc+wT9FkU=;
	b=oiE8NUI8T0bmIvE7TomPrDwVg12WtyxizaSE+DwcPdvU3sKf+uPiGQ9RNV33jX1r6G
	mb6lTnAEbpN2ZCnKbVMy1/Ow8hQnyrfzGbVt5SPONAU4HFUjGwWZO56JsHeEyw+y8kr8
	WrJrD34V6HGwTpjzl0rElyg1cVae1LOe8a6VueyOLh0IeFs3qCqQEWPsarJ5Gsoaa1jn
	5C2nGf29/Uzt7q9+VDR/O2RuTSvNsmFWjkyQ6887T7zm8KWZ7Gsi2D14blZlwt9wpDBD
	Jae6bxsPXRCRPchaPQa/mxCQaid5uPSb2OTmvmQZN9jrPNzi+V6Xa+3qTT5YcTi1ELIj
	V1VQ==
X-Gm-Message-State: AHQUAubsX36p/siEX4k7tM00rhIU0xmW90DFUXPPSQYb55K/Ea+JNN8q
	bwnBpiOXX8Xc9mKadB0mGGlYrgfHtZ8=
X-Received: by 2002:a17:902:7608:: with SMTP id
	k8mr29077063pll.245.1549847323738; 
	Sun, 10 Feb 2019 17:08:43 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:12 -0800
Message-Id: <20190211010829.29869-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v2 09/26] target/arm: Suppress tag check for
 sp+offset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H8d9QNTySq65

R0078 specifies that base register, or base register plus immediate
offset, is unchecked when the base register is SP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Include writeback addresses as checked.
---
 target/arm/translate-a64.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8e9f40f2a6..d0f8c314c9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -340,12 +340,11 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
  * This is always a fresh temporary, as we need to be able to
  * increment this independently of a dirty write-back address.
  */
-static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
+static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr, bool check)
 {
     TCGv_i64 clean = new_tmp_a64(s);
 
-    /* FIXME: SP+OFS is always unchecked.  */
-    if (s->tbid && s->mte_active) {
+    if (check && s->mte_active) {
         gen_helper_mte_check(clean, cpu_env, addr);
     } else {
         gen_top_byte_ignore(s, clean, addr, s->tbid);
@@ -2379,7 +2378,7 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
     tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memidx,
                                size | MO_ALIGN | s->be_data);
 }
@@ -2397,7 +2396,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
 
     if (size == 2) {
         TCGv_i64 cmp = tcg_temp_new_i64();
@@ -2522,7 +2521,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
         return;
 
@@ -2531,7 +2530,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         s->is_ldex = true;
         gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
         if (is_lasr) {
@@ -2551,7 +2550,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_check_sp_alignment(s);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2567,7 +2566,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -2581,7 +2580,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
             gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
             return;
         }
@@ -2599,7 +2598,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (rn == 31) {
                 gen_check_sp_alignment(s);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
             s->is_ldex = true;
             gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
             if (is_lasr) {
@@ -2789,7 +2788,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, wback || rn != 31);
 
     if (is_vector) {
         if (is_load) {
@@ -2927,7 +2926,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     if (!post_index) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, imm9);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, writeback || rn != 31);
 
     if (is_vector) {
         if (is_store) {
@@ -3034,7 +3033,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     ext_and_shift_reg(tcg_rm, tcg_rm, opt, shift ? size : 0);
 
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, true);
 
     if (is_vector) {
         if (is_store) {
@@ -3119,7 +3118,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     dirty_addr = read_cpu_reg_sp(s, rn, 1);
     offset = imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, rn != 31);
 
     if (is_vector) {
         if (is_store) {
@@ -3203,7 +3202,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
     tcg_rs = read_cpu_reg(s, rs, true);
 
     if (o3_opc == 1) { /* LDCLR */
@@ -3265,7 +3264,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, is_wback || rn != 31);
 
     tcg_rt = cpu_reg(s, rt);
     do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
@@ -3425,7 +3424,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     elements = (is_q ? 16 : 8) / ebytes;
 
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
+    clean_addr = clean_data_tbi(s, tcg_rn, is_postidx || rn != 31);
     tcg_ebytes = tcg_const_i64(ebytes);
 
     for (r = 0; r < rpt; r++) {
@@ -3568,7 +3567,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     }
 
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
+    clean_addr = clean_data_tbi(s, tcg_rn, is_postidx || rn != 31);
     tcg_ebytes = tcg_const_i64(ebytes);
 
     for (xs = 0; xs < selem; xs++) {
-- 
2.17.2

