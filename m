Received: by 10.28.4.212 with SMTP id 203csp65434wme;
        Wed, 9 May 2018 11:11:50 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpETyOx/UqFa1z523YHbOH2SDotiiCz1H4SUuwMlwLOVhFQAPWke0xZk2FELP6YhgsjVOwW
X-Received: by 10.55.151.195 with SMTP id z186mr37969776qkd.7.1525889510359;
        Wed, 09 May 2018 11:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889510; cv=none;
        d=google.com; s=arc-20160816;
        b=d9Zx4UAM4B3C9/8vOs5fJ0V4lkHHfhnpjrl67pJiQXOUljV1hj6Ka3qGxTJAs/E2Q7
         eJQvUt076senOBAleIsVWJmnUnbTZQlOPke4oxeitA1BT6n8IhtzMvrUP6pTDUGVy+Hn
         MhftagxnlPTN/jjtNgZ1ELAl8KFgW+wXIaWXY5Tou/g9UPEhU95fd3PejAlsuEdwaIth
         Hf/M3+qO8CzXdHAsIzMtYUMPk3fd7CjbC2MJcCiG+9htubs5Iv2p3TJD3xtg/laY1ram
         +Ss7QSaVS/ewXLyYl/nTE4a1vN9x0Y2znWq6hZ2EKjWkdMueMnSIczrqnIXzvxFFbUnr
         kfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Gbx4rivl1ySTsIg7eeDfs2R1FI+YfPMiQ7EUm+Pl6mA=;
        b=zY/us8knreBhZQZWOJ61L5Z0Fe2mWGMlvUOQQCVa75laQTMcT0ZQLaphY2fomQAKKe
         7Aceh0Ry95v9YbitYllS9KBRWjOyAzlYe7oMSWdkT+kdCkENvnvdKl/DW3fQI4hCYsaj
         VwWxYdIjsJHlhGpG7WTpC+XDm5l5UgcWNWa/SLwyDbCQVyEhsvFwEvbsz9Uv/UgI+p2x
         iivMBJCPWR/2IcmGXQ9V2tTB2tOHY5qkCpxEIyqkdbNxvShLhlxt1TK2uqPxAkeEO4TB
         fitngxPT55kxjrBh/q4NVhACDN2/X71h/BN9LFMvnS76aY8q1IQMqI/hLneOamV+NVFt
         jlhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HNDFilcp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i15-v6si5505803qvo.144.2018.05.09.11.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HNDFilcp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTZ7-0005JC-Ln
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:11:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJU-0005PO-Dj
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJN-0005v0-DG
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:40 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:37089)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJM-0005tP-VC
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:33 -0400
Received: by mail-pf0-x244.google.com with SMTP id e9so22005085pfi.4
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gbx4rivl1ySTsIg7eeDfs2R1FI+YfPMiQ7EUm+Pl6mA=;
	b=HNDFilcpdQM+7Zu4rwPpY7mQU6ZLNusjKZhxB+icHQb9rKWMJ4MUvssqFsQPQ4/ZLC
	wDS0Of/JZ6Cw0vkleT05WQWkoYoKFtRTqCR5iuoptzXnciWDc9RSuyi6TAM80xrcqbmN
	2zxjXhtY3nI3FoO/CSStEOsa70f1Rtg+F+bik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gbx4rivl1ySTsIg7eeDfs2R1FI+YfPMiQ7EUm+Pl6mA=;
	b=MH2HwuQ43jr0HUNXaKxLuU6STkclOO/E0DF20sUR+JOhe58GhFLmdbjYMVSGsDdQeo
	PMj9k3FNhWzMJHV3RdDAhNhzmLjeJlgEuNiW3bNOkRLlTHwQZsi/7M2LXmBmthomBcdu
	bFaLcNUFZ6/VfEzvzscfDo+oRYDgKBixs4fzC2zr8CB0G+EBCiqMx6obU5X1lwQ1Gqux
	/4Ty14iqxo1LAzsKmr092AVtOjhnpHNv7vETZ5DsebPmaNjrQesLAoWAg5MUJFsdGEnG
	IqoaUFzkIEjxh2o+UesAHitQXW+GiT3Suv5v8Dh/DwRor/wl9ArUe1JpjZoM4pMRk1hj
	5m5Q==
