Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id s35-20020a05600c31a300b003db0dbbea53sm2490011wmp.30.2023.01.24.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:01:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 067FB1FFBC;
	Tue, 24 Jan 2023 18:01:28 +0000 (GMT)
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
Subject: [PATCH v2 04/35] tests/unit: drop hacky race avoidance in test-io-channel-command
Date: Tue, 24 Jan 2023 18:00:56 +0000
Message-Id: <20230124180127.1881110-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RtBZyBxiGgXl

We don't need to play timing games to ensure one socat wins over the
other, just create the fifo they both can use before spawning the
processes. However in the process we need to disable two tests for
Windows platforms as we don't have an abstraction for mkfifo().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-io-channel-command.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 19f72eab96..425e2f5594 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -20,6 +20,8 @@
 
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
 #include "io/channel-command.h"
 #include "io-channel-helpers.h"
 #include "qapi/error.h"
@@ -29,6 +31,7 @@
 
 static char *socat = NULL;
 
+#ifndef _WIN32
 static void test_io_channel_command_fifo(bool async)
 {
     g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
@@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
     QIOChannel *src, *dst;
     QIOChannelTest *test;
 
+    if (mkfifo(fifo, 0600)) {
+        g_error("mkfifo: %s", strerror(errno));
+    }
+
     src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
-    /* try to avoid a race to create the socket */
-    g_usleep(1000);
-
     dst = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) dstargv,
                                                     O_RDONLY,
                                                     &error_abort));
@@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)
     g_rmdir(tmpdir);
 }
 
-
 static void test_io_channel_command_fifo_async(void)
 {
     if (!socat) {
@@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)
 
     test_io_channel_command_fifo(false);
 }
+#endif
 
 
 static void test_io_channel_command_echo(bool async)
@@ -124,10 +128,12 @@ int main(int argc, char **argv)
 
     socat = g_find_program_in_path("socat");
 
+#ifndef _WIN32
     g_test_add_func("/io/channel/command/fifo/sync",
                     test_io_channel_command_fifo_sync);
     g_test_add_func("/io/channel/command/fifo/async",
                     test_io_channel_command_fifo_async);
+#endif
     g_test_add_func("/io/channel/command/echo/sync",
                     test_io_channel_command_echo_sync);
     g_test_add_func("/io/channel/command/echo/async",
-- 
2.34.1
