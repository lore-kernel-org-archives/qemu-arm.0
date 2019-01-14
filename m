Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2532466wrt;
        Sun, 13 Jan 2019 17:15:08 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4BmklXlKjDSSHz4YPSJTvmvpM5a69eqDvp6+eo61ReaFg9L30mh9l0X+L1jHBmyhlggC2d
X-Received: by 2002:a1c:1cf:: with SMTP id 198mr9588390wmb.5.1547428508802;
        Sun, 13 Jan 2019 17:15:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428508; cv=none;
        d=google.com; s=arc-20160816;
        b=Qg8b35WGmBnWzxcP6FfOPnVZyNS6/SFFuF1UXJCAIODc4mFCFIL7ViZRMBlrLcnnvs
         z6bptiGHAUDZyjuQ4LPxyiGzgP2rDk2JAtHOD4G3uHgJflV0UasbvcSAnHlxFi/cQd+h
         iCW3DgdYLuwH412XF/08erv+BCOJBPvuTXe7bZ/f+rPGlp9xUggdIsCAj30TZZ09zU6o
         V1thNRoO3xijHt0OWZGYB/XKbn3JKgbdoOZzDoHOvH4SZvcs54YlofmtPPUXUS5aD4uQ
         mWIwNwytPnebPYVfIFlvkL6Dg4DfH+utbdRR+RllfYRnq6UwlCcpEfXXKQDLRKrdrKuy
         tLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=bXhPStNSlDCbXnTGxtTMCZgmzW/jvr/X9ejRqXKxxc8=;
        b=AUavCPURpZemqkYZk/0yHhW3XwX1hMuNgSTE7aPdHy7Qjp3+LQP2APgG1yweVu6Dcy
         qD3RLZ/PuHxAeSXzSJ+F42WiP3YE3JQGp1oXgONSTPvtbNan1OW7SsvIKXJ+XjZJnEPw
         1H8ww/RYeiciHsttuVANZTaqw1YAKzwA6rhacEqe0BEveK2SFEL+CVMrcgN2XkAFSor0
         Ja1XKoxNvRyYPK2TrFfrCeQt/s97c+EtLoPmSVuOSi16JOelfthRAbN9oZ6wUHn6MKBC
         CbwSpyuk3GF4a7/s5jnYGA8mK65cRBfvUNiXSVG+UTXQR8Zvqn7ByZMgEGwPvIgU+g8q
         4UGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OhsAcvJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27si53679713wra.457.2019.01.13.17.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OhsAcvJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqqJ-00087u-LL
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:15:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqn8-0005X6-IZ
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqn7-0000q2-CP
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:50 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38940)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqn7-0000pb-4o
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:49 -0500
Received: by mail-pg1-x542.google.com with SMTP id w6so8737047pgl.6
	for <qemu-arm@nongnu.org>; Sun, 13 Jan 2019 17:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bXhPStNSlDCbXnTGxtTMCZgmzW/jvr/X9ejRqXKxxc8=;
	b=OhsAcvJla5ivgOg7E4fLADjmRBnBo+0z8LJ0PcQjQHJHYQt+HnKdagZNaeIA8yDQEn
	x9Pf37WZRn2ZiihKTMKeMwdSuxJqvXjXC6cgLEnfL8TdxXFraE0m+x9wYPqvxNFlZSv6
	dnsfPnsJNFEt7sfrwC46Q7O43z/7yOlv6Uwhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bXhPStNSlDCbXnTGxtTMCZgmzW/jvr/X9ejRqXKxxc8=;
	b=KF/yYGCP5Iyb229Wi1rMkFVE3W3VrQgCEC12b+ng6e1Shlqxs+AsI8ve/bfA60RHHk
	FX+WuJ4yWswTBywWHuZjMOTdfJagyFRAb7KgcUGtnM/zWGh6+5hbY2bts+sdwXGz7NgK
	YIqPNACabSBjFzlAj8srZVsv4rnj4gp8oFGnElaWHD/cVUebvfKrP2g4+PlYoZ9513xD
	QZwimTHlbCp/NxOMHIw8QIsr1qQkN+zz12NarbyfpMcXo1ciUIwt/9x1qfGkdwiVBdG4
	8sCdvI0KpqQic4SUXuzWAUYKc13fLF7nsEXN2HJk0fgdFmTb4IM/sIFgyhaZpM9Y6wpk
	b2LQ==