X-Gm-Message-State: ALQs6tBQ5GLXFVs6UWjMXB5lmAU/1TurQnZGJoDo6KaxuwRChUvlLulx
	IHwJ9uq04ojJvNKgdPS6IdhX+LukhTE=
X-Received: by 2002:a63:78ca:: with SMTP id
	t193-v6mr25178738pgc.255.1525888530500; 
	Wed, 09 May 2018 10:55:30 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:47 -0700
Message-Id: <20180509175458.15642-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PULL 17/28] target/mips: convert to DisasJumpType
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
X-TUID: eqyS0Sl8kuLh

From: "Emilio G. Cota" <cota@braap.org>

Notes:

- BS_EXCP in generate_exception_err and after hen_helper_wait
  becomes DISAS_NORETURN, because we do not return after
  raising an exception.

- Some uses of BS_EXCP are misleading in that they're used
  only as a "not BS_STOP" exit condition, i.e. they have nothing
  to do with an actual exception. For those cases, define
  and use DISAS_EXIT, which is clearer. With this and the
  above change, BS_EXCP goes away completely.

- fix a comment typo (s/intetrupt/interrupt/).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/translate.c | 186 ++++++++++++++++++++--------------------
 1 file changed, 91 insertions(+), 95 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 69137d0b3f..83a484822e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -36,6 +36,7 @@
 
 #include "target/mips/trace.h"
 #include "trace-tcg.h"
+#include "exec/translator.h"
 #include "exec/log.h"
 
 #define MIPS_DEBUG_DISAS 0
@@ -1439,7 +1440,7 @@ typedef struct DisasContext {
     int mem_idx;
     TCGMemOp default_tcg_memop_mask;
     uint32_t hflags, saved_hflags;
-    int bstate;
+    DisasJumpType is_jmp;
     target_ulong btarget;
     bool ulri;
     int kscrexist;
@@ -1460,13 +1461,8 @@ typedef struct DisasContext {
     bool abs2008;
 } DisasContext;
 
-enum {
-    BS_NONE     = 0, /* We go out of the TB without reaching a branch or an
-                      * exception condition */
-    BS_STOP     = 1, /* We want to stop translation for any reason */
-    BS_BRANCH   = 2, /* We reached a branch condition     */
-    BS_EXCP     = 3, /* We reached an exception condition */
-};
+#define DISAS_STOP       DISAS_TARGET_0
+#define DISAS_EXIT       DISAS_TARGET_1
 
 static const char * const regnames[] = {
     "r0", "at", "v0", "v1", "a0", "a1", "a2", "a3",
@@ -1639,7 +1635,7 @@ static inline void generate_exception_err(DisasContext *ctx, int excp, int err)
     gen_helper_raise_exception_err(cpu_env, texcp, terr);
     tcg_temp_free_i32(terr);
     tcg_temp_free_i32(texcp);
-    ctx->bstate = BS_EXCP;
+    ctx->is_jmp = DISAS_NORETURN;
 }
 
 static inline void generate_exception(DisasContext *ctx, int excp)
@@ -5334,10 +5330,10 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                 gen_io_end();
             }
             /* Break the TB to be able to take timer interrupts immediately
-               after reading count. BS_STOP isn't sufficient, we need to ensure
-               we break completely out of translated code.  */
+               after reading count. DISAS_STOP isn't sufficient, we need to
+               ensure we break completely out of translated code.  */
             gen_save_pc(ctx->pc + 4);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
             rn = "Count";
             break;
         /* 6,7 are implementation dependent */
@@ -5905,7 +5901,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_pagegrain(cpu_env, arg);
             rn = "PageGrain";
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case 2:
             CP0_CHECK(ctx->sc);
@@ -5966,7 +5962,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case 0:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_hwrena(cpu_env, arg);
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "HWREna";
             break;
         default:
@@ -6028,30 +6024,30 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case 0:
             save_cpu_state(ctx, 1);
             gen_helper_mtc0_status(cpu_env, arg);
-            /* BS_STOP isn't good enough here, hflags may have changed. */
+            /* DISAS_STOP isn't good enough here, hflags may have changed. */
             gen_save_pc(ctx->pc + 4);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
             rn = "Status";
             break;
         case 1:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_intctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "IntCtl";
             break;
         case 2:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "SRSCtl";
             break;
         case 3:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "SRSMap";
             break;
         default:
