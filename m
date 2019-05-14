Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d6sm16564890wrp.9.2019.05.14.08.53.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 08:53:02 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 64DB11FF91;
	Tue, 14 May 2019 16:53:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH  04/11] semihosting: enable chardev backed output for console
Date: Tue, 14 May 2019 16:52:54 +0100
Message-Id: <20190514155301.16123-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514155301.16123-1-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Z2dMhkEnyDs1

It will be useful for a number of use-cases to be able to re-direct
output to a file like we do with serial output. This does the wiring
to allow us to treat then semihosting console like just another
character output device.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/semihosting/config.c           | 26 ++++++++++++++++++++++++++
 hw/semihosting/console.c          |  9 ++++++++-
 include/hw/semihosting/semihost.h |  7 +++++++
 qemu-options.hx                   |  6 ++++--
 stubs/semihost.c                  |  4 ++++
 vl.c                              |  2 ++
 6 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/hw/semihosting/config.c b/hw/semihosting/config.c
index f1d3fe1e4c6..2a8e7e1045a 100644
--- a/hw/semihosting/config.c
+++ b/hw/semihosting/config.c
@@ -23,6 +23,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "hw/semihosting/semihost.h"
+#include "chardev/char.h"
 
 QemuOptsList qemu_semihosting_config_opts = {
     .name = "semihosting-config",
@@ -35,6 +36,9 @@ QemuOptsList qemu_semihosting_config_opts = {
         }, {
             .name = "target",
             .type = QEMU_OPT_STRING,
+        }, {
+            .name = "chardev",
+            .type = QEMU_OPT_STRING,
         }, {
             .name = "arg",
             .type = QEMU_OPT_STRING,
@@ -46,12 +50,14 @@ QemuOptsList qemu_semihosting_config_opts = {
 typedef struct SemihostingConfig {
     bool enabled;
     SemihostingTarget target;
+    Chardev *chardev;
     const char **argv;
     int argc;
     const char *cmdline; /* concatenated argv */
 } SemihostingConfig;
 
 static SemihostingConfig semihosting;
+static const char *semihost_chardev;
 
 bool semihosting_enabled(void)
 {
@@ -115,6 +121,11 @@ void semihosting_arg_fallback(const char *file, const char *cmd)
     }
 }
 
+Chardev *semihosting_get_chardev(void)
+{
+    return semihosting.chardev;
+}
+
 void qemu_semihosting_enable(void)
 {
     semihosting.enabled = true;
@@ -132,6 +143,8 @@ int qemu_semihosting_config_options(const char *optarg)
         semihosting.enabled = qemu_opt_get_bool(opts, "enable",
                                                 true);
         const char *target = qemu_opt_get(opts, "target");
+        /* setup of chardev is deferred until they are initialised */
+        semihost_chardev = qemu_opt_get(opts, "chardev");
         if (target != NULL) {
             if (strcmp("native", target) == 0) {
                 semihosting.target = SEMIHOSTING_TARGET_NATIVE;
@@ -158,3 +171,16 @@ int qemu_semihosting_config_options(const char *optarg)
     return 0;
 }
 
+void qemu_semihosting_connect_chardevs(void)
+{
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
+}
diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index ad6f67ecc71..2fa440eb32a 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -17,13 +17,20 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "hw/semihosting/semihost.h"
 #include "hw/semihosting/console.h"
 #include "exec/gdbstub.h"
 #include "qemu/log.h"
+#include "chardev/char.h"
 
 int qemu_semihosting_log_out(const char *s, int len)
 {
-    return write(STDERR_FILENO, s, len);
+    Chardev *chardev = semihosting_get_chardev();
+    if (chardev) {
+        return qemu_chr_write_all(chardev, (uint8_t *) s, len);
+    } else {
+        return write(STDERR_FILENO, s, len);
+    }
 }
 
 /*
diff --git a/include/hw/semihosting/semihost.h b/include/hw/semihosting/semihost.h
index 07ea40a322f..60fc42d851e 100644
--- a/include/hw/semihosting/semihost.h
+++ b/include/hw/semihosting/semihost.h
@@ -51,6 +51,11 @@ static inline const char *semihosting_get_cmdline(void)
 {
     return NULL;
 }
+
+static inline Chardev *semihosting_get_chardev(void)
+{
+    return NULL;
+}
 #else /* !CONFIG_USER_ONLY */
 bool semihosting_enabled(void);
 SemihostingTarget semihosting_get_target(void);
@@ -58,9 +63,11 @@ const char *semihosting_get_arg(int i);
 int semihosting_get_argc(void);
 const char *semihosting_get_cmdline(void);
 void semihosting_arg_fallback(const char *file, const char *cmd);
+Chardev *semihosting_get_chardev(void);
 /* for vl.c hooks */
 void qemu_semihosting_enable(void);
 int qemu_semihosting_config_options(const char *opt);
+void qemu_semihosting_connect_chardevs(void);
 #endif /* CONFIG_USER_ONLY */
 
 #endif /* SEMIHOST_H */
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
diff --git a/stubs/semihost.c b/stubs/semihost.c
index 1a4e88e5326..4d5b3c06530 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -64,3 +64,7 @@ const char *semihosting_get_cmdline(void)
 void semihosting_arg_fallback(const char *file, const char *cmd)
 {
 }
+
+void qemu_semihosting_connect_chardevs(void)
+{
+}
diff --git a/vl.c b/vl.c
index fba48b565c9..49878a2a1bf 100644
--- a/vl.c
+++ b/vl.c
@@ -4156,6 +4156,8 @@ int main(int argc, char **argv, char **envp)
 
     qemu_opts_foreach(qemu_find_opts("chardev"),
                       chardev_init_func, NULL, &error_fatal);
+    /* now chardevs have been created we may have semihosting to connect */
+    qemu_semihosting_connect_chardevs();
 
 #ifdef CONFIG_VIRTFS
     qemu_opts_foreach(qemu_find_opts("fsdev"),
-- 
2.20.1
