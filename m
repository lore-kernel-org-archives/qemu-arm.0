Received: by 10.25.208.137 with SMTP id h131csp1290860lfg;
        Mon, 16 May 2016 07:16:25 -0700 (PDT)
X-Received: by 10.55.71.76 with SMTP id u73mr29705254qka.6.1463408173342;
        Mon, 16 May 2016 07:16:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r204si19299970qhr.43.2016.05.16.07.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 07:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2JJc-0002Kg-F8
	for alex.bennee@linaro.org; Mon, 16 May 2016 10:16:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JJ8-0001Xx-TU
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:15:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JJ3-0006HJ-7j
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:15:41 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:33901 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b2JJ2-0006H3-M1; Mon, 16 May 2016 10:15:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id C43331A453E;
	Mon, 16 May 2016 16:15:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 98B121A453D;
	Mon, 16 May 2016 16:15:34 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 May 2016 16:12:45 +0200
Message-Id: <1463407965-19733-10-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v6 9/9] target-mips: Implement FCR31's R/W
 bitmask and related functionalities
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
X-TUID: jrH4wIswrKAR

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

This patch implements read and write access rules for Mips floating
point control and status register (FCR31). The change can be divided
into following parts:

- Add preprocessor constants for all bits of FCR31 and related masks
  for its subfields.

- Add correspondant fields that will keep FCR31's R/W bitmask in
  procesor definitions and processor float_status structure.

- Add appropriate value for FCR31's R/W bitmask for each supported
  processor.

- Modify handling of CFC1 and CTC1 instructions (cases 25, 26, 28)
  so that they utilize newly-defind constants. This is just a cosmetic
  change, to make the code more readable, and to avoid usage of
  hardcoded constants.

- Modify handling of CTC1 (case 31) instruction to use FCR31's R/W
  bitmask.

- Modify handling user mode executables for Mips, in relation to the
  bit EF_MIPS_NAN2008 from ELF header, that is in turn related to
  reading and writing to FCR31.

- Modify gdb behavior in relation to FCR31.

Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 linux-user/main.c            | 14 ++++++++
 target-mips/cpu.h            | 75 +++++++++++++++++++++++++++++++++++++++++--
 target-mips/gdbstub.c        |  8 ++---
 target-mips/op_helper.c      | 76 +++++++++++++++++++++++++++++++-------------
 target-mips/translate.c      |  9 ++----
 target-mips/translate_init.c | 54 +++++++++++++++++++++++++++++++
 6 files changed, 199 insertions(+), 37 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 5f3ec97..cc21057 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4608,6 +4608,20 @@ int main(int argc, char **argv, char **envp)
         if (regs->cp0_epc & 1) {
             env->hflags |= MIPS_HFLAG_M16;
         }
