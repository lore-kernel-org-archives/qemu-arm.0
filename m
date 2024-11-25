Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedfb2sm10633531f8f.105.2024.11.25.07.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 07:21:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2DD7363937;
	Mon, 25 Nov 2024 15:21:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PULL 26/28] tests/functional: Convert Aspeed aarch64 SDK tests
Date: Mon, 25 Nov 2024 15:21:03 +0000
Message-Id: <20241125152105.2100395-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125152105.2100395-1-alex.bennee@linaro.org>
References: <20241125152105.2100395-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: la2P6CLdkiUu

From: Cédric Le Goater <clg@redhat.com>

Drop the SSH connection which was introduced in the avocado tests to
workaround read issues when interacting with console.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20241122090322.1934697-2-clg@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 241ef180af..2240c82abf 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -59,17 +59,6 @@ def do_test_arm_aspeed_sdk_start(self, image):
             self, 'boot', '## Loading kernel from FIT Image')
         self.wait_for_console_pattern('Starting kernel ...')
 
-    def do_test_aarch64_aspeed_sdk_start(self, image):
-        self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
-
-        self.vm.launch()
-
-        self.wait_for_console_pattern('U-Boot 2023.10')
-        self.wait_for_console_pattern('## Loading kernel from FIT Image')
-        self.wait_for_console_pattern('Starting kernel ...')
-
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
     def test_arm_ast2500_evb_sdk(self):
         """
@@ -133,70 +122,3 @@ def test_arm_ast2600_evb_sdk(self):
         year = time.strftime("%Y")
         self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
 
-    def test_aarch64_ast2700_evb_sdk_v09_02(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:ast2700-evb
-        """
-
-        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
-                     'download/v09.02/ast2700-default-obmc.tar.gz')
-        image_hash = 'ac969c2602f4e6bdb69562ff466b89ae3fe1d86e1f6797bb7969d787f82116a7'
-        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
-                                      algorithm='sha256')
-        archive.extract(image_path, self.workdir)
-
-        num_cpu = 4
-        image_dir = self.workdir + '/ast2700-default/'
-        uboot_size = os.path.getsize(image_dir + 'u-boot-nodtb.bin')
-        uboot_dtb_load_addr = hex(0x400000000 + uboot_size)
-
-        load_images_list = [
-            {
-                'addr': '0x400000000',
-                'file': image_dir + 'u-boot-nodtb.bin'
-            },
-            {
-                'addr': str(uboot_dtb_load_addr),
-                'file': image_dir + 'u-boot.dtb'
-            },
-            {
-                'addr': '0x430000000',
-                'file': image_dir + 'bl31.bin'
-            },
-            {
-                'addr': '0x430080000',
-                'file': image_dir + 'optee/tee-raw.bin'
-            }
-        ]
-
-        for load_image in load_images_list:
-            addr = load_image['addr']
-            file = load_image['file']
-            self.vm.add_args('-device',
-                             f'loader,force-raw=on,addr={addr},file={file}')
-
-        for i in range(num_cpu):
-            self.vm.add_args('-device',
-                             f'loader,addr=0x430000000,cpu-num={i}')
-
-        self.vm.add_args('-smp', str(num_cpu))
-        self.vm.add_args('-device',
-                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
-        self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
-        self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
-
-        self.ssh_connect('root', '0penBmc', False)
-        self.ssh_command('dmesg -c > /dev/null')
-
-        self.ssh_command_output_contains(
-            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device '
-            '&& dmesg -c',
-            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
-
-        self.ssh_command_output_contains(
-            'cat /sys/class/hwmon/hwmon20/temp1_input', '0')
-        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
-                    property='temperature', value=18000)
-        self.ssh_command_output_contains(
-            'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 923f9e7078..d6d2c0196c 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -11,6 +11,7 @@ endif
 
 # Timeouts for individual tests that can be slow e.g. with debugging enabled
 test_timeouts = {
+  'aarch64_aspeed' : 600,
   'aarch64_raspi4' : 480,
   'aarch64_sbsaref_alpine' : 720,
   'aarch64_sbsaref_freebsd' : 720,
@@ -48,6 +49,7 @@ tests_generic_bsduser = [
 ]
 
 tests_aarch64_system_thorough = [
+  'aarch64_aspeed',
   'aarch64_raspi3',
   'aarch64_raspi4',
   'aarch64_sbsaref',
diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
new file mode 100644
index 0000000000..59916efd71
--- /dev/null
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -0,0 +1,98 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED SoCs with firmware
+#
+# Copyright (C) 2022 ASPEED Technology Inc
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import sys
+import os
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import wait_for_console_pattern
+from qemu_test import exec_command_and_wait_for_pattern
+from qemu_test.utils import archive_extract
+
+class AST2x00MachineSDK(QemuSystemTest):
+
+    def do_test_aarch64_aspeed_sdk_start(self, image):
+        self.require_netdev('user')
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user', '-snapshot')
+
+        self.vm.launch()
+
+        wait_for_console_pattern(self, 'U-Boot 2023.10')
+        wait_for_console_pattern(self, '## Loading kernel from FIT Image')
+        wait_for_console_pattern(self, 'Starting kernel ...')
+
+    ASSET_SDK_V902_AST2700 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.02/ast2700-default-obmc.tar.gz',
+            'ac969c2602f4e6bdb69562ff466b89ae3fe1d86e1f6797bb7969d787f82116a7')
+
+    def test_aarch64_ast2700_evb_sdk_v09_02(self):
+        self.set_machine('ast2700-evb')
+
+        image_path = self.ASSET_SDK_V902_AST2700.fetch()
+        archive_extract(image_path, self.workdir)
+
+        num_cpu = 4
+        image_dir = self.workdir + '/ast2700-default/'
+        uboot_size = os.path.getsize(image_dir + 'u-boot-nodtb.bin')
+        uboot_dtb_load_addr = hex(0x400000000 + uboot_size)
+
+        load_images_list = [
+            {
+                'addr': '0x400000000',
+                'file': image_dir + 'u-boot-nodtb.bin'
+            },
+            {
+                'addr': str(uboot_dtb_load_addr),
+                'file': image_dir + 'u-boot.dtb'
+            },
+            {
+                'addr': '0x430000000',
+                'file': image_dir + 'bl31.bin'
+            },
+            {
+                'addr': '0x430080000',
+                'file': image_dir + 'optee/tee-raw.bin'
+            }
+        ]
+
+        for load_image in load_images_list:
+            addr = load_image['addr']
+            file = load_image['file']
+            self.vm.add_args('-device',
+                             f'loader,force-raw=on,addr={addr},file={file}')
+
+        for i in range(num_cpu):
+            self.vm.add_args('-device',
+                             f'loader,addr=0x430000000,cpu-num={i}')
+
+        self.vm.add_args('-smp', str(num_cpu))
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
+        self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
+
+        wait_for_console_pattern(self, 'ast2700-default login:')
+
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self,
+            '0penBmc', 'root@ast2700-default:~#')
+
+        exec_command_and_wait_for_pattern(self,
+            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
+            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
+        exec_command_and_wait_for_pattern(self,
+            'cat /sys/class/hwmon/hwmon20/temp1_input', '0')
+        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
+                    property='temperature', value=18000)
+        exec_command_and_wait_for_pattern(self,
+            'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.39.5
