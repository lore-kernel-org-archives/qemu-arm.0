Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp577744ejc;
        Wed, 11 Oct 2023 22:49:32 -0700 (PDT)
X-Received: by 2002:a05:620a:94e:b0:774:20df:8b3e with SMTP id w14-20020a05620a094e00b0077420df8b3emr20629355qkw.78.1697089772016;
        Wed, 11 Oct 2023 22:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697089772; cv=none;
        d=google.com; s=arc-20160816;
        b=NXdNk74ZTYFn/Cl4g3ao+33vy5OTNseqe92sfC6u/iulQeuHqewNISSG6ZCCz1bWAL
         YJFnTgFSfzHN27BOZUJ/A3hj0NeV0hxJDc4dtUd+jXJxrhrpwPWgM3BTQfXbBGrHRK++
         +SzQlQE+kGJv+IL9gOBwTr7QQoIJY2DMZTvdWVrzurI2RbX6oRyTy+YiTegRoAde4sx4
         WVeLZOeb+ra2hQLREHuPi7jOogH78F5ue29F5ZadOgqQfw6bm/vXcVE6f9Lo/EEMU6pn
         Ab2/3sfG8rly5ifCPvnisZfAVZPRBvGrogov34MkP44B936n8FGFCMzj03PFs7RVBnzF
         VwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JskNjySUYNxPlB1QDhwe6yhjQq1hcqmJbDcYDLyl8gs=;
        fh=t7HWvzoxPcFAE84Fs1r+jS6BhLdo9YU6fOrIt8mFYOk=;
        b=ZTf5E74PxRWgtIJc3dKcqKEdeDp6zs7ZMBsQbBcpEdTwI6W5daGj6qj5+8E//H7bQG
         Ghf40WDI+Hu/mcepibd7q5uSjJWJlpVi0BQ8ac8D5Jb55AdqD68Jgp9mXicyEuwvOJuo
         lVt39QcTq2x5N7IysdSHZ7c1wT1A0rUjLDX0jOG+SGb1WGYEm4obZ1KmXad6C9xIbPz/
         NocZpoJIA2KwmWnjEyYNvNboX7fV3MDTIJEfxKw+gYBKjHdMNwkEjamES2uadcJg1u8Q
         cltzJrMSBhYkfFvkdOis2RlYQiChR0tI+t1tQQFuOF3AdwCdAYXs9yBKucUsLB2gNrOl
         uCQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="Oc/UVLsi";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u23-20020a05620a023700b0076daab52be4sor7730347qkm.6.2023.10.11.22.49.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 22:49:31 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="Oc/UVLsi";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697089771; x=1697694571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JskNjySUYNxPlB1QDhwe6yhjQq1hcqmJbDcYDLyl8gs=;
        b=Oc/UVLsiATDi4I49jBkbaAkeI6SDswl0zly+/8K7NAdfJsA51UOt0QdMCgu3smk/sg
         Z3HiLWHqKFA0oJAa4isnsfIv8/1ecfUlrgkLnnY7qGU6Z7t05sVb/bcO/2ZvDTgbSoSJ
         fVcqy5P4M2/8uO0Ge/CAbRe57MOOhllFXxwbdskXLKZgaEhGlDfgSbzgTVS++qtmrVTJ
         MX+5P14b/s6TzDuPrTYBT5N8AEEpOx3e9b3bJMaoD7v/q330U5maA8yRxnP+2wEeVmCB
         AiTkfS1adH5T1P45/k7wsqNZjBQrHMi7K/ZiI7tyScXB5Yn5/NKrIOAWSwNQjP9Oo6Gx
         NY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697089771; x=1697694571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JskNjySUYNxPlB1QDhwe6yhjQq1hcqmJbDcYDLyl8gs=;
        b=bIzUeieW9SVGEZkW1Jctz8mOlyMCvRlOkcdGcR7pUdyNk4aUj7rztOrh8hENT6PLsK
         w2oSdb9tK/lFv36lfGGJWQiuy8fhYsK4Mt35B1jzn8HgALfqzQSOkeHzw1fJp7Y/xIM7
         P2CSkqEH8FuhuMB566iDQ92Z7+Uf1XSrLdrKa4lIMJz5swvsAwfOMiJ6RBolc240lN9t
         WBTQF3LdcjHzZWN6BZIWPl94pnSxpfGLgVbsh/f/xbPKbb4jiVbYtcyykagqYbYQ4gq0
         iAWjnWqFGyjqWgkyw/g3MZ9M3acCqlShefw/Q68Y6m9Vvdqrjmeu6AbHHOEoXT0yP3Gx
         j65g==
