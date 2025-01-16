Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890408a66sm3915205e9.5.2025.01.16.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:12:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1F85B608B4;
	Thu, 16 Jan 2025 16:03:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 17/37] contrib/plugins/hotblocks: fix 32-bit build
Date: Thu, 16 Jan 2025 16:02:46 +0000
Message-Id: <20250116160306.1709518-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: k21EnX8Cj3Js

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20241217224306.2900490-8-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/hotblocks.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 02bc5078bd..f12bfb7a26 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -29,7 +29,7 @@ static guint64 limit = 20;
  *
  * The internals of the TCG are not exposed to plugins so we can only
  * get the starting PC for each block. We cheat this slightly by
- * xor'ing the number of instructions to the hash to help
+ * checking the number of instructions as well to help
  * differentiate.
  */
 typedef struct {
@@ -50,6 +50,20 @@ static gint cmp_exec_count(gconstpointer a, gconstpointer b)
     return count_a > count_b ? -1 : 1;
 }
 
+static guint exec_count_hash(gconstpointer v)
+{
+    const ExecCount *e = v;
+    return e->start_addr ^ e->insns;
+}
+
+static gboolean exec_count_equal(gconstpointer v1, gconstpointer v2)
+{
+    const ExecCount *ea = v1;
+    const ExecCount *eb = v2;
+    return (ea->start_addr == eb->start_addr) &&
+           (ea->insns == eb->insns);
+}
+
 static void exec_count_free(gpointer key, gpointer value, gpointer user_data)
 {
     ExecCount *cnt = value;
@@ -91,7 +105,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
 static void plugin_init(void)
 {
-    hotblocks = g_hash_table_new(NULL, g_direct_equal);
+    hotblocks = g_hash_table_new(exec_count_hash, exec_count_equal);
 }
 
 static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
@@ -111,10 +125,15 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
     ExecCount *cnt;
     uint64_t pc = qemu_plugin_tb_vaddr(tb);
     size_t insns = qemu_plugin_tb_n_insns(tb);
-    uint64_t hash = pc ^ insns;
 
     g_mutex_lock(&lock);
-    cnt = (ExecCount *) g_hash_table_lookup(hotblocks, (gconstpointer) hash);
+    {
+        ExecCount e;
+        e.start_addr = pc;
+        e.insns = insns;
+        cnt = (ExecCount *) g_hash_table_lookup(hotblocks, &e);
+    }
+
     if (cnt) {
         cnt->trans_count++;
     } else {
@@ -123,7 +142,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         cnt->trans_count = 1;
         cnt->insns = insns;
         cnt->exec_count = qemu_plugin_scoreboard_new(sizeof(uint64_t));
-        g_hash_table_insert(hotblocks, (gpointer) hash, (gpointer) cnt);
+        g_hash_table_insert(hotblocks, cnt, cnt);
     }
 
     g_mutex_unlock(&lock);
-- 
2.39.5
