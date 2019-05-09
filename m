Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u20sm24373wmu.34.2019.05.09.09.59.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 09:59:14 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 75EC81FF92;
	Thu,  9 May 2019 17:59:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v1 05/23] semihosting: enable chardev backed output
Date: Thu,  9 May 2019 17:58:53 +0100
Message-Id: <20190509165912.10512-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509165912.10512-1-alex.bennee@linaro.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7fj3PkMXtMYd

For running system tests we want to be able to re-direct output to a
file like we do with serial output. This does the wiring to allow us
to treat semihosting like just another character output device.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/semihost.h |  6 ++++++
 qemu-options.hx         |  6 ++++--
 target/arm/arm-semi.c   | 21 +++++++++++++++++++--
 vl.c                    | 23 +++++++++++++++++++++++
 4 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/include/exec/semihost.h b/include/exec/semihost.h
index 5980939c7b8..f5cc9ad2759 100644
--- a/include/exec/semihost.h
+++ b/include/exec/semihost.h
@@ -51,12 +51,18 @@ static inline const char *semihosting_get_cmdline(void)
 {
     return NULL;
 }
+
+static inline Chardev *semihosting_get_chardev(void)
+{
+    return NULL;
+}
 #else
 bool semihosting_enabled(void);
 SemihostingTarget semihosting_get_target(void);
 const char *semihosting_get_arg(int i);
 int semihosting_get_argc(void);
 const char *semihosting_get_cmdline(void);
+Chardev *semihosting_get_chardev(void);
 #endif
 
 #endif
diff --git a/qemu-options.hx b/qemu-options.hx
index 51802cbb266..6aa3a08c2fb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3975,12 +3975,12 @@ STEXI
 Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
 ETEXI
 DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
-    "-semihosting-config [enable=on|off][,target=native|gdb|auto][,arg=str[,...]]\n" \
+    "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
 QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
 STEXI
-@item -semihosting-config [enable=on|off][,target=native|gdb|auto][,arg=str[,...]]
+@item -semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]
 @findex -semihosting-config
 Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II only).
 @table @option
@@ -3988,6 +3988,8 @@ Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II only).
 Defines where the semihosting calls will be addressed, to QEMU (@code{native})
 or to GDB (@code{gdb}). The default is @code{auto}, which means @code{gdb}
 during debug sessions and @code{native} otherwise.
+@item chardev=@var{str1}
+Send the output to a chardev backend output for native or auto output when not in gdb
 @item arg=@var{str1},arg=@var{str2},...
 Allows the user to pass input arguments, and can be used multiple times to build
 up a list. The old-style @code{-kernel}/@code{-append} method of passing a
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 8b5fd7bc6e3..4c326fdc2fb 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -32,6 +32,7 @@
 #include "hw/arm/arm.h"
 #include "qemu/cutils.h"
 #endif
+#include "chardev/char.h"
 
 #define TARGET_SYS_OPEN        0x01
 #define TARGET_SYS_CLOSE       0x02
@@ -310,7 +311,15 @@ target_ulong do_arm_semihosting(CPUARMState *env)
           if (use_gdb_syscalls()) {
                 return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,1", args);
           } else {
-                return write(STDERR_FILENO, &c, 1);
+#ifdef CONFIG_SOFTMMU
+              Chardev *chardev = semihosting_get_chardev();
+              if (chardev) {
+                  return qemu_chr_write_all(chardev, (uint8_t *) &c, 1);
+              } else
+#endif
+              {
+                  return write(STDERR_FILENO, &c, 1);
+              }
           }
         }
     case TARGET_SYS_WRITE0:
@@ -322,7 +331,15 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,%x",
                                    args, len);
         } else {
-            ret = write(STDERR_FILENO, s, len);
+#ifdef CONFIG_SOFTMMU
+            Chardev *chardev = semihosting_get_chardev();
+            if (chardev) {
+                ret = qemu_chr_write_all(chardev, (uint8_t *) s, len);
+            } else
+#endif
+            {
+                ret = write(STDERR_FILENO, s, len);
+            }
         }
         unlock_user(s, args, 0);
         return ret;
diff --git a/vl.c b/vl.c
index b6709514c1b..34bbb4df865 100644
--- a/vl.c
+++ b/vl.c
@@ -511,6 +511,9 @@ static QemuOptsList qemu_semihosting_config_opts = {
         }, {
             .name = "target",
             .type = QEMU_OPT_STRING,
+        }, {
+            .name = "chardev",
+            .type = QEMU_OPT_STRING,
         }, {
             .name = "arg",
             .type = QEMU_OPT_STRING,
@@ -1356,6 +1359,7 @@ static void configure_msg(QemuOpts *opts)
 typedef struct SemihostingConfig {
     bool enabled;
     SemihostingTarget target;
+    Chardev *chardev;
     const char **argv;
     int argc;
     const char *cmdline; /* concatenated argv */
@@ -1386,6 +1390,11 @@ int semihosting_get_argc(void)
     return semihosting.argc;
 }
 
+Chardev *semihosting_get_chardev(void)
+{
+    return semihosting.chardev;
+}
+
 const char *semihosting_get_cmdline(void)
 {
     if (semihosting.cmdline == NULL && semihosting.argc > 0) {
@@ -3027,6 +3036,7 @@ int main(int argc, char **argv, char **envp)
     int display_remote = 0;
     const char *log_mask = NULL;
     const char *log_file = NULL;
+    const char *semihost_chardev = NULL;
     char *trace_file = NULL;
     ram_addr_t maxram_size;
     uint64_t ram_slots = 0;
@@ -3744,6 +3754,8 @@ int main(int argc, char **argv, char **envp)
                     semihosting.enabled = qemu_opt_get_bool(opts, "enable",
                                                             true);
                     const char *target = qemu_opt_get(opts, "target");
+                    /* setup of chardev is deferred until they are initialised */
+                    semihost_chardev = qemu_opt_get(opts, "chardev");
                     if (target != NULL) {
                         if (strcmp("native", target) == 0) {
                             semihosting.target = SEMIHOSTING_TARGET_NATIVE;
@@ -4277,6 +4289,17 @@ int main(int argc, char **argv, char **envp)
     qemu_opts_foreach(qemu_find_opts("chardev"),
                       chardev_init_func, NULL, &error_fatal);
 
+    /* We had to defer this until chardevs were created */
+    if (semihost_chardev) {
+        Chardev *chr = qemu_chr_find(semihost_chardev);
+        if (chr == NULL) {
+            error_report("semihosting chardev '%s' not found",
+                         semihost_chardev);
+            exit(1);
+        }
+        semihosting.chardev = chr;
+    }
+
 #ifdef CONFIG_VIRTFS
     qemu_opts_foreach(qemu_find_opts("fsdev"),
                       fsdev_init_func, NULL, &error_fatal);
-- 
2.20.1
