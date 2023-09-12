Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1841827ejx;
        Tue, 12 Sep 2023 00:12:31 -0700 (PDT)
X-Received: by 2002:a17:90a:8684:b0:268:798:a28b with SMTP id p4-20020a17090a868400b002680798a28bmr2277430pjn.23.1694502751359;
        Tue, 12 Sep 2023 00:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694502751; cv=none;
        d=google.com; s=arc-20160816;
        b=UVxxIOZf2Z48yygPfCbWik9AN4Eon7+HL/qfv1cwgHEg7OihGqTZq59ACXuQsDiH5s
         88dw+oOMqI0pCpfbsUzf8R6t72ZBPCDcgaubSTYjNI5AhdJ3GY+SEnYJ3QpA5n31txlR
         G5ZdAcRfwz0u9grl0k9Se5rqD9llbZTG0arWoxzAiB6vaHq6NQFwkPuPXlz7Fkfk8vqN
         y4SdOVUd0h+0IhCeWTTDEcfOzlYztVHQkTJnZTBekP7eB7Q9sxlIDJF6l5PmphCX26XL
         cx3WmK/yQz3AqrdBahdfP5KVCc4M5gRSeNZSpFTNF4V+sPU88dUbC6KhLdN6/j4GrGYE
         4B1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aJrjmSx72mjt81zJ+nGHKdsU4ZqctUvLQl3Z6ws8Ecg=;
        fh=K1wcZ8W0zSS9JbDdlDCHKxRyu+RGkXiMnqWwX5kKTPk=;
        b=xVFWZQjJU9Jd/TQMfGk9zvxtlDC9A08D7vCHle+DbxKyCEg75ZtUWTtPeCQDbTRNGY
         czOIyqqb+RUNxLbmkM1gCMiOt4Js8MJ+kt6eolFxGwAqe5Y96SAp5o1lOysRpEF7H9ZN
         WH+mzwfwrEO84mVMHB4kYYMxtSkbIlq4Cy1/p5rpD02NZjzgL3vtnEhU8iqq7csH6Pod
         TqBMqxTHPu0YX1ILnhxrPDn5xRbz+FGpdnUWh3CJ8Wrc4eDgMHPx4zmp7JBmqefEhZ3V
         H/u2jXo/czszqodLZqIgaBROilyWNJ3kMShS4anqkuGnm3lK/fpRJU+raYKkbzGFG2Yo
         PvPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=mb682Ohw;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m7-20020a633f07000000b00573f873b0f3sor4473795pga.2.2023.09.12.00.12.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Sep 2023 00:12:31 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=mb682Ohw;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694502751; x=1695107551; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJrjmSx72mjt81zJ+nGHKdsU4ZqctUvLQl3Z6ws8Ecg=;
        b=mb682OhwVYUAOSmC0jqdfoaQRleF0wss8QKEAQBv4kGW6yv6B0PPkcl7ZLN931J436
         S2F5Q7kwXGFP/wDeECtXeNPHhXVhL5+CYx9dO1mGhGV2tA+15uj1v+Av+NIbd0Bfw+bw
         Tyn1ruh66Us0kABB2su9N6aGJ43V9HlzigYr/cOAYdps1AoeWUdBnxzxRzDBuxB3arCe
         EDqt8KsLabqtW9dLMQPnXfLVqDLZRry/G7R/P/WHFd4WL3Mob5fSRJiGUld+m/Os+Vbz
         laZPGAIUfOqWwIaEMkgnDHv+2MkndGFIuvNP7nx5r0nn5GNJa+5kX2r+6khxpjbBWs36
         RBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502751; x=1695107551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJrjmSx72mjt81zJ+nGHKdsU4ZqctUvLQl3Z6ws8Ecg=;
        b=clewCN9hiQu85Da0XMojO9CdveTbf1n8R4zjoFlgi8Rd1JBzBwJspSavelAOxpP/ag
         7InjlwCI/TBVBmhTyizHObJHDzeImA0/Rrnw/5dh1rziAdJV0Q1/8ALgyE0pFlEsKE82
         wJv0BmcrGMwuxYMLmUBNrr9/HBoz8TdH5n7/Uv1POwLq5iuSpPZzmJhtxNguIO7STz4p
         TRPhJJBsTgIAmbdz2JBIv0VZJ1ySjM4aS0h1CA3vjJrgVEbgZSLGUezkF3yz2mYDTvEd
         QcFTBf4/pdhhx4Zf+xKFHMAlPjMkFFp4hZjAsijzMKBEFqlK+hRt0O6n/y7cDioAVKG9
         +IaA==
X-Gm-Message-State: AOJu0YxXe7AyrRhb+ZNvXPowMBOnP2sPPu6oM2rcVVysdPmA0/zUKJvm
	LDLfH5GT6cu+2A/UcjJlZ3uUKo9bkJJmAi20FZg=
