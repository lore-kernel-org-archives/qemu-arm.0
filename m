Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bt12-20020a056000080c00b0033e3a110d7fsm6390168wrb.71.2024.03.05.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:18:43 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 87D885F9ED;
	Tue,  5 Mar 2024 12:10:07 +0000 (GMT)
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
Subject: [PATCH 22/29] contrib/plugins/hotblocks: migrate to new per_vcpu API
Date: Tue,  5 Mar 2024 12:09:58 +0000
Message-Id: <20240305121005.3528075-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bEu9+HZs3rKy

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240304130036.124418-10-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/hotblocks.c | 50 ++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 4de1b134944..02bc5078bdd 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -34,8 +34,8 @@ static guint64 limit = 20;
  */
 typedef struct {
     uint64_t start_addr;
-    uint64_t exec_count;
-    int      trans_count;
+    struct qemu_plugin_scoreboard *exec_count;
+    int trans_count;
     unsigned long insns;
 } ExecCount;
 
@@ -43,7 +43,17 @@ static gint cmp_exec_count(gconstpointer a, gconstpointer b)
 {
     ExecCount *ea = (ExecCount *) a;
     ExecCount *eb = (ExecCount *) b;
-    return ea->exec_count > eb->exec_count ? -1 : 1;
+    uint64_t count_a =
+        qemu_plugin_u64_sum(qemu_plugin_scoreboard_u64(ea->exec_count));
+    uint64_t count_b =
+        qemu_plugin_u64_sum(qemu_plugin_scoreboard_u64(eb->exec_count));
+    return count_a > count_b ? -1 : 1;
+}
+
+static void exec_count_free(gpointer key, gpointer value, gpointer user_data)
+{
+    ExecCount *cnt = value;
+    qemu_plugin_scoreboard_free(cnt->exec_count);
 }
 
 static void plugin_exit(qemu_plugin_id_t id, void *p)
@@ -52,7 +62,6 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     GList *counts, *it;
     int i;
 
-    g_mutex_lock(&lock);
     g_string_append_printf(report, "%d entries in the hash table\n",
                            g_hash_table_size(hotblocks));
     counts = g_hash_table_get_values(hotblocks);
@@ -63,16 +72,21 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             ExecCount *rec = (ExecCount *) it->data;
-            g_string_append_printf(report, "0x%016"PRIx64", %d, %ld, %"PRId64"\n",
-                                   rec->start_addr, rec->trans_count,
-                                   rec->insns, rec->exec_count);
+            g_string_append_printf(
+                report, "0x%016"PRIx64", %d, %ld, %"PRId64"\n",
+                rec->start_addr, rec->trans_count,
+                rec->insns,
+                qemu_plugin_u64_sum(
+                    qemu_plugin_scoreboard_u64(rec->exec_count)));
         }
 
         g_list_free(it);
     }
-    g_mutex_unlock(&lock);
 
     qemu_plugin_outs(report->str);
+
+    g_hash_table_foreach(hotblocks, exec_count_free, NULL);
+    g_hash_table_destroy(hotblocks);
 }
 
 static void plugin_init(void)
@@ -82,15 +96,9 @@ static void plugin_init(void)
 
 static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
 {
-    ExecCount *cnt;
-    uint64_t hash = (uint64_t) udata;
-
-    g_mutex_lock(&lock);
-    cnt = (ExecCount *) g_hash_table_lookup(hotblocks, (gconstpointer) hash);
-    /* should always succeed */
-    g_assert(cnt);
-    cnt->exec_count++;
-    g_mutex_unlock(&lock);
+    ExecCount *cnt = (ExecCount *)udata;
+    qemu_plugin_u64_add(qemu_plugin_scoreboard_u64(cnt->exec_count),
+                        cpu_index, 1);
 }
 
 /*
@@ -114,18 +122,20 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         cnt->start_addr = pc;
         cnt->trans_count = 1;
         cnt->insns = insns;
+        cnt->exec_count = qemu_plugin_scoreboard_new(sizeof(uint64_t));
         g_hash_table_insert(hotblocks, (gpointer) hash, (gpointer) cnt);
     }
 
     g_mutex_unlock(&lock);
 
     if (do_inline) {
-        qemu_plugin_register_vcpu_tb_exec_inline(tb, QEMU_PLUGIN_INLINE_ADD_U64,
-                                                 &cnt->exec_count, 1);
+        qemu_plugin_register_vcpu_tb_exec_inline_per_vcpu(
+            tb, QEMU_PLUGIN_INLINE_ADD_U64,
+            qemu_plugin_scoreboard_u64(cnt->exec_count), 1);
     } else {
         qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
                                              QEMU_PLUGIN_CB_NO_REGS,
-                                             (void *)hash);
+                                             (void *)cnt);
     }
 }
 
-- 
2.39.2
