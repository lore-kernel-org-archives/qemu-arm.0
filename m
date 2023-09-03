Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp604237ejb;
        Sat, 2 Sep 2023 22:03:55 -0700 (PDT)
X-Received: by 2002:a05:6808:1887:b0:3a4:f8e:d798 with SMTP id bi7-20020a056808188700b003a40f8ed798mr9362828oib.36.1693717435215;
        Sat, 02 Sep 2023 22:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693717435; cv=none;
        d=google.com; s=arc-20160816;
        b=nMhb40JOfFV2i9wFOMexvYCWRaLki3qgkNkUAKx92wD2AA767m4ACbR6uWe7hhnuj2
         CSReGjD+8BQHVUxYGZM+Z/mz7OPuq9uiuX4iA7DwqbFiuB/JRc8oBx9OKmEtrqOnOUT6
         hbYCpeKpwhSB6u4kOWxoUwBVnxk/I4irDQnfy7+m7ryAdY1bZRPfyDMeczX3D++Cqv6n
         DCvsBYDccr4wOTsKAOCvk8DxhFe5XSKqZPFV31MTIlfKgP/ckmlU17R3oMzLHc2Yzn1h
         1vCrf/HLfwjYn8faecMS/D0J2+Pnw0s0MHriyDZCu6EgPWXQudRZNvwdF/HJIXU0WBKT
         gchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WxefV1DdrgIs8tFwdEhuIE7hkTxtadFV0c0B17hthig=;
        fh=iimWCbUCDxaSctCk9nK2xVv+SRLiKiz3jY6L++/Fqy8=;
        b=dpJTDJWo6LXgiNtUO8qC4ELFSZ9zr0wjlxK1CGezBjdbynA+K24FyURgL5W/AjKs/C
         MQpNavAL6A3P0Hgi55tr12vclrBCiOMS892gmh15ImytX0hFuKpwbb1xcOnt7vVFC1lc
         q1Fl93iva0uYF6KjPBOxatFqo0El306YD1pa6Evsopu4xsBm5h0fQsLigbFxY80aYyje
         UV9CMWmHC4AZOddUA9na/lV3GEW3xuINZ16M01PsW2rhCiK8+SPU3NenYRy6M64uQqYK
         HpSbuBuq1IPNfPQ4MHjwaSkl4kelKlTvVdci+4AU0ygZEedND9wr7ILyMfwXK5JsvWov
         GBRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rh1FQzg+;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z6-20020a056808048600b003aa13208fb5sor1325463oid.2.2023.09.02.22.03.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 02 Sep 2023 22:03:55 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rh1FQzg+;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693717434; x=1694322234; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxefV1DdrgIs8tFwdEhuIE7hkTxtadFV0c0B17hthig=;
        b=rh1FQzg+/igPb3GO+hC1NGFKCjYAhAYE2qe0NIaGdmMeLrEMDdwe63DfrNs029QAMz
         76kBOp222tZVmZ6zW0elL+Dcs5t7juTnK5EB8AXtYD4MA3Fp3ITZYqs9yM20aJZXSebS
         LDumvNLf2cuuCl7fw68RuC7VZMxOabHHbI9ZNxOlf0stbBu6+j4oqxBEkFZSdnu9O9UF
         jpH0LgtqHfLuPfJ8bOf+6HD1mk+5B/47MEmWBs3usVVupzSboON3wzpc1QLkVHcg8J5I
         ex2UCjirNMSJFgLnYs8ATr5tCA3NRJppA+pDtBytQXrXrmcYbaJ3ev3HIZDZXOV7qpUe
         BjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693717434; x=1694322234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxefV1DdrgIs8tFwdEhuIE7hkTxtadFV0c0B17hthig=;
        b=eXpQ9OsCNLUoiuFxjdzpp0NRkLuc9EO7IuKlgbQWZb59Fu+eOOJSZ5Y1AGN6oQEIv6
         zLplHH7EkN1Pi3/8TbrvUZUxN1tiM4LbjnlSWCYw+1/8gp3V8J9nM87cVsivRDOjVLYB
         EOan51sK6+dPD/OW7hJ0mhvpiBwEn9eGuW1JreSKm7aA3OvVEW08ayJblE6Gm3Lk+IYX
         eHxTwHHXeAS2LvKkyJDt3Ds9fSvzII+4Oov0cmlbpQv3XsUbRErDWXVzXPUQGg4D3S64
         Y88/QoCI9jkpCnlJ4B5/cUS9iAnqJqLDSCWkOFKOxbBQZ+VVNIdAzRq5NMA5QoQ9IX3H
         XGBQ==