X-Google-Smtp-Source: AGHT+IE+k0BUBvL9icqHM50ab4kRnGhzSgxlt5rcoo7PP9UM9UNmAuaRWvScbioR7kSodlokzkfG9A==
X-Received: by 2002:a05:6a20:a103:b0:134:73f6:5832 with SMTP id q3-20020a056a20a10300b0013473f65832mr2649400pzk.16.1694502750559;
        Tue, 12 Sep 2023 00:12:30 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id f13-20020aa78b0d000000b0068be348e35fsm6647495pfd.166.2023.09.12.00.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 00:12:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
	qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH v7 03/18] hw/core/cpu: Replace gdb_core_xml_file with gdb_core_feature
Date: Tue, 12 Sep 2023 16:11:49 +0900
Message-ID: <20230912071206.30751-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912071206.30751-1-akihiko.odaki@daynix.com>
References: <20230912071206.30751-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2Wg7TYPFoKvq

This is a tree-wide change to replace gdb_core_xml_file, the path to
GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
also replaces the values assigned to gdb_num_core_regs with the
num_regs member of GDBFeature where applicable to remove magic numbers.

A following change will utilize additional information provided by
GDBFeature to simplify XML file lookup.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/core/cpu.h   | 5 +++--
 target/s390x/cpu.h      | 2 --
 gdbstub/gdbstub.c       | 6 +++---
 target/arm/cpu.c        | 4 ++--
 target/arm/cpu64.c      | 4 ++--
 target/arm/tcg/cpu32.c  | 3 ++-
 target/avr/cpu.c        | 4 ++--
 target/hexagon/cpu.c    | 2 +-
 target/i386/cpu.c       | 7 +++----
 target/loongarch/cpu.c  | 8 ++++----
 target/m68k/cpu.c       | 7 ++++---
 target/microblaze/cpu.c | 4 ++--
 target/ppc/cpu_init.c   | 4 ++--
 target/riscv/cpu.c      | 7 ++++---
 target/rx/cpu.c         | 4 ++--
 target/s390x/cpu.c      | 4 ++--
 16 files changed, 38 insertions(+), 37 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c84c631242..6feb9bf22e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -23,6 +23,7 @@
 #include "hw/qdev-core.h"
 #include "disas/dis-asm.h"
 #include "exec/cpu-common.h"
+#include "exec/gdbstub.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
 #include "qapi/qapi-types-run-state.h"
@@ -127,7 +128,7 @@ struct SysemuCPUOps;
  *       breakpoint.  Used by AVR to handle a gdb mis-feature with
  *       its Harvard architecture split code and data.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
