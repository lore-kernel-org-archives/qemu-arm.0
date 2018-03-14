Received: by 10.28.91.67 with SMTP id p64csp167395wmb;
        Wed, 14 Mar 2018 06:33:57 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsiVXRKSh7II4/JHfGkNgCau55L8SUWsmgwsBFAi0qKcXP1ULQQ3CaCUmkicj/gg7kz9xet
X-Received: by 10.55.249.4 with SMTP id l4mr6370600qkj.165.1521034437749;
        Wed, 14 Mar 2018 06:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521034437; cv=none;
        d=google.com; s=arc-20160816;
        b=aqCqaOVPFZNcfnWmpKd4tiZryt1RVYnhWjAO8POyplNcKZk1NGeOoInlaAkvtVEEvi
         Ev76tPId/tHyPqGdorOqEVGEHmDZ77E03rKwy1yPL2CCdZHetlXT3K0W8FjOt8OpobVB
         kVQMfuvL/WjIqMi6qpVKkLSjYI4oEy/CaHOKOGIG7fHMQimvW2sSLziamfWMkXqRmd9N
         QVSWPeQbDYWTvS4cdV5uUPzBi84Fye8F3LdOjNAlvBlId00KHW31ET/iwh9qpA4CJamu
         2MeJX47moXs8u7D9j35fbq0LcP61jS2wsfLfRS6jntO55f/L3hAReSzPjth8RusE4hDU
         X6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qeGf/TcMbSQQ9n+vKeEkPBMJ3FdO7CYcdIWXFLL/H7g=;
        b=nsIdYQjP/63SJVSkrCSxzo66rRWC1rxXhJB1Fq0sNtAyGNkWEweSv9SvR7vyw5nwNe
         Q+Td/svrvTiOtYdSy/3d5WMbpkQktnyoSYcAqe/JfTC5/7SO/Z5tkgpn7lgUUtqRqHH1
         5p8M8XCQv1ZfEJIXWFiAmMy5SnNaZAfkkZdpcUZAheWDgJbQI98eH9p68/jEYvWTcPeQ
         NR7+KArv13mgDk3jBZ8hYqV6h9gSbm9bFDXwpJhLkbGjfhJvghot882aWrIfAiuRu2z8
         3sR1nFhoKzf2KU/0hVVwxaQehA1vcwp/PdVpdst/65xvfTIRq0tHr1KtNav4yZkjps/X
         Lc9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z185si2333188qke.190.2018.03.14.06.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Mar 2018 06:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ew6XV-0007HC-60
	for alex.bennee@linaro.org; Wed, 14 Mar 2018 09:33:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6UI-0004TA-TC
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6UA-0001xZ-Dx
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:38 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:47495)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6UA-0001nM-1h
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:30 -0400
Received: (qmail 29427 invoked by uid 484); 14 Mar 2018 13:30:13 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.052265 secs); 14 Mar 2018 13:30:13 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 14 Mar 2018 13:30:12 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 14 Mar 2018 14:28:04 +0100
Message-Id: <1521034084-17344-4-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v5 3/3] target/arm: Add the XML dynamic generation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: khaled.jmal@lauterbach.com, qemu-arm@nongnu.org,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: adkXVaRU0eIw

Generate an XML description for the cp-regs.
Register these regs with the gdb_register_coprocessor().
Add arm_gdb_get_sysreg() to use it as a callback to read those regs.
Add a dummy arm_gdb_set_sysreg().

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
 gdbstub.c            | 10 ++++++++
 include/qom/cpu.h    |  5 +++-
 target/arm/cpu.c     |  1 +
 target/arm/cpu.h     | 26 +++++++++++++++++++
 target/arm/gdbstub.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c  | 27 ++++++++++++++++++++
 6 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index f1d5148..09065bc 100644
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
+        free(xmlname);
+        if (xml) {
+            return xml;
+        }
+    }
     for (i = 0; ; i++) {
         name = xml_builtin[i][0];
         if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index dc6d495..be6d84d 100644
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
+    const char *(*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
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
index 5a6ea24..5664f58 100644
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
index 04c1208..fafc08b 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -101,3 +101,74 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
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
+    void **p_array = p;
+    ARMCPU *cpu = ARM_CPU((CPUState *)(p_array[0]));
+    CPUARMState *env = &cpu->env;
+    DynamicGDBXMLInfo *dyn_xml = &cpu->dyn_xml;
+    GString *s = (GString *)(p_array[1]);
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
+    void *p_array[] = {cs, s};
+
+    cpu->dyn_xml.num_cpregs = 0;
+    cpu->dyn_xml.cpregs_keys = g_malloc(sizeof(uint32_t *) *
+                                        g_hash_table_size(cpu->cp_regs));
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
+    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, p_array);
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
index 1360a14..d3c40b7 100644
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
@@ -5459,6 +5482,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
+    int n;
 
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
         gdb_register_coprocessor(cs, aarch64_fpu_gdb_get_reg,
@@ -5474,6 +5498,9 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
         gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
                                  19, "arm-vfp.xml", 0);
     }
+    n = arm_gen_dynamic_xml(cs);
+    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
+                             n, "system-registers.xml", 0);
 }
 
 /* Sort alphabetically by type name, except for "any". */
-- 
2.7.4

