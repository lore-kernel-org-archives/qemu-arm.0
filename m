Received: by 10.28.91.67 with SMTP id p64csp477363wmb;
        Wed, 28 Feb 2018 03:07:23 -0800 (PST)
X-Google-Smtp-Source: AG47ELvD/0DKfaa5nMt+8oVzgLYUjyOPASF7G2uo318Ts1NXeAxSxkPzEsJ/HQ6I4tG+ywKQ4Fik
X-Received: by 10.129.103.7 with SMTP id b7mr6800027ywc.192.1519816043891;
        Wed, 28 Feb 2018 03:07:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519816043; cv=none;
        d=google.com; s=arc-20160816;
        b=umRuwUL793krxwyPv9T8SjXNV22gO2lMsPn4E0BrLg0Kw0vB8z/1vs0VHKFuz1yfwb
         2ErADYcRGSwL2athV8bVcVUIbkuZOya2Dbfjp0zEmRoeYI0eJLWmyIlT515NOV0f54ew
         eGn1NqDb5j2aNDdf/WPzsWx2nQ7Q5DJt04nRyxLl1fZTFgo1rKFExoOi2e5oimMTfQBm
         9neeN7wgtOe7T6NIspl6FB1GxY9M1iihB1OSct5saKYaICUV7KwdvuVQAe4VM3NrZnvG
         W/ONisDxUCxH2LzPNf/0ywfAVVKPqMUSQPA8kVD4Lr+SXNOzdLUG+rGfJpTpaG6yn2lK
         HaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=C3QSvesgvJQebeeT1pfqWhH/9puBHoDt413reGseU3Y=;
        b=uRPMHfI1cKGDr8+BCzCBDoa0ybzMdzHs6JjcaQlD4SHqEJEHjiZ+oUyF8Pm3yUBk78
         xYw0jCQEVnSs1qnLqZ5EMaPWhtqfsiR+aFwMAgDRfh2UUYlvZ+9vKOwNhS2aEpGiNJbI
         K/ZC9lEgOFvG5WNmk4XcnoIgBSc+shA7C1Q0a1SBjzS4QBvhqgllQNt4kNQeuMT/+OmZ
         waCAEA5LMOVHZYwqyqBzc3FchIw8EHsbOQ/R9K0R61eBph5+pfk9rlab+LYkr4E8biXN
         XTyl2CpY/+z+MpMmozgldC2ZG0vFjfVOTz9cBINcTvaS1BtiKV4i/GYdZkdC7/rSMsVJ
         q0kA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e129si226881ywd.614.2018.02.28.03.07.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 03:07:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqzZz-0007Tc-8u
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 06:07:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV7-0003cN-B6
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV2-0007Mi-PT
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:21 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:50408)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV2-0007ES-Av
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:16 -0500
Received: (qmail 1065 invoked by uid 484); 28 Feb 2018 11:01:59 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.051834 secs); 28 Feb 2018 11:01:59 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 28 Feb 2018 11:01:58 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 28 Feb 2018 12:01:24 +0100
Message-Id: <1519815685-29200-4-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-devel] [PATCH v3 3/4] target/arm: Add the XML dynamic
 generation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: khaled.jmal@lauterbach.com, qemu-arm@nongnu.org,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xqb2ylTg/8Ur

Generate an XML description for the cp-regs.
Register these regs with the gdb_register_coprocessor().
Add arm_gdb_get_sysreg() to use it as a callback to read those regs.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
 gdbstub.c            |  7 ++++
 include/qom/cpu.h    |  9 ++++-
 target/arm/cpu.c     |  3 ++
 target/arm/cpu.h     | 17 +++++++++
 target/arm/gdbstub.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index f1d5148..ffab30b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -665,6 +665,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
             pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
             pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_file);
             pstrcat(target_xml, sizeof(target_xml), "\"/>");
+            if (cc->gdb_has_dynamic_xml) {
+                cc->register_gdb_regs_for_features(cpu);
+            }
             for (r = cpu->gdb_regs; r; r = r->next) {
                 pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
                 pstrcat(target_xml, sizeof(target_xml), r->xml);
@@ -674,6 +677,10 @@ static const char *get_feature_xml(const char *p, const char **newp,
         }
         return target_xml;
     }
