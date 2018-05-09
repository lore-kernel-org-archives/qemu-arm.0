Received: by 10.28.4.212 with SMTP id 203csp57725wme;
        Wed, 9 May 2018 11:04:16 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoTgYINjCXwIbNy9EKEpIhm9xr3eGsnJ6ABu3moESjiKvesijRkh4YhJW2MYdPvJ3hqR8Uz
X-Received: by 10.55.33.24 with SMTP id h24mr38898705qkh.431.1525889056084;
        Wed, 09 May 2018 11:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889056; cv=none;
        d=google.com; s=arc-20160816;
        b=xWcin47FWIkhgPO22cgpOY4Dm+WP1iflCIaMjyLAryVSqEjUbVSgPNRvh+2anGnOli
         62CP2Ah8Vs3IupgY3Pj0D9O/bJ604EmORljsmkbm29ojeInvYJKrnPb6t8ybEOuthZYd
         QPK5M7NF9Heggjua+uW+CQmom3EoW3wxbm/6Uv5Qmn6gYVFDzfe/ehz+FyFyqS0WUI3/
         RHfFVOXv4nt0iKP7Maq4MW71gmWkSl/2HygHsvOBnDvoiqHGnJ+8gugXX6860UoasgKF
         mwJwCJqLtAHztOydRfYW5qfnbCKhBPwx9TOvMZ/A1rgM9bdmdk7perIO2RjVgTHdRFZr
         nuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=bmNH3/Xt87KSPREfiGWU2svReCznKpFcDCnBU4R99pQ=;
        b=OSu/X5CJIXFzSHY4vaKXxJy21BUJh8FxHdteRtaUcYbGWkZpbDDUrY3tdQ/y1Acm9g
         5+aRtnbJWStGcvaIAtN8bHM+sgMDIivVpB3KvQ8xdyQR1HWLsRmCrMjWX6mcMqNNHfTG
         yYKncy59YyMVdUC70BvF/36LCEe25M1g9+RTkqdFocDhOuu2PFkh5BftBxQYVHH/e1kz
         +MdZUsbyB8aj9MxpxmcDzn9nOZaaryHZrJFaS8Qii7oJmi1oIaEBTWc/Sbr3Jgmk3zTC
         VhXYqX8xcimb/oAvWLgMM5rHj3m6zw1WokQMB577zxSx9HgrM5zbP1bs/EiyRQZ9vjBO
         uZ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I9DmCdQU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si3954931qve.259.2018.05.09.11.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:04:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I9DmCdQU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTRl-0005h1-8U
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:04:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJK-00058L-8h
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJF-0005js-P4
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:30 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJE-0005h7-VM
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:25 -0400
Received: by mail-pf0-x243.google.com with SMTP id f20so17212350pfn.0
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bmNH3/Xt87KSPREfiGWU2svReCznKpFcDCnBU4R99pQ=;
	b=I9DmCdQUbgG/tqDD28ySxVD0mM91yUW+3c2dLKyfF/8gO1jVVUOFEs0kFsbuqIsbOd
	X2rDIdxVKjZ/Obco9xh0MvSqLJYkU70Nfb8oMrWY0V2o7aPToIT7uMdgM9FTxmFHToIN
	EwgWFDt4stvmpg6pr90BnjhK3mVfvB8/dSTfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bmNH3/Xt87KSPREfiGWU2svReCznKpFcDCnBU4R99pQ=;
	b=F983uXhhQ74FdM9MfmRfR2Pf8SO65gibd5a3vSmhH4xSbg0Ftef7rv6FFqYA6pu9D8
	xW5WmE+ThGA8AhctKHOFv1QhqngFc64Eiql4hV4AaV0Iv0urOHOJiWeSkxvN1lqj76Ih
	L7I4DOXoquXgntYJns3fxDDWpRR/1Q+/Ux2YxAklkKDOyw7F7p+A4N5J63rGVy7stvad
	nBjHyzHlJzy9OfZEL4/tjPTXO1BOB8vBUTYcW06vxZ/2wmewkgadk9Rub6b5K9+U0N9V
	EWPVEQh5ruwlBH8fVlbGKln1l4dNeOMPkwEHTznIIHVNpxb/TyvnHiCCW+xXs1X62JTz
	tWGg==
X-Gm-Message-State: ALQs6tBeR9YdUws6+jqkawd6kda4sVqWufxG3r6TputgkOzPgZ0MnkQ4
	DCQGVX7aVSGUBcjaY1/SqEITzqvBaRo=
X-Received: by 2002:a63:66c3:: with SMTP id
	a186-v6mr25525339pgc.408.1525888523523; 
	Wed, 09 May 2018 10:55:23 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:43 -0700
Message-Id: <20180509175458.15642-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [PULL 13/28] target/sparc: convert to DisasJumpType
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
X-TUID: 3Qq3yDjxVj6b

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 5aa367a182..03c6510717 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -30,6 +30,7 @@
 #include "exec/helper-gen.h"
 
 #include "trace-tcg.h"
