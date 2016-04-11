Received: by 10.25.208.211 with SMTP id h202csp1577944lfg;
        Mon, 11 Apr 2016 11:16:21 -0700 (PDT)
X-Received: by 10.140.168.85 with SMTP id o82mr31433091qho.16.1460398578654;
        Mon, 11 Apr 2016 11:16:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z129si10293344qke.38.2016.04.11.11.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Apr 2016 11:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apgNm-00045g-4e
	for alex.bennee@linaro.org; Mon, 11 Apr 2016 14:16:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apgNf-0003vr-Gc
	for qemu-arm@nongnu.org; Mon, 11 Apr 2016 14:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apgNb-0005qj-9G
	for qemu-arm@nongnu.org; Mon, 11 Apr 2016 14:16:11 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:57362 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1apgNa-0005qH-UC; Mon, 11 Apr 2016 14:16:07 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id A37691A458B;
	Mon, 11 Apr 2016 20:15:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 6F37A1A4155;
	Mon, 11 Apr 2016 20:15:41 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Apr 2016 20:15:29 +0200
Message-Id: <1460398530-4412-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460398530-4412-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460398530-4412-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v3 5/6] target-mips: Add abs2008 flavor of
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
Cc: proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4UlkJjhTMKk7

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Updated handling of instuctions <ABS|NEG>.<S|D>. Note that legacy
(pre-abs2008) ABS and NEG instructions are arithmetic (any NaN operand
signals invalid operation), while abs2008 ones are non-arithmetic, always
changing the sign bit, even for NaN-like operands. Details on these
kxinstructions are documented in [1], pages 35 and 359.

[1] "MIPS=C2=AE Architecture For Programmers Volume II-A:
    The MIPS64=C2=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015

Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/translate.c |   27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index de0b224..1d376fc 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -1434,6 +1434,8 @@ typedef struct DisasContext {
     bool vp;
     bool cmgcr;
     bool mrp;
+    bool abs2008;
+
 } DisasContext;
=20
 enum {
@@ -8879,7 +8881,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
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
@@ -8898,7 +8904,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
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
@@ -9369,7 +9379,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
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
@@ -9390,7 +9404,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
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
@@ -19775,6 +19793,7 @@ void gen_intermediate_code(CPUMIPSState *env, str=
uct TranslationBlock *tb)
              (env->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F));
     ctx.vp =3D (env->CP0_Config5 >> CP0C5_VP) & 1;
     ctx.mrp =3D (env->CP0_Config5 >> CP0C5_MRP) & 1;
+    ctx.abs2008 =3D (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
     restore_cpu_state(env, &ctx);
 #ifdef CONFIG_USER_ONLY
         ctx.mem_idx =3D MIPS_HFLAG_UM;
--=20
1.7.9.5

