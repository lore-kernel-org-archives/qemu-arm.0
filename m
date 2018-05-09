Received: by 10.28.4.212 with SMTP id 203csp61601wme;
        Wed, 9 May 2018 11:08:00 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrCCRJRsjuwobmE15DOs4xqvpNZhux+D0Ck92GbtG5DsvMAuDOZelqtPLnYhkqqz6cw3C8D
X-Received: by 10.55.159.131 with SMTP id i125mr7275173qke.157.1525889279913;
        Wed, 09 May 2018 11:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889279; cv=none;
        d=google.com; s=arc-20160816;
        b=YSb857jJLyoFleweQRuGiIKpYalIGjNagViQ0B2GYztZyFbYK/ptV85QRdein2sady
         RzMekp9QwDHzEk7UABhWA4ihX0/ldZHKJgynuycX0nfMlL1e2YSA8EUXcMrHk+5tywA8
         cki+8oQQwUwaOwGOekiDSDPfGRlFSDLrbPu4t9K4exJIxHQjOvfSTwRcf1vkCQSQBeCA
         TZhyHuYxCPxebgJ4x/4369YThNlCVIpZ7c5zUWPfrrgSGFyV+Q2wB7iuhva3xkBQ9leo
         QcAyl58Dz7AR4jNejU9tcFpDhVKtZ0GpN0zt3QZyeqxU5M28yvbMfEQcaoVcD4H9+9fC
         mefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=tHmg5eLHi+EzkAo0eEENkBnSNWaSOcxMvFpNbUagEVg=;
        b=JEjJXoUM7buRb0idaY7KJ7MmI3gQBtleogTGRbQDRzPg/c4lezozIaWncsC5LvvMeS
         9SjAytucEk1pgs+MZ3a80F8nLb7yn60sMIXBQGKuzJ1dI913i83SgixXXaYQN08GlInd
         L7KQOWpCHOgTFKErJZ08jDLZ8j4vv6drFJ4oPvSGhcd0wvPQsIDyfUQa5XsDGq9PddNh
         dBckB0LRpqv5CkKcknuzo7U+G8WPVvyjydU1JCLtsT6yfJJYRkrTVyQnrGN/RehyvxiH
         RD2WTsZKsr0g/4NS4OlvdKYXEdfrNonZkqcJWWDLW4uk6BfC9A2HUJ+yqpv515N/cvJg
         vU+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CBtsmAqp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4-v6si15228015qtl.239.2018.05.09.11.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CBtsmAqp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTVP-0001re-AJ
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:07:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJO-0005HR-Qo
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJJ-0005p6-2I
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:34 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:41118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJI-0005ne-Ad
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:28 -0400
Received: by mail-pf0-x244.google.com with SMTP id v63so25993880pfk.8
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tHmg5eLHi+EzkAo0eEENkBnSNWaSOcxMvFpNbUagEVg=;
	b=CBtsmAqpJ4zMb6ksiU4giWAvqAygqd6gxzvsEbOPLuHOWWp6YMvQs3tea/8peYS/9b
	QDPGYcE/mplrX74kQVu+g3LJMU64PzveHo1WQdVu0Z+cW6050nmo4gbO2QiFlpq0/rtw
	DNTQ9hwKcvq6lwK3mDzR7IYJmh7lLyeZjk2AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tHmg5eLHi+EzkAo0eEENkBnSNWaSOcxMvFpNbUagEVg=;
	b=el6/DyeG3HSNUzR2cRbBVvMmNpRcaNHqJ84CUkAY8PuMZfZhPElOV+vxIi7CMvsDLI
	NriGnEXoiyE3vLecF3bw2K/wCmC9qQPDVRa/y2Gh2cxrPJ9pLuFZl/ML5v7WF6HuqmBY
	QPpCLYH4T3a1wQAel/iDvGZSVb186kjgvqiCFdSnZzs6cEWQVJZ38QUFqxvnPb+Oy7V3
	40mVWLAATA4fh7NLnq8HU6cydQJZpE8sSd+ytSDf/lZOXMXqyiZswp7pwc4ZTkCxytmi
	vI7+a5bNj0N9QNVN30KzhHmHxSDdo9Kmbp2541lYATM+3EmzjX+YFMGndypnl5hUCiI4
	xUvg==
