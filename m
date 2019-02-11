Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp110047wrp;
        Mon, 11 Feb 2019 16:02:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia2exfu2y3u1/XRVYNurZKbDDsQsxjfk25SsrftxCPsyghjIfBHURoBKjZSg+q0WIzcGOZE
X-Received: by 2002:a25:1903:: with SMTP id 3mr717630ybz.14.1549929765642;
        Mon, 11 Feb 2019 16:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929765; cv=none;
        d=google.com; s=arc-20160816;
        b=JHdwHjB8F8YN8RW13oafhU/VUJu7TYz1B37jrsPWva1iLj3lwfHm7FofKfkfumWNmc
         r+K15IZvZGVj8UqIj2swmA+bTrBSkJFpNfGO+58cnRx7Nyc4lg8XQ/VX27WSCAuAqyof
         bBR93WaNUme3eEfVTeciplyJTUvWn++qe89dfxQmMW8Do0PhfaoHUoktjXw7XlypI9RD
         2e5S7qSeS1GAebcfgCmFTg43/qd8qPDzhGRXSr7YKNZ+2Kupw5tTgktlSbha1+sFbd/M
         bNfIHeOeAkkPuHTSsvQ4ysr8wqzS4TLEsbqX4Hh4aYsW9XScBma6Chz4QfD624FHfdpm
         C9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=IyxP/jQzqtmvSIHHr3lmN5MXpU1gzFjdHYAoOgzE02E=;
        b=gXnfliBFieNZg6rzG3we2wrFDdjh1qvHcsg6ouidulHR2XyzpP2q3JmRReOdYLesGV
         FjzM6IzEeNnJQLoD4WBrNgUdT0hzZ/WbYGXlpfr+paOow+M0iHqyBK85Vs2fV604WREl
         gQ7ZMHOjA78Hm3rj2c846+HwgbswWH4hdpa/ctdhLD1nEfM5eENox9h0C2CYqkIPqieh
         xvaKKTyc/0SPibn6lHha+q85oL2lwg74TMZvpHqHqWcEyRFnOoyae1KOxqM2EKeRh7af
         U5rm1rmtD2PkCb/EA1yWJClW21xL3yrAcDzBtKPjaWI4jHtZVBcq0GkwVLWYHA7jSggh
         PYdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZ1yIOy0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b193si6792087yba.101.2019.02.11.16.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:02:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZ1yIOy0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLXB-0003pg-1x
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOJ-0005Ue-TH
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOH-0004fO-0R
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:35 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOE-0004Qm-M2
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:32 -0500
Received: by mail-pl1-x631.google.com with SMTP id p4so320872plq.11
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IyxP/jQzqtmvSIHHr3lmN5MXpU1gzFjdHYAoOgzE02E=;
	b=CZ1yIOy0TLoozmoYc1wIxw9Vfo/UlGl7zXerapINLJYDjLh0Yd69J5fX4yGxBwSLdE
	qmRKCtMdhyQfHHq2JLseX0z9HC7+t4kalrcmZtrw0dkdO0RlNeSMozFMETBOAxMt0zCv
	/Nq2otM7jhgewXwpKRyPs9005UBipQVVsQMw3+ksBz0NN2CaCgsI6nCAg1BbXjVSvgID
	Tt/DKPL6tiEa9FNIjNDkaWJWZtouOX1rEhPjH771XLbzZJKRjPJVbXY69+SzV1zTMS8W
	4yqUZiH12bq4wkJ7SxEtHsjkuNzQyOMUq5l80Ot/aATnyRZHnWSrjKYnbWipB0izoC4e
	Wt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IyxP/jQzqtmvSIHHr3lmN5MXpU1gzFjdHYAoOgzE02E=;
	b=F7sdqpd7Wy4karVwH8X1X/NfaasFoDPvvahqZKCiA7m0vs9ScL+a7b3Bqnn1U3Afl2
	aobv5eFLWZlxbzRQhtqG+lPqhvLrk0MZT/Lcoei+fKLwohyFwr4Wi1DgcViUdGO7zKl4
	VDwz5vTJ0paaGnLQTNemSnRZTrtxaVc8Ti60C5QIpWH9G5O57P0lzC00fhcc8dSPdhgg
	6gNOiojEdtXW3expeA7GonPhDkQYmDY4KL9w14ITaSXf4hVtLbs+xyraruic833hDUyh
	wGtNa7GAH1Yj0PsxGK8TKl7VfzgnCbz4Jvlcckm+V6jqxwyKMYKPuK//HF++toQtm4yh
	8QaA==
