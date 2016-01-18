Received: by 10.25.159.19 with SMTP id i19csp1755249lfe;
        Sun, 17 Jan 2016 23:17:07 -0800 (PST)
X-Received: by 10.140.158.4 with SMTP id e4mr30885241qhe.81.1453101427391;
        Sun, 17 Jan 2016 23:17:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w206si29523381qhc.124.2016.01.17.23.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:17:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL43m-0002Ec-NV
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:17:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zw-0003Ji-GE
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zt-00075X-4K
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:08 -0500
Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e]:34564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zm-00072v-Fw; Mon, 18 Jan 2016 02:12:58 -0500
Received: by mail-pa0-x22e.google.com with SMTP id uo6so415134636pac.1;
	Sun, 17 Jan 2016 23:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=e3xM4gLj9VjcRUfj6Mmjzgrk5xnUn7TglEIOel2zrTI=;
	b=gGmCJhh7Lnrvw+smUCOQGd6N/8KN8snykJvzznWB6jLxyx73ObMatjQ9hZVK57lmbg
	gEKukUgTTYzFkBh2Pj5KSYUaMBmZ3Yg2VTGs7E1xIXZer9xmcdoA/GlxHRRG6tahAvWt
	a7fNQQrxEA1aNSEANMuePpKUZt7J8RcRBjfzLVS5X+14mkJZzH1jBvkFPY6aGHLEpkGo
	RRDBcRmU4WdeJ8w0YYdqEzySMxMFvXflMzu1Jo3fOmy+8iItEft9eqNpj8e2YQZBmxkz
	pTtc4KINmPkaW0nBdzlusdUyqEJZi606U65PsFtVyhNGAKH1vngStNposlv6e+wL/Fqn
	elvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=e3xM4gLj9VjcRUfj6Mmjzgrk5xnUn7TglEIOel2zrTI=;
	b=j9F2cWsEcDJnnYri/vDrC51LL7/GjGghM0qTIwfcbEwbLF0p4NfJwgUKRrd9k/6ODE
	sWh4/IhnUoQXy8LFMdr8Ljqs9Thlpxg9R/M7IcCf2Z0aFu9MyNvIdEFTA33dr6LIP1Rp
	WbflaE7tsTQes74E3SUYnAvNBXgwM8+3DOYkhdsFuaoU6/okmh0g2SODmVkFYV8gh7ck
	sHjxpjDTFQVy0Ld+h0x1mbLB4UXuu4A6tVBW/yAPhkNVWwITsUHPCbZT9bB4uMpVFukr
	DH14nA1WLpFGNFsE+LhgtrO/ECfZ0gcKKME3Hd++QjUfrjlya2xq7kYT0cRss1OqPKbr
	STcA==
X-Gm-Message-State: ALoCoQnnjd57bOxgs/iBIRHfoW48pKanIenpB7YQ/5dgceUqqQyaeCw22dNRwnh8rGcog0PosfxZbc/nf7h9bdDStfRLSCmgiw==
X-Received: by 10.66.237.102 with SMTP id vb6mr34455225pac.133.1453101177871; 
	Sun, 17 Jan 2016 23:12:57 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.12.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:12:57 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:32 -0800
Message-Id: <5258352497f088c6ef964f2a30ed1c87a7ecad88.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22e
Cc: peter.maydell@linaro.org, alistair.francis@xilinx.com,
	sridhar_kulk@yahoo.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v1 05/17] target-arm: pass DisasContext to
	gen_aa32_ld*/st*
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UB+TaNF/NVdE

From: Paolo Bonzini <pbonzini@redhat.com>

We'll need the DisasContext in the next patch to retrieve the
desired endianness, so pass it as a whole to gen_aa32_ld*/st*.

Unfortunately we cannot let those functions call get_mem_index,
because of user-mode load/store instructions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[ PC changes:
 * Fix long lines
]
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 target-arm/translate.c | 270 ++++++++++++++++++++++++++-----------------------
 1 file changed, 142 insertions(+), 128 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index d485e7d..55ecca5 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -924,23 +924,27 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
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
@@ -948,7 +952,8 @@ static inline void gen_aa32_st64(TCGv_i64 val, TCGv_i32 addr, int index)
 #else
 
 #define DO_GEN_LD(SUFF, OPC)                                             \
-static inline void gen_aa32_ld##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
+static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 addr, int index)           \
 {                                                                        \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
@@ -957,7 +962,8 @@ static inline void gen_aa32_ld##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
-static inline void gen_aa32_st##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
+static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 addr, int index)           \
 {                                                                        \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
@@ -965,7 +971,8 @@ static inline void gen_aa32_st##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
     tcg_temp_free(addr64);                                               \
 }
 