+#include "exec/translator.h"
 #include "exec/log.h"
 #include "asi.h"
 
@@ -69,7 +70,7 @@ typedef struct DisasContext {
     target_ulong pc;    /* current Program Counter: integer or DYNAMIC_PC */
     target_ulong npc;   /* next PC: integer or DYNAMIC_PC or JUMP_PC */
     target_ulong jump_pc[2]; /* used when JUMP_PC pc value is used */
-    int is_br;
+    DisasJumpType is_jmp;
     int mem_idx;
     bool fpu_enabled;
     bool address_mask_32bit;
@@ -995,7 +996,7 @@ static void gen_branch_a(DisasContext *dc, target_ulong pc1)
     gen_set_label(l1);
     gen_goto_tb(dc, 1, npc + 4, npc + 8);
 
-    dc->is_br = 1;
+    dc->is_jmp = DISAS_NORETURN;
 }
 
 static void gen_branch_n(DisasContext *dc, target_ulong pc1)
@@ -1078,7 +1079,7 @@ static void gen_exception(DisasContext *dc, int which)
     t = tcg_const_i32(which);
     gen_helper_raise_exception(cpu_env, t);
     tcg_temp_free_i32(t);
-    dc->is_br = 1;
+    dc->is_jmp = DISAS_NORETURN;
 }
 
 static void gen_check_align(TCGv addr, int mask)
@@ -3351,7 +3352,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 
                 if (cond == 8) {
                     /* An unconditional trap ends the TB.  */
-                    dc->is_br = 1;
+                    dc->is_jmp = DISAS_NORETURN;
                     goto jmp_insn;
                 } else {
                     /* A conditional trap falls through to the next insn.  */
@@ -4331,7 +4332,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 save_state(dc);
                                 gen_op_next_insn();
                                 tcg_gen_exit_tb(0);
-                                dc->is_br = 1;
+                                dc->is_jmp = DISAS_NORETURN;
                                 break;
                             case 0x6: /* V9 wrfprs */
                                 tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
@@ -4340,7 +4341,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 save_state(dc);
                                 gen_op_next_insn();
                                 tcg_gen_exit_tb(0);
-                                dc->is_br = 1;
+                                dc->is_jmp = DISAS_NORETURN;
                                 break;
                             case 0xf: /* V9 sir, nop if user */
 #if !defined(CONFIG_USER_ONLY)
@@ -4468,7 +4469,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             save_state(dc);
                             gen_op_next_insn();
                             tcg_gen_exit_tb(0);
-                            dc->is_br = 1;
+                            dc->is_jmp = DISAS_NORETURN;
 #endif
                         }
                         break;
@@ -4624,7 +4625,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 save_state(dc);
                                 gen_op_next_insn();
                                 tcg_gen_exit_tb(0);
-                                dc->is_br = 1;
+                                dc->is_jmp = DISAS_NORETURN;
                                 break;
                             case 1: // htstate
                                 // XXX gen_op_wrhtstate();
@@ -5690,7 +5691,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     } else if (dc->npc == JUMP_PC) {
         /* we can do a static jump */
         gen_branch2(dc, dc->jump_pc[0], dc->jump_pc[1], cpu_cond);
-        dc->is_br = 1;
+        dc->is_jmp = DISAS_NORETURN;
     } else {
         dc->pc = dc->npc;
         dc->npc = dc->npc + 4;
@@ -5752,6 +5753,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
     pc_start = tb->pc;
     dc->pc = pc_start;
     last_pc = dc->pc;
+    dc->is_jmp = DISAS_NEXT;
     dc->npc = (target_ulong) tb->cs_base;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->mem_idx = tb->flags & TB_FLAG_MMU_MASK;
@@ -5796,7 +5798,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
             }
             gen_helper_debug(cpu_env);
             tcg_gen_exit_tb(0);
-            dc->is_br = 1;
+            dc->is_jmp = DISAS_NORETURN;
             goto exit_gen_loop;
         }
 
@@ -5808,8 +5810,9 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
 
         disas_sparc_insn(dc, insn);
 
-        if (dc->is_br)
+        if (dc->is_jmp == DISAS_NORETURN) {
             break;
+        }
         /* if the next PC is different, we abort now */
         if (dc->pc != (last_pc + 4))
             break;
@@ -5830,7 +5833,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
     if (tb_cflags(tb) & CF_LAST_IO) {
         gen_io_end();
     }
-    if (!dc->is_br) {
+    if (dc->is_jmp != DISAS_NORETURN) {
         if (dc->pc != DYNAMIC_PC &&
             (dc->npc != DYNAMIC_PC && dc->npc != JUMP_PC)) {
             /* static PC and NPC: we can use direct chaining */
-- 
2.17.0

