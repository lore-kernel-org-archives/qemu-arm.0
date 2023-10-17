Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4141264ejc;
        Tue, 17 Oct 2023 12:10:42 -0700 (PDT)
X-Received: by 2002:a05:6359:5e02:b0:134:e301:2c21 with SMTP id pw2-20020a0563595e0200b00134e3012c21mr3351205rwb.15.1697569841929;
        Tue, 17 Oct 2023 12:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697569841; cv=none;
        d=google.com; s=arc-20160816;
        b=Bq7V+ZG0jF9zcUadzsWlqtzQyUV0aEQNJ1dLMXdyzGuOLXJFoU32nRTIu8Si5EGjPh
         nizADdYwnIWbxm3DvizUjeNpep8s/jcnTqFMDJHV7M7Gz/u9py7pIaiRidUbwrNu+ul3
         DaKp1G5+kgWa2VSburhLwn3hO8sLhCnwPIoH9duWZRi8REmkw2yj7k/Ey5R3TqQx23v9
         45yL5vksL42TfbU5gEM5wCibp2QZQ3D6syTKWrUuaHDdEgdrq6qyWyk+9AgSmuchXcM5
         v8GkSX/Fy1FVS5xpTZRTUrFsJ/DYXhnk434i52JOxEICfm+fd/7ZbRLepvhq7mo6gecv
         uEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=24qZu+1ggT2JDviRKMuixfNs8e2VzD5si+04t5PRRIg=;
        fh=WA5Ih+z6Ze7tQYrjkp5FJyvVwB6osmNafM1nTpBVX90=;
        b=VjJ1bYhCPnGSdIEJsAJTS44JaQyh0cOPh6dcsPYDWOuN/fnV5wwnA6JumlLvLN2viS
         JiAVc3oqeTszGdQnCiS7uFt2s9iZ4YP2C+81RV/6yx14zTSEOJ2AsCvykOvwuYrtUkEE
         6H783triRwYdafTkNJJrO2m1kIJ8OUcCZkgKP+5h+49W1PqyyTBxwtoNmnZXRinxuAQI
         9GGfZ4xoRnZjh/oxblghkud0e7LDQpzh7fnsLZKVSQBCao5vZHWFT+NjOrRN5nPH4/hX
         CxwBrQqX8uTg/dTDpuqQ/I8lgLNvcHsSW8cfONe1DdLxWaFWFhivkgd0yVNl5v/bY16Y
         l9Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=1EpTw7R7;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b17-20020a056a0002d100b006b5034de047sor945999pft.8.2023.10.17.12.10.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Oct 2023 12:10:41 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=1EpTw7R7;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697569841; x=1698174641; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24qZu+1ggT2JDviRKMuixfNs8e2VzD5si+04t5PRRIg=;
        b=1EpTw7R7PakNz089BO/TWy7UtC63iPFFEAP4cjxgyj71klW5dBM7QpPwBZaAI5Wsd8
         /Bxr/OsxQ2BRgqVNCEVhTIDp3BWy6lJ6qiVqKZtkn2LMq5xH0t5y8hShbpMcPv1nwYzZ
         ZYpzLcIiQkBlkGHOUsVU980LNGT2YRjtARVHlrIEvGEVkjKnNq0dvmcoy0UOF9Su6Jtn
         9R6dhOgQAvW5vmPy/djpw3eHD3djUPbsFcZrPgMvRJ/afPVLEr6kIT/X4wxDMgA48j8S
         w3OBqgfqt8NcMrR/+j7ZyU5oVVL9Yex2aR9w4w4u0DJoB2W0G4KUjZEZthlQcKlZ8Dwl
         KlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569841; x=1698174641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24qZu+1ggT2JDviRKMuixfNs8e2VzD5si+04t5PRRIg=;
        b=rfA6i2PzAnYH++K30Emj7AzAig31FwZ04o4adl8nmkgevxuobPi/gNwhdmbvv7dOjd
         L7B3q265QYa4TeaMiwp8+NoYvOlYA1k3PeWw5uQRO9Dfs3J2fd/Ys9LHigSaOo3OR0Dr
         PXfuWzDI3tdkqEDJlqkSuhJ1hX/gwX6VasHITanz0WRQiVtkpY0YZDirj3F5SsiFP5iR
         vTo9hjIKrMQmiokh+BGp1V4XClGeMq1y93LpKCmZMsPMzTWqHUpD1FYeTUd+q/rzNxuS
         d352ygPAFlpcf05WJzosvkxlH5zXn6Y6s/lPegJ+XdqUdpSFfGyVqijiduO6sEf/m33G
         9o+w==
X-Gm-Message-State: AOJu0YwCUBqF9FD4KThkIB2X5Ji4CUKVSZuOYvEcZyA22srv640XotbK
	2FxLA5xGJkKK7O8lw9UTvd1RC3TjmjLD3hIFliObSg==
X-Google-Smtp-Source: AGHT+IHbDSWxhExQ5WQ6WRkx4x4/zua2+84pYdaF1mBKE/IfN/FxBI6ApvBGuD25dHFNT85/ZG5qzQ==
X-Received: by 2002:a05:6a00:1995:b0:6be:2991:d878 with SMTP id d21-20020a056a00199500b006be2991d878mr3498192pfl.15.1697569841278;
        Tue, 17 Oct 2023 12:10:41 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with UTF8SMTPSA id k3-20020aa79d03000000b0069102aa1918sm1803941pfp.48.2023.10.17.12.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 12:10:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v13 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Wed, 18 Oct 2023 04:09:22 +0900
Message-ID: <20231017190931.16211-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017190931.16211-1-akihiko.odaki@daynix.com>
References: <20231017190931.16211-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WVevpPL3KzRJ

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
index 11d4b5cd0c..d2e70643f2 100644
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
index 3702ddaab8..0e4f1d7d0c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1137,12 +1137,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
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
index 84cdc3055f..1782b21edb 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1385,7 +1385,6 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu);
-const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, DumpState *s);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6d9bf6a14e..e7fe11339b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2392,7 +2392,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_arch_name = arm_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
 
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index aa2c6c1bde..f9774b5547 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -463,24 +463,6 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs)
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
index af43e73af2..d8a992a45d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7384,9 +7384,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif
 
     cc->gdb_num_core_regs = 71;
-#ifndef CONFIG_USER_ONLY
-    cc->gdb_get_dynamic_xml = ppc_gdb_get_dynamic_xml;
-#endif
 #ifdef USE_APPLE_GDB
     cc->gdb_read_register = ppc_cpu_gdb_read_register_apple;
     cc->gdb_write_register = ppc_cpu_gdb_write_register_apple;
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 2392625441..a20d5922dd 100644
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
index 3ee1e6ae03..ace400db1c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1427,19 +1427,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *cs)
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
@@ -1593,7 +1580,6 @@ static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
     cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
                               cpu_set_mvendorid, NULL, NULL);
-- 
2.42.0
