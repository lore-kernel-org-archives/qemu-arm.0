Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp1529340ejs;
        Thu, 17 Aug 2023 20:37:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d4:b0:687:f846:19dc with SMTP id t20-20020a056a0021d400b00687f84619dcmr1491635pfj.23.1692329866643;
        Thu, 17 Aug 2023 20:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692329866; cv=none;
        d=google.com; s=arc-20160816;
        b=wrgEnzo7/Yg8YrFi1JjG5W4SDiU9X/yWXpl58OmL7l8zmo61q8d+wrcUGRxwBJJs8x
         EUO21l4+adoGnu8ngjDNVys1UpO8Rg4jSZ0ti3Ko4elEEL7TzIibILK5urUzqU9w0Cl2
         9pz2oo0PV0AP0XzpXoYzg7k1R05/gpM13WEcdhfbqRmjicyX8CrYnA80nYpk7nOUKEg3
         Z7Ldkf992bD2CJjzEpsY41W1ffAvStocSG3Gi1GICjUwr/A2AVhZ6TvqgM09nQwvNxFI
         Mj/rnfqpXhOF7un2gV+T4t9S1wOOQyc18gKVRScAmE/dvk0yJ5Xzzcs3/OZgG2ZGy3UH
         5R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        fh=CVYWQcRaKPyn4/HEoRDB6RkhL3oJiAJ/ekH67KIJv5U=;
        b=X/QnilbEcddCel8u3IecS6VNCE72UzOZDQo3pvnLK8owaU9thtiDc1XN6wv+2UBgSQ
         D9G7L7YrZ1r/6e2+oIg+2YYLSQ1jqQNKqQRHNqJOdp9b+/WO2PEQ69wLD+Vvutq32pEd
         bubiIzBF6hLUGGRzato4rRXdBmE1oxKxNZ6wyCNyxBMdN+qnJdcRcBr8g+ot6msc0cCN
         iJT4DAY7qLfAWNfSPJbtNaSEhtN1FdtPMoMYmOyBgkMvnZ4PfEMmgxFQqlkAWxs3mb0Q
         Nm8/pjQPEsQnLTCDJB4fcu4MHjN1rrLqaVG/5uUQNzrWp6+hg5h7UGTT9u+EFAoYuvjp
         sh+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=MyYb+9w2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c2-20020a633502000000b00566039b125fsor493080pga.6.2023.08.17.20.37.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Aug 2023 20:37:46 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=MyYb+9w2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692329866; x=1692934666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        b=MyYb+9w2vqYkGXrX1TW8C6dTP3DYTZMcu5jADgY+oU51C/shETI2Z9Z5AoOym0BiTI
         8WsefAa0NhLsBR/oBAZiGvNmlP2JVGFfChw6MbcOzt9BMXgTtjwnH/LB37yaXlxJPhoA
         OqsQP2/qdjvDnulSYH+m9Chk9Sf1Jkk09BNH2GV7mWoZBP9/iPdyUKfRKbL4Eck+Dq/a
         BJOEyW9yCayETCnXqoq9cjcou2363tcyLQEINwOU+57i9cEWA235JT2Sxo6IG/aplTWQ
         e/IPQAy6AdbnEYH26qQ9eO1hvlFoc86sX26qm7enGtGsjciAQysUWHKpNkMmgEN3H1lO
         kViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692329866; x=1692934666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        b=Wln7xhzj8CU5Dgadi9LlgFhiK/fZLhiQBTK9WqdJMH4ne16S4kqbsUIF3kXV1Hq/hj
         YbKk6A6iDyB2IaFJ08PiIekYRm4hOv4sniVeVWGYIBdU+yzgYPo2F83aXubvuUO8Vudy
         6S/pSe2v2925D8am681ORqnyMJIS1cxxkqtB8pm0s1z0YYw72xEInGUSKv3PLTLLU4vc
         ZB4c0xEvoGmrBPrHGoLrP1aycWWBXZ+2jlScVL5WA9YMr4ar6kA5PcnGwRUQUjDjk3wG
         9aC4NSMhO4AqVAEa9muWLtKi7Wo24ls3iAhX+Y5FpES5IL/7wGUYlQc7+1ajuNT/yYNA
         uG5Q==
X-Gm-Message-State: AOJu0YxFcgMC3TGgXhlWjkR4mL4M+tS4aM+qNb7gSPJDyeOsESRKceah
	AuzjtWKUISsvRl6IQJ2Y/weaQOBTIbZfOEA2i5E=
X-Google-Smtp-Source: AGHT+IGTMkD8qtl+XZu4hkyINOKiMgn67Z+FXy5xj7jopFWQVvH0A7dqCnDBnjwKVEV7brbxWBLBGw==
X-Received: by 2002:a05:6a20:6a1d:b0:133:2fb2:917d with SMTP id p29-20020a056a206a1d00b001332fb2917dmr2102138pzk.5.1692329866013;
        Thu, 17 Aug 2023 20:37:46 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id c24-20020aa781d8000000b00686a80f431dsm484135pfn.126.2023.08.17.20.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 20:37:45 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH RESEND v5 16/26] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Fri, 18 Aug 2023 12:36:35 +0900
Message-ID: <20230818033648.8326-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818033648.8326-1-akihiko.odaki@daynix.com>
References: <20230818033648.8326-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nGTfaM6KslIr

This function is no longer used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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
index 09f1aca624..8fc9a1a140 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -133,9 +133,6 @@ struct SysemuCPUOps;
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
  * to GDB. The caller must free the returned string with g_free.
- * @gdb_get_dynamic_xml: Callback to return dynamically generated XML for the
- *   gdb stub. Returns a pointer to the XML contents for the specified XML file
- *   or NULL if the CPU doesn't have a dynamically generated content for it.
  * @disas_set_info: Setup architecture specific components of disassembly info
  * @adjust_watchpoint_address: Perform a target-specific adjustment to an
  * address before attempting to match it against watchpoints.
@@ -166,7 +163,6 @@ struct CPUClass {
 
     const GDBFeature *gdb_core_feature;
     const gchar * (*gdb_arch_name)(CPUState *cpu);
-    const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d6c2378d05..09bf82034d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1131,12 +1131,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
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
index 5f251bdffe..3dc6e545e3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1382,7 +1382,6 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu);
-const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, DumpState *s);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f07133419..f26c0ded18 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2354,7 +2354,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_arch_name = arm_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
 
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 791784dffe..fc5ed89e80 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -470,24 +470,6 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs)
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
index 938cd2b7e1..a3153c4e9f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7370,9 +7370,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif
 
     cc->gdb_num_core_regs = 71;
-#ifndef CONFIG_USER_ONLY
-    cc->gdb_get_dynamic_xml = ppc_gdb_get_dynamic_xml;
-#endif
 #ifdef USE_APPLE_GDB
     cc->gdb_read_register = ppc_cpu_gdb_read_register_apple;
     cc->gdb_write_register = ppc_cpu_gdb_write_register_apple;
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index dbdee7d56e..c86b7055ca 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -357,16 +357,6 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
 
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
index 86a477bfc0..e12b6ef7f6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1957,19 +1957,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *cs)
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
@@ -2147,7 +2134,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
     cc->tcg_ops = &riscv_tcg_ops;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
-- 
2.41.0
