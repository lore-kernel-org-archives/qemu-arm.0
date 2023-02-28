Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d4565000000b002c3f81c51b6sm10358330wrc.90.2023.02.28.11.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:07:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1FA811FFBB;
	Tue, 28 Feb 2023 19:06:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH v3 16/24] tests: Ensure TAP version is printed before other messages
Date: Tue, 28 Feb 2023 19:06:45 +0000
Message-Id: <20230228190653.1602033-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: j7KRROblz90k

From: "Richard W.M. Jones" <rjones@redhat.com>

These two tests were failing with this error:

  stderr:
  TAP parsing error: version number must be on the first line
  [...]
  Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.

This can be fixed by ensuring we always call g_test_init first in the
body of main.

Thanks: Daniel Berrange, for diagnosing the problem
Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20230227174019.1164205-1-rjones@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
 tests/qtest/rtl8139-test.c         | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index a9254b455d..2012bd54b7 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
 
 int main(int argc, char **argv)
 {
+    g_test_init(&argc, &argv, NULL);
+
     if (!qtest_has_device("lsi53c895a")) {
         return 0;
     }
 
-    g_test_init(&argc, &argv, NULL);
-
     qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
                    test_lsi_do_dma_empty_queue);
 
diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index 1beb83805c..4bd240e9ee 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -207,9 +207,10 @@ int main(int argc, char **argv)
         verbosity_level = atoi(v_env);
     }
 
+    g_test_init(&argc, &argv, NULL);
+
     qtest_start("-device rtl8139");
 
-    g_test_init(&argc, &argv, NULL);
     qtest_add_func("/rtl8139/nop", nop);
     qtest_add_func("/rtl8139/timer", test_init);
 
-- 
2.39.2