X-Gm-Message-State: ALQs6tA22tlNfXfGFlKTgdfAXNYg2qQEp2cbC+NMS9MvmN3S9QlFH/Hv
	hFn2FvD5vWEJvlFK/zXELQuPDA==
X-Received: by 2002:a63:6110:: with SMTP id
	v16-v6mr36261482pgb.292.1525888527003; 
	Wed, 09 May 2018 10:55:27 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:45 -0700
Message-Id: <20180509175458.15642-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PULL 15/28] target/sparc: convert to TranslatorOps
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
X-TUID: ztN8NBXSbcBu

From: "Emilio G. Cota" <cota@braap.org>

Notes:

- Moved the cross-page check from the end of translate_insn to
  init_disas_context.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 178 +++++++++++++++++++--------------------
 1 file changed, 88 insertions(+), 90 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 889c43976d..40b2eaad39 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5737,99 +5737,91 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     }
 }
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
+static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUSPARCState *env = cs->env_ptr;
-    DisasContext dc1, *dc = &dc1;
-    int max_insns;
-    unsigned int insn;
-
-    memset(dc, 0, sizeof(DisasContext));
-    dc->base.tb = tb;
-    dc->base.pc_first = tb->pc;
-    dc->base.pc_next = tb->pc;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
+    int bound;
 
     dc->pc = dc->base.pc_first;
-    dc->npc = (target_ulong) tb->cs_base;
+    dc->npc = (target_ulong)dc->base.tb->cs_base;
     dc->cc_op = CC_OP_DYNAMIC;
-    dc->mem_idx = tb->flags & TB_FLAG_MMU_MASK;
+    dc->mem_idx = dc->base.tb->flags & TB_FLAG_MMU_MASK;
     dc->def = &env->def;
-    dc->fpu_enabled = tb_fpu_enabled(tb->flags);
-    dc->address_mask_32bit = tb_am_enabled(tb->flags);
+    dc->fpu_enabled = tb_fpu_enabled(dc->base.tb->flags);
+    dc->address_mask_32bit = tb_am_enabled(dc->base.tb->flags);
 #ifndef CONFIG_USER_ONLY
-    dc->supervisor = (tb->flags & TB_FLAG_SUPER) != 0;
+    dc->supervisor = (dc->base.tb->flags & TB_FLAG_SUPER) != 0;
 #endif
 #ifdef TARGET_SPARC64
     dc->fprs_dirty = 0;
-    dc->asi = (tb->flags >> TB_FLAG_ASI_SHIFT) & 0xff;
+    dc->asi = (dc->base.tb->flags >> TB_FLAG_ASI_SHIFT) & 0xff;
 #ifndef CONFIG_USER_ONLY
-    dc->hypervisor = (tb->flags & TB_FLAG_HYPER) != 0;
+    dc->hypervisor = (dc->base.tb->flags & TB_FLAG_HYPER) != 0;
 #endif
 #endif
+    /*
+     * if we reach a page boundary, we stop generation so that the
+     * PC of a TT_TFAULT exception is always in the right page
+     */
+    bound = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
+    dc->base.max_insns = MIN(dc->base.max_insns, bound);
+}
 
-    max_insns = tb_cflags(tb) & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
+static void sparc_tr_tb_start(DisasContextBase *db, CPUState *cs)
+{
+}
+
+static void sparc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    if (dc->npc & JUMP_PC) {
+        assert(dc->jump_pc[1] == dc->pc + 4);
+        tcg_gen_insn_start(dc->pc, dc->jump_pc[0] | JUMP_PC);
+    } else {
+        tcg_gen_insn_start(dc->pc, dc->npc);
     }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
+}
+
+static bool sparc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                      const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    if (dc->pc != dc->base.pc_first) {
+        save_state(dc);
     }
