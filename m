Received: by 10.25.27.66 with SMTP id b63csp439609lfb;
        Thu, 9 Jun 2016 10:39:24 -0700 (PDT)
X-Received: by 10.233.237.13 with SMTP id c13mr11581539qkg.126.1465493964838;
        Thu, 09 Jun 2016 10:39:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s69si4009033qgd.2.2016.06.09.10.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 10:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB3vQ-0000As-6D
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 13:39:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1bB3od-0001i2-NU
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 13:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1bB3ob-00067g-Uo
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 13:32:23 -0400
Received: from roura.ac.upc.edu ([147.83.33.10]:54684 helo=roura.ac.upc.es)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1bB3oV-00066k-8e; Thu, 09 Jun 2016 13:32:15 -0400
Received: from gw-3.ac.upc.es (gw-3.ac.upc.es [147.83.30.9])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u59HVge6016740;
	Thu, 9 Jun 2016 19:31:42 +0200
Received: from localhost (unknown [84.88.51.85])
	by gw-3.ac.upc.es (Postfix) with ESMTPSA id 0234B106;
	Thu,  9 Jun 2016 19:31:42 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Date: Thu,  9 Jun 2016 19:31:41 +0200
Message-Id: <146549350162.18437.3033661139638458143.stgit@fimbulvetr.bsc.es>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <146549349621.18437.2525731170881838640.stgit@fimbulvetr.bsc.es>
References: <146549349621.18437.2525731170881838640.stgit@fimbulvetr.bsc.es>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es id
	u59HVge6016740
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.83.33.10
Subject: [Qemu-devel] [PATCH v5 1/2] exec: [tcg] Track which vCPU is
 performing translation and execution
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uMqmC6fRhbkE

Information is tracked inside the TCGContext structure, and later used
by tracing events with the 'tcg' and 'vcpu' properties.

The 'cpu' field is used to check tracing of translation-time
events ("*_trans"). The 'tcg_env' field is used to pass it to
execution-time events ("*_exec").

Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target-alpha/translate.c      |    1 +
 target-arm/translate.c        |    1 +
 target-cris/translate.c       |    1 +
 target-cris/translate_v10.c   |    1 +
 target-i386/translate.c       |    1 +
 target-lm32/translate.c       |    1 +
 target-m68k/translate.c       |    1 +
 target-microblaze/translate.c |    1 +
 target-mips/translate.c       |    1 +
 target-moxie/translate.c      |    1 +
 target-openrisc/translate.c   |    1 +
 target-ppc/translate.c        |    1 +
 target-s390x/translate.c      |    1 +
 target-sh4/translate.c        |    1 +
 target-sparc/translate.c      |    1 +
 target-tilegx/translate.c     |    1 +
 target-tricore/translate.c    |    1 +
 target-unicore32/translate.c  |    1 +
 target-xtensa/translate.c     |    1 +
 tcg/tcg.h                     |    4 ++++
 translate-all.c               |    2 ++
 21 files changed, 25 insertions(+)

diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index 5b86992..67681f6 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -150,6 +150,7 @@ void alpha_translate_init(void)
     done_init =3D 1;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < 31; i++) {
         cpu_std_ir[i] =3D tcg_global_mem_new_i64(cpu_env,
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 940ec8d..1a7496b 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -84,6 +84,7 @@ void arm_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < 16; i++) {
         cpu_R[i] =3D tcg_global_mem_new_i32(cpu_env,
diff --git a/target-cris/translate.c b/target-cris/translate.c
index a73176c..f603af3 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -3364,6 +3364,7 @@ void cris_initialize_tcg(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cc_x =3D tcg_global_mem_new(cpu_env,
                               offsetof(CPUCRISState, cc_x), "cc_x");
     cc_src =3D tcg_global_mem_new(cpu_env,
diff --git a/target-cris/translate_v10.c b/target-cris/translate_v10.c
index 7607ead..f2e9768 100644
--- a/target-cris/translate_v10.c
+++ b/target-cris/translate_v10.c
@@ -1250,6 +1250,7 @@ void cris_initialize_crisv10_tcg(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cc_x =3D tcg_global_mem_new(cpu_env,
                               offsetof(CPUCRISState, cc_x), "cc_x");
     cc_src =3D tcg_global_mem_new(cpu_env,
diff --git a/target-i386/translate.c b/target-i386/translate.c
index 1a1214d..7a6ef7c 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -8135,6 +8135,7 @@ void tcg_x86_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_cc_op =3D tcg_global_mem_new_i32(cpu_env,
                                        offsetof(CPUX86State, cc_op), "cc=
_op");
     cpu_cc_dst =3D tcg_global_mem_new(cpu_env, offsetof(CPUX86State, cc_=
dst),
diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index 256a51f..b2e5a3e 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -1191,6 +1191,7 @@ void lm32_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < ARRAY_SIZE(cpu_R); i++) {
         cpu_R[i] =3D tcg_global_mem_new(cpu_env,
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index 7560c3a..f90f80e 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -77,6 +77,7 @@ void m68k_tcg_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
 #define DEFO32(name, offset) \
     QREG_##name =3D tcg_global_mem_new_i32(cpu_env, \
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.=
c
index f944965..05092f1 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -1869,6 +1869,7 @@ void mb_tcg_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     env_debug =3D tcg_global_mem_new(cpu_env,
                     offsetof(CPUMBState, debug),
diff --git a/target-mips/translate.c b/target-mips/translate.c
index a3a05ec..24f994c 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -19993,6 +19993,7 @@ void mips_tcg_init(void)
         return;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     TCGV_UNUSED(cpu_gpr[0]);
     for (i =3D 1; i < 32; i++)
diff --git a/target-moxie/translate.c b/target-moxie/translate.c
index a437e2a..44c8c0d 100644
--- a/target-moxie/translate.c
+++ b/target-moxie/translate.c
@@ -106,6 +106,7 @@ void moxie_translate_init(void)
         return;
     }
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_pc =3D tcg_global_mem_new_i32(cpu_env,
                                     offsetof(CPUMoxieState, pc), "$pc");
     for (i =3D 0; i < 16; i++)
diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 5d0ab44..170bb40 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -78,6 +78,7 @@ void openrisc_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_sr =3D tcg_global_mem_new(cpu_env,
                                 offsetof(CPUOpenRISCState, sr), "sr");
     env_flags =3D tcg_global_mem_new_i32(cpu_env,
diff --git a/target-ppc/translate.c b/target-ppc/translate.c
index b3860ec..cf4771b 100644
--- a/target-ppc/translate.c
+++ b/target-ppc/translate.c
@@ -87,6 +87,7 @@ void ppc_translate_init(void)
         return;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     p =3D cpu_reg_names;
     cpu_reg_names_size =3D sizeof(cpu_reg_names);
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index c871ef2..24c1d07 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -168,6 +168,7 @@ void s390x_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     psw_addr =3D tcg_global_mem_new_i64(cpu_env,
                                       offsetof(CPUS390XState, psw.addr),
                                       "psw_addr");
diff --git a/target-sh4/translate.c b/target-sh4/translate.c
index 7c18968..b838386 100644
--- a/target-sh4/translate.c
+++ b/target-sh4/translate.c
@@ -100,6 +100,7 @@ void sh4_translate_init(void)
         return;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < 24; i++)
         cpu_gregs[i] =3D tcg_global_mem_new_i32(cpu_env,
diff --git a/target-sparc/translate.c b/target-sparc/translate.c
index 7998ff5..f12b878 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -5392,6 +5392,7 @@ void gen_intermediate_code_init(CPUSPARCState *env)
     inited =3D 1;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     cpu_regwptr =3D tcg_global_mem_new_ptr(cpu_env,
                                          offsetof(CPUSPARCState, regwptr=
),
diff --git a/target-tilegx/translate.c b/target-tilegx/translate.c
index 03918eb..399843a 100644
--- a/target-tilegx/translate.c
+++ b/target-tilegx/translate.c
@@ -2442,6 +2442,7 @@ void tilegx_tcg_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_pc =3D tcg_global_mem_new_i64(cpu_env, offsetof(CPUTLGState, pc)=
, "pc");
     for (i =3D 0; i < TILEGX_R_COUNT; i++) {
         cpu_regs[i] =3D tcg_global_mem_new_i64(cpu_env,
diff --git a/target-tricore/translate.c b/target-tricore/translate.c
index 912bf22..7195c4e 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -8823,6 +8823,7 @@ void tricore_tcg_init(void)
         return;
     }
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     /* reg init */
     for (i =3D 0 ; i < 16 ; i++) {
         cpu_gpr_a[i] =3D tcg_global_mem_new(cpu_env,
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 39af3af..d2b786e 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -69,6 +69,7 @@ void uc32_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < 32; i++) {
         cpu_R[i] =3D tcg_global_mem_new_i32(cpu_env,
diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
index 9894488..0ba59da 100644
--- a/target-xtensa/translate.c
+++ b/target-xtensa/translate.c
@@ -218,6 +218,7 @@ void xtensa_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_pc =3D tcg_global_mem_new_i32(cpu_env,
             offsetof(CPUXtensaState, pc), "pc");
=20
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 40c8fbe..89914c2 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -576,6 +576,10 @@ struct TCGContext {
=20
     TBContext tb_ctx;
=20
+    /* Track which vCPU triggers events */
+    CPUState *cpu;                      /* *_trans */
+    TCGv_env tcg_env;                   /* *_exec  */
+
     /* The TCGBackendData structure is private to tcg-target.inc.c.  */
     struct TCGBackendData *be;
=20
diff --git a/translate-all.c b/translate-all.c
index 8329ea6..360b26a 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -1094,7 +1094,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
=20
     tcg_func_start(&tcg_ctx);
=20
+    tcg_ctx.cpu =3D ENV_GET_CPU(env);
     gen_intermediate_code(env, tb);
+    tcg_ctx.cpu =3D NULL;
=20
     trace_translate_block(tb, tb->pc, tb->tc_ptr);
=20

