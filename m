Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c835dfsm980078a12.20.2024.06.28.05.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:43:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B909E5FA3E;
	Fri, 28 Jun 2024 13:43:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 18/23] target/arm: Factor out code for setting MTE TCF0 field
Date: Fri, 28 Jun 2024 13:42:53 +0100
Message-Id: <20240628124258.832466-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628124258.832466-1-alex.bennee@linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mcIP0rvhXImD

From: Gustavo Romero <gustavo.romero@linaro.org>

Factor out the code used for setting the MTE TCF0 field from the prctl
code into a convenient function. Other subsystems, like gdbstub, need to
set this field as well, so keep it as a separate function to avoid
duplication and ensure consistency in how this field is set across the
board.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Message-Id: <20240628050850.536447-7-gustavo.romero@linaro.org>
[AJB: clean-up includes, move MTE defines]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vAJB:
  - clean-up includes, move MTE defines
---
 linux-user/aarch64/mte_user_helper.h | 32 +++++++++++++++++++++++++
 linux-user/aarch64/target_prctl.h    | 22 ++---------------
 linux-user/aarch64/mte_user_helper.c | 35 ++++++++++++++++++++++++++++
 linux-user/syscall.c                 |  9 -------
 linux-user/aarch64/meson.build       |  2 ++
 5 files changed, 71 insertions(+), 29 deletions(-)
 create mode 100644 linux-user/aarch64/mte_user_helper.h
 create mode 100644 linux-user/aarch64/mte_user_helper.c

diff --git a/linux-user/aarch64/mte_user_helper.h b/linux-user/aarch64/mte_user_helper.h
new file mode 100644
index 0000000000..8685e5175a
--- /dev/null
+++ b/linux-user/aarch64/mte_user_helper.h
@@ -0,0 +1,32 @@
+/*
+ * ARM MemTag convenience functions.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef AARCH64_MTE_USER_HELPER_H
+#define AARCH64_MTE USER_HELPER_H
+
+#ifndef PR_MTE_TCF_SHIFT
+# define PR_MTE_TCF_SHIFT       1
+# define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_SYNC        (1UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_ASYNC       (2UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_MASK        (3UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TAG_SHIFT       3
+# define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
+#endif
+
+/**
+ * arm_set_mte_tcf0 - Set TCF0 field in SCTLR_EL1 register
+ * @env: The CPU environment
+ * @value: The value to be set for the Tag Check Fault in EL0 field.
+ *
+ * Only SYNC and ASYNC modes can be selected. If ASYMM mode is given, the SYNC
+ * mode is selected instead. So, there is no way to set the ASYMM mode.
+ */
+void arm_set_mte_tcf0(CPUArchState *env, abi_long value);
+
+#endif /* AARCH64_MTE_USER_HELPER_H */
diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index aa8e203c15..ed75b9e4b5 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -7,6 +7,7 @@
 #define AARCH64_TARGET_PRCTL_H
 
 #include "target/arm/cpu-features.h"
+#include "mte_user_helper.h"
 
 static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
@@ -173,26 +174,7 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
     env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
 
     if (cpu_isar_feature(aa64_mte, cpu)) {
-        /*
-         * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
-         *
-         * The kernel has a per-cpu configuration for the sysadmin,
-         * /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred,
-         * which qemu does not implement.
-         *
-         * Because there is no performance difference between the modes, and
-         * because SYNC is most useful for debugging MTE errors, choose SYNC
-         * as the preferred mode.  With this preference, and the way the API
-         * uses only two bits, there is no way for the program to select
-         * ASYMM mode.
-         */
-        unsigned tcf = 0;
-        if (arg2 & PR_MTE_TCF_SYNC) {
-            tcf = 1;
-        } else if (arg2 & PR_MTE_TCF_ASYNC) {
-            tcf = 2;
-        }
-        env->cp15.sctlr_el[1] = deposit64(env->cp15.sctlr_el[1], 38, 2, tcf);
+        arm_set_mte_tcf0(env, arg2);
 
         /*
          * Write PR_MTE_TAG to GCR_EL1[Exclude].
diff --git a/linux-user/aarch64/mte_user_helper.c b/linux-user/aarch64/mte_user_helper.c
new file mode 100644
index 0000000000..a5b1c8503b
--- /dev/null
+++ b/linux-user/aarch64/mte_user_helper.c
@@ -0,0 +1,35 @@
+/*
+ * ARM MemTag convenience functions.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "mte_user_helper.h"
+
+void arm_set_mte_tcf0(CPUArchState *env, abi_long value)
+{
+    /*
+     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
+     *
+     * The kernel has a per-cpu configuration for the sysadmin,
+     * /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred,
+     * which qemu does not implement.
+     *
+     * Because there is no performance difference between the modes, and
+     * because SYNC is most useful for debugging MTE errors, choose SYNC
+     * as the preferred mode.  With this preference, and the way the API
+     * uses only two bits, there is no way for the program to select
+     * ASYMM mode.
+     */
+    unsigned tcf = 0;
+    if (value & PR_MTE_TCF_SYNC) {
+        tcf = 1;
+    } else if (value & PR_MTE_TCF_ASYNC) {
+        tcf = 2;
+    }
+    env->cp15.sctlr_el[1] = deposit64(env->cp15.sctlr_el[1], 38, 2, tcf);
+}
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e2804312fc..b8c278b91d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6281,15 +6281,6 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 # define PR_GET_TAGGED_ADDR_CTRL 56
 # define PR_TAGGED_ADDR_ENABLE  (1UL << 0)
 #endif
-#ifndef PR_MTE_TCF_SHIFT
-# define PR_MTE_TCF_SHIFT       1
-# define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
-# define PR_MTE_TCF_SYNC        (1UL << PR_MTE_TCF_SHIFT)
-# define PR_MTE_TCF_ASYNC       (2UL << PR_MTE_TCF_SHIFT)
-# define PR_MTE_TCF_MASK        (3UL << PR_MTE_TCF_SHIFT)
-# define PR_MTE_TAG_SHIFT       3
-# define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
-#endif
 #ifndef PR_SET_IO_FLUSHER
 # define PR_SET_IO_FLUSHER 57
 # define PR_GET_IO_FLUSHER 58
diff --git a/linux-user/aarch64/meson.build b/linux-user/aarch64/meson.build
index 248c578d15..f75bb3cd75 100644
--- a/linux-user/aarch64/meson.build
+++ b/linux-user/aarch64/meson.build
@@ -9,3 +9,5 @@ vdso_le_inc = gen_vdso.process('vdso-le.so',
                                extra_args: ['-r', '__kernel_rt_sigreturn'])
 
 linux_user_ss.add(when: 'TARGET_AARCH64', if_true: [vdso_be_inc, vdso_le_inc])
+
+linux_user_ss.add(when: 'TARGET_AARCH64', if_true: [files('mte_user_helper.c')])
-- 
2.39.2