-    if (dc->base.singlestep_enabled || singlestep) {
-        max_insns = 1;
+    gen_helper_debug(cpu_env);
+    tcg_gen_exit_tb(0);
+    dc->base.is_jmp = DISAS_NORETURN;
+    /* update pc_next so that the current instruction is included in tb->size */
+    dc->base.pc_next += 4;
+    return true;
+}
+
+static void sparc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    CPUSPARCState *env = cs->env_ptr;
+    unsigned int insn;
+
+    insn = cpu_ldl_code(env, dc->pc);
+    dc->base.pc_next += 4;
+    disas_sparc_insn(dc, insn);
+
+    if (dc->base.is_jmp == DISAS_NORETURN) {
+        return;
     }
-
-    gen_tb_start(tb);
-    do {
-        if (dc->npc & JUMP_PC) {
-            assert(dc->jump_pc[1] == dc->pc + 4);
-            tcg_gen_insn_start(dc->pc, dc->jump_pc[0] | JUMP_PC);
-        } else {
-            tcg_gen_insn_start(dc->pc, dc->npc);
-        }
-        dc->base.num_insns++;
-
-        if (unlikely(cpu_breakpoint_test(cs, dc->base.pc_next, BP_ANY))) {
-            if (dc->pc != dc->base.pc_first) {
-                save_state(dc);
-            }
-            gen_helper_debug(cpu_env);
-            tcg_gen_exit_tb(0);
-            dc->base.is_jmp = DISAS_NORETURN;
-            dc->base.pc_next += 4;
-            goto exit_gen_loop;
-        }
-
-        if (dc->base.num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
-            gen_io_start();
-        }
-
-        insn = cpu_ldl_code(env, dc->pc);
-        dc->base.pc_next += 4;
-
-        disas_sparc_insn(dc, insn);
-
-        if (dc->base.is_jmp == DISAS_NORETURN) {
-            break;
-        }
-        /* if the next PC is different, we abort now */
-        if (dc->pc != dc->base.pc_next) {
-            break;
-        }
-        /* if we reach a page boundary, we stop generation so that the
-           PC of a TT_TFAULT exception is always in the right page */
-        if ((dc->pc & (TARGET_PAGE_SIZE - 1)) == 0)
-            break;
-    } while (!tcg_op_buf_full() &&
-             (dc->pc - dc->base.pc_first) < (TARGET_PAGE_SIZE - 32) &&
-             dc->base.num_insns < max_insns);
-
- exit_gen_loop:
-    if (tb_cflags(tb) & CF_LAST_IO) {
-        gen_io_end();
+    if (dc->pc != dc->base.pc_next) {
+        dc->base.is_jmp = DISAS_TOO_MANY;
     }
+}
+
+static void sparc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
     if (dc->base.is_jmp != DISAS_NORETURN) {
         if (dc->pc != DYNAMIC_PC &&
             (dc->npc != DYNAMIC_PC && dc->npc != JUMP_PC)) {
@@ -5843,23 +5835,29 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
             tcg_gen_exit_tb(0);
         }
     }
-    gen_tb_end(tb, dc->base.num_insns);
+}
 
-    tb->size = dc->base.pc_next - dc->base.pc_first;
-    tb->icount = dc->base.num_insns;
+static void sparc_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+{
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+}
 
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(dc->base.pc_first)) {
-        qemu_log_lock();
-        qemu_log("--------------\n");
-        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-        log_target_disas(cs, dc->base.pc_first,
-                         dc->base.pc_next - dc->base.pc_first);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
-#endif
+static const TranslatorOps sparc_tr_ops = {
+    .init_disas_context = sparc_tr_init_disas_context,
+    .tb_start           = sparc_tr_tb_start,
+    .insn_start         = sparc_tr_insn_start,
+    .breakpoint_check   = sparc_tr_breakpoint_check,
+    .translate_insn     = sparc_tr_translate_insn,
+    .tb_stop            = sparc_tr_tb_stop,
+    .disas_log          = sparc_tr_disas_log,
+};
+
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
+{
+    DisasContext dc = {};
+
+    translator_loop(&sparc_tr_ops, &dc.base, cs, tb);
 }
 
 void sparc_tcg_init(void)
-- 
2.17.0

