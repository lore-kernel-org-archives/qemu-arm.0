Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c69041f6sm61531166b.103.2024.07.05.01.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:40:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CFEC75F92A;
	Fri,  5 Jul 2024 09:40:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 22/40] test/plugins: preserve the instruction record over translations
Date: Fri,  5 Jul 2024 09:40:29 +0100
Message-Id: <20240705084047.857176-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oNIzXNqJTZ4x

We are interested in the particular instruction so we should use a
stable record for it. We could bring this down to physical address but
for now vaddr + disas seems to do the trick.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/insn.c | 76 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index 524f9ddde8..baf2d07205 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -43,6 +43,44 @@ typedef struct {
     char *disas;
 } Instruction;
 
+/* A hash table to hold matched instructions */
+static GHashTable *match_insn_records;
+static GMutex match_hash_lock;
+
+
+static Instruction * get_insn_record(const char *disas, uint64_t vaddr, Match *m)
+{
+    g_autofree char *str_hash = g_strdup_printf("%"PRIx64" %s", vaddr, disas);
+    Instruction *record;
+
+    g_mutex_lock(&match_hash_lock);
+
+    if (!match_insn_records) {
+        match_insn_records = g_hash_table_new(g_str_hash, g_str_equal);
+    }
+
+    record = g_hash_table_lookup(match_insn_records, str_hash);
+
+    if (!record) {
+        g_autoptr(GString) ts = g_string_new(str_hash);
+
+        record = g_new0(Instruction, 1);
+        record->disas = g_strdup(disas);
+        record->vaddr = vaddr;
+        record->match = m;
+
+        g_hash_table_insert(match_insn_records, str_hash, record);
+
+        g_string_prepend(ts, "Created record for: ");
+        g_string_append(ts, "\n");
+        qemu_plugin_outs(ts->str);
+    }
+
+    g_mutex_unlock(&match_hash_lock);
+
+    return record;
+}
+
 /*
  * Initialise a new vcpu with reading the register list
  */
@@ -131,16 +169,19 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
          * If we are tracking certain instructions we will need more
          * information about the instruction which we also need to
          * save if there is a hit.
+         *
+         * We only want one record for each occurrence of the matched
+         * instruction.
          */
         if (matches->len) {
             char *insn_disas = qemu_plugin_insn_disas(insn);
             for (int j = 0; j < matches->len; j++) {
                 Match *m = &g_array_index(matches, Match, j);
                 if (g_str_has_prefix(insn_disas, m->match_string)) {
-                    Instruction *rec = g_new0(Instruction, 1);
-                    rec->disas = g_strdup(insn_disas);
-                    rec->vaddr = qemu_plugin_insn_vaddr(insn);
-                    rec->match = m;
+                    Instruction *rec = get_insn_record(insn_disas,
+                                                       qemu_plugin_insn_vaddr(insn),
+                                                       m);
+
                     qemu_plugin_register_vcpu_insn_exec_cb(
                         insn, vcpu_insn_matched_exec_before,
                         QEMU_PLUGIN_CB_NO_REGS, rec);
@@ -173,13 +214,38 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                qemu_plugin_u64_sum(insn_count));
     }
     qemu_plugin_outs(out->str);
-
     qemu_plugin_scoreboard_free(insn_count.score);
+
+    g_mutex_lock(&match_hash_lock);
+
     for (i = 0; i < matches->len; ++i) {
         Match *m = &g_array_index(matches, Match, i);
+        GHashTableIter iter;
+        Instruction *record;
+        qemu_plugin_u64 hit_e = qemu_plugin_scoreboard_u64_in_struct(m->counts, MatchCount, hits);
+        uint64_t hits = qemu_plugin_u64_sum(hit_e);
+
+        g_string_printf(out, "Match: %s, hits %"PRId64"\n", m->match_string, hits);
+        qemu_plugin_outs(out->str);
+
+        g_hash_table_iter_init(&iter, match_insn_records);
+        while (g_hash_table_iter_next(&iter, NULL, (void **)&record)) {
+            if (record->match == m) {
+                g_string_printf(out,
+                                "  %"PRIx64": %s (hits %"PRId64")\n",
+                                record->vaddr,
+                                record->disas,
+                                record->hits);
+                qemu_plugin_outs(out->str);
+            }
+        }
+
         g_free(m->match_string);
         qemu_plugin_scoreboard_free(m->counts);
     }
+
+    g_mutex_unlock(&match_hash_lock);
+
     g_array_free(matches, TRUE);
     g_array_free(sizes, TRUE);
 }
-- 
2.39.2
