Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp604405ejb;
        Sat, 2 Sep 2023 22:04:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d82:b0:149:8cc1:f30b with SMTP id bj2-20020a056a213d8200b001498cc1f30bmr5961058pzc.38.1693717460202;
        Sat, 02 Sep 2023 22:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693717460; cv=none;
        d=google.com; s=arc-20160816;
        b=Da5Vz0Yb2AiGj/WzowkfpAsfSoWw/c3a5xCZnnM8lDWWLN0mrjdF99c2HTMJfUdBFA
         3THkXoiriCCOrFyVZkbK76iC+G8PawKKllUOWRmGGd6gTkAglqhzttPejWVqcO3RjATH
         xPHraS4dLLscPehLvgdSMckcnHbvVWkSihl2dL/UI8S9YaWTXdIJvRpwLQFruA+zG/VG
         c5PwLu71AKTh1Qm6k72XvDGBiqBGRDkiukYflGDNVbFMI5mCtNjvrABH/1iwAGbc7dkN
         HEmAjOFFvh4Gpdh23y9er4SDBB97mi8AMuHHE8V3uqXd+Kae9CAgCg0Gn8UVvI7vWWKy
         XSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YIdFEj2N/i23jaZLgTO+etAiClTgViqlBh5mj6WAZSw=;
        fh=DXWEo+1hOi9Yz+S7grPeJImNb6hOfnJUS946L7RlWPg=;
        b=coeYxrvFhKCYQHpZNRS3D+dI7ZyRGaxHCJQLdqcHWvcaI1XKJ+EL/eVRSKQKi7z/kB
         LV4ZPuIrpXZSO9q4vBNWnUTgfsio8E8Poa7Sy9ISdbGm7UmR1M/+UcvN3KaqxUWH/+rJ
         MqbBOKJFLhQUa3xskBJK9SzO/3M8bCZgBIeBO4//96WEANfT5w/7IRNBhS0VseIFiaRw
         BjXJ3BCkOYR7KWyKBusHkAzmuohJzVJ+wQZD99JyuiTUzmtqI9VhQ2s8TpzFjr49zpIt
         dGLRxf/G3y6f41U0bWJFSQIwXt4nZB9PjGfeP4yVKCfcbVdc1oWN+fmQn+2WgUf1c28f
         sx9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=K3EdFws8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g1-20020a170902e38100b001bb779f53a3sor3364579ple.13.2023.09.02.22.04.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 02 Sep 2023 22:04:20 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=K3EdFws8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693717459; x=1694322259; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIdFEj2N/i23jaZLgTO+etAiClTgViqlBh5mj6WAZSw=;
        b=K3EdFws8Jl3JeQYLp6OVskRVB6KgRZ1uc6bMR7Eue4wZXL/Ig7fCWRvdiN4e5URDD9
         PPMfiCeChBIKTw+TmGIQY3QbE8U0PpLMaJOmiwBW1m+1Ebv5Uq2gMnt8liMzVq7LrnC3
         M1vgqcLX6u2HY/avVYnXBpHThCiVIm09yj9ptF/rpu2M7uo1TM2WpWu0vwjrPPOg5sMg
         91aDWVXHjZdjy5W+IZh26oKzjC2Cs9jWA005fSj5q5gcvUB72yXBiE1BA17MEvGnLt2f
         VbwWHRBg0pzH4CAlLWmsr1ElKED4xYsKZX76qNTw8ozYEl2f+kNnIAbBGhUcRPLGEycb
         CbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693717459; x=1694322259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIdFEj2N/i23jaZLgTO+etAiClTgViqlBh5mj6WAZSw=;
        b=FNZ5U4zKZvn+vNWJGkDiTF/nItCs7Ouo5HfZEBsGMB6ClQn25GvgpD3A+PDBn0j074
         M5w/lliAqsJDvSon13CC2okL7GDeFJ3sREQh/1hY7gCUh4pMAz6D7lW4KJdb0e5atQv7
         hWKMgfMKWrGlQImtYH8Yg2sqFehk9IX1yZsWYgMTccjQgNpo5XpjEPMXJBNR1i/oByUx
         2d6O7ZNX4xJzl4GOM1k0qBM8vF+8Z61BwTvPdNQwiHniu1nowrxaJzkJY3rXvcVXOleF
         wDZVlp1QhiaWt9gTNa4KZ+rA7QYefCshI7PNLbg7NZNvL7J4Mmti7are1d5kFnP85mWH
         7dSg==
X-Gm-Message-State: AOJu0YxfBEjiAsH6Fj6EavY2uWIk/hLxEMdIGjMsXI+IplMcXZ5E4pVB
	wFvZiSDKGI0gKS5YMIJDfIXM4YC3mcheJ96zRJI=
X-Google-Smtp-Source: AGHT+IH2ZyuXg6obzQjmD40pdAfkToUPv3XQTLm3G2lhdRj2Cu6T8HnXb7yNHXR5mqm4OA7dS8+i2w==
X-Received: by 2002:a17:902:db10:b0:1c3:25ba:e204 with SMTP id m16-20020a170902db1000b001c325bae204mr2366319plx.54.1693717459597;
        Sat, 02 Sep 2023 22:04:19 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id l11-20020a170902f68b00b001b8af7f632asm5324835plg.176.2023.09.02.22.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 22:04:19 -0700 (PDT)
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
Subject: [PATCH v6 11/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Sun,  3 Sep 2023 14:03:19 +0900
Message-ID: <20230903050338.35256-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903050338.35256-1-akihiko.odaki@daynix.com>
References: <20230903050338.35256-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XwERVp0WP4aA

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
index 99040e0c4c..40c3f50c89 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -442,24 +442,6 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs)
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
index 9f2aad7aa9..5af9a0cbe3 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -339,16 +339,6 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
 
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
2.42.0
