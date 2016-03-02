Received: by 10.25.208.211 with SMTP id h202csp2009803lfg;
        Tue, 1 Mar 2016 23:01:31 -0800 (PST)
X-Received: by 10.55.221.200 with SMTP id u69mr24270200qku.0.1456902091108;
        Tue, 01 Mar 2016 23:01:31 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j188si28189985qhd.56.2016.03.01.23.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 23:01:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0mo-0005nw-El
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 02:01:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0id-0006cy-Il
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0ia-0003WU-F0
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:11 -0500
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:36055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iZ-0003WB-Uo; Wed, 02 Mar 2016 01:57:08 -0500
Received: by mail-pf0-x229.google.com with SMTP id l6so30963886pfl.3;
	Tue, 01 Mar 2016 22:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KQTKKkMLXM3GzS7GYf9XvQPx67kaeRkqpi9Oip33soQ=;
	b=dxSRB3uAM/ct3z2wbdbux3uyYKHYoCgDkuTdHjFRuKNV6i2s3uUO0vaX5Wd6nZOn4Y
	9rkXaI+JbMPkE5Z9OrxUEY1woOfJf/XzDQYd9W99bv8W9v60yJAY7QvkERcm1gsP59ri
	VpJMRhVrvMGvcllDEsV5pPOgzuy/Fib92+PC+8M6FLNZyvyMT78qMG3j7gmjPt/WpaSD
	JJOquKIku9Ug906MC6p6umKvYkhECEJcHND0nZCkJjbhjKkUWbj/LdbQSFcRBAL0HkSA
	Wvst/Ri4y0MF1evmnUZa2y528rjcf15GWYP5BHvZ8/3IBReTLDj/nLcC0U5OJAY+ZtPG
	iaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KQTKKkMLXM3GzS7GYf9XvQPx67kaeRkqpi9Oip33soQ=;
	b=HXTC9RZccZ6GRIYumhQiIaPvKkDPE0GTeStFtz4wE1U5ha4Fp2W3lX993jd/M8owa7
	79akg4g1kQ3JfxIHbIHRgEeBnfK+dncr5EnPyjnnBtqATxG7KoXOLW8B5RgvQhuacrmC
	Fa+w023klomqw7r6QBq2o3RPE7vB4jZDorbTnnZkjh+X6v3eEK/Q6z2/pArtfoPEFHd3
	QpxIXVFl+uK5rU91bSrfso90BB8ekv+cO0BBTUFLsL4DWL2zVt3SDYyBvii5Q2FcrFUL
	zp7McamrKzVclg2na8Uvxua6mHyH1zAtaAxMryA90tINWMzV4zP7dsjwfPds6lrGh6vi
	f15g==
X-Gm-Message-State: AD7BkJL1adh4pUqWjLtmmHnmjYj2k3NDamJtfCzM6AULojMlo597T6aF68Wv7f3m4BXrXA==
X-Received: by 10.98.76.194 with SMTP id e63mr36083831pfj.9.1456901827071;
	Tue, 01 Mar 2016 22:57:07 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:06 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:13 -0800
Message-Id: <97620696517fadfc1c4bb99aa08fbcbace84ec49.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::229
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 09/18] target-arm: pass DisasContext to
	gen_aa32_ld*/st*
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
X-TUID: ZPoB8NB74pNS

From: Paolo Bonzini <pbonzini@redhat.com>

We'll need the DisasContext in the next patch to retrieve the
desired endianness, so pass it as a whole to gen_aa32_ld*/st*.

Unfortunately we cannot let those functions call get_mem_index,
because of user-mode load/store instructions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[ PC changes:
 * Fix long lines
]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 target-arm/translate.c | 270 ++++++++++++++++++++++++++-----------------------
 1 file changed, 142 insertions(+), 128 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index ee04085..2028908 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -921,23 +921,27 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 #if TARGET_LONG_BITS == 32
 
 #define DO_GEN_LD(SUFF, OPC)                                             \
