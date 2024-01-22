Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4f06000000b0033930068ca8sm4244050wru.21.2024.01.22.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 06:56:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8CF035F7AE;
	Mon, 22 Jan 2024 14:56:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	kvm@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-ppc@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Cleber Rosa <crosa@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	Brian Cain <bcain@quicinc.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 07/21] target/riscv: Use GDBFeature for dynamic XML
Date: Mon, 22 Jan 2024 14:55:56 +0000
Message-Id: <20240122145610.413836-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122145610.413836-1-alex.bennee@linaro.org>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YjS9a6Hz8G/9

From: Akihiko Odaki <akihiko.odaki@daynix.com>

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240103173349.398526-29-alex.bennee@linaro.org>
Message-Id: <20231213-gdb-v17-3-777047380591@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/cpu.h     |  5 +--
 target/riscv/cpu.c     |  4 +--
 target/riscv/gdbstub.c | 79 +++++++++++++++++++-----------------------
 3 files changed, 40 insertions(+), 48 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d269d53e59c..8731af50718 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -24,6 +24,7 @@
 #include "hw/registerfields.h"
 #include "hw/qdev-properties.h"
 #include "exec/cpu-defs.h"
+#include "exec/gdbstub.h"
 #include "qemu/cpu-float.h"
 #include "qom/object.h"
 #include "qemu/int128.h"
@@ -440,8 +441,8 @@ struct ArchCPU {
 
     CPURISCVState env;
 
-    char *dyn_csr_xml;
-    char *dyn_vreg_xml;
+    GDBFeature dyn_csr_feature;
+    GDBFeature dyn_vreg_feature;
 
     /* Configuration Settings */
     RISCVCPUConfig cfg;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7ee4f8520f9..a488361626f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1672,9 +1672,9 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     RISCVCPU *cpu = RISCV_CPU(cs);
 
     if (strcmp(xmlname, "riscv-csr.xml") == 0) {
-        return cpu->dyn_csr_xml;
+        return cpu->dyn_csr_feature.xml;
     } else if (strcmp(xmlname, "riscv-vector.xml") == 0) {
-        return cpu->dyn_vreg_xml;
+        return cpu->dyn_vreg_feature.xml;
     }
 
     return NULL;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 365040228a1..76b72a95954 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -214,13 +214,14 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
+static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    GString *s = g_string_new(NULL);
+    GDBFeatureBuilder builder;
     riscv_csr_predicate_fn predicate;
+    const char *name;
     int bitsize = 16 << mcc->misa_mxl_max;
     int i;
 
@@ -233,9 +234,9 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         bitsize = 64;
     }
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_csr_feature,
+                             "org.gnu.gdb.riscv.csr", "riscv-csr.xml",
+                             base_reg);
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
         if (env->priv_ver < csr_ops[i].min_priv_ver) {
@@ -243,72 +244,64 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            if (csr_ops[i].name) {
-                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
-            } else {
-                g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
+            g_autofree char *dynamic_name = NULL;
+            name = csr_ops[i].name;
+            if (!name) {
+                dynamic_name = g_strdup_printf("csr%03x", i);
+                name = dynamic_name;
             }
-            g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
-            g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
+
+            gdb_feature_builder_append_reg(&builder, name, bitsize, i,
+                                           "int", NULL);
         }
     }
 
-    g_string_append_printf(s, "</feature>");
-
-    cpu->dyn_csr_xml = g_string_free(s, false);
+    gdb_feature_builder_end(&builder);
 
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = false;
 #endif
 
-    return CSR_TABLE_SIZE;
+    return &cpu->dyn_csr_feature;
 }
 
-static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
+static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-    GString *s = g_string_new(NULL);
-    g_autoptr(GString) ts = g_string_new("");
+    GDBFeatureBuilder builder;
     int reg_width = cpu->cfg.vlen;
-    int num_regs = 0;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.vector\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_vreg_feature,
+                             "org.gnu.gdb.riscv.vector", "riscv-vector.xml",
+                             base_reg);
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
         int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "%s", vec_lanes[i].id);
-        g_string_append_printf(s,
-                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
-                               ts->str, vec_lanes[i].gdb_type, count);
+        gdb_feature_builder_append_tag(
+            &builder, "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+            vec_lanes[i].id, vec_lanes[i].gdb_type, count);
     }
 
     /* Define unions */
-    g_string_append_printf(s, "<union id=\"riscv_vector\">");
+    gdb_feature_builder_append_tag(&builder, "<union id=\"riscv_vector\">");
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        g_string_append_printf(s, "<field name=\"%c\" type=\"%s\"/>",
-                               vec_lanes[i].suffix,
-                               vec_lanes[i].id);
+        gdb_feature_builder_append_tag(&builder,
+                                       "<field name=\"%c\" type=\"%s\"/>",
+                                       vec_lanes[i].suffix, vec_lanes[i].id);
     }
-    g_string_append(s, "</union>");
+    gdb_feature_builder_append_tag(&builder, "</union>");
 
     /* Define vector registers */
     for (i = 0; i < 32; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"v%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"riscv_vector\"/>",
-                               i, reg_width, base_reg++);
-        num_regs++;
+        gdb_feature_builder_append_reg(&builder, g_strdup_printf("v%d", i),
+                                       reg_width, i, "riscv_vector", "vector");
     }
 
-    g_string_append_printf(s, "</feature>");
+    gdb_feature_builder_end(&builder);
 
-    cpu->dyn_vreg_xml = g_string_free(s, false);
-    return num_regs;
+    return &cpu->dyn_vreg_feature;
 }
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
@@ -324,10 +317,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
-        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
+                                 ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs)->num_regs,
                                  "riscv-vector.xml", 0);
     }
     switch (mcc->misa_mxl_max) {
@@ -347,9 +339,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     if (cpu->cfg.ext_zicsr) {
-        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
+                                 riscv_gen_dynamic_csr_feature(cs, cs->gdb_num_regs)->num_regs,
                                  "riscv-csr.xml", 0);
     }
 }
-- 
2.39.2