@@ -6063,11 +6059,11 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case 0:
             save_cpu_state(ctx, 1);
             gen_helper_mtc0_cause(cpu_env, arg);
-            /* Stop translation as we may have triggered an interrupt. BS_STOP
-             * isn't sufficient, we need to ensure we break out of translated
-             * code to check for pending interrupts.  */
+            /* Stop translation as we may have triggered an interrupt.
+             * DISAS_STOP isn't sufficient, we need to ensure we break out of
+             * translated code to check for pending interrupts.  */
             gen_save_pc(ctx->pc + 4);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
             rn = "Cause";
             break;
         default:
@@ -6105,7 +6101,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_config0(cpu_env, arg);
             rn = "Config";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case 1:
             /* ignored, read only */
@@ -6115,24 +6111,24 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_config2(cpu_env, arg);
             rn = "Config2";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case 3:
             gen_helper_mtc0_config3(cpu_env, arg);
             rn = "Config3";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case 4:
             gen_helper_mtc0_config4(cpu_env, arg);
             rn = "Config4";
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case 5:
             gen_helper_mtc0_config5(cpu_env, arg);
             rn = "Config5";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         /* 6,7 are implementation dependent */
         case 6:
@@ -6221,35 +6217,35 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         switch (sel) {
         case 0:
             gen_helper_mtc0_debug(cpu_env, arg); /* EJTAG support */
-            /* BS_STOP isn't good enough here, hflags may have changed. */
+            /* DISAS_STOP isn't good enough here, hflags may have changed. */
             gen_save_pc(ctx->pc + 4);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
             rn = "Debug";
             break;
         case 1:
 //            gen_helper_mtc0_tracecontrol(cpu_env, arg); /* PDtrace support */
             rn = "TraceControl";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             goto cp0_unimplemented;
         case 2:
 //            gen_helper_mtc0_tracecontrol2(cpu_env, arg); /* PDtrace support */
             rn = "TraceControl2";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             goto cp0_unimplemented;
         case 3:
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
 //            gen_helper_mtc0_usertracedata(cpu_env, arg); /* PDtrace support */
             rn = "UserTraceData";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             goto cp0_unimplemented;
         case 4:
 //            gen_helper_mtc0_tracebpc(cpu_env, arg); /* PDtrace support */
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "TraceBPC";
             goto cp0_unimplemented;
         default:
@@ -6309,7 +6305,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         switch (sel) {
         case 0:
             gen_helper_mtc0_errctl(cpu_env, arg);
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "ErrCtl";
             break;
         default:
@@ -6402,10 +6398,10 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     /* For simplicity assume that all writes can cause interrupts.  */
     if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
         gen_io_end();
-        /* BS_STOP isn't sufficient, we need to ensure we break out of
+        /* DISAS_STOP isn't sufficient, we need to ensure we break out of
          * translated code to check for pending interrupts.  */
         gen_save_pc(ctx->pc + 4);
-        ctx->bstate = BS_EXCP;
+        ctx->is_jmp = DISAS_EXIT;
     }
     return;
 
@@ -6686,10 +6682,10 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                 gen_io_end();
             }
             /* Break the TB to be able to take timer interrupts immediately
-               after reading count. BS_STOP isn't sufficient, we need to ensure
-               we break completely out of translated code.  */
+               after reading count. DISAS_STOP isn't sufficient, we need to
+               ensure we break completely out of translated code.  */
             gen_save_pc(ctx->pc + 4);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
             rn = "Count";
             break;
         /* 6,7 are implementation dependent */
@@ -7301,7 +7297,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case 0:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_hwrena(cpu_env, arg);
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "HWREna";
             break;
         default:
@@ -7337,7 +7333,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         }
         /* Stop translation as we may have switched the execution mode */
-        ctx->bstate = BS_STOP;
+        ctx->is_jmp = DISAS_STOP;
         break;
     case 10:
         switch (sel) {
@@ -7360,37 +7356,37 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         }
         /* Stop translation as we may have switched the execution mode */
