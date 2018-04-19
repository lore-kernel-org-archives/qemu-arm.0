Received: by 10.28.4.212 with SMTP id 203csp813169wme;
        Thu, 19 Apr 2018 08:56:40 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48R1KapFkoHxCLqGHsBBFIS0LHqJHMob9yz7AAxIgeYhNE9ZNVsZnwEZXAoqBhfVTygsfXi
X-Received: by 2002:adf:99b5:: with SMTP id y50-v6mr4938526wrb.168.1524153400761;
        Thu, 19 Apr 2018 08:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524153400; cv=none;
        d=google.com; s=arc-20160816;
        b=F4bI9j9hoa3LFI3GoSo85Q2/vOFUemx649vZmKR/PEz8+XnO9vTa1vAXTnw8jFhUoJ
         2SWJDXIF5lmetg4x86IjGYO43Lg/5R8x2lvJeK7Mcee3w20vpmgWzJzFoHe4TEhPlhVY
         +bTCszrJHRR8r4xCa5ivmdX0F5VTx77hgT6B/iIsZ5eQtFVEhOJSq/0OsZKULAs5Wwrg
         qj6UVOf6XYYe3vtv5UMaju2MOaBtPqro3MXU/EO53IIqcIncXnV8kHKr22zYbGKhXzJK
         2SXp+Ris6cdsuaFCsD32JHqbd7mb7iRtJbKp5N/i+2YopFbOYZY0JgB4KgBJwYRz5nf8
         zDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=/2tNAGJyO9JD7JdKc7WVhpKyoW73EGp+1ocAN6FNf9M=;
        b=h6lL8t826QozIBktp9KaLWehtw1qC/zlxb3Ne8ps6hLbUR1F5YSyjMOOJ7GEXZOcPz
         OlzHAXYUoAj+ALKW/JUFl5VPyNGqF9tWxiVHof9H9NVVR0v5kj0ZgA5N2oizXPwE68fQ
         WXzB8jhHVbHxCjht0SUTBQrslS0oa1xB/cz3O47LHKKkQqPbOZLfKqHwDW64n9bgwrOJ
         +682wzUVoWTaOh78zbESTVUhwZlBFepw/2b4fEepl72iOHyVMCCeJ5k16d7GvrGUcdGC
         33EGDsDZjzYBYbBp/uSzAC/zR9D5hoWRjRAFj0wcubucaYixpVxnN6+w9x4t+2vKacNK
         QOcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Return-Path: <abdallah.bouassida@lauterbach.com>
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com. [62.154.241.196])
        by mx.google.com with ESMTPS id b47-v6si3194341wrd.20.2018.04.19.08.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Apr 2018 08:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) client-ip=62.154.241.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Received: (qmail 22774 invoked by uid 484); 19 Apr 2018 15:56:40 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com (envelope-from <abdallah.bouassida@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(41.224.44.126):. 
 Processed in 0.052078 secs); 19 Apr 2018 15:56:40 -0000
Received: from unknown (HELO abo-VirtualBox.8.8.4.4) (Authenticated_SSL:abouassida@[41.224.44.126])
          (envelope-sender <abdallah.bouassida@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA encrypted SMTP
          for <qemu-devel@nongnu.org>; 19 Apr 2018 15:56:39 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org,
	khaled.jmal@lauterbach.com,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Subject: [PATCH v6 3/3] target/arm: Add the XML dynamic generation
Date: Thu, 19 Apr 2018 16:56:26 +0100
Message-Id: <1524153386-3550-4-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-TUID: xltwQ5k094kA

Generate an XML description for the cp-regs.
Register these regs with the gdb_register_coprocessor().
Add arm_gdb_get_sysreg() to use it as a callback to read those regs.
Add a dummy arm_gdb_set_sysreg().

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
 gdbstub.c            | 10 +++++++
 include/qom/cpu.h    |  5 +++-
 target/arm/cpu.c     |  1 +
 target/arm/cpu.h     | 26 ++++++++++++++++++
 target/arm/gdbstub.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c  | 26 ++++++++++++++++++
 6 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index a76b2fa..4b56a43 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -674,6 +674,16 @@ static const char *get_feature_xml(const char *p, const char **newp,
         }
         return target_xml;
     }
