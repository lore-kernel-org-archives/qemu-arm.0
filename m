Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp869013wrm;
        Fri, 11 Oct 2019 06:56:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1AHf8VOJPtJ+CZehx+VAQA5yRsA/xO+l4ahJ29Snx5KBIRiv70z8GPakZuma7st5z9Xxo
X-Received: by 2002:ac8:6b12:: with SMTP id w18mr17202779qts.173.1570802187454;
        Fri, 11 Oct 2019 06:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802187; cv=none;
        d=google.com; s=arc-20160816;
        b=vnTXZuClP+E1kDzBhCKsHJIqreiTkfljru7/t3fag+x6rfB3AoPYrn+51CjnEvg2YH
         shC7V9JYss743fQ5OdyqQ71IepLeM8y4HN93qkEdEYbUw2xl8PvZAME604A45X51yTP8
         cdGB+QhbyzGXlnVhasDvZ8CMiJ3Hgpo7fvcMOKy3KInHeW/VHPvmVHPT5LWMW0G5WfUU
         zTQjBtMGYjxKI6oSN4GcG6dX45FKziqyNQpUGkGd74dW+kX9gHEUy13SeFg2LUDVXrVs
         fhB0RDNcr3DrT9aSj5DudXFLRqOT8lO+H9F0O7t6gLqsyVksyCpr7LZ2hDmkB9OATxLY
         NFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=r9X7MHlhfHbrqaHdgvR1bkMzXUVo8hSG+v4LG+XZx8A=;
        b=Q6UqdXJwr1ROdfaeeFoBNs8bghHeknPksfmBdklz9qkb/dsJpl4zdC9oSf8Ch7n1Ps
         HtioUXzB86xfwhwuED0soECskSsV7CCc/btUFpzEQ/qsAQ9V9e4HeVHVwyNHZxzmcdMw
         b7Iax1tQQWKZlouILNkWO6nWZG91FBVhVU580EXRGrRWcHBik5lWxgedbMZ3Wfb1w/2D
         MPp0QM18ZetjuKWb/9pRY+dalJWu/yLvwwMhoXj18d3ZGx3d1NQpOgolPIeyCALvyTCp
         f1NXw9APUQRDgMC39/5QN4XrV+IzkNpVDW8ttGvqlK/zEiL0grc+RXBj6RC2A12a+qB2
         zYkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Poo6VVOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si9544991qvm.21.2019.10.11.06.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Poo6VVOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvP8-0004yV-L6
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvIR-0004XV-OH
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:49:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvIQ-0003Zo-8p
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:49:31 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:38667)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvIQ-0003Zf-4i
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:49:30 -0400
Received: by mail-yb1-xb41.google.com with SMTP id r68so3115370ybf.5
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r9X7MHlhfHbrqaHdgvR1bkMzXUVo8hSG+v4LG+XZx8A=;
 b=Poo6VVObvaKR5zc8NhUBJgzcLkT4q15OAJQXYFKSBYfDQSi4xkiIVlczoIonrh96cG
 o2riE7VsWvkmFKwVXKzUmf92RZi6NP8jmZt8igaE51uar+ZTcWH03unPaAnViHAeDmgW
 HeZbV7TejDPro+v4Wr5LPVT4LdZLzZJI+S1skMGS8gwQ8tPjJLcOEHmeF4+d1MSdlamL
 fA/D5NHZuvLV1df8JhvqBM7F12HQ0sCBhdmWSKkebAJUsCsrZa2M8+LCREUHj/PYGFDN
 7xTn1TffpwB5ABbr2/KzH4zsSxJL6okHYYSg9F09HJTgnsfFes7Lku3D0EFyPCIUzadg
 vhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r9X7MHlhfHbrqaHdgvR1bkMzXUVo8hSG+v4LG+XZx8A=;
 b=ISQ5FF69KUpQWv4f8RlNq032HVLlE4hRW6nRV8bRmZ1MC6Qo5w6O8kvCrYPQLkpC3D
 nxu3JRULcQjZ5NgxE/C3q+2J/J1ad+3juknyQ1YoffJmBMPfosXUuMdcRZdoikdC06wd
 TteqUbOopq31ghFn3br/4waLFO9m6ecblUrkOdQGhyWP7pZtwoHOWSdz02wuROOTYrl+
 fYOlYWAQYAj3mjfu+eonwm4xjXvR/7PblMIGOn16FGzoXKQwNGU5ZFqCdCnzhSZHMMU/
 DjfFwxqoNXSt561aFhmmY6alcNUg9jhqmAjnSnPbLyGQKazf1G4djt0T1u0wipvqSrUe
 MAIA==