-        ctx->bstate = BS_STOP;
+        ctx->is_jmp = DISAS_STOP;
         break;
     case 12:
         switch (sel) {
         case 0:
             save_cpu_state(ctx, 1);
             gen_helper_mtc0_status(cpu_env, arg);
-            /* BS_STOP isn't good enough here, hflags may have changed. */
+            /* DISAS_STOP isn't good enough here, hflags may have changed. */
             gen_save_pc(ctx->pc + 4);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
             rn = "Status";
             break;
         case 1:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_intctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "IntCtl";
             break;
         case 2:
             check_insn(ctx, ISA_MIPS32R2);
             gen_helper_mtc0_srsctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "SRSCtl";
             break;
         case 3:
             check_insn(ctx, ISA_MIPS32R2);
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "SRSMap";
             break;
         default:
@@ -7402,11 +7398,11 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case 0:
             save_cpu_state(ctx, 1);
             gen_helper_mtc0_cause(cpu_env, arg);
-            /* Stop translation as we may have triggered an intetrupt. BS_STOP
-             * isn't sufficient, we need to ensure we break out of translated
-             * code to check for pending interrupts.  */
+            /* Stop translation as we may have triggered an interrupt.
+             * DISAS_STOP isn't sufficient, we need to ensure we break out of
+             * translated code to check for pending interrupts.  */
             gen_save_pc(ctx->pc + 4);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
             rn = "Cause";
             break;
         default:
@@ -7444,7 +7440,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_config0(cpu_env, arg);
             rn = "Config";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case 1:
             /* ignored, read only */
@@ -7454,13 +7450,13 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_config2(cpu_env, arg);
             rn = "Config2";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case 3:
             gen_helper_mtc0_config3(cpu_env, arg);
             rn = "Config3";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case 4:
             /* currently ignored */
@@ -7470,7 +7466,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_config5(cpu_env, arg);
             rn = "Config5";
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         /* 6,7 are implementation dependent */
         default:
@@ -7549,33 +7545,33 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         switch (sel) {
         case 0:
             gen_helper_mtc0_debug(cpu_env, arg); /* EJTAG support */
-            /* BS_STOP isn't good enough here, hflags may have changed. */
+            /* DISAS_STOP isn't good enough here, hflags may have changed. */
             gen_save_pc(ctx->pc + 4);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
             rn = "Debug";
             break;
         case 1:
 //            gen_helper_mtc0_tracecontrol(cpu_env, arg); /* PDtrace support */
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "TraceControl";
             goto cp0_unimplemented;
         case 2:
 //            gen_helper_mtc0_tracecontrol2(cpu_env, arg); /* PDtrace support */
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "TraceControl2";
             goto cp0_unimplemented;
         case 3:
 //            gen_helper_mtc0_usertracedata(cpu_env, arg); /* PDtrace support */
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "UserTraceData";
             goto cp0_unimplemented;
         case 4:
 //            gen_helper_mtc0_tracebpc(cpu_env, arg); /* PDtrace support */
             /* Stop translation as we may have switched the execution mode */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "TraceBPC";
             goto cp0_unimplemented;
         default:
@@ -7635,7 +7631,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         switch (sel) {
         case 0:
             gen_helper_mtc0_errctl(cpu_env, arg);
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             rn = "ErrCtl";
             break;
         default:
@@ -7728,10 +7724,10 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     /* For simplicity assume that all writes can cause interrupts.  */
     if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
         gen_io_end();
-        /* BS_STOP isn't sufficient, we need to ensure we break out of
+        /* DISAS_STOP isn't sufficient, we need to ensure we break out of
          * translated code to check for pending interrupts.  */
         gen_save_pc(ctx->pc + 4);
-        ctx->bstate = BS_EXCP;
+        ctx->is_jmp = DISAS_EXIT;
     }
     return;
 
@@ -8142,7 +8138,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
             tcg_temp_free_i32(fs_tmp);
         }
         /* Stop translation as we may have changed hflags */
-        ctx->bstate = BS_STOP;
+        ctx->is_jmp = DISAS_STOP;
         break;
     /* COP2: Not implemented. */
     case 4:
@@ -8301,7 +8297,7 @@ static void gen_cp0 (CPUMIPSState *env, DisasContext *ctx, uint32_t opc, int rt,
                 check_insn(ctx, ISA_MIPS2);
                 gen_helper_eret(cpu_env);
             }
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
         }
         break;
     case OPC_DERET:
