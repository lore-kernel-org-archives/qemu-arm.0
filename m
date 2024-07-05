Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5902c5f74f6sm121979a12.88.2024.07.05.01.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:47:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B9CF86213B;
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
Subject: [PATCH v2 21/40] test/plugin: make insn plugin less noisy by default
Date: Fri,  5 Jul 2024 09:40:28 +0100
Message-Id: <20240705084047.857176-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iQr3aC3UTGy8

While the match functionality is useful lets make the verbosity
optional while we are actually running.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/insn.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index 5e0aa03223..524f9ddde8 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -20,6 +20,7 @@ static qemu_plugin_u64 insn_count;
 
 static bool do_inline;
 static bool do_size;
+static bool do_trace;
 static GArray *sizes;
 
 typedef struct {
@@ -73,30 +74,30 @@ static void vcpu_insn_matched_exec_before(unsigned int cpu_index, void *udata)
     MatchCount *match = qemu_plugin_scoreboard_find(insn_match->counts,
                                                     cpu_index);
 
-    g_autoptr(GString) ts = g_string_new("");
-
     insn->hits++;
-    g_string_append_printf(ts, "0x%" PRIx64 ", '%s', %"PRId64 " hits",
-                           insn->vaddr, insn->disas, insn->hits);
 
     uint64_t icount = qemu_plugin_u64_get(insn_count, cpu_index);
     uint64_t delta = icount - match->last_hit;
 
     match->hits++;
     match->total_delta += delta;
-
-    g_string_append_printf(ts,
-                           " , cpu %u,"
-                           " %"PRId64" match hits,"
-                           " Δ+%"PRId64 " since last match,"
-                           " %"PRId64 " avg insns/match\n",
-                           cpu_index,
-                           match->hits, delta,
-                           match->total_delta / match->hits);
-
     match->last_hit = icount;
 
-    qemu_plugin_outs(ts->str);
+    if (do_trace) {
+        g_autoptr(GString) ts = g_string_new("");
+        g_string_append_printf(ts, "0x%" PRIx64 ", '%s', %"PRId64 " hits",
+                               insn->vaddr, insn->disas, insn->hits);
+        g_string_append_printf(ts,
+                               " , cpu %u,"
+                               " %"PRId64" match hits,"
+                               " Δ+%"PRId64 " since last match,"
+                               " %"PRId64 " avg insns/match\n",
+                               cpu_index,
+                               match->hits, delta,
+                               match->total_delta / match->hits);
+
+        qemu_plugin_outs(ts->str);
+    }
 }
 
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
@@ -216,6 +217,11 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
             }
         } else if (g_strcmp0(tokens[0], "match") == 0) {
             parse_match(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "trace") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_trace)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.39.2