X-Gm-Message-State: AOJu0YwiRDPNJ+85ylQQt53gzgy36xWp1Jt2/d3fVmBBF3+CzXYQZc/b
	l03mca25LeNN7EiPmpntj4gLz6BQFK1LeSmEBOQ=
X-Google-Smtp-Source: AGHT+IGkSivjfP9p3JD8ETjSCZ20/ymUfNkHUyHfOqcB9KhtEpQGQNyyvnEOYfJ5UF0r7SXqWfqRVw==
X-Received: by 2002:a05:6808:2221:b0:3a7:2d4c:5d4e with SMTP id bd33-20020a056808222100b003a72d4c5d4emr8777599oib.7.1693717434574;
        Sat, 02 Sep 2023 22:03:54 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id l11-20020a170902f68b00b001b8af7f632asm5324835plg.176.2023.09.02.22.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 22:03:54 -0700 (PDT)
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
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
	qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH v6 03/18] hw/core/cpu: Replace gdb_core_xml_file with gdb_core_feature
Date: Sun,  3 Sep 2023 14:03:11 +0900
Message-ID: <20230903050338.35256-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903050338.35256-1-akihiko.odaki@daynix.com>
References: <20230903050338.35256-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0vSu+eAG42kg

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
 target/loongarch/cpu.c  | 4 ++--
 target/m68k/cpu.c       | 7 ++++---
 target/microblaze/cpu.c | 4 ++--
 target/ppc/cpu_init.c   | 4 ++--
 target/riscv/cpu.c      | 7 ++++---
 target/rx/cpu.c         | 4 ++--
 target/s390x/cpu.c      | 4 ++--
 16 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4f5c7eb04e..09f1aca624 100644
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
index a03d9baa12..34ef45c94a 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -384,7 +384,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
             g_ptr_array_add(
                 a,
                 g_markup_printf_escaped("<xi:include href=\"%s\"/>",
-                                        cc->gdb_core_xml_file));
+                                        cc->gdb_core_feature->xmlname));
             for (r = cpu->gdb_regs; r; r = r->next) {
                 g_ptr_array_add(
                     a,
@@ -1496,7 +1496,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
 
     g_string_printf(gdbserver_state.str_buf, "PacketSize=%x", MAX_PACKET_LENGTH);
     cc = CPU_GET_CLASS(first_cpu);
-    if (cc->gdb_core_xml_file) {
+    if (cc->gdb_core_feature) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
@@ -1538,7 +1538,7 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
 
     process = gdb_get_cpu_process(gdbserver_state.g_cpu);
     cc = CPU_GET_CLASS(gdbserver_state.g_cpu);
-    if (!cc->gdb_core_xml_file) {
+    if (!cc->gdb_core_feature) {
         gdb_put_packet("");
         return;
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4147c19597..5f07133419 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
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
index 47d2e8e781..49a823ad58 100644
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
index 68bea8d3f0..c1a7667f4a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7963,12 +7963,11 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
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
index 49565da3fa..6c76d14e43 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -722,8 +722,8 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = loongarch_cpu_gdb_read_register;
     cc->gdb_write_register = loongarch_cpu_gdb_write_register;
     cc->disas_set_info = loongarch_cpu_disas_set_info;
-    cc->gdb_num_core_regs = 35;
-    cc->gdb_core_xml_file = "loongarch-base64.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("loongarch-base64.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->gdb_stop_before_watchpoint = true;
     cc->gdb_arch_name = loongarch_gdb_arch_name;
 
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
