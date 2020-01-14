Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5634445lff;
        Tue, 14 Jan 2020 07:11:33 -0800 (PST)
X-Received: by 2002:a1c:2187:: with SMTP id h129mr28485852wmh.44.1579014603610;
        Tue, 14 Jan 2020 07:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579014603; cv=none;
        d=google.com; s=arc-20160816;
        b=hojoo0ioppDptLz+6DiDvdRsr+jqy/pf07HjE85OzEcXoaoWFESd/iYLiaRRNiAmN/
         MmpCx2UQzLNEHyn5Mba5RxlxqRqqqm/kNkFQ002zHPbGyoYAYQZQjWWf6AThFGGwfyU0
         v/xJo41/GZSbq5OUixu8Ety0Qs4xwu7tjpqMgqu8oZgm36Pk5ftbjvuhpTPVAO2T9tMc
         kxukdFG8aZEER7EPyPH3Yg37cGFjZwH8Us7MkCCRuLaM32f3fhA1l24x3sM6Lv1FZ0g0
         LEDAJq4kh9DX3vdxJrqTsdDa+83MqudoWshafMLflspUfRykDIC6hCDPgSXtt0WH7IRm
         8i7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ch6DCpi+AeeZAWG9eKFNVIGrenNGJRRQr50yqM/8GMU=;
        b=FF7lVehq19UiTKrUkL5x5KbNIS6FjjR7Xg7QPQ9MJV/NwqT/lN8OF7mOcV4pZFzEY/
         typ0jmpmBXdBI77tKmGrDk7iBQxBLUp3l45PaGuWExm9bnYdqFKreVEk/JCESujR2Z4m
         OWTHKCTjhDV2YuOTpYuiJuZBbhlcB7FUlvCbbhBWWhaX2yV5igxXtZFYSAVVp9fD+ub2
         jrmlhsd9T90cWJ7bzcJhKTm1167a81PKkxVs9fggMQI3hn4ZfLkmXQGiYbYLuOBcQVvX
         NsdR5mATMyNOvI1Pu2as/nYQgNqH3v7BZ/vips52mJ7+ELoVsPxAEgxruF5YgDxfzSaV
         /LDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwIVcRn5;
       spf=pass (google.com: domain of alex.bennee@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=alex.bennee@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <alex.bennee@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n15sor8235047wmc.21.2020.01.14.07.10.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Jan 2020 07:10:03 -0800 (PST)
Received-SPF: pass (google.com: domain of alex.bennee@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwIVcRn5;
       spf=pass (google.com: domain of alex.bennee@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=alex.bennee@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ch6DCpi+AeeZAWG9eKFNVIGrenNGJRRQr50yqM/8GMU=;
        b=CwIVcRn573eAnoApvsDSsnJt30RTfzfZnor/0Yy/FMTF6ABQbfUcv3jpt5IZz0VPRr
         GK92vPk5F1nScR+d7PG7jlykhk0bFTB024tChMknkYq7TTxt2TZ7NdMQElCVpJoz0dTG
         xYLmMqpwf4I2EnTYdWaIWUT4qp6Ho/TaGmyYnST0UE1BiTg8yR9gmt/s+ldNg97xx69s
         OBdUFnwZdLNR+gYaRo2D+apAKsmxfYL2dmZ6EDhf625OqzNBTMe3LETDUcsm541pjJ3j
         xPFb4la6XsWW7ACA4FBVI34NerECG7kYwd1CHaBIeNamX+CJFZLAreoKwpMnqImaJwc5
         a8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ch6DCpi+AeeZAWG9eKFNVIGrenNGJRRQr50yqM/8GMU=;
        b=XFUXPfGPJHKHKnioL27JH2O98bkIQY7ibMkRGSEBweS5x8C5cLvw5sDgBc/GdDUhbi
         JaG5+7XzQbCnBEWD1b2P6A0LykvHCcOxNwe5t6z9Sb1Vvqbom2T5pKSRdI4uO9WcZdgF
         jAbqqbCgFD+8rLgomUeZMaVnZ2BuQGjqKq+PAPeRUZ0s8IBiRFNv75utgzu7saCCkzM3
         a6gdFLeEXuR/4Mg+aV9/uVG0f1300r7b6eVw+Wgvcuo0kDfJ/zEYRi7QDI7gB7HyYnbe
         N0/DfY3GgVsq9H+hAVCwW66iKvBoRlfogLS6dAnsv0TVHdz6EO8GgR2KXqd0loPiurfH
         cvqg==
X-Gm-Message-State: APjAAAVwxCLXFLCm/7d6zTib3sLMu43qrgvLbt7IfY16vUpW8371ljd+
	gsYb+FtZDae5ZBjmypu5bWtVDJOXtkNUcA==
X-Google-Smtp-Source: APXvYqxP0u0rJIt74SxgwunBNt02dysrtLxSgJ2ydF/WGeILGFZVKXRpUqHv/72rjAJVKT6lJl1CNg==
X-Received: by 2002:a05:600c:298:: with SMTP id 24mr26779366wmk.141.1579014603261;
        Tue, 14 Jan 2020 07:10:03 -0800 (PST)
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y17sm19082401wma.36.2020.01.14.07.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 07:10:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B51061FF87;
	Tue, 14 Jan 2020 15:09:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v5 09/22] target/arm: prepare for multiple dynamic XMLs
Date: Tue, 14 Jan 2020 15:09:40 +0000
Message-Id: <20200114150953.27659-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200114150953.27659-1-alex.bennee@linaro.org>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mBIg3KOj12bY

We will want to generate similar dynamic XML for gdbstub support of
SVE registers (the upstream doesn't use XML). To that end lightly
rename a few things to make the distinction.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h     | 20 +++++++++++++-------
 target/arm/gdbstub.c | 30 +++++++++++++++---------------
 target/arm/helper.c  |  4 ++--
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d44d8282a2..bd15587305 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -128,14 +128,20 @@ enum {
 /**
  * DynamicGDBXMLInfo:
  * @desc: Contains the XML descriptions.
- * @num_cpregs: Number of the Coprocessor registers seen by GDB.
- * @cpregs_keys: Array that contains the corresponding Key of
- * a given cpreg with the same order of the cpreg in the XML description.
+ * @num: Number of the registers in this XML seen by GDB.
+ * @data: A union with data specific to the set of registers
+ *    @cpregs_keys: Array that contains the corresponding Key of
+ *                  a given cpreg with the same order of the cpreg
+ *                  in the XML description.
  */
 typedef struct DynamicGDBXMLInfo {
     char *desc;
-    int num_cpregs;
-    uint32_t *cpregs_keys;
+    int num;
+    union {
+        struct {
+            uint32_t *keys;
+        } cpregs;
+    } data;
 } DynamicGDBXMLInfo;
 
 /* CPU state for each instance of a generic timer (in cp15 c14) */
@@ -748,7 +754,7 @@ struct ARMCPU {
     uint64_t *cpreg_vmstate_values;
     int32_t cpreg_vmstate_array_len;
 
-    DynamicGDBXMLInfo dyn_xml;
+    DynamicGDBXMLInfo dyn_sysreg_xml;
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
@@ -960,7 +966,7 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 /* Dynamically generates for gdb stub an XML description of the sysregs from
  * the cp_regs hashtable. Returns the registered sysregs number.
  */
-int arm_gen_dynamic_xml(CPUState *cpu);
+int arm_gen_dynamic_sysreg_xml(CPUState *cpu);
 
 /* Returns the dynamically generated XML for the gdb stub.
  * Returns a pointer to the XML contents for the specified XML file or NULL
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 4557775d24..1f68ab98c3 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -106,15 +106,15 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static void arm_gen_one_xml_reg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
-                                    ARMCPRegInfo *ri, uint32_t ri_key,
-                                    int bitsize)
+static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
+                                       ARMCPRegInfo *ri, uint32_t ri_key,
+                                       int bitsize)
 {
     g_string_append_printf(s, "<reg name=\"%s\"", ri->name);
     g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
     g_string_append_printf(s, " group=\"cp_regs\"/>");
-    dyn_xml->num_cpregs++;
-    dyn_xml->cpregs_keys[dyn_xml->num_cpregs - 1] = ri_key;
+    dyn_xml->data.cpregs.keys[dyn_xml->num] = ri_key;
+    dyn_xml->num++;
 }
 
 static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
@@ -126,12 +126,12 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     GString *s = param->s;
     ARMCPU *cpu = ARM_CPU(param->cs);
     CPUARMState *env = &cpu->env;
-    DynamicGDBXMLInfo *dyn_xml = &cpu->dyn_xml;
+    DynamicGDBXMLInfo *dyn_xml = &cpu->dyn_sysreg_xml;
 
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             if (ri->state == ARM_CP_STATE_AA64) {
-                arm_gen_one_xml_reg_tag(s , dyn_xml, ri, ri_key, 64);
+                arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64);
             }
         } else {
             if (ri->state == ARM_CP_STATE_AA32) {
@@ -140,30 +140,30 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
                     return;
                 }
                 if (ri->type & ARM_CP_64BIT) {
-                    arm_gen_one_xml_reg_tag(s , dyn_xml, ri, ri_key, 64);
+                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64);
                 } else {
-                    arm_gen_one_xml_reg_tag(s , dyn_xml, ri, ri_key, 32);
+                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 32);
                 }
             }
         }
     }
 }
 
-int arm_gen_dynamic_xml(CPUState *cs)
+int arm_gen_dynamic_sysreg_xml(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
     RegisterSysregXmlParam param = {cs, s};
 
-    cpu->dyn_xml.num_cpregs = 0;
-    cpu->dyn_xml.cpregs_keys = g_new(uint32_t, g_hash_table_size(cpu->cp_regs));
+    cpu->dyn_sysreg_xml.num = 0;
+    cpu->dyn_sysreg_xml.data.cpregs.keys = g_new(uint32_t, g_hash_table_size(cpu->cp_regs));
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
     g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &param);
     g_string_append_printf(s, "</feature>");
-    cpu->dyn_xml.desc = g_string_free(s, false);
-    return cpu->dyn_xml.num_cpregs;
+    cpu->dyn_sysreg_xml.desc = g_string_free(s, false);
+    return cpu->dyn_sysreg_xml.num;
 }
 
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
@@ -171,7 +171,7 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     ARMCPU *cpu = ARM_CPU(cs);
 
     if (strcmp(xmlname, "system-registers.xml") == 0) {
-        return cpu->dyn_xml.desc;
+        return cpu->dyn_sysreg_xml.desc;
     }
     return NULL;
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f6df3735e9..f05bd2fc76 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -207,7 +207,7 @@ static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
     const ARMCPRegInfo *ri;
     uint32_t key;
 
-    key = cpu->dyn_xml.cpregs_keys[reg];
+    key = cpu->dyn_sysreg_xml.data.cpregs.keys[reg];
     ri = get_arm_cp_reginfo(cpu->cp_regs, key);
     if (ri) {
         if (cpreg_field_is_64bit(ri)) {
@@ -7141,7 +7141,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                  19, "arm-vfp.xml", 0);
     }
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
-                             arm_gen_dynamic_xml(cs),
+                             arm_gen_dynamic_sysreg_xml(cs),
                              "system-registers.xml", 0);
 }
 
-- 
2.20.1
