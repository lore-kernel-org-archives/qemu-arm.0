Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5243750njc;
        Fri, 22 Nov 2024 01:03:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsBc/n5ouhQ2nfaILdLxymTDaws/cYgkuntwwqOjveTov1L5Dgkw5d+6j+OJ73iG4JAHpqi1f7GtTfqw==@linaro.org
X-Google-Smtp-Source: AGHT+IGa5Hw1YRkFVkjt3PwXVHRX4AGHPTyu8mo+eQzirJVMbgjLLBbYQKnaeVASWnc4FDAYkV5z
X-Received: by 2002:a05:622a:190a:b0:460:b165:2e04 with SMTP id d75a77b69052e-4653d538618mr27595581cf.4.1732266228432;
        Fri, 22 Nov 2024 01:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732266228; cv=none;
        d=google.com; s=arc-20240605;
        b=UDNwQmv2WhR2ep2wx6xqFbw6wiYE1rtEpLNoJVtvlEoRdI/V4APzNIOi4PpC/+efef
         yr4/WYBtkVka42vb9XlGw3eurnOLAQJOqJUBJT7MOl2p9LISfuekY45GJ7MzE7ATQFHW
         o2U8hoSkP2DMJ28nsolkUextjFWzeFmdMxKJQYgjspQnKMA3ZJ2rWFe40AkzgeJGScus
         QPUYYTXN2skImGX/bgCzZgo9azbdjd0MR4In4Gts3+yJ5+A+GfFzO0rUNjOYd+T0mM7P
         s40SRGgK6H6mGeogElQh0zoWi0bFIhvPoSoWJ51KYrsuRws41WkAwms3zm87zw4t2ItG
         MuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=awhrc7OMqrsZeOHfhKb5G3t5SPFLGti3nvEcvjK4bF0=;
        fh=09DwpQbNoPR2GB8WyOTSHX+5iSoy0YN8vLTWXRZQNFk=;
        b=E5gavln43IPpzTd+WeUNWsZ9av4bHSIWeogmaJ5lY3/BmHlg4BDpCPJilXD4rLHYtt
         G8a+Ivl8JIOVaTEFd5YYj471UMZNUqOM/cnskOTVVIeKOJDV/38r0bP+yKnGglAywAei
         N8HkorSzFjKMr6ZOILO8rXOr1n5u/Lf5KMuFnWAi9jdrpuA3f3bGhKvuzNxTdEkhp0PA
         MaoiyjzfcECTdpwjwzQ6MeXGHQXyEfR5LpNuges0TChAvbV3RQq1HrWlWEysiB7BtuOI
         BC1Z5Hc9HqtPvkZiJE8TVYQEdE2L5ClEggcUrXDUFH7oLhipCu7j+Oek1MaEAbTJh1V5
         XASw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KPAM+GJ7;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c472b76si17029281cf.271.2024.11.22.01.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KPAM+GJ7;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732266228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=awhrc7OMqrsZeOHfhKb5G3t5SPFLGti3nvEcvjK4bF0=;
	b=KPAM+GJ7ss4AiTzm4HN9fpJEjlqeKiP5MvV8RfsvuNBoNzQTNKXXTzMn6Rquj4EkBm0Ecp
	VpIODMd8+lkSVMHTcv9H7DtUPzMXcN4O9gX4buhECxXGxkx3b/vky2oHpLAwI1WwO9t/2K
	CfL55X77+0dEElvWSV1PWNVO9XQraxg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-XS1fmTbcOeO6dTIzE7MAYw-1; Fri,
 22 Nov 2024 04:03:43 -0500
X-MC-Unique: XS1fmTbcOeO6dTIzE7MAYw-1
X-Mimecast-MFC-AGG-ID: XS1fmTbcOeO6dTIzE7MAYw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFFEE1956046;
	Fri, 22 Nov 2024 09:03:41 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.14])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 596AC1955F3E;
	Fri, 22 Nov 2024 09:03:36 +0000 (UTC)
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
Subject: [PATCH v4 1/3] tests/functional: Convert Aspeed aarch64 SDK tests
Date: Fri, 22 Nov 2024 10:03:20 +0100
Message-ID: <20241122090322.1934697-2-clg@redhat.com>
In-Reply-To: <20241122090322.1934697-1-clg@redhat.com>
References: <20241122090322.1934697-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: drnSkhysxjU+

Drop the SSH connection which was introduced in the avocado tests to
workaround read issues when interacting with console.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/machine_aspeed.py         | 78 --------------------
 tests/functional/meson.build            |  2 +
 tests/functional/test_aarch64_aspeed.py | 98 +++++++++++++++++++++++++
 3 files changed, 100 insertions(+), 78 deletions(-)
 create mode 100644 tests/functional/test_aarch64_aspeed.py

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 241ef180affc..2240c82abff9 100644
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
index 758145d1e5fa..c035eba4f9b8 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -11,6 +11,7 @@ endif
 
 # Timeouts for individual tests that can be slow e.g. with debugging enabled
 test_timeouts = {
+  'aarch64_aspeed' : 600,
   'aarch64_raspi4' : 480,
   'aarch64_sbsaref_alpine' : 720,
   'aarch64_sbsaref_freebsd' : 720,
@@ -47,6 +48,7 @@ tests_generic_bsduser = [
 ]
 
 tests_aarch64_system_thorough = [
+  'aarch64_aspeed',
   'aarch64_raspi3',
   'aarch64_raspi4',
   'aarch64_sbsaref',
diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
new file mode 100644
index 000000000000..59916efd7173
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
2.47.0