-static inline void gen_aa32_ld##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
+static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 addr, int index)           \
 {                                                                        \
     tcg_gen_qemu_ld_i32(val, addr, index, (OPC));                        \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
-static inline void gen_aa32_st##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
+static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 addr, int index)           \
 {                                                                        \
     tcg_gen_qemu_st_i32(val, addr, index, (OPC));                        \
 }
 
-static inline void gen_aa32_ld64(TCGv_i64 val, TCGv_i32 addr, int index)
+static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 addr, int index)
 {
     tcg_gen_qemu_ld_i64(val, addr, index, MO_TEQ);
 }
 
-static inline void gen_aa32_st64(TCGv_i64 val, TCGv_i32 addr, int index)
+static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 addr, int index)
 {
     tcg_gen_qemu_st_i64(val, addr, index, MO_TEQ);
 }
@@ -945,7 +949,8 @@ static inline void gen_aa32_st64(TCGv_i64 val, TCGv_i32 addr, int index)
 #else
 
 #define DO_GEN_LD(SUFF, OPC)                                             \
-static inline void gen_aa32_ld##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
+static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 addr, int index)           \
 {                                                                        \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
@@ -954,7 +959,8 @@ static inline void gen_aa32_ld##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
-static inline void gen_aa32_st##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
+static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 addr, int index)           \
 {                                                                        \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
@@ -962,7 +968,8 @@ static inline void gen_aa32_st##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
     tcg_temp_free(addr64);                                               \
 }
 
-static inline void gen_aa32_ld64(TCGv_i64 val, TCGv_i32 addr, int index)
+static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 addr, int index)
 {
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
@@ -970,7 +977,8 @@ static inline void gen_aa32_ld64(TCGv_i64 val, TCGv_i32 addr, int index)
     tcg_temp_free(addr64);
 }
 
