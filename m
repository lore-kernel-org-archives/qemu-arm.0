Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a26sm2586691wmm.14.2019.11.15.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 09:30:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 16CA01FF9B;
	Fri, 15 Nov 2019 17:30:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	alan.hayward@arm.com,
	luis.machado@linaro.org,
	damien.hedde@greensocs.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH  11/11] target/arm: generate xml description of our SVE registers
Date: Fri, 15 Nov 2019 17:30:00 +0000
Message-Id: <20191115173000.21891-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115173000.21891-1-alex.bennee@linaro.org>
References: <20191115173000.21891-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZKqgBjb5vg0W

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h     | 10 ++++-
 target/arm/gdbstub.c | 99 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c  | 69 ++++++++++++++++++++++++++++--
 3 files changed, 173 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d5b6eeeb2f0..5470548a057 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -141,6 +141,9 @@ typedef struct DynamicGDBXMLInfo {
         struct {
             uint32_t *keys;
         } cpregs;
+        struct {
+            int fpsr_pos;
+        } sve;
     } data;
 } DynamicGDBXMLInfo;
 
@@ -758,6 +761,7 @@ struct ARMCPU {
     int32_t cpreg_vmstate_array_len;
 
     DynamicGDBXMLInfo dyn_sysreg_xml;
+    DynamicGDBXMLInfo dyn_svereg_xml;
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
@@ -961,10 +965,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-/* Dynamically generates for gdb stub an XML description of the sysregs from
- * the cp_regs hashtable. Returns the registered sysregs number.
+/*
+ * Helpers to dynamically generates XML descriptions of the sysregs
+ * and SVE registers. Returns the number of registers in each set.
  */
 int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
+int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 
 /* Returns the dynamically generated XML for the gdb stub.
  * Returns a pointer to the XML contents for the specified XML file or NULL
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index ca2abedd8cf..62b17fccbe7 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -170,12 +170,111 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
+struct TypeSize {
+    const char *gdb_type;
+    int  size;
+    const char *suffix;
+};
+
+static struct TypeSize vec_lanes[] = {
+    { "uint128", 128, "qu"},
+    { "int128", 128, "qs" },
+    { "uint64", 64, "lu"},
+    { "int64", 64, "ls" },
+    { "uint32", 32, "u"},
+    { "int32", 32, "s" },
+    { "uint16", 16, "hu"},
+    { "int16", 16, "hs" },
+    { "uint8", 8, "ub"},
+    { "int8", 8, "sb" },
+    { "ieee_double", 64, "df" },
+    { "ieee_single", 32, "sf" },
+    { "ieee_half", 16, "hf" },
+};
+
+
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+    g_autoptr(GString) ts = g_string_new("");
+    g_autoptr(GString) us = g_string_new("");
+    int i, j;
+    info->num = 0;
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
+    /* first define types and the union they belong to */
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        int count = 128 / vec_lanes[i].size;
+        g_string_printf(ts, "vq%d%s", count, vec_lanes[i].suffix);
+        g_string_append_printf(s, "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+                               ts->str, vec_lanes[i].gdb_type, count);
+        g_string_append_printf(us, "<field name=\"%s\" type=\"%s\"/>",
+                               vec_lanes[i].suffix, ts->str);
+    }
+    /* wrap the union around define the overall vq type */
+    us = g_string_prepend(us, "<union id=\"vq\">");
+    us = g_string_append(us,"</union>");
+    g_string_append(s, us->str);
+
+    /* Then define each register in parts for each vq */
+    for (i = 0; i < 32; i++) {
+        for (j = 0; j < cpu->sve_max_vq; j++) {
+            g_string_append_printf(s,
+                                   "<reg name=\"z%dp%d\" bitsize=\"128\""
+                                   " regnum=\"%d\" group=\"vector\""
+                                   " type=\"vq\"/>",
+                                   i, j, base_reg++);
+            info->num++;
+        }
+    }
+    /* fpscr & status registers */
+    info->data.sve.fpsr_pos = info->num;
+    g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
+                           " regnum=\"%d\" group=\"float\""
+                           " type=\"int\"/>", base_reg++);
+    g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
+                           " regnum=\"%d\" group=\"float\""
+                           " type=\"int\"/>", base_reg++);
+    info->num += 2;
+    /*
+     * Predicate registers aren't so big they are worth splitting up
+     * but we do need to define a type to hold the array of quad
+     * references.
+     */
+    g_string_append_printf(s,
+                           "<vector id=\"vqp\" type=\"uint16\" count=\"%d\"/>",
+                           cpu->sve_max_vq);
+    for (i = 0; i < 16; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"p%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" group=\"vector\""
+                               " type=\"vqp\"/>",
+                               i, cpu->sve_max_vq * 16, base_reg++);
+        info->num++;
+    }
+    g_string_append_printf(s,
+                           "<reg name=\"ffr\" bitsize=\"%d\""
+                           " regnum=\"%d\" group=\"vector\""
+                           " type=\"vqp\"/>",
+                           cpu->sve_max_vq * 16, base_reg++);
+    info->num++;
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_svereg_xml.desc = g_string_free(s, false);
+    return cpu->dyn_svereg_xml.num;
+}
+
+
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
     ARMCPU *cpu = ARM_CPU(cs);
 
     if (strcmp(xmlname, "system-registers.xml") == 0) {
         return cpu->dyn_sysreg_xml.desc;
+    } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
+        return cpu->dyn_svereg_xml.desc;
     }
     return NULL;
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 421e27e0f32..b517b88ba3c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -201,6 +201,15 @@ static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+/**
+ * arm_get/set_gdb_*: get/set a gdb register
+ * @env: the CPU state
+ * @buf: a buffer to copy to/from
+ * @reg: register number (offset from start of group)
+ *
+ * We return the number of bytes copied
+ */
+
 static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -224,6 +233,46 @@ static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+#ifdef TARGET_AARCH64
