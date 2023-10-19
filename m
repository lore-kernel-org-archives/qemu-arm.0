Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp410605ejb;
        Thu, 19 Oct 2023 03:28:07 -0700 (PDT)
X-Received: by 2002:a17:902:ce91:b0:1c6:2acc:62ea with SMTP id f17-20020a170902ce9100b001c62acc62eamr2176831plg.57.1697711287175;
        Thu, 19 Oct 2023 03:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697711287; cv=none;
        d=google.com; s=arc-20160816;
        b=lIgVWADLUs9GItRt892gO9uzFqhEKRkHDcUhg198Aj40mKU4mawATB97nND1VLpRss
         k31G1QkLQuNBxPyBkP9y67LGYaTA39MmsTnNf+Wb1B2RMx/VZURZv6oqRta8OZ6AtvjC
         HYqbRhJRIjjpUR5738P+CwL6xRtIc3ta5As6TodGvVV6hbJcxuYotdIM9F63uVUylCHp
         q5g4cUFJOMSespDI6pz/QsIp2QaamZaDt7k/YnbYLo6GdCC3OnfK1FbCGz48CWBvrMef
         bq9J+Yyt1cXjtWoCNaSy2bJfk2bEkS7jjE+IL3EKnIhjtvgIpm4DwOVcIFcpYOM28rnH
         sX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ujK2Ma9uGgMPuLM520uLs77oyQNJ8rHPAUhtK+VcawQ=;
        fh=WA5Ih+z6Ze7tQYrjkp5FJyvVwB6osmNafM1nTpBVX90=;
        b=LdN56Ho0kupCWFO98ljCz7q4EgJeJTw26LVbR6FpEHWbnIEv0HrWorcJYLNGc4CbK9
         ktncZBkRC5PIVcoDEVWjWvIK2cLhtM5wOzxZiAVrnjL3n9zqnhRdrdr+6O0e0qCwOB8J
         zCxrngUAzTVTh4PDZcjdjETGeUGLqWIzCUqsyC1aJJade/OGhrnWkIOubMsHrI6CkJvQ
         6jT5ru5icgEARcAVsMcwgogSiNHdGvDQFyFVT95w8WaLFp6sL2NjUk9bjRB53cgDwLpD
         rmwgwhnYMkikOmi35k8HV+KTuaMN/CEb3JLQnE8j3NKocpXQaX1UC8QIqKEiiHRmZudb
         5coQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NR4ftoHI;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w16-20020a1709027b9000b001c62a6e5e66sor901514pll.13.2023.10.19.03.28.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Oct 2023 03:28:07 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NR4ftoHI;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697711286; x=1698316086; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujK2Ma9uGgMPuLM520uLs77oyQNJ8rHPAUhtK+VcawQ=;
        b=NR4ftoHIvIRMbuPWTjOi7AfHxH9puJSSuSVBYT72xU6hvfro4WFn5xCJZh0XcClCQa
         riX7J9i4DAPyA1rQxT9JxqNKB+385EDuG423xjreWhpSvKJjxE2V05lf99Hre1pG2C5p
         EZh3Vvu+jSVOo3VCbSYbj6M4MxdYKRm/vH4i+UoGqGIv6L7eFi0GWHnqxydHtPJct41D
         +vH0GMoohUoHZ/QZvH5yWChATbdk5ZnznHI9w+wqsBLAjZSDR3urWBPHppzi6uNhhT59
         3hpfdw/eV955a0zzkBFAHEVEg85fU/8uE9Z6TheA7mjDjrzaiaon9n/2Uhkusxd4YlUE
         MO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697711286; x=1698316086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujK2Ma9uGgMPuLM520uLs77oyQNJ8rHPAUhtK+VcawQ=;
        b=dfaPA/By0dqMkkYpew19BPGa4a2k0YptecnYvgYYA985b2c1xguXciDVxxTHjybp4U
         p/ZgLZ+1c8u4IzM6iqRyfZLv3EPEptw/pfw4K+Ua56seMFEIHGS7I+Iu//wGto0n16yj
         gyGPZFY8HTxvCQTogbEEuQy+DtZulmlRxsed7i1XvbQmn5vEDDyhFntZXZiatmeREWfS
         NktdWHiSuNqQfIjz24b7UYanon8ZGWGs+VDPpkaQKxujEr5x6hDSlufr/yLtXsuSVCWu
         jQL64AoJDd0mQl8fOSBxRVVW0lHCpKytHP/WIsXu6iyMKdDg03m4ZE3+EHOt4QKinHpx
         8YeQ==
X-Gm-Message-State: AOJu0YyJ/l8wH+e616A9D07RIfdO+8gxjwtnSDegj1naj3cUBOraKDmZ
	0I/iDX0CHdkuIS4x6STKgDr8o0YuejTv106Is/FF6A==
X-Google-Smtp-Source: AGHT+IGrzs9DUNC8ZbETmShvrUmoyBu5OaUL8Qq1G481/+51jGwGy1iEJYM3uPUJ4oN+Z0vHVEuSeg==
X-Received: by 2002:a17:902:f312:b0:1ca:8b90:1cbd with SMTP id c18-20020a170902f31200b001ca8b901cbdmr1737439ple.0.1697711286534;
        Thu, 19 Oct 2023 03:28:06 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with UTF8SMTPSA id bj11-20020a170902850b00b001bf8779e051sm1548069plb.289.2023.10.19.03.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 03:28:06 -0700 (PDT)
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
Subject: [PATCH v14 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Thu, 19 Oct 2023 19:26:47 +0900
Message-ID: <20231019102657.129512-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019102657.129512-1-akihiko.odaki@daynix.com>
References: <20231019102657.129512-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u6K1oTUbf6ec

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
index 848062bc9f..650e6ece70 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1384,7 +1384,6 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
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
index 8d771c5d46..3de9d23079 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -473,24 +473,6 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
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
index a0178c3ce8..909d753b02 100644
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
index 8ca37b6bf9..f47878a67b 100644
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