+    if (cc->gdb_get_dynamic_xml) {
+        CPUState *cpu = first_cpu;
+        char *xmlname = g_strndup(p, len);
+        const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
+
+        g_free(xmlname);
+        if (xml) {
+            return xml;
+        }
+    }
     for (i = 0; ; i++) {
         name = xml_builtin[i][0];
         if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 14e45c4..9d3afc6 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -132,6 +132,9 @@ struct TranslationBlock;
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
  * to GDB. The caller must free the returned string with g_free.
+ * @gdb_get_dynamic_xml: Callback to return dynamically generated XML for the
+ *   gdb stub. Returns a pointer to the XML contents for the specified XML file
+ *   or NULL if the CPU doesn't have a dynamically generated content for it.
  * @cpu_exec_enter: Callback for cpu_exec preparation.
  * @cpu_exec_exit: Callback for cpu_exec cleanup.
  * @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec.
@@ -198,7 +201,7 @@ typedef struct CPUClass {
     const struct VMStateDescription *vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
-
+    const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
     void (*cpu_exec_enter)(CPUState *cpu);
     void (*cpu_exec_exit)(CPUState *cpu);
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 022d8c5..38b8b1c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1879,6 +1879,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
+    cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 436f675..9544043 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -133,6 +133,19 @@ enum {
    s<2n+1> maps to the most significant half of d<n>
  */
 
+/**
+ * DynamicGDBXMLInfo:
+ * @desc: Contains the XML descriptions.
+ * @num_cpregs: Number of the Coprocessor registers seen by GDB.
+ * @cpregs_keys: Array that contains the corresponding Key of
+ * a given cpreg with the same order of the cpreg in the XML description.
+ */
+typedef struct DynamicGDBXMLInfo {
+    char *desc;
+    int num_cpregs;
+    uint32_t *cpregs_keys;
+} DynamicGDBXMLInfo;
+
 /* CPU state for each instance of a generic timer (in cp15 c14) */
 typedef struct ARMGenericTimer {
     uint64_t cval; /* Timer CompareValue register */
@@ -682,6 +695,8 @@ struct ARMCPU {
     uint64_t *cpreg_vmstate_values;
     int32_t cpreg_vmstate_array_len;
 
+    DynamicGDBXMLInfo dyn_xml;
+
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
     /* GPIO outputs for generic timer */
@@ -863,6 +878,17 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
+/* Dynamically generates for gdb stub an XML description of the sysregs from
+ * the cp_regs hashtable. Returns the registered sysregs number.
+ */
+int arm_gen_dynamic_xml(CPUState *cpu);
+
+/* Returns the dynamically generated XML for the gdb stub.
+ * Returns a pointer to the XML contents for the specified XML file or NULL
+ * if the XML name doesn't match the predefined one.
+ */
+const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
+
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque);
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 04c1208..e80cfb4 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -22,6 +22,11 @@
 #include "cpu.h"
 #include "exec/gdbstub.h"
 
+typedef struct RegisterSysregXmlParam {
+    CPUState *cs;
+    GString *s;
+} RegisterSysregXmlParam;
+
 /* Old gdb always expect FPA registers.  Newer (xml-aware) gdb only expect
    whatever the target description contains.  Due to a historical mishap
    the FPA registers appear in between core integer regs and the CPSR.
@@ -101,3 +106,74 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     /* Unknown register.  */
     return 0;
 }
+
+static void arm_gen_one_xml_reg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
+                                    ARMCPRegInfo *ri, uint32_t ri_key,
+                                    int bitsize)
+{
+    g_string_append_printf(s, "<reg name=\"%s\"", ri->name);
+    g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
+    g_string_append_printf(s, " group=\"cp_regs\"/>");
+    dyn_xml->num_cpregs++;
+    dyn_xml->cpregs_keys[dyn_xml->num_cpregs - 1] = ri_key;
+}
+
+static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
+                                        gpointer p)
+{
+    uint32_t ri_key = *(uint32_t *)key;
+    ARMCPRegInfo *ri = value;
+    RegisterSysregXmlParam *param = (RegisterSysregXmlParam *)p;
+    GString *s = param->s;
+    ARMCPU *cpu = ARM_CPU(param->cs);
+    CPUARMState *env = &cpu->env;
+    DynamicGDBXMLInfo *dyn_xml = &cpu->dyn_xml;
+
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
+        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+            if (ri->state == ARM_CP_STATE_AA64) {
+                arm_gen_one_xml_reg_tag(s , dyn_xml, ri, ri_key, 64);
+            }
+        } else {
+            if (ri->state == ARM_CP_STATE_AA32) {
+                if (!arm_feature(env, ARM_FEATURE_EL3) &&
+                    (ri->secure & ARM_CP_SECSTATE_S)) {
+                    return;
+                }
+                if (ri->type & ARM_CP_64BIT) {
+                    arm_gen_one_xml_reg_tag(s , dyn_xml, ri, ri_key, 64);
+                } else {
+                    arm_gen_one_xml_reg_tag(s , dyn_xml, ri, ri_key, 32);
+                }
+            }
+        }
+    }
+}
+
+int arm_gen_dynamic_xml(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    RegisterSysregXmlParam param = {cs, s};
+
+    cpu->dyn_xml.num_cpregs = 0;
+    cpu->dyn_xml.cpregs_keys = g_malloc(sizeof(uint32_t *) *
+                                        g_hash_table_size(cpu->cp_regs));
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
+    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &param);
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_xml.desc = g_string_free(s, false);
+    return cpu->dyn_xml.num_cpregs;
+}
+
+const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    if (strcmp(xmlname, "system-registers.xml") == 0) {
+        return cpu->dyn_xml.desc;
+    }
+    return NULL;
+}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 858bda2..db77662 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -220,6 +220,29 @@ static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static int arm_gdb_get_sysreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    const ARMCPRegInfo *ri;
+    uint32_t key;
+
+    key = cpu->dyn_xml.cpregs_keys[reg];
+    ri = get_arm_cp_reginfo(cpu->cp_regs, key);
+    if (ri) {
+        if (cpreg_field_is_64bit(ri)) {
+            return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env, ri));
+        } else {
+            return gdb_get_reg32(buf, (uint32_t)read_raw_cp_reg(env, ri));
+        }
+    }
+    return 0;
+}
+
+static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    return 0;
+}
+
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
    /* Return true if the regdef would cause an assertion if you called
@@ -5474,6 +5497,9 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
         gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
                                  19, "arm-vfp.xml", 0);
     }
+    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
+                             arm_gen_dynamic_xml(cs),
+                             "system-registers.xml", 0);
 }
 
 /* Sort alphabetically by type name, except for "any". */
-- 
2.7.4
