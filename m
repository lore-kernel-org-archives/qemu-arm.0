Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed70611sm627048766b.143.2025.04.28.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:59:20 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9B2F45FAEC;
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
Subject: [PATCH 4/9] contrib/plugins: add a scaling factor to the ips arg
Date: Mon, 28 Apr 2025 13:59:13 +0100
Message-Id: <20250428125918.449346-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250428125918.449346-1-alex.bennee@linaro.org>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X9Mf3bNNYOh4

It's easy to get lost in zeros while setting the numbers of
instructions per second. Add a scaling suffix to make things simpler.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/ips.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
index e5297dbb01..1952e0866d 100644
--- a/contrib/plugins/ips.c
+++ b/contrib/plugins/ips.c
@@ -20,6 +20,8 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+
 /* how many times do we update time per sec */
 #define NUM_TIME_UPDATE_PER_SEC 10
 #define NSEC_IN_ONE_SEC (1000 * 1000 * 1000)
@@ -129,6 +131,18 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
     qemu_plugin_scoreboard_free(vcpus);
 }
 
+typedef struct {
+    const char* suffix;
+    unsigned long multipler;
+} scale_entry;
+
+/* a bit like units.h but not binary */
+static scale_entry scales[] = {
+    { "khz", 1000 },
+    { "mhz", 1000 * 1000 },
+    { "ghz", 1000 * 1000 * 1000 },
+};
+
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info, int argc,
                                            char **argv)
@@ -137,12 +151,19 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
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
+            for (int j = 0; j < ARRAY_SIZE(scales); j++) {
+                if (g_str_has_suffix(endptr, scales[j].suffix)) {
+                        max_insn_per_second *= scales[j].multipler;
+                        break;
+                }
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.39.5
