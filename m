Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2509108ejb;
        Tue, 24 Oct 2023 22:28:54 -0700 (PDT)
X-Received: by 2002:a05:6808:198a:b0:3b2:ec06:7061 with SMTP id bj10-20020a056808198a00b003b2ec067061mr18048152oib.14.1698211734454;
        Tue, 24 Oct 2023 22:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698211734; cv=none;
        d=google.com; s=arc-20160816;
        b=yX6BZI/4qSibrc7UqZkcR8hnrAY6imOXthVIB2Cy2XmW+BBRy0luvEma/eArS3mkyc
         nLPBqVdTPEfjyE64SF0+WZEVK0ic1SlHAaEj7Gn0VCeGdvj/o6aCUSnjZR3+OVMlHJq2
         jMDilF/mF2Un9s/FCy9p9WfhNeiAR9H8tzL1xgS3qiIz4GEhS5KkDHmUbwlxLy64ZPLk
         /pcYiFX4h3ZXF7ZULMv7jntPSeR+qUtI30wUkpQXbVwQm/nqE4C9kXVH8w2RaLOjk0SE
         7qXmemYgd3ASBoqYlRf0WRa63pFUDDrOqzFO1Cq57Usyl1ALDSVVYQQkrip8e5S/NBHf
         FnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xS/23XQTZSBycxyMSA8/+0KJZ6Uf9fRlK5j+e680Bxo=;
        fh=WA5Ih+z6Ze7tQYrjkp5FJyvVwB6osmNafM1nTpBVX90=;
        b=OxWrEr+OeEkUav1NT8wfPogcTcm8q55NeNS8ulKQ+9aVTqH8l4Hnv6waumafu/iArB
         VyvBUn5k4REoRxiaey3g4VvhG3eSiLjY8zIq4mynq8iCM2Q7kR/V5BKqSWutYE2jaQi0
         wuL0w8ubuIyEXWJ00d9AsFocJ0xWP7jtt46gvMiFCECD+Gi8jEnKs03M3BmHxMZhoWj0
         pB9TcLYEmjSkHldfNAdcVXTLxhloTrzA6Fhsqyi44E0oA7g56t41irM8ODebaoeyQdfH
         hLFi5Zz5AtpQ1YYVPkSIz1SIXQGarXqNkS5zURGns3dubaGTNasUnJSO3NPQRY//G8lM
         IG4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NGuFTNBq;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z8-20020a544588000000b003afb1c8fe61sor6473544oib.17.2023.10.24.22.28.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Oct 2023 22:28:54 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NGuFTNBq;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1698211734; x=1698816534; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS/23XQTZSBycxyMSA8/+0KJZ6Uf9fRlK5j+e680Bxo=;
        b=NGuFTNBqv83qBCXSvsrBDyFFklMBq+kXMKyeP0qs+X7DoKsaPulyGDoV1r+Rd6J6Os
         okW/maUp8EEwLT4pDjqieudmp5dL3EGyLm090jSa9KeqCo+6/pPKPQi9J38aUhBo4Pdr
         RIVhUYolSJi+A4SfjULTF6IKD5GST7+R3KhCvbH23x9qWbQqSTSpU1fm2A8ORAnPtRku
         9yxuozDHNvo4de48CZY5Uu34RImN6Myx59ZH2MAZl4Jn39DFgTLrvOxJKLj6My44ooUK
         +EJYrvanauL+o3mT69k31OlnTotZKUfrDujvWaLRi60me81XUkooC4M++jHJfoLapwjw
         K7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698211734; x=1698816534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xS/23XQTZSBycxyMSA8/+0KJZ6Uf9fRlK5j+e680Bxo=;
        b=tnAyGxXrBdmfQrAkQZ52WZDiGCQRFz3K1fwx8psBacshoXTJzeytWPcLIwaYcFDqnb
         G15t5Mfy9dvZUHdSpOLGCKEEbvsrwm3aLkJzR2b9IKgKDtowNs5hNKuaZWm3qch7Dats
         DKO1mzRSwazxH6WKvcbsWi5fijmtAjY2xYv1U3d+Ni/QbuvNaD8QtGi052le7vX0V4sY
         N6bWO24AEc09NVr1P5rGUeXP75oeGDqqTgneYSAuhX0Shwb7xCzDLQL4z6LXv4KeSjy+
         YfjczVKf2oNMWgbWt6mVFvf2nW3YZHBiEPqVexSCVUTanO1cLCZWDNlfzNt6paUZhGRA
         D01w==
X-Gm-Message-State: AOJu0YxLe+cnw4H5xRwV+vG8gBed/hzaomFHnyHjrO/GDPIGikgfHKwi
	UErKpGuAOpSw6OChcHuJpYVQQMVzerEwVqbJjHSONA==
X-Google-Smtp-Source: AGHT+IGa1jtVd3Tn8PHuDYL6+xmFOLPqTHl0+jcjywodVQREtPhA1eajOU8CJ8tYZIRolMe0WKnSeA==
X-Received: by 2002:a05:6359:6006:b0:168:e04f:3e0c with SMTP id rw6-20020a056359600600b00168e04f3e0cmr6660432rwb.11.1698211733788;
        Tue, 24 Oct 2023 22:28:53 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.207])
        by smtp.gmail.com with UTF8SMTPSA id 22-20020a631256000000b00528db73ed70sm8121439pgs.3.2023.10.24.22.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 22:28:52 -0700 (PDT)
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
Subject: [PATCH v15 12/19] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Wed, 25 Oct 2023 14:27:34 +0900
Message-ID: <20231025052744.20697-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025052744.20697-1-akihiko.odaki@daynix.com>
References: <20231025052744.20697-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2wwOt8Z1oqFg

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
