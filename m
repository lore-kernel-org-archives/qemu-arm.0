Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c0a0600b0041266f5b041sm2984923wmp.34.2024.02.23.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 08:28:46 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9C7235F938;
	Fri, 23 Feb 2024 16:22:04 +0000 (GMT)
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
	Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 22/27] tests/tcg: expand insn test case to exercise register API
Date: Fri, 23 Feb 2024 16:21:57 +0000
Message-Id: <20240223162202.1936541-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223162202.1936541-1-alex.bennee@linaro.org>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EeIJkKiSBDg6

This ensure we at least read every register the plugin API reports at
least once during the check-tcg checks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/insn.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index 5fd3017c2b3..54da06fcf26 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -46,6 +46,25 @@ typedef struct {
     char *disas;
 } Instruction;
 
+/*
+ * Initialise a new vcpu with reading the register list
+ */
+static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
+{
+    g_autoptr(GArray) reg_list = qemu_plugin_get_registers();
+    g_autoptr(GByteArray) reg_value = g_byte_array_new();
+
+    if (reg_list) {
+        for (int i = 0; i < reg_list->len; i++) {
+            qemu_plugin_reg_descriptor *rd = &g_array_index(
+                reg_list, qemu_plugin_reg_descriptor, i);
+            int count = qemu_plugin_read_register(rd->handle, reg_value);
+            g_assert(count > 0);
+        }
+    }
+}
+
+
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
     unsigned int i = cpu_index % MAX_CPUS;
@@ -212,6 +231,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
         sizes = g_array_new(true, true, sizeof(unsigned long));
     }
 
+    /* Register init, translation block and exit callbacks */
+    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
     return 0;
-- 
2.39.2