@@ -8316,7 +8312,7 @@ static void gen_cp0 (CPUMIPSState *env, DisasContext *ctx, uint32_t opc, int rt,
             generate_exception_end(ctx, EXCP_RI);
         } else {
             gen_helper_deret(cpu_env);
-            ctx->bstate = BS_EXCP;
+            ctx->is_jmp = DISAS_EXIT;
         }
         break;
     case OPC_WAIT:
@@ -8331,7 +8327,7 @@ static void gen_cp0 (CPUMIPSState *env, DisasContext *ctx, uint32_t opc, int rt,
         save_cpu_state(ctx, 1);
         ctx->pc -= 4;
         gen_helper_wait(cpu_env);
-        ctx->bstate = BS_EXCP;
+        ctx->is_jmp = DISAS_NORETURN;
         break;
     default:
  die:
@@ -8756,7 +8752,7 @@ static void gen_cp1 (DisasContext *ctx, uint32_t opc, int rt, int fs)
             tcg_temp_free_i32(fs_tmp);
         }
         /* Stop translation as we may have changed hflags */
-        ctx->bstate = BS_STOP;
+        ctx->is_jmp = DISAS_STOP;
         break;
 #if defined(TARGET_MIPS64)
     case OPC_DMFC1:
@@ -10764,10 +10760,10 @@ static void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
         }
         gen_store_gpr(t0, rt);
         /* Break the TB to be able to take timer interrupts immediately
-           after reading count. BS_STOP isn't sufficient, we need to ensure
+           after reading count. DISAS_STOP isn't sufficient, we need to ensure
            we break completely out of translated code.  */
         gen_save_pc(ctx->pc + 4);
-        ctx->bstate = BS_EXCP;
+        ctx->is_jmp = DISAS_EXIT;
         break;
     case 3:
         gen_helper_rdhwr_ccres(t0, cpu_env);
