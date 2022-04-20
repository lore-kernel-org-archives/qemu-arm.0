Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id kk23-20020a170907767700b006e8a6e53a7bsm6943928ejc.139.2022.04.20.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:08:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6795A1FFB8;
	Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 01/25] tests/avocado: update aarch64_virt test to exercise -cpu max
Date: Wed, 20 Apr 2022 19:08:08 +0100
Message-Id: <20220420180832.3812543-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 57Bxcqm/SPT9

The Fedora 29 kernel is quite old and importantly fails when running
in LPA2 scenarios. As it's not really exercising much of the CPU space
replace it with a custom 5.16.12 kernel with all the architecture
options turned on. There is a minimal buildroot initramfs included in
the kernel which has a few tools for stress testing the memory
subsystem. The userspace also targets the Neoverse N1 processor so
would fail with a v8.0 cpu like cortex-a53.

While we are at it move the test into its own file so it can have an
assigned maintainer.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-2-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad2451e03..dcedfaed1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -942,6 +942,7 @@ S: Maintained
 F: hw/arm/virt*
 F: include/hw/arm/virt.h
 F: docs/system/arm/virt.rst
+F: tests/avocado/machine_aarch64_virt.py
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index b40a3abc81..45a2ceda22 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -325,31 +325,6 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
         self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
 
-    def test_aarch64_virt(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a53
-        """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
-                      '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
-                      '/vmlinuz')
-        kernel_hash = '8c73e469fc6ea06a58dc83a628fc695b693b8493'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'console=ttyAMA0')
-        self.require_accelerator("tcg")
-        self.vm.add_args('-cpu', 'cortex-a53',
-                         '-accel', 'tcg',
-                         '-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
-
     def test_aarch64_xlnx_versal_virt(self):
         """
         :avocado: tags=arch:aarch64
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
new file mode 100644
index 0000000000..21848cba70
--- /dev/null
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -0,0 +1,51 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# Copyright (c) 2022 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import time
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+
+class Aarch64VirtMachine(QemuSystemTest):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def test_aarch64_virt(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:max
+        """
+        kernel_url = ('https://fileserver.linaro.org/s/'
+                      'z6B2ARM7DQT3HWN/download')
+
+        kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0')
+        self.require_accelerator("tcg")
+        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
+                         '-accel', 'tcg',
+                         '-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/self/maps')
+        time.sleep(0.1)
-- 
2.30.2
