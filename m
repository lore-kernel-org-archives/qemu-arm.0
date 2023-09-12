Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1842036ejx;
        Tue, 12 Sep 2023 00:12:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:24c6:b0:68a:553a:c0da with SMTP id d6-20020a056a0024c600b0068a553ac0damr11180012pfv.24.1694502776245;
        Tue, 12 Sep 2023 00:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694502776; cv=none;
        d=google.com; s=arc-20160816;
        b=yqw4gKZFRXlzozk4H9gjCo3ANYfDlIUEGb3kNoSF3kR++qixtBzZSHpfey1wVu48Co
         ZibSDrjqJuWFCVjqPeWjFTd+FRf3WyCw3wx6EljcErhZe2e0uwx14PQCezPxpKwh5iC6
         W3F73xAJh3YWtRfJwdBZJ61hwRBhqBsnaupEniHbsBU5ntVO9icZYSjF+PCiDwekZ7n5
         x/DZ++MV1CO/VWGRoDXP+F8xDwJn4kcbU0V6gGD9F3w10VFlNsiAx2wf2y0Borij9eI/
         VwatqP/SaHU8XnkfoychSGkH4kSkGqjLDWpXmAhBGA+NQZqw4c3w7hc9m0AWfCXnFBwk
         QquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+aU3pt53IRqOP1elGAUjUcGWsMhpBr+2bOKlb7C1dSc=;
        fh=DXWEo+1hOi9Yz+S7grPeJImNb6hOfnJUS946L7RlWPg=;
        b=sbvIf8Fqfg8mKl0KhaF6RZCWbYvNtE22K85T2IIwWOx9sFziRLDvm/J97uK4PKF8rJ
         Mp4AAZbVxoFmAFsDLkjR1Y3IDeO0Gb6mqbcQmbTNCohMCpFhGDG+wSyVwNhjvP0a6JKE
         H+orrxbhJ7hPyDa1ISaETFxgJRDsR+JSLSpS0O/5J4dMIh2pqpeP5Ckjz+B7WKPhBn8T
         cqzL7EjaAMFB9SVrVULMOn94mGX0V+on16nj+jCV0/TLZmKEmm2+VFtZmCvCeyncXZFC
         a4UH/6DbBvQIoD5eH8xlqIDJrYlkP3/Bfg+D5ArSyEGjbkBbOmqHEKz8U2oWCmRaGuSs
         Pt1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=nnVHDetL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bf14-20020a056a000d8e00b0068fb980fd53sor3027055pfb.8.2023.09.12.00.12.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Sep 2023 00:12:56 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=nnVHDetL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694502775; x=1695107575; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aU3pt53IRqOP1elGAUjUcGWsMhpBr+2bOKlb7C1dSc=;
        b=nnVHDetLa30viWTkWwS/CzAR3bzFefnQvlnEsDkcETE8PGjLlnnG+aXA4Z8ruaRk/U
         o2q010HkFeP9lNBKB4/n73mA/0VSMUcLW6Y4lnQrnd3M44fakx2nUmLC0aJxzSkadlpP
         W8NWKGnMDVbDJkSJ8nJ+Sz73LO8XFVdGO/+lHBt2YRjOpIQ2ydAYnnVwh4mB2wndOGRd
         kiFhDeUHCwBSMZamupsmo3VAUPD6HLpii8zeck8ArwAMbscDb5Uz5pcalItdZxa0pKsL
         1tPwpyO29/+W/VNDJMKueH0FL87ioBrI9sfbYWD7Txb678R4AHRZ7PE69ShgLO/0pcaj
         3nwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502775; x=1695107575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aU3pt53IRqOP1elGAUjUcGWsMhpBr+2bOKlb7C1dSc=;
        b=qGhk59cpRnCGEUm+6EKSykcBUmoL7H2wT+BV81g0p6YC67N0f13bSAy3G4LCT/dvDM
         DhNzW6h+WuLpqQ+NRu54FnNy2x/KD49nuNkWFcf3BdLluN2+BDw23hgWQDPZF6HqhhI8
         qcr5QhSYHn+16rMq5pS4MRBiGI+/jBx6oSjLYEh12wAQvUAwLWC0os6OItUGK/VccPqE
         YEQ+zt8pfNIbjCktAMA0lv/GWdXyXQkeJH1Rf1tatXfSb6/nqKtUz/1HtTHCEHeFwW2G
         U5Dc3KwrNfk+qZcmyz+FRQVVtTUp50aSzuxNbpqjr6vYoSWtlresNzQhhy4RbCOGdPlz
         5+sw==
X-Gm-Message-State: AOJu0YwhCFIxcjh4vDp02HqN8/IComkM2KPYIl07wyCL7ktIHYIoQ5y7
	V3IXHZlQbcO/plw1icOitBuj7kOKqW2z14M8ikw=
X-Google-Smtp-Source: AGHT+IEDPshjgKusYpa3x3doNH9zd4sVU82Od8jSWrl9Ew2xkaZ9OV2T5T3rB2/wNe04oJyZ8MNtMQ==
X-Received: by 2002:a05:6a20:9489:b0:133:bbe0:2ff1 with SMTP id hs9-20020a056a20948900b00133bbe02ff1mr9449914pzb.44.1694502775648;
        Tue, 12 Sep 2023 00:12:55 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id f13-20020aa78b0d000000b0068be348e35fsm6647495pfd.166.2023.09.12.00.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 00:12:55 -0700 (PDT)
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
Subject: [PATCH v7 11/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Tue, 12 Sep 2023 16:11:57 +0900
Message-ID: <20230912071206.30751-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912071206.30751-1-akihiko.odaki@daynix.com>
References: <20230912071206.30751-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NM+vxFtudvEw

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
index 6feb9bf22e..5799a26541 100644
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
index 7d698d0bf4..f2a669b5a0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1135,12 +1135,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
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
index bee5dc22a5..4d1f10be42 100644
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