+        if (((info->elf_flags & EF_MIPS_NAN2008) != 0) !=
+            ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) != 0)) {
+            if ((env->active_fpu.fcr31_rw_bitmask &
+                  (1 << FCR31_NAN2008)) == 0) {
+                fprintf(stderr, "ELF binary's NaN mode not supported by CPU\n");
+                exit(1);
+            }
+            if ((info->elf_flags & EF_MIPS_NAN2008) != 0) {
+                env->active_fpu.fcr31 |= (1 << FCR31_NAN2008);
+            } else {
+                env->active_fpu.fcr31 &= ~(1 << FCR31_NAN2008);
+            }
+            restore_snan_bit_mode(env);
+        }
     }
 #elif defined(TARGET_OPENRISC)
     {
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 6478420..bbf81c7 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -110,9 +110,71 @@ struct CPUMIPSFPUContext {
 #define FCR0_PRID 8
 #define FCR0_REV 0
     /* fcsr */
+    uint32_t fcr31_rw_bitmask;
     uint32_t fcr31;
-#define FCR31_ABS2008 19
-#define FCR31_NAN2008 18
+#define FCR31_ROUNDING_MODE_0     0
+#define FCR31_ROUNDING_MODE_1     1
+#define FCR31_FLAGS_INEXACT       2
+#define FCR31_FLAGS_UNDERFLOW     3
+#define FCR31_FLAGS_OVERFLOW      4
+#define FCR31_FLAGS_DIV0          5
+#define FCR31_FLAGS_INVALID       6
+#define FCR31_ENABLE_INEXACT      7
+#define FCR31_ENABLE_UNDERFLOW    8
+#define FCR31_ENABLE_OVERFLOW     9
+#define FCR31_ENABLE_DIV0         10
+#define FCR31_ENABLE_INVALID      11
+#define FCR31_CAUSE_INEXACT       12
+#define FCR31_CAUSE_UNDERFLOW     13
+#define FCR31_CAUSE_OVERFLOW      14
+#define FCR31_CAUSE_DIV0          15
+#define FCR31_CAUSE_INVALID       16
+#define FCR31_CAUSE_UNIMPLEMENTED 17
+#define FCR31_NAN2008             18
+#define FCR31_ABS2008             19
+#define FCR31_0                   20
+#define FCR31_IMPL_0              21
+#define FCR31_IMPL_1              22
+#define FCR31_FCC_COND            23
+#define FCR31_FS                  24
+#define FCR31_FCC_COND_1          25
+#define FCR31_FCC_COND_2          26
+#define FCR31_FCC_COND_3          27
+#define FCR31_FCC_COND_4          28
+#define FCR31_FCC_COND_5          29
+#define FCR31_FCC_COND_6          30
+#define FCR31_FCC_COND_7          31
+#define FCR31_ROUNDING_MODE_MASK  ((1 << FCR31_ROUNDING_MODE_0) | \
+                                   (1 << FCR31_ROUNDING_MODE_1))
+#define FCR31_FLAGS_MASK          ((1 << FCR31_FLAGS_INEXACT) | \
+                                   (1 << FCR31_FLAGS_UNDERFLOW) | \
+                                   (1 << FCR31_FLAGS_OVERFLOW) | \
+                                   (1 << FCR31_FLAGS_DIV0) | \
+                                   (1 << FCR31_FLAGS_INVALID))
+#define FCR31_ENABLE_MASK         ((1 << FCR31_ENABLE_INEXACT) | \
+                                   (1 << FCR31_ENABLE_UNDERFLOW) | \
+                                   (1 << FCR31_ENABLE_OVERFLOW) | \
+                                   (1 << FCR31_ENABLE_DIV0) | \
+                                   (1 << FCR31_ENABLE_INVALID))
+#define FCR31_CAUSE_MASK          ((1 << FCR31_CAUSE_INEXACT) | \
+                                   (1 << FCR31_CAUSE_UNDERFLOW) | \
+                                   (1 << FCR31_CAUSE_OVERFLOW) | \
+                                   (1 << FCR31_CAUSE_DIV0) | \
+                                   (1 << FCR31_CAUSE_INVALID) | \
+                                   (1 << FCR31_CAUSE_UNIMPLEMENTED))
+#define FCR31_IEEE2008_MASK       ((1 << FCR31_NAN2008) | \
+                                   (1 << FCR31_ABS2008))
+#define FCR31_IMPL_MASK           ((1 << FCR31_IMPL_0) | \
+                                   (1 << FCR31_IMPL_1))
+#define FCR31_FCC_MASK            ((1 << FCR31_FCC_COND) | \
+                                   (1 << FCR31_FCC_COND_1) | \
+                                   (1 << FCR31_FCC_COND_2) | \
+                                   (1 << FCR31_FCC_COND_3) | \
+                                   (1 << FCR31_FCC_COND_4) | \
+                                   (1 << FCR31_FCC_COND_5) | \
+                                   (1 << FCR31_FCC_COND_6) | \
+                                   (1 << FCR31_FCC_COND_7))
+#define FCR31_FS_MASK             (1 << FCR31_FS)
 #define SET_FP_COND(num,env)     do { ((env).fcr31) |= ((num) ? (1 << ((num) + 24)) : (1 << 23)); } while(0)
 #define CLEAR_FP_COND(num,env)   do { ((env).fcr31) &= ~((num) ? (1 << ((num) + 24)) : (1 << 23)); } while(0)
 #define GET_FP_COND(env)         ((((env).fcr31 >> 24) & 0xfe) | (((env).fcr31 >> 23) & 0x1))
