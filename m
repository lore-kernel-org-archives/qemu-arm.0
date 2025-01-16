Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm248143f8f.10.2025.01.16.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:12:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 359786082D;
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
Subject: [PATCH v3 18/37] contrib/plugins/cflow: fix 32-bit build
Date: Thu, 16 Jan 2025 16:02:47 +0000
Message-Id: <20250116160306.1709518-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MlruUMBnC9CE

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20241217224306.2900490-9-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cflow.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/cflow.c b/contrib/plugins/cflow.c
index b39974d1cf..930ecb46fc 100644
--- a/contrib/plugins/cflow.c
+++ b/contrib/plugins/cflow.c
@@ -76,6 +76,8 @@ typedef struct {
 
 /* We use this to track the current execution state */
 typedef struct {
+    /* address of current translated block */
+    uint64_t tb_pc;
     /* address of end of block */
     uint64_t end_block;
     /* next pc after end of block */
@@ -85,6 +87,7 @@ typedef struct {
 } VCPUScoreBoard;
 
 /* descriptors for accessing the above scoreboard */
+static qemu_plugin_u64 tb_pc;
 static qemu_plugin_u64 end_block;
 static qemu_plugin_u64 pc_after_block;
 static qemu_plugin_u64 last_pc;
@@ -189,10 +192,11 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 static void plugin_init(void)
 {
     g_mutex_init(&node_lock);
-    nodes = g_hash_table_new(NULL, g_direct_equal);
+    nodes = g_hash_table_new(g_int64_hash, g_int64_equal);
     state = qemu_plugin_scoreboard_new(sizeof(VCPUScoreBoard));
 
     /* score board declarations */
+    tb_pc = qemu_plugin_scoreboard_u64_in_struct(state, VCPUScoreBoard, tb_pc);
     end_block = qemu_plugin_scoreboard_u64_in_struct(state, VCPUScoreBoard,
                                                      end_block);
     pc_after_block = qemu_plugin_scoreboard_u64_in_struct(state, VCPUScoreBoard,
@@ -215,10 +219,10 @@ static NodeData *fetch_node(uint64_t addr, bool create_if_not_found)
     NodeData *node = NULL;
 
     g_mutex_lock(&node_lock);
-    node = (NodeData *) g_hash_table_lookup(nodes, (gconstpointer) addr);
+    node = (NodeData *) g_hash_table_lookup(nodes, &addr);
     if (!node && create_if_not_found) {
         node = create_node(addr);
-        g_hash_table_insert(nodes, (gpointer) addr, (gpointer) node);
+        g_hash_table_insert(nodes, &node->addr, node);
     }
     g_mutex_unlock(&node_lock);
     return node;
@@ -234,7 +238,7 @@ static void vcpu_tb_branched_exec(unsigned int cpu_index, void *udata)
     uint64_t lpc = qemu_plugin_u64_get(last_pc, cpu_index);
     uint64_t ebpc = qemu_plugin_u64_get(end_block, cpu_index);
     uint64_t npc = qemu_plugin_u64_get(pc_after_block, cpu_index);
-    uint64_t pc = GPOINTER_TO_UINT(udata);
+    uint64_t pc = qemu_plugin_u64_get(tb_pc, cpu_index);
 
     /* return early for address 0 */
     if (!lpc) {
@@ -305,10 +309,11 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
      * handle both early block exits and normal branches in the
      * callback if we hit it.
      */
-    gpointer udata = GUINT_TO_POINTER(pc);
+    qemu_plugin_register_vcpu_tb_exec_inline_per_vcpu(
+        tb, QEMU_PLUGIN_INLINE_STORE_U64, tb_pc, pc);
     qemu_plugin_register_vcpu_tb_exec_cond_cb(
         tb, vcpu_tb_branched_exec, QEMU_PLUGIN_CB_NO_REGS,
-        QEMU_PLUGIN_COND_NE, pc_after_block, pc, udata);
+        QEMU_PLUGIN_COND_NE, pc_after_block, pc, NULL);
 
     /*
      * Now we can set start/end for this block so the next block can
-- 
2.39.5
