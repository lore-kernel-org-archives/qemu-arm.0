Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm599441955e9.32.2025.01.07.08.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:57:55 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A3C495F8FE;
	Tue,  7 Jan 2025 16:52:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-riscv@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-s390x@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Fabiano Rosas <farosas@suse.de>,
	Weiwei Li <liwei1518@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eric Farman <farman@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 18/29] tests/functional: remove hacky sleep from the tests
Date: Tue,  7 Jan 2025 16:51:56 +0000
Message-Id: <20250107165208.743958-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XxIuZJCecsbn

We have proper detection of prompts now so we don't need to guess with
sleep() sprinkled through the test. The extra step of calling halt is
just to flush the final bits of the log (although the last line is
still missed).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---
v2
  - avoid long lines by iterating through an array
  - drop time import
v3
  - fix up on re-base
  - drop stray import os that had sneaked in
---
 tests/functional/test_aarch64_virt.py | 32 +++++++++++++++------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index 08576b0694..2d9995a95d 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -10,12 +10,12 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import time
 import logging
 from subprocess import check_call, DEVNULL
 
 from qemu_test import QemuSystemTest, Asset
-from qemu_test import exec_command, wait_for_console_pattern
+from qemu_test import exec_command_and_wait_for_pattern
+from qemu_test import wait_for_console_pattern
 from qemu_test import get_qemu_img
 
 
@@ -107,18 +107,22 @@ def common_aarch64_virt(self, machine):
                          'virtio-blk-device,drive=scratch')
 
         self.vm.launch()
-        self.wait_for_console_pattern('Welcome to Buildroot')
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
-        exec_command(self, 'dd if=/dev/hwrng of=/dev/vda bs=512 count=4')
-        time.sleep(0.1)
-        exec_command(self, 'md5sum /dev/vda')
-        time.sleep(0.1)
-        exec_command(self, 'cat /proc/interrupts')
-        time.sleep(0.1)
-        exec_command(self, 'cat /proc/self/maps')
-        time.sleep(0.1)
+
+        ps1='#'
+        self.wait_for_console_pattern('login:')
+
+        commands = [
+            ('root', ps1),
+            ('cat /proc/interrupts', ps1),
+            ('cat /proc/self/maps', ps1),
+            ('uname -a', ps1),
+            ('dd if=/dev/hwrng of=/dev/vda bs=512 count=4', ps1),
+            ('md5sum /dev/vda', ps1),
+            ('halt -n', 'reboot: System halted')
+        ]
+
+        for cmd, pattern in commands:
+            exec_command_and_wait_for_pattern(self, cmd, pattern)
 
     def test_aarch64_virt_gicv3(self):
         self.common_aarch64_virt("virt,gic_version=3")
-- 
2.39.5
