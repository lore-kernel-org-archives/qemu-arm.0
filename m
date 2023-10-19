Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp410554ejb;
        Thu, 19 Oct 2023 03:28:01 -0700 (PDT)
X-Received: by 2002:a05:6808:144b:b0:3a8:7f65:a96 with SMTP id x11-20020a056808144b00b003a87f650a96mr1920661oiv.33.1697711280841;
        Thu, 19 Oct 2023 03:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697711280; cv=none;
        d=google.com; s=arc-20160816;
        b=b/c5FwzReaYv6+ppWaAyKka2skYvcvtGJrS50fk+RE/3exgkoDDbML3fllCP7rC93R
         NBBeiJcNZHTPfymXJdDQeQufk1GZFzbTblftQDL5i4CUG0Z38xBlBno77l7umym4dRGm
         HolvOYXjEkmRJJ4txc8+FdCHH/2SR4yFAk42jrxYUcveNstTLZwvC1ey/GcZTlygnAO3
         3rHNqY8WfJB8PRvVB3rwO2exW8WH7n4p13sS4weL0p48T2TAE1yFR/4rIlSNKYBft+U5
         RSYUrg33onDKW+xHhPfkn8KLy9zG7/cQukyUEZsHNLapUs0ZonGYi7XQu1bUTOIG4TOa
         tOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+gSFK0w8uGaX2iZdKgsaqPhRSKhp5B/tzJeHvAaZAr0=;
        fh=+WFMh0181Mx/49LvEX2Ix7tmLG2L1hnQ9F6FhRsEv80=;
        b=rU0OmVf0rkHTQwdfK1iaaVTxCoqs422S3upgzJYS0Ta2tR37+K0ITkNzF323gGjy1f
         LPsdLecOa8ZY33htsI0x+8J2KjiOEw0imm19xGsWDH2KfC17YdMCIN/3ifuGwUHg2HwJ
         xULhuzVZHjgs4ca/wjfmZoCNnYlUCWvHwGuBmfHJ1Tlzj5vLLkZy9lUi+W+qNyCClnfO
         jXyV573zseYk6sqvW2H7yye8XOkOYB514Na3EHlXQpyaeOF9YBzcaxkJotHsPO5LrVud
         MIJOPs9t14VqziUEaDBQZS6YM9wXkZ4XFCDw9VcaVinFz9kAYIbHPMQynqq+XDnh1ax5
         dMSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=amjtj0K+;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dl9-20020a056808614900b003a8895ba8absor3544499oib.14.2023.10.19.03.28.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Oct 2023 03:28:00 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=amjtj0K+;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697711280; x=1698316080; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gSFK0w8uGaX2iZdKgsaqPhRSKhp5B/tzJeHvAaZAr0=;
        b=amjtj0K+3k8+xU4P+r8+odLVBWO8OXeLsZ5urdjETe3eZPENZjcFr3o+rJMwYIqmkP
         rcf68uE9kdmql7FL5ltMSiVclMW7pBRsKk24Rc858g1Rt991WpLzG0br532OL6OaC0dW
         9RzCnqAKx7WgA/knG4f49BjalcItHeB8jgiHKmWU53EasYMpv5JKmmC0E1mMpcML3pk5
         pe4BtRS4vPlGdiT7uw1vF2I/P6E78+/VhSf9c1iYqXe2b4CRkNG040guZb9AqQ1YYj+9
         goIJM7+uL/AMqNPREivMuYebi/845w5izczcOWpLg1u6dG8i+LQlgnRd7MOEe4ZMRef1
         ycYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697711280; x=1698316080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gSFK0w8uGaX2iZdKgsaqPhRSKhp5B/tzJeHvAaZAr0=;
        b=DN7m3TQsCPOPNYFJs5y48jLVa+HXPIg1lKeW2INmvrdagfchtMtbfwuEOo5P1GfCAj
         QRgBRfQqKk6VgG4IH+QW9zYsO7Q+7xjgAtos0RkNiU47godQZLtvv4HMHOmJp0HKe7Zu
         vY7oCg7IbHZguOCurwOwhpHDSOvLK2ZFnb3L707OK0HEQKpD9k0muBKpvrQ0VlKOZPfp
         YcPgkSjAHawGwNoATsqs8z7Rh8QCt1JI+Fk4ewp/fc0eIZ48q5H+B64OJtCnNPINkQxk
         AUYq9ork5K6w3SSg43yhabM5DvBdOoS+pZZHnKKW01BUgAoj8904B87fPvz3JbCOA4et
         UcBg==
X-Gm-Message-State: AOJu0Yyr3STOZXBSa6kDAMK6HBabBUOKhiW1n4zj3VkYRj6FkheUiben
	w/fKEPqK/MdBE8X5SWgj/MsWkoS/oXdVA49PY0E2zA==
X-Google-Smtp-Source: AGHT+IEpEeNbT1qycvMBCpqniLNUNbhQcilW1TzMR1lLZBp2s9mw0+CZk1lUnKcINOXm4TY4fejfPA==
X-Received: by 2002:a05:6359:650b:b0:142:d1cb:48ab with SMTP id sk11-20020a056359650b00b00142d1cb48abmr1207002rwb.15.1697711280219;
        Thu, 19 Oct 2023 03:28:00 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with UTF8SMTPSA id e10-20020aa7980a000000b006b90f1706f1sm4821364pfl.134.2023.10.19.03.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 03:27:59 -0700 (PDT)
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
Subject: [PATCH v14 11/18] gdbstub: Infer number of core registers from XML
Date: Thu, 19 Oct 2023 19:26:46 +0900
Message-ID: <20231019102657.129512-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019102657.129512-1-akihiko.odaki@daynix.com>
References: <20231019102657.129512-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MXRy2P8BKwH4

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
index 332f9c6ffc..78d0bf5858 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -547,9 +547,12 @@ void gdb_init_cpu(CPUState *cpu)
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
