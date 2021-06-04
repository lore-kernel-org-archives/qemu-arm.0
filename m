Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d5sm6880344wrb.16.2021.06.04.09.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C398B1FFBE;
	Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 39/99] target/arm: move arm_cpu_list to common_cpu
Date: Fri,  4 Jun 2021 16:52:12 +0100
Message-Id: <20210604155312.15902-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R3N6vJnCFbmq

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 42 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 41 ----------------------------------------
 2 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 93aea216cc..f4a3780e9e 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/qemu-print.h"
 #include "qom/object.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
@@ -353,3 +354,44 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     }
     return env->cp15.sctlr_el[el];
 }
+
+/* Sort alphabetically by type name, except for "any". */
+static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
+{
+    ObjectClass *class_a = (ObjectClass *)a;
+    ObjectClass *class_b = (ObjectClass *)b;
+    const char *name_a, *name_b;
+
+    name_a = object_class_get_name(class_a);
+    name_b = object_class_get_name(class_b);
+    if (strcmp(name_a, "any-" TYPE_ARM_CPU) == 0) {
+        return 1;
+    } else if (strcmp(name_b, "any-" TYPE_ARM_CPU) == 0) {
+        return -1;
+    } else {
+        return strcmp(name_a, name_b);
+    }
+}
+
+static void arm_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    const char *typename;
+    char *name;
+
+    typename = object_class_get_name(oc);
+    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
+    qemu_printf("  %s\n", name);
+    g_free(name);
+}
+
+void arm_cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list(TYPE_ARM_CPU, false);
+    list = g_slist_sort(list, arm_cpu_list_compare);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, arm_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index b9ea043f20..0e3f403e56 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -552,47 +552,6 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
 
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_ARM_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_ARM_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void arm_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void arm_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    list = g_slist_sort(list, arm_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, arm_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 /* Sign/zero extend */
 uint32_t HELPER(sxtb16)(uint32_t x)
 {
-- 
2.20.1