+    if (strncmp(p, "system-registers.xml", len) == 0) {
+        CPUState *cpu = first_cpu;
+        return cc->gdb_get_dynamic_xml(cpu);
+    }
     for (i = 0; ; i++) {
         name = xml_builtin[i][0];
         if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index aff88fa..04771b3 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -131,6 +131,11 @@ struct TranslationBlock;
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
  * to GDB. The caller must free the returned string with g_free.
+ * @gdb_has_dynamic_xml: Indicates if GDB supports generating a dynamic XML
+ *                   description for the sysregs of this CPU.
+ * @register_gdb_regs_for_features: Callback for letting GDB create a dynamic
+ *       XML description for the sysregs and register those sysregs afterwards.
+ * @gdb_get_dynamic_xml: Callback for letting GDB get the dynamic XML.
  * @cpu_exec_enter: Callback for cpu_exec preparation.
  * @cpu_exec_exit: Callback for cpu_exec cleanup.
  * @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec.
@@ -197,7 +202,9 @@ typedef struct CPUClass {
     const struct VMStateDescription *vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
-
+    bool gdb_has_dynamic_xml;
+    void (*register_gdb_regs_for_features)(CPUState *cpu);
+    char *(*gdb_get_dynamic_xml)(CPUState *cpu);
     void (*cpu_exec_enter)(CPUState *cpu);
     void (*cpu_exec_exit)(CPUState *cpu);
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b3ae62..04c4d04 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1781,6 +1781,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
+    cc->gdb_has_dynamic_xml = true;
+    cc->register_gdb_regs_for_features = arm_register_gdb_regs_for_features;
+    cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 92cfe4c..0e35f64 100644
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
@@ -671,6 +684,8 @@ struct ARMCPU {
     uint64_t *cpreg_vmstate_values;
     int32_t cpreg_vmstate_array_len;
 
+    DynamicGDBXMLInfo dyn_xml;
+
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
     /* GPIO outputs for generic timer */
@@ -835,6 +850,8 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 
 int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+void arm_register_gdb_regs_for_features(CPUState *cpu);
+char *arm_gdb_get_dynamic_xml(CPUState *cpu);
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 04c1208..e08ad79 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -101,3 +101,100 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     /* Unknown register.  */
     return 0;
 }
+
+static void arm_gen_one_xml_reg_tag(DynamicGDBXMLInfo *dyn_xml,
+                                    ARMCPRegInfo *ri, uint32_t ri_key,
+                                    bool is64)
+{
+    GString *s = g_string_new(dyn_xml->desc);
+
+    g_string_append_printf(s, "<reg name=\"%s\"", ri->name);
+    g_string_append_printf(s, " bitsize=\"%s\"", is64 ? "64" : "32");
+    g_string_append_printf(s, " group=\"cp_regs\"/>");
+    dyn_xml->desc = g_string_free(s, false);
+    dyn_xml->num_cpregs++;
+    dyn_xml->cpregs_keys = g_renew(uint32_t,
+                                       dyn_xml->cpregs_keys,
+                                       dyn_xml->num_cpregs);
+    dyn_xml->cpregs_keys[dyn_xml->num_cpregs - 1] = ri_key;
+}
+
+static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
+                                        gpointer cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    ARMCPRegInfo *ri = value;
+    uint32_t ri_key = *(uint32_t *)key;
+
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
+        if (env->aarch64) {
+            if (ri->state == ARM_CP_STATE_AA64) {
+                arm_gen_one_xml_reg_tag(&cpu->dyn_xml, ri, ri_key, 1);
+            }
+        } else {
+            if (ri->state == ARM_CP_STATE_AA32) {
+                if (!arm_feature(env, ARM_FEATURE_EL3) &&
+                    (ri->secure & ARM_CP_SECSTATE_S)) {
+                    return;
+                }
+                if (ri->type & ARM_CP_64BIT) {
+                    arm_gen_one_xml_reg_tag(&cpu->dyn_xml, ri, ri_key, 1);
+                } else {
+                    arm_gen_one_xml_reg_tag(&cpu->dyn_xml, ri, ri_key, 0);
+                }
+            }
+        }
+    }
+}
+
+static int arm_gen_dynamic_xml(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+
+    cpu->dyn_xml.num_cpregs = 0;
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.sys.regs\">");
+    cpu->dyn_xml.desc = g_string_free(s, false);
+    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, cs);
+    s = g_string_new(cpu->dyn_xml.desc);
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_xml.desc = g_string_free(s, false);
+    return  cpu->dyn_xml.num_cpregs;
+}
+
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
+void arm_register_gdb_regs_for_features(CPUState *cs)
+{
+    int n;
+
+    n = arm_gen_dynamic_xml(cs);
+    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, NULL,
+                             n, "system-registers.xml", 0);
+
+}
+
+char *arm_gdb_get_dynamic_xml(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    return cpu->dyn_xml.desc;
+}
-- 
2.7.4

