Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d5705000000b002bdbde1d3absm2334319wrv.78.2023.01.24.10.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3AE4F1FFD1;
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
	Peter Maydell <peter.maydell@linaro.org>,
	Emilio Cota <cota@braap.org>
Subject: [PATCH v2 30/35] plugins: make qemu_plugin_user_exit's locking order consistent with fork_start's
Date: Tue, 24 Jan 2023 18:01:22 +0000
Message-Id: <20230124180127.1881110-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RAk7+QNt02WW

From: Emilio Cota <cota@braap.org>

To fix potential deadlocks as reported by tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230111151628.320011-6-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..728bacef95 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -500,10 +500,17 @@ void qemu_plugin_user_exit(void)
     enum qemu_plugin_event ev;
     CPUState *cpu;
 
-    QEMU_LOCK_GUARD(&plugin.lock);
-
+    /*
+     * Locking order: we must acquire locks in an order that is consistent
+     * with the one in fork_start(). That is:
+     * - start_exclusive(), which acquires qemu_cpu_list_lock,
+     *   must be called before acquiring plugin.lock.
+     * - tb_flush(), which acquires mmap_lock(), must be called
+     *   while plugin.lock is not held.
+     */
     start_exclusive();
 
+    qemu_rec_mutex_lock(&plugin.lock);
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
         if (ev != QEMU_PLUGIN_EV_ATEXIT) {
@@ -513,13 +520,12 @@ void qemu_plugin_user_exit(void)
             }
         }
     }
-
-    tb_flush(current_cpu);
-
     CPU_FOREACH(cpu) {
         qemu_plugin_disable_mem_helpers(cpu);
     }
+    qemu_rec_mutex_unlock(&plugin.lock);
 
+    tb_flush(current_cpu);
     end_exclusive();
 
     /* now it's safe to handle the exit case */
-- 
2.34.1