X-Gm-Message-State: AOJu0YyMWOpzJ+tNWQ8vY2xePJ//9GI6F5DCITG06AGegegxlYKQ/6ki
	NR8uZugIXfQosjHtBo0PVP1cWjehunMYVp7Ujl0=
X-Google-Smtp-Source: AGHT+IHQBGSp3IDIgqziv6VH3Xq2H8Vvp5HHSqPcr2JIE8ScG3K+zwkskOr6Yu8w3elEMpEBwnzvZA==
X-Received: by 2002:a05:620a:4249:b0:774:2d84:f3d3 with SMTP id w9-20020a05620a424900b007742d84f3d3mr26387738qko.63.1697089771296;
        Wed, 11 Oct 2023 22:49:31 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.206.10])
        by smtp.gmail.com with UTF8SMTPSA id e22-20020a637456000000b0059b64b153fcsm858357pgn.17.2023.10.11.22.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 22:49:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v10 04/18] target/arm: Use GDBFeature for dynamic XML
Date: Thu, 12 Oct 2023 14:48:43 +0900
Message-ID: <20231012054902.38447-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012054902.38447-1-akihiko.odaki@daynix.com>
References: <20231012054902.38447-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: p+B/fR3xwmNE

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  21 +++----
 target/arm/internals.h |   2 +-
 target/arm/gdbstub.c   | 134 ++++++++++++++++++-----------------------
 target/arm/gdbstub64.c |  90 ++++++++++++---------------
 4 files changed, 109 insertions(+), 138 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a9edfb8353..3702ddaab8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,6 +25,7 @@
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/gdbstub.h"
 #include "qapi/qapi-types-common.h"
 
 /* ARM processors have a weak memory model */
