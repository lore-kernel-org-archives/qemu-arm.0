Received: by 10.28.4.212 with SMTP id 203csp62272wme;
        Wed, 9 May 2018 11:08:37 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrQVwP6x2WH9AY2ocBRVH0rZmi0MnKw0eJKLya6YO3HQeG7oi7ryX2UkUa/m3B5aI2KTvvZ
X-Received: by 2002:a0c:b4a2:: with SMTP id c34-v6mr26995173qve.70.1525889317517;
        Wed, 09 May 2018 11:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889317; cv=none;
        d=google.com; s=arc-20160816;
        b=iV1rZJnE2vnPMCPjRXjpvYzdC69STw7Em6pQY/7by12H6B0rwMNb0bTQS+LvEZgkU7
         iemTxaIEft10BR1LXUwjWLpdRYt9y8fSJRIJwfuACEnsXaZImFg/IF/EFDebfjSbWBlM
         aR+Fyr7jlhQkHpj5GR5bNFtXCCKSDnYcjvQsA7PXAKd3grX8di7re+t2RJU9FxauDeuG
         spo8yXypBTNgZvv2Tt+JTkClk5pq5+pAAbg9Fj6cxZ08XMAKkNdBA/smYNSIczfXADE+
         4x+VViuPw0zl2U3cxfIOW06n/6SLsZhg9sHEMJ3AEZoA04fbOcMYwDs5K+p8oW6iLBPQ
         +Pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=t4NcYNVG4UP78FKUh+aSUCQTAEqf5H9XW1VYn6rvHFE=;
        b=yNapUxWMe9KziyD34E10avBBjpf0XYYqLPo3dE6VS3qulD8m9jvGeixgAo+r7L1Osy
         zXtInSzH7MAKWB1oFqEmS9im5dIsWxQ9X4vIC8CtyOgJ8PYN47M9eQP3aNcjkU2tufxS
         RLG58yj0yR6NAX0hP1dq4fDMSR7DqNDVKulXy37g/M15yrBEAeSMpk8YFe6BAN/ur1cW
         OOvx9cHTdJXo5meJe6NfeUZos2PT/B59tFR8HiC+YlDNeL0Z5fsT3+RMVeJQG5R7DyEI
         PTSJFLlwVWfYSRcEqXF0thVq2RGdEIGBhpGRzBOBqzUgPQazhAuwi0ztEUjxiEMHFkO7
         KYgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BHV4HCp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2si5839443qke.223.2018.05.09.11.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BHV4HCp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTW0-0002Ir-Tv
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:08:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJi-0005fs-KL
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:56:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJb-0006IU-Dt
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:54 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:39891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJa-0006HT-UJ
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:47 -0400
Received: by mail-pf0-x244.google.com with SMTP id a22so11909197pfn.6
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t4NcYNVG4UP78FKUh+aSUCQTAEqf5H9XW1VYn6rvHFE=;
	b=BHV4HCp1ApnD/NCWoBPmU5nUyAl46b3A2F5R+3Bj0EjUPPEGcmb/MQXaN+y6jeQdRt
	GszTvJG/zP0bIUXkJHi1wLC5gm72VYyyJWJWBqEFIRo36KCPxoPcP5+SqJ9w145rnu7m
	rPmeTDFFRDPO2ky1wcWQqqmj4IFrTC2m5CeSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t4NcYNVG4UP78FKUh+aSUCQTAEqf5H9XW1VYn6rvHFE=;
	b=LXD+Qz7dBftQje9JZWUIkbNhKpscoyUe3OOtrSIICA2iDlZcvsOKVPQm2uQi9TeLTw
	aU+V6ltdXQm4N/fzy6yYuJNrSHcvlAgm/F9fp+akOF/lPDgaibD0I8RZggYNzt0x/twZ
	Za58QW5B/2wzxOhNkHRnQDeL96HfFyWiDd+ge9LAX1RdB3i/YANVRalVV8xM2kFfjzto
	L5Ed63B+2mpUziTkU0ECr+v8rsZcj3obwV0MILfzIutm3dfuGKDJlU7/OO/ZSzVfWKJ/
	hishDN4vZFvSMgRgfX3iWAsO4z4n7zVSUBFs6vV8P8a4B3ws4+SuXaXk+4klMLBxtls8
	98tA==
