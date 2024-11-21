Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5f59sm38965f8f.10.2024.11.21.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9B2825F940;
	Thu, 21 Nov 2024 16:58:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-riscv@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-s390x@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-rust@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ani Sinha <anisinha@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 02/39] tests/functional: automatically clean up scratch files after tests
Date: Thu, 21 Nov 2024 16:57:29 +0000
Message-Id: <20241121165806.476008-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3Ckmth7bDGGi

From: Daniel P. Berrangé <berrange@redhat.com>

The build/tests/functional subdirectories are consuming huge amounts
of disk space.

Split the location for scratch files into a 'scratch' sub-directory,
separate from log files, and delete it upon completion of each test.
The new env variable QEMU_TEST_KEEP_SCRATCH can be set to preserve
this scratch dir for debugging access if required.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing/functional.rst      |  6 ++++++
 tests/functional/qemu_test/testcase.py | 14 +++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/docs/devel/testing/functional.rst b/docs/devel/testing/functional.rst
index bf6f1bb81e..6b5d0c5b98 100644
--- a/docs/devel/testing/functional.rst
+++ b/docs/devel/testing/functional.rst
@@ -65,6 +65,12 @@ to the QEMU binary that should be used for the test, for example::
   $ export QEMU_TEST_QEMU_BINARY=$PWD/qemu-system-x86_64
   $ python3 ../tests/functional/test_file.py
 
+The test framework will automatically purge any scratch files created during
+the tests. If needing to debug a failed test, it is possible to keep these
+files around on disk by setting ```QEMU_TEST_KEEP_SCRATCH=1``` as an env
+variable.  Any preserved files will be deleted the next time the test is run
+without this variable set.
+
 Overview
 --------
 
diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index 411978b5ef..b9418e2ac0 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -13,8 +13,9 @@
 
 import logging
 import os
-import subprocess
 import pycotap
+import shutil
+import subprocess
 import sys
 import unittest
 import uuid
@@ -40,11 +41,12 @@ def setUp(self, bin_prefix):
         self.assertIsNotNone(self.qemu_bin, 'QEMU_TEST_QEMU_BINARY must be set')
         self.arch = self.qemu_bin.split('-')[-1]
 
-        self.workdir = os.path.join(BUILD_DIR, 'tests/functional', self.arch,
-                                    self.id())
+        self.outputdir = os.path.join(BUILD_DIR, 'tests', 'functional',
+                                      self.arch, self.id())
+        self.workdir = os.path.join(self.outputdir, 'scratch')
         os.makedirs(self.workdir, exist_ok=True)
 
-        self.logdir = self.workdir
+        self.logdir = self.outputdir
         self.log_filename = os.path.join(self.logdir, 'base.log')
         self.log = logging.getLogger('qemu-test')
         self.log.setLevel(logging.DEBUG)
@@ -56,6 +58,8 @@ def setUp(self, bin_prefix):
         self.log.addHandler(self._log_fh)
 
     def tearDown(self):
+        if "QEMU_TEST_KEEP_SCRATCH" not in os.environ:
+            shutil.rmtree(self.workdir)
         self.log.removeHandler(self._log_fh)
 
     def main():
@@ -108,7 +112,7 @@ def setUp(self):
 
         console_log = logging.getLogger('console')
         console_log.setLevel(logging.DEBUG)
-        self.console_log_name = os.path.join(self.workdir, 'console.log')
+        self.console_log_name = os.path.join(self.logdir, 'console.log')
         self._console_log_fh = logging.FileHandler(self.console_log_name,
                                                    mode='w')
         self._console_log_fh.setLevel(logging.DEBUG)
-- 
2.39.5
