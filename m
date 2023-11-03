Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j20-20020a5d4534000000b0032dc74c093dsm1333423wra.103.2023.11.03.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:06:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 09F0065751;
	Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	qemu-ppc@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Nicholas Piggin <npiggin@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 21/29] gdbstub: expose api to find registers
Date: Fri,  3 Nov 2023 19:59:48 +0000
Message-Id: <20231103195956.1998255-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bicv4Lh5F/rL

Expose an internal API to QEMU to find groups of registers. It returns
a list containing the details required to called gdb_read_register().

Based-on: <20231025093128.33116-15-akihiko.odaki@daynix.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vAJB:

This principle difference is the find registers is a single call which
can return a) multiple registers and b) is agnostic to the gdb
feature. This is because I haven't so far found any duplicate
registers in the system so I thing the regname by itself should be
enough. However I do expose the gdb feature name in case the caller
wants to do some additional filtering.
---
 include/exec/gdbstub.h | 47 +++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c      | 59 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index da9ddfe54c..b201eb4b84 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -111,6 +111,53 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
  */
 const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
+/**
+ * gdb_find_feature() - Find a feature associated with a CPU.
+ * @cpu: The CPU associated with the feature.
+ * @name: The feature's name.
+ *
+ * Return: The feature's number.
+ */
+int gdb_find_feature(CPUState *cpu, const char *name);
+
+/**
+ * gdb_find_feature_register() - Find a register associated with a CPU.
+ * @cpu: The CPU associated with the register.
+ * @feature: The feature's number returned by gdb_find_feature().
+ * @name: The register's name.
+ *
+ * Return: The register's number.
+ */
+int gdb_find_feature_register(CPUState *cpu, int feature, const char *name);
+
+/**
+ * gdb_read_register() - Read a register associated with a CPU.
+ * @cpu: The CPU associated with the register.
+ * @buf: The buffer that the read register will be appended to.
+ * @reg: The register's number returned by gdb_find_feature_register().
+ *
+ * Return: The number of read bytes.
+ */
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
+
+/**
+ * typedef GDBRegDesc - a register description from gdbstub
+ */
+typedef struct {
+    int gdb_reg;
+    const char *name;
+    const char *feature_name;
+} GDBRegDesc;
+
+/**
+ * gdb_find_registers() - Return list of registers matching pattern
+ * @cpu: The CPU being searched
+ * @reg_pattern: the pattern being searched for
+ *
+ * Returns a GArray of GDBRegDesc, caller frees
+ */
+GArray *gdb_find_registers(CPUState *cpu, const char *reg_pattern);
+
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 7d7d887817..45882d1a6f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -490,7 +490,64 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
     g_assert_not_reached();
 }
 
-static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
+int gdb_find_feature(CPUState *cpu, const char *name)
+{
+    GDBRegisterState *r;
+
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+        if (!strcmp(name, r->feature->name)) {
+            return i;
+        }
+    }
+
+    return -1;
+}
+
+int gdb_find_feature_register(CPUState *cpu, int feature, const char *name)
+{
+    GDBRegisterState *r;
+
+    r = &g_array_index(cpu->gdb_regs, GDBRegisterState, feature);
+
+    for (int i = 0; i < r->feature->num_regs; i++) {
+        if (r->feature->regs[i] && !strcmp(name, r->feature->regs[i])) {
+            return r->base_reg + i;
+        }
+    }
+
+    return -1;
+}
+
+GArray *gdb_find_registers(CPUState *cpu, const char *reg_pattern)
+{
+    g_autoptr(GPatternSpec) pat = g_pattern_spec_new(reg_pattern);
+    GArray *results = g_array_new(true, true, sizeof(GDBRegDesc));
+
+    /* registers are only available once the CPU is initialised */
+    if (!cpu->gdb_regs) {
+        return results;
+    }
+
+    for (int f = 0; f < cpu->gdb_regs->len; f++) {
+        GDBRegisterState *r = &g_array_index(cpu->gdb_regs, GDBRegisterState, f);
+        for (int i = 0; i < r->feature->num_regs; i++) {
+            const char *name = r->feature->regs[i];
+            if (name && g_pattern_match_string(pat, name)) {
+                GDBRegDesc desc = {
+                    r->base_reg + i,
+                    name,
+                    r->feature->name
+                };
+                g_array_append_val(results, desc);
+            }
+        }
+    }
+
+    return results;
+}
+
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GDBRegisterState *r;
-- 
2.39.2