X-Gm-Message-State: ALQs6tCbFYPnvwlMJ2WOloWoyWSQ0d8B6VZAugaOrW1sjiw61bHw47D9
	Pgc9VHuQTF50vCWxZz48vBDA6g==
X-Received: by 10.98.34.24 with SMTP id i24mr28279947pfi.53.1525888545908;
	Wed, 09 May 2018 10:55:45 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:56 -0700
Message-Id: <20180509175458.15642-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PULL 26/28] target/riscv: convert to DisasJumpType
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
X-TUID: WM6v+kNeFkzW

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Michael Clark <mjc@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 72 ++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 44 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a98033ca77..1fee5b51dc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -26,6 +26,7 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
+#include "exec/translator.h"
 #include "exec/log.h"
 
 #include "instmap.h"
@@ -46,7 +47,7 @@ typedef struct DisasContext {
     uint32_t flags;
     uint32_t mem_idx;
     int singlestep_enabled;
-    int bstate;
+    DisasJumpType is_jmp;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
        no previous fp instruction.  Note that we exit the TB when writing
@@ -55,13 +56,6 @@ typedef struct DisasContext {
     int frm;
 } DisasContext;
 
-enum {
-    BS_NONE     = 0, /* When seen outside of translation while loop, indicates
-                     need to exit tb due to end of page. */
-    BS_STOP     = 1, /* Need to exit tb for syscall, sret, etc. */
-    BS_BRANCH   = 2, /* Need to exit tb for branch, jal, etc. */
-};
-
 /* convert riscv funct3 to qemu memop for load/store */
 static const int tcg_memop_lookup[8] = {
     [0 ... 7] = -1,
@@ -88,7 +82,7 @@ static void generate_exception(DisasContext *ctx, int excp)
     TCGv_i32 helper_tmp = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, helper_tmp);
     tcg_temp_free_i32(helper_tmp);
-    ctx->bstate = BS_BRANCH;
+    ctx->is_jmp = DISAS_NORETURN;
 }
 
 static void generate_exception_mbadaddr(DisasContext *ctx, int excp)
@@ -98,7 +92,7 @@ static void generate_exception_mbadaddr(DisasContext *ctx, int excp)
     TCGv_i32 helper_tmp = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, helper_tmp);
     tcg_temp_free_i32(helper_tmp);
-    ctx->bstate = BS_BRANCH;
+    ctx->is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_debug(void)
@@ -531,7 +525,7 @@ static void gen_jal(CPURISCVState *env, DisasContext *ctx, int rd,
     }
 
     gen_goto_tb(ctx, 0, ctx->pc + imm); /* must use this for safety */
-    ctx->bstate = BS_BRANCH;
+    ctx->is_jmp = DISAS_NORETURN;
 }
 
 static void gen_jalr(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
@@ -562,7 +556,7 @@ static void gen_jalr(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
             gen_set_label(misaligned);
             gen_exception_inst_addr_mis(ctx);
         }
-        ctx->bstate = BS_BRANCH;
+        ctx->is_jmp = DISAS_NORETURN;
         break;
 
     default:
@@ -616,7 +610,7 @@ static void gen_branch(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
     } else {
         gen_goto_tb(ctx, 0, ctx->pc + bimm);
     }
-    ctx->bstate = BS_BRANCH;
+    ctx->is_jmp = DISAS_NORETURN;
 }
 
 static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
@@ -1344,12 +1338,12 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
             /* always generates U-level ECALL, fixed in do_interrupt handler */
             generate_exception(ctx, RISCV_EXCP_U_ECALL);
             tcg_gen_exit_tb(0); /* no chaining */
-            ctx->bstate = BS_BRANCH;
+            ctx->is_jmp = DISAS_NORETURN;
             break;
         case 0x1: /* EBREAK */
             generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
             tcg_gen_exit_tb(0); /* no chaining */
-            ctx->bstate = BS_BRANCH;
+            ctx->is_jmp = DISAS_NORETURN;
             break;
 #ifndef CONFIG_USER_ONLY
         case 0x002: /* URET */
