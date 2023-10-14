Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1908088ejc;
        Fri, 13 Oct 2023 20:40:41 -0700 (PDT)
X-Received: by 2002:a05:6358:94a6:b0:135:73b0:cc6c with SMTP id i38-20020a05635894a600b0013573b0cc6cmr32571027rwb.28.1697254841222;
        Fri, 13 Oct 2023 20:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697254841; cv=none;
        d=google.com; s=arc-20160816;
        b=iRU9YrmFPAaKSHgwSK5hYiUTuHRp0EY1ticjFpL/awjfEnne+cBzawf7ft2B5A7N5S
         MEqwFU42fQ3Kr5OTbNpnREIpc8lniA6VlvXbHRgsN7cRK9oeMoHZS3bzMms9OJCTFMxM
         uG/B6AyUJdWKuQcOhoD69JC/M35FWCr+KxXbhtoQIhRMZnMiusHSl5VJmm/R/d6l1BVm
         qoM4/f6WVztiyFU7KsTPcZTtQq8+zgnDL+LewzIUO6QyfskhmLvNAPBi5+eGhqYcpVZn
         kWF1IODsg7P2hiuxPA1V3vQSP+6IbtMNGQjsYlTCTXLkY3hmKsslw40M6+TJDuhhW/9d
         5etg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NmtiBqfjIaVyXiiNY+jOi9ILpREGdXoQgaqHfcUafpA=;
        fh=mpOoNY6HKlTGiB1ArWkyXB8BoiXZkW9x3JAK7Y+9BWA=;
        b=Q0MgRQzuA+nZLUzGV/2MOP7oodRwaic66tkLtSPJlX/MwpvBFbvhSwVMEEb+xLvj1a
         tS+Z5kX85egpibFDr90aMXBJvyilx2ALd8W2f/OHpkKw1wP1c0Wh2AA/iFwyXcv4YhZ0
         9c24i4xoVBXvhmQ4NzmRw48eOYQr4JRuMPKP2puQOFV/D3jCtHYyYTPR8qCjdku8g0Of
         uhaicYDjDWZHObMOvx6sfVbrS/X8mpFYPOxlxlZoPy1xZLev2ZxMhSzGLOYsV3FQTP2K
         91tzoVCfvJLsP/PWEe343CWIHgCoIX6NdyFHyvk6ScRK6DgTiHtWZ7qaN9S2jONokpbN
         H7rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=kGPamnvg;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e28-20020a056a0000dc00b00690fc78e47asor8620654pfj.1.2023.10.13.20.40.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 20:40:41 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=kGPamnvg;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697254840; x=1697859640; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmtiBqfjIaVyXiiNY+jOi9ILpREGdXoQgaqHfcUafpA=;
        b=kGPamnvgNhK4/7TME7oMfNT52SCJo5r4U9N/dlpjUwGGNtk5hQqdXpMrp1RqbNVJnt
         wkuNtFXV42jyetrBvH/22UoE7GRtFAE1cMiuIs1pv8P7L+0CuRwwx+4pdk6FRdr2V9zW
         m0/rP6OGGWVsg2t6qW5HkR0qT6Q4Bt3bNh9Hr/h9+OKQKlvBlMPsCRmkhDOtfuNwsIKt
         ctacVvxa9YYkCxEPimhQwB2F5GctzdXe2eBvr5Ak0GvW3iuvAfnKrYcCaWkyduAlPGcj
         tNB1qeHjh6NfaEacCBXZZTItteLhvznOMXr9D+x6QZDaMGRSxfhCDoeVUMrEtZlRbmiX
         +9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697254840; x=1697859640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmtiBqfjIaVyXiiNY+jOi9ILpREGdXoQgaqHfcUafpA=;
        b=nZ+7CBJTOv+/UhX4903qoI2xcs6kNUk5/5ic+XA1d+uWF40K4J39bsGrtwFv+7szBz
         LetTHxFlzRHs4jnGgcm/Ga4oDsZD0EZ4QApPg/YVSvzFM36h+83u3/CRiqMQ7t185S0m
         yC/jlG7iUytX0vPr1Fuk5Zx96S3+nZ001Oj//QneOsHVYv8Ac/aXTpt8AnDbUwXY4ZjS
         Q3i1Cjf4otKr3fjqzbPBfXrTuJ4365WubWNNj3g+dLhXpJlWp6WmJREzVX//txzlHE62
         jyCzGAfaqMM1DrlqQPp+csJrsH9sShIJbLM/DTsd8QKKEDDMcLgU0pMSFXXooAbh90NQ
         uH1g==
X-Gm-Message-State: AOJu0YyVjwOI0wq3m3RnXirAJ8RvzU4+95nX7e/QlPFGpBpbaSE5mPzq
	7ib8F1PsGsS37dRMRp44F43z8mofg29pWanI4pjO7g==
X-Google-Smtp-Source: AGHT+IFErarYX4acw4dviawFrI5WhpDoMsM7rrU7qJz2Gyz0gxqgQZJzeRkV8P2paFMtcuWzjX0NTQ==
X-Received: by 2002:a05:6a00:9389:b0:6b3:81ee:9bc with SMTP id ka9-20020a056a00938900b006b381ee09bcmr2607575pfb.27.1697254840518;
        Fri, 13 Oct 2023 20:40:40 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with UTF8SMTPSA id b127-20020a62cf85000000b0069302c3c050sm639299pfg.218.2023.10.13.20.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 20:40:40 -0700 (PDT)
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
	Michael Rolnik <mrolnik@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
	qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH v12 11/18] gdbstub: Infer number of core registers from XML
