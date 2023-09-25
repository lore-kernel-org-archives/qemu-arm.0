Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c234300b004013797efb6sm15499567wmq.9.2023.09.25.07.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:49:00 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E2ADB1FFC7;
	Mon, 25 Sep 2023 15:48:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Snow <jsnow@redhat.com>,
	libvir-list@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Nicholas Piggin <npiggin@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 15/31] hw/core/cpu: Return static value with gdb_arch_name()
Date: Mon, 25 Sep 2023 15:48:38 +0100
Message-Id: <20230925144854.1872513-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iBK71E8706fU

From: Akihiko Odaki <akihiko.odaki@daynix.com>

All implementations of gdb_arch_name() returns dynamic duplicates of
static strings. It's also unlikely that there will be an implementation
of gdb_arch_name() that returns a truly dynamic value due to the nature
of the function returning a well-known identifiers. Qualify the value
gdb_arch_name() with const and make all of its implementations return
static strings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230912224107.29669-8-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h  | 2 +-
 target/ppc/internal.h  | 2 +-
 gdbstub/gdbstub.c      | 3 +--
 target/arm/cpu.c       | 6 +++---
 target/arm/cpu64.c     | 4 ++--
 target/i386/cpu.c      | 6 +++---
 target/loongarch/cpu.c | 8 ++++----
 target/ppc/gdbstub.c   | 6 +++---
 target/riscv/cpu.c     | 6 +++---
 target/s390x/cpu.c     | 4 ++--
 target/tricore/cpu.c   | 4 ++--
 11 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 648b5b3586..5ae479a961 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -164,7 +164,7 @@ struct CPUClass {
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
     const char *gdb_core_xml_file;
-    gchar * (*gdb_arch_name)(CPUState *cpu);
+    const gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 15803bc313..c881c67a8b 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -221,7 +221,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
 
 /* gdbstub.c */
 void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
-gchar *ppc_gdb_arch_name(CPUState *cs);
+const gchar *ppc_gdb_arch_name(CPUState *cs);
 
 /**
  * prot_for_access_type:
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 12f4d07046..9db4af41c1 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -380,10 +380,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
                             "<target>");
 
             if (cc->gdb_arch_name) {
-                g_autofree gchar *arch = cc->gdb_arch_name(cpu);
                 g_string_append_printf(xml,
                                        "<architecture>%s</architecture>",
-                                       arch);
+                                       cc->gdb_arch_name(cpu));
             }
             g_string_append(xml, "<xi:include href=\"");
             g_string_append(xml, cc->gdb_core_xml_file);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 10fcc61701..408af17bf2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2320,15 +2320,15 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static gchar *arm_gdb_arch_name(CPUState *cs)
+static const gchar *arm_gdb_arch_name(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
-        return g_strdup("iwmmxt");
+        return "iwmmxt";
     }
-    return g_strdup("arm");
+    return "arm";
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f3d87e001f..8a8cde7c05 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,9 +781,9 @@ static void aarch64_cpu_finalizefn(Object *obj)
 {
 }
 
-static gchar *aarch64_gdb_arch_name(CPUState *cs)
+static const gchar *aarch64_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("aarch64");
+    return "aarch64";
 }
 
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2589c8e929..993ebc21f6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5914,12 +5914,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
     memset(&env->user_features, 0, sizeof(env->user_features));
 }
 
-static gchar *x86_gdb_arch_name(CPUState *cs)
+static const gchar *x86_gdb_arch_name(CPUState *cs)
 {
 #ifdef TARGET_X86_64
-    return g_strdup("i386:x86-64");
+    return "i386:x86-64";
 #else
-    return g_strdup("i386");
+    return "i386";
 #endif
 }
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index fc7f70fbe5..3cc9b2a89d 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -768,9 +768,9 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 #endif
 }
 
-static gchar *loongarch32_gdb_arch_name(CPUState *cs)
+static const gchar *loongarch32_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("loongarch32");
+    return "loongarch32";
 }
 
 static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
@@ -782,9 +782,9 @@ static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = loongarch32_gdb_arch_name;
 }
 
-static gchar *loongarch64_gdb_arch_name(CPUState *cs)
+static const gchar *loongarch64_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("loongarch64");
+    return "loongarch64";
 }
 
 static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 2ad11510bf..778ef73bd7 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -589,12 +589,12 @@ static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-gchar *ppc_gdb_arch_name(CPUState *cs)
+const gchar *ppc_gdb_arch_name(CPUState *cs)
 {
 #if defined(TARGET_PPC64)
-    return g_strdup("powerpc:common64");
+    return "powerpc:common64";
 #else
-    return g_strdup("powerpc:common");
+    return "powerpc:common";
 #endif
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f227c7664e..ce35e95f14 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2008,17 +2008,17 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static gchar *riscv_gdb_arch_name(CPUState *cs)
+static const gchar *riscv_gdb_arch_name(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
     switch (riscv_cpu_mxl(env)) {
     case MXL_RV32:
-        return g_strdup("riscv:rv32");
+        return "riscv:rv32";
     case MXL_RV64:
     case MXL_RV128:
-        return g_strdup("riscv:rv64");
+        return "riscv:rv64";
     default:
         g_assert_not_reached();
     }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index df167493c3..cf4b5e43f2 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -284,9 +284,9 @@ static void s390_cpu_initfn(Object *obj)
 #endif
 }
 
-static gchar *s390_gdb_arch_name(CPUState *cs)
+static const gchar *s390_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("s390:64-bit");
+    return "s390:64-bit";
 }
 
 static Property s390x_cpu_properties[] = {
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 133a9ac70e..44e3ba6f0e 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -29,9 +29,9 @@ static inline void set_feature(CPUTriCoreState *env, int feature)
     env->features |= 1ULL << feature;
 }
 
-static gchar *tricore_gdb_arch_name(CPUState *cs)
+static const gchar *tricore_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("tricore");
+    return "tricore";
 }
 
 static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
-- 
2.39.2
