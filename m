Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c459200b003dc4baaedd3sm3367513wmo.37.2023.02.15.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 09D2F1FFBC;
	Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Darren Kenny <darren.kenny@oracle.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 04/12] tests: be a bit more strict cleaning up fifos
Date: Wed, 15 Feb 2023 19:25:22 +0000
Message-Id: <20230215192530.299263-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ic8Nmmw3xF1r

When we re-factored we dropped the unlink() step which turns out to be
required for rmdir to do its thing. If we had been checking the return
value we would have noticed so lets do that with this fix.

Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-io-channel-command.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index f3c34152ac..70e82e0e12 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -42,6 +42,7 @@ static void test_io_channel_command_fifo(bool async)
     g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
     QIOChannel *src, *dst;
     QIOChannelTest *test;
+    int err;
 
     if (mkfifo(fifo, 0600)) {
         g_error("mkfifo: %s", strerror(errno));
@@ -61,7 +62,10 @@ static void test_io_channel_command_fifo(bool async)
     object_unref(OBJECT(src));
     object_unref(OBJECT(dst));
 
-    g_rmdir(tmpdir);
+    err = g_unlink(fifo);
+    g_assert(err == 0);
+    err = g_rmdir(tmpdir);
+    g_assert(err == 0);
 }
 
 static void test_io_channel_command_fifo_async(void)
-- 
2.39.1
