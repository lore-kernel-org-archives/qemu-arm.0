Received: by 10.28.4.212 with SMTP id 203csp62564wme;
        Wed, 9 May 2018 11:08:57 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqmlIWztwizwQKW1cUa19H7TqhsEeYdizS31ygsQ8TjX36RWOsBv/pjv8PTDiwyX88iy7cm
X-Received: by 2002:ac8:2fe1:: with SMTP id m30-v6mr33047777qta.43.1525889337161;
        Wed, 09 May 2018 11:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889337; cv=none;
        d=google.com; s=arc-20160816;
        b=Ejyud3zkrhUmUiJYhiORPUy7BkudToi2O/fWrUsOaEF+mjW6tuWyw/Vutxb7FolQmH
         nbNyhzlrKwLLV28ajqSefB8TA4A8qV81ycjQgCEFIFyJhP8ETCBz7VlVgQfEWyE1sR26
         PqOC2IXPgU4aQ2tD68tbtdxGYT5A00y89YhVlEoUGZTo+uHTq7WUaYdRoOYOYw8Vhdal
         MkpcILh7p1bqUkdh4P/dbp+xY19d3OVIu4hamOahCX4wUQjIdZs3c2Ar/RHQXno8aGey
         tOmaUHUsR/SvPHnq1+CeJAv+RdltDPB1qrijoUX/7JfKS9Qdy2HW1ptlBcWDp/99sVc1
         PQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=yRv7MkH8GFshXfi8eMiCV+pemcQYkSpibNkeFO3ybCk=;
        b=eB7zde4tEduopJz2XxNpQJJKwZpb2Zwfj7YJBcgdFDXf+N1rtl2xtiAQcR00ytnSGW
         6KgOH0Dae8Tk3ycO+gR0Qj33d/+LEbwR2MdkkdF4W2E9dA1ZkKsPIvbu9zP91XmSZ/9Z
         KE/iPC+lZ2nxbyvxH8fUD7qCZE4+zYdeDDBSFM/b0BI1Sf24gPu7C4fJL62SpBCxATEx
         mLbIBrYQfd/LSMllmwkhmLpf8LV6gCgb+2j/8+sbcmHvJ/79/Nv2sNevKuTMBnjQbXkE
         K0pSnRDKCZ4HSCPQ8y2WYORVTyaCXsXwoFQfnE6MOk4nI5qT4Avvr41VX9emWNd2yCQN
         TElQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VTdQl//D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n17-v6si310418qvg.289.2018.05.09.11.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VTdQl//D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTWK-00021z-IP
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:08:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJW-0005Qu-4g
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJR-00061e-Ln
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:41 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:44291)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJR-0005zR-6D
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:37 -0400
Received: by mail-pl0-x242.google.com with SMTP id e6-v6so4745197plt.11
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yRv7MkH8GFshXfi8eMiCV+pemcQYkSpibNkeFO3ybCk=;
	b=VTdQl//Dwbd0UNWerxD4NkcfZFsmiRYeH0f0+nhFhaekgK5MTcWxJ639s1tWsLyk+p
	eLykzYizWF7Z7mM+N+cx4Q5dVkJWIktD5Ahpmy6CehHkIbSNUNtE0z+BiU5pBtqy138J
	DW2AF4GGcfmmv3ZyQmvuK1mBtGpzNFvC47ifQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yRv7MkH8GFshXfi8eMiCV+pemcQYkSpibNkeFO3ybCk=;
	b=DJmAxFqUPuyXmwRW2XduXjFc40a3oWLFIMtq0yEvhAKqWCkv9EY1k/7gt2EbyempX7
	l7ltgXkcJNOhQVNGXEqjb1WGHx7ip3Cl3ZfEHiRbUtXSz+ITkUzzXSiDNqYslC859NbD
	/WdSX8lxGk/RI/iKQNGbEEcqZScZ5GXFaenFP6Lrp88QSlYm+cqUywAWG8OHRc7wmWLe
	broaqXz7TFeBcqHJIRAx+NlEM5KkthaqdPZmlq+UsSf23wh5XYyBONbUdiJlUfaCA8Yz
	FlCd6rLdMNpsu8NiPCJzknZwQzaaf/PMSoS4fRudS26zQp8heFf+ugarTC9EW4TBnhrx
	SEGQ==
X-Gm-Message-State: ALQs6tBIeLUwOUMhVwiXPLFnrPAJWZluLE1vyKSXEHeFygvl78Sizyev
	Y4c2DZyArQEQ1CvGD0/w4tsXzKuRe0M=
X-Received: by 2002:a17:902:2804:: with SMTP id
	e4-v6mr46254962plb.153.1525888535484; 
	Wed, 09 May 2018 10:55:35 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:50 -0700
Message-Id: <20180509175458.15642-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-devel] [PULL 20/28] target/mips: convert to TranslatorOps
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
X-TUID: 7lnuDOBnxFYb

From: "Emilio G. Cota" <cota@braap.org>

Notes:

- DISAS_TOO_MANY replaces the former "break" in the translation loop.
  However, care must be taken not to overwrite a previous condition
  in is_jmp; that's why in translate_insn we first check is_jmp and
  return if it's != DISAS_NEXT.

- Added an assert in translate_insn, before exiting due to an exception,
  to make sure that is_jmp is set to DISAS_NORETURN (the exception
  generation function always sets it.)

- Added an assert for the default case in is_jmp's switch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/translate.c | 237 ++++++++++++++++++++--------------------
 1 file changed, 118 insertions(+), 119 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7a931ea3e7..9eff842c39 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1432,6 +1432,7 @@ static TCGv_i64 msa_wr_d[64];
 typedef struct DisasContext {
     DisasContextBase base;
     target_ulong saved_pc;
+    target_ulong page_start;
     uint32_t opcode;
     int insn_flags;
     int32_t CP0_Config1;
@@ -20194,24 +20195,12 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
+static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUMIPSState *env = cs->env_ptr;
-    DisasContext ctx1;
-    DisasContext *ctx = &ctx1;
-    target_ulong page_start;
-    int max_insns;
-    int insn_bytes;
-    int is_slot;
 
-    ctx->base.tb = tb;
-    ctx->base.pc_first = tb->pc;
-    ctx->base.pc_next = tb->pc;
-    ctx->base.is_jmp = DISAS_NEXT;
-    ctx->base.singlestep_enabled = cs->singlestep_enabled;
-    ctx->base.num_insns = 0;
-
-    page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
+    ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
     ctx->saved_pc = -1;
     ctx->insn_flags = env->insn_flags;
     ctx->CP0_Config1 = env->CP0_Config1;
@@ -20244,99 +20233,102 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 #endif
     ctx->default_tcg_memop_mask = (ctx->insn_flags & ISA_MIPS32R6) ?
                                   MO_UNALN : MO_ALIGN;
-    max_insns = tb_cflags(tb) & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
+
+    LOG_DISAS("\ntb %p idx %d hflags %04x\n", ctx->base.tb, ctx->mem_idx,
+              ctx->hflags);
+}
+
+static void mips_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
+{
+}
+
+static void mips_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    tcg_gen_insn_start(ctx->base.pc_next, ctx->hflags & MIPS_HFLAG_BMASK,
+                       ctx->btarget);
+}
+
+static bool mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                     const CPUBreakpoint *bp)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    save_cpu_state(ctx, 1);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    gen_helper_raise_exception_debug(cpu_env);
+    /* The address covered by the breakpoint must be included in
+       [tb->pc, tb->pc + tb->size) in order to for it to be
+       properly cleared -- thus we increment the PC here so that
+       the logic setting tb->size below does the right thing.  */
+    ctx->base.pc_next += 4;
+    return true;
+}
+
+static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+    CPUMIPSState *env = cs->env_ptr;
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    int insn_bytes;
+    int is_slot;
+
+    is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
+    if (!(ctx->hflags & MIPS_HFLAG_M16)) {
+        ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+        insn_bytes = 4;
+        decode_opc(env, ctx);
+    } else if (ctx->insn_flags & ASE_MICROMIPS) {
+        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+        insn_bytes = decode_micromips_opc(env, ctx);
+    } else if (ctx->insn_flags & ASE_MIPS16) {
+        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+        insn_bytes = decode_mips16_opc(env, ctx);
+    } else {
+        generate_exception_end(ctx, EXCP_RI);
+        g_assert(ctx->base.is_jmp == DISAS_NORETURN);
+        return;
     }
 
