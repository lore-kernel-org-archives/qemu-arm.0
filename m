Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad627bsm56549f8f.12.2024.11.21.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:06:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 13BE460406;
	Thu, 21 Nov 2024 16:58:08 +0000 (GMT)
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
Subject: [PATCH 18/39] tests/functional: avoid accessing log_filename on earlier failures
Date: Thu, 21 Nov 2024 16:57:45 +0000
Message-Id: <20241121165806.476008-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xUShC6fdVHOB

From: Daniel P. Berrangé <berrange@redhat.com>

If a failure occurs early in the QemuBaseTest constructor, the
'log_filename' object atttribute may not exist yet. This happens
most notably if the QEMU_TEST_QEMU_BINARY is not set. We can't
initialize 'log_filename' earlier as we use the binary to identify
the architecture which is then used to build the path in which the
logs are stored.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-19-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index fceafb32b0..90ae59eb54 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -81,10 +81,12 @@ def main():
         res = unittest.main(module = None, testRunner = tr, exit = False,
                             argv=["__dummy__", path])
         for (test, message) in res.result.errors + res.result.failures:
-            print('More information on ' + test.id() + ' could be found here:'
-                  '\n %s' % test.log_filename, file=sys.stderr)
-            if hasattr(test, 'console_log_name'):
-                print(' %s' % test.console_log_name, file=sys.stderr)
+
+            if hasattr(test, "log_filename"):
+                print('More information on ' + test.id() + ' could be found here:'
+                      '\n %s' % test.log_filename, file=sys.stderr)
+                if hasattr(test, 'console_log_name'):
+                    print(' %s' % test.console_log_name, file=sys.stderr)
         sys.exit(not res.result.wasSuccessful())
 
 
-- 
2.39.5
