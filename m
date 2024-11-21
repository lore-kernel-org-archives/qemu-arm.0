Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc44f7sm18708f8f.82.2024.11.21.08.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7AA3D60357;
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
Subject: [PATCH 11/39] tests/functional: enable debug logging for QEMUMachine
Date: Thu, 21 Nov 2024 16:57:38 +0000
Message-Id: <20241121165806.476008-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: e3kElklE7xQe

From: Daniel P. Berrangé <berrange@redhat.com>

Set the 'qemu.machine' logger to 'DEBUG' level, to ensure we see log
messages related to the QEMUMachine class. Most importantly this
ensures we capture the full QEMU command line args for instances we
spawn.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-12-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index f9c9de1166..e2a329c3e5 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -57,9 +57,15 @@ def setUp(self, bin_prefix):
         self._log_fh.setFormatter(fileFormatter)
         self.log.addHandler(self._log_fh)
 
+        # Capture QEMUMachine logging
+        self.machinelog = logging.getLogger('qemu.machine')
+        self.machinelog.setLevel(logging.DEBUG)
+        self.machinelog.addHandler(self._log_fh)
+
     def tearDown(self):
         if "QEMU_TEST_KEEP_SCRATCH" not in os.environ:
             shutil.rmtree(self.workdir)
+        self.machinelog.removeHandler(self._log_fh)
         self.log.removeHandler(self._log_fh)
 
     def main():
-- 
2.39.5
