Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2608889ejb;
        Wed, 25 Oct 2023 02:32:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:854:b0:68a:582b:6b62 with SMTP id q20-20020a056a00085400b0068a582b6b62mr17089192pfk.7.1698226368261;
        Wed, 25 Oct 2023 02:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698226368; cv=none;
        d=google.com; s=arc-20160816;
        b=YuKZJGnetjGH4xqAWfNLRCNphY8VU1FtGzMXMdun6wn5qPR9S0EppeGCYkFs+uI9yr
         LHgn1JYGmEJ2xT2B+DnovbRMDBQ/K4WqMshOEz4/5hxMeNRsRVofu84zVHAA17x8DwhV
         js9+ngqDp6Tk/H+qZQqIHvEO9LBW9qSdq+aL+UWYVYMIsgV13gKpoxZR3O1zXHhMBmEU
         m4Ol+VsrfYhw+Y7L0a59XaaXuXW0Un8l7y4CrqeUDc41HODm0ar0tgiEr/fsf0JKMqwi
         KEneFrWpLZM3PfykHbdfVjb3EfEQJfh6gIopolR5a4JowmJ1AMKXM9AeP9C6EEp0x8Xg
         1HoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xS/23XQTZSBycxyMSA8/+0KJZ6Uf9fRlK5j+e680Bxo=;
        fh=WA5Ih+z6Ze7tQYrjkp5FJyvVwB6osmNafM1nTpBVX90=;
        b=Miz4U2i5kmLjcY6bbW/3o4vPzkXFPy7jczVI30PIRiq2ACaKeiBc7pRVb+Tt2x5nuR
         RWZPWV36m/N5B8IrmThhAVdZLyizoYUxBPoY/5K/hjzYJ4ooJlykvS33SnNHCoJYcFMW
         5lSAyvFEkHeylIZjwUAagVpPF3wyHX2iQKIcbsGrdN/MSjV38SEjXgjvMmDpMmpGnmDd
         dreQ5zgsoURXwSD33sw5PfQY6+nVivd7IWxNmni7iwC7Em9YaRpxF98EIJSc4/BI7Bi2
         uVlZ/YJXe6ZWLAaFjBo9BUMe65MYdT4KoAWPLKDokXm4moyIEy9KuCzM3kfu9K11pRNA
         0LWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=A5VQJmNb;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q4-20020a056a0002a400b0068fc2ecd786sor4386350pfs.6.2023.10.25.02.32.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Oct 2023 02:32:48 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=A5VQJmNb;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1698226367; x=1698831167; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS/23XQTZSBycxyMSA8/+0KJZ6Uf9fRlK5j+e680Bxo=;
        b=A5VQJmNb1VrsOvnzK9ss7Rs2AQ1QkDMoVtAvjlLm15p8I2Sm+r1MneNpI3N3zUA2nj
         fcLWh3ByLsmZAPXr2tTGEAlPyp1b0iRY7tsdQXSGxdF0bShA2NSlZpvPAhPbYdqVSdjN
         gRrXXRsUv10k9l41e9aTXacpYixdE+XuLjoUR9cuzUViLGCPvXsJFJRFRpKtGfHZaDDP
         gsXP4f5F7V94mtAraomTKDNZd7srZEq65CTUuWCO6UpJ5DXinsOLsp+2na4FtnkMqVAQ
         QePWGiBxDgKVtvfKxmcHffF+QZSZ+spI8CkXM/qw4iWOEmXkAyqdQfYXL3PA3B4O3I1C
         kVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698226367; x=1698831167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xS/23XQTZSBycxyMSA8/+0KJZ6Uf9fRlK5j+e680Bxo=;
        b=G8RJ6zkDR3zV4RVU6fMsRTfRXAVVUXZc89/TNBiBeVVYz41ASHUSqN729ujSluNO/3
         hCU9vVPoiXTEOL4Bz6NdVRPHCibNHYQxcmlBvad7J2J54Aw3AKbvqF55oYLyciqdGn51
         p29L7BWJU0gA3bqzpL30xVvCCDNljvjzpdS7vCcgDytpnScVtG9U4niWDAfjDAasS986
         +GBh5QNlUzwEvqmg2sn9e38d1Py4/AVsLX8qoNr16cycqIpS9phEpoPkME1rW1UbtZG9
         yZ6VR4Mq/gBAvkY0R6NsmyV5+29wNOmImVM1afQ9xKfCt/LJamq/Toi3IvNQat3NyR1v
         WfcQ==
X-Gm-Message-State: AOJu0YwJyqz9EOADfgDYGJgynxHcEJmyReeLufn8GHmeHuIQCkuEcuhb
	RDXdasfnQ48Xij0ISpBGF8xeY8HiqI2t3rOHZ8A=
X-Google-Smtp-Source: AGHT+IFMxjI4UB/wpgJLDqQ1ZQ9KaAKxxwEdB/0zIJaR4ykc9npOUXetWX0ZlrgSC1Dg2hLJ/ydLNQ==
X-Received: by 2002:a05:6a00:21d1:b0:68a:5cf8:dae4 with SMTP id t17-20020a056a0021d100b0068a5cf8dae4mr18651863pfj.3.1698226367439;
        Wed, 25 Oct 2023 02:32:47 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id y16-20020aa793d0000000b006b8bb35e313sm8945124pff.103.2023.10.25.02.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:32:46 -0700 (PDT)
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
Subject: [PATCH v16 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Wed, 25 Oct 2023 18:31:12 +0900
Message-ID: <20231025093128.33116-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025093128.33116-1-akihiko.odaki@daynix.com>
References: <20231025093128.33116-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KeOMB5t1g4Vz

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
