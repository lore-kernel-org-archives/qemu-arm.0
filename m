Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp794982ejc;
        Thu, 12 Oct 2023 06:07:25 -0700 (PDT)
X-Received: by 2002:a17:902:f54c:b0:1c1:e818:1e76 with SMTP id h12-20020a170902f54c00b001c1e8181e76mr31727557plf.6.1697116045600;
        Thu, 12 Oct 2023 06:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697116045; cv=none;
        d=google.com; s=arc-20160816;
        b=DVyaLBa+rw72JIkLPhToR1eabMB3Kdj2t1n7ajkvmyKLnqdU1Yd8nuL7B/vzQn0Gqm
         1UrubiqYofHWGIZnpaN4xfFLs839UOxVcPZ7QsVkAHErq5xn2yKPTiqDLCsKDFCm5BM4
         mnsIwKB/4m5Q8XbzZQy4rj2VFyllboCerIUxg6tGWufUeViSR1CGMsBJGvm3PqOTvdps
         iRM81U9NFwNyzR2kNNWGlRFltM0ppYIL7FqX+RWAlXjbbqIdlO1U60vOHdPKGRyImJWH
         yGujTs25CpcRLNlO412GDJf9mJiGdisnsVdZBN0/c4ZwRaQ0ezNGW2mERaxwTW8FXVsG
         gfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YNOwbY4r2y9Vu7MFsYpfzT/FYrv6FXwws8lwE8s/vgY=;
        fh=lW42IFciQRcgi2TpW76JzOW6yI8fNIuUaAjcfrG2GK8=;
        b=aiqKUedY/mR1dAibiUsuLBYNqXYAoKIkcoswgq4T6XLP/S0EUPsFeRZHHvGtWZysgY
         xWPmcVNILty9yJStYpR8w9+fG++M/xmEKbI+YLIsyZ4dwLc+oxE8sCnbhZ9XukU9DhKI
         gi0V680BYSozHKMl/lC+g8zOd0OIaF1vmtSvDr3e3lJQvP5Qu5ney6pnQwyZuOjBX5yI
         Mkv34O7xAWvPkH8RM9qEBCBsKW1wdr23/28n2dDyegcHf/mjWXajS03h4AsNAgd1G75U
         JirMr22PLdpku9Bs5V9D4vqrtpt8rOVrY9/U4MuQOdGzK/D3LA7PHP4luX+HiUr4gl3h
         sFmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=DR5sCHG8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f19-20020a170902e99300b001c9b1de5ae4sor868845plb.7.2023.10.12.06.07.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Oct 2023 06:07:25 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=DR5sCHG8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697116045; x=1697720845; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNOwbY4r2y9Vu7MFsYpfzT/FYrv6FXwws8lwE8s/vgY=;
        b=DR5sCHG8thGz9C8Kk4gBwM6/J9w7tp+Em0eJArDI5hFKFBz3+t0xe/MZ2X+d1MMyNB
         6Jm1CzRX+2OAodGbDDsay0sm0FIkET4K4l3YT0fF27B+KLN3gDd4kvElqW0wZw3yniIC
         NVAa5opCiMbHdxzi8w6ad7t30wV2cJ4Qr5oFw1U6lRxEQq9mNTnESNaM/5tMaPXnCjcJ
         13WCPWJBOzOxUdtEz/d0Vvh0NDq90Vh1TOAjQIwI8AdTipd2VD2tmKSRMzi5smU/SCsA
         yaPzSNX5WGHd6d2FuTQFWQBzayVph9767EUE9kXa10ufrg/+Hd32fj/FPY4JlcYYz3yc
         gCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697116045; x=1697720845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNOwbY4r2y9Vu7MFsYpfzT/FYrv6FXwws8lwE8s/vgY=;
        b=tVBCpgA3SvYQBI5b6q0FD19vxoufPPuU/O0xgg/y0Ya8YZJhQb7RkB+ARjqnIkwQEg
         HBXQVlRDOJUMFiOAQZqLLgBBuhp3IMzYqir797cMoK536mIT+NVJwi9bLWcLPHoedCKD
         g+nTWXkIGO5o1xgqA7KF/9W8gpItVgmnsdk+IpGTI+rey8MtwxQjSQXg+PxFhv1x6h+T
         T1HDJJGF4xXuS6cQxuQE0gRNFiZtxyVavF/tXZI4tychT75z45Rme6iRKfnwjOjLuW3l
         fZvPyQYlxOHEJ1Q6lTb0GLRWAXfoXltX92sqPq8Lc2AvL3F/RtgUZ7aL+pCIKuaCe7n2
         TtsA==
X-Gm-Message-State: AOJu0Yz0gyuAqAHb3KEcljy15hGMPLxee7N6305Htic3tZ2kYyjdcBT2
	BczUs8UmAVXWdHD65JRBaoMgCBYmG+dsTfCq5XFVNg==
X-Google-Smtp-Source: AGHT+IH19RhsyDwihEtxvL89i+24I71YuX25hAK+69NYIw3D8kohtMYMyhJUUu78JZUQk1Ci9tQHOA==
X-Received: by 2002:a17:902:e74f:b0:1c9:d422:2833 with SMTP id p15-20020a170902e74f00b001c9d4222833mr6044316plf.29.1697116044837;
        Thu, 12 Oct 2023 06:07:24 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with UTF8SMTPSA id x5-20020a056a00270500b006889511ab14sm11747920pfv.37.2023.10.12.06.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:07:24 -0700 (PDT)
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
Subject: [PATCH v11 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Thu, 12 Oct 2023 22:06:06 +0900
Message-ID: <20231012130616.7941-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012130616.7941-1-akihiko.odaki@daynix.com>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pkXThkVE/SyY

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
