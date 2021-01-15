Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u83sm12813287wmu.12.2021.01.15.05.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 05:33:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 006961FFAC;
	Fri, 15 Jan 2021 13:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	Keith Packard <keithp@keithp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 23/30] semihosting: Change common-semi API to be architecture-independent
Date: Fri, 15 Jan 2021 13:08:21 +0000
Message-Id: <20210115130828.23968-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y66z+Av/a696

From: Keith Packard <keithp@keithp.com>

The public API is now defined in
hw/semihosting/common-semi.h. do_common_semihosting takes CPUState *
instead of CPUARMState *. All internal functions have been renamed
common_semi_ instead of arm_semi_ or arm_. Aside from the API change,
there are no functional changes in this patch.

Signed-off-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210107170717.2098982-3-keithp@keithp.com>
Message-Id: <20210108224256.2321-14-alex.bennee@linaro.org>

diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
new file mode 100644
index 0000000000..bc53e92c79
--- /dev/null
+++ b/hw/semihosting/common-semi.h
@@ -0,0 +1,36 @@
+/*
+ *  Semihosting support for systems modeled on the Arm "Angel"
+ *  semihosting syscalls design.
+ *
+ *  Copyright (c) 2005, 2007 CodeSourcery.
+ *  Copyright (c) 2019 Linaro
+ *  Written by Paul Brook.
+ *
+ *  Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *  Adapted for systems other than ARM, including RISC-V, by Keith Packard
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ *  ARM Semihosting is documented in:
+ *     Semihosting for AArch32 and AArch64 Release 2.0
+ *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *
+ */
+
+#ifndef COMMON_SEMI_H
+#define COMMON_SEMI_H
+
+target_ulong do_common_semihosting(CPUState *cs);
+
+#endif /* COMMON_SEMI_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f3bca73d98..84cc2de3b1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1068,14 +1068,6 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
 static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
-#if !defined(CONFIG_TCG)
-static inline target_ulong do_arm_semihosting(CPUARMState *env)
-{
-    g_assert_not_reached();
-}
-#else
-target_ulong do_arm_semihosting(CPUARMState *env);
-#endif
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
 
diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index 93360e28c7..2e959aba08 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
@@ -1,10 +1,14 @@
 /*
- *  Arm "Angel" semihosting syscalls
+ *  Semihosting support for systems modeled on the Arm "Angel"
+ *  semihosting syscalls design.
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
  *  Written by Paul Brook.
  *
+ *  Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *  Adapted for systems other than ARM, including RISC-V, by Keith Packard
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
@@ -373,12 +377,12 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
      * do anything with its return value, because it is not necessarily
      * the result of the syscall, but could just be the old value of X0.
      * The only thing safe to do with this is that the callers of
-     * do_arm_semihosting() will write it straight back into X0.
+     * do_common_semihosting() will write it straight back into X0.
      * (In linux-user mode, the callback will have happened before
      * gdb_do_syscallv() returns.)
      *
      * We should tidy this up so neither this function nor
-     * do_arm_semihosting() return a value, so the mistake of
+     * do_common_semihosting() return a value, so the mistake of
      * doing something with the return value is not possible to make.
      */
 
@@ -675,10 +679,10 @@ static const GuestFDFunctions guestfd_fns[] = {
  * leave the register unchanged. We use 0xdeadbeef as the return value
  * when there isn't a defined return value for the call.
  */
-target_ulong do_arm_semihosting(CPUARMState *env)
+target_ulong do_common_semihosting(CPUState *cs)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = env_cpu(env);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
     char * s;
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index bbe9fefca8..42b9c15f53 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
+#include "hw/semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -129,7 +130,7 @@ void cpu_loop(CPUARMState *env)
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_SEMIHOST:
-            env->xregs[0] = do_arm_semihosting(env);
+            env->xregs[0] = do_common_semihosting(cs);
             env->pc += 4;
             break;
         case EXCP_YIELD:
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 3d272b56ef..cadfb7fa43 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "hw/semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -421,7 +422,7 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SEMIHOST:
-            env->regs[0] = do_arm_semihosting(env);
+            env->regs[0] = do_common_semihosting(cs);
             env->regs[15] += env->thumb ? 2 : 4;
             break;
         case EXCP_INTERRUPT:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8a492465d6..c5377e7ecb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
+#include "hw/semihosting/common-semi.h"
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
@@ -9875,13 +9876,13 @@ static void handle_semihosting(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%" PRIx64 "\n",
                       env->xregs[0]);
-        env->xregs[0] = do_arm_semihosting(env);
+        env->xregs[0] = do_common_semihosting(cs);
         env->pc += 4;
     } else {
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-        env->regs[0] = do_arm_semihosting(env);
+        env->regs[0] = do_common_semihosting(cs);
         env->regs[15] += env->thumb ? 2 : 4;
     }
 }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 643dcafb83..6176003029 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -31,6 +31,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
+#include "hw/semihosting/common-semi.h"
 #endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
@@ -2306,7 +2307,11 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-        env->regs[0] = do_arm_semihosting(env);
+#ifdef CONFIG_TCG
+        env->regs[0] = do_common_semihosting(cs);
+#else
+        g_assert_not_reached();
+#endif
         env->regs[15] += env->thumb ? 2 : 4;
         return;
     case EXCP_BKPT:
-- 
2.20.1