+static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+
+    /* The first 32 * vq registers are the zNpQ regs */
+    if (reg < (32 * cpu->sve_max_vq)) {
+        int vq = reg % cpu->sve_max_vq;
+        int z = reg / cpu->sve_max_vq;
+        return gdb_get_reg128(buf,
+                              env->vfp.zregs[z].d[vq * 2 + 1],
+                              env->vfp.zregs[z].d[vq * 2]);
+    }
+    switch (reg - info->data.sve.fpsr_pos) {
+    case 0:
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+    case 1:
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+    case 2 ... 19:
+    {
+        /* XXX FIXME: not quite right, we could be bigger */
+        int preg = reg - info->data.sve.fpsr_pos - 2;
+        return gdb_get_reg64(buf, env->vfp.pregs[preg].p[0]);
+    }
+    default:
+        /* gdbstub asked for something out our range */
+        break;
+    }
+
+    return 0;
+}
+
+static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    fprintf(stderr, "%s: %d\n", __func__, reg);
+    return 0;
+}
+#endif /* TARGET_AARCH64 */
+
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
    /* Return true if the regdef would cause an assertion if you called
@@ -6897,9 +6946,22 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
     CPUARMState *env = &cpu->env;
 
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-        gdb_register_coprocessor(cs, aarch64_fpu_gdb_get_reg,
-                                 aarch64_fpu_gdb_set_reg,
-                                 34, "aarch64-fpu.xml", 0);
+        /*
+         * The lower part of each SVE register aliases to the FPU
+         * registers so we don't need to include both.
+         */
+#ifdef TARGET_AARCH64
+        if (isar_feature_aa64_sve(&cpu->isar)) {
+            gdb_register_coprocessor(cs, arm_gdb_get_svereg, arm_gdb_set_svereg,
+                                     arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs),
+                                     "sve-registers.xml", 0);
+        } else
+#endif
+        {
+            gdb_register_coprocessor(cs, aarch64_fpu_gdb_get_reg,
+                                     aarch64_fpu_gdb_set_reg,
+                                     34, "aarch64-fpu.xml", 0);
+        }
     } else if (arm_feature(env, ARM_FEATURE_NEON)) {
         gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
                                  51, "arm-neon.xml", 0);
@@ -6913,6 +6975,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
+
 }
 
 /* Sort alphabetically by type name, except for "any". */
-- 
2.20.1
