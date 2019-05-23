Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n5sm7077195wrj.27.2019.05.23.03.25.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:25:35 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E42081FF92;
	Thu, 23 May 2019 11:25:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v2 05/28] target/arm: fixup some of the commentary for arm-semi
Date: Thu, 23 May 2019 11:25:09 +0100
Message-Id: <20190523102532.10486-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /5P2f+wsgjRR

This cleans up a number of the block comments to fit the proper style.
While we are at it we also reference the official specification and
document what the return register value can be.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/arm-semi.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 3273306c8ea..9e5a414dd89 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -2,6 +2,7 @@
  *  Arm "Angel" semihosting syscalls
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
+ *  Copyright (c) 2019 Linaro
  *  Written by Paul Brook.
  *
  *  This program is free software; you can redistribute it and/or modify
@@ -16,6 +17,10 @@
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ *  ARM Semihosting is documented in:
+ *     Semihosting for AArch32 and AArch64 Release 2.0
+ *     https://static.docs.arm.com/100863/0200/semihosting.pdf
  */
 
 #include "qemu/osdep.h"
@@ -240,6 +245,15 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
      put_user_u64(val, args + (n) * 8) :                \
      put_user_u32(val, args + (n) * 4))
 
+/*
+ * Do a semihosting call.
+ *
+ * The specification always says that the "return register" either
+ * returns a specific value or is corrupted, so we don't need to
+ * report to our caller whether we are returning a value or trying to
+ * leave the register unchanged. We use 0xdeadbeef as the return value
+ * when there isn't a defined return value for the call.
+ */
 target_ulong do_arm_semihosting(CPUARMState *env)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -510,14 +524,16 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
             output_size = ts->info->arg_end - ts->info->arg_start;
             if (!output_size) {
-                /* We special-case the "empty command line" case (argc==0).
-                   Just provide the terminating 0. */
+                /*
+                 * We special-case the "empty command line" case (argc==0).
+                 * Just provide the terminating 0.
+                 */
                 output_size = 1;
             }
 #endif
 
             if (output_size > input_size) {
-                 /* Not enough space to store command-line arguments.  */
+                /* Not enough space to store command-line arguments.  */
                 return -1;
             }
 
@@ -571,8 +587,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             GET_ARG(0);
 
 #ifdef CONFIG_USER_ONLY
-            /* Some C libraries assume the heap immediately follows .bss, so
-               allocate it using sbrk.  */
+            /*
+             * Some C libraries assume the heap immediately follows .bss, so
+             * allocate it using sbrk.
+             */
             if (!ts->heap_limit) {
                 abi_ulong ret;
 
@@ -620,7 +638,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         }
     case TARGET_SYS_EXIT:
         if (is_a64(env)) {
-            /* The A64 version of this call takes a parameter block,
+            /*
+             * The A64 version of this call takes a parameter block,
              * so the application-exit type can return a subcode which
              * is the exit status code from the application.
              */
@@ -633,14 +652,17 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                 ret = 1;
             }
         } else {
-            /* ARM specifies only Stopped_ApplicationExit as normal
-             * exit, everything else is considered an error */
+            /*
+             * ARM specifies only Stopped_ApplicationExit as normal
+             * exit, everything else is considered an error
+             */
             ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
         }
         gdb_exit(env, ret);
         exit(ret);
     case TARGET_SYS_SYNCCACHE:
-        /* Clean the D-cache and invalidate the I-cache for the specified
+        /*
+         * Clean the D-cache and invalidate the I-cache for the specified
          * virtual address range. This is a nop for us since we don't
          * implement caches. This is only present on A64.
          */
-- 
2.20.1
