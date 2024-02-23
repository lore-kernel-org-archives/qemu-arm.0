Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bt19-20020a056000081300b0033d1f25b798sm3474276wrb.82.2024.02.23.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 08:22:03 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CD2CB5F928;
	Fri, 23 Feb 2024 16:22:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 04/27] target/ppc: Use GDBFeature for dynamic XML
Date: Fri, 23 Feb 2024 16:21:39 +0000
Message-Id: <20240223162202.1936541-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223162202.1936541-1-alex.bennee@linaro.org>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +o5F5SLCb3zF

From: Akihiko Odaki <akihiko.odaki@daynix.com>

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240103173349.398526-28-alex.bennee@linaro.org>
Message-Id: <20231213-gdb-v17-2-777047380591@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/cpu-qom.h  |  1 +
 target/ppc/cpu.h      |  4 +---
 target/ppc/cpu_init.c |  4 ----
 target/ppc/gdbstub.c  | 51 ++++++++++++++++---------------------------
 4 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 0241609efef..8247fa23367 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -20,6 +20,7 @@
 #ifndef QEMU_PPC_CPU_QOM_H
 #define QEMU_PPC_CPU_QOM_H
 
+#include "exec/gdbstub.h"
 #include "hw/core/cpu.h"
 
 #ifdef TARGET_PPC64
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a44de22ca4a..200652e2c87 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1471,8 +1471,7 @@ struct PowerPCCPUClass {
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
 #ifndef CONFIG_USER_ONLY
-    unsigned int gdb_num_sprs;
-    const char *gdb_spr_xml;
+    GDBFeature gdb_spr;
 #endif
     const PPCHash64Options *hash64_opts;
     struct ppc_radix_page_info *radix_page_info;
@@ -1525,7 +1524,6 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9931372a08a..4f6903d3f16 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6682,10 +6682,6 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     /* PowerPC implementation specific initialisations (SPRs, timers, ...) */
     (*pcc->init_proc)(env);
 
-#if !defined(CONFIG_USER_ONLY)
-    ppc_gdb_gen_spr_xml(cpu);
-#endif
-
     /* MSR bits & flags consistency checks */
     if (env->msr_mask & (1 << 25)) {
         switch (env->flags & (POWERPC_FLAG_SPE | POWERPC_FLAG_VRE)) {
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index ec5731e5d67..e3be3dbd109 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -300,15 +300,23 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
 }
 
 #ifndef CONFIG_USER_ONLY
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
+static void gdb_gen_spr_feature(CPUState *cs)
 {
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
-    GString *xml;
-    char *spr_name;
+    GDBFeatureBuilder builder;
     unsigned int num_regs = 0;
     int i;
 
+    if (pcc->gdb_spr.xml) {
+        return;
+    }
+
+    gdb_feature_builder_init(&builder, &pcc->gdb_spr,
+                             "org.qemu.power.spr", "power-spr.xml",
+                             cs->gdb_num_regs);
+
     for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr = &env->spr_cb[i];
 
@@ -326,35 +334,13 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
          */
         spr->gdb_id = num_regs;
         num_regs++;
-    }
-
-    if (pcc->gdb_spr_xml) {
-        return;
-    }
 
-    xml = g_string_new("<?xml version=\"1.0\"?>");
-    g_string_append(xml, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append(xml, "<feature name=\"org.qemu.power.spr\">");
-
-    for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
-        ppc_spr_t *spr = &env->spr_cb[i];
-
-        if (!spr->name) {
-            continue;
-        }
-
-        spr_name = g_ascii_strdown(spr->name, -1);
-        g_string_append_printf(xml, "<reg name=\"%s\"", spr_name);
-        g_free(spr_name);
-
-        g_string_append_printf(xml, " bitsize=\"%d\"", TARGET_LONG_BITS);
-        g_string_append(xml, " group=\"spr\"/>");
+        gdb_feature_builder_append_reg(&builder, g_ascii_strdown(spr->name, -1),
+                                       TARGET_LONG_BITS, num_regs,
+                                       "int", "spr");
     }
 
-    g_string_append(xml, "</feature>");
-
-    pcc->gdb_num_sprs = num_regs;
-    pcc->gdb_spr_xml = g_string_free(xml, false);
+    gdb_feature_builder_end(&builder);
 }
 
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
@@ -362,7 +348,7 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
 
     if (strcmp(xml_name, "power-spr.xml") == 0) {
-        return pcc->gdb_spr_xml;
+        return pcc->gdb_spr.xml;
     }
     return NULL;
 }
@@ -599,7 +585,8 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
                                  32, "power-vsx.xml", 0);
     }
 #ifndef CONFIG_USER_ONLY
+    gdb_gen_spr_feature(cs);
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
-                             pcc->gdb_num_sprs, "power-spr.xml", 0);
+                             pcc->gdb_spr.num_regs, "power-spr.xml", 0);
 #endif
 }
-- 
2.39.2
