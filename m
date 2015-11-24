Received: by 10.182.158.201 with SMTP id ww9csp2168939obb;
        Tue, 24 Nov 2015 09:15:36 -0800 (PST)
X-Received: by 10.13.247.70 with SMTP id h67mr1725434ywf.3.1448385336153;
        Tue, 24 Nov 2015 09:15:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w196si6479616ywg.61.2015.11.24.09.15.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 09:15:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1HBn-0001HL-SD
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 12:15:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1a1H6N-0000Hn-Cp
	for qemu-devel@nongnu.org; Tue, 24 Nov 2015 12:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1a1H6L-0006Vd-Oq
	for qemu-devel@nongnu.org; Tue, 24 Nov 2015 12:09:59 -0500
Received: from roura.ac.upc.edu ([147.83.33.10]:50185 helo=roura.ac.upc.es)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1a1H6D-0006Sz-Dt; Tue, 24 Nov 2015 12:09:49 -0500
Received: from gw-3.ac.upc.es (gw-3.ac.upc.es [147.83.30.9])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id tAOFO6tk019711;
	Tue, 24 Nov 2015 16:24:06 +0100
Received: from localhost (unknown [84.88.51.85])
	by gw-3.ac.upc.es (Postfix) with ESMTPSA id 76A2AA5E;
	Tue, 24 Nov 2015 18:09:20 +0100 (CET)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 18:09:20 +0100
Message-Id: <144838496004.3052.9358576562614844545.stgit@localhost>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <144838492534.3052.2948919558518613064.stgit@localhost>
References: <144838492534.3052.2948919558518613064.stgit@localhost>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es id
	tAOFO6tk019711
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.83.33.10
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jia Liu <proljc@gmail.com>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, Leon Alrae <leon.alrae@imgtec.com>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-devel] [PATCH v2 06/10] exec: [tcg] Track which vCPU is
	performing translation and execution
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t7UAKPbE16Xe

Information is tracked inside the TCGContext structure, and later used
by tracing events with the 'tcg' and 'vcpu' properties.

