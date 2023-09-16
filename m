Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1747407ejb;
        Sat, 16 Sep 2023 01:02:57 -0700 (PDT)
X-Received: by 2002:a05:6e02:12ed:b0:34a:c4ae:1937 with SMTP id l13-20020a056e0212ed00b0034ac4ae1937mr5238603iln.13.1694851377161;
        Sat, 16 Sep 2023 01:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694851377; cv=none;
        d=google.com; s=arc-20160816;
        b=QuA99UGaQ5E87EuvZkoKg2eGcmZdidCbn5briqtk1qquGrfq+U258ae/kEj7TluFQH
         9kFt2cK2REVJfwsBytstTAYgMWJlgnWEn5Ukk2wk9pqKk/ELDRjUrlTmnVDmostOoI0Q
         cy+Y7lbhEQK4wHcJoS+DBmOrN2QixWWU/EWN/3yScGy/lspHPeBRFdIjwDJimsuS26fY
         hrJLtKpE8N5GApuroLYkEP3L3i5zRKqvdede9rliiUnUHDqqvDkH0+gQtpnnK+XFL2cQ
         thLKJKnkpTXOBJH/o5Uytn9oP1pqzdm2ax7/0Tt2x+XUOkj6p95QNFjFqwNglZR51TKq
         d9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zuwkTGFn4CUWLfbEaHznI+TK7KvMW/M6pf3tb7SDPP8=;
        fh=0bV2fMUXMBMLAhatyiilNIcRTcD7RDxyXlu59VvHpkg=;
        b=tn95/njf+cqetQaTyLY75anKQL/+h2N1f7/8yy/VFhmWv9SYqNb6hmOzul7ZCSnpt4
         4YR+iP1F1BU/d3pTB+YtFCNHLFmDPf2T2tH7sYAroaL9QmjGPMC607gAfXrm/RsPAPd6
         ZILKQJzY8UUsc0ijWDKK0FOdKezUQ4we7eM/LiBLy63Jjrb3rFAujVKQiN01kiuhMfVf
         sEx5xQi1LHXvjpPg+wrslZe6pVY74B8bwkLPuqLnQkNwVhDwiAzguMAZxokWOQarThll
         AouMEoaCEr8SfvlStCkpi9CuN6vxGUE+qokYNvo2ur6+VnASVIU2hdzkSIdtbeblIOvd
         f68Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=CatCsDYz;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c63-20020a633542000000b0053fb4b9f30asor2086532pga.2.2023.09.16.01.02.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 16 Sep 2023 01:02:57 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=CatCsDYz;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694851376; x=1695456176; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuwkTGFn4CUWLfbEaHznI+TK7KvMW/M6pf3tb7SDPP8=;
        b=CatCsDYzergMVIZtiB3f2gvg2VOAqVGFK8zlpSr7ApTNueK4VVw3mWtDStEJ/algPe
         0i4QYsH9NaScJlos02V8ZUCR/fJOS5z18zoZsQ1/KDhSr2jQbqlRuYwtyFbKB/pKAqJm
         1Na20TTm4h2GznGtRFanj/Y0enpYfA/sDZAIm7Pc2R8LduXWLzLHA+ZPDgQqIpb8/m5q
         Rz9B8wEUQVhQO16CJA00ucqW3DIYZYkdhAOi2eIUmbVuJJw2EDZt1LWDldG2alwseSsb
         hqYOSb77WmDVV8jAWEupgR3cAT+VPmhMOyD9XnQwXwTwDuIHBJqu03SALsxWo4nT2FBi
         UFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694851376; x=1695456176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuwkTGFn4CUWLfbEaHznI+TK7KvMW/M6pf3tb7SDPP8=;
        b=Ac9fk1SDD3rO6OSZAwfRsjB6ex9yhhFr1Uq5wdrL82QZmhx/5zipcjpjXCURnVGMnK
         jO2QujnGh1ivQqxcyiwzPRnPhtmSSfO6Pgl539frfWhdOFBqc1eNylZY//3Ofr+F9Zyn
         zVKBm2rfvoIApTmSi/4eREhBUDn8QR8jyWPVRaNpVBjp00x/Q1BaKYq6sbXQbAEyvJwX
         qs0BYKeLtrRhzEtj1GlYKRTUhQALXEoRTPZ4GvWeKjDpIk1UGjzUuUGlD5SWJ/LUJa0n
         U9F+djgGQpR5K3kMVnyWZ9P3y2+PkZUK2ct9ishnYIbCPNkJLkaswEPTuYxM+NvzR3SO
         p6Pg==
X-Gm-Message-State: AOJu0YxPV6fsZ60Z3o5Z7PVWR1t4fW7fu/6bm3Jy5NmkOSwnNDeEZN40
	CGSJATKKo1A6K9gV2k+jNFr+oicNVi/xNgL0weA=
X-Google-Smtp-Source: AGHT+IHO8tPgPeM/ygovARNeCsJOeF3Tb4p5m5dRqeGLhzt0PiK/HciRV18oNkzPLy79Tmw1gXNrlQ==
X-Received: by 2002:a05:6a20:549f:b0:135:4df7:f165 with SMTP id i31-20020a056a20549f00b001354df7f165mr4362794pzk.21.1694851376528;
        Sat, 16 Sep 2023 01:02:56 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id z21-20020aa791d5000000b0068a46cd4120sm4029484pfa.199.2023.09.16.01.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 01:02:56 -0700 (PDT)
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
Subject: [PATCH v8 12/19] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Sat, 16 Sep 2023 17:01:29 +0900
Message-ID: <20230916080149.129989-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230916080149.129989-1-akihiko.odaki@daynix.com>
References: <20230916080149.129989-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LI0+1pdL2nRV

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
index 5426822ee0..06f7cdcfad 100644
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
 
     const char *gdb_core_xml_file;
     const gchar * (*gdb_arch_name)(CPUState *cpu);
-    const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24c6adff36..3fe93b8864 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1136,12 +1136,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
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
index dc38ebec18..a2c5bd9841 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2389,7 +2389,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
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
index e69405efed..e16c4acd4e 100644
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
index f8234da054..3182607113 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1955,19 +1955,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *cs)
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
@@ -2145,7 +2132,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
     cc->tcg_ops = &riscv_tcg_ops;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
-- 
2.42.0