@@ -136,23 +137,21 @@ enum {
  */
 
 /**
- * DynamicGDBXMLInfo:
- * @desc: Contains the XML descriptions.
- * @num: Number of the registers in this XML seen by GDB.
+ * DynamicGDBFeatureInfo:
+ * @desc: Contains the feature descriptions.
  * @data: A union with data specific to the set of registers
  *    @cpregs_keys: Array that contains the corresponding Key of
  *                  a given cpreg with the same order of the cpreg
  *                  in the XML description.
  */
-typedef struct DynamicGDBXMLInfo {
-    char *desc;
-    int num;
+typedef struct DynamicGDBFeatureInfo {
+    GDBFeature desc;
     union {
         struct {
             uint32_t *keys;
         } cpregs;
     } data;
-} DynamicGDBXMLInfo;
+} DynamicGDBFeatureInfo;
 
 /* CPU state for each instance of a generic timer (in cp15 c14) */
 typedef struct ARMGenericTimer {
@@ -880,10 +879,10 @@ struct ArchCPU {
     uint64_t *cpreg_vmstate_values;
     int32_t cpreg_vmstate_array_len;
 
-    DynamicGDBXMLInfo dyn_sysreg_xml;
-    DynamicGDBXMLInfo dyn_svereg_xml;
-    DynamicGDBXMLInfo dyn_m_systemreg_xml;
-    DynamicGDBXMLInfo dyn_m_secextreg_xml;
+    DynamicGDBFeatureInfo dyn_sysreg_feature;
+    DynamicGDBFeatureInfo dyn_svereg_feature;
+    DynamicGDBFeatureInfo dyn_m_systemreg_feature;
+    DynamicGDBFeatureInfo dyn_m_secextreg_feature;
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1dd9182a54..09350e96da 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1440,7 +1440,7 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 #ifdef TARGET_AARCH64
-int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cpu);
 int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index b7ace24bfc..fc0aa6f235 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -25,11 +25,10 @@
 #include "internals.h"
 #include "cpregs.h"
 
-typedef struct RegisterSysregXmlParam {
+typedef struct RegisterSysregFeatureParam {
     CPUState *cs;
-    GString *s;
-    int n;
-} RegisterSysregXmlParam;
+    GDBFeatureBuilder builder;
+} RegisterSysregFeatureParam;
 
 /* Old gdb always expect FPA registers.  Newer (xml-aware) gdb only expect
    whatever the target description contains.  Due to a historical mishap
@@ -215,7 +214,7 @@ static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
     const ARMCPRegInfo *ri;
     uint32_t key;
 
-    key = cpu->dyn_sysreg_xml.data.cpregs.keys[reg];
+    key = cpu->dyn_sysreg_feature.data.cpregs.keys[reg];
     ri = get_arm_cp_reginfo(cpu->cp_regs, key);
     if (ri) {
         if (cpreg_field_is_64bit(ri)) {
@@ -232,34 +231,32 @@ static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
+static void arm_gen_one_feature_sysreg(GDBFeatureBuilder *builder,
+                                       DynamicGDBFeatureInfo *dyn_feature,
                                        ARMCPRegInfo *ri, uint32_t ri_key,
-                                       int bitsize, int regnum)
+                                       int bitsize)
 {
-    g_string_append_printf(s, "<reg name=\"%s\"", ri->name);
-    g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
-    g_string_append_printf(s, " regnum=\"%d\"", regnum);
-    g_string_append_printf(s, " group=\"cp_regs\"/>");
-    dyn_xml->data.cpregs.keys[dyn_xml->num] = ri_key;
-    dyn_xml->num++;
+    int num = gdb_feature_builder_append_reg(builder, ri->name, bitsize,
+                                             "int", "cp_regs");
+
+    dyn_feature->data.cpregs.keys[num] = ri_key;
 }
 
-static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
-                                        gpointer p)
+static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
+                                            gpointer p)
 {
     uint32_t ri_key = (uintptr_t)key;
     ARMCPRegInfo *ri = value;
-    RegisterSysregXmlParam *param = (RegisterSysregXmlParam *)p;
-    GString *s = param->s;
+    RegisterSysregFeatureParam *param = p;
     ARMCPU *cpu = ARM_CPU(param->cs);
     CPUARMState *env = &cpu->env;
-    DynamicGDBXMLInfo *dyn_xml = &cpu->dyn_sysreg_xml;
+    DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
 
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             if (ri->state == ARM_CP_STATE_AA64) {
-                arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64,
-                                           param->n++);
+                arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
+                                           ri, ri_key, 64);
             }
         } else {
             if (ri->state == ARM_CP_STATE_AA32) {
@@ -268,32 +265,31 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
                     return;
                 }
                 if (ri->type & ARM_CP_64BIT) {
-                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64,
-                                               param->n++);
+                    arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
+                                               ri, ri_key, 64);
                 } else {
-                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 32,
-                                               param->n++);
+                    arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
+                                               ri, ri_key, 32);
                 }
             }
         }
     }
 }
 
-static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    RegisterSysregXmlParam param = {cs, s, base_reg};
-
-    cpu->dyn_sysreg_xml.num = 0;
-    cpu->dyn_sysreg_xml.data.cpregs.keys = g_new(uint32_t, g_hash_table_size(cpu->cp_regs));
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
-    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &param);
-    g_string_append_printf(s, "</feature>");
-    cpu->dyn_sysreg_xml.desc = g_string_free(s, false);
-    return cpu->dyn_sysreg_xml.num;
+    RegisterSysregFeatureParam param = {cs};
+    gsize num_regs = g_hash_table_size(cpu->cp_regs);
+
+    gdb_feature_builder_init(&param.builder,
+                             &cpu->dyn_sysreg_feature.desc,
+                             "org.qemu.gdb.arm.sys.regs",
+                             "system-registers.xml");
+    cpu->dyn_sysreg_feature.data.cpregs.keys = g_new(uint32_t, num_regs);
+    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_feature, &param);
+    gdb_feature_builder_end(&param.builder);
+    return &cpu->dyn_sysreg_feature.desc;
 }
 
 #ifdef CONFIG_TCG
@@ -385,31 +381,26 @@ static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0; /* TODO */
 }
 
-static int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int orig_base_reg)
+static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
+    gdb_feature_builder_init(&builder, &cpu->dyn_m_systemreg_feature.desc,
+                             "org.gnu.gdb.arm.m-system", "arm-m-system.xml");
 
     for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
         if (arm_feature(env, m_sysreg_def[i].feature)) {
-            g_string_append_printf(s,
-                "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-                m_sysreg_def[i].name, base_reg++);
+            gdb_feature_builder_append_reg(&builder, m_sysreg_def[i].name, 32,
+                                           "int", NULL);
         }
     }
 
