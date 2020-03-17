Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b10sm5676766wrm.30.2020.03.17.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 10:58:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3949B1FFA6;
	Tue, 17 Mar 2020 17:50:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 18/28] target/arm: generate xml description of our SVE registers
Date: Tue, 17 Mar 2020 17:50:43 +0000
Message-Id: <20200317175053.5278-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317175053.5278-1-alex.bennee@linaro.org>
References: <20200317175053.5278-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q5TYO6ONTeib

We also expose a the helpers to read/write the the registers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>

Message-Id: <20200316172155.971-19-alex.bennee@linaro.org>

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fbfd73a7b5b..8b9f2961ba0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -756,6 +756,7 @@ struct ARMCPU {
     int32_t cpreg_vmstate_array_len;
 
     DynamicGDBXMLInfo dyn_sysreg_xml;
+    DynamicGDBXMLInfo dyn_svereg_xml;
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
@@ -977,10 +978,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
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
index 69c35462a63..d9ef7d2187c 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -171,12 +171,146 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
+struct TypeSize {
+    const char *gdb_type;
+    int  size;
+    const char sz, suffix;
+};
+
+static const struct TypeSize vec_lanes[] = {
+    /* quads */
+    { "uint128", 128, 'q', 'u' },
+    { "int128", 128, 'q', 's' },
+    /* 64 bit */
+    { "uint64", 64, 'd', 'u' },
+    { "int64", 64, 'd', 's' },
+    { "ieee_double", 64, 'd', 'f' },
+    /* 32 bit */
+    { "uint32", 32, 's', 'u' },
+    { "int32", 32, 's', 's' },
+    { "ieee_single", 32, 's', 'f' },
+    /* 16 bit */
+    { "uint16", 16, 'h', 'u' },
+    { "int16", 16, 'h', 's' },
+    { "ieee_half", 16, 'h', 'f' },
+    /* bytes */
+    { "uint8", 8, 'b', 'u' },
+    { "int8", 8, 'b', 's' },
+};
+
+
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+    g_autoptr(GString) ts = g_string_new("");
+    int i, bits, reg_width = (cpu->sve_max_vq * 128);
+    info->num = 0;
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
+
+    /* First define types and totals in a whole VL */
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        int count = reg_width / vec_lanes[i].size;
+        g_string_printf(ts, "vq%d%c%c", count,
+                        vec_lanes[i].sz, vec_lanes[i].suffix);
+        g_string_append_printf(s,
+                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+                               ts->str, vec_lanes[i].gdb_type, count);
+    }
+    /*
+     * Now define a union for each size group containing unsigned and
+     * signed and potentially float versions of each size from 128 to
+     * 8 bits.
+     */
+    for (bits = 128; bits >= 8; bits /= 2) {
+        int count = reg_width / bits;
+        g_string_append_printf(s, "<union id=\"vq%dn\">", count);
+        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+            if (vec_lanes[i].size == bits) {
+                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%d%c%c\"/>",
+                                       vec_lanes[i].suffix,
+                                       count,
+                                       vec_lanes[i].sz, vec_lanes[i].suffix);
+            }
+        }
+        g_string_append(s, "</union>");
+    }
+    /* And now the final union of unions */
+    g_string_append(s, "<union id=\"vq\">");
+    for (bits = 128; bits >= 8; bits /= 2) {
+        int count = reg_width / bits;
+        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+            if (vec_lanes[i].size == bits) {
+                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%dn\"/>",
+                                       vec_lanes[i].sz, count);
+                break;
+            }
+        }
+    }
+    g_string_append(s, "</union>");
+
+    /* Then define each register in parts for each vq */
+    for (i = 0; i < 32; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"z%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" group=\"vector\""
+                               " type=\"vq\"/>",
+                               i, reg_width, base_reg++);
+        info->num++;
+    }
+    /* fpscr & status registers */
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
+    g_string_append_printf(s,
+                           "<reg name=\"vg\" bitsize=\"64\""
+                           " regnum=\"%d\" group=\"vector\""
+                           " type=\"uint32\"/>",
+                           base_reg++);
+    info->num += 2;
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_svereg_xml.desc = g_string_free(s, false);
+
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
index 90135731353..7e560ea7db6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -202,6 +202,15 @@ static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -225,6 +234,102 @@ static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+#ifdef TARGET_AARCH64
+static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    switch (reg) {
+    /* The first 32 registers are the zregs */
+    case 0 ... 31:
+    {
+        int vq, len = 0;
+        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+            len += gdb_get_reg128(buf,
+                                  env->vfp.zregs[reg].d[vq * 2 + 1],
+                                  env->vfp.zregs[reg].d[vq * 2]);
+        }
+        return len;
+    }
+    case 32:
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+    case 33:
+        return gdb_get_reg32(buf, vfp_get_fpcr(env));
+    /* then 16 predicates and the ffr */
+    case 34 ... 50:
+    {
+        int preg = reg - 34;
+        int vq, len = 0;
+        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
+            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
+        }
+        return len;
+    }
+    case 51:
+    {
+        /*
+         * We report in Vector Granules (VG) which is 64bit in a Z reg
+         * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
+         */
+        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        return gdb_get_reg32(buf, vq * 2);
+    }
+    default:
+        /* gdbstub asked for something out our range */
+        qemu_log_mask(LOG_UNIMP, "%s: out of range register %d", __func__, reg);
+        break;
+    }
+
+    return 0;
+}
+
+static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* The first 32 registers are the zregs */
+    switch (reg) {
+    /* The first 32 registers are the zregs */
+    case 0 ... 31:
+    {
+        int vq, len = 0;
+        uint64_t *p = (uint64_t *) buf;
+        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+            env->vfp.zregs[reg].d[vq * 2 + 1] = *p++;
+            env->vfp.zregs[reg].d[vq * 2] = *p++;
+            len += 16;
+        }
+        return len;
+    }
+    case 32:
+        vfp_set_fpsr(env, *(uint32_t *)buf);
+        return 4;
+    case 33:
+        vfp_set_fpcr(env, *(uint32_t *)buf);
+        return 4;
+    case 34 ... 50:
+    {
+        int preg = reg - 34;
+        int vq, len = 0;
+        uint64_t *p = (uint64_t *) buf;
+        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
+            env->vfp.pregs[preg].p[vq / 4] = *p++;
+            len += 8;
+        }
+        return len;
+    }
+    case 51:
+        /* cannot set vg via gdbstub */
+        return 0;
+    default:
+        /* gdbstub asked for something out our range */
+        break;
+    }
+
+    return 0;
+}
+#endif /* TARGET_AARCH64 */
+
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
    /* Return true if the regdef would cause an assertion if you called
@@ -7959,9 +8064,22 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
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
@@ -7975,6 +8093,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
+
 }
 
 /* Sort alphabetically by type name, except for "any". */
-- 
2.20.1
