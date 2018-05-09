Received: by 10.28.4.212 with SMTP id 203csp71163wme;
        Wed, 9 May 2018 11:17:38 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqtLor+G8v1jdgwYFM6oeuThzTyFjdHSYGfe/CleHNoT7YgdpgJI2P/v4w2Cj1r2ddHasrE
X-Received: by 2002:ac8:19d3:: with SMTP id s19-v6mr44467649qtk.414.1525889858039;
        Wed, 09 May 2018 11:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889858; cv=none;
        d=google.com; s=arc-20160816;
        b=nHHA8V+J4Ne8I4pFmu2F50GpCPmqFU0O4dj6eP39mBQ5GmroYX6NvcRWLCbl8MDJiD
         8iSyOsWqyzKrHc7lqoT1gcJnTEHA6ed/oLh7MNvBXTNFuqK97UkcbpG9u+uNpBZeFoLB
         dlLu+RN140r/ZPnZoLewW6hrPjc+tJi2l2XjrEfuQiKXDcYVJrDXz+64XUJP3vJMpBtI
         LKPGQzF1khw8BHxdK1GZ2/pL08OMGB4J35Bg6WrGVYbzKj6V2mUhs/DDMecct76XqJw+
         EjlRW4dsIMRIa92fh3uMbgBTI6rcm/rM+izryIrDb0EMccpdjVI2Ql2FsMW27s7JL3q/
         38xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=y4RcHXo9lSikj0RGzRtyVyhqKcJ5K7w7D7Cfo9pSCEA=;
        b=w4aq/ubidQH0LNAlun2tilfn6V72nuivF+7v7d8vmRF1j2L4p6u8TxfCa9qM2Au/Ur
         DOlFaKlE08qOBG/iZkqQFq5RFRsWJK3EUtrB/0EcR1iJ9ZLocBozhmEpjHIcnkJ5rjnj
         FwswyHpv6CTA6AvFAw0ooOF3PbO0fAXk/PPA16W/0BWArBHmXtFxbxgqvzVXOaTrsKhU
         eAvFbY8EN/M17TRvD2w6M79NvYl/l69vhRVOMZ3Dxd45QL/H+HESZnSDJ5TvZEkNaF4I
         qHlUFwbTy1+I1Rx0ChowhiP2D2bN58GakPsoEd8hUy3vSy5+1iIJUENGCtJTdPbGNhSN
         oHDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X5wZU7uF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o55-v6si6591474qto.5.2018.05.09.11.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X5wZU7uF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTej-0003Ak-HK
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:17:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJh-0005eP-9z
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJY-0006ED-60
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:53 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:37090)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJX-0006DC-RS
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:44 -0400
Received: by mail-pf0-x244.google.com with SMTP id e9so22005298pfi.4
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y4RcHXo9lSikj0RGzRtyVyhqKcJ5K7w7D7Cfo9pSCEA=;
	b=X5wZU7uF3Fz23VxFSwoBc5YmZmsYsZ37NMxO60DJ3emZaZ/vEbEJiDLVc1yxlL7/KV
	p+iSt5WwxHGvHYYapj847z6rEeuf9RRApzOwvPeHcJyTmSPKmV8bQuM73cHeI4hOv9r8
	rbeI8F4N2un/S1ygXd4Nf14ht1yzZ+5Ey4cyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y4RcHXo9lSikj0RGzRtyVyhqKcJ5K7w7D7Cfo9pSCEA=;
	b=mxy3/oeC9bf3Eo42SWO1WZuomK7QMal/BiUm6sMPOrh/jfT/g1N7MBDLxratkNFouq
	n/5L04wtxC27e04vQ16MH3X3+G/3ZjHM3ogtZ/m2Z8x5K1td+QHuOMO93zOrx/ZntYVT
	YTOD0yzWHqBPR6/3Xew+QepjZV+I8dYNl6xCi5gGpgFTFLJG0+9BX4sEZ35mtcShNF5x
	eeiqaUVuHsL/WHq8DQ9Lgi1e7N/2OHVFvsBnJsBH8GRcrXeE+ER7yslvJKR2ppLsO9Vv
	aljYxREAnQIgCc84qyKBEalKeyM0RjUFE6E7r7oMylRSauDTQZsbrZvaFs3dG4Bm8KoQ
	NVRg==
X-Gm-Message-State: ALQs6tAKEXup+ZwHjCrhIy7YGT6Xjk7QTYrSxPrY+K413WDCyJ6CCwFR
	UxvfYJBU0sao0eF1ZaigaBrgA76e0vg=
X-Received: by 10.98.6.195 with SMTP id 186mr33263987pfg.151.1525888542356;
	Wed, 09 May 2018 10:55:42 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:54 -0700
Message-Id: <20180509175458.15642-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PULL 24/28] target/openrisc: convert to
 DisasContextBase
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
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zHIk5o29KgE/

From: "Emilio G. Cota" <cota@braap.org>

While at it, set is_jmp to DISAS_NORETURN when generating
an exception.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 93 ++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 47 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 2747b24cf0..b37414fb27 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -36,7 +36,8 @@
 #include "exec/log.h"
 
 #define LOG_DIS(str, ...) \
