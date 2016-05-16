Received: by 10.25.208.137 with SMTP id h131csp1290658lfg;
        Mon, 16 May 2016 07:15:53 -0700 (PDT)
X-Received: by 10.141.28.204 with SMTP id f195mr30473592qhe.59.1463408153622;
        Mon, 16 May 2016 07:15:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f91si23172772qga.24.2016.05.16.07.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 07:15:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2JJI-0001ht-Og
	for alex.bennee@linaro.org; Mon, 16 May 2016 10:15:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JIh-0000fE-Gr
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JIf-0006CO-1L
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:15:14 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:33375 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b2JIe-0006CB-MD; Mon, 16 May 2016 10:15:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id C84811A4536;
	Mon, 16 May 2016 16:15:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 9C6A41A4530;
	Mon, 16 May 2016 16:15:10 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 May 2016 16:12:43 +0200
Message-Id: <1463407965-19733-8-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v6 7/9] target-mips: Add abs2008 flavor of
 <ABS|NEG>.<S|D>
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: da/eZ4ZVOB31

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Updated handling of instructions <ABS|NEG>.<S|D>. Note that legacy
(pre-abs2008) ABS and NEG instructions are arithmetic (and, therefore,
any NaN operand causes signaling invalid operation), while abs2008
ones are non-arithmetic, always and only changing the sign bit, even
for NaN-like operands. Details on these instructions are documented
in [1] p. 35 and 359.

Implementation-wise, abs2008 versions are implemented without helpers,
for simplicity and performance sake.

[1] "MIPS Architecture For Programmers Volume II-A:
    The MIPS64 Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>
Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/translate.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index 2cdd2bd..3b6b3b5 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -1434,6 +1434,7 @@ typedef struct DisasContext {
     bool vp;
     bool cmgcr;
     bool mrp;
+    bool abs2008;
 } DisasContext;
 
 enum {
@@ -8879,7 +8880,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_abs_s(fp0, fp0);
+            if (ctx->abs2008) {
+                tcg_gen_andi_i32(fp0, fp0, 0x7fffffffUL);
+            } else {
+                gen_helper_float_abs_s(fp0, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8898,7 +8903,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_chs_s(fp0, fp0);
+            if (ctx->abs2008) {
+                tcg_gen_xori_i32(fp0, fp0, 1UL << 31);
+            } else {
+                gen_helper_float_chs_s(fp0, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -9369,7 +9378,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_abs_d(fp0, fp0);
+            if (ctx->abs2008) {
+                tcg_gen_andi_i64(fp0, fp0, 0x7fffffffffffffffULL);
+            } else {
+                gen_helper_float_abs_d(fp0, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9390,7 +9403,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_chs_d(fp0, fp0);
+            if (ctx->abs2008) {
+                tcg_gen_xori_i64(fp0, fp0, 1ULL << 63);
+            } else {
+                gen_helper_float_chs_d(fp0, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -19775,6 +19792,7 @@ void gen_intermediate_code(CPUMIPSState *env, struct TranslationBlock *tb)
              (env->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F));
     ctx.vp = (env->CP0_Config5 >> CP0C5_VP) & 1;
     ctx.mrp = (env->CP0_Config5 >> CP0C5_MRP) & 1;
+    ctx.abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
     restore_cpu_state(env, &ctx);
 #ifdef CONFIG_USER_ONLY
         ctx.mem_idx = MIPS_HFLAG_UM;
-- 
1.9.1

