Received: by 10.25.208.211 with SMTP id h202csp2009121lfg;
        Tue, 1 Mar 2016 22:59:44 -0800 (PST)
X-Received: by 10.140.92.175 with SMTP id b44mr6786586qge.88.1456901984351;
        Tue, 01 Mar 2016 22:59:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si34822582qgo.52.2016.03.01.22.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:59:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0l5-0002fH-Pl
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:59:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0ih-0006lo-RL
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0ig-0003YR-KT
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:15 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:36084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0ig-0003XL-9S; Wed, 02 Mar 2016 01:57:14 -0500
Received: by mail-pf0-x231.google.com with SMTP id l6so30965652pfl.3;
	Tue, 01 Mar 2016 22:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HAuVvFL0DaSEZfHZ/ZEfklslt+3io5P6z5BXjSzdRaU=;
	b=cE7h9wQdTPTPcVMoyQNBJI2pN2m8i0AnQSyB1CyvouJrw34IaDJYtZS1gX+AFUM8Wn
	scecA4mt0bMl1jaP8/5spWrkMJQ6Pe7GrlM0+4GZkN/n1WqscVniU9eREoC9TMDIE5Mq
	nbElC6GHferlNUP9UZT9/KEcL/D2KK4ZTxvwU/Oi2mQU8PrHTzhM1ec8XEnHJuvgZ5sk
	vO3ChsYWVFyk8ZNM02YebdOp4Fhyby6urLWW8y74PPT+PA5Ujyyr74lSJiVRLKpUUTGy
	RRTWHDyE8N39omiaoo9sZoh+kpdgccWj+cvGmKBjScgxm6vSUwFIRXpf2ch7ncrguKiv
	tW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HAuVvFL0DaSEZfHZ/ZEfklslt+3io5P6z5BXjSzdRaU=;
	b=k4lf+Jq2BKIX9RzQRwtOKKrjmaG3E2TJg6pa6Ua+y7XfRN+dLCN/JiSMeHurwSB+Vo
	taqtrhYh6ZJ1wp02MAI5tU0KO7MITJ3ZnBKen9YPgB+8S95jd7FrDnVk4WWq1sebc1JB
	id7JsMwV1saoqLbt03Mp8uZf47Za4hIFVpLYeY8Ht5T7uUoJQEWgY5Eqf+hq3qoZHWWs
	vRieXk7vztMyDU37Ax8AFyk0KzrMcsNG+2xrWaXT1JtW5thw8DAhKpIGRLxefeZCf9I1
	HHpWhXBRcmtxUS4oh6RdYCaOc2hI0PbXTGjWHTNIxIP2tL0sCXOdEpRuGC6t1s40TZ88
	6scw==
X-Gm-Message-State: AD7BkJKLBsoPwGdylmztisze6tLM7+5Ct1O/q2SjmDJDsRHPol4H45v9qW980BBvlZqjPw==
X-Received: by 10.98.69.155 with SMTP id n27mr35822241pfi.68.1456901833485;
	Tue, 01 Mar 2016 22:57:13 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:12 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:15 -0800
Message-Id: <abc0fdcc7f2cc7d1a67f698a34f456d989c3eee4.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::231
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 11/18] target-arm: a64: Add endianness
	support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HPj5/DDbmdEV

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Set the dc->mo_endianness flag for AA64 and use it in all ldst ops.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 target-arm/translate-a64.c | 49 ++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 88b95ab..539e6d9 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -723,7 +723,7 @@ static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
                              TCGv_i64 tcg_addr, int size, int memidx)
 {
     g_assert(size <= 3);
-    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, MO_TE + size);
+    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, s->be_data + size);
 }
 
 static void do_gpr_st(DisasContext *s, TCGv_i64 source,
@@ -738,7 +738,7 @@ static void do_gpr_st(DisasContext *s, TCGv_i64 source,
 static void do_gpr_ld_memidx(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
                              int size, bool is_signed, bool extend, int memidx)
 {
-    TCGMemOp memop = MO_TE + size;
+    TCGMemOp memop = s->be_data + size;
 
     g_assert(size <= 3);
 
@@ -770,13 +770,18 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
     TCGv_i64 tmp = tcg_temp_new_i64();
     tcg_gen_ld_i64(tmp, cpu_env, fp_reg_offset(s, srcidx, MO_64));
     if (size < 4) {
-        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s), MO_TE + size);
+        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s),
+                            s->be_data + size);
     } else {
+        bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
-        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s), MO_TEQ);
+
+        tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
+        tcg_gen_qemu_st_i64(tmp, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
+                            s->be_data | MO_Q);
         tcg_gen_ld_i64(tmp, cpu_env, fp_reg_hi_offset(s, srcidx));