Date: Sat, 14 Oct 2023 12:39:30 +0900
Message-ID: <20231014033940.15679-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231014033940.15679-1-akihiko.odaki@daynix.com>
References: <20231014033940.15679-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Z5ZvkXcapq3i

GDBFeature has the num_regs member so use it where applicable to
remove magic numbers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/core/cpu.h   | 3 ++-
 target/s390x/cpu.h      | 2 --
 gdbstub/gdbstub.c       | 5 ++++-
 target/arm/cpu.c        | 1 -
 target/arm/cpu64.c      | 1 -
 target/avr/cpu.c        | 1 -
 target/hexagon/cpu.c    | 1 -
 target/i386/cpu.c       | 2 --
 target/loongarch/cpu.c  | 2 --
 target/m68k/cpu.c       | 1 -
 target/microblaze/cpu.c | 1 -
 target/riscv/cpu.c      | 1 -
 target/rx/cpu.c         | 1 -
 target/s390x/cpu.c      | 1 -
 14 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3968369554..11d4b5cd0c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -127,7 +127,8 @@ struct SysemuCPUOps;
  * @gdb_adjust_breakpoint: Callback for adjusting the address of a
  *       breakpoint.  Used by AVR to handle a gdb mis-feature with
  *       its Harvard architecture split code and data.
- * @gdb_num_core_regs: Number of core registers accessible to GDB.
+ * @gdb_num_core_regs: Number of core registers accessible to GDB or 0 to infer
+ *                     from @gdb_core_xml_file.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
  *           before the insn which triggers a watchpoint rather than after it.
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7bea7075e1..83eafbe4b1 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -452,8 +452,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
 #define S390_R13_REGNUM 15
 #define S390_R14_REGNUM 16
 #define S390_R15_REGNUM 17
-/* Total Core Registers. */
-#define S390_NUM_CORE_REGS 18
 
 static inline void setcc(S390CPU *cpu, uint64_t cc)
 {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 7e4a6bd167..625a3347c3 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -541,9 +541,12 @@ void gdb_init_cpu(CPUState *cpu)
         gdb_register_feature(cpu, 0,
                              cc->gdb_read_register, cc->gdb_write_register,
                              feature);
+        cpu->gdb_num_regs = cpu->gdb_num_g_regs = feature->num_regs;
     }
 
-    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+    if (cc->gdb_num_core_regs) {
+        cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+    }
 }
 
 void gdb_register_coprocessor(CPUState *cpu,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6c6c551573..6d9bf6a14e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2391,7 +2391,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1cb9d5b81a..5c7a4a0bf7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -792,7 +792,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 14d8b9d1f0..01adfb5089 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -244,7 +244,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
     cc->gdb_adjust_breakpoint = avr_cpu_gdb_adjust_breakpoint;
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "avr-cpu.xml";
     cc->tcg_ops = &avr_tcg_ops;
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 60d52e1e9d..7c1426f70c 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -385,7 +385,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = hexagon_cpu_get_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
     cc->gdb_write_register = hexagon_gdb_write_register;
-    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
     cc->gdb_stop_before_watchpoint = true;
     cc->gdb_core_xml_file = "hexagon-core.xml";
     cc->disas_set_info = hexagon_cpu_disas_set_info;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3aab05ddad..fa63ce9311 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7968,10 +7968,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
     cc->gdb_core_xml_file = "i386-64bit.xml";
-    cc->gdb_num_core_regs = 66;
 #else
     cc->gdb_core_xml_file = "i386-32bit.xml";
-    cc->gdb_num_core_regs = 50;
 #endif
     cc->disas_set_info = x86_disas_set_info;
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index ef1bf89dac..1b25920895 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -775,7 +775,6 @@ static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base32.xml";
     cc->gdb_arch_name = loongarch32_gdb_arch_name;
 }
@@ -789,7 +788,6 @@ static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_arch_name = loongarch64_gdb_arch_name;
 }
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 538d9473c2..5fdbe5602b 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -565,7 +565,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 18;
     cc->tcg_ops = &m68k_tcg_ops;
 }
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 1998f69828..9d3fbfe159 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -428,7 +428,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
-    cc->gdb_num_core_regs = 32 + 25;
     cc->gdb_core_xml_file = "microblaze-core.xml";
 
     cc->disas_set_info = mb_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 88f1876aa8..459a9faa7b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1580,7 +1580,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #elif defined(TARGET_RISCV32)
     cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
 #endif
-    cc->gdb_num_core_regs = 33;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 4d0d3a0c8c..7b9e46d1bc 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -235,7 +235,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "rx-core.xml";
     cc->tcg_ops = &rx_tcg_ops;
 }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 6093ab0a12..f49ee0bb46 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -346,7 +346,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     s390_cpu_class_init_sysemu(cc);
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-    cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
     cc->gdb_core_xml_file = "s390x-core64.xml";
     cc->gdb_arch_name = s390_gdb_arch_name;
 
-- 
2.42.0