-static inline void gen_aa32_ld64(TCGv_i64 val, TCGv_i32 addr, int index)
+static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 addr, int index)
 {
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
@@ -973,7 +980,8 @@ static inline void gen_aa32_ld64(TCGv_i64 val, TCGv_i32 addr, int index)
     tcg_temp_free(addr64);
 }
 
-static inline void gen_aa32_st64(TCGv_i64 val, TCGv_i32 addr, int index)
+static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 addr, int index)
 {
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
@@ -1288,18 +1296,18 @@ VFP_GEN_FIX(ulto, )
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
 
@@ -1635,24 +1643,24 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
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
@@ -1664,24 +1672,24 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
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
@@ -2746,15 +2754,15 @@ static TCGv_i32 gen_load_and_replicate(DisasContext *s, TCGv_i32 addr, int size)
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
@@ -4452,11 +4460,11 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
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
@@ -4465,21 +4473,21 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
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
@@ -4489,10 +4497,10 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
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
@@ -4501,7 +4509,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
                             TCGV_UNUSED_I32(tmp2);
                             for (n = 0; n < 4; n++) {
                                 tmp = tcg_temp_new_i32();
-                                gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+                                gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
                                 tcg_gen_addi_i32(addr, addr, stride);
                                 if (n == 0) {
                                     tmp2 = tmp;
@@ -4521,7 +4529,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
                                 } else {
                                     tcg_gen_shri_i32(tmp, tmp2, n * 8);
                                 }
-                                gen_aa32_st8(tmp, addr, get_mem_index(s));
+                                gen_aa32_st8(s, tmp, addr, get_mem_index(s));
                                 tcg_temp_free_i32(tmp);
                                 tcg_gen_addi_i32(addr, addr, stride);
                             }
@@ -4645,13 +4653,13 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
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
@@ -4669,13 +4677,13 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
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
@@ -7600,11 +7608,11 @@ static void gen_srs(DisasContext *s,
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
@@ -7765,10 +7773,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -8384,13 +8392,16 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -8401,13 +8412,16 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -8462,11 +8476,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -8501,20 +8515,20 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -8523,20 +8537,20 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -8889,17 +8903,17 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -8972,7 +8986,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                         if (is_load) {
                             /* load */
                             tmp = tcg_temp_new_i32();
-                            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                             if (user) {
                                 tmp2 = tcg_const_i32(i);
                                 gen_helper_set_user_reg(cpu_env, tmp2, tmp);
@@ -8999,7 +9013,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             } else {
                                 tmp = load_reg(s, i);
                             }
-                            gen_aa32_st32(tmp, addr, get_mem_index(s));
+                            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                             tcg_temp_free_i32(tmp);
                         }
                         j++;
@@ -9266,20 +9280,20 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
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
@@ -9317,11 +9331,11 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
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
@@ -9358,13 +9372,13 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
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
@@ -9374,13 +9388,13 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
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
@@ -9408,10 +9422,10 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
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
@@ -9450,7 +9464,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                     if (insn & (1 << 20)) {
                         /* Load.  */
                         tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                         if (i == 15) {
                             gen_bx(s, tmp);
                         } else if (i == rn) {
@@ -9462,7 +9476,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                     } else {
                         /* Store.  */
                         tmp = load_reg(s, i);
-                        gen_aa32_st32(tmp, addr, get_mem_index(s));
+                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
                         tcg_temp_free_i32(tmp);
                     }
                     tcg_gen_addi_i32(addr, addr, 4);
@@ -10392,19 +10406,19 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
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
@@ -10421,13 +10435,13 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
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
@@ -10564,7 +10578,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
             addr = tcg_temp_new_i32();
             tcg_gen_movi_i32(addr, val);
             tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
             tcg_temp_free_i32(addr);
             store_reg(s, rd, tmp);
             break;
@@ -10767,28 +10781,28 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
 
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
@@ -10810,12 +10824,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
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
@@ -10832,12 +10846,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
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
@@ -10854,12 +10868,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
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
@@ -10875,12 +10889,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
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
@@ -10948,12 +10962,12 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
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
@@ -10965,13 +10979,13 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
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
@@ -11101,7 +11115,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                 if (insn & (1 << 11)) {
                     /* load */
                     tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
                     if (i == rn) {
                         loaded_var = tmp;
                     } else {
@@ -11110,7 +11124,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
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

