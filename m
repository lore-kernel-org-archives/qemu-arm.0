Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n4sm11300720wmb.22.2019.05.10.12.10.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 12:10:57 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 35D331FF87;
	Fri, 10 May 2019 20:10:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: semihosting docs, formatting and return clean-ups
Date: Fri, 10 May 2019 20:10:50 +0100
Message-Id: <20190510191051.5973-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mQDU8cM4EWqP

This is a clean-up of the semihosting calls after reading ver 2.0 of
the specification. There are a number of small fixes that seemed too
insignificant to split into smaller patches:

  - add reference to the ARM semihosting spec
  - add some additional commentary on return values
  - fixup block comments as per standard
  - audit return values, return 0xdeadbeef for corrupted values
  - fix up leaks from early returns with lock_user_string
  - return bytes not written/read instead of -1
  - add LOG_UNIMP for missing functionality

This is very much a Friday patch. It might be worth splitting up if
coming back for a more concerted clean-up series for semihosting as
the asynchronous gdb calls probably need more attention.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-semi.c | 180 +++++++++++++++++++++++++-----------------
 1 file changed, 109 insertions(+), 71 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 4c326fdc2fb..8deaed2807c 100644
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
@@ -15,13 +16,19 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; if not, see
+ *  <http://www.gnu.org/licenses/>.
+ *
+ *  ARM Semihosting is documented in:
+ *     Semihosting for AArch32 and AArch64 Release 2.0
+ *     https://static.docs.arm.com/100863/0200/semihosting.pdf
  */
 
 #include "qemu/osdep.h"
 
 #include "cpu.h"
 #include "exec/semihost.h"
+#include "exec/log.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
@@ -241,13 +248,18 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
      put_user_u64(val, args + (n) * 8) :                \
      put_user_u32(val, args + (n) * 4))
 
+/*
+ * Do a semihosting call. Returns the "RETURN REGISTER" which is
+ * documented as corrupted for some calls. In this case we use the
+ * venerable 0xdeadbeef.
+ */
 target_ulong do_arm_semihosting(CPUARMState *env)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
-    char * s;
+    char *s;
     int nr;
     uint32_t ret;
     uint32_t len;
@@ -273,9 +285,9 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(2);
         s = lock_user_string(arg0);
         if (!s) {
-            /* FIXME - should this error code be -TARGET_EFAULT ? */
             return (uint32_t)-1;
         }
+        /* check for invalid open mode */
         if (arg1 >= 12) {
             unlock_user(s, arg0, 0);
             return (uint32_t)-1;
@@ -287,7 +299,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         }
         if (use_gdb_syscalls()) {
             ret = arm_gdb_syscall(cpu, arm_semi_cb, "open,%s,%x,1a4", arg0,
-                                  (int)arg2+1, gdb_open_modeflags[arg1]);
+                                  (int) arg2 + 1, gdb_open_modeflags[arg1]);
         } else {
             ret = set_swi_errno(ts, open(s, open_modeflags[arg1], 0644));
         }
@@ -301,48 +313,51 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, close(arg0));
         }
     case TARGET_SYS_WRITEC:
-        {
-          char c;
-
-          if (get_user_u8(c, args))
-              /* FIXME - should this error code be -TARGET_EFAULT ? */
-              return (uint32_t)-1;
-          /* Write to debug console.  stderr is near enough.  */
-          if (use_gdb_syscalls()) {
+    {
+        char c;
+        if (!get_user_u8(c, args)) {
+            /* Write to debug console.  stderr is near enough.  */
+            if (use_gdb_syscalls()) {
                 return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,1", args);
-          } else {
+            } else {
 #ifdef CONFIG_SOFTMMU
-              Chardev *chardev = semihosting_get_chardev();
-              if (chardev) {
-                  return qemu_chr_write_all(chardev, (uint8_t *) &c, 1);
-              } else
+                Chardev *chardev = semihosting_get_chardev();
+                if (chardev) {
+                    return qemu_chr_write_all(chardev, (uint8_t *) &c, 1);
+                }
 #endif
-              {
-                  return write(STDERR_FILENO, &c, 1);
-              }
-          }
+                return write(STDERR_FILENO, &c, 1);
+            }
+        } else {
+            /* return register is corrupted */
+            return 0xdeadbeef;
         }
+    }
     case TARGET_SYS_WRITE0:
-        if (!(s = lock_user_string(args)))
-            /* FIXME - should this error code be -TARGET_EFAULT ? */
-            return (uint32_t)-1;
-        len = strlen(s);
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,%x",
-                                   args, len);
-        } else {
+    {
+        s = lock_user_string(args);
+        if (s) {
+            len = strlen(s);
+            if (use_gdb_syscalls()) {
+                arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,%x",
+                                args, len);
+            } else {
 #ifdef CONFIG_SOFTMMU
-            Chardev *chardev = semihosting_get_chardev();
-            if (chardev) {
-                ret = qemu_chr_write_all(chardev, (uint8_t *) s, len);
-            } else
+                Chardev *chardev = semihosting_get_chardev();
+                if (chardev) {
+                    qemu_chr_write_all(chardev, (uint8_t *) s, len);
+                } else
 #endif
-            {
-                ret = write(STDERR_FILENO, s, len);
+                {
+                    /* result ignored */
+                    ret = write(STDERR_FILENO, s, len);
+                }
             }
         }
         unlock_user(s, args, 0);
-        return ret;
+        /* return register is corrupted */
+        return 0xdeadbeef;
+    }
     case TARGET_SYS_WRITE:
         GET_ARG(0);
         GET_ARG(1);
@@ -355,13 +370,15 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             s = lock_user(VERIFY_READ, arg1, len, 1);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                /* Return bytes not written on error */
+                return len;
             }
             ret = set_swi_errno(ts, write(arg0, s, len));
             unlock_user(s, arg1, 0);