-    qemu_log_mask(CPU_LOG_TB_IN_ASM, "%08x: " str, dc->pc, ## __VA_ARGS__)
+    qemu_log_mask(CPU_LOG_TB_IN_ASM, "%08x: " str, dc->base.pc_next,    \
+                  ## __VA_ARGS__)
 
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
@@ -44,13 +45,10 @@
 #define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 
 typedef struct DisasContext {
-    TranslationBlock *tb;
-    target_ulong pc;
-    uint32_t is_jmp;
+    DisasContextBase base;
     uint32_t mem_idx;
     uint32_t tb_flags;
     uint32_t delayed_branch;
-    bool singlestep_enabled;
 } DisasContext;
 
 static TCGv cpu_sr;
@@ -126,9 +124,9 @@ static void gen_exception(DisasContext *dc, unsigned int excp)
 
 static void gen_illegal_exception(DisasContext *dc)
 {
-    tcg_gen_movi_tl(cpu_pc, dc->pc);
+    tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
     gen_exception(dc, EXCP_ILLEGAL);
-    dc->is_jmp = DISAS_UPDATE;
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 /* not used yet, open it when we need or64.  */
@@ -166,12 +164,12 @@ static void check_ov64s(DisasContext *dc)
 
 static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    if (unlikely(dc->singlestep_enabled)) {
+    if (unlikely(dc->base.singlestep_enabled)) {
         return false;
     }
 
 #ifndef CONFIG_USER_ONLY
-    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+    return (dc->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
 #else
     return true;
 #endif
@@ -182,10 +180,10 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
     if (use_goto_tb(dc, dest)) {
         tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_goto_tb(n);
-        tcg_gen_exit_tb((uintptr_t)dc->tb + n);
+        tcg_gen_exit_tb((uintptr_t)dc->base.tb + n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        if (dc->singlestep_enabled) {
+        if (dc->base.singlestep_enabled) {
             gen_exception(dc, EXCP_DEBUG);
         }
         tcg_gen_exit_tb(0);
@@ -194,16 +192,16 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 
 static void gen_jump(DisasContext *dc, int32_t n26, uint32_t reg, uint32_t op0)
 {
-    target_ulong tmp_pc = dc->pc + n26 * 4;
+    target_ulong tmp_pc = dc->base.pc_next + n26 * 4;
 
     switch (op0) {
     case 0x00:     /* l.j */
         tcg_gen_movi_tl(jmp_pc, tmp_pc);
         break;
     case 0x01:     /* l.jal */
-        tcg_gen_movi_tl(cpu_R[9], dc->pc + 8);
+        tcg_gen_movi_tl(cpu_R[9], dc->base.pc_next + 8);
         /* Optimize jal being used to load the PC for PIC.  */
-        if (tmp_pc == dc->pc + 8) {
+        if (tmp_pc == dc->base.pc_next + 8) {
             return;
         }
         tcg_gen_movi_tl(jmp_pc, tmp_pc);
@@ -211,7 +209,7 @@ static void gen_jump(DisasContext *dc, int32_t n26, uint32_t reg, uint32_t op0)
     case 0x03:     /* l.bnf */
     case 0x04:     /* l.bf  */
         {
-            TCGv t_next = tcg_const_tl(dc->pc + 8);
+            TCGv t_next = tcg_const_tl(dc->base.pc_next + 8);
             TCGv t_true = tcg_const_tl(tmp_pc);
             TCGv t_zero = tcg_const_tl(0);
 
@@ -227,7 +225,7 @@ static void gen_jump(DisasContext *dc, int32_t n26, uint32_t reg, uint32_t op0)
         tcg_gen_mov_tl(jmp_pc, cpu_R[reg]);
         break;
     case 0x12:     /* l.jalr */
-        tcg_gen_movi_tl(cpu_R[9], (dc->pc + 8));
+        tcg_gen_movi_tl(cpu_R[9], (dc->base.pc_next + 8));
         tcg_gen_mov_tl(jmp_pc, cpu_R[reg]);
         break;
     default:
@@ -795,7 +793,7 @@ static void dec_misc(DisasContext *dc, uint32_t insn)
                 return;
             }
             gen_helper_rfe(cpu_env);
-            dc->is_jmp = DISAS_UPDATE;
+            dc->base.is_jmp = DISAS_UPDATE;
 #endif
         }
         break;
@@ -1254,15 +1252,16 @@ static void dec_sys(DisasContext *dc, uint32_t insn)
     switch (op0) {
     case 0x000:    /* l.sys */
         LOG_DIS("l.sys %d\n", K16);
-        tcg_gen_movi_tl(cpu_pc, dc->pc);
+        tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
         gen_exception(dc, EXCP_SYSCALL);
-        dc->is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_NORETURN;
         break;
 
     case 0x100:    /* l.trap */
         LOG_DIS("l.trap %d\n", K16);
-        tcg_gen_movi_tl(cpu_pc, dc->pc);
+        tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
         gen_exception(dc, EXCP_TRAP);
+        dc->base.is_jmp = DISAS_NORETURN;
         break;
 
     case 0x300:    /* l.csync */
@@ -1479,7 +1478,7 @@ static void disas_openrisc_insn(DisasContext *dc, OpenRISCCPU *cpu)
 {
     uint32_t op0;
     uint32_t insn;
-    insn = cpu_ldl_code(&cpu->env, dc->pc);
+    insn = cpu_ldl_code(&cpu->env, dc->base.pc_next);
     op0 = extract32(insn, 26, 6);
 
     switch (op0) {
@@ -1532,14 +1531,15 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     int max_insns;
 
     pc_start = tb->pc;
-    dc->tb = tb;
 
-    dc->is_jmp = DISAS_NEXT;
-    dc->pc = pc_start;
+    dc->base.tb = tb;
+    dc->base.singlestep_enabled = cs->singlestep_enabled;
+    dc->base.pc_next = pc_start;
+    dc->base.is_jmp = DISAS_NEXT;
+
     dc->mem_idx = cpu_mmu_index(&cpu->env, false);
-    dc->tb_flags = tb->flags;
+    dc->tb_flags = dc->base.tb->flags;
     dc->delayed_branch = (dc->tb_flags & TB_FLAGS_DFLAG) != 0;
-    dc->singlestep_enabled = cs->singlestep_enabled;
 
     next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     num_insns = 0;
@@ -1570,19 +1570,19 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     }
 
     do {
-        tcg_gen_insn_start(dc->pc, (dc->delayed_branch ? 1 : 0)
+        tcg_gen_insn_start(dc->base.pc_next, (dc->delayed_branch ? 1 : 0)
 			   | (num_insns ? 2 : 0));
         num_insns++;
 
-        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
-            tcg_gen_movi_tl(cpu_pc, dc->pc);
+        if (unlikely(cpu_breakpoint_test(cs, dc->base.pc_next, BP_ANY))) {
+            tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
             gen_exception(dc, EXCP_DEBUG);
-            dc->is_jmp = DISAS_UPDATE;
+            dc->base.is_jmp = DISAS_NORETURN;
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
                properly cleared -- thus we increment the PC here so that
                the logic setting tb->size below does the right thing.  */
-            dc->pc += 4;
+            dc->base.pc_next += 4;
             break;
         }
 
@@ -1590,7 +1590,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
             gen_io_start();
         }
         disas_openrisc_insn(dc, cpu);
-        dc->pc = dc->pc + 4;
+        dc->base.pc_next += 4;
 
         /* delay slot */
         if (dc->delayed_branch) {
@@ -1598,15 +1598,15 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
             if (!dc->delayed_branch) {
                 tcg_gen_mov_tl(cpu_pc, jmp_pc);
                 tcg_gen_discard_tl(jmp_pc);
-                dc->is_jmp = DISAS_UPDATE;
+                dc->base.is_jmp = DISAS_UPDATE;
                 break;
             }
         }
-    } while (!dc->is_jmp
+    } while (!dc->base.is_jmp
              && !tcg_op_buf_full()
-             && !cs->singlestep_enabled
+             && !dc->base.singlestep_enabled
              && !singlestep
-             && (dc->pc < next_page_start)
+             && (dc->base.pc_next < next_page_start)
              && num_insns < max_insns);
 
     if (tb_cflags(tb) & CF_LAST_IO) {
@@ -1617,35 +1617,34 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
         tcg_gen_movi_i32(cpu_dflag, dc->delayed_branch != 0);
     }
 
-    tcg_gen_movi_tl(cpu_ppc, dc->pc - 4);
-    if (dc->is_jmp == DISAS_NEXT) {
-        dc->is_jmp = DISAS_UPDATE;
-        tcg_gen_movi_tl(cpu_pc, dc->pc);
+    tcg_gen_movi_tl(cpu_ppc, dc->base.pc_next - 4);
+    if (dc->base.is_jmp == DISAS_NEXT) {
+        dc->base.is_jmp = DISAS_UPDATE;
+        tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
     }
-    if (unlikely(cs->singlestep_enabled)) {
+    if (unlikely(dc->base.singlestep_enabled)) {
         gen_exception(dc, EXCP_DEBUG);
     } else {
-        switch (dc->is_jmp) {
+        switch (dc->base.is_jmp) {
         case DISAS_NEXT:
-            gen_goto_tb(dc, 0, dc->pc);
+            gen_goto_tb(dc, 0, dc->base.pc_next);
             break;
         default:
+        case DISAS_NORETURN:
         case DISAS_JUMP:
+        case DISAS_TB_JUMP:
             break;
         case DISAS_UPDATE:
             /* indicate that the hash table must be used
                to find the next TB */
             tcg_gen_exit_tb(0);
             break;
-        case DISAS_TB_JUMP:
-            /* nothing more to generate */
-            break;
         }
     }
 
     gen_tb_end(tb, num_insns);
 
-    tb->size = dc->pc - pc_start;
+    tb->size = dc->base.pc_next - pc_start;
     tb->icount = num_insns;
 
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-- 
2.17.0