@@ -10817,7 +10813,7 @@ static void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
 static inline void clear_branch_hflags(DisasContext *ctx)
 {
     ctx->hflags &= ~MIPS_HFLAG_BMASK;
-    if (ctx->bstate == BS_NONE) {
+    if (ctx->is_jmp == DISAS_NEXT) {
         save_cpu_state(ctx, 0);
     } else {
         /* it is not safe to save ctx->hflags as hflags may be changed
@@ -10832,7 +10828,7 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
         int proc_hflags = ctx->hflags & MIPS_HFLAG_BMASK;
         /* Branches completion */
         clear_branch_hflags(ctx);
-        ctx->bstate = BS_BRANCH;
+        ctx->is_jmp = DISAS_NORETURN;
         /* FIXME: Need to clear can_do_io.  */
         switch (proc_hflags & MIPS_HFLAG_BMASK_BASE) {
         case MIPS_HFLAG_FBNSLOT:
@@ -13574,7 +13570,7 @@ static void gen_pool32axf (CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
                 gen_helper_di(t0, cpu_env);
                 gen_store_gpr(t0, rs);
                 /* Stop translation as we may have switched the execution mode */
-                ctx->bstate = BS_STOP;
+                ctx->is_jmp = DISAS_STOP;
                 tcg_temp_free(t0);
             }
             break;
@@ -13586,10 +13582,10 @@ static void gen_pool32axf (CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
                 save_cpu_state(ctx, 1);
                 gen_helper_ei(t0, cpu_env);
                 gen_store_gpr(t0, rs);
-                /* BS_STOP isn't sufficient, we need to ensure we break out
+                /* DISAS_STOP isn't sufficient, we need to ensure we break out
                    of translated code to check for pending interrupts.  */
                 gen_save_pc(ctx->pc + 4);
-                ctx->bstate = BS_EXCP;
+                ctx->is_jmp = DISAS_EXIT;
                 tcg_temp_free(t0);
             }
             break;
@@ -14745,7 +14741,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
                 /* SYNCI */
                 /* Break the TB to be able to sync copied instructions
                    immediately */
-                ctx->bstate = BS_STOP;
+                ctx->is_jmp = DISAS_STOP;
             } else {
                 /* TNEI */
                 mips32_op = OPC_TNEI;
@@ -14776,7 +14772,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             check_insn_opc_removed(ctx, ISA_MIPS32R6);
             /* Break the TB to be able to sync copied instructions
                immediately */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case BC2F:
         case BC2T:
@@ -19601,7 +19597,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             check_insn(ctx, ISA_MIPS32R2);
             /* Break the TB to be able to sync copied instructions
                immediately */
-            ctx->bstate = BS_STOP;
+            ctx->is_jmp = DISAS_STOP;
             break;
         case OPC_BPOSGE32:    /* MIPS DSP branch */
 #if defined(TARGET_MIPS64)
@@ -19704,17 +19700,17 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_store_gpr(t0, rt);
                     /* Stop translation as we may have switched
                        the execution mode.  */
-                    ctx->bstate = BS_STOP;
+                    ctx->is_jmp = DISAS_STOP;
                     break;
                 case OPC_EI:
                     check_insn(ctx, ISA_MIPS32R2);
                     save_cpu_state(ctx, 1);
                     gen_helper_ei(t0, cpu_env);
                     gen_store_gpr(t0, rt);
-                    /* BS_STOP isn't sufficient, we need to ensure we break out
-                       of translated code to check for pending interrupts.  */
+                    /* DISAS_STOP isn't sufficient, we need to ensure we break
+                       out of translated code to check for pending interrupts */
                     gen_save_pc(ctx->pc + 4);
-                    ctx->bstate = BS_EXCP;
+                    ctx->is_jmp = DISAS_EXIT;
                     break;
                 default:            /* Invalid */
                     MIPS_INVAL("mfmc0");
@@ -20216,7 +20212,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     ctx.insn_flags = env->insn_flags;
     ctx.CP0_Config1 = env->CP0_Config1;
     ctx.tb = tb;
-    ctx.bstate = BS_NONE;
+    ctx.is_jmp = DISAS_NEXT;
     ctx.btarget = 0;
     ctx.kscrexist = (env->CP0_Config4 >> CP0C4_KScrExist) & 0xff;
     ctx.rxi = (env->CP0_Config3 >> CP0C3_RXI) & 1;
@@ -20257,13 +20253,13 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 
     LOG_DISAS("\ntb %p idx %d hflags %04x\n", tb, ctx.mem_idx, ctx.hflags);
     gen_tb_start(tb);
-    while (ctx.bstate == BS_NONE) {
+    while (ctx.is_jmp == DISAS_NEXT) {
         tcg_gen_insn_start(ctx.pc, ctx.hflags & MIPS_HFLAG_BMASK, ctx.btarget);
         num_insns++;
 
         if (unlikely(cpu_breakpoint_test(cs, ctx.pc, BP_ANY))) {
             save_cpu_state(&ctx, 1);
-            ctx.bstate = BS_BRANCH;
+            ctx.is_jmp = DISAS_NORETURN;
             gen_helper_raise_exception_debug(cpu_env);
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
@@ -20337,23 +20333,23 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     if (tb_cflags(tb) & CF_LAST_IO) {
         gen_io_end();
     }
-    if (cs->singlestep_enabled && ctx.bstate != BS_BRANCH) {
-        save_cpu_state(&ctx, ctx.bstate != BS_EXCP);
+    if (cs->singlestep_enabled && ctx.is_jmp != DISAS_NORETURN) {
+        save_cpu_state(&ctx, ctx.is_jmp != DISAS_EXIT);
         gen_helper_raise_exception_debug(cpu_env);
     } else {
-        switch (ctx.bstate) {
-        case BS_STOP:
+        switch (ctx.is_jmp) {
+        case DISAS_STOP:
             gen_save_pc(ctx.pc);
             tcg_gen_lookup_and_goto_ptr();
             break;
-        case BS_NONE:
+        case DISAS_NEXT:
             save_cpu_state(&ctx, 0);
             gen_goto_tb(&ctx, 0, ctx.pc);
             break;
-        case BS_EXCP:
+        case DISAS_EXIT:
             tcg_gen_exit_tb(0);
             break;
-        case BS_BRANCH:
+        case DISAS_NORETURN:
         default:
             break;
         }
-- 
2.17.0