X-Gm-Message-State: AJcUukcYNkNdgMOjxE/IUSTL/+vKZf/vRtFytsADnTbdxe+Is1G/zb/V
	Vx5fDzb3f7PV4582LzoYglODgw==
X-Received: by 2002:a63:413:: with SMTP id 19mr10908015pge.7.1547428308050;
	Sun, 13 Jan 2019 17:11:48 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:10 +1100
Message-Id: <20190114011122.5995-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH 05/17] target/arm: Suppress tag check for
 sp+offset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3vD6ImB3v9n1

R0078 specifies that base register, or base register plus immediate
offset, is unchecked when the base register is SP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5c2577a9ac..ee95ba7165 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -336,12 +336,11 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
  * This is always a fresh temporary, as we need to be able to
  * increment this independently of a dirty write-back address.
  */
-static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
+static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr, bool sp_off)
 {
     TCGv_i64 clean = new_tmp_a64(s);
 
-    /* FIXME: SP+OFS is always unchecked.  */
-    if (s->tbid && s->mte_active) {
+    if (s->tbid && s->mte_active && !sp_off) {
         gen_helper_mte_check(clean, cpu_env, addr);
     } else {
         gen_top_byte_ignore(s, clean, addr, s->tbid);
@@ -2374,7 +2373,7 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
     tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memidx,
                                size | MO_ALIGN | s->be_data);
 }
@@ -2392,7 +2391,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
 
     if (size == 2) {
         TCGv_i64 cmp = tcg_temp_new_i64();
@@ -2517,7 +2516,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
         gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
         return;
 
@@ -2526,7 +2525,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
         s->is_ldex = true;
         gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
         if (is_lasr) {
@@ -2546,7 +2545,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_check_sp_alignment(s);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2562,7 +2561,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -2576,7 +2575,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
             gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
             return;
         }
@@ -2594,7 +2593,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (rn == 31) {
                 gen_check_sp_alignment(s);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
             s->is_ldex = true;
             gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
             if (is_lasr) {
@@ -2784,7 +2783,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, rn == 31);
 
     if (is_vector) {
         if (is_load) {
@@ -2922,7 +2921,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     if (!post_index) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, imm9);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, rn == 31);
 
     if (is_vector) {
         if (is_store) {
@@ -3029,7 +3028,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     ext_and_shift_reg(tcg_rm, tcg_rm, opt, shift ? size : 0);
 
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, false);
 
     if (is_vector) {
         if (is_store) {
@@ -3114,7 +3113,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     dirty_addr = read_cpu_reg_sp(s, rn, 1);
     offset = imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, rn == 31);
 
     if (is_vector) {
         if (is_store) {
@@ -3198,7 +3197,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn == 31);
     tcg_rs = read_cpu_reg(s, rs, true);
 
     if (o3_opc == 1) { /* LDCLR */
@@ -3259,7 +3258,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, rn == 31);
 
     tcg_rt = cpu_reg(s, rt);
     do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
@@ -3413,7 +3412,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     elements = (is_q ? 16 : 8) / ebytes;
 
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
+    clean_addr = clean_data_tbi(s, tcg_rn, rn == 31);
     tcg_ebytes = tcg_const_i64(ebytes);
 
     for (r = 0; r < rpt; r++) {
@@ -3547,7 +3546,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     }
 
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
+    clean_addr = clean_data_tbi(s, tcg_rn, rn == 31);
     tcg_ebytes = tcg_const_i64(ebytes);
 
     for (xs = 0; xs < selem; xs++) {
-- 
2.17.2

