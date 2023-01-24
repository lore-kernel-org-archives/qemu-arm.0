Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c2cad00b003cfa622a18asm15401351wmc.3.2023.01.24.10.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:06:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BDE071FFD9;
	Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 35/35] plugins: Iterate on cb_lists in qemu_plugin_user_exit
Date: Tue, 24 Jan 2023 18:01:27 +0000
Message-Id: <20230124180127.1881110-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: C/2Xd0aXRJ6K

From: Richard Henderson <richard.henderson@linaro.org>

Rather than iterate over all plugins for all events,
iterate over plugins that have registered a given event.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230117035701.168514-4-richard.henderson@linaro.org>
---
 plugins/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index 728bacef95..e04ffa1ba4 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -514,9 +514,10 @@ void qemu_plugin_user_exit(void)
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
         if (ev != QEMU_PLUGIN_EV_ATEXIT) {
-            struct qemu_plugin_ctx *ctx;
-            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
-                plugin_unregister_cb__locked(ctx, ev);
+            struct qemu_plugin_cb *cb, *next;
+
+            QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
+                plugin_unregister_cb__locked(cb->ctx, ev);
             }
         }
     }
-- 
2.34.1
