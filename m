Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2509053ejb;
        Tue, 24 Oct 2023 22:28:47 -0700 (PDT)
X-Received: by 2002:a05:6808:20a1:b0:3af:b2bd:daba with SMTP id s33-20020a05680820a100b003afb2bddabamr16619002oiw.56.1698211726978;
        Tue, 24 Oct 2023 22:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698211726; cv=none;
        d=google.com; s=arc-20160816;
        b=PfocnkY3Jcjwurt3bDSRVnCJWGr4WA1Z05Gr+iNy4p+V4hqApcaI9o//J81nZBRanO
         bONR4UVIRCY//5tMQFBrXgx07uEsXfcjZT4xnQbaaHGDiSfsirLdnWl06NaxgPkGaQZ7
         iWEcFRgSKDvqk8cj5nIU3hZmPVt1tTcwoa1GDoycRxkodoNAjDM8D9GLOJPGCK7h8gMt
         Gl6Aqdcy8SHSkya7+q6iRHrijDnYFONE9GCXFGchsJbxbypxb9vZtfvh8Rx45fjgpC2N
         Uhi7LDMji/QraCfWGc/nL0AKOE4Qekmkno8p7KwILZxLcqO5Ukrlh75B0Z65BChBoEKm
         tDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5BpgaRfa71Bj/S6XqzIB4xjEmlZSYzERjy7EcwLBeFQ=;
        fh=+WFMh0181Mx/49LvEX2Ix7tmLG2L1hnQ9F6FhRsEv80=;
        b=vYFGnp+lLRzXKa7sQEJA5Z+jHulHTcGvLYJE24UBGcoGF14vFhEgSFYn2hklwldHI7
         BDjcnpGw/rbbP0EOnpJ5jaqNSHg3h5IxEdHSbdEhvYtDRsriLy2AEAVN16pP9EIpKDEF
         MwvM0yrV3OTx8OnzIdm9QSNnWdYy4xGBU2q+TfSsJ3OxvI4aKuN5oxTdC0LJqCKsWfU6
         rmWOnLrwpJ5tLRkeV/jpqNjsSEg8CR2SozWqLvi2HUo8ZVXLnMUCVyY9KNg1wfIvYm5d
         H/16JBs92XQ30eFe2/EM4FEeWZbmtRcdwCoia7JuT0NTDvCvMP6+iZQbE9Xmb98sNV2t
         cRaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=2mOIHKmp;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bm17-20020a0568081a9100b003afe67c19d3sor6542744oib.15.2023.10.24.22.28.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Oct 2023 22:28:46 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=2mOIHKmp;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1698211726; x=1698816526; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BpgaRfa71Bj/S6XqzIB4xjEmlZSYzERjy7EcwLBeFQ=;
        b=2mOIHKmp3Oy8Z1c4ccKevp67on3PZO6W3QtDGrbRYSJ/XCtwawxbuDfPvOs/G132Bg
         lmFvpZHB5iAU6aFm0+aWEauIdfutvTfm6B8b95XRL5DtFIL1y5vo4lOcwN+m/bU6JUTE
         H4LlS4qv9l0IPVMNUJ6j7gaX4HPHKhz5SpPWPy0yXVHz3vLMWOdX1R41cmM/vN0I4yW9
         ANkbirRVi3kl/zRr3ZxAdhCRS2P0X1uq4k/shUdMWXikIVT4RyOL6w1rUxhId8qBegSj
         gVnEkTSVSbL8RR5mWXMwGXEEuW8xWnZEsUkE5l18NXLzmbmuO42A2A9GhhflrCRVdx7I
         swBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698211726; x=1698816526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BpgaRfa71Bj/S6XqzIB4xjEmlZSYzERjy7EcwLBeFQ=;
        b=XDXwrvt2dzNqYtqCxp/s1SN9fRDMyJpdACtxLikHtP/yWAeu5nGvDMr2ZPXGEpHQVM
         XfJF6kHOQF8Nb7NozkLRJLh43QsJZRjn8tc7A/7snqx5/MsctVv7buq1Fcn08uIHqk2m
         t5PNcTbs6YlQvVFRw19ewrv9EodqynuTrUD3RGr0HXioDZk+j/hCw+Xj3oZlZBQXGGgN
         SKuHDJ/fzxGOIRxeSLpR8yw0akoHd5scJE5sj70HFP/6IzgmAy3c46t2GfqHf4BZkvZj
         HKUkMjgQMes+htz/SRYBnYTeKYdfz9YANybvgbCYP4OBeRuvSwAlYVo232xGFYfvJSDO
         4wJg==
X-Gm-Message-State: AOJu0YyMrNqvzXOK+Y1fA/G7pyIAJ64DI6KpGtDygoLu5maXzzyRIwe2
	WcxCTtv4ei4SpQBifuFse+IH+GG9HW3VzjirKkOpsw==
X-Google-Smtp-Source: AGHT+IFRIf2a/4K5xRT3Gs+rmuKG9tKgN5xq1a3dP8x+Ux2ml6fyCjuU+/F2HP/rjUpU51zYGl4NRg==
X-Received: by 2002:a05:6359:2d85:b0:168:e467:1ab2 with SMTP id rn5-20020a0563592d8500b00168e4671ab2mr6259144rwb.3.1698211726325;
        Tue, 24 Oct 2023 22:28:46 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.207])
        by smtp.gmail.com with UTF8SMTPSA id f20-20020a056a001ad400b006b2677d3684sm8503497pfv.206.2023.10.24.22.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 22:28:45 -0700 (PDT)
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
	Laurent Vivier <laurent@vivier.eu>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v15 11/19] gdbstub: Infer number of core registers from XML
Date: Wed, 25 Oct 2023 14:27:33 +0900
Message-ID: <20231025052744.20697-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025052744.20697-1-akihiko.odaki@daynix.com>
References: <20231025052744.20697-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: g4hbJM1K+RBm

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
index 5ecd1f23e6..af63b5d159 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -546,9 +546,12 @@ void gdb_init_cpu(CPUState *cpu)
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
index 5e083b5798..3ee1e6ae03 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1586,7 +1586,6 @@ static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
     cc->get_pc = riscv_cpu_get_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
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