X-Gm-Message-State: AHQUAuZmDr5sVdpgQVhu161VFS0TSrRo/f1GOA0rAH1DQ3GtnMXGFtQ7
	1e540oOOOoWl8tezkysGeFmmeQ1MKKY=
X-Received: by 2002:a17:902:d708:: with SMTP id
	w8mr942415ply.294.1549929193185; 
	Mon, 11 Feb 2019 15:53:13 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:39 -0800
Message-Id: <20190211235258.542-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-devel] [PATCH v3 09/28] target/arm: Suppress tag check for
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
X-TUID: VrobXEk9lQGZ

R0078 specifies that base register, or base register plus immediate
offset, is unchecked when the base register is SP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Include writeback addresses as checked.
---
 target/arm/translate-a64.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1465c52a05..27ceea66d1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -340,11 +340,11 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
  * This is always a fresh temporary, as we need to be able to
  * increment this independently of a dirty write-back address.
  */
-static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
+static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr, bool check)
 {
     TCGv_i64 clean = new_tmp_a64(s);
 
-    if (s->mte_active) {
+    if (check && s->mte_active) {
         if (s->current_el >= 2) {
             /* FIXME: ARMv8.1-VHE S2 translation regime.  */
             gen_helper_mte_check1(clean, cpu_env, addr);
@@ -2385,7 +2385,7 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
     tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memidx,
                                size | MO_ALIGN | s->be_data);
 }
@@ -2403,7 +2403,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
 
     if (size == 2) {
         TCGv_i64 cmp = tcg_temp_new_i64();
@@ -2528,7 +2528,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
         return;
 
@@ -2537,7 +2537,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         s->is_ldex = true;
         gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
         if (is_lasr) {
@@ -2557,7 +2557,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_check_sp_alignment(s);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2573,7 +2573,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -2587,7 +2587,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
             gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
             return;
         }
@@ -2605,7 +2605,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (rn == 31) {
                 gen_check_sp_alignment(s);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
             s->is_ldex = true;
             gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
             if (is_lasr) {
@@ -2795,7 +2795,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, wback || rn != 31);
 
     if (is_vector) {
         if (is_load) {
@@ -2933,7 +2933,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     if (!post_index) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, imm9);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, writeback || rn != 31);
 
     if (is_vector) {
         if (is_store) {
@@ -3040,7 +3040,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     ext_and_shift_reg(tcg_rm, tcg_rm, opt, shift ? size : 0);
 
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, true);
 
     if (is_vector) {
         if (is_store) {
@@ -3125,7 +3125,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     dirty_addr = read_cpu_reg_sp(s, rn, 1);
     offset = imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, rn != 31);
 
     if (is_vector) {
         if (is_store) {
@@ -3209,7 +3209,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
     tcg_rs = read_cpu_reg(s, rs, true);
 
     if (o3_opc == 1) { /* LDCLR */
@@ -3271,7 +3271,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, is_wback || rn != 31);
 
     tcg_rt = cpu_reg(s, rt);
     do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
@@ -3431,7 +3431,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     elements = (is_q ? 16 : 8) / ebytes;
 
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
+    clean_addr = clean_data_tbi(s, tcg_rn, is_postidx || rn != 31);
     tcg_ebytes = tcg_const_i64(ebytes);
 
     for (r = 0; r < rpt; r++) {
@@ -3574,7 +3574,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     }
 
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
+    clean_addr = clean_data_tbi(s, tcg_rn, is_postidx || rn != 31);
     tcg_ebytes = tcg_const_i64(ebytes);
 
     for (xs = 0; xs < selem; xs++) {
-- 
2.17.2

