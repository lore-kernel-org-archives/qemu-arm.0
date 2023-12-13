Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431284ejo;
        Tue, 12 Dec 2023 22:42:41 -0800 (PST)
X-Received: by 2002:a17:90a:8382:b0:288:9282:7c17 with SMTP id i2-20020a17090a838200b0028892827c17mr6263032pjn.80.1702449761356;
        Tue, 12 Dec 2023 22:42:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449761; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3U1STVEArTnwyFctV5iHzatTUDNvO+nE1U3h2UmKQEdCQDJ7Ec32o9WyriBcZ12/g
         SbJEwUDTLkQvz1w0PG+YWXFzW0G6LVdhVXQOWRocv6+rfOAZ4dDVLaKDbnbT9alSYWa/
         u0qN+mxyqYwUpRn+Fle+GEbObi4YeUSp0DyySD2D2ZnHy4p/9xbLxlIEAFq2YfQt4pp7
         K5SGMV8ytJAIKOIwvLDD4yaqK2sP90NXhipYI9D2cpZJP0kGZWy6snD9YJLZHrHBNdLl
         D9T4lc+DCAVJI5+0/7r/FzKil9A99mWnomUMJgVqgcD7ue8D27eTMZc2XpUsCRHMiJQv
         clxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=azmvjxFiKvZRoPzansPVL8P7aGEZqCbZBMo2xc/DiGY=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=Up3qeUaUzlJ7VD6mjQfnQx4goA0na0O3BX4RvxTkFvULYAw4Qls8fAXjX8awf8CiD0
         WPaA6VlgLrqX+9RueIB1t/xUa034Z9GqL0yOhOYO6EbVFc1xCHRmcTKylNggXeZ4WA9I
         3dwp/sd+BIS/faZPFhJg70i4rJr+1L6RBeOhKWqVQL+g+y5++ijG9pMWmfW8PEhoaSod
         ijucfqj6pWXz8jFhDoTi0il7ZjC+CLDNPbnMoYFNI/FQ9OLbuoSTK46yObUsQhVcoNIN
         9C+aAe0qc3GAY94C4rco3cKQ5t/XA/EsGfAr5oQCqwiNPKmJZajuKMNgQ775NlVlEBdF
         SVDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=O01VyfYp;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 9-20020a17090a098900b00281040b5a82sor267651pjo.7.2023.12.12.22.42.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:42:41 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=O01VyfYp;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449761; x=1703054561; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azmvjxFiKvZRoPzansPVL8P7aGEZqCbZBMo2xc/DiGY=;
        b=O01VyfYpgZGA5L3+oCicp8tu0AgWYbatQXXRJBz31Y2Cbljhz7lUC2DH2rtN5fqaN/
         Ay6HWW1xJwVzKQG+0xSDsiE4k8vUEZ08DGhUu6LM+yuanwZk7RQyoyy2smZSDUH8sidV
         yYiQVvGZq4nHIWOQ0zSEJB0rSBzS5nNBFGR/HGv/9B3cpW+TF1J6wZIzgrE6JwOmkqq9
         fiQPAB3SygDSIs17YDmzRyNgOSOg0bIKRxTXD/lB6yTZ5EtMdmlgjvwA+R9U5E0hUoNU
         R9OylfFF4X5RppxiW8h++a9tMjj8vZPU4Yjvw/4qQbMySmlMSbfXw7xLVFzCOUAOy9k5
         Skeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449761; x=1703054561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azmvjxFiKvZRoPzansPVL8P7aGEZqCbZBMo2xc/DiGY=;
        b=m4hpysDx7pc/HHOdAsVfK/Gl2yBEZ0kbZGRhfNzbhLpKHGyhcCfsj0ZWdr6xrPX6z0
         WQO1L0SyeAgQmgTNqvD8Xw9V0bTjhqO+BjQ1txk3LBeGHy1s/S/AB4WJ0PCINqU/Y7Z7
         ygh9YneXcr05WmBkSUDvkduPqo317YDSYV6D19v/JFwTyspzW1eEGXg2nWqkkJiO3L7p
         BRDOwxt+AaAPAWieCZpJJ/EZtLdvWFb+7CX3nxQqsd4x8Lz0+kd3VlqxsqTzMLSWDHj3
         rfzeACvbclzsI18Olcuhib4CzOOB9X/rDLqhFfuK3Qu6kKns8tq5PcY1lq006THKjK9y
         ko4Q==
X-Gm-Message-State: AOJu0YwmPcB0T8kM5z8geMICN9iK0t9YyV5R10HqdTigAhTIksGST4yD
	S/T77g5STmkaD9PioU1ZBgqnpA==
