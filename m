Received: by 10.28.4.212 with SMTP id 203csp64500wme;
        Wed, 9 May 2018 11:10:55 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrKOTVxYYWzcdNDTK3WXFuf9uCRpMfq4l+NlbHdbZIk0ML+EYKKK642gnsTpR71xIWBZPiW
X-Received: by 2002:ac8:2f43:: with SMTP id k3-v6mr33754860qta.389.1525889455236;
        Wed, 09 May 2018 11:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889455; cv=none;
        d=google.com; s=arc-20160816;
        b=haAb3BA01dtMRkOivoFi55GDVoNe20h1vbIaPT5rHBIEGbSW3yn6xSTsxM2Ze/u1rk
         qim1P05qbLWfemPgH/dm8d9TWccf6DAwT/hGFDltEv3wrtdlJL7Y70nnyL1+rPLh7+JO
         opOvRxl8ljath2L8TgOf+dlc8ORCA/sP6Nx6oVdzCY+JUm235BMghwOAoCLw26f3BQNq
         k95uV2UYxMjtQKbGOB9KDLW0IwU6KGwIe0KnGczIzOeMtSyIawqoO72MRkE081OWRzGx
         lhHhWZTUzh7WKn5wptbwxiflEyQCRnYpF/OJto5WMfXH4unf/zIn8thZbX5rvmVIkFjR
         wXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=oPERtIhZZZR4Xkb8MwvjjFgqIkTsmJoGkV3z4hVPZ+M=;
        b=sE5dMs2KHQHk9BJjPX2EFj146spawo2OFRLl6PwWH91HACknLfCFjg55z0E2Xtrluu
         yHkJw64ek0g9PBaVQC6fuaoOrGPrBqcdRXrSbwijk7yy3G84S2qR4Abcj8OGymbx9jUh
         Le7cf0Pa/6hJlHBsruGjyQQkrRmomrNYINPukAhiFrxNBvjMlcE9F8fhzSp55hmFqoqE
         Lnl2xMv9wZ8pD2AAacpRSDBM5zd1Nf5OqYg626Vt5nv79bnFj5qNExoGmBrIghJAtcOn
         FYFdycPmtIBXBpizDo+xxCca8hYmlk5LXE74OD0Tg3+LZQPJrlwa6a6NEO1/QWpOH926
         pQHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C+5CGlYp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h45-v6si1252286qtc.12.2018.05.09.11.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C+5CGlYp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTYE-0004R5-If
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:10:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJf-0005bZ-AA
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:56:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJW-0006C2-Mg
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:51 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:40512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJW-00069v-BS
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:42 -0400
Received: by mail-pg0-x243.google.com with SMTP id l2-v6so23000121pgc.7
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oPERtIhZZZR4Xkb8MwvjjFgqIkTsmJoGkV3z4hVPZ+M=;
	b=C+5CGlYpLIq3Os3wkcwkXMfjasE8G7i2yCkEm30tUnxB6//4QiJXJSP7zE4V5HrlN8
	DjA272gxnV4QZFwSsYBbsjUY3n4T/2dVDwXCL/n4ligqLNJ7M2dRlW9FE4PAyCjhbHDE
	oQAIXN5IDBhEOtjImPS5OiBZ2Okj7YTp10mt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oPERtIhZZZR4Xkb8MwvjjFgqIkTsmJoGkV3z4hVPZ+M=;
	b=Y2iqRQRDbuAJmJ1ZLwVWHBlk05dPsHtJ66xOiekevn4cyU0XBAjMl5bK7heBs+MKUe
	vQJcWrXQWfuh7fh+TuGNDEs6BxCH+T1DF4uHoJ4ZQ1XfwAYzHJjxY+ubSev9uviv+wY/
	jmghoeckYr0dmiskB+Suw1Gqj/u0YH0Xcg1kdWZ1Z0lsmhxp0oGSbynadjmPnKSy9KmR
	TP2uprl5q2g9c0OfORIPTl0P8mUBmnSV/YDVFZxRXPsjVfVm5+49nqBF4Kh1GAxByd1G
	j97fLajqrKVvBf+9NS7nuak08BDtq6L6fGdH3gKuAW0CR5YPOPl/oMm5n51ZEIBPptVV
	WmlA==