X-Gm-Message-State: APjAAAX1kOBSM4v1TZafbLPO3DKZI6WwI+aLA6r+5Pr/MKd8ayXtkipP
 Gje04KGTRSOaKGRqPAnvUQ+hpw==
X-Received: by 2002:a25:3b51:: with SMTP id i78mr10622118yba.186.1570801769339; 
 Fri, 11 Oct 2019 06:49:29 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:49:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/22] target/arm: Suppress tag check for sp+offset
Date: Fri, 11 Oct 2019 09:47:27 -0400
Message-Id: <20191011134744.2477-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kMqGLyt6JNft

R0078 specifies that base register, or base register plus immediate
offset, is unchecked when the base register is SP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Include writeback addresses as checked.
---
 target/arm/translate-a64.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8e4fea6b4c..18d45fba87 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -211,12 +211,12 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
  * This is always a fresh temporary, as we need to be able to
  * increment this independently of a dirty write-back address.
  */
-static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
+static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr, bool check)
 {
     TCGv_i64 clean = new_tmp_a64(s);
 
     /* Note that s->mte_active already includes a check for s->tbid != 0. */
-    if (!s->mte_active) {
+    if (!check || !s->mte_active) {
         gen_top_byte_ignore(s, clean, addr, s->tbid);
     } else if (!regime_has_2_ranges(s->mmu_idx)) {
         gen_helper_mte_check1(clean, cpu_env, addr);
@@ -2334,7 +2334,7 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
     tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memidx,
                                size | MO_ALIGN | s->be_data);
 }
@@ -2352,7 +2352,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
 
     if (size == 2) {
         TCGv_i64 cmp = tcg_temp_new_i64();
@@ -2477,7 +2477,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
         return;
 
@@ -2486,7 +2486,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         s->is_ldex = true;
         gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
         if (is_lasr) {
@@ -2506,7 +2506,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_check_sp_alignment(s);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2522,7 +2522,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -2536,7 +2536,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
             gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
             return;
         }
@@ -2554,7 +2554,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (rn == 31) {
                 gen_check_sp_alignment(s);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
             s->is_ldex = true;
             gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
             if (is_lasr) {
@@ -2744,7 +2744,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, wback || rn != 31);
 
     if (is_vector) {
         if (is_load) {
@@ -2882,7 +2882,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     if (!post_index) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, imm9);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, writeback || rn != 31);
 
     if (is_vector) {
         if (is_store) {
@@ -2989,7 +2989,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     ext_and_shift_reg(tcg_rm, tcg_rm, opt, shift ? size : 0);
 
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, true);
 
     if (is_vector) {
         if (is_store) {
@@ -3074,7 +3074,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     dirty_addr = read_cpu_reg_sp(s, rn, 1);
     offset = imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, rn != 31);
 
     if (is_vector) {
         if (is_store) {
@@ -3158,7 +3158,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn), rn != 31);
     tcg_rs = read_cpu_reg(s, rs, true);
 
     if (o3_opc == 1) { /* LDCLR */
@@ -3220,7 +3220,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = clean_data_tbi(s, dirty_addr, is_wback || rn != 31);
 
     tcg_rt = cpu_reg(s, rt);
     do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
@@ -3380,7 +3380,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     elements = (is_q ? 16 : 8) / ebytes;
 
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
+    clean_addr = clean_data_tbi(s, tcg_rn, is_postidx || rn != 31);
     tcg_ebytes = tcg_const_i64(ebytes);
 
     for (r = 0; r < rpt; r++) {
@@ -3523,7 +3523,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     }
 
     tcg_rn = cpu_reg_sp(s, rn);
-    clean_addr = clean_data_tbi(s, tcg_rn);
+    clean_addr = clean_data_tbi(s, tcg_rn, is_postidx || rn != 31);
     tcg_ebytes = tcg_const_i64(ebytes);
 
     for (xs = 0; xs < selem; xs++) {
-- 
2.17.1