-    g_string_append_printf(s, "</feature>");
-    cpu->dyn_m_systemreg_xml.desc = g_string_free(s, false);
-    cpu->dyn_m_systemreg_xml.num = base_reg - orig_base_reg;
+    gdb_feature_builder_end(&builder);
 
-    return cpu->dyn_m_systemreg_xml.num;
+    return &cpu->dyn_m_systemreg_feature.desc;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -427,31 +418,26 @@ static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0; /* TODO */
 }
 
-static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_reg)
+static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
+    char *name;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
+    gdb_feature_builder_init(&builder, &cpu->dyn_m_secextreg_feature.desc,
+                             "org.gnu.gdb.arm.secext", "arm-m-secext.xml");
 
     for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
-        g_string_append_printf(s,
-            "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
-        g_string_append_printf(s,
-            "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
+        name = g_strconcat(m_sysreg_def[i].name, "_ns", NULL);
+        gdb_feature_builder_append_reg(&builder, name, 32, "int", NULL);
+        name = g_strconcat(m_sysreg_def[i].name, "_s", NULL);
+        gdb_feature_builder_append_reg(&builder, name, 32, "int", NULL);
     }
 
-    g_string_append_printf(s, "</feature>");
-    cpu->dyn_m_secextreg_xml.desc = g_string_free(s, false);
-    cpu->dyn_m_secextreg_xml.num = base_reg - orig_base_reg;
+    gdb_feature_builder_end(&builder);
 
-    return cpu->dyn_m_secextreg_xml.num;
+    return &cpu->dyn_m_secextreg_feature.desc;
 }
 #endif
 #endif /* CONFIG_TCG */
@@ -461,14 +447,14 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     ARMCPU *cpu = ARM_CPU(cs);
 
     if (strcmp(xmlname, "system-registers.xml") == 0) {
-        return cpu->dyn_sysreg_xml.desc;
+        return cpu->dyn_sysreg_feature.desc.xml;
     } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
-        return cpu->dyn_svereg_xml.desc;
+        return cpu->dyn_svereg_feature.desc.xml;
     } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
-        return cpu->dyn_m_systemreg_xml.desc;
+        return cpu->dyn_m_systemreg_feature.desc.xml;
 #ifndef CONFIG_USER_ONLY
     } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
-        return cpu->dyn_m_secextreg_xml.desc;
+        return cpu->dyn_m_secextreg_feature.desc.xml;
 #endif
     }
     return NULL;
@@ -486,7 +472,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          */
 #ifdef TARGET_AARCH64
         if (isar_feature_aa64_sve(&cpu->isar)) {
-            int nreg = arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs);
+            int nreg = arm_gen_dynamic_svereg_feature(cs)->num_regs;
             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
                                      aarch64_gdb_set_sve_reg, nreg,
                                      "sve-registers.xml", 0);
@@ -532,20 +518,20 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                  1, "arm-m-profile-mve.xml", 0);
     }
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
-                             arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
+                             arm_gen_dynamic_sysreg_feature(cs)->num_regs,
                              "system-registers.xml", 0);
 
 #ifdef CONFIG_TCG
     if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
