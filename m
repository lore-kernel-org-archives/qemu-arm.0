Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q2-20020adff502000000b002c573a6216fsm2427049wro.37.2023.02.21.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:46:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 98CEE1FFBD;
	Tue, 21 Feb 2023 09:45:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 05/14] tests: make fp-test less chatty when running from test suite
Date: Tue, 21 Feb 2023 09:45:49 +0000
Message-Id: <20230221094558.2864616-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SHapPAT8PWjN

As we like to run tests under CI with V=1 flags the softfloat tests
can add up to a fair amount of extra log lines. With an update to the
testfloat library we can now call fp-test with the -q flag and reduce
the output to a terse one line per function tested.

  make check-softfloat V=1 | wc -l
  759

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/fp/fp-test.c            | 19 ++++++++++++++-----
 tests/fp/berkeley-testfloat-3 |  2 +-
 tests/fp/meson.build          |  2 +-
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 35829ad5f7..36b5712cda 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -106,7 +106,8 @@ static const char commands_string[] =
     " -l = thoroughness level (1 (default), 2)\n"
     " -r = rounding mode (even (default), zero, down, up, tieaway, odd)\n"
     "      Set to 'all' to test all rounding modes, if applicable\n"
-    " -s = stop when a test fails";
+    " -s = stop when a test fails\n"
+    " -q = minimise noise when testing, just show each function being tested";
 
 static void usage_complete(int argc, char *argv[])
 {
@@ -190,9 +191,11 @@ static void do_testfloat(int op, int rmode, bool exact)
     ab_f128M_z_bool true_ab_f128M_z_bool;
     ab_f128M_z_bool subj_ab_f128M_z_bool;
 
-    fputs(">> Testing ", stderr);
-    verCases_writeFunctionName(stderr);
-    fputs("\n", stderr);
+    if (verCases_verbosity) {
+        fputs(">> Testing ", stderr);
+        verCases_writeFunctionName(stderr);
+        fputs("\n", stderr);
+    }
 
     if (!is_allowed(op, rmode)) {
         not_implemented();
@@ -837,7 +840,7 @@ static void parse_args(int argc, char *argv[])
     int c;
 
     for (;;) {
-        c = getopt(argc, argv, "he:f:l:r:s");
+        c = getopt(argc, argv, "he:f:l:r:sq");
         if (c < 0) {
             break;
         }
@@ -874,9 +877,15 @@ static void parse_args(int argc, char *argv[])
                 }
             }
             break;
+        /*
+         * The following flags are declared in testfloat/source/verCases_common.c
+         */
         case 's':
             verCases_errorStop = true;
             break;
+        case 'q':
+            verCases_verbosity = 0;
+            break;
         case '?':
             /* invalid option or missing argument; getopt prints error info */
             exit(EXIT_FAILURE);
diff --git a/tests/fp/berkeley-testfloat-3 b/tests/fp/berkeley-testfloat-3
index 5a59dcec19..40619cbb3b 160000
--- a/tests/fp/berkeley-testfloat-3
+++ b/tests/fp/berkeley-testfloat-3
@@ -1 +1 @@
-Subproject commit 5a59dcec19327396a011a17fd924aed4fec416b3
+Subproject commit 40619cbb3bf32872df8c53cc457039229428a263
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 312a4d301f..f9ca6a93b4 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -609,7 +609,7 @@ softfloat_tests = {
 # The full test suite can take a bit of time, default to a quick run
 # "-l 2 -r all" can take more than a day for some operations and is best
 # run manually
-fptest_args = ['-s', '-l', '1']
+fptest_args = ['-q', '-s', '-l', '1']
 fptest_rounding_args = ['-r', 'all']
 
 # Conversion Routines:
-- 
2.39.1
