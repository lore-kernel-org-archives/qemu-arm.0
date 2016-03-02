Received: by 10.25.208.211 with SMTP id h202csp2010599lfg;
        Tue, 1 Mar 2016 23:03:30 -0800 (PST)
X-Received: by 10.140.230.207 with SMTP id a198mr33691711qhc.94.1456902210114;
        Tue, 01 Mar 2016 23:03:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5si34749929qhu.25.2016.03.01.23.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 23:03:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0oj-00019W-Kx
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 02:03:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0if-0006hp-W0
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0ie-0003X4-7F
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:13 -0500
Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235]:35835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0id-0003Wx-TK; Wed, 02 Mar 2016 01:57:12 -0500
Received: by mail-pa0-x235.google.com with SMTP id bj10so58532382pad.2;
	Tue, 01 Mar 2016 22:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dcFKLNP3ZKcKVWg5eI/C7URKYdwmEK/Wz/mokyLF3+w=;
	b=pHLuiJ4R9hBrZAZob6CqEEi6cAHfdKcM8ZEhXd7stsOrn6PCGvPXKILJUtb0sEILPG
	jObm0Qzz0iLf9z4VGUF791icoe6lvwduymMAUt8OCXwNQ6oBPth0iCalFxEArFZ9fc+F
	NuxDOiUIgz2VBAondyoU8Q31pRe2ANr0BG2nH/GM1OaxCRsJ1ZsFo1v1jVmpdHHa+1Lc
	glkeJc4ZHmILKi1cUMZxkKGdhJR66aU5HcZLaD0AS0Tk5497sT+b8khPhHPeaYBOE6AQ
	Ja0gR8f1ccnmz4QUYhcxnsydd26UAIB8hm5WusJggI+7s8p6TcsyvpNRSpTT8eYB2jd1
	mymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=dcFKLNP3ZKcKVWg5eI/C7URKYdwmEK/Wz/mokyLF3+w=;
	b=buctxZz+9XjXsjZ5DI9ikiBIcLa80ucWSgl4MCi5bptN/pr9C6LKQ9MsbkbkTozOs+
	KOQrL+yCiW094XzWajb1suNu8zqAPzPkrjQFEEif+dpHuAKbG/2HAB9whFUcYfbGoe+m
	VwgVMJ5XLtqV6adET/JrKWNMtOUIMC+ii5zgzBz17HqjQ8ZmhmxFMrMGR10hoEils4Xl
	UAaTRd4zVgPXLEYoVKgEmvuUzUwkeZl1wL8BWq7AF8x9I7SgAuo7l/TucQYY0GVe6mvl
	gdgY46Z3Z9S1AK55WS+/PSRlMPMtWw4E6GDpFl6J6vowV0AQeTErPl0VIWjJzgNa+AHg
	a7zQ==
X-Gm-Message-State: AD7BkJKKtSpvowLwmn42ZPMUz1QnZXO64eKpUb6v8UzerLUQkYU5Pjvms1j2nZBeXlimKw==
X-Received: by 10.67.5.68 with SMTP id ck4mr35805603pad.3.1456901831130;
	Tue, 01 Mar 2016 22:57:11 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:10 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:14 -0800
Message-Id: <8b3527bf36a913d570b5f1b6ced84563dc823f4d.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::235
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 10/18] target-arm: introduce disas flag for
	endianness
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
X-TUID: p5Fb4+35H6x4

From: Paolo Bonzini <pbonzini@redhat.com>

Introduce a disas flag for setting the CPU data endianness. This allows
control of the endianness from the CPU state rather than hard-coding it
to TARGET_WORDS_BIGENDIAN.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[ PC changes:
  * Split off as new patch from original:
        "target-arm: introduce tbflag for CPSR.E"
  * Wrote commit message from scratch
]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
Changed since v1:
rename mo_endianness to be_data

 target-arm/translate-a64.c |  1 +
 target-arm/translate.c     | 39 ++++++++++++++++++++++++---------------
 target-arm/translate.h     |  1 +
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index f6dd44b..88b95ab 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11032,6 +11032,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
     dc->sctlr_b = 0;
