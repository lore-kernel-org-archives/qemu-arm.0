Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1908118ejc;
        Fri, 13 Oct 2023 20:40:47 -0700 (PDT)
X-Received: by 2002:a05:6358:880c:b0:166:b17c:bbbd with SMTP id hv12-20020a056358880c00b00166b17cbbbdmr138793rwb.17.1697254847655;
        Fri, 13 Oct 2023 20:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697254847; cv=none;
        d=google.com; s=arc-20160816;
        b=POGliVAPr5c+6GfkYGB7z8FlIsxmTZXAn/uGgzWfWF6AsFzemTC+JSXxfdTlHBKYxY
         5T6p/70UWoKDIxMmEZI/gaO84uR8plmb+zZwUWLxmraEm4inI6hT9jWC+NG11z0rDpNh
         IdRscYKtyGdk2mFHlNgdjA3PhJTec70Kn4RNrVqmOZBceY9E41rdyAqhCwUGjEEvNnqe
         l3T9ktv2Ambrh+SNX80BBxwlZ4575g7VR+VDtTgXDxX9cP5/H9ad8h8PL2pmhJbbAT7b
         CgT55ln1hCm5mCBObcAgep0LMW4Kou/3SlD1ZdoU4U0X+ZVyh2+m+RKuJ2Oq96f1WQGH
         4FZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ADm9k00KWli0+5o72LQdkY0yNrsNRfPYR+HX1qe8hJI=;
        fh=lW42IFciQRcgi2TpW76JzOW6yI8fNIuUaAjcfrG2GK8=;
        b=KNhcn9sbQ/gkKVffTxRmmisBOl2vRWoYi9qamRoq2XAhF7HJW8BcvNtF5VhjLzssgW
         fnzBLH19cERFcKl4rvWa+tCWwd6HN9LpmOy/8eDPUIJNDAzvKhnqDa93xS+IP3aCtmKe
         tuFWIckxZ8SHOXyH0wTLhB+ITKJdqs8EcLn4J0Rlouc6Rm0dSstVYgUw/csnWaqFMJ6M
         0CQqH45oCDm1Cil7FLX0Q4tDyH3HLT6jGwE7vkKfQ7CbHSVmKTCBp/3fD7jh+tboRaCs
         7qCZ7f9TM3sMkgN+L2KFg9G9/7KpaJbdMV9y/+x0Ud/obMWHHSGcdI3OIU6izxp057Dr
         TPTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="bj79JH/T";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x28-20020aa79adc000000b0068fe24622f8sor8420138pfp.4.2023.10.13.20.40.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 20:40:47 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="bj79JH/T";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697254847; x=1697859647; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADm9k00KWli0+5o72LQdkY0yNrsNRfPYR+HX1qe8hJI=;
        b=bj79JH/TT5o8NnK9f2L2JJNID/h77/v40TQ8zfblAa9JbX1vtuKd2yCAQzFStk1giU
         rMuMNALL77lrlZWs6zbv3uc08VKf1/TaCulCX0ovLcHS26bidzsfXr0AFsYrSNKlIddr
         ZnhUtp+3JCV5luT5oMjCEty7cK/RQ3/fdpeQ1TFGx2DEpMkyzsbfQNWYHHNooGKYmk7j
         qugrnx3nWi2p4TdQu0SW0mbnuw+QdWuQdyDyfjeraw0SAXWXQQ0tEZ29Hroi+p75PeRX
         F1LkwTQKpFL0kvlzs9n51QGD65UV0Ap+4JoM3epoZlqmEgmWa81MHMgq3+xlF7w8jb31
         SSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697254847; x=1697859647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADm9k00KWli0+5o72LQdkY0yNrsNRfPYR+HX1qe8hJI=;
        b=KCEXd/xoxKEOeHlIZdAeHoI6lCt2I2XHF6tgR4vvNeFT149b9sfWw3HjTdmUJmh+vO
         Ouz4Q34mH9b9DBrSwfUjehRRbVlekxkZR9LGX9PIsDZctrcCxswo9tIPDKKgJpXrD/jr
         YhxrHsc9Xn0VpHYvzSFgL1NbUwyTpgsJoJPVEUBXEOWdLdHLMlPWXxqB2p7msB2vaE/2
         MxZiYlyvbxeOeQ7fMezh+VGvXLv+y613mD7FiEpFfeX12LHD+VukU3xR/LCWmIHMlv33
         NOE4UENZ53SV0GsC8hoDogM7v/mhN5as8wZOLZN7L/0i8TY12asBkgHm67Xo5Zcv7j/l
         6+gA==
X-Gm-Message-State: AOJu0YwyS/CXukN5ATg2NqYLHt7b39+A4VEgSP4jeU6TabePybC2VVWQ
	N43WPSdsQBCDXGQbp76dcynOdw1CCtxaQlAEkcumSw==
X-Google-Smtp-Source: AGHT+IHL6aQjU5lzww3AoYu3SAgdfrm+nzs9sZVV/Q3+8sk4E+FzkuiVPfPjSd6f+U8e2MhUg6pa6A==
X-Received: by 2002:a05:6a00:2e8f:b0:690:d4f5:c664 with SMTP id fd15-20020a056a002e8f00b00690d4f5c664mr31071649pfb.11.1697254846916;
        Fri, 13 Oct 2023 20:40:46 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with UTF8SMTPSA id z18-20020aa791d2000000b0068fcb70ccafsm14110265pfa.129.2023.10.13.20.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 20:40:46 -0700 (PDT)
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
Subject: [PATCH v12 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Sat, 14 Oct 2023 12:39:31 +0900
Message-ID: <20231014033940.15679-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231014033940.15679-1-akihiko.odaki@daynix.com>
References: <20231014033940.15679-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LnP3tPQkTE9O

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
index 459a9faa7b..b17f614b63 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1416,19 +1416,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *cs)
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
@@ -1587,7 +1574,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
                               cpu_set_mvendorid, NULL, NULL);
-- 
2.42.0