@@ -813,14 +875,21 @@ static inline void restore_rounding_mode(CPUMIPSState *env)
 
 static inline void restore_flush_mode(CPUMIPSState *env)
 {
-    set_flush_to_zero((env->active_fpu.fcr31 & (1 << 24)) != 0,
+    set_flush_to_zero((env->active_fpu.fcr31 & (1 << FCR31_FS)) != 0,
                       &env->active_fpu.fp_status);
 }
 
+static inline void restore_snan_bit_mode(CPUMIPSState *env)
+{
+    set_snan_bit_is_one(!((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) != 0),
+                        &env->active_fpu.fp_status);
+}
+
 static inline void restore_fp_status(CPUMIPSState *env)
 {
     restore_rounding_mode(env);
     restore_flush_mode(env);
+    restore_snan_bit_mode(env);
 }
 
 static inline void restore_msa_fp_status(CPUMIPSState *env)
diff --git a/target-mips/gdbstub.c b/target-mips/gdbstub.c
index b0b4a32..c407aa9 100644
--- a/target-mips/gdbstub.c
+++ b/target-mips/gdbstub.c
@@ -89,11 +89,9 @@ int mips_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     if (env->CP0_Config1 & (1 << CP0C1_FP) && n >= 38 && n < 72) {
         switch (n) {
         case 70:
-            env->active_fpu.fcr31 = tmp & 0xFF83FFFF;
-            /* set rounding mode */
-            restore_rounding_mode(env);
-            /* set flush-to-zero mode */
-            restore_flush_mode(env);
+            env->active_fpu.fcr31 = (tmp & env->active_fpu.fcr31_rw_bitmask) |
+               (env->active_fpu.fcr31 & !(env->active_fpu.fcr31_rw_bitmask));
+            restore_fp_status(env);
             break;
         case 71:
             /* FIR is read-only.  Ignore writes.  */
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 0d1e959..cb890bc 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2490,15 +2490,23 @@ target_ulong helper_cfc1(CPUMIPSState *env, uint32_t reg)
         }
         break;
     case 25:
-        arg1 = ((env->active_fpu.fcr31 >> 24) & 0xfe) | ((env->active_fpu.fcr31 >> 23) & 0x1);
+        /* read from Floating Point Condition Codes Register (FCCR) */
+        arg1 = ((env->active_fpu.fcr31 >> 24) & 0xfe) |
+               ((env->active_fpu.fcr31 >> 23) & 0x1);
         break;
     case 26:
-        arg1 = env->active_fpu.fcr31 & 0x0003f07c;
+        /* read from Floating Point Enables Register (FENR) */
+        arg1 = (env->active_fpu.fcr31 & FCR31_CAUSE_MASK) |
+               (env->active_fpu.fcr31 & FCR31_FLAGS_MASK);
         break;
     case 28:
-        arg1 = (env->active_fpu.fcr31 & 0x00000f83) | ((env->active_fpu.fcr31 >> 22) & 0x4);
+        /* read from Floating Point Enables Register (FENR) */
+        arg1 = (env->active_fpu.fcr31 & FCR31_ROUNDING_MODE_MASK) |
+               ((env->active_fpu.fcr31 >> 22) & 0x4) |
+               (env->active_fpu.fcr31 & FCR31_ENABLE_MASK);
         break;
     default:
+        /* read from Floating Point Control and Status Register (FCSR) */
         arg1 = (int32_t)env->active_fpu.fcr31;
         break;
     }
@@ -2558,42 +2566,66 @@ void helper_ctc1(CPUMIPSState *env, target_ulong arg1, uint32_t fs, uint32_t rt)
         }
         break;
     case 25:
+        /* write to Floating Point Condition Codes Register (FCCR) */
         if ((env->insn_flags & ISA_MIPS32R6) || (arg1 & 0xffffff00)) {
             return;
         }
-        env->active_fpu.fcr31 = (env->active_fpu.fcr31 & 0x017fffff) | ((arg1 & 0xfe) << 24) |
-                     ((arg1 & 0x1) << 23);
+        env->active_fpu.fcr31 =
+                (env->active_fpu.fcr31 & FCR31_ROUNDING_MODE_MASK) |
+                (env->active_fpu.fcr31 & FCR31_FLAGS_MASK) |
+                (env->active_fpu.fcr31 & FCR31_ENABLE_MASK) |
+                (env->active_fpu.fcr31 & FCR31_CAUSE_MASK) |
+                (env->active_fpu.fcr31 & FCR31_IEEE2008_MASK) |
+                (env->active_fpu.fcr31 & FCR31_IMPL_MASK) |
+                (env->active_fpu.fcr31 & FCR31_FCC_MASK) |
+                ((arg1 & 0x1) << 23) |
+                (env->active_fpu.fcr31 & FCR31_FS_MASK) |
+                ((arg1 & 0xfe) << 24);
         break;
     case 26:
-        if (arg1 & 0x007c0000)
+        /* write to Floating Point Exceptions Register (FEXR) */
+        if (arg1 & 0x007c0000) {
             return;
-        env->active_fpu.fcr31 = (env->active_fpu.fcr31 & 0xfffc0f83) | (arg1 & 0x0003f07c);
+        }
+        env->active_fpu.fcr31 =
+                (env->active_fpu.fcr31 & FCR31_ROUNDING_MODE_MASK) |
+                (arg1 & FCR31_FLAGS_MASK) |
+                (env->active_fpu.fcr31 & FCR31_ENABLE_MASK) |
+                (arg1 & FCR31_CAUSE_MASK) |
+                (env->active_fpu.fcr31 & FCR31_IEEE2008_MASK) |
+                (env->active_fpu.fcr31 & FCR31_IMPL_MASK) |
+                (env->active_fpu.fcr31 & FCR31_FCC_MASK) |
+                (env->active_fpu.fcr31 & FCR31_FS_MASK);
         break;
     case 28:
-        if (arg1 & 0x007c0000)
+        /* write to Floating Point Enables Register (FENR) */
+        if (arg1 & 0x007c0000) {
             return;
-        env->active_fpu.fcr31 = (env->active_fpu.fcr31 & 0xfefff07c) | (arg1 & 0x00000f83) |
-                     ((arg1 & 0x4) << 22);
+        }
+        env->active_fpu.fcr31 =
+                 (arg1 & FCR31_ROUNDING_MODE_MASK) |
+                 (env->active_fpu.fcr31 & FCR31_FLAGS_MASK) |
+                 (arg1 & FCR31_ENABLE_MASK) |
+                 (env->active_fpu.fcr31 & FCR31_CAUSE_MASK) |
+                 (env->active_fpu.fcr31 & FCR31_IEEE2008_MASK) |
+                 (env->active_fpu.fcr31 & FCR31_IMPL_MASK) |
+                 (env->active_fpu.fcr31 & FCR31_FCC_MASK) |
+                 ((arg1 & 0x4) << 22);
         break;
     case 31:
-        if (env->insn_flags & ISA_MIPS32R6) {
-            uint32_t mask = 0xfefc0000;
-            env->active_fpu.fcr31 = (arg1 & ~mask) |
-                (env->active_fpu.fcr31 & mask);
-        } else if (!(arg1 & 0x007c0000)) {
-            env->active_fpu.fcr31 = arg1;
-        }
+        /* write to Floating Point Control and Status Register (FCSR) */
+        env->active_fpu.fcr31 = (arg1 & env->active_fpu.fcr31_rw_bitmask) |
+               (env->active_fpu.fcr31 & ~(env->active_fpu.fcr31_rw_bitmask));
         break;
     default:
         return;
     }
-    /* set rounding mode */
-    restore_rounding_mode(env);
-    /* set flush-to-zero mode */
-    restore_flush_mode(env);
+    restore_fp_status(env);
     set_float_exception_flags(0, &env->active_fpu.fp_status);
-    if ((GET_FP_ENABLE(env->active_fpu.fcr31) | 0x20) & GET_FP_CAUSE(env->active_fpu.fcr31))
+    if ((GET_FP_ENABLE(env->active_fpu.fcr31) | 0x20) &
+         GET_FP_CAUSE(env->active_fpu.fcr31)) {
         do_raise_exception(env, EXCP_FPE, GETPC());
+    }
 }
 
 int ieee_ex_to_mips(int xcpt)
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 52fc2bb..aaee871 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -20228,12 +20228,8 @@ void cpu_state_reset(CPUMIPSState *env)
     env->CP0_PageGrain_rw_bitmask = env->cpu_model->CP0_PageGrain_rw_bitmask;
     env->CP0_PageGrain = env->cpu_model->CP0_PageGrain;
     env->active_fpu.fcr0 = env->cpu_model->CP1_fcr0;
+    env->active_fpu.fcr31_rw_bitmask = env->cpu_model->CP1_fcr31_rw_bitmask;
     env->active_fpu.fcr31 = env->cpu_model->CP1_fcr31;
-    if ((env->active_fpu.fcr31 >> FCR31_NAN2008) & 1) {
-        set_snan_bit_is_one(0, &env->active_fpu.fp_status);
-    } else {
-        set_snan_bit_is_one(1, &env->active_fpu.fp_status);
-    }
     env->msair = env->cpu_model->MSAIR;
     env->insn_flags = env->cpu_model->insn_flags;
 
@@ -20343,8 +20339,7 @@ void cpu_state_reset(CPUMIPSState *env)
     }
 
     compute_hflags(env);
