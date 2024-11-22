Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5204770njc;
        Thu, 21 Nov 2024 23:33:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUtKJ5Wtqghw9VmuuRa02prmBBD+M3fF2B+JhuZ/rGhXhFG3yVrHedGu68tBMl2k62VTyB1DBhI3BdJFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEbs+Auiba2Cv+7f62ekfCnQYA6PE9ryQnhljuYSo8fd+WjL0/3J5/Vy7RQylCXzwr4vqTG
X-Received: by 2002:a67:f8d4:0:b0:4ad:de0b:fe0f with SMTP id ada2fe7eead31-4adde0c0654mr1815782137.3.1732260814826;
        Thu, 21 Nov 2024 23:33:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732260814; cv=none;
        d=google.com; s=arc-20240605;
        b=Xuz5hp47DfKHVhjzEkajPsDpDzACzZspD+QDgAF+3pnKA2DI6ROycZNb6hkk9zhhbd
         vQgFYz63spfaAGS0ZWbSgnTAmtt82gpR5t7usnjI5pcbWbjHfJAxJhX64cKJSGPUK3Ct
         lXfo3x3cn0mo5yvxMNOBDFK3EfZNTyFmMWUF6+qnb/7L9muOrvl1+xRFPw7gD7SjSF/o
         VacVOqZiYGC7s2QuezqLY5SAXY7JEFCS8UdlSGAY95srnj5ZW08bpQeWCFA4soMJdqrO
         YzN6BbVCxvLQWY2OhrKOXheQ9JWbyYAagX8JL8TfUzM8vv2Y7clvVWF9RkRksPy1J2sx
         atPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EAN9ZgSgYXzQoyfhHsGGncmHAd2+uiUHoYcdigIdSY0=;
        fh=09DwpQbNoPR2GB8WyOTSHX+5iSoy0YN8vLTWXRZQNFk=;
        b=MuoIUGKJBhU0iPvFyOLNan6oG8EtoySZ4DXUMtcpLcMRcd4zNs7Ys1ME13SzxBqI7C
         v1qBXyt7SyeGvlkY+DEABZzwzpQgX+gTi7D3a1O7jqwpuamKmVCYqSrsNU+oFoRDXYsL
         /fFjR7hT52M6x89I2xqK2J5CUbzFhO2gLJFZokhAwwleinOttXSeniYt6k+3iD9t/cE4
         JQUws/fAhrU8ZxpWOvnnEX4USkRgFqsOEFiPLscdvB0TxEqrdYYE59rclXuQHKJoGZXM
         7KvhE5G6e+0CKrZYihZ9K6fMDlnBO6rsbqeIIfogOG4TYfoWYTWasYymCZFatlB5fSpt
         x65A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iCVFWXp1;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c3f3442si15325581cf.209.2024.11.21.23.33.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 23:33:34 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iCVFWXp1;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732260814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAN9ZgSgYXzQoyfhHsGGncmHAd2+uiUHoYcdigIdSY0=;
	b=iCVFWXp1P7chj5R7BWKkzTySIlJMRM1NP1sN2of5iVHVHlFyUypKF60bOYlMvaTCvEPHRS
	bTpEkRLmYnwswCfdJrsShhMo3u11os8TlXVE2zETgtJw8mqi+dpLu+ue08wOWST0R8oj9M
	3/IY8qMbXMjL5SoNPUGqEaDSP3mNdD8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-3uV17E0zMMuXgXANY_FyyQ-1; Fri,
 22 Nov 2024 02:33:32 -0500
X-MC-Unique: 3uV17E0zMMuXgXANY_FyyQ-1
X-Mimecast-MFC-AGG-ID: 3uV17E0zMMuXgXANY_FyyQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B009E1955EE9;
	Fri, 22 Nov 2024 07:33:30 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A3C571955F40;
	Fri, 22 Nov 2024 07:33:26 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 2/3] tests/functional: Convert Aspeed arm SDK tests
Date: Fri, 22 Nov 2024 08:33:08 +0100
Message-ID: <20241122073309.1897944-3-clg@redhat.com>
In-Reply-To: <20241122073309.1897944-1-clg@redhat.com>
References: <20241122073309.1897944-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: kSPVHQl20UZl

Drop the SSH connection which was introduced in the avocado tests to
workaround read issues when interacting with console.

EXTRA_BOOTARGS was introduced to reduce the console output at Linux
boot time. This didn't have the desired effect as we still had issues
when trying to match patterns on the console and we had to use the ssh
connection as a workaround.

While at it, remove the U-Boot EXTRA_BOOTARGS variable which has
become useless.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/avocado/machine_aspeed.py     | 124 ----------------------------
 tests/functional/test_arm_aspeed.py |  67 +++++++++++++++
 2 files changed, 67 insertions(+), 124 deletions(-)
 delete mode 100644 tests/avocado/machine_aspeed.py

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
deleted file mode 100644
index 2240c82abff9..000000000000
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
index 5fb1adf46439..7644ecbae750 100755
--- a/tests/functional/test_arm_aspeed.py
+++ b/tests/functional/test_arm_aspeed.py
@@ -252,6 +252,73 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
 
         self.do_test_arm_aspeed_buildroot_poweroff()
 
+    def do_test_arm_aspeed_sdk_start(self, image):
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
2.47.0
