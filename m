Received: by 10.25.208.211 with SMTP id h202csp269690lfg;
        Wed, 17 Feb 2016 13:35:27 -0800 (PST)
X-Received: by 10.28.186.11 with SMTP id k11mr5582307wmf.79.1455744927259;
        Wed, 17 Feb 2016 13:35:27 -0800 (PST)
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id ip7si4765581wjb.98.2016.02.17.13.35.26;
        Wed, 17 Feb 2016 13:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from gw-2.ac.upc.es (gw-2.ac.upc.es [147.83.30.8])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u1HLZ0UJ007529;
	Wed, 17 Feb 2016 22:35:00 +0100
Received: from localhost (unknown [84.88.51.85])
	by gw-2.ac.upc.es (Postfix) with ESMTPSA id 6AF14902;
	Wed, 17 Feb 2016 22:35:00 +0100 (CET)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell <peter.maydell@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Leon Alrae <leon.alrae@imgtec.com>,
        Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
        Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
        qemu-arm@nongnu.org (open list:ARM),
        qemu-ppc@nongnu.org (open list:PowerPC)
Subject: [PATCH v7 3/4] tcg: Add type for vCPU pointers
Date: Wed, 17 Feb 2016 22:35:00 +0100
Message-Id: <145574489991.6637.18171202198669010731.stgit@localhost>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <145574488321.6637.3923094874117473534.stgit@localhost>
References: <145574488321.6637.3923094874117473534.stgit@localhost>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: eA26TTF3DOKP

Adds the 'TCGv_env' type for pointers to 'CPUArchState' objects. The
tracing infrastructure later needs to differentiate between regular
pointers and pointers to vCPUs.

Also changes all targets to use the new 'TCGv_env' type instead of the
generic 'TCGv_ptr'. As of now, the change is merely cosmetic ('TCGv_env'
translates into 'TCGv_ptr'), but that could change in the future to
enforce the difference.

Note that a 'TCGv_env' type (for 'CPUState') is not added, since all
helpers currently receive the architecture-specific
pointer ('CPUArchState').

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Acked-by: Richard Henderson <rth@twiddle.net>
---
 target-alpha/translate.c      |    2 +-
 target-arm/translate.c        |    2 +-
 target-arm/translate.h        |    2 +-
 target-cris/translate.c       |    2 +-
 target-i386/translate.c       |    2 +-
 target-lm32/translate.c       |    2 +-
 target-m68k/translate.c       |    2 +-
 target-microblaze/translate.c |    2 +-
 target-mips/translate.c       |    2 +-
 target-moxie/translate.c      |    2 +-
 target-openrisc/translate.c   |    2 +-
 target-ppc/translate.c        |    2 +-
 target-s390x/translate.c      |    2 +-
 target-sh4/translate.c        |    2 +-
 target-sparc/translate.c      |    5 +++--
 target-tilegx/translate.c     |    2 +-
 target-tricore/translate.c    |    2 +-
 target-unicore32/translate.c  |    2 +-
 target-xtensa/translate.c     |    2 +-
 tcg/tcg.h                     |    1 +
 20 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index 7b798b0..5b86992 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -93,7 +93,7 @@ typedef enum {
 } ExitStatus;
 
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_std_ir[31];
 static TCGv cpu_fir[31];
 static TCGv cpu_pc;
diff --git a/target-arm/translate.c b/target-arm/translate.c
index f6a38bc..d2367ab 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -56,7 +56,7 @@
 #define IS_USER(s) (s->user)
 #endif
 
-TCGv_ptr cpu_env;
+TCGv_env cpu_env;
 /* We reuse the same 64-bit temporaries for efficiency.  */
 static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 static TCGv_i32 cpu_R[16];
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 53ef971..82e3f6b 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -70,7 +70,7 @@ typedef struct DisasCompare {
 } DisasCompare;
 
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
-extern TCGv_ptr cpu_env;
+extern TCGv_env cpu_env;
 extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
 extern TCGv_i64 cpu_exclusive_val;
diff --git a/target-cris/translate.c b/target-cris/translate.c
index 2a283e0..a73176c 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -60,7 +60,7 @@
 #define CC_MASK_NZVC 0xf
 #define CC_MASK_RNZV 0x10e
 
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_R[16];
 static TCGv cpu_PR[16];
 static TCGv cc_x;
diff --git a/target-i386/translate.c b/target-i386/translate.c
index f7ceadd..8fe167b 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -59,7 +59,7 @@
 //#define MACRO_TEST   1
 
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_A0;
 static TCGv cpu_cc_dst, cpu_cc_src, cpu_cc_src2, cpu_cc_srcT;
 static TCGv_i32 cpu_cc_op;
diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index 3877993..256a51f 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -44,7 +44,7 @@
 
 #define MEM_INDEX 0
 
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_R[32];
 static TCGv cpu_pc;
 static TCGv cpu_ie;
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index 085cb6a..7560c3a 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -50,7 +50,7 @@
 static TCGv_i32 cpu_halted;
 static TCGv_i32 cpu_exception_index;
 
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 
 static char cpu_reg_names[3*8*3 + 5*4];
 static TCGv cpu_dregs[8];
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
index 296c4d7..f944965 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -46,7 +46,7 @@
             (((src) >> start) & ((1 << (end - start + 1)) - 1))
 
 static TCGv env_debug;
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_R[32];
 static TCGv cpu_SR[18];
 static TCGv env_imm;
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 658926d..3706176 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -1353,7 +1353,7 @@ enum {
 };
 
 /* global register indices */
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_gpr[32], cpu_PC;
 static TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 static TCGv cpu_dspctrl, btarget, bcond;