X-Google-Smtp-Source: AGHT+IHu1Hq1gotx+tca1bHviBJl7AVqESFWXjLq8eXC0XHRJ7KvQLVmwZpb0oj/IGYaHx9Xw5zWpw==
X-Received: by 2002:a17:90a:e014:b0:286:6cc1:7816 with SMTP id u20-20020a17090ae01400b002866cc17816mr5725423pjy.89.1702449760851;
        Tue, 12 Dec 2023 22:42:40 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id ch23-20020a17090af41700b0028ae287e869sm657632pjb.26.2023.12.12.22.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:42:40 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:08 +0900
Subject: [PATCH v17 09/14] hw/core/cpu: Remove gdb_get_dynamic_xml member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231213-gdb-v17-9-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: /oUJK3qbmoFY

This function is no longer used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h |  4 ----
 target/arm/cpu.h      |  6 ------
 target/ppc/cpu.h      |  1 -
 target/arm/cpu.c      |  1 -
 target/arm/gdbstub.c  | 18 ------------------
 target/ppc/cpu_init.c |  3 ---
 target/ppc/gdbstub.c  | 10 ----------
 target/riscv/cpu.c    | 14 --------------
 8 files changed, 57 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index a6214610603f..17f99adc0f41 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -134,9 +134,6 @@ struct SysemuCPUOps;
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
  * to GDB. The caller must free the returned string with g_free.
- * @gdb_get_dynamic_xml: Callback to return dynamically generated XML for the
- *   gdb stub. Returns a pointer to the XML contents for the specified XML file
- *   or NULL if the CPU doesn't have a dynamically generated content for it.
  * @disas_set_info: Setup architecture specific components of disassembly info
  * @adjust_watchpoint_address: Perform a target-specific adjustment to an
  * address before attempting to match it against watchpoints.
@@ -167,7 +164,6 @@ struct CPUClass {
 
     const char *gdb_core_xml_file;
     const gchar * (*gdb_arch_name)(CPUState *cpu);
-    const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b2f8ac81f06c..c8e77440f0f7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1182,12 +1182,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-/* Returns the dynamically generated XML for the gdb stub.
- * Returns a pointer to the XML contents for the specified XML file or NULL
- * if the XML name doesn't match the predefined one.
- */
-const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
-
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, DumpState *s);
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f87c26f98a67..9f94282e13e9 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1524,7 +1524,6 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, DumpState *s);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index efcc22b1446c..304538cca52a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2499,7 +2499,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_arch_name = arm_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
 
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 059d84f98e52..a3bb73cfa7ce 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -474,24 +474,6 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
 #endif
 #endif /* CONFIG_TCG */
 
-const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-
-    if (strcmp(xmlname, "system-registers.xml") == 0) {
-        return cpu->dyn_sysreg_feature.desc.xml;
-    } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
-        return cpu->dyn_svereg_feature.desc.xml;
-    } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
-        return cpu->dyn_m_systemreg_feature.desc.xml;
-#ifndef CONFIG_USER_ONLY
-    } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
-        return cpu->dyn_m_secextreg_feature.desc.xml;
-#endif
-    }
-    return NULL;
-}
-
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index a0178c3ce80a..909d753b0221 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7380,9 +7380,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif
 
     cc->gdb_num_core_regs = 71;
-#ifndef CONFIG_USER_ONLY
-    cc->gdb_get_dynamic_xml = ppc_gdb_get_dynamic_xml;
-#endif
 #ifdef USE_APPLE_GDB
     cc->gdb_read_register = ppc_cpu_gdb_read_register_apple;
     cc->gdb_write_register = ppc_cpu_gdb_write_register_apple;
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 8ca37b6bf952..f47878a67bd1 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -342,16 +342,6 @@ static void gdb_gen_spr_feature(CPUState *cs)
 
     gdb_feature_builder_end(&builder);
 }
-
-const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
-
-    if (strcmp(xml_name, "power-spr.xml") == 0) {
-        return pcc->gdb_spr.xml;
-    }
-    return NULL;
-}
 #endif
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a3a98230ca87..1e3ac556b33e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1529,19 +1529,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *cs)
     }
 }
 
-static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
-    if (strcmp(xmlname, "riscv-csr.xml") == 0) {
-        return cpu->dyn_csr_feature.xml;
-    } else if (strcmp(xmlname, "riscv-vector.xml") == 0) {
-        return cpu->dyn_vreg_feature.xml;
-    }
-
-    return NULL;
-}
-
 #ifndef CONFIG_USER_ONLY
 static int64_t riscv_get_arch_id(CPUState *cs)
 {
@@ -1695,7 +1682,6 @@ static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
     cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
                               cpu_set_mvendorid, NULL, NULL);

-- 
2.43.0