@@ -1359,7 +1353,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
             if (riscv_has_ext(env, RVS)) {
                 gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
                 tcg_gen_exit_tb(0); /* no chaining */
-                ctx->bstate = BS_BRANCH;
+                ctx->is_jmp = DISAS_NORETURN;
             } else {
                 gen_exception_illegal(ctx);
             }
@@ -1370,7 +1364,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
         case 0x302: /* MRET */
             gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
             tcg_gen_exit_tb(0); /* no chaining */
-            ctx->bstate = BS_BRANCH;
+            ctx->is_jmp = DISAS_NORETURN;
             break;
         case 0x7b2: /* DRET */
             gen_exception_illegal(ctx);
@@ -1419,7 +1413,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
         /* end tb since we may be changing priv modes, to get mmu_index right */
         tcg_gen_movi_tl(cpu_pc, ctx->next_pc);
         tcg_gen_exit_tb(0); /* no chaining */
-        ctx->bstate = BS_BRANCH;
+        ctx->is_jmp = DISAS_NORETURN;
         break;
     }
     tcg_temp_free(source1);
@@ -1812,7 +1806,7 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
              * however we need to end the translation block */
             tcg_gen_movi_tl(cpu_pc, ctx->next_pc);
             tcg_gen_exit_tb(0);
-            ctx->bstate = BS_BRANCH;
+            ctx->is_jmp = DISAS_NORETURN;
         } else {
             /* FENCE is a full memory barrier. */
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
@@ -1862,7 +1856,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     ctx.singlestep_enabled = cs->singlestep_enabled;
 
     ctx.tb = tb;
-    ctx.bstate = BS_NONE;
+    ctx.is_jmp = DISAS_NEXT;
     ctx.flags = tb->flags;
     ctx.mem_idx = tb->flags & TB_FLAGS_MMU_MASK;
     ctx.frm = -1;  /* unknown rounding mode */
@@ -1877,13 +1871,13 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     }
     gen_tb_start(tb);
 
-    while (ctx.bstate == BS_NONE) {
+    while (ctx.is_jmp == DISAS_NEXT) {
         tcg_gen_insn_start(ctx.pc);
         num_insns++;
 
         if (unlikely(cpu_breakpoint_test(cs, ctx.pc, BP_ANY))) {
             tcg_gen_movi_tl(cpu_pc, ctx.pc);
-            ctx.bstate = BS_BRANCH;
+            ctx.is_jmp = DISAS_NORETURN;
             gen_exception_debug();
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
@@ -1901,31 +1895,20 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
         decode_opc(env, &ctx);
         ctx.pc = ctx.next_pc;
 
-        if (cs->singlestep_enabled) {
-            break;
+        if (ctx.is_jmp == DISAS_NEXT &&
+            (cs->singlestep_enabled ||
+             ctx.pc - page_start >= TARGET_PAGE_SIZE ||
+             tcg_op_buf_full() ||
+             num_insns >= max_insns ||
+             singlestep)) {
+            ctx.is_jmp = DISAS_TOO_MANY;
         }
-        if (ctx.pc - page_start >= TARGET_PAGE_SIZE) {
-            break;
-        }
-        if (tcg_op_buf_full()) {
-            break;
-        }
-        if (num_insns >= max_insns) {
-            break;
-        }
-        if (singlestep) {
-            break;
-        }
-
     }
     if (tb->cflags & CF_LAST_IO) {
         gen_io_end();
     }
-    switch (ctx.bstate) {
-    case BS_STOP:
-        gen_goto_tb(&ctx, 0, ctx.pc);
-        break;
-    case BS_NONE: /* handle end of page - DO NOT CHAIN. See gen_goto_tb. */
+    switch (ctx.is_jmp) {
+    case DISAS_TOO_MANY:
         tcg_gen_movi_tl(cpu_pc, ctx.pc);
         if (cs->singlestep_enabled) {
             gen_exception_debug();
@@ -1933,9 +1916,10 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
             tcg_gen_exit_tb(0);
         }
         break;
-    case BS_BRANCH: /* ops using BS_BRANCH generate own exit seq */
-    default:
+    case DISAS_NORETURN:
         break;
+    default:
+        g_assert_not_reached();
     }
 done_generating:
     gen_tb_end(tb, num_insns);
-- 
2.17.0