-static inline void gen_aa32_st64(TCGv_i64 val, TCGv_i32 addr, int index)
+static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 addr, int index)
 {
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
@@ -1285,18 +1293,18 @@ VFP_GEN_FIX(ulto, )
 static inline void gen_vfp_ld(DisasContext *s, int dp, TCGv_i32 addr)
 {
     if (dp) {
-        gen_aa32_ld64(cpu_F0d, addr, get_mem_index(s));
+        gen_aa32_ld64(s, cpu_F0d, addr, get_mem_index(s));
     } else {
-        gen_aa32_ld32u(cpu_F0s, addr, get_mem_index(s));
+        gen_aa32_ld32u(s, cpu_F0s, addr, get_mem_index(s));
     }
 }
 
 static inline void gen_vfp_st(DisasContext *s, int dp, TCGv_i32 addr)
 {
     if (dp) {
-        gen_aa32_st64(cpu_F0d, addr, get_mem_index(s));
+        gen_aa32_st64(s, cpu_F0d, addr, get_mem_index(s));
     } else {
-        gen_aa32_st32(cpu_F0s, addr, get_mem_index(s));
+        gen_aa32_st32(s, cpu_F0s, addr, get_mem_index(s));
     }
 }
 
@@ -1632,24 +1640,24 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         if (insn & ARM_CP_RW_BIT) {
             if ((insn >> 28) == 0xf) {			/* WLDRW wCx */
                 tmp = tcg_temp_new_i32();
-                gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                 iwmmxt_store_creg(wrd, tmp);
             } else {
                 i = 1;
                 if (insn & (1 << 8)) {
                     if (insn & (1 << 22)) {		/* WLDRD */
-                        gen_aa32_ld64(cpu_M0, addr, get_mem_index(s));
+                        gen_aa32_ld64(s, cpu_M0, addr, get_mem_index(s));
                         i = 0;
                     } else {				/* WLDRW wRd */
                         tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                     }
                 } else {
                     tmp = tcg_temp_new_i32();
                     if (insn & (1 << 22)) {		/* WLDRH */
-                        gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
                     } else {				/* WLDRB */
-                        gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
                     }
                 }
                 if (i) {
@@ -1661,24 +1669,24 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         } else {
             if ((insn >> 28) == 0xf) {			/* WSTRW wCx */
                 tmp = iwmmxt_load_creg(wrd);
-                gen_aa32_st32(tmp, addr, get_mem_index(s));
+                gen_aa32_st32(s, tmp, addr, get_mem_index(s));
             } else {
                 gen_op_iwmmxt_movq_M0_wRn(wrd);
                 tmp = tcg_temp_new_i32();
                 if (insn & (1 << 8)) {
                     if (insn & (1 << 22)) {		/* WSTRD */
-                        gen_aa32_st64(cpu_M0, addr, get_mem_index(s));
+                        gen_aa32_st64(s, cpu_M0, addr, get_mem_index(s));
                     } else {				/* WSTRW wRd */
                         tcg_gen_extrl_i64_i32(tmp, cpu_M0);
-                        gen_aa32_st32(tmp, addr, get_mem_index(s));
+                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                     }
                 } else {
                     if (insn & (1 << 22)) {		/* WSTRH */
                         tcg_gen_extrl_i64_i32(tmp, cpu_M0);
-                        gen_aa32_st16(tmp, addr, get_mem_index(s));
+                        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
                     } else {				/* WSTRB */
                         tcg_gen_extrl_i64_i32(tmp, cpu_M0);
-                        gen_aa32_st8(tmp, addr, get_mem_index(s));
+                        gen_aa32_st8(s, tmp, addr, get_mem_index(s));
                     }
                 }
             }
@@ -2743,15 +2751,15 @@ static TCGv_i32 gen_load_and_replicate(DisasContext *s, TCGv_i32 addr, int size)
     TCGv_i32 tmp = tcg_temp_new_i32();
     switch (size) {
     case 0:
-        gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
         gen_neon_dup_u8(tmp, 0);
         break;
     case 1:
-        gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
         gen_neon_dup_low16(tmp);
         break;
     case 2:
-        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
         break;
     default: /* Avoid compiler warnings.  */
         abort();
@@ -4449,11 +4457,11 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
             if (size == 3) {
                 tmp64 = tcg_temp_new_i64();
                 if (load) {
-                    gen_aa32_ld64(tmp64, addr, get_mem_index(s));
+                    gen_aa32_ld64(s, tmp64, addr, get_mem_index(s));
                     neon_store_reg64(tmp64, rd);
                 } else {
                     neon_load_reg64(tmp64, rd);
-                    gen_aa32_st64(tmp64, addr, get_mem_index(s));
+                    gen_aa32_st64(s, tmp64, addr, get_mem_index(s));
                 }
                 tcg_temp_free_i64(tmp64);
                 tcg_gen_addi_i32(addr, addr, stride);
@@ -4462,21 +4470,21 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
                     if (size == 2) {
                         if (load) {
                             tmp = tcg_temp_new_i32();
-                            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                             neon_store_reg(rd, pass, tmp);
                         } else {
                             tmp = neon_load_reg(rd, pass);
-                            gen_aa32_st32(tmp, addr, get_mem_index(s));
+                            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                             tcg_temp_free_i32(tmp);
                         }
                         tcg_gen_addi_i32(addr, addr, stride);
                     } else if (size == 1) {
                         if (load) {
                             tmp = tcg_temp_new_i32();
-                            gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
                             tcg_gen_addi_i32(addr, addr, stride);
                             tmp2 = tcg_temp_new_i32();
-                            gen_aa32_ld16u(tmp2, addr, get_mem_index(s));
+                            gen_aa32_ld16u(s, tmp2, addr, get_mem_index(s));
                             tcg_gen_addi_i32(addr, addr, stride);
                             tcg_gen_shli_i32(tmp2, tmp2, 16);
                             tcg_gen_or_i32(tmp, tmp, tmp2);
@@ -4486,10 +4494,10 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
                             tmp = neon_load_reg(rd, pass);
                             tmp2 = tcg_temp_new_i32();
                             tcg_gen_shri_i32(tmp2, tmp, 16);
-                            gen_aa32_st16(tmp, addr, get_mem_index(s));
+                            gen_aa32_st16(s, tmp, addr, get_mem_index(s));
                             tcg_temp_free_i32(tmp);
                             tcg_gen_addi_i32(addr, addr, stride);
-                            gen_aa32_st16(tmp2, addr, get_mem_index(s));
+                            gen_aa32_st16(s, tmp2, addr, get_mem_index(s));
                             tcg_temp_free_i32(tmp2);
                             tcg_gen_addi_i32(addr, addr, stride);
                         }
@@ -4498,7 +4506,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
                             TCGV_UNUSED_I32(tmp2);
                             for (n = 0; n < 4; n++) {
                                 tmp = tcg_temp_new_i32();
-                                gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+                                gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
                                 tcg_gen_addi_i32(addr, addr, stride);
                                 if (n == 0) {
                                     tmp2 = tmp;
@@ -4518,7 +4526,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
                                 } else {
                                     tcg_gen_shri_i32(tmp, tmp2, n * 8);
                                 }
-                                gen_aa32_st8(tmp, addr, get_mem_index(s));
+                                gen_aa32_st8(s, tmp, addr, get_mem_index(s));
                                 tcg_temp_free_i32(tmp);
                                 tcg_gen_addi_i32(addr, addr, stride);
                             }
@@ -4642,13 +4650,13 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
                     tmp = tcg_temp_new_i32();
                     switch (size) {
                     case 0:
-                        gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
                         break;
                     case 1:
-                        gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
                         break;
                     case 2:
-                        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                         break;
                     default: /* Avoid compiler warnings.  */
                         abort();
@@ -4666,13 +4674,13 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
                         tcg_gen_shri_i32(tmp, tmp, shift);
                     switch (size) {
                     case 0:
-                        gen_aa32_st8(tmp, addr, get_mem_index(s));
+                        gen_aa32_st8(s, tmp, addr, get_mem_index(s));
                         break;
                     case 1:
-                        gen_aa32_st16(tmp, addr, get_mem_index(s));
+                        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
                         break;
                     case 2:
-                        gen_aa32_st32(tmp, addr, get_mem_index(s));
+                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                         break;
                     }
                     tcg_temp_free_i32(tmp);
@@ -7435,14 +7443,14 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
 
     switch (size) {
     case 0:
-        gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
         break;
     case 1:
-        gen_aa32_ld16ua(tmp, addr, get_mem_index(s));
+        gen_aa32_ld16ua(s, tmp, addr, get_mem_index(s));
         break;
     case 2:
     case 3:
-        gen_aa32_ld32ua(tmp, addr, get_mem_index(s));
+        gen_aa32_ld32ua(s, tmp, addr, get_mem_index(s));
         break;
     default:
         abort();
@@ -7453,7 +7461,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp3 = tcg_temp_new_i32();
 
         tcg_gen_addi_i32(tmp2, addr, 4);
-        gen_aa32_ld32u(tmp3, tmp2, get_mem_index(s));
+        gen_aa32_ld32u(s, tmp3, tmp2, get_mem_index(s));
         tcg_temp_free_i32(tmp2);
         tcg_gen_concat_i32_i64(cpu_exclusive_val, tmp, tmp3);
         store_reg(s, rt2, tmp3);
@@ -7504,14 +7512,14 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     tmp = tcg_temp_new_i32();
     switch (size) {
     case 0:
-        gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
         break;
     case 1:
-        gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
         break;
     case 2:
     case 3:
-        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
         break;
     default:
         abort();
@@ -7522,7 +7530,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i32 tmp3 = tcg_temp_new_i32();
         tcg_gen_addi_i32(tmp2, addr, 4);
-        gen_aa32_ld32u(tmp3, tmp2, get_mem_index(s));
+        gen_aa32_ld32u(s, tmp3, tmp2, get_mem_index(s));
         tcg_temp_free_i32(tmp2);
         tcg_gen_concat_i32_i64(val64, tmp, tmp3);
         tcg_temp_free_i32(tmp3);
@@ -7537,14 +7545,14 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     tmp = load_reg(s, rt);
     switch (size) {
     case 0:
-        gen_aa32_st8(tmp, addr, get_mem_index(s));
+        gen_aa32_st8(s, tmp, addr, get_mem_index(s));
         break;
     case 1:
-        gen_aa32_st16(tmp, addr, get_mem_index(s));
+        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
         break;
     case 2:
     case 3:
-        gen_aa32_st32(tmp, addr, get_mem_index(s));
+        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
         break;
     default:
         abort();
@@ -7553,7 +7561,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     if (size == 3) {
         tcg_gen_addi_i32(addr, addr, 4);
         tmp = load_reg(s, rt2);
-        gen_aa32_st32(tmp, addr, get_mem_index(s));
+        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
         tcg_temp_free_i32(tmp);
     }
     tcg_gen_movi_i32(cpu_R[rd], 0);
@@ -7659,11 +7667,11 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(tmp, addr, get_mem_index(s));
+    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(tmp, addr, get_mem_index(s));
+    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
@@ -7822,10 +7830,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 tcg_gen_addi_i32(addr, addr, offset);
             /* Load PC into tmp and CPSR into tmp2.  */
             tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
             tcg_gen_addi_i32(addr, addr, 4);
             tmp2 = tcg_temp_new_i32();
-            gen_aa32_ld32u(tmp2, addr, get_mem_index(s));
+            gen_aa32_ld32u(s, tmp2, addr, get_mem_index(s));
             if (insn & (1 << 21)) {
                 /* Base writeback.  */
                 switch (i) {
@@ -8441,13 +8449,16 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                                 tmp = tcg_temp_new_i32();
                                 switch (op1) {
                                 case 0: /* lda */
-                                    gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                                    gen_aa32_ld32u(s, tmp, addr,
+                                                   get_mem_index(s));
                                     break;
                                 case 2: /* ldab */
-                                    gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+                                    gen_aa32_ld8u(s, tmp, addr,
+                                                  get_mem_index(s));
                                     break;
                                 case 3: /* ldah */
-                                    gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+                                    gen_aa32_ld16u(s, tmp, addr,
+                                                   get_mem_index(s));
                                     break;
                                 default:
                                     abort();
@@ -8458,13 +8469,16 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                                 tmp = load_reg(s, rm);
                                 switch (op1) {
                                 case 0: /* stl */
-                                    gen_aa32_st32(tmp, addr, get_mem_index(s));
+                                    gen_aa32_st32(s, tmp, addr,
+                                                  get_mem_index(s));
                                     break;
                                 case 2: /* stlb */
-                                    gen_aa32_st8(tmp, addr, get_mem_index(s));
+                                    gen_aa32_st8(s, tmp, addr,
+                                                 get_mem_index(s));
                                     break;
                                 case 3: /* stlh */
-                                    gen_aa32_st16(tmp, addr, get_mem_index(s));
+                                    gen_aa32_st16(s, tmp, addr,
+                                                  get_mem_index(s));
                                     break;
                                 default:
                                     abort();
@@ -8519,11 +8533,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                         tmp = load_reg(s, rm);
                         tmp2 = tcg_temp_new_i32();
                         if (insn & (1 << 22)) {
-                            gen_aa32_ld8u(tmp2, addr, get_mem_index(s));
-                            gen_aa32_st8(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld8u(s, tmp2, addr, get_mem_index(s));
+                            gen_aa32_st8(s, tmp, addr, get_mem_index(s));
                         } else {
-                            gen_aa32_ld32u(tmp2, addr, get_mem_index(s));
-                            gen_aa32_st32(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld32u(s, tmp2, addr, get_mem_index(s));
+                            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                         }
                         tcg_temp_free_i32(tmp);
                         tcg_temp_free_i32(addr);
@@ -8558,20 +8572,20 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     if (!load) {
                         /* store */
                         tmp = load_reg(s, rd);
-                        gen_aa32_st32(tmp, addr, get_mem_index(s));
+                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                         tcg_temp_free_i32(tmp);
                         tcg_gen_addi_i32(addr, addr, 4);
                         tmp = load_reg(s, rd + 1);
-                        gen_aa32_st32(tmp, addr, get_mem_index(s));
+                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                         tcg_temp_free_i32(tmp);
                     } else {
                         /* load */
                         tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                         store_reg(s, rd, tmp);
                         tcg_gen_addi_i32(addr, addr, 4);
                         tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                         rd++;
                     }
                     address_offset = -4;
@@ -8580,20 +8594,20 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     tmp = tcg_temp_new_i32();
                     switch (sh) {
                     case 1:
-                        gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
                         break;
                     case 2:
-                        gen_aa32_ld8s(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld8s(s, tmp, addr, get_mem_index(s));
                         break;
                     default:
                     case 3:
-                        gen_aa32_ld16s(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld16s(s, tmp, addr, get_mem_index(s));
                         break;
                     }
                 } else {
                     /* store */
                     tmp = load_reg(s, rd);
-                    gen_aa32_st16(tmp, addr, get_mem_index(s));
+                    gen_aa32_st16(s, tmp, addr, get_mem_index(s));
                     tcg_temp_free_i32(tmp);
                 }
                 /* Perform base writeback before the loaded value to
@@ -8946,17 +8960,17 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 /* load */
                 tmp = tcg_temp_new_i32();
                 if (insn & (1 << 22)) {
-                    gen_aa32_ld8u(tmp, tmp2, i);
+                    gen_aa32_ld8u(s, tmp, tmp2, i);
                 } else {
-                    gen_aa32_ld32u(tmp, tmp2, i);
+                    gen_aa32_ld32u(s, tmp, tmp2, i);
                 }
             } else {
                 /* store */
                 tmp = load_reg(s, rd);
                 if (insn & (1 << 22)) {
-                    gen_aa32_st8(tmp, tmp2, i);
+                    gen_aa32_st8(s, tmp, tmp2, i);
                 } else {
-                    gen_aa32_st32(tmp, tmp2, i);
+                    gen_aa32_st32(s, tmp, tmp2, i);
                 }
                 tcg_temp_free_i32(tmp);
             }
@@ -9029,7 +9043,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                         if (is_load) {
                             /* load */
                             tmp = tcg_temp_new_i32();
-                            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                             if (user) {
                                 tmp2 = tcg_const_i32(i);
                                 gen_helper_set_user_reg(cpu_env, tmp2, tmp);
@@ -9056,7 +9070,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             } else {
                                 tmp = load_reg(s, i);
                             }
-                            gen_aa32_st32(tmp, addr, get_mem_index(s));
+                            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                             tcg_temp_free_i32(tmp);
                         }
                         j++;
@@ -9323,20 +9337,20 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                 if (insn & (1 << 20)) {
                     /* ldrd */
                     tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                     store_reg(s, rs, tmp);
                     tcg_gen_addi_i32(addr, addr, 4);
                     tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                     store_reg(s, rd, tmp);
                 } else {
                     /* strd */
                     tmp = load_reg(s, rs);
-                    gen_aa32_st32(tmp, addr, get_mem_index(s));
+                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                     tcg_temp_free_i32(tmp);
                     tcg_gen_addi_i32(addr, addr, 4);
                     tmp = load_reg(s, rd);
-                    gen_aa32_st32(tmp, addr, get_mem_index(s));
+                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                     tcg_temp_free_i32(tmp);
                 }
                 if (insn & (1 << 21)) {
@@ -9374,11 +9388,11 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                     tcg_gen_add_i32(addr, addr, tmp);
                     tcg_temp_free_i32(tmp);
                     tmp = tcg_temp_new_i32();
-                    gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+                    gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
                 } else { /* tbb */
                     tcg_temp_free_i32(tmp);
                     tmp = tcg_temp_new_i32();
-                    gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+                    gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
                 }
                 tcg_temp_free_i32(addr);
                 tcg_gen_shli_i32(tmp, tmp, 1);
@@ -9415,13 +9429,13 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                         tmp = tcg_temp_new_i32();
                         switch (op) {
                         case 0: /* ldab */
-                            gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
                             break;
                         case 1: /* ldah */
-                            gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
                             break;
                         case 2: /* lda */
-                            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                             break;
                         default:
                             abort();
@@ -9431,13 +9445,13 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                         tmp = load_reg(s, rs);
                         switch (op) {
                         case 0: /* stlb */
-                            gen_aa32_st8(tmp, addr, get_mem_index(s));
+                            gen_aa32_st8(s, tmp, addr, get_mem_index(s));
                             break;
                         case 1: /* stlh */
-                            gen_aa32_st16(tmp, addr, get_mem_index(s));
+                            gen_aa32_st16(s, tmp, addr, get_mem_index(s));
                             break;
                         case 2: /* stl */
-                            gen_aa32_st32(tmp, addr, get_mem_index(s));
+                            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                             break;
                         default:
                             abort();
@@ -9465,10 +9479,10 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                         tcg_gen_addi_i32(addr, addr, -8);
                     /* Load PC into tmp and CPSR into tmp2.  */
                     tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                     tcg_gen_addi_i32(addr, addr, 4);
                     tmp2 = tcg_temp_new_i32();
-                    gen_aa32_ld32u(tmp2, addr, get_mem_index(s));
+                    gen_aa32_ld32u(s, tmp2, addr, get_mem_index(s));
                     if (insn & (1 << 21)) {
                         /* Base writeback.  */
                         if (insn & (1 << 24)) {
@@ -9507,7 +9521,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                     if (insn & (1 << 20)) {
                         /* Load.  */
                         tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                         if (i == 15) {
                             gen_bx(s, tmp);
                         } else if (i == rn) {
@@ -9519,7 +9533,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                     } else {
                         /* Store.  */
                         tmp = load_reg(s, i);
-                        gen_aa32_st32(tmp, addr, get_mem_index(s));
+                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                         tcg_temp_free_i32(tmp);
                     }
                     tcg_gen_addi_i32(addr, addr, 4);
@@ -10449,19 +10463,19 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
             tmp = tcg_temp_new_i32();
             switch (op) {
             case 0:
-                gen_aa32_ld8u(tmp, addr, memidx);
+                gen_aa32_ld8u(s, tmp, addr, memidx);
                 break;
             case 4:
-                gen_aa32_ld8s(tmp, addr, memidx);
+                gen_aa32_ld8s(s, tmp, addr, memidx);
                 break;
             case 1:
-                gen_aa32_ld16u(tmp, addr, memidx);
+                gen_aa32_ld16u(s, tmp, addr, memidx);
                 break;
             case 5:
-                gen_aa32_ld16s(tmp, addr, memidx);
+                gen_aa32_ld16s(s, tmp, addr, memidx);
                 break;
             case 2:
-                gen_aa32_ld32u(tmp, addr, memidx);
+                gen_aa32_ld32u(s, tmp, addr, memidx);
                 break;
             default:
                 tcg_temp_free_i32(tmp);
@@ -10478,13 +10492,13 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
             tmp = load_reg(s, rs);
             switch (op) {
             case 0:
-                gen_aa32_st8(tmp, addr, memidx);
+                gen_aa32_st8(s, tmp, addr, memidx);
                 break;
             case 1:
-                gen_aa32_st16(tmp, addr, memidx);
+                gen_aa32_st16(s, tmp, addr, memidx);
                 break;
             case 2:
-                gen_aa32_st32(tmp, addr, memidx);
+                gen_aa32_st32(s, tmp, addr, memidx);
                 break;
             default:
                 tcg_temp_free_i32(tmp);
@@ -10621,7 +10635,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
             addr = tcg_temp_new_i32();
             tcg_gen_movi_i32(addr, val);
             tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
             tcg_temp_free_i32(addr);
             store_reg(s, rd, tmp);
             break;
@@ -10824,28 +10838,28 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
 
         switch (op) {
         case 0: /* str */
-            gen_aa32_st32(tmp, addr, get_mem_index(s));
+            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
             break;
         case 1: /* strh */
-            gen_aa32_st16(tmp, addr, get_mem_index(s));
+            gen_aa32_st16(s, tmp, addr, get_mem_index(s));
             break;
         case 2: /* strb */
-            gen_aa32_st8(tmp, addr, get_mem_index(s));
+            gen_aa32_st8(s, tmp, addr, get_mem_index(s));
             break;
         case 3: /* ldrsb */
-            gen_aa32_ld8s(tmp, addr, get_mem_index(s));
+            gen_aa32_ld8s(s, tmp, addr, get_mem_index(s));
             break;
         case 4: /* ldr */
-            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
             break;
         case 5: /* ldrh */
-            gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
             break;
         case 6: /* ldrb */
-            gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
             break;
         case 7: /* ldrsh */
-            gen_aa32_ld16s(tmp, addr, get_mem_index(s));
+            gen_aa32_ld16s(s, tmp, addr, get_mem_index(s));
             break;
         }
         if (op >= 3) { /* load */
@@ -10867,12 +10881,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
         if (insn & (1 << 11)) {
             /* load */
             tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
             store_reg(s, rd, tmp);
         } else {
             /* store */
             tmp = load_reg(s, rd);
-            gen_aa32_st32(tmp, addr, get_mem_index(s));
+            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
             tcg_temp_free_i32(tmp);
         }
         tcg_temp_free_i32(addr);
@@ -10889,12 +10903,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
         if (insn & (1 << 11)) {
             /* load */
             tmp = tcg_temp_new_i32();
-            gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
             store_reg(s, rd, tmp);
         } else {
             /* store */
             tmp = load_reg(s, rd);
-            gen_aa32_st8(tmp, addr, get_mem_index(s));
+            gen_aa32_st8(s, tmp, addr, get_mem_index(s));
             tcg_temp_free_i32(tmp);
         }
         tcg_temp_free_i32(addr);
@@ -10911,12 +10925,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
         if (insn & (1 << 11)) {
             /* load */
             tmp = tcg_temp_new_i32();
-            gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
             store_reg(s, rd, tmp);
         } else {
             /* store */
             tmp = load_reg(s, rd);
-            gen_aa32_st16(tmp, addr, get_mem_index(s));
+            gen_aa32_st16(s, tmp, addr, get_mem_index(s));
             tcg_temp_free_i32(tmp);
         }
         tcg_temp_free_i32(addr);
@@ -10932,12 +10946,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
         if (insn & (1 << 11)) {
             /* load */
             tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
             store_reg(s, rd, tmp);
         } else {
             /* store */
             tmp = load_reg(s, rd);
-            gen_aa32_st32(tmp, addr, get_mem_index(s));
+            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
             tcg_temp_free_i32(tmp);
         }
         tcg_temp_free_i32(addr);
@@ -11005,12 +11019,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                     if (insn & (1 << 11)) {
                         /* pop */
                         tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                         store_reg(s, i, tmp);
                     } else {
                         /* push */
                         tmp = load_reg(s, i);
-                        gen_aa32_st32(tmp, addr, get_mem_index(s));
+                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                         tcg_temp_free_i32(tmp);
                     }
                     /* advance to the next address.  */
@@ -11022,13 +11036,13 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                 if (insn & (1 << 11)) {
                     /* pop pc */
                     tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                     /* don't set the pc until the rest of the instruction
                        has completed */
                 } else {
                     /* push lr */
                     tmp = load_reg(s, 14);
-                    gen_aa32_st32(tmp, addr, get_mem_index(s));
+                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                     tcg_temp_free_i32(tmp);
                 }
                 tcg_gen_addi_i32(addr, addr, 4);
@@ -11158,7 +11172,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                 if (insn & (1 << 11)) {
                     /* load */
                     tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                     if (i == rn) {
                         loaded_var = tmp;
                     } else {
@@ -11167,7 +11181,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                 } else {
                     /* store */
                     tmp = load_reg(s, i);
-                    gen_aa32_st32(tmp, addr, get_mem_index(s));
+                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                     tcg_temp_free_i32(tmp);
                 }
                 /* advance to the next address */
-- 
1.9.1

