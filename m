Received: by 10.28.4.212 with SMTP id 203csp61269wme;
        Wed, 9 May 2018 11:07:38 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoxYSvzumckULTTT7kF8XFznxNzi3Xg3t3yD1Oye67c/snMBMxDEUnm5gOKPqh/AKQd6/0g
X-Received: by 2002:ac8:2237:: with SMTP id o52-v6mr42764695qto.355.1525889258733;
        Wed, 09 May 2018 11:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889258; cv=none;
        d=google.com; s=arc-20160816;
        b=kw7OsintVPKb7TnWL03DoDvI64h1tnNa3rjWV2dcuv0TpFBFHs5hWKv/aH/VV9OYMD
         I/1k9Ou55PEXZ6yLQt16DvElq3k7k9pNdxx3b4C6PMEttzRRzrbFxhYHnEHfuvr+Wk3t
         ypq6MzL2y0aslS5bO/TAeLbqcQ7Y0DX8jPPBe/AMBVTjWCuRRUR2X9+a8F8aMjdbU/a8
         dKkVISFtc3F0XCtILuK79Dmr71jIqegYDPfgwxwBl17h3HED0kC7e+u+2zh4F+8AvmUv
         YE0GC9SUe/pyJoIk/Opfgn4uM+FTzg3sdXGs3vzPNjIZZN3sZnmAHEEdpAN9yq2dkEXX
         11Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aW0XEkfgmnGUj6MQq3cL7ek4WUi9ud1QMs7+k8X4OHc=;
        b=ffW5zxl0bEc+a3V1COtdVsm1XG1Trf/vWSmF7rxOIL9qge8+vCiNfBFYvDy+uou/Pn
         KsXTexflJlx8ZDLFwcgGUQ7/YKI0ReBIilq0scPbSCKBKJPTZ3a2a7pvUYoEBqRXrQ2N
         WPf4+KjKvEvTxFdrVHlr0R0tcV8mgFYZKai9EaTzAFNsso6SWa7T67k9bAemRHyrELi/
         yr83qR9s4djksqGTM6+f6wuh+HSVFEsc4e2kaS4dyFl1gd5bDxojryr3xRweMCGKtckH
         pbMYAdEqabW8+oghif5vdZqDq9nt2X3uasKYOtH2JfzpCDPuwxg/BS0A9XbEn8VsHLnl
         nvxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dGS/0tG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7si990395qke.129.2018.05.09.11.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dGS/0tG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTV4-0001Vn-7d
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:07:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJK-00058m-Fu
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJH-0005mI-0W
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:30 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:38257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJG-0005kE-DY
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:26 -0400
Received: by mail-pg0-x243.google.com with SMTP id n9-v6so23007857pgq.5
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aW0XEkfgmnGUj6MQq3cL7ek4WUi9ud1QMs7+k8X4OHc=;
	b=dGS/0tG7jbAZAwxpMJLmbQrgvpruUoMZ6GJ2k57rbK+iHiDPcF5V43aJehAFljNJUs
	ipJXSafiP/J3lExwpyzF8VkjBjQx4Za0Sm1Vbwof8+P6LdfS9MNVWdFZAdAHyDE8ao93
	E8z6sGpM2FDYykHTXmlfewg9mQNuqcKMrYxsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aW0XEkfgmnGUj6MQq3cL7ek4WUi9ud1QMs7+k8X4OHc=;
	b=QW6HD4rn8dd+YU4Huuh5M0SUGkW9kUM8+JVfz89jh4s1HtsSdCK8paSzQZPCOiavuR
	eJ2zJbu0bjCwz+fEWjUgYZ5fPq8dg7CrOaY7Yz4lSy/LEeG2Su4OVIpuWyAGJaGYEjb0
	mYH687BDp/Q4wMbgHh0rzJUy2ljgEKhe7qorx01WaZQCYe/gSjPqSL5DSrtv0qhIuCye
	KjIIKHMNoGrZKPtVs1Vs78p6zodGexs45nInHnDde0zBmzo1Z3T/Vqd2v2L5vkEkoJie
	foMEYftUIlSmTyDnMNHgaUpBdp209mu+U9PQbYgvSU/70qZNvB57+Zc2Z98bDkW4XT7j
	f4pg==
