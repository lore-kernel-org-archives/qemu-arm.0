Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp578087ejc;
        Wed, 11 Oct 2023 22:50:17 -0700 (PDT)
X-Received: by 2002:a05:6870:1708:b0:1ba:caf2:acc3 with SMTP id h8-20020a056870170800b001bacaf2acc3mr28083875oae.5.1697089817109;
        Wed, 11 Oct 2023 22:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697089817; cv=none;
        d=google.com; s=arc-20160816;
        b=JPl4HNdUAyt5265PteHxryA1TjH4uavWUPR7gZ/cA/e5VkU2oS66GolNyYPyJwDbuu
         TP9yVCPAFKzLq6mRrdV9Y417F5WfufInbAjcMYduX7E+MOriuS6yPx6bB6b9sgUaVj1K
         aS9vSuaDKnX97a4zU3LEzOLsNBT+6sU0H2PgtDAOM/NU2zDxExbpCrsgFK+xZaNLsv6g
         JyKBU4m88ioncRbjFEGZK+W9sQSjNhQ3YmY82/0nUempmB4V4j+4LIeL1RQmfdyK4GmD
         QJDmNRtB5EFePefFCJK8+r3lpq6nAgKiGBSSXaUZK66UHfmi3EZIIs3KMT7RRDYTV7pi
         JEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YNOwbY4r2y9Vu7MFsYpfzT/FYrv6FXwws8lwE8s/vgY=;
        fh=lW42IFciQRcgi2TpW76JzOW6yI8fNIuUaAjcfrG2GK8=;
        b=pg2EEEGN2vnGCxqCPkQeUsA1iG3fe49/FjVkUWdqGzH8fEEKN3K/hsdwxuQDGT4TQS
         VNazho9EgvHXCZBKrMJQxTTpMVPuQeZ2MI9DsF0ne/11rORIDCpV0qQToBIugyec+QNk
         TnTvXlOhAVTN8Gqvohc372EKWnkwClbYMCmwXOm/UjfYbMOBpX2y4rfbtFCqmamI25KE
         n8GafotFXaYR9HJoOBaGU/dOKl7FmX+h9ibnVkIoIgMOQX19RIPWVl7Hjragw3dWbmSq
         vIoZSAwbF8v2ulCrO+XnxKhJkl6i8lcTDmqcR2PEYCSgXyejT//Vo6yapUdlI3PQiV0b
         WzIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=MAQGO14p;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id zd24-20020a056871279800b001e127f027d2sor642184oab.13.2023.10.11.22.50.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 22:50:17 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=MAQGO14p;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697089816; x=1697694616; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNOwbY4r2y9Vu7MFsYpfzT/FYrv6FXwws8lwE8s/vgY=;
        b=MAQGO14pugqGbNFRYMZuxJU3ukuAVFEmw1Cv/qpCv+fbl3BQpeZQYn0YdKM9F4mTI7
         kasEIr9kZmOqmBlRSTK/YEejrwabzng1IeP8/lP+Plp4sF6ZVE7N8+P/VW9a3xYoCmkS
         9pnLT7yXWyYp4iTcTY2Wz5xvfBpUA9Lp7JutJ9Gd0uJgQ+wB+ApC/1EYN8TYGwsxri9n
         MhpSOWD/VKI3qt/TbOu+jDXN630/9ZACfxmw5uE1QUB2IKdY9ZP7nbXfUVxjwsvXuFNW
         wkxJdxwdVX59BoAT8uYCj7eg6GKlp3GQEMQFWTWoQN3KRwmIOIlsACig+PP/GxEwO1Js
         xybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697089816; x=1697694616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNOwbY4r2y9Vu7MFsYpfzT/FYrv6FXwws8lwE8s/vgY=;
        b=BXKbNSXbmlSN2yIwLgOHO1dRekbbNYmJT36Ci5ZUT3zL3iuRemIleo8mcfxL9Pll89
         P63/1BqqT75HCSdazZv/YTbeuT9HGydejStzSWvUBa4awAbbiIUhXsS07AYyP+9x+2VW
         vKskOXM7ibxzLZHrew1NFETx3dsTirTPV6hTz92T28WO2ACJKHEDJkVCekjJtRllUZwO
         kz905OaVs8Y5wCIBgqkD3yfoJATDzi6RPcxcijuv7jZofw4WBYX/XUgaT+K9StEhYBor
         dmym7BzyWgLacjdgCdsVLN+lAknr/4QOoiSa8kLMvhcwLGvW6gsscZT4I5S59wZRHksX
         N7ig==
X-Gm-Message-State: AOJu0Yx8n61RXfCmmwVjJtHj4ep9T9RW4VXs2gF0P/jUaonMuMXD/zCd
	HQiZoRL0R0YJyLexHHcOcNQGdE/hU3q4hl7FJVg=
X-Google-Smtp-Source: AGHT+IFr1K/i7BdJ/2Ow37HxhUPK9dQWzJNYU0f46fefovrG1JHJvD1JXSUfx2CiVDovULSC7ciVTA==
X-Received: by 2002:a05:6870:2c95:b0:1e9:9a86:2937 with SMTP id oh21-20020a0568702c9500b001e99a862937mr2805535oab.51.1697089816483;
        Wed, 11 Oct 2023 22:50:16 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.206.10])
        by smtp.gmail.com with UTF8SMTPSA id p1-20020a63b801000000b0058ee60f8e4dsm868573pge.34.2023.10.11.22.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 22:50:16 -0700 (PDT)
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
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v10 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Thu, 12 Oct 2023 14:48:51 +0900
Message-ID: <20231012054902.38447-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012054902.38447-1-akihiko.odaki@daynix.com>
References: <20231012054902.38447-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: guB734Gnfyy5

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
index d6278d59d5..2f07fc193f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1984,19 +1984,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *cs)
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
@@ -2174,7 +2161,6 @@ static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
     cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
     cc->tcg_ops = &riscv_tcg_ops;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
-- 
2.42.0
