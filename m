Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508c83sm702095866b.139.2025.05.06.05.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A30485FAAF;
	Tue,  6 May 2025 13:57:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 06/14] contrib/plugins: allow setting of instructions per quantum
Date: Tue,  6 May 2025 13:57:07 +0100
Message-Id: <20250506125715.232872-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YZ0UDw3njL0x

The default is we update time every 1/10th of a second or so. However
for some cases we might want to update time more frequently. Allow
this to be set via the command line through the ipq argument.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

---
v2
  - checkpatch fixes.
---
 docs/about/emulation.rst |  4 ++++
 contrib/plugins/ips.c    | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index a72591ee4d..456d01d5b0 100644
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
index 9b166a7d6c..62ed8ddd08 100644
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
@@ -177,6 +179,9 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                     return -1;
                 }
             }
+        } else if (g_strcmp0(tokens[0], "ipq") == 0) {
+            max_insn_per_quantum = g_ascii_strtoull(tokens[1], NULL, 10);
+            ipq_set = true;
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
@@ -184,7 +189,10 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
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