X-Gm-Message-State: ALQs6tD7ocNBTVEkSp74h/aXp/JRed/iUkY/4+9hswhFcPsLG0GcYhZm
	oXkp0Mij/YNiKy64NYCka4vw4dBRVwg=
X-Received: by 2002:a63:7d47:: with SMTP id
	m7-v6mr30135335pgn.443.1525888540721; 
	Wed, 09 May 2018 10:55:40 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:53 -0700
Message-Id: <20180509175458.15642-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PULL 23/28] target/s390x: convert to TranslatorOps
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
X-TUID: EaXAKCHtAixA

From: "Emilio G. Cota" <cota@braap.org>

Note: I looked into dropping dc->do_debug. However, I don't see
an easy way to do it given that TOO_MANY is also valid
when we just translate more than max_insns. Thus, the check
for do_debug in "case DISAS_PC_CC_UPDATED" would still need
additional state to know whether or not we came from
breakpoint_check.

Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by:   David Hildenbrand <david@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: qemu-s390x@nongnu.org
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/translate.c | 178 +++++++++++++++++++--------------------
 1 file changed, 88 insertions(+), 90 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 5094128e9c..82309faa11 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -64,6 +64,7 @@ struct DisasContext {
     uint64_t pc_tmp;
     uint32_t ilen;
     enum cc_op cc_op;
+    bool do_debug;
 };
 
 /* Information carried about a condition to be evaluated.  */
@@ -6158,98 +6159,87 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     return ret;
 }
 
