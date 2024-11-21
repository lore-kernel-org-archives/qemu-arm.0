Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4616fc2sm61385585e9.22.2024.11.21.08.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1C1525FC6C;
	Thu, 21 Nov 2024 16:58:07 +0000 (GMT)
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
Subject: [PATCH 07/39] tests/functional: remove comments talking about avocado
Date: Thu, 21 Nov 2024 16:57:34 +0000
Message-Id: <20241121165806.476008-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XFy4TMypT8wH

From: Daniel P. Berrangé <berrange@redhat.com>

The first comment is still relevant but should talk about our own test
harness instead. The second comment adds no value over reading the code
and can be removed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-8-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_acpi_bits.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/functional/test_acpi_bits.py b/tests/functional/test_acpi_bits.py
index ee40647d5b..4c192d95cc 100755
--- a/tests/functional/test_acpi_bits.py
+++ b/tests/functional/test_acpi_bits.py
@@ -196,11 +196,12 @@ def copy_test_scripts(self):
         for filename in os.listdir(bits_test_dir):
             if os.path.isfile(os.path.join(bits_test_dir, filename)) and \
                filename.endswith('.py2'):
-                # all test scripts are named with extension .py2 so that
-                # avocado does not try to load them. These scripts are
-                # written for python 2.7 not python 3 and hence if avocado
-                # loaded them, it would complain about python 3 specific
-                # syntaxes.
+                # All test scripts are named with extension .py2 so that
+                # they are not run by accident.
+                #
+                # These scripts are intended to run inside the test VM
+                # and are written for python 2.7 not python 3, hence
+                # would cause syntax errors if loaded ouside the VM.
                 newfilename = os.path.splitext(filename)[0] + '.py'
                 shutil.copy2(os.path.join(bits_test_dir, filename),
                              os.path.join(target_test_dir, newfilename))
@@ -399,8 +400,6 @@ def test_acpi_smbios_bits(self):
 
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # Set timeout to BITS_TIMEOUT for SHUTDOWN event from bits VM at par
-        # with the avocado test timeout.
         self._vm.event_wait('SHUTDOWN', timeout=BITS_TIMEOUT)
         self._vm.wait(timeout=None)
         self.logger.debug("Checking console output ...")
-- 
2.39.5