- * @gdb_core_xml_file: File name for core registers GDB XML description.
+ * @gdb_core_feature: GDB core feature description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
@@ -163,7 +164,7 @@ struct CPUClass {
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
-    const char *gdb_core_xml_file;
+    const GDBFeature *gdb_core_feature;
     const gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index eb5b65b7d3..c5bac3230c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -451,8 +451,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
 #define S390_R13_REGNUM 15
 #define S390_R14_REGNUM 16
 #define S390_R15_REGNUM 17
-/* Total Core Registers. */
-#define S390_NUM_CORE_REGS 18
 
 static inline void setcc(S390CPU *cpu, uint64_t cc)
 {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index fd73d6d257..9044b44954 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -384,7 +384,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
             g_ptr_array_add(
                 xml,
                 g_markup_printf_escaped("<xi:include href=\"%s\"/>",
-                                        cc->gdb_core_xml_file));
+                                        cc->gdb_core_feature->xmlname));
             for (guint i = 0; i < cpu->gdb_regs->len; i++) {
                 r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
                 g_ptr_array_add(
@@ -1531,7 +1531,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
 
     g_string_printf(gdbserver_state.str_buf, "PacketSize=%x", MAX_PACKET_LENGTH);
     cc = CPU_GET_CLASS(first_cpu);
-    if (cc->gdb_core_xml_file) {
+    if (cc->gdb_core_feature) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
@@ -1573,7 +1573,7 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
 
     process = gdb_get_cpu_process(gdbserver_state.g_cpu);
     cc = CPU_GET_CLASS(gdbserver_state.g_cpu);
-    if (!cc->gdb_core_xml_file) {
+    if (!cc->gdb_core_feature) {
         gdb_put_packet("");
         return;
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a13c609249..bee5dc22a5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2388,7 +2388,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2413,7 +2412,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(acc);
 
     acc->info = data;
-    cc->gdb_core_xml_file = "arm-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 void arm_cpu_register(const ARMCPUInfo *info)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6b91aab6b7..65f84bfb18 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -754,8 +754,8 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 34;
-    cc->gdb_core_xml_file = "aarch64-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("aarch64-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->gdb_arch_name = aarch64_gdb_arch_name;
 
     object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 1f918ff537..bc42695af5 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -1040,7 +1040,8 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
     cc->tcg_ops = &arm_v7m_tcg_ops;
-    cc->gdb_core_xml_file = "arm-m-profile.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("arm-m-profile.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 #ifndef TARGET_AARCH64
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 8f741f258c..217adc64cb 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -246,8 +246,8 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
     cc->gdb_adjust_breakpoint = avr_cpu_gdb_adjust_breakpoint;
-    cc->gdb_num_core_regs = 35;
-    cc->gdb_core_xml_file = "avr-cpu.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("avr-cpu.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->tcg_ops = &avr_tcg_ops;
 }
 
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index f155936289..b54162cbeb 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -391,7 +391,7 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = hexagon_gdb_write_register;
     cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
     cc->gdb_stop_before_watchpoint = true;
-    cc->gdb_core_xml_file = "hexagon-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("hexagon-core.xml");
     cc->disas_set_info = hexagon_cpu_disas_set_info;
     cc->tcg_ops = &hexagon_tcg_ops;
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5678b52472..58b7f28e8f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7967,12 +7967,11 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
-    cc->gdb_core_xml_file = "i386-64bit.xml";
-    cc->gdb_num_core_regs = 66;
+    cc->gdb_core_feature = gdb_find_static_feature("i386-64bit.xml");
 #else
-    cc->gdb_core_xml_file = "i386-32bit.xml";
-    cc->gdb_num_core_regs = 50;
+    cc->gdb_core_feature = gdb_find_static_feature("i386-32bit.xml");
 #endif
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->disas_set_info = x86_disas_set_info;
 
     dc->user_creatable = true;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index f88cfa93ce..d58f5cc143 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -772,8 +772,8 @@ static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
-    cc->gdb_core_xml_file = "loongarch-base32.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("loongarch-base32.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->gdb_arch_name = loongarch32_gdb_arch_name;
 }
 
@@ -786,8 +786,8 @@ static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
-    cc->gdb_core_xml_file = "loongarch-base64.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("loongarch-base64.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->gdb_arch_name = loongarch64_gdb_arch_name;
 }
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 70d58471dc..2bd7238aa8 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -572,7 +572,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 18;
     cc->tcg_ops = &m68k_tcg_ops;
 }
 
@@ -580,7 +579,8 @@ static void m68k_cpu_class_init_cf_core(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_core_xml_file = "cf-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("cf-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 #define DEFINE_M68K_CPU_TYPE_CF(model)               \
@@ -595,7 +595,8 @@ static void m68k_cpu_class_init_m68k_core(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_core_xml_file = "m68k-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("m68k-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 #define DEFINE_M68K_CPU_TYPE_M68K(model)             \
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 03c2c4db1f..47f37c2519 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -428,8 +428,8 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
-    cc->gdb_num_core_regs = 32 + 25;
-    cc->gdb_core_xml_file = "microblaze-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("microblaze-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 
     cc->disas_set_info = mb_disas_set_info;
     cc->tcg_ops = &mb_tcg_ops;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 02b7aad9b0..eb56226865 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7381,9 +7381,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_arch_name = ppc_gdb_arch_name;
 #if defined(TARGET_PPC64)
-    cc->gdb_core_xml_file = "power64-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("power64-core.xml");
 #else
-    cc->gdb_core_xml_file = "power-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("power-core.xml");
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ef8faaaff5..48f1426299 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1031,11 +1031,11 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 #ifdef TARGET_RISCV64
     case MXL_RV64:
     case MXL_RV128:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+        cc->gdb_core_feature = gdb_find_static_feature("riscv-64bit-cpu.xml");
         break;
 #endif
     case MXL_RV32:
-        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+        cc->gdb_core_feature = gdb_find_static_feature("riscv-32bit-cpu.xml");
         break;
     default:
         g_assert_not_reached();
@@ -1045,6 +1045,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
         error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
         return;
     }
+
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 /*
@@ -2138,7 +2140,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = riscv_cpu_get_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 33;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 157e57da0f..b139265728 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -239,8 +239,8 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "rx-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("rx-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->tcg_ops = &rx_tcg_ops;
 }
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index cf4b5e43f2..ca356c2b86 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -348,8 +348,8 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     s390_cpu_class_init_sysemu(cc);
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-    cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
-    cc->gdb_core_xml_file = "s390x-core64.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("s390x-core64.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->gdb_arch_name = s390_gdb_arch_name;
 
     s390_cpu_model_class_register_props(oc);
-- 
2.42.0
