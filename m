Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w7-20020a056402070700b0042aa153e73esm16298783edx.12.2022.06.10.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 08:40:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C4CAA1FFB7;
	Fri, 10 Jun 2022 16:40:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	agorglouk@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] target/arm: de-duplicate our register XML definitions
Date: Fri, 10 Jun 2022 16:40:36 +0100
Message-Id: <20220610154036.1253158-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jtC1cYSTDB9c

We generate the XML for each vCPU we create which for heavily threaded
linux-user runs can add up to a lot of memory. Unfortunately we can't
only do it once as we may have vCPUs with different capabilities in
different cores but we can at least free duplicate definitions if we
find them.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1070
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/gdbstub.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 2f806512d0..85ef6dc6db 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -318,7 +318,24 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
     g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &param);
     g_string_append_printf(s, "</feature>");
-    cpu->dyn_sysreg_xml.desc = g_string_free(s, false);
+
+    /* De-duplicate system register descriptions */
+    if (cs != first_cpu) {
+        CPUState *other_cs;
+        CPU_FOREACH(other_cs) {
+            ARMCPU *other_arm = ARM_CPU(other_cs);
+            if (g_strcmp0(other_arm->dyn_sysreg_xml.desc, s->str) == 0) {
+                cpu->dyn_sysreg_xml.desc = other_arm->dyn_sysreg_xml.desc;
+                g_string_free(s, true);
+                s = NULL;
+                break;
+            }
+        }
+    }
+
+    if (s) {
+        cpu->dyn_sysreg_xml.desc = g_string_free(s, false);
+    }
     return cpu->dyn_sysreg_xml.num;
 }
 
@@ -436,7 +453,24 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
                            base_reg++);
     info->num += 2;
     g_string_append_printf(s, "</feature>");
-    cpu->dyn_svereg_xml.desc = g_string_free(s, false);
+
+    /* De-duplicate SVE register descriptions */
+    if (cs != first_cpu) {
+        CPUState *other_cs;
+        CPU_FOREACH(other_cs) {
+            ARMCPU *other_arm = ARM_CPU(other_cs);
+            if (g_strcmp0(other_arm->dyn_svereg_xml.desc, s->str) == 0) {
+                cpu->dyn_sysreg_xml.desc = other_arm->dyn_svereg_xml.desc;
+                g_string_free(s, true);
+                s = NULL;
+                break;
+            }
+        }
+    }
+
+    if (s) {
+        cpu->dyn_svereg_xml.desc = g_string_free(s, false);
+    }
 
     return cpu->dyn_svereg_xml.num;
 }
-- 
2.30.2
