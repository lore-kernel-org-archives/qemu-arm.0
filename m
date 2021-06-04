Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l3sm6080884wmh.2.2021.06.04.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3A81520005;
	Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 85/99] target/arm: cpu-pauth: new module for ARMv8.3 Pointer Authentication
Date: Fri,  4 Jun 2021 16:52:58 +0100
Message-Id: <20210604155312.15902-86-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +OQ3pzw302DU

From: Claudio Fontana <cfontana@suse.de>

Pointer Authentication is an AARCH64-only ARMv8.3 optional
extension, whose cpu properties can be separated out in its own module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h           |  3 --
 target/arm/tcg/cpu-pauth.h | 34 ++++++++++++++++++++
 target/arm/cpu.c           |  1 +
 target/arm/cpu64.c         | 35 ++-------------------
 target/arm/tcg/cpu-pauth.c | 63 ++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build |  1 +
 6 files changed, 101 insertions(+), 36 deletions(-)
 create mode 100644 target/arm/tcg/cpu-pauth.h
 create mode 100644 target/arm/tcg/cpu-pauth.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e9bfb6f575..02e0fe5dbd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -216,13 +216,10 @@ typedef struct ARMPredicateReg {
     uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
 } ARMPredicateReg;
 
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 /* In AArch32 mode, PAC keys do not exist at all.  */
 typedef struct ARMPACKey {
     uint64_t lo, hi;
 } ARMPACKey;
-#else
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
 
 #endif /* TARGET_AARCH64 */
 
diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
new file mode 100644
index 0000000000..af127876fe
--- /dev/null
+++ b/target/arm/tcg/cpu-pauth.h
@@ -0,0 +1,34 @@
+/*
+ * QEMU AArch64 Pointer Authentication Extensions
+ *
+ * Copyright (c) 2013 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#ifndef CPU_PAUTH_H
+#define CPU_PAUTH_H
+
+/* ARMv8.3 pauth is an AARCH64 option, only include this for TARGET_AARCH64 */
+
+#include "cpu.h"
+
+/* called by arm_cpu_finalize_features in realizefn */
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+
+/* add the CPU Pointer Authentication properties */
+void cpu_pauth_add_props(Object *obj);
+
+#endif /* CPU_PAUTH_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0e41854b92..5359331bff 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -33,6 +33,7 @@
 #ifdef CONFIG_TCG
 #include "tcg/tcg-cpu.h"
 #endif /* CONFIG_TCG */
+#include "tcg/cpu-pauth.h"
 #include "cpu32.h"
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 67b35feb17..fefb6954fc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "cpu32.h"
 #include "cpu-sve.h"
+#include "tcg/cpu-pauth.h"
 #include "qemu/module.h"
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
@@ -246,36 +247,6 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
-{
-    int arch_val = 0, impdef_val = 0;
-    uint64_t t;
-
-    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
-    if (cpu->prop_pauth) {
-        if (cpu->prop_pauth_impdef) {
-            impdef_val = 1;
-        } else {
-            arch_val = 1;
-        }
-    } else if (cpu->prop_pauth_impdef) {
-        error_setg(errp, "cannot enable pauth-impdef without pauth");
-        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
-    }
-
-    t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
-    cpu->isar.id_aa64isar1 = t;
-}
-
-static Property arm_cpu_pauth_property =
-    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
-static Property arm_cpu_pauth_impdef_property =
-    DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
-
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -447,9 +418,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-        /* Default to PAUTH on, with the architected algorithm. */
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+        cpu_pauth_add_props(obj);
     }
 
     cpu_sve_add_props(obj);
diff --git a/target/arm/tcg/cpu-pauth.c b/target/arm/tcg/cpu-pauth.c
new file mode 100644
index 0000000000..f821087b14
--- /dev/null
+++ b/target/arm/tcg/cpu-pauth.c
@@ -0,0 +1,63 @@
+/*
+ * QEMU AArch64 Pointer Authentication Extensions
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "sysemu/tcg.h"
+#include "tcg/cpu-pauth.h"
+#include "hw/qdev-properties.h"
+
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+{
+    int arch_val = 0, impdef_val = 0;
+    uint64_t t;
+
+    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
+    if (cpu->prop_pauth) {
+        if (cpu->prop_pauth_impdef) {
+            impdef_val = 1;
+        } else {
+            arch_val = 1;
+        }
+    } else if (cpu->prop_pauth_impdef) {
+        error_setg(errp, "cannot enable pauth-impdef without pauth");
+        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
+    }
+
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
+    cpu->isar.id_aa64isar1 = t;
+}
+
+static Property arm_cpu_pauth_property =
+    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
+static Property arm_cpu_pauth_impdef_property =
+    DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
+
+void cpu_pauth_add_props(Object *obj)
+{
+    /* Default to PAUTH on, with the architected algorithm. */
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index c289771e97..646bb5eb25 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -39,6 +39,7 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
 ))
 
 arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
+  'cpu-pauth.c',
   'translate-a64.c',
   'translate-sve.c',
   'helper-a64.c',
-- 
2.20.1
