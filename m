Received: by 10.25.159.19 with SMTP id i19csp576077lfe;
        Fri, 15 Jan 2016 08:42:59 -0800 (PST)
X-Received: by 10.55.78.84 with SMTP id c81mr14402846qkb.85.1452876179832;
        Fri, 15 Jan 2016 08:42:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k73si14026390qkl.107.2016.01.15.08.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 08:42:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK7Sl-0007va-9U
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 11:42:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1aK7PO-0001lg-Pt
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 11:39:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1aK7PN-0004ly-75
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 11:39:30 -0500
Received: from roura.ac.upc.es ([147.83.33.10]:58146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1aK7PJ-0004jL-3I; Fri, 15 Jan 2016 11:39:25 -0500
Received: from gw-3.ac.upc.es (gw-3.ac.upc.es [147.83.30.9])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u0FEwp1F029647;
	Fri, 15 Jan 2016 15:58:51 +0100
Received: from localhost (unknown [84.88.51.85])
	by gw-3.ac.upc.es (Postfix) with ESMTPSA id 0BEEB9B9;
	Fri, 15 Jan 2016 17:38:26 +0100 (CET)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Date: Fri, 15 Jan 2016 17:38:25 +0100
Message-Id: <145287590529.11400.12768620726739743691.stgit@localhost>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <145287587081.11400.4178335509020334684.stgit@localhost>
References: <145287587081.11400.4178335509020334684.stgit@localhost>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es id
	u0FEwp1F029647
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.83.33.10
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
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
Subject: [Qemu-devel] [PATCH v4 6/9] exec: [tcg] Track which vCPU is
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
X-TUID: 79UfGwjvQHi1

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
index b90b932..fa974b8 100644
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
index 5ce5c58..8b34e38 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -3362,6 +3362,7 @@ void cris_initialize_tcg(void)
     int i;
=20
     cpu_env =3D tcg_global_reg_new_ptr(TCG_AREG0, "env");
+    tcg_ctx.tcg_env =3D cpu_env;
     cc_x =3D tcg_global_mem_new(TCG_AREG0,
                               offsetof(CPUCRISState, cc_x), "cc_x");
     cc_src =3D tcg_global_mem_new(TCG_AREG0,
diff --git a/target-cris/translate_v10.c b/target-cris/translate_v10.c
index df20bdc..c0adf29 100644
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
index 3e3a49d..6a4be67 100644
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
index 204cb3a..1dff9b2 100644
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
index 44fdff8..981b628 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -5357,6 +5357,7 @@ void gen_intermediate_code_init(CPUSPARCState *env)
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
index ce0f717..cbbed8d 100644
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
index 8bed171..5f465bf 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -575,6 +575,10 @@ struct TCGContext {
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
index ecadb66..2395977 100644
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