-void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
+static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    /* 31-bit mode */
+    if (!(dc->base.tb->flags & FLAG_MASK_64)) {
+        dc->base.pc_first &= 0x7fffffff;
+        dc->base.pc_next = dc->base.pc_first;
+    }
+
+    dc->cc_op = CC_OP_DYNAMIC;
+    dc->ex_value = dc->base.tb->cs_base;
+    dc->do_debug = dc->base.singlestep_enabled;
+}
+
+static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
+{
+}
+
+static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
+}
+
+static bool s390x_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                      const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    dc->base.is_jmp = DISAS_PC_STALE;
+    dc->do_debug = true;
+    /* The address covered by the breakpoint must be included in
+       [tb->pc, tb->pc + tb->size) in order to for it to be
+       properly cleared -- thus we increment the PC here so that
+       the logic setting tb->size does the right thing.  */
+    dc->base.pc_next += 2;
+    return true;
+}
+
+static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPUS390XState *env = cs->env_ptr;
-    DisasContext dc;
-    uint64_t page_start;
-    int num_insns, max_insns;
-    DisasJumpType status;
-    bool do_debug;
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    dc.base.pc_first = tb->pc;
-    /* 31-bit mode */
-    if (!(tb->flags & FLAG_MASK_64)) {
-        dc.base.pc_first &= 0x7fffffff;
-    }
-    dc.base.pc_next = dc.base.pc_first;
-    dc.base.tb = tb;
-    dc.base.singlestep_enabled = cs->singlestep_enabled;
+    dc->base.is_jmp = translate_one(env, dc);
+    if (dc->base.is_jmp == DISAS_NEXT) {
+        uint64_t page_start;
 
-    dc.cc_op = CC_OP_DYNAMIC;
-    dc.ex_value = dc.base.tb->cs_base;
-    do_debug = cs->singlestep_enabled;
-
-    page_start = dc.base.pc_first & TARGET_PAGE_MASK;
-
-    num_insns = 0;
-    max_insns = tb_cflags(tb) & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
-
-    gen_tb_start(tb);
-
-    do {
-        tcg_gen_insn_start(dc.base.pc_next, dc.cc_op);
-        num_insns++;
-
-        if (unlikely(cpu_breakpoint_test(cs, dc.base.pc_next, BP_ANY))) {
-            status = DISAS_PC_STALE;
-            do_debug = true;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc.base.pc_next += 2;
-            break;
+        page_start = dc->base.pc_first & TARGET_PAGE_MASK;
+        if (dc->base.pc_next - page_start >= TARGET_PAGE_SIZE || dc->ex_value) {
+            dc->base.is_jmp = DISAS_TOO_MANY;
         }
-
-        if (num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
-            gen_io_start();
-        }
-
-        status = translate_one(env, &dc);
-
-        /* If we reach a page boundary, are single stepping,
-           or exhaust instruction count, stop generation.  */
-        if (status == DISAS_NEXT
-            && (dc.base.pc_next - page_start >= TARGET_PAGE_SIZE
-                || tcg_op_buf_full()
-                || num_insns >= max_insns
-                || singlestep
-                || dc.base.singlestep_enabled
-                || dc.ex_value)) {
-            status = DISAS_TOO_MANY;
-        }
-    } while (status == DISAS_NEXT);
-
-    if (tb_cflags(tb) & CF_LAST_IO) {
-        gen_io_end();
     }
+}
 
-    switch (status) {
+static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    switch (dc->base.is_jmp) {
     case DISAS_GOTO_TB:
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
     case DISAS_PC_STALE:
     case DISAS_PC_STALE_NOCHAIN:
-        update_psw_addr(&dc);
+        update_psw_addr(dc);
         /* FALLTHRU */
     case DISAS_PC_UPDATED:
         /* Next TB starts off with CC_OP_DYNAMIC, so make sure the
            cc op type is in env */
-        update_cc_op(&dc);
+        update_cc_op(dc);
         /* FALLTHRU */
     case DISAS_PC_CC_UPDATED:
         /* Exit the TB, either by raising a debug exception or by return.  */
-        if (do_debug) {
+        if (dc->do_debug) {
             gen_exception(EXCP_DEBUG);
-        } else if (use_exit_tb(&dc) || status == DISAS_PC_STALE_NOCHAIN) {
+        } else if (use_exit_tb(dc) ||
+                   dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
             tcg_gen_exit_tb(0);
         } else {
             tcg_gen_lookup_and_goto_ptr();
@@ -6258,28 +6248,36 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     default:
         g_assert_not_reached();
     }
+}
 
-    gen_tb_end(tb, num_insns);
+static void s390x_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    tb->size = dc.base.pc_next - dc.base.pc_first;
-    tb->icount = num_insns;
-
-#if defined(S390X_DEBUG_DISAS)
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(dc.base.pc_first)) {
-        qemu_log_lock();
-        if (unlikely(dc.ex_value)) {
-            /* ??? Unfortunately log_target_disas can't use host memory.  */
-            qemu_log("IN: EXECUTE %016" PRIx64 "\n", dc.ex_value);
-        } else {
-            qemu_log("IN: %s\n", lookup_symbol(dc.base.pc_first));
-            log_target_disas(cs, dc.base.pc_first,
-                             dc.base.pc_next - dc.base.pc_first);
-            qemu_log("\n");
-        }
-        qemu_log_unlock();
+    if (unlikely(dc->ex_value)) {
+        /* ??? Unfortunately log_target_disas can't use host memory.  */
+        qemu_log("IN: EXECUTE %016" PRIx64, dc->ex_value);
+    } else {
+        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
+        log_target_disas(cs, dc->base.pc_first, dc->base.tb->size);
     }
-#endif
+}
+
+static const TranslatorOps s390x_tr_ops = {
+    .init_disas_context = s390x_tr_init_disas_context,
+    .tb_start           = s390x_tr_tb_start,
+    .insn_start         = s390x_tr_insn_start,
+    .breakpoint_check   = s390x_tr_breakpoint_check,
+    .translate_insn     = s390x_tr_translate_insn,
+    .tb_stop            = s390x_tr_tb_stop,
+    .disas_log          = s390x_tr_disas_log,
+};
+
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
+{
+    DisasContext dc;
+
+    translator_loop(&s390x_tr_ops, &dc.base, cs, tb);
 }
 
 void restore_state_to_opc(CPUS390XState *env, TranslationBlock *tb,
-- 
2.17.0

