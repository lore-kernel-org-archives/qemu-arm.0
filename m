Received: by 10.182.158.201 with SMTP id ww9csp2166760obb;
        Tue, 24 Nov 2015 09:12:25 -0800 (PST)
X-Received: by 10.31.178.78 with SMTP id b75mr25364692vkf.112.1448385145803;
        Tue, 24 Nov 2015 09:12:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n15si12666936vkd.211.2015.11.24.09.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 09:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1H8j-00045f-8r
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 12:12:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1a1H66-0008C8-9R
	for qemu-devel@nongnu.org; Tue, 24 Nov 2015 12:09:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1a1H64-0006QV-A1
	for qemu-devel@nongnu.org; Tue, 24 Nov 2015 12:09:42 -0500
Received: from roura.ac.upc.edu ([147.83.33.10]:50162 helo=roura.ac.upc.es)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1a1H5x-0006Oc-O4; Tue, 24 Nov 2015 12:09:34 -0500
Received: from gw-2.ac.upc.es (gw-2.ac.upc.es [147.83.30.8])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id tAOFNddh019684;
	Tue, 24 Nov 2015 16:23:39 +0100
Received: from localhost (unknown [84.88.51.85])
	by gw-2.ac.upc.es (Postfix) with ESMTPSA id 5B0F52D4;
	Tue, 24 Nov 2015 18:08:53 +0100 (CET)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 18:08:53 +0100
Message-Id: <144838493289.3052.15255684814281779199.stgit@localhost>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <144838492534.3052.2948919558518613064.stgit@localhost>
References: <144838492534.3052.2948919558518613064.stgit@localhost>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es id
	tAOFNddh019684
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.83.33.10
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jia Liu <proljc@gmail.com>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, Leon Alrae <leon.alrae@imgtec.com>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-devel] [PATCH v2 01/10] trace: Add support for vCPU pointers
	in trace events
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
X-TUID: PSIyOk6K7j88

The tracing infrastructure later needs to differentiate between regular
pointers and pointers to vCPUs.

Also changes all targets to use the new 'TCGv_cpu' type instead of the
generic 'TCGv_ptr'. As of now, the change is merely cosmetic ('TCGv_cpu'
translates into 'TCGv_ptr'), but that could change in the future to
enforce the difference.

Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
---
 include/qemu/typedefs.h        |    1 +
 scripts/tracetool/transform.py |    9 ++++++++-
 target-alpha/translate.c       |    2 +-
 target-arm/translate.c         |    2 +-
 target-arm/translate.h         |    2 +-
 target-cris/translate.c        |    2 +-
 target-i386/translate.c        |    2 +-
 target-lm32/translate.c        |    2 +-
 target-m68k/translate.c        |    2 +-
 target-microblaze/translate.c  |    2 +-
 target-mips/translate.c        |    2 +-
 target-moxie/translate.c       |    2 +-
 target-openrisc/translate.c    |    2 +-
 target-ppc/translate.c         |    2 +-
 target-s390x/translate.c       |    2 +-
 target-sh4/translate.c         |    2 +-
 target-sparc/translate.c       |    5 +++--
 target-tilegx/translate.c      |    2 +-
 target-tricore/translate.c     |    2 +-
 target-unicore32/translate.c   |    2 +-
 target-xtensa/translate.c      |    2 +-
 tcg/tcg-op.h                   |    2 --
 tcg/tcg.h                      |    6 ++++++
 trace/control.h                |    3 ++-
 24 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 6b1093d..5f28c36 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -19,6 +19,7 @@ typedef struct BusState BusState;
 typedef struct CharDriverState CharDriverState;
 typedef struct CompatProperty CompatProperty;
 typedef struct CPUAddressSpace CPUAddressSpace;
+typedef struct CPUState CPUState;
 typedef struct DeviceState DeviceState;
 typedef struct DeviceListener DeviceListener;
 typedef struct DisplayChangeListener DisplayChangeListener;
diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transform=
.py
index fc5e679..db3ed54 100644
--- a/scripts/tracetool/transform.py
+++ b/scripts/tracetool/transform.py
@@ -6,7 +6,7 @@ Type-transformation rules.
 """
=20
 __author__     =3D "Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>"
-__copyright__  =3D "Copyright 2012-2014, Llu=C3=ADs Vilanova <vilanova@a=
c.upc.edu>"
+__copyright__  =3D "Copyright 2012-2015, Llu=C3=ADs Vilanova <vilanova@a=
c.upc.edu>"
 __license__    =3D "GPL version 2 or (at your option) any later version"
=20
 __maintainer__ =3D "Stefan Hajnoczi"
@@ -74,6 +74,7 @@ TCG_2_HOST =3D {
     "TCGv_i32": "uint32_t",
     "TCGv_i64": "uint64_t",
     "TCGv_ptr": "void *",
+    "TCGv_cpu": "CPUState *",
     None: _tcg_2_host,
     }
=20
@@ -98,6 +99,7 @@ HOST_2_TCG =3D {
     "uint32_t": "TCGv_i32",
     "uint64_t": "TCGv_i64",
     "void *"  : "TCGv_ptr",
+    "CPUState *": "TCGv_cpu",
     None: _host_2_tcg,
     }
=20
@@ -115,6 +117,8 @@ TCG_2_TCG_HELPER_DEF =3D {
     "TCGv_i32": "uint32_t",
     "TCGv_i64": "uint64_t",
     "TCGv_ptr": "void *",
+    "TCGv_cpu": "void *",
+    "CPUState *": "void *",
     None: _tcg_2_helper_def,
     }
=20
@@ -130,6 +134,7 @@ TCG_2_TCG_HELPER_DECL =3D {
     "TCGv_ptr": "ptr",
     "TCGv_i32": "i32",
     "TCGv_i64": "i64",
+    "TCGv_cpu": "ptr",
     None: _tcg_2_tcg_helper_decl_error,
     }
=20
@@ -146,6 +151,7 @@ HOST_2_TCG_TMP_NEW =3D {
     "uint32_t": "tcg_const_i32",
     "uint64_t": "tcg_const_i64",
     "void *"  : "tcg_const_ptr",
+    "CPUState *": "tcg_const_ptr",
     None: _host_2_tcg_tmp_new,
     }
=20
@@ -162,5 +168,6 @@ HOST_2_TCG_TMP_FREE =3D {
     "uint32_t": "tcg_temp_free_i32",
     "uint64_t": "tcg_temp_free_i64",
     "void *"  : "tcg_temp_free_ptr",
+    "CPUState *": "tcg_temp_free_ptr",
     None: _host_2_tcg_tmp_free,
     }
diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index 9909c70..d631f74 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -91,7 +91,7 @@ typedef enum {
 } ExitStatus;
=20
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_std_ir[31];
 static TCGv cpu_fir[31];
 static TCGv cpu_pc;
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 5d22879..e672092 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -59,7 +59,7 @@
 #define IS_USER(s) (s->user)
 #endif
=20
-TCGv_ptr cpu_env;
+TCGv_cpu cpu_env;
 /* We reuse the same 64-bit temporaries for efficiency.  */
 static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 static TCGv_i32 cpu_R[16];
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 53ef971..6e8eb7d 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -70,7 +70,7 @@ typedef struct DisasCompare {
 } DisasCompare;
=20
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
-extern TCGv_ptr cpu_env;
+extern TCGv_cpu cpu_env;
 extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
 extern TCGv_i64 cpu_exclusive_val;
diff --git a/target-cris/translate.c b/target-cris/translate.c
index 2d710cc..fdcbfc6 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -58,7 +58,7 @@
 #define CC_MASK_NZVC 0xf
 #define CC_MASK_RNZV 0x10e
=20
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_R[16];
 static TCGv cpu_PR[16];
 static TCGv cc_x;
diff --git a/target-i386/translate.c b/target-i386/translate.c
index a3dd167..53a09f8 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -62,7 +62,7 @@
 //#define MACRO_TEST   1
=20
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_A0;
 static TCGv cpu_cc_dst, cpu_cc_src, cpu_cc_src2, cpu_cc_srcT;
 static TCGv_i32 cpu_cc_op;
diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index fa5b0b9..a333fc6 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -42,7 +42,7 @@
=20
 #define MEM_INDEX 0
=20
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_R[32];
 static TCGv cpu_pc;
 static TCGv cpu_ie;
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index 41ae2c6..d68d615 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -48,7 +48,7 @@
 static TCGv_i32 cpu_halted;
 static TCGv_i32 cpu_exception_index;
=20
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
=20
 static char cpu_reg_names[3*8*3 + 5*4];
 static TCGv cpu_dregs[8];
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.=
c
index 154b9d6..9f1586f 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -44,7 +44,7 @@
             (((src) >> start) & ((1 << (end - start + 1)) - 1))
=20
 static TCGv env_debug;
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_R[32];
 static TCGv cpu_SR[18];
 static TCGv env_imm;
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 5626647..610ed7c 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -1351,7 +1351,7 @@ enum {
 };
=20
 /* global register indices */
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_gpr[32], cpu_PC;
 static TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 static TCGv cpu_dspctrl, btarget, bcond;
diff --git a/target-moxie/translate.c b/target-moxie/translate.c
index 6dedcb7..ab8f6a7 100644
--- a/target-moxie/translate.c
+++ b/target-moxie/translate.c
@@ -59,7 +59,7 @@ enum {
=20
 static TCGv cpu_pc;
 static TCGv cpu_gregs[16];
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cc_a, cc_b;
=20
 #include "exec/gen-icount.h"
diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 606490a..3d29369 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -52,7 +52,7 @@ typedef struct DisasContext {
     uint32_t delayed_branch;
 } DisasContext;
=20
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_sr;
 static TCGv cpu_R[32];
 static TCGv cpu_pc;
diff --git a/target-ppc/translate.c b/target-ppc/translate.c
index 41a7258..17f732a 100644
--- a/target-ppc/translate.c
+++ b/target-ppc/translate.c
@@ -47,7 +47,7 @@
 /* Code translation helpers                                             =
     */
=20
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static char cpu_reg_names[10*3 + 22*4 /* GPR */
     + 10*4 + 22*5 /* SPE GPRh */
     + 10*4 + 22*5 /* FPR */
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index c79a2cb..262da89 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -36,7 +36,7 @@
 #include "exec/cpu_ldst.h"
=20
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
=20
 #include "exec/gen-icount.h"
 #include "exec/helper-proto.h"
diff --git a/target-sh4/translate.c b/target-sh4/translate.c
index 7bc6216..c3a8fbd 100644
--- a/target-sh4/translate.c
+++ b/target-sh4/translate.c
@@ -59,7 +59,7 @@ enum {
 };
=20
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_gregs[24];
 static TCGv cpu_sr, cpu_sr_m, cpu_sr_q, cpu_sr_t;
 static TCGv cpu_pc, cpu_ssr, cpu_spc, cpu_gbr;
diff --git a/target-sparc/translate.c b/target-sparc/translate.c
index 41a3319..811519e 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -42,7 +42,8 @@
                          according to jump_pc[T2] */
=20
 /* global register indexes */
-static TCGv_ptr cpu_env, cpu_regwptr;
+static TCGv_cpu cpu_env;
+static TCGv_ptr cpu_regwptr;
 static TCGv cpu_cc_src, cpu_cc_src2, cpu_cc_dst;
 static TCGv_i32 cpu_cc_op;
 static TCGv_i32 cpu_psr;
@@ -2294,7 +2295,7 @@ static void gen_fmovq(DisasContext *dc, DisasCompar=
e *cmp, int rd, int rs)
 }
=20
 #ifndef CONFIG_USER_ONLY
-static inline void gen_load_trap_state_at_tl(TCGv_ptr r_tsptr, TCGv_ptr =
cpu_env)
+static inline void gen_load_trap_state_at_tl(TCGv_ptr r_tsptr, TCGv_cpu =
cpu_env)
 {
     TCGv_i32 r_tl =3D tcg_temp_new_i32();
=20
diff --git a/target-tilegx/translate.c b/target-tilegx/translate.c
index 354f25a..fb5413a 100644
--- a/target-tilegx/translate.c
+++ b/target-tilegx/translate.c
@@ -30,7 +30,7 @@
=20
 #define FMT64X                          "%016" PRIx64
=20
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv cpu_pc;
 static TCGv cpu_regs[TILEGX_R_COUNT];
=20
diff --git a/target-tricore/translate.c b/target-tricore/translate.c
index 135c583..655db75 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -45,7 +45,7 @@ static TCGv cpu_PSW_SV;
 static TCGv cpu_PSW_AV;
 static TCGv cpu_PSW_SAV;
 /* CPU env */
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
=20
 #include "exec/gen-icount.h"
=20
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index d2f92f0..29c22f5 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -51,7 +51,7 @@ typedef struct DisasContext {
    conditional executions state has been updated.  */
 #define DISAS_SYSCALL 5
=20
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv_i32 cpu_R[32];
=20
 /* FIXME:  These should be removed.  */
diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
index 06b0163..5ad1244 100644
--- a/target-xtensa/translate.c
+++ b/target-xtensa/translate.c
@@ -73,7 +73,7 @@ typedef struct DisasContext {
     unsigned cpenable;
 } DisasContext;
=20
-static TCGv_ptr cpu_env;
+static TCGv_cpu cpu_env;
 static TCGv_i32 cpu_pc;
 static TCGv_i32 cpu_R[16];
 static TCGv_i32 cpu_FR[16];
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 4e20dc1..c446d3d 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -756,7 +756,6 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
 void tcg_gen_goto_tb(unsigned idx);
=20
 #if TARGET_LONG_BITS =3D=3D 32
-#define TCGv TCGv_i32
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_reg_new tcg_global_reg_new_i32
 #define tcg_global_mem_new tcg_global_mem_new_i32
@@ -768,7 +767,6 @@ void tcg_gen_goto_tb(unsigned idx);
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
 #else
-#define TCGv TCGv_i64
 #define tcg_temp_new() tcg_temp_new_i64()
 #define tcg_global_reg_new tcg_global_reg_new_i64
 #define tcg_global_mem_new tcg_global_mem_new_i64
diff --git a/tcg/tcg.h b/tcg/tcg.h
index a696922..1585551 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -308,6 +308,12 @@ typedef tcg_target_ulong TCGArg;
 typedef struct TCGv_i32_d *TCGv_i32;
 typedef struct TCGv_i64_d *TCGv_i64;
 typedef struct TCGv_ptr_d *TCGv_ptr;
+typedef TCGv_ptr TCGv_cpu;
+#if TARGET_LONG_BITS =3D=3D 32
+typedef TCGv_i32 TCGv;
+#else  /* TARGET_LONG_BITS =3D=3D 64 */
+typedef TCGv_i64 TCGv;
+#endif
=20
 static inline TCGv_i32 QEMU_ARTIFICIAL MAKE_TCGV_I32(intptr_t i)
 {
diff --git a/trace/control.h b/trace/control.h
index da9bb6b..275a086 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -1,7 +1,7 @@
 /*
  * Interface for configuring and controlling the state of tracing events.
  *
- * Copyright (C) 2011-2014 Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
+ * Copyright (C) 2011-2015 Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
  * See the COPYING file in the top-level directory.
@@ -11,6 +11,7 @@
 #define TRACE__CONTROL_H
=20
 #include "qemu-common.h"
+#include "qemu/typedefs.h"
 #include "trace/generated-events.h"
=20
=20