+    dc->be_data = MO_TE;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 2028908..88f24cb 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -924,26 +924,30 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
-    tcg_gen_qemu_ld_i32(val, addr, index, (OPC));                        \
+    TCGMemOp opc = (OPC) | s->be_data;                                   \
+    tcg_gen_qemu_ld_i32(val, addr, index, opc);                          \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
 static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
-    tcg_gen_qemu_st_i32(val, addr, index, (OPC));                        \
+    TCGMemOp opc = (OPC) | s->be_data;                                   \
+    tcg_gen_qemu_st_i32(val, addr, index, opc);                          \
 }
 
 static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
-    tcg_gen_qemu_ld_i64(val, addr, index, MO_TEQ);
+    TCGMemOp opc = MO_Q | s->be_data;
+    tcg_gen_qemu_ld_i64(val, addr, index, opc);
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
-    tcg_gen_qemu_st_i64(val, addr, index, MO_TEQ);
+    TCGMemOp opc = MO_Q | s->be_data;
+    tcg_gen_qemu_st_i64(val, addr, index, opc);
 }
 
 #else
@@ -952,9 +956,10 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
 static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
+    TCGMemOp opc = (OPC) | s->be_data;                                   \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
-    tcg_gen_qemu_ld_i32(val, addr64, index, OPC);                        \
+    tcg_gen_qemu_ld_i32(val, addr64, index, opc);                        \
     tcg_temp_free(addr64);                                               \
 }
 
@@ -962,27 +967,30 @@ static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
 static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 addr, int index)           \
 {                                                                        \
+    TCGMemOp opc = (OPC) | s->be_data;                                   \
     TCGv addr64 = tcg_temp_new();                                        \
     tcg_gen_extu_i32_i64(addr64, addr);                                  \
-    tcg_gen_qemu_st_i32(val, addr64, index, OPC);                        \
+    tcg_gen_qemu_st_i32(val, addr64, index, opc);                        \
     tcg_temp_free(addr64);                                               \
 }
 
 static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
+    TCGMemOp opc = MO_Q | s->be_data;
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
-    tcg_gen_qemu_ld_i64(val, addr64, index, MO_TEQ);
+    tcg_gen_qemu_ld_i64(val, addr64, index, opc);
     tcg_temp_free(addr64);
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 addr, int index)
 {
+    TCGMemOp opc = MO_Q | s->be_data;
     TCGv addr64 = tcg_temp_new();
     tcg_gen_extu_i32_i64(addr64, addr);
-    tcg_gen_qemu_st_i64(val, addr64, index, MO_TEQ);
+    tcg_gen_qemu_st_i64(val, addr64, index, opc);
     tcg_temp_free(addr64);
 }
 
@@ -990,15 +998,15 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
 
 DO_GEN_LD(8s, MO_SB)
 DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16s, MO_TESW)
-DO_GEN_LD(16u, MO_TEUW)
-DO_GEN_LD(32u, MO_TEUL)
+DO_GEN_LD(16s, MO_SW)
+DO_GEN_LD(16u, MO_UW)
+DO_GEN_LD(32u, MO_UL)
 /* 'a' variants include an alignment check */
-DO_GEN_LD(16ua, MO_TEUW | MO_ALIGN)
-DO_GEN_LD(32ua, MO_TEUL | MO_ALIGN)
+DO_GEN_LD(16ua, MO_UW | MO_ALIGN)
+DO_GEN_LD(32ua, MO_UL | MO_ALIGN)
 DO_GEN_ST(8, MO_UB)
-DO_GEN_ST(16, MO_TEUW)
-DO_GEN_ST(32, MO_TEUL)
+DO_GEN_ST(16, MO_UW)
+DO_GEN_ST(32, MO_UL)
 
 static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
 {
@@ -11322,6 +11330,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
                                !arm_el_is_aa64(env, 3);
     dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
     dc->sctlr_b = ARM_TBFLAG_SCTLR_B(tb->flags);
+    dc->be_data = MO_TE;
     dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
     dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 0bdc68c..36bc996 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -17,6 +17,7 @@ typedef struct DisasContext {
     int singlestep_enabled;
     int thumb;
     int sctlr_b;
+    TCGMemOp be_data;
 #if !defined(CONFIG_USER_ONLY)
     int user;
 #endif
-- 
1.9.1