X-Gm-Message-State: ALQs6tB0UEH3/sAGjuIum/ThgZmAh1IJ+QUf2S94eINN/aoJ8FJ59II/
	bFwtQqImGj9zYgBSqjh+2nVFaA==
X-Received: by 2002:a63:be42:: with SMTP id
	g2-v6mr21599512pgo.44.1525888525256; 
	Wed, 09 May 2018 10:55:25 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:44 -0700
Message-Id: <20180509175458.15642-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PULL 14/28] target/sparc: convert to DisasContextBase
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
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rAIZ1JJC3t2m

From: "Emilio G. Cota" <cota@braap.org>

Notes:

- pc and npc are left unmodified, since they can point to out-of-TB
  jump targets.

- Got rid of last_pc in gen_intermediate_code(), using base.pc_next
  instead. Only update pc_next (1) on a breakpoint (so that tb->size
  includes the insn), and (2) after reading the current instruction
  from memory. This allows us to use base.pc_next in the BP check,
  which is what the translator loop does.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 92 ++++++++++++++++++++--------------------
 1 file changed, 45 insertions(+), 47 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 03c6510717..889c43976d 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -67,14 +67,13 @@ static TCGv_i64 cpu_fpr[TARGET_DPREGS];
 #include "exec/gen-icount.h"
 
 typedef struct DisasContext {
+    DisasContextBase base;
     target_ulong pc;    /* current Program Counter: integer or DYNAMIC_PC */
     target_ulong npc;   /* next PC: integer or DYNAMIC_PC or JUMP_PC */
     target_ulong jump_pc[2]; /* used when JUMP_PC pc value is used */
-    DisasJumpType is_jmp;
     int mem_idx;
     bool fpu_enabled;
     bool address_mask_32bit;
-    bool singlestep;
 #ifndef CONFIG_USER_ONLY
     bool supervisor;
 #ifdef TARGET_SPARC64
@@ -83,7 +82,6 @@ typedef struct DisasContext {
 #endif
 
     uint32_t cc_op;  /* current CC operation */
-    struct TranslationBlock *tb;
     sparc_def_t *def;
     TCGv_i32 t32[3];
     TCGv ttl[5];
@@ -342,13 +340,13 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
 static inline bool use_goto_tb(DisasContext *s, target_ulong pc,
                                target_ulong npc)
 {
-    if (unlikely(s->singlestep)) {
+    if (unlikely(s->base.singlestep_enabled || singlestep)) {
         return false;
     }
 
 #ifndef CONFIG_USER_ONLY
-    return (pc & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) &&
-           (npc & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK);
+    return (pc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) &&
+           (npc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK);
 #else
     return true;
 #endif
@@ -362,7 +360,7 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num,
         tcg_gen_goto_tb(tb_num);
         tcg_gen_movi_tl(cpu_pc, pc);
         tcg_gen_movi_tl(cpu_npc, npc);
-        tcg_gen_exit_tb((uintptr_t)s->tb + tb_num);
+        tcg_gen_exit_tb((uintptr_t)s->base.tb + tb_num);
     } else {
         /* jump to another page: currently not optimized */
         tcg_gen_movi_tl(cpu_pc, pc);
@@ -996,7 +994,7 @@ static void gen_branch_a(DisasContext *dc, target_ulong pc1)
     gen_set_label(l1);
     gen_goto_tb(dc, 1, npc + 4, npc + 8);
 
-    dc->is_jmp = DISAS_NORETURN;
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_branch_n(DisasContext *dc, target_ulong pc1)
@@ -1079,7 +1077,7 @@ static void gen_exception(DisasContext *dc, int which)
     t = tcg_const_i32(which);
     gen_helper_raise_exception(cpu_env, t);
     tcg_temp_free_i32(t);
-    dc->is_jmp = DISAS_NORETURN;
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_check_align(TCGv addr, int mask)
@@ -2442,7 +2440,7 @@ static void gen_ldstub_asi(DisasContext *dc, TCGv dst, TCGv addr, int insn)
     default:
         /* ??? In theory, this should be raise DAE_invalid_asi.
            But the SS-20 roms do ldstuba [%l0] #ASI_M_CTL, %o1.  */
-        if (tb_cflags(dc->tb) & CF_PARALLEL) {
+        if (tb_cflags(dc->base.tb) & CF_PARALLEL) {
             gen_helper_exit_atomic(cpu_env);
         } else {
             TCGv_i32 r_asi = tcg_const_i32(da.asi);
@@ -3352,7 +3350,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 
                 if (cond == 8) {
                     /* An unconditional trap ends the TB.  */
-                    dc->is_jmp = DISAS_NORETURN;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     goto jmp_insn;
                 } else {
                     /* A conditional trap falls through to the next insn.  */
@@ -4332,7 +4330,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 save_state(dc);
                                 gen_op_next_insn();
                                 tcg_gen_exit_tb(0);
-                                dc->is_jmp = DISAS_NORETURN;
+                                dc->base.is_jmp = DISAS_NORETURN;
                                 break;
                             case 0x6: /* V9 wrfprs */
                                 tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
@@ -4341,7 +4339,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 save_state(dc);
                                 gen_op_next_insn();
                                 tcg_gen_exit_tb(0);
-                                dc->is_jmp = DISAS_NORETURN;
+                                dc->base.is_jmp = DISAS_NORETURN;
                                 break;
                             case 0xf: /* V9 sir, nop if user */
 #if !defined(CONFIG_USER_ONLY)
@@ -4469,7 +4467,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             save_state(dc);
                             gen_op_next_insn();
                             tcg_gen_exit_tb(0);
-                            dc->is_jmp = DISAS_NORETURN;
+                            dc->base.is_jmp = DISAS_NORETURN;
 #endif
                         }
                         break;
@@ -4625,7 +4623,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 save_state(dc);
                                 gen_op_next_insn();
                                 tcg_gen_exit_tb(0);
-                                dc->is_jmp = DISAS_NORETURN;
+                                dc->base.is_jmp = DISAS_NORETURN;
                                 break;
                             case 1: // htstate
                                 // XXX gen_op_wrhtstate();
@@ -5691,7 +5689,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     } else if (dc->npc == JUMP_PC) {
         /* we can do a static jump */
         gen_branch2(dc, dc->jump_pc[0], dc->jump_pc[1], cpu_cond);
-        dc->is_jmp = DISAS_NORETURN;
+        dc->base.is_jmp = DISAS_NORETURN;
     } else {
         dc->pc = dc->npc;
         dc->npc = dc->npc + 4;
@@ -5742,25 +5740,25 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
 {
     CPUSPARCState *env = cs->env_ptr;
-    target_ulong pc_start, last_pc;
     DisasContext dc1, *dc = &dc1;
-    int num_insns;
     int max_insns;
     unsigned int insn;
 
     memset(dc, 0, sizeof(DisasContext));
-    dc->tb = tb;
-    pc_start = tb->pc;
-    dc->pc = pc_start;
-    last_pc = dc->pc;
-    dc->is_jmp = DISAS_NEXT;
+    dc->base.tb = tb;
+    dc->base.pc_first = tb->pc;
+    dc->base.pc_next = tb->pc;
+    dc->base.is_jmp = DISAS_NEXT;
+    dc->base.num_insns = 0;
+    dc->base.singlestep_enabled = cs->singlestep_enabled;
+
+    dc->pc = dc->base.pc_first;
     dc->npc = (target_ulong) tb->cs_base;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->mem_idx = tb->flags & TB_FLAG_MMU_MASK;
     dc->def = &env->def;
     dc->fpu_enabled = tb_fpu_enabled(tb->flags);
     dc->address_mask_32bit = tb_am_enabled(tb->flags);
-    dc->singlestep = (cs->singlestep_enabled || singlestep);
 #ifndef CONFIG_USER_ONLY
     dc->supervisor = (tb->flags & TB_FLAG_SUPER) != 0;
 #endif
@@ -5772,7 +5770,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
 #endif
 #endif
 
-    num_insns = 0;
     max_insns = tb_cflags(tb) & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -5780,6 +5777,9 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
     if (max_insns > TCG_MAX_INSNS) {
         max_insns = TCG_MAX_INSNS;
     }
+    if (dc->base.singlestep_enabled || singlestep) {
+        max_insns = 1;
+    }
 
     gen_tb_start(tb);
     do {
@@ -5789,51 +5789,48 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
         } else {
             tcg_gen_insn_start(dc->pc, dc->npc);
         }
-        num_insns++;
-        last_pc = dc->pc;
+        dc->base.num_insns++;
 
-        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
-            if (dc->pc != pc_start) {
+        if (unlikely(cpu_breakpoint_test(cs, dc->base.pc_next, BP_ANY))) {
+            if (dc->pc != dc->base.pc_first) {
                 save_state(dc);
             }
             gen_helper_debug(cpu_env);
             tcg_gen_exit_tb(0);
-            dc->is_jmp = DISAS_NORETURN;
+            dc->base.is_jmp = DISAS_NORETURN;
+            dc->base.pc_next += 4;
             goto exit_gen_loop;
         }
 
-        if (num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
+        if (dc->base.num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
             gen_io_start();
         }
 
         insn = cpu_ldl_code(env, dc->pc);
+        dc->base.pc_next += 4;
 
         disas_sparc_insn(dc, insn);
 
-        if (dc->is_jmp == DISAS_NORETURN) {
+        if (dc->base.is_jmp == DISAS_NORETURN) {
             break;
         }
         /* if the next PC is different, we abort now */
-        if (dc->pc != (last_pc + 4))
+        if (dc->pc != dc->base.pc_next) {
             break;
+        }
         /* if we reach a page boundary, we stop generation so that the
            PC of a TT_TFAULT exception is always in the right page */
         if ((dc->pc & (TARGET_PAGE_SIZE - 1)) == 0)
             break;
-        /* if single step mode, we generate only one instruction and
-           generate an exception */
-        if (dc->singlestep) {
-            break;
-        }
     } while (!tcg_op_buf_full() &&
-             (dc->pc - pc_start) < (TARGET_PAGE_SIZE - 32) &&
-             num_insns < max_insns);
+             (dc->pc - dc->base.pc_first) < (TARGET_PAGE_SIZE - 32) &&
+             dc->base.num_insns < max_insns);
 
  exit_gen_loop:
     if (tb_cflags(tb) & CF_LAST_IO) {
         gen_io_end();
     }
-    if (dc->is_jmp != DISAS_NORETURN) {
+    if (dc->base.is_jmp != DISAS_NORETURN) {
         if (dc->pc != DYNAMIC_PC &&
             (dc->npc != DYNAMIC_PC && dc->npc != JUMP_PC)) {
             /* static PC and NPC: we can use direct chaining */
@@ -5846,18 +5843,19 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
             tcg_gen_exit_tb(0);
         }
     }
-    gen_tb_end(tb, num_insns);
+    gen_tb_end(tb, dc->base.num_insns);
 
-    tb->size = last_pc + 4 - pc_start;
-    tb->icount = num_insns;
+    tb->size = dc->base.pc_next - dc->base.pc_first;
+    tb->icount = dc->base.num_insns;
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(pc_start)) {
+        && qemu_log_in_addr_range(dc->base.pc_first)) {
         qemu_log_lock();
         qemu_log("--------------\n");
-        qemu_log("IN: %s\n", lookup_symbol(pc_start));
-        log_target_disas(cs, pc_start, last_pc + 4 - pc_start);
+        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
+        log_target_disas(cs, dc->base.pc_first,
+                         dc->base.pc_next - dc->base.pc_first);
         qemu_log("\n");
         qemu_log_unlock();
     }
-- 
2.17.0

