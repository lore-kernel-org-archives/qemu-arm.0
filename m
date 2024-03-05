Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bu16-20020a056000079000b0033dc3f3d689sm14939377wrb.93.2024.03.05.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:10:19 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9BEBA5F9F3;
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
Subject: [PATCH 23/29] contrib/plugins/howvec: migrate to new per_vcpu API
Date: Tue,  5 Mar 2024 12:09:59 +0000
Message-Id: <20240305121005.3528075-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HjyvYc8a0toE

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240304130036.124418-11-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/howvec.c | 53 ++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 644a7856bb2..2d10c87e0fb 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -43,13 +43,13 @@ typedef struct {
     uint32_t mask;
     uint32_t pattern;
     CountType what;
-    uint64_t count;
+    qemu_plugin_u64 count;
 } InsnClassExecCount;
 
 typedef struct {
     char *insn;
     uint32_t opcode;
-    uint64_t count;
+    qemu_plugin_u64 count;
     InsnClassExecCount *class;
 } InsnExecCount;
 
@@ -159,7 +159,9 @@ static gint cmp_exec_count(gconstpointer a, gconstpointer b)
 {
     InsnExecCount *ea = (InsnExecCount *) a;
     InsnExecCount *eb = (InsnExecCount *) b;
-    return ea->count > eb->count ? -1 : 1;
+    uint64_t count_a = qemu_plugin_u64_sum(ea->count);
+    uint64_t count_b = qemu_plugin_u64_sum(eb->count);
+    return count_a > count_b ? -1 : 1;
 }
 
 static void free_record(gpointer data)
@@ -167,12 +169,14 @@ static void free_record(gpointer data)
     InsnExecCount *rec = (InsnExecCount *) data;
     g_free(rec->insn);
     g_free(rec);
+    qemu_plugin_scoreboard_free(rec->count.score);
 }
 
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
     g_autoptr(GString) report = g_string_new("Instruction Classes:\n");
     int i;
+    uint64_t total_count;
     GList *counts;
     InsnClassExecCount *class = NULL;
 
@@ -180,11 +184,12 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         class = &class_table[i];
         switch (class->what) {
         case COUNT_CLASS:
-            if (class->count || verbose) {
+            total_count = qemu_plugin_u64_sum(class->count);
+            if (total_count || verbose) {
                 g_string_append_printf(report,
                                        "Class: %-24s\t(%" PRId64 " hits)\n",
                                        class->class,
-                                       class->count);
+                                       total_count);
             }
             break;
         case COUNT_INDIVIDUAL:
@@ -212,7 +217,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                    "Instr: %-24s\t(%" PRId64 " hits)"
                                    "\t(op=0x%08x/%s)\n",
                                    rec->insn,
-                                   rec->count,
+                                   qemu_plugin_u64_sum(rec->count),
                                    rec->opcode,
                                    rec->class ?
                                    rec->class->class : "un-categorised");
@@ -221,6 +226,12 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     }
 
     g_hash_table_destroy(insns);
+    for (i = 0; i < ARRAY_SIZE(class_tables); i++) {
+        for (int j = 0; j < class_tables[i].table_sz; ++j) {
+            qemu_plugin_scoreboard_free(class_tables[i].table[j].count.score);
+        }
+    }
+
 
     qemu_plugin_outs(report->str);
 }
@@ -232,11 +243,12 @@ static void plugin_init(void)
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
-    uint64_t *count = (uint64_t *) udata;
-    (*count)++;
+    struct qemu_plugin_scoreboard *score = udata;
+    qemu_plugin_u64_add(qemu_plugin_scoreboard_u64(score), cpu_index, 1);
 }
 
-static uint64_t *find_counter(struct qemu_plugin_insn *insn)
+static struct qemu_plugin_scoreboard *find_counter(
+    struct qemu_plugin_insn *insn)
 {
     int i;
     uint64_t *cnt = NULL;
@@ -265,7 +277,7 @@ static uint64_t *find_counter(struct qemu_plugin_insn *insn)
     case COUNT_NONE:
         return NULL;
     case COUNT_CLASS:
-        return &class->count;
+        return class->count.score;
     case COUNT_INDIVIDUAL:
     {
         InsnExecCount *icount;
@@ -279,13 +291,16 @@ static uint64_t *find_counter(struct qemu_plugin_insn *insn)
             icount->opcode = opcode;
             icount->insn = qemu_plugin_insn_disas(insn);
             icount->class = class;
+            struct qemu_plugin_scoreboard *score =
+                qemu_plugin_scoreboard_new(sizeof(uint64_t));
+            icount->count = qemu_plugin_scoreboard_u64(score);
 
             g_hash_table_insert(insns, GUINT_TO_POINTER(opcode),
                                 (gpointer) icount);
         }
         g_mutex_unlock(&lock);
 
-        return &icount->count;
+        return icount->count.score;
     }
     default:
         g_assert_not_reached();
@@ -300,14 +315,14 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
     size_t i;
 
     for (i = 0; i < n; i++) {
-        uint64_t *cnt;
         struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
-        cnt = find_counter(insn);
+        struct qemu_plugin_scoreboard *cnt = find_counter(insn);
 
         if (cnt) {
             if (do_inline) {
-                qemu_plugin_register_vcpu_insn_exec_inline(
-                    insn, QEMU_PLUGIN_INLINE_ADD_U64, cnt, 1);
+                qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+                    insn, QEMU_PLUGIN_INLINE_ADD_U64,
+                    qemu_plugin_scoreboard_u64(cnt), 1);
             } else {
                 qemu_plugin_register_vcpu_insn_exec_cb(
                     insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS, cnt);
@@ -322,6 +337,14 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 {
     int i;
 
+    for (i = 0; i < ARRAY_SIZE(class_tables); i++) {
+        for (int j = 0; j < class_tables[i].table_sz; ++j) {
+            struct qemu_plugin_scoreboard *score =
+                qemu_plugin_scoreboard_new(sizeof(uint64_t));
+            class_tables[i].table[j].count = qemu_plugin_scoreboard_u64(score);
+        }
+    }
+
     /* Select a class table appropriate to the guest architecture */
     for (i = 0; i < ARRAY_SIZE(class_tables); i++) {
         ClassSelector *entry = &class_tables[i];
-- 
2.39.2
