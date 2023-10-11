Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp640129ejr;
        Wed, 11 Oct 2023 00:04:56 -0700 (PDT)
X-Received: by 2002:a17:902:c946:b0:1c8:7bb8:321a with SMTP id i6-20020a170902c94600b001c87bb8321amr23184334pla.27.1697007895797;
        Wed, 11 Oct 2023 00:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697007895; cv=none;
        d=google.com; s=arc-20160816;
        b=YcI8mSBPtjXPu87zAMRPwQYe8zYI8xdXojh4hNnozS6Nb/CBjzcCQPfrVvwhAp2Yzg
         X7U2etWWT8/8bnsUWYLBpq9CEFjgNUYDGOvww6cZj0uIvUJ7sTEKuk7dYDX15yhXCxbo
         5vVH4jngCPa3OH1eo8hvH6RGjwpGj2Y2oEZM2UQWnD8BvFCTnIe1Q0Sy+Ueh+nkW4UZa
         UKinhTk9j89RZPQKnWIITjDfdUAMnNzy5vLzvCa88dvwUf7axinPwrRSffu+F25TWcGN
         9wI2ItGpTieOnlu4zIHd54ZqCEvuayRAwJ60MQO1URe5Wg4ty4N+Ov5iE4UKb2vP6sbD
         jQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5jKGKJo+PheYxYocDwLAGO3qwif/z/ZJ8rm2mFIWfTs=;
        fh=lW42IFciQRcgi2TpW76JzOW6yI8fNIuUaAjcfrG2GK8=;
        b=KxzhUxusVsofQDe83YAaA7WkEJeGUWxadJoDppCy32JjxuWvY98PKRFlejMs03ejjp
         7fUNc+Ns2qqOmBQRUBXvlqgS4ZMlmBJhObvt2vJsJU6k6CbWykgjVzsJA/pwKEDlHfqV
         5eYt6JPWC++cGzxJByYflT4G6jvZ0CpLs6iARXJ3T00WyE9LnNixTsnL9MBPX1KljrFj
         Dl2t87LyIZwDQ+H633Z7bTMzy3h2S1Fsq4uXLR6/vamT6cSzAkvdzS96bekydyh1kxkR
         FKMtzL3Cryv+ripnWVlD7peJr8EZd4GuDQDBM3qrrMetNHPN/NkGmenzHpdIjX1JcawF
         ksTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Y7jdtQG8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m1-20020a170902db0100b001c9b1de5ae4sor916868plx.7.2023.10.11.00.04.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 00:04:55 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Y7jdtQG8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697007895; x=1697612695; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jKGKJo+PheYxYocDwLAGO3qwif/z/ZJ8rm2mFIWfTs=;
        b=Y7jdtQG8DOw4deDYSHAbS4LPMMG1ojTd2jRCjhtR78Fx/RDy1ZMVByL3nTUXE+N+pC
         xD1TggqxHCmHDK/e98iymjXRSQPUtwTRgDRPab+P8UIE23Pg5T87BbQKA3MiE80Kc0ql
         VIXaXAuMx757xwDOgFz+omVDFG1B3vs+9mimg4dOZLjzi+K3AiOvnFB0DKuCoqWI5MJL
         HebwuVZvLjQJVGIt6qmf1Vlm1+1B9at5JaE/IqquZmwpd3ewCjqaktGQO+LqjAvr3m/2
         bMVIGixuHmQcIaiIZFR+BcEKvrd5FVEVvn9EwLXjKfF7fQdSnw76UJYmpHiszxtjTjxJ
         slgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697007895; x=1697612695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jKGKJo+PheYxYocDwLAGO3qwif/z/ZJ8rm2mFIWfTs=;
        b=EdvYwxGTtAkL2a6oj/zJW0k2I18uAG+4Ajlhk94GlvlT/6hufgwq8AI7wlTFmGfR5b
         fWAQrewXZ46I/R1iNsKTEJbxj1yOxNvV6czMlRodyhhA4xPKeia/LdbwWnC27fm8ftpR
         +sMlN50pkDmMuFbbM1JkhtRA3TGy7bkMPueXoR3A05RrZdOWb5JdezeEQdHqg+a33jLU
         B1Md/jmspabsbLDu0ybuJl7SgJEiCbRAZ7WYXt6VzTrZ6G4PPq/uj+wCSQHl9t3cmsoI
         m2OPIt1aNLS7NwSNwf4idYNjfeWoWxkmgOxJaSJLtRcC72VZb/n3mrSrDll5mJNfcR8n
         MbAQ==
X-Gm-Message-State: AOJu0Yw3v5DqFlN09oHE+A/+ySsQK7BC8vuR3droxvoFj3EST9BKJTed
	6OhCnVw20c75roD0wJ3ESpt4tdP969UAte0lBFM=
X-Google-Smtp-Source: AGHT+IH/DAXR7x+XDXaQuOcL3bVk9INNb7xRCgmoqVDoApO2lgVr6Z1uO8jHrVLddr+MOk7pIw7YAQ==
X-Received: by 2002:a17:902:d48e:b0:1c6:11ca:8861 with SMTP id c14-20020a170902d48e00b001c611ca8861mr25196781plg.21.1697007895132;
        Wed, 11 Oct 2023 00:04:55 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.206.10])
        by smtp.gmail.com with UTF8SMTPSA id jh18-20020a170903329200b001c61901ed37sm13061570plb.191.2023.10.11.00.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 00:04:54 -0700 (PDT)
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
Subject: [PATCH v9 15/23] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Wed, 11 Oct 2023 16:03:01 +0900
Message-ID: <20231011070335.14398-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011070335.14398-1-akihiko.odaki@daynix.com>
References: <20231011070335.14398-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1mbEHJPE2s0C

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
index 753d79b70c..38e403650e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2061,19 +2061,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *cs)
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
@@ -2251,7 +2238,6 @@ static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
     cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
     cc->tcg_ops = &riscv_tcg_ops;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
-- 
2.42.0