-            if (ret == (uint32_t)-1)
-                return -1;
+            if (ret == (uint32_t)-1) {
+                ret = 0;
+            }
+            /* Return bytes not written */
             return len - ret;
         }
     case TARGET_SYS_READ:
@@ -376,26 +393,33 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             s = lock_user(VERIFY_WRITE, arg1, len, 0);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                /* return bytes not read */
+                return len;
             }
             do {
                 ret = set_swi_errno(ts, read(arg0, s, len));
             } while (ret == -1 && errno == EINTR);
             unlock_user(s, arg1, len);
-            if (ret == (uint32_t)-1)
-                return -1;
+            if (ret == (uint32_t)-1) {
+                ret = 0;
+            }
+            /* Return bytes not read */
             return len - ret;
         }
     case TARGET_SYS_READC:
-       /* XXX: Read from debug console. Not implemented.  */
+        qemu_log_mask(LOG_UNIMP, "%s: TARGET_SYS_READC not implemented",
+                      __func__);
         return 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", arg0);
         } else {
-            return isatty(arg0);
+            if (isatty(arg0)) {
+                return 1;
+            } else {
+                return (errno == EBADF ? -1 : 0);
+            }
         }
     case TARGET_SYS_SEEK:
         GET_ARG(0);
@@ -405,8 +429,9 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                                    arg0, arg1);
         } else {
             ret = set_swi_errno(ts, lseek(arg0, arg1, SEEK_SET));
-            if (ret == (uint32_t)-1)
-              return -1;
+            if (ret == (uint32_t)-1) {
+                return -1;
+            }
             return 0;
         }
     case TARGET_SYS_FLEN:
@@ -417,28 +442,30 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             struct stat buf;
             ret = set_swi_errno(ts, fstat(arg0, &buf));
-            if (ret == (uint32_t)-1)
+            if (ret == (uint32_t)-1) {
                 return -1;
+            }
             return buf.st_size;
         }
     case TARGET_SYS_TMPNAM:
-        /* XXX: Not implemented.  */
+        qemu_log_mask(LOG_UNIMP, "%s: TARGET_SYS_TMPNAM not implemented",
+                      __func__);
         return -1;
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
             ret = arm_gdb_syscall(cpu, arm_semi_cb, "unlink,%s",
-                                  arg0, (int)arg1+1);
+                                  arg0, (int)arg1 + 1);
         } else {
             s = lock_user_string(arg0);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                return -EIO;
             }
-            ret =  set_swi_errno(ts, remove(s));
+            ret = set_swi_errno(ts, remove(s));
             unlock_user(s, arg0, 0);
         }
+        /* 0 on success or host-specific error code */
         return ret;
     case TARGET_SYS_RENAME:
         GET_ARG(0);
@@ -447,20 +474,23 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(3);
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_cb, "rename,%s,%s",
-                                   arg0, (int)arg1+1, arg2, (int)arg3+1);
+                                   arg0, (int)arg1 + 1, arg2, (int)arg3 + 1);
         } else {
             char *s2;
             s = lock_user_string(arg0);
             s2 = lock_user_string(arg2);
-            if (!s || !s2)
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                ret = (uint32_t)-1;
-            else
+            if (s && s2) {
                 ret = set_swi_errno(ts, rename(s, s2));
-            if (s2)
+            } else {
+                ret = -EIO;
+            }
+            if (s2) {
                 unlock_user(s2, arg2, 0);
-            if (s)
+            }
+            if (s) {
                 unlock_user(s, arg0, 0);
+            }
+            /* 0 on success or host-specific error code */
             return ret;
         }
     case TARGET_SYS_CLOCK:
@@ -472,7 +502,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(1);
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_cb, "system,%s",
-                                   arg0, (int)arg1+1);
+                                   arg0, (int)arg1 + 1);
         } else {
             s = lock_user_string(arg0);
             if (!s) {
@@ -527,14 +557,16 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
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
 
@@ -588,8 +620,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
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
 
@@ -637,7 +671,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         }
     case TARGET_SYS_EXIT:
         if (is_a64(env)) {
-            /* The A64 version of this call takes a parameter block,
+            /*
+             * The A64 version of this call takes a parameter block,
              * so the application-exit type can return a subcode which
              * is the exit status code from the application.
              */
@@ -650,14 +685,17 @@ target_ulong do_arm_semihosting(CPUARMState *env)
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
