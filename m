Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e70bbsm632156866b.63.2025.04.28.05.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:59:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B1C2C5FAED;
	Mon, 28 Apr 2025 13:59:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 5/9] contrib/plugins: allow setting of instructions per quantum
Date: Mon, 28 Apr 2025 13:59:14 +0100
Message-Id: <20250428125918.449346-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250428125918.449346-1-alex.bennee@linaro.org>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SCZwiunTTip7

The default is we update time every 1/10th of a second or so. However
for some cases we might want to update time more frequently. Allow
this to be set via the command line through the ipq argument.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/emulation.rst |  4 ++++
 contrib/plugins/ips.c    | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index a72591ee4d..b607183d13 100644
--- a/docs/about/emulation.rst
+++ b/docs/about/emulation.rst
@@ -811,6 +811,10 @@ This plugin can limit the number of Instructions Per Second that are executed::
   * - ips=N
     - Maximum number of instructions per cpu that can be executed in one second.
       The plugin will sleep when the given number of instructions is reached.
+  * - ipq=N
+    - Instructions per quantum. How many instructions before we re-calculate time. 
+      The lower the number the more accurate time will be, but the less efficient the plugin.
+      Defaults to ips/10
 
 Other emulation features
 ------------------------
diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
index 1952e0866d..d83124d71c 100644
--- a/contrib/plugins/ips.c
+++ b/contrib/plugins/ips.c
@@ -147,6 +147,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info, int argc,
                                            char **argv)
 {
+    bool ipq_set = false;
+
     for (int i = 0; i < argc; i++) {
         char *opt = argv[i];
         g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
@@ -164,6 +166,9 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                         break;
                 }
             }
+        } else if (g_strcmp0(tokens[0], "ipq") == 0) {
+            max_insn_per_quantum = g_ascii_strtoull(tokens[1], NULL, 10);
+            ipq_set = true;
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
@@ -171,7 +176,10 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
     }
 
     vcpus = qemu_plugin_scoreboard_new(sizeof(vCPUTime));
-    max_insn_per_quantum = max_insn_per_second / NUM_TIME_UPDATE_PER_SEC;
+
+    if (!ipq_set) {
+        max_insn_per_quantum = max_insn_per_second / NUM_TIME_UPDATE_PER_SEC;
+    }
 
     if (max_insn_per_quantum == 0) {
         fprintf(stderr, "minimum of %d instructions per second needed\n",
-- 
2.39.5
