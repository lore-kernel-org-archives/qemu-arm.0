Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm10582103f8f.33.2024.11.25.07.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 07:26:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 467D863A55;
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
	qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PULL 27/28] tests/functional: Convert Aspeed arm SDK tests
Date: Mon, 25 Nov 2024 15:21:04 +0000
Message-Id: <20241125152105.2100395-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125152105.2100395-1-alex.bennee@linaro.org>
References: <20241125152105.2100395-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LdXwUA5TSPDv

From: Cédric Le Goater <clg@redhat.com>

Drop the SSH connection which was introduced in the avocado tests to
workaround read issues when interacting with console.

EXTRA_BOOTARGS was introduced to reduce the console output at Linux
boot time. This didn't have the desired effect as we still had issues
when trying to match patterns on the console and we had to use the ssh
connection as a workaround.

While at it, remove the U-Boot EXTRA_BOOTARGS variable which has
become useless.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20241122090322.1934697-3-clg@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
deleted file mode 100644
index 2240c82abf..0000000000
--- a/tests/avocado/machine_aspeed.py
+++ /dev/null
@@ -1,124 +0,0 @@
-# Functional test that boots the ASPEED SoCs with firmware
-#
-# Copyright (C) 2022 ASPEED Technology Inc
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or
-# later.  See the COPYING file in the top-level directory.
-
-import time
-import os
-import tempfile
-import subprocess
-
-from avocado_qemu import LinuxSSHMixIn
-from avocado_qemu import QemuSystemTest
-from avocado_qemu import wait_for_console_pattern
-from avocado_qemu import exec_command
-from avocado_qemu import exec_command_and_wait_for_pattern
-from avocado_qemu import interrupt_interactive_console_until_pattern
-from avocado_qemu import has_cmd
-from avocado.utils import archive
-from avocado import skipUnless
-
-class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
-
-    EXTRA_BOOTARGS = (
-        'quiet '
-        'systemd.mask=org.openbmc.HostIpmi.service '
-        'systemd.mask=xyz.openbmc_project.Chassis.Control.Power@0.service '
-        'systemd.mask=modprobe@fuse.service '
-        'systemd.mask=rngd.service '
-        'systemd.mask=obmc-console@ttyS2.service '
-    )
-
-    # FIXME: Although these tests boot a whole distro they are still
-    # slower than comparable machine models. There may be some
-    # optimisations which bring down the runtime. In the meantime they
-    # have generous timeouts and are disable for CI which aims for all
-    # tests to run in less than 60 seconds.
-    timeout = 240
-
-    def wait_for_console_pattern(self, success_message, vm=None):
-        wait_for_console_pattern(self, success_message,
-                                 failure_message='Kernel panic - not syncing',
-                                 vm=vm)
-
-    def do_test_arm_aspeed_sdk_start(self, image):
-        self.require_netdev('user')
-        self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
-        self.vm.launch()
-
-        self.wait_for_console_pattern('U-Boot 2019.04')
-        interrupt_interactive_console_until_pattern(
-            self, 'Hit any key to stop autoboot:', 'ast#')
-        exec_command_and_wait_for_pattern(
-            self, 'setenv bootargs ${bootargs} ' + self.EXTRA_BOOTARGS, 'ast#')
-        exec_command_and_wait_for_pattern(
-            self, 'boot', '## Loading kernel from FIT Image')
-        self.wait_for_console_pattern('Starting kernel ...')
-
-    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-    def test_arm_ast2500_evb_sdk(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:ast2500-evb
-        :avocado: tags=flaky
-        """
-
-        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
-                     'download/v08.06/ast2500-default-obmc.tar.gz')
-        image_hash = ('e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
-        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
-                                      algorithm='sha256')
-        archive.extract(image_path, self.workdir)
-
-        self.do_test_arm_aspeed_sdk_start(
-            self.workdir + '/ast2500-default/image-bmc')
-        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
-
-    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-    def test_arm_ast2600_evb_sdk(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:ast2600-evb
-        :avocado: tags=flaky
-        """
-
-        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
-                     'download/v08.06/ast2600-a2-obmc.tar.gz')
-        image_hash = ('9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
-        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
-                                      algorithm='sha256')
-        archive.extract(image_path, self.workdir)
-
-        self.vm.add_args('-device',
-                         'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
-        self.vm.add_args('-device',
-                         'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
-        self.do_test_arm_aspeed_sdk_start(
-            self.workdir + '/ast2600-a2/image-bmc')
-        self.wait_for_console_pattern('nodistro.0 ast2600-a2 ttyS4')
-
-        self.ssh_connect('root', '0penBmc', False)
-        self.ssh_command('dmesg -c > /dev/null')
-
-        self.ssh_command_output_contains(
-             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device ; '
-             'dmesg -c',
-             'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
-        self.ssh_command_output_contains(
-                             'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
-        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
-                    property='temperature', value=18000);
-        self.ssh_command_output_contains(
-                             'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
-
-        self.ssh_command_output_contains(
-             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device ; '
-             'dmesg -c',
-             'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
-        year = time.strftime("%Y")
-        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
-
diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
index 5fb1adf464..c2c152229b 100755
--- a/tests/functional/test_arm_aspeed.py
+++ b/tests/functional/test_arm_aspeed.py
@@ -252,6 +252,74 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
 
         self.do_test_arm_aspeed_buildroot_poweroff()
 
+    def do_test_arm_aspeed_sdk_start(self, image):
+        self.require_netdev('user')
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user', '-snapshot')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('U-Boot 2019.04')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+
+    ASSET_SDK_V806_AST2500 = Asset(
+        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2500-default-obmc.tar.gz',
+        'e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
+
+    def test_arm_ast2500_evb_sdk(self):
+        self.set_machine('ast2500-evb')
+
+        image_path = self.ASSET_SDK_V806_AST2500.fetch()
+
+        archive_extract(image_path, self.workdir)
+
+        self.do_test_arm_aspeed_sdk_start(
+            self.workdir + '/ast2500-default/image-bmc')
+
+        self.wait_for_console_pattern('ast2500-default login:')
+
+    ASSET_SDK_V806_AST2600_A2 = Asset(
+        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2600-a2-obmc.tar.gz',
+        '9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
+
+    def test_arm_ast2600_evb_sdk(self):
+        self.set_machine('ast2600-evb')
+
+        image_path = self.ASSET_SDK_V806_AST2600_A2.fetch()
+
+        archive_extract(image_path, self.workdir)
+
+        self.vm.add_args('-device',
+            'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
+        self.vm.add_args('-device',
+            'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
+        self.do_test_arm_aspeed_sdk_start(
+            self.workdir + '/ast2600-a2/image-bmc')
+
+        self.wait_for_console_pattern('ast2600-a2 login:')
+
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-a2:~#')
+
+        exec_command_and_wait_for_pattern(self,
+            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
+            'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
+        exec_command_and_wait_for_pattern(self,
+             'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
+        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
+                    property='temperature', value=18000);
+        exec_command_and_wait_for_pattern(self,
+             'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
+
+        exec_command_and_wait_for_pattern(self,
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
+             'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
+        year = time.strftime("%Y")
+        exec_command_and_wait_for_pattern(self,
+             '/sbin/hwclock -f /dev/rtc1', year);
+
+
 class AST2x00MachineMMC(LinuxKernelTest):
 
     ASSET_RAINIER_EMMC = Asset(
-- 
2.39.5
