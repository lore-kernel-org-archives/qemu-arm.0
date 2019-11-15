Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m25sm9279194wmi.46.2019.11.15.09.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 09:30:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F14AD1FF9A;
	Fri, 15 Nov 2019 17:30:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	alan.hayward@arm.com,
	luis.machado@linaro.org,
	damien.hedde@greensocs.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH  10/11] target/arm: explicitly encode regnum in our XML
Date: Fri, 15 Nov 2019 17:29:59 +0000
Message-Id: <20191115173000.21891-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115173000.21891-1-alex.bennee@linaro.org>
References: <20191115173000.21891-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4I6pVvHD2UFJ

This is described as optional but I'm not convinced of the numbering
when multiple target fragments are sent.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h     |  2 +-
 target/arm/gdbstub.c | 16 ++++++++++------
 target/arm/helper.c  |  2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 97744496f2d..d5b6eeeb2f0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -964,7 +964,7 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 /* Dynamically generates for gdb stub an XML description of the sysregs from
  * the cp_regs hashtable. Returns the registered sysregs number.
  */
-int arm_gen_dynamic_sysreg_xml(CPUState *cpu);
+int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 
 /* Returns the dynamically generated XML for the gdb stub.
  * Returns a pointer to the XML contents for the specified XML file or NULL
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 1f68ab98c3b..ca2abedd8cf 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -24,6 +24,7 @@
 typedef struct RegisterSysregXmlParam {
     CPUState *cs;
     GString *s;
+    int n;
 } RegisterSysregXmlParam;
 
 /* Old gdb always expect FPA registers.  Newer (xml-aware) gdb only expect
@@ -108,10 +109,11 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
 static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
                                        ARMCPRegInfo *ri, uint32_t ri_key,
-                                       int bitsize)
+                                       int bitsize, int regnum)
 {
     g_string_append_printf(s, "<reg name=\"%s\"", ri->name);
     g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
+    g_string_append_printf(s, " regnum=\"%d\"", regnum);
     g_string_append_printf(s, " group=\"cp_regs\"/>");
     dyn_xml->data.cpregs.keys[dyn_xml->num] = ri_key;
     dyn_xml->num++;
@@ -124,6 +126,7 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     ARMCPRegInfo *ri = value;
     RegisterSysregXmlParam *param = (RegisterSysregXmlParam *)p;
     GString *s = param->s;
+    int n = param->n;
     ARMCPU *cpu = ARM_CPU(param->cs);
     CPUARMState *env = &cpu->env;
     DynamicGDBXMLInfo *dyn_xml = &cpu->dyn_sysreg_xml;
@@ -131,7 +134,7 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             if (ri->state == ARM_CP_STATE_AA64) {
-                arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64);
+                arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64, n);
             }
         } else {
             if (ri->state == ARM_CP_STATE_AA32) {
@@ -140,20 +143,21 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
                     return;
                 }
                 if (ri->type & ARM_CP_64BIT) {
-                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64);
+                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64, n);
                 } else {
-                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 32);
+                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 32, n);
                 }
             }
         }
     }
+    param->n++;
 }
 
-int arm_gen_dynamic_sysreg_xml(CPUState *cs)
+int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-    RegisterSysregXmlParam param = {cs, s};
+    RegisterSysregXmlParam param = {cs, s, base_reg};
 
     cpu->dyn_sysreg_xml.num = 0;
     cpu->dyn_sysreg_xml.data.cpregs.keys = g_new(uint32_t, g_hash_table_size(cpu->cp_regs));
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3234e6d08df..421e27e0f32 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6911,7 +6911,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                  19, "arm-vfp.xml", 0);
     }
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
-                             arm_gen_dynamic_sysreg_xml(cs),
+                             arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 }
 
-- 
2.20.1