-        tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_st_i64(tmp, tcg_hiaddr, get_mem_index(s), MO_TEQ);
+        tcg_gen_qemu_st_i64(tmp, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
+                            s->be_data | MO_Q);
         tcg_temp_free_i64(tcg_hiaddr);
     }
 
@@ -793,17 +798,21 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
     TCGv_i64 tmphi;
 
     if (size < 4) {
-        TCGMemOp memop = MO_TE + size;
+        TCGMemOp memop = s->be_data + size;
         tmphi = tcg_const_i64(0);
         tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), memop);
     } else {
+        bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr;
+
         tmphi = tcg_temp_new_i64();
         tcg_hiaddr = tcg_temp_new_i64();
 
-        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), MO_TEQ);
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_ld_i64(tmphi, tcg_hiaddr, get_mem_index(s), MO_TEQ);
+        tcg_gen_qemu_ld_i64(tmplo, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
+                            s->be_data | MO_Q);
+        tcg_gen_qemu_ld_i64(tmphi, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
+                            s->be_data | MO_Q);
         tcg_temp_free_i64(tcg_hiaddr);
     }
 
@@ -942,7 +951,7 @@ static void clear_vec_high(DisasContext *s, int rd)
 static void do_vec_st(DisasContext *s, int srcidx, int element,
                       TCGv_i64 tcg_addr, int size)
 {
-    TCGMemOp memop = MO_TE + size;
+    TCGMemOp memop = s->be_data + size;
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
     read_vec_element(s, tcg_tmp, srcidx, element, size);
@@ -955,7 +964,7 @@ static void do_vec_st(DisasContext *s, int srcidx, int element,
 static void do_vec_ld(DisasContext *s, int destidx, int element,
                       TCGv_i64 tcg_addr, int size)
 {
-    TCGMemOp memop = MO_TE + size;
+    TCGMemOp memop = s->be_data + size;
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
     tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), memop);
@@ -1702,7 +1711,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGMemOp memop = MO_TE + size;
+    TCGMemOp memop = s->be_data + size;
 
     g_assert(size <= 3);
     tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
@@ -1764,7 +1773,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_exclusive_addr, fail_label);
 
     tmp = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), MO_TE + size);
+    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), s->be_data + size);
     tcg_gen_brcond_i64(TCG_COND_NE, tmp, cpu_exclusive_val, fail_label);
     tcg_temp_free_i64(tmp);
 
@@ -1773,7 +1782,8 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 tmphi = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addrhi, addr, 1 << size);
-        tcg_gen_qemu_ld_i64(tmphi, addrhi, get_mem_index(s), MO_TE + size);
+        tcg_gen_qemu_ld_i64(tmphi, addrhi, get_mem_index(s),
+                            s->be_data + size);
         tcg_gen_brcond_i64(TCG_COND_NE, tmphi, cpu_exclusive_high, fail_label);
 
         tcg_temp_free_i64(tmphi);
@@ -1781,13 +1791,14 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     }
 
     /* We seem to still have the exclusive monitor, so do the store */
-    tcg_gen_qemu_st_i64(cpu_reg(s, rt), addr, get_mem_index(s), MO_TE + size);
+    tcg_gen_qemu_st_i64(cpu_reg(s, rt), addr, get_mem_index(s),
+                        s->be_data + size);
     if (is_pair) {
         TCGv_i64 addrhi = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addrhi, addr, 1 << size);
         tcg_gen_qemu_st_i64(cpu_reg(s, rt2), addrhi,
-                            get_mem_index(s), MO_TE + size);
+                            get_mem_index(s), s->be_data + size);
         tcg_temp_free_i64(addrhi);
     }
 
@@ -2602,7 +2613,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
             tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr,
-                                get_mem_index(s), MO_TE + scale);
+                                get_mem_index(s), s->be_data + scale);
             switch (scale) {
             case 0:
                 mulconst = 0x0101010101010101ULL;
@@ -2632,9 +2643,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, tcg_addr, MO_TE + scale);
+                do_vec_ld(s, rt, index, tcg_addr, s->be_data + scale);
             } else {
-                do_vec_st(s, rt, index, tcg_addr, MO_TE + scale);
+                do_vec_st(s, rt, index, tcg_addr, s->be_data + scale);
             }
         }
         tcg_gen_addi_i64(tcg_addr, tcg_addr, ebytes);
-- 
1.9.1

