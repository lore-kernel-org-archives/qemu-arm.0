Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fec86sm933025666b.7.2025.06.03.04.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:02:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 59A5B5F9D2;
	Tue, 03 Jun 2025 12:02:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH v4 05/17] contrib/plugins: add a scaling factor to the ips arg
Date: Tue,  3 Jun 2025 12:01:52 +0100
Message-ID: <20250603110204.838117-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250603110204.838117-1-alex.bennee@linaro.org>
References: <20250603110204.838117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: i6peiLZ6eESi

It's easy to get lost in zeros while setting the numbers of
instructions per second. Add a scaling suffix to make things simpler.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

---
v2
  - normalise the suffix before a full strcmp0
  - check endptr actually set
  - fix checkpatch
  - scale_entry -> ScaleEntry
  - drop hz from suffix
---
 contrib/plugins/ips.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
index e5297dbb01..eb4418c25b 100644
--- a/contrib/plugins/ips.c
+++ b/contrib/plugins/ips.c
@@ -129,6 +129,18 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
     qemu_plugin_scoreboard_free(vcpus);
 }
 
+typedef struct {
+    const char *suffix;
+    unsigned long multipler;
+} ScaleEntry;
+
+/* a bit like units.h but not binary */
+static ScaleEntry scales[] = {
+    { "k", 1000 },
+    { "m", 1000 * 1000 },
+    { "g", 1000 * 1000 * 1000 },
+};
+
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info, int argc,
                                            char **argv)
@@ -137,12 +149,32 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
         char *opt = argv[i];
         g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
         if (g_strcmp0(tokens[0], "ips") == 0) {
-            max_insn_per_second = g_ascii_strtoull(tokens[1], NULL, 10);
+            char *endptr = NULL;
+            max_insn_per_second = g_ascii_strtoull(tokens[1], &endptr, 10);
             if (!max_insn_per_second && errno) {
                 fprintf(stderr, "%s: couldn't parse %s (%s)\n",
                         __func__, tokens[1], g_strerror(errno));
                 return -1;
             }
+
+            if (endptr && *endptr != 0) {
+                g_autofree gchar *lower = g_utf8_strdown(endptr, -1);
+                unsigned long scale = 0;
+
+                for (int j = 0; j < G_N_ELEMENTS(scales); j++) {
+                    if (g_strcmp0(lower, scales[j].suffix) == 0) {
+                        scale = scales[j].multipler;
+                        break;
+                    }
+                }
+
+                if (scale) {
+                    max_insn_per_second *= scale;
+                } else {
+                    fprintf(stderr, "bad suffix: %s\n", endptr);
+                    return -1;
+                }
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.47.2
