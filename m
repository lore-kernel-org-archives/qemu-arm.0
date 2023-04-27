Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c10-20020a7bc2aa000000b003f080b2f9f4sm24820201wmk.27.2023.04.27.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9696D1FFB8;
	Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PULL 09/18] tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
Date: Thu, 27 Apr 2023 16:45:01 +0100
Message-Id: <20230427154510.1791273-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oB0coPI4UwDz

From: Thomas Huth <thuth@redhat.com>

test_arm_ast2500_evb_sdk and test_arm_ast2600_evb_sdk are currently
failing. The problem is that they are trying to look for the login
prompt that does not have a newline at the end - but the logic in
_console_interaction() only handles full lines. It used to work by
accident in the past since there were sometimes kernel (warning and
error) messages popping up that finally provided a newline character
in the output, but since the tests have been changed to run with the
"quiet" kernel parameter, this is not working anymore.

To make this work reliably, we must not look for the "login:" prompt,
but have to use some text ending with a newline instead. And in the
ast2600 test, switch to ssh instead of trying to log into the serial
console - this works much more reliable and also has the benefit of
excercising the network interface here a little bit, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230421110345.1294131-3-thuth@redhat.com>
[AJB: remove stray debug log]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230424092249.58552-10-alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 2b532c4834..724ee72c02 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -10,6 +10,7 @@
 import tempfile
 import subprocess
 
+from avocado_qemu import LinuxSSHMixIn
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
@@ -268,7 +269,7 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
 
         self.do_test_arm_aspeed_buildroot_poweroff()
 
-class AST2x00MachineSDK(QemuSystemTest):
+class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
 
     EXTRA_BOOTARGS = (
         'quiet '
@@ -295,7 +296,7 @@ def do_test_arm_aspeed_sdk_start(self, image):
         self.require_netdev('user')
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic', '-net', 'user')
+                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
         self.vm.launch()
 
         self.wait_for_console_pattern('U-Boot 2019.04')
@@ -323,7 +324,7 @@ def test_arm_ast2500_evb_sdk(self):
 
         self.do_test_arm_aspeed_sdk_start(
             self.workdir + '/ast2500-default/image-bmc')
-        self.wait_for_console_pattern('ast2500-default login:')
+        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_arm_ast2600_evb_sdk(self):
@@ -345,22 +346,25 @@ def test_arm_ast2600_evb_sdk(self):
                          'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
         self.do_test_arm_aspeed_sdk_start(
             self.workdir + '/ast2600-default/image-bmc')
-        self.wait_for_console_pattern('ast2600-default login:')
-        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-default:~#')
+        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
 
-        exec_command_and_wait_for_pattern(self,
-             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
+        self.ssh_connect('root', '0penBmc', False)
+        self.ssh_command('dmesg -c > /dev/null')
+
+        self.ssh_command_output_contains(
+             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device ; '
+             'dmesg -c',
              'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
-        exec_command_and_wait_for_pattern(self,
+        self.ssh_command_output_contains(
                              'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
         self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
                         property='temperature', value=18000);
-        exec_command_and_wait_for_pattern(self,
+        self.ssh_command_output_contains(
                              'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
 
-        exec_command_and_wait_for_pattern(self,
-             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
+        self.ssh_command_output_contains(
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device ; '
+             'dmesg -c',
              'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
         year = time.strftime("%Y")
-        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
+        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
-- 
2.39.2