-    restore_rounding_mode(env);
-    restore_flush_mode(env);
+    restore_fp_status(env);
     restore_pamask(env);
     cs->exception_index = EXCP_NONE;
 
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index a37d8bb..1857990 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -84,6 +84,7 @@ struct mips_def_t {
     int32_t CP0_TCStatus_rw_bitmask;
     int32_t CP0_SRSCtl;
     int32_t CP1_fcr0;
+    int32_t CP1_fcr31_rw_bitmask;
     int32_t CP1_fcr31;
     int32_t MSAIR;
     int32_t SEGBITS;
@@ -273,6 +274,10 @@ static const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x3678FF1F,
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x93 << FCR0_PRID),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 32,
         .PABITS = 32,
         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16,
@@ -303,6 +308,10 @@ static const mips_def_t mips_defs[] =
                     (0xff << CP0TCSt_TASID),
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
         .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
         .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
@@ -343,6 +352,10 @@ static const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x3778FF1F,
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x93 << FCR0_PRID),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 32,
         .PABITS = 32,
         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_DSPR2,
@@ -427,6 +440,9 @@ static const mips_def_t mips_defs[] =
                     (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x03 << FCR0_PRID),
         .CP1_fcr31 = (1 << FCR31_ABS2008) | (1 << FCR31_NAN2008),
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 32,
         .PABITS = 40,
         .insn_flags = CPU_MIPS32R5 | ASE_MSA,
@@ -465,6 +481,9 @@ static const mips_def_t mips_defs[] =
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_REV),
         .CP1_fcr31 = (1 << FCR31_ABS2008) | (1 << FCR31_NAN2008),
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 32,
         .PABITS = 32,
         .insn_flags = CPU_MIPS32R6 | ASE_MICROMIPS,
@@ -485,6 +504,10 @@ static const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x3678FFFF,
         /* The R4000 has a full 64bit FPU but doesn't use the fcr0 bits. */
         .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                (1 << FCR31_FCC_COND) | FCR31_FS_MASK,
         .SEGBITS = 40,
         .PABITS = 36,
         .insn_flags = CPU_MIPS3,
@@ -503,6 +526,10 @@ static const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x3678FFFF,
         /* The VR5432 has a full 64bit FPU but doesn't use the fcr0 bits. */
         .CP1_fcr0 = (0x54 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 40,
         .PABITS = 32,
         .insn_flags = CPU_VR54XX,
@@ -548,6 +575,10 @@ static const mips_def_t mips_defs[] =
         /* The 5Kf has F64 / L / W but doesn't use the fcr0 bits. */
         .CP1_fcr0 = (1 << FCR0_D) | (1 << FCR0_S) |
                     (0x81 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 42,
         .PABITS = 36,
         .insn_flags = CPU_MIPS64,
@@ -575,6 +606,10 @@ static const mips_def_t mips_defs[] =
         .CP1_fcr0 = (1 << FCR0_3D) | (1 << FCR0_PS) |
                     (1 << FCR0_D) | (1 << FCR0_S) |
                     (0x82 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 40,
         .PABITS = 36,
         .insn_flags = CPU_MIPS64 | ASE_MIPS3D,
@@ -601,6 +636,10 @@ static const mips_def_t mips_defs[] =
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) |
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 42,
         .PABITS = 36,
         .insn_flags = CPU_MIPS64R2 | ASE_MIPS3D,
@@ -686,6 +725,9 @@ static const mips_def_t mips_defs[] =
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_REV),
         .CP1_fcr31 = (1 << FCR31_ABS2008) | (1 << FCR31_NAN2008),
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 48,
         .PABITS = 48,
         .insn_flags = CPU_MIPS64R6 | ASE_MSA,
@@ -704,6 +746,10 @@ static const mips_def_t mips_defs[] =
         .CCRes = 2,
         .CP0_Status_rw_bitmask = 0x35D0FFFF,
         .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 40,
         .PABITS = 40,
         .insn_flags = CPU_LOONGSON2E,
@@ -722,6 +768,10 @@ static const mips_def_t mips_defs[] =
         .CCRes = 2,
         .CP0_Status_rw_bitmask = 0xF5D0FF1F,   /* Bits 7:5 not writable.  */
         .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 40,
         .PABITS = 40,
         .insn_flags = CPU_LOONGSON2F,
@@ -749,6 +799,10 @@ static const mips_def_t mips_defs[] =
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) |
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = FCR31_ROUNDING_MODE_MASK | FCR31_FLAGS_MASK |
+                                FCR31_ENABLE_MASK | FCR31_CAUSE_MASK |
+                                FCR31_FCC_MASK | FCR31_FS_MASK,
         .SEGBITS = 42,
         .PABITS = 36,
         .insn_flags = CPU_MIPS64R2 | ASE_DSP | ASE_DSPR2,
-- 
1.9.1