-    LOG_DISAS("\ntb %p idx %d hflags %04x\n", tb, ctx->mem_idx, ctx->hflags);
-    gen_tb_start(tb);
-    while (ctx->base.is_jmp == DISAS_NEXT) {
-        tcg_gen_insn_start(ctx->base.pc_next, ctx->hflags & MIPS_HFLAG_BMASK,
-                           ctx->btarget);
-        ctx->base.num_insns++;
-
-        if (unlikely(cpu_breakpoint_test(cs, ctx->base.pc_next, BP_ANY))) {
-            save_cpu_state(ctx, 1);
-            ctx->base.is_jmp = DISAS_NORETURN;
-            gen_helper_raise_exception_debug(cpu_env);
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            ctx->base.pc_next += 4;
-            goto done_generating;
+    if (ctx->hflags & MIPS_HFLAG_BMASK) {
+        if (!(ctx->hflags & (MIPS_HFLAG_BDS16 | MIPS_HFLAG_BDS32 |
+                             MIPS_HFLAG_FBNSLOT))) {
+            /* force to generate branch as there is neither delay nor
+               forbidden slot */
+            is_slot = 1;
         }
-
-        if (ctx->base.num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
-            gen_io_start();
+        if ((ctx->hflags & MIPS_HFLAG_M16) &&
+            (ctx->hflags & MIPS_HFLAG_FBNSLOT)) {
+            /* Force to generate branch as microMIPS R6 doesn't restrict
+               branches in the forbidden slot. */
+            is_slot = 1;
         }
-
-        is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
-        if (!(ctx->hflags & MIPS_HFLAG_M16)) {
-            ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
-            insn_bytes = 4;
-            decode_opc(env, ctx);
-        } else if (ctx->insn_flags & ASE_MICROMIPS) {
-            ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
-            insn_bytes = decode_micromips_opc(env, ctx);
-        } else if (ctx->insn_flags & ASE_MIPS16) {
-            ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
-            insn_bytes = decode_mips16_opc(env, ctx);
-        } else {
-            generate_exception_end(ctx, EXCP_RI);
-            break;
-        }
-
-        if (ctx->hflags & MIPS_HFLAG_BMASK) {
-            if (!(ctx->hflags & (MIPS_HFLAG_BDS16 | MIPS_HFLAG_BDS32 |
-                                MIPS_HFLAG_FBNSLOT))) {
-                /* force to generate branch as there is neither delay nor
-                   forbidden slot */
-                is_slot = 1;
-            }
-            if ((ctx->hflags & MIPS_HFLAG_M16) &&
-                (ctx->hflags & MIPS_HFLAG_FBNSLOT)) {
-                /* Force to generate branch as microMIPS R6 doesn't restrict
-                   branches in the forbidden slot. */
-                is_slot = 1;
-            }
-        }
-        if (is_slot) {
-            gen_branch(ctx, insn_bytes);
-        }
-        ctx->base.pc_next += insn_bytes;
-
-        /* Execute a branch and its delay slot as a single instruction.
-           This is what GDB expects and is consistent with what the
-           hardware does (e.g. if a delay slot instruction faults, the
-           reported PC is the PC of the branch).  */
-        if (ctx->base.singlestep_enabled &&
-            (ctx->hflags & MIPS_HFLAG_BMASK) == 0) {
-            break;
-        }
-
-        if (ctx->base.pc_next - page_start >= TARGET_PAGE_SIZE) {
-            break;
-        }
-
-        if (tcg_op_buf_full()) {
-            break;
-        }
-
-        if (ctx->base.num_insns >= max_insns) {
-            break;
-        }
-
-        if (singlestep)
-            break;
     }
-    if (tb_cflags(tb) & CF_LAST_IO) {
-        gen_io_end();
+    if (is_slot) {
+        gen_branch(ctx, insn_bytes);
     }
+    ctx->base.pc_next += insn_bytes;
+
+    if (ctx->base.is_jmp != DISAS_NEXT) {
+        return;
+    }
+    /* Execute a branch and its delay slot as a single instruction.
+       This is what GDB expects and is consistent with what the
+       hardware does (e.g. if a delay slot instruction faults, the
+       reported PC is the PC of the branch).  */
+    if (ctx->base.singlestep_enabled &&
+        (ctx->hflags & MIPS_HFLAG_BMASK) == 0) {
+        ctx->base.is_jmp = DISAS_TOO_MANY;
+    }
+    if (ctx->base.pc_next - ctx->page_start >= TARGET_PAGE_SIZE) {
+        ctx->base.is_jmp = DISAS_TOO_MANY;
+    }
+}
+
+static void mips_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
     if (ctx->base.singlestep_enabled && ctx->base.is_jmp != DISAS_NORETURN) {
         save_cpu_state(ctx, ctx->base.is_jmp != DISAS_EXIT);
         gen_helper_raise_exception_debug(cpu_env);
@@ -20347,6 +20339,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
             tcg_gen_lookup_and_goto_ptr();
             break;
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
             save_cpu_state(ctx, 0);
             gen_goto_tb(ctx, 0, ctx->base.pc_next);
             break;
@@ -20354,28 +20347,34 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
             tcg_gen_exit_tb(0);
             break;
         case DISAS_NORETURN:
-        default:
             break;
+        default:
+            g_assert_not_reached();
         }
     }
-done_generating:
-    gen_tb_end(tb, ctx->base.num_insns);
+}
 
-    tb->size = ctx->base.pc_next - ctx->base.pc_first;
-    tb->icount = ctx->base.num_insns;
+static void mips_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+{
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
+}
 
-#ifdef DEBUG_DISAS
-    LOG_DISAS("\n");
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(ctx->base.pc_first)) {
-        qemu_log_lock();
-        qemu_log("IN: %s\n", lookup_symbol(ctx->base.pc_first));
-        log_target_disas(cs, ctx->base.pc_first,
-                         ctx->base.pc_next - ctx->base.pc_first);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
-#endif
+static const TranslatorOps mips_tr_ops = {
+    .init_disas_context = mips_tr_init_disas_context,
+    .tb_start           = mips_tr_tb_start,
+    .insn_start         = mips_tr_insn_start,
+    .breakpoint_check   = mips_tr_breakpoint_check,
+    .translate_insn     = mips_tr_translate_insn,
+    .tb_stop            = mips_tr_tb_stop,
+    .disas_log          = mips_tr_disas_log,
+};
+
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
+{
+    DisasContext ctx;
+
+    translator_loop(&mips_tr_ops, &ctx.base, cs, tb);
 }
 
 static void fpu_dump_state(CPUMIPSState *env, FILE *f, fprintf_function fpu_fprintf,
-- 
2.17.0