The 'cpu' field is used to check tracing of translation-time
events ("*_trans"). The 'tcg_env' field is used to pass it to
execution-time events ("*_exec").

Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
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
index d631f74..b5e2256 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -148,6 +148,7 @@ void alpha_translate_init(void)
     done_init =3D 1;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < 31; i++) {
         cpu_std_ir[i] =3D tcg_global_mem_new_i64(TCG_AREG0,
diff --git a/target-arm/translate.c b/target-arm/translate.c
index e672092..9828a84 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -87,6 +87,7 @@ void arm_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < 16; i++) {
         cpu_R[i] =3D tcg_global_mem_new_i32(TCG_AREG0,
diff --git a/target-cris/translate.c b/target-cris/translate.c
index fdcbfc6..e7e3f6c 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -3360,6 +3360,7 @@ void cris_initialize_tcg(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cc_x =3D tcg_global_mem_new(TCG_AREG0,
                               offsetof(CPUCRISState, cc_x), "cc_x");
     cc_src =3D tcg_global_mem_new(TCG_AREG0,
diff --git a/target-cris/translate_v10.c b/target-cris/translate_v10.c
index 3ab1c39..1ef8995 100644
--- a/target-cris/translate_v10.c
+++ b/target-cris/translate_v10.c
@@ -1249,6 +1249,7 @@ void cris_initialize_crisv10_tcg(void)
 	int i;
=20
 	cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+        tcg_ctx.tcg_env =3D cpu_env;
 	cc_x =3D tcg_global_mem_new(TCG_AREG0,
 				  offsetof(CPUCRISState, cc_x), "cc_x");
 	cc_src =3D tcg_global_mem_new(TCG_AREG0,
diff --git a/target-i386/translate.c b/target-i386/translate.c
index 53a09f8..fe5e155 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -7863,6 +7863,7 @@ void optimize_flags_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_cc_op =3D tcg_global_mem_new_i32(TCG_AREG0,
                                        offsetof(CPUX86State, cc_op), "cc=
_op");
     cpu_cc_dst =3D tcg_global_mem_new(TCG_AREG0, offsetof(CPUX86State, c=
c_dst),
diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index a333fc6..7cb786f 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -1189,6 +1189,7 @@ void lm32_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < ARRAY_SIZE(cpu_R); i++) {
         cpu_R[i] =3D tcg_global_mem_new(TCG_AREG0,
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index d68d615..6280da0 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -91,6 +91,7 @@ void m68k_tcg_init(void)
                                                  "EXCEPTION");
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     p =3D cpu_reg_names;
     for (i =3D 0; i < 8; i++) {
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.=
c
index 9f1586f..d587e7e 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -1867,6 +1867,7 @@ void mb_tcg_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     env_debug =3D tcg_global_mem_new(TCG_AREG0,=20
                     offsetof(CPUMBState, debug),
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 610ed7c..c3cdc63 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -19818,6 +19818,7 @@ void mips_tcg_init(void)
         return;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     TCGV_UNUSED(cpu_gpr[0]);
     for (i =3D 1; i < 32; i++)
         cpu_gpr[i] =3D tcg_global_mem_new(TCG_AREG0,
diff --git a/target-moxie/translate.c b/target-moxie/translate.c
index ab8f6a7..11277e0 100644
--- a/target-moxie/translate.c
+++ b/target-moxie/translate.c
@@ -109,6 +109,7 @@ void moxie_translate_init(void)
         return;
     }
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_pc =3D tcg_global_mem_new_i32(TCG_AREG0,
                                     offsetof(CPUMoxieState, pc), "$pc");
     for (i =3D 0; i < 16; i++)
diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 3d29369..de2a541 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -77,6 +77,7 @@ void openrisc_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_sr =3D tcg_global_mem_new(TCG_AREG0,
                                 offsetof(CPUOpenRISCState, sr), "sr");
     env_flags =3D tcg_global_mem_new_i32(TCG_AREG0,
diff --git a/target-ppc/translate.c b/target-ppc/translate.c
index 17f732a..10f3a04 100644
--- a/target-ppc/translate.c
+++ b/target-ppc/translate.c
@@ -85,6 +85,7 @@ void ppc_translate_init(void)
         return;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     p =3D cpu_reg_names;
     cpu_reg_names_size =3D sizeof(cpu_reg_names);
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index 262da89..8df75db 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -166,6 +166,7 @@ void s390x_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     psw_addr =3D tcg_global_mem_new_i64(TCG_AREG0,
                                       offsetof(CPUS390XState, psw.addr),
                                       "psw_addr");
diff --git a/target-sh4/translate.c b/target-sh4/translate.c
index c3a8fbd..58d1624 100644
--- a/target-sh4/translate.c
+++ b/target-sh4/translate.c
@@ -98,6 +98,7 @@ void sh4_translate_init(void)
         return;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < 24; i++)
         cpu_gregs[i] =3D tcg_global_mem_new_i32(TCG_AREG0,
diff --git a/target-sparc/translate.c b/target-sparc/translate.c
index 811519e..9b9f50f 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -5344,6 +5344,7 @@ void gen_intermediate_code_init(CPUSPARCState *env)
         inited =3D 1;
=20
         cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+        tcg_ctx.tcg_env =3D cpu_env;
         cpu_regwptr =3D tcg_global_mem_new_ptr(TCG_AREG0,
                                              offsetof(CPUSPARCState, reg=
wptr),
                                              "regwptr");
diff --git a/target-tilegx/translate.c b/target-tilegx/translate.c
index fb5413a..9ae6d72 100644
--- a/target-tilegx/translate.c
+++ b/target-tilegx/translate.c
@@ -2440,6 +2440,7 @@ void tilegx_tcg_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_pc =3D tcg_global_mem_new_i64(TCG_AREG0, offsetof(CPUTLGState, p=
c), "pc");
     for (i =3D 0; i < TILEGX_R_COUNT; i++) {
         cpu_regs[i] =3D tcg_global_mem_new_i64(TCG_AREG0,
diff --git a/target-tricore/translate.c b/target-tricore/translate.c
index 655db75..a56bf2c 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -8366,6 +8366,7 @@ void tricore_tcg_init(void)
         return;
     }
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     /* reg init */
     for (i =3D 0 ; i < 16 ; i++) {
         cpu_gpr_a[i] =3D tcg_global_mem_new(TCG_AREG0,
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 29c22f5..1c66ab2 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -72,6 +72,7 @@ void uc32_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
=20
     for (i =3D 0; i < 32; i++) {
         cpu_R[i] =3D tcg_global_mem_new_i32(TCG_AREG0,
diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
index 5ad1244..f5bde6b 100644
--- a/target-xtensa/translate.c
+++ b/target-xtensa/translate.c
@@ -217,6 +217,7 @@ void xtensa_translate_init(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cpu_pc =3D tcg_global_mem_new_i32(TCG_AREG0,
             offsetof(CPUXtensaState, pc), "pc");
=20
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 1585551..0f5986d 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -572,6 +572,10 @@ struct TCGContext {
=20
     TBContext tb_ctx;
=20
+    /* Track which vCPU triggers events */
+    CPUState *cpu;                      /* *_trans */
+    TCGv_cpu tcg_env;                   /* *_exec  */
+
     /* The TCGBackendData structure is private to tcg-target.c.  */
     struct TCGBackendData *be;
=20
diff --git a/translate-all.c b/translate-all.c
index 9704efa..decaadf 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -1205,6 +1205,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     ti =3D profile_getclock();
 #endif
=20
+    tcg_ctx.cpu =3D ENV_GET_CPU(env);
+
     tcg_func_start(&tcg_ctx);
=20
     gen_intermediate_code(env, tb);