-            arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
+            arm_gen_dynamic_m_systemreg_feature(cs)->num_regs,
             "arm-m-system.xml", 0);
 #ifndef CONFIG_USER_ONLY
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             gdb_register_coprocessor(cs,
                 arm_gdb_get_m_secextreg, arm_gdb_set_m_secextreg,
-                arm_gen_dynamic_m_secextreg_xml(cs, cs->gdb_num_regs),
+                arm_gen_dynamic_m_secextreg_feature(cs)->num_regs,
                 "arm-m-secext.xml", 0);
         }
 #endif
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index d7b79a6589..632ac2a520 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -247,7 +247,7 @@ int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static void output_vector_union_type(GString *s, int reg_width,
+static void output_vector_union_type(GDBFeatureBuilder *builder, int reg_width,
                                      const char *name)
 {
     struct TypeSize {
@@ -282,10 +282,10 @@ static void output_vector_union_type(GString *s, int reg_width,
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        g_string_append_printf(s,
-                               "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
-                               name, vec_lanes[i].sz, vec_lanes[i].suffix,
-                               vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
+        gdb_feature_builder_append_tag(
+            builder, "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
+            name, vec_lanes[i].sz, vec_lanes[i].suffix,
+            vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
     }
 
     /*
@@ -296,86 +296,72 @@ static void output_vector_union_type(GString *s, int reg_width,
     for (i = 0; i < ARRAY_SIZE(suf); i++) {
         int bits = 8 << i;
 
-        g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
+        gdb_feature_builder_append_tag(builder, "<union id=\"%sn%c\">",
+                                       name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"%s%c%c\"/>",
-                                       vec_lanes[j].suffix, name,
-                                       vec_lanes[j].sz, vec_lanes[j].suffix);
+                gdb_feature_builder_append_tag(
+                    builder, "<field name=\"%c\" type=\"%s%c%c\"/>",
+                    vec_lanes[j].suffix, name,
+                    vec_lanes[j].sz, vec_lanes[j].suffix);
             }
         }
-        g_string_append(s, "</union>");
+        gdb_feature_builder_append_tag(builder, "</union>");
     }
 
     /* And now the final union of unions */
-    g_string_append_printf(s, "<union id=\"%s\">", name);
+    gdb_feature_builder_append_tag(builder, "<union id=\"%s\">", name);
     for (i = ARRAY_SIZE(suf) - 1; i >= 0; i--) {
-        g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
-                               suf[i], name, suf[i]);
+        gdb_feature_builder_append_tag(builder,
+                                       "<field name=\"%c\" type=\"%sn%c\"/>",
+                                       suf[i], name, suf[i]);
     }
-    g_string_append(s, "</union>");
+    gdb_feature_builder_append_tag(builder, "</union>");
 }
 
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
     int pred_width = cpu->sve_max_vq * 16;
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
+    char *name;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_svereg_feature.desc,
+                             "org.gnu.gdb.aarch64.sve", "sve-registers.xml");
 
     /* Create the vector union type. */
-    output_vector_union_type(s, reg_width, "svev");
+    output_vector_union_type(&builder, reg_width, "svev");
 
     /* Create the predicate vector type. */
-    g_string_append_printf(s,
-                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           pred_width / 8);
+    gdb_feature_builder_append_tag(
+        &builder, "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
+        pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"z%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svev\"/>",
-                               i, reg_width, base_reg++);
+        name = g_strdup_printf("z%d", i);
+        gdb_feature_builder_append_reg(&builder, name, reg_width, "svev", NULL);
     }
 
     /* fpscr & status registers */
-    g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
-    g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
+    gdb_feature_builder_append_reg(&builder, "fpsr", 32, "int", "float");
+    gdb_feature_builder_append_reg(&builder, "fpcr", 32, "int", "float");
 
     /* Define the predicate registers. */
     for (i = 0; i < 16; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"p%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svep\"/>",
-                               i, pred_width, base_reg++);
+        name = g_strdup_printf("p%d", i);
+        gdb_feature_builder_append_reg(&builder, name, pred_width,
+                                       "svep", NULL);
     }
-    g_string_append_printf(s,
-                           "<reg name=\"ffr\" bitsize=\"%d\""
-                           " regnum=\"%d\" group=\"vector\""
-                           " type=\"svep\"/>",
-                           pred_width, base_reg++);
+    gdb_feature_builder_append_reg(&builder, "ffr", pred_width,
+                                   "svep", "vector");
 
     /* Define the vector length pseudo-register. */
-    g_string_append_printf(s,
-                           "<reg name=\"vg\" bitsize=\"64\""
-                           " regnum=\"%d\" type=\"int\"/>",
-                           base_reg++);
+    gdb_feature_builder_append_reg(&builder, "vg", 64, "int", NULL);
 
-    g_string_append_printf(s, "</feature>");
+    gdb_feature_builder_end(&builder);
 
-    info->desc = g_string_free(s, false);
-    info->num = base_reg - orig_base_reg;
-    return info->num;
+    return &cpu->dyn_svereg_feature.desc;
 }
-- 
2.42.0