diff --git a/target-moxie/translate.c b/target-moxie/translate.c
index bc860a5..a437e2a 100644
--- a/target-moxie/translate.c
+++ b/target-moxie/translate.c
@@ -56,7 +56,7 @@ enum {
 
 static TCGv cpu_pc;
 static TCGv cpu_gregs[16];
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cc_a, cc_b;
 
 #include "exec/gen-icount.h"
diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index d25324e..5d0ab44 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -53,7 +53,7 @@ typedef struct DisasContext {
     uint32_t delayed_branch;
 } DisasContext;
 
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_sr;
 static TCGv cpu_R[32];
 static TCGv cpu_pc;
diff --git a/target-ppc/translate.c b/target-ppc/translate.c
index ffef754..6b9792a 100644
--- a/target-ppc/translate.c
+++ b/target-ppc/translate.c
@@ -49,7 +49,7 @@
 /* Code translation helpers                                                  */
 
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static char cpu_reg_names[10*3 + 22*4 /* GPR */
     + 10*4 + 22*5 /* SPE GPRh */
     + 10*4 + 22*5 /* FPR */
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index 82e1165..c871ef2 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -37,7 +37,7 @@
 #include "exec/cpu_ldst.h"
 
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 
 #include "exec/gen-icount.h"
 #include "exec/helper-proto.h"
diff --git a/target-sh4/translate.c b/target-sh4/translate.c
index e35d175..7c18968 100644
--- a/target-sh4/translate.c
+++ b/target-sh4/translate.c
@@ -61,7 +61,7 @@ enum {
 };
 
 /* global register indexes */
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_gregs[24];
 static TCGv cpu_sr, cpu_sr_m, cpu_sr_q, cpu_sr_t;
 static TCGv cpu_pc, cpu_ssr, cpu_spc, cpu_gbr;
diff --git a/target-sparc/translate.c b/target-sparc/translate.c
index 536c4b5..407b54a 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -39,7 +39,8 @@
                          according to jump_pc[T2] */
 
 /* global register indexes */
-static TCGv_ptr cpu_env, cpu_regwptr;
+static TCGv_env cpu_env;
+static TCGv_ptr cpu_regwptr;
 static TCGv cpu_cc_src, cpu_cc_src2, cpu_cc_dst;
 static TCGv_i32 cpu_cc_op;
 static TCGv_i32 cpu_psr;
@@ -2291,7 +2292,7 @@ static void gen_fmovq(DisasContext *dc, DisasCompare *cmp, int rd, int rs)
 }
 
 #ifndef CONFIG_USER_ONLY
-static inline void gen_load_trap_state_at_tl(TCGv_ptr r_tsptr, TCGv_ptr cpu_env)
+static inline void gen_load_trap_state_at_tl(TCGv_ptr r_tsptr, TCGv_cpu cpu_env)
 {
     TCGv_i32 r_tl = tcg_temp_new_i32();
 
diff --git a/target-tilegx/translate.c b/target-tilegx/translate.c
index 7073aba..03918eb 100644
--- a/target-tilegx/translate.c
+++ b/target-tilegx/translate.c
@@ -32,7 +32,7 @@
 
 #define FMT64X                          "%016" PRIx64
 
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv cpu_pc;
 static TCGv cpu_regs[TILEGX_R_COUNT];
 
diff --git a/target-tricore/translate.c b/target-tricore/translate.c
index a70fdf7..91ed08f 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -47,7 +47,7 @@ static TCGv cpu_PSW_SV;
 static TCGv cpu_PSW_AV;
 static TCGv cpu_PSW_SAV;
 /* CPU env */
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 
 #include "exec/gen-icount.h"
 
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 1dd086d..39af3af 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -48,7 +48,7 @@ typedef struct DisasContext {
    conditional executions state has been updated.  */
 #define DISAS_SYSCALL 5
 
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv_i32 cpu_R[32];
 
 /* FIXME:  These should be removed.  */
diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
index fd03603..9894488 100644
--- a/target-xtensa/translate.c
+++ b/target-xtensa/translate.c
@@ -74,7 +74,7 @@ typedef struct DisasContext {
     unsigned cpenable;
 } DisasContext;
 
-static TCGv_ptr cpu_env;
+static TCGv_env cpu_env;
 static TCGv_i32 cpu_pc;
 static TCGv_i32 cpu_R[16];
 static TCGv_i32 cpu_FR[16];
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 83da5fb..697f01d 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -308,6 +308,7 @@ typedef tcg_target_ulong TCGArg;
 typedef struct TCGv_i32_d *TCGv_i32;
 typedef struct TCGv_i64_d *TCGv_i64;
 typedef struct TCGv_ptr_d *TCGv_ptr;
+typedef TCGv_ptr TCGv_env;
 
 static inline TCGv_i32 QEMU_ARTIFICIAL MAKE_TCGV_I32(intptr_t i)
 {
