Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k40-20020a05600c1ca800b00412b643b5a3sm17627256wms.11.2024.03.05.04.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:10:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E54B75F9DF;
	Tue,  5 Mar 2024 12:10:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brad Smith <brad@comstyle.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Brian Cain <bcain@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Beraldo Leal <bleal@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	David Hildenbrand <david@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Warner Losh <imp@bsdimp.com>,
	qemu-riscv@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 15/29] plugins: define qemu_plugin_u64
Date: Tue,  5 Mar 2024 12:09:51 +0000
Message-Id: <20240305121005.3528075-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qrA4QO/iHbF0

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Additionally to the scoreboard, we define a qemu_plugin_u64, which is a
simple struct holding a pointer to a scoreboard, and a given offset.
This allows to have a scoreboard containing structs, without having to
bring offset to operate on a specific field.

Since most of the plugins are simply collecting a sum of per-cpu values,
qemu_plugin_u64 directly support this operation as well.

All inline operations defined later will use a qemu_plugin_u64 as input.

New functions:
- qemu_plugin_u64_add
- qemu_plugin_u64_get
- qemu_plugin_u64_set
- qemu_plugin_u64_sum
New macros:
- qemu_plugin_scoreboard_u64
- qemu_plugin_scoreboard_u64_in_struct

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240304130036.124418-3-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h   | 52 ++++++++++++++++++++++++++++++++++++
 plugins/api.c                | 34 +++++++++++++++++++++++
 plugins/qemu-plugins.symbols |  4 +++
 3 files changed, 90 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 31c468ddb2c..ebf9a645e15 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -225,6 +225,17 @@ struct qemu_plugin_insn;
 /** struct qemu_plugin_scoreboard - Opaque handle for a scoreboard */
 struct qemu_plugin_scoreboard;
 
+/**
+ * typedef qemu_plugin_u64 - uint64_t member of an entry in a scoreboard
+ *
+ * This field allows to access a specific uint64_t member in one given entry,
+ * located at a specified offset. Inline operations expect this as entry.
+ */
+typedef struct {
+    struct qemu_plugin_scoreboard *score;
+    size_t offset;
+} qemu_plugin_u64;
+
 /**
  * enum qemu_plugin_cb_flags - type of callback
  *
@@ -784,4 +795,45 @@ QEMU_PLUGIN_API
 void *qemu_plugin_scoreboard_find(struct qemu_plugin_scoreboard *score,
                                   unsigned int vcpu_index);
 
+/* Macros to define a qemu_plugin_u64 */
+#define qemu_plugin_scoreboard_u64(score) \
+    (qemu_plugin_u64) {score, 0}
+#define qemu_plugin_scoreboard_u64_in_struct(score, type, member) \
+    (qemu_plugin_u64) {score, offsetof(type, member)}
+
+/**
+ * qemu_plugin_u64_add() - add a value to a qemu_plugin_u64 for a given vcpu
+ * @entry: entry to query
+ * @vcpu_index: entry index
+ * @added: value to add
+ */
+QEMU_PLUGIN_API
+void qemu_plugin_u64_add(qemu_plugin_u64 entry, unsigned int vcpu_index,
+                         uint64_t added);
+
+/**
+ * qemu_plugin_u64_get() - get value of a qemu_plugin_u64 for a given vcpu
+ * @entry: entry to query
+ * @vcpu_index: entry index
+ */
+QEMU_PLUGIN_API
+uint64_t qemu_plugin_u64_get(qemu_plugin_u64 entry, unsigned int vcpu_index);
+
+/**
+ * qemu_plugin_u64_set() - set value of a qemu_plugin_u64 for a given vcpu
+ * @entry: entry to query
+ * @vcpu_index: entry index
+ * @val: new value
+ */
+QEMU_PLUGIN_API
+void qemu_plugin_u64_set(qemu_plugin_u64 entry, unsigned int vcpu_index,
+                         uint64_t val);
+
+/**
+ * qemu_plugin_u64_sum() - return sum of all vcpu entries in a scoreboard
+ * @entry: entry to sum
+ */
+QEMU_PLUGIN_API
+uint64_t qemu_plugin_u64_sum(qemu_plugin_u64 entry);
+
 #endif /* QEMU_QEMU_PLUGIN_H */
diff --git a/plugins/api.c b/plugins/api.c
index 76b2e652b9c..8910cbb2c46 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -484,3 +484,37 @@ void *qemu_plugin_scoreboard_find(struct qemu_plugin_scoreboard *score,
     char *base_ptr = score->data->data;
     return base_ptr + vcpu_index * g_array_get_element_size(score->data);
 }
+
+static uint64_t *plugin_u64_address(qemu_plugin_u64 entry,
+                                    unsigned int vcpu_index)
+{
+    char *ptr = qemu_plugin_scoreboard_find(entry.score, vcpu_index);
+    return (uint64_t *)(ptr + entry.offset);
+}
+
+void qemu_plugin_u64_add(qemu_plugin_u64 entry, unsigned int vcpu_index,
+                         uint64_t added)
+{
+    *plugin_u64_address(entry, vcpu_index) += added;
+}
+
+uint64_t qemu_plugin_u64_get(qemu_plugin_u64 entry,
+                             unsigned int vcpu_index)
+{
+    return *plugin_u64_address(entry, vcpu_index);
+}
+
+void qemu_plugin_u64_set(qemu_plugin_u64 entry, unsigned int vcpu_index,
+                         uint64_t val)
+{
+    *plugin_u64_address(entry, vcpu_index) = val;
+}
+
+uint64_t qemu_plugin_u64_sum(qemu_plugin_u64 entry)
+{
+    uint64_t total = 0;
+    for (int i = 0, n = qemu_plugin_num_vcpus(); i < n; ++i) {
+        total += qemu_plugin_u64_get(entry, i);
+    }
+    return total;
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 3f93e7d6b13..6204453d0fd 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -44,6 +44,10 @@
   qemu_plugin_tb_get_insn;
   qemu_plugin_tb_n_insns;
   qemu_plugin_tb_vaddr;
+  qemu_plugin_u64_add;
+  qemu_plugin_u64_get;
+  qemu_plugin_u64_set;
+  qemu_plugin_u64_sum;
   qemu_plugin_uninstall;
   qemu_plugin_vcpu_for_each;
 };
-- 
2.39.2
