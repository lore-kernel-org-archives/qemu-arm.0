Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5204745njc;
        Thu, 21 Nov 2024 23:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRXJ0dnCTThNWmSzlHqgEmPapjKAD5cTaXcYS5HvatE12r4hwMHTCgrWZQdCzMbsznKyNz2gme1uvtrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFIuHH5mk7NqiOa2exBOKv6oF8Ip6hk5C+dlLCIM3kHdItK4jkC++m+jFT3HB+bhbhMgYqZ
X-Received: by 2002:a05:622a:1826:b0:460:8e3b:6790 with SMTP id d75a77b69052e-4653d644a0bmr19937941cf.48.1732260810770;
        Thu, 21 Nov 2024 23:33:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732260810; cv=none;
        d=google.com; s=arc-20240605;
        b=WUS/1rOElMT14qVlOYUQmvu8/mhrTIRocfxNH1KnTtfX4Tqq4ew9ZN+0UU+bX3sbgh
         cp2C1HMRapcByYU1UMJ+29fkUd8PLaoqvy3NrpBElTgdrIbRv5ji6Hdd3Jww8j0WIy+g
         PKIpW6zG9TPrH2MFsfHGk0x+aI7RdTDEs9DonjJukZOblKs98GG90nw3TDnjMpC6HS8O
         WOWs1Hhoanxrik42aQlHvyMNPsGrP5M4JWkAh6/8wW4LUH0ve2xVJDx/zfNqiSoT1JhM
         kywsHdDq5UXo4saBA9RkbYVv8g2ipj1zxeqB0kO0dVAQJa/ADobytKRTZri3/ZgHj/rO
         pXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NTNQLKJJURGDiqF2foy9j4Ao8eKJsVx0hra1W2AjOOc=;
        fh=09DwpQbNoPR2GB8WyOTSHX+5iSoy0YN8vLTWXRZQNFk=;
        b=fZlZwoeXJWXiZwqaSER70u3Pq4HRtPeocTflgsPWOBLaqrINnDQXSy34a6DEHyFfpB
         NLf0Olm9VAtxy0v/sCGZ1LsZPivlnXbO52yk9tcPmabNJc2zeUKhAZwZG+vda6RvspCm
         Ry5qhe1RLV8AaGEuqIYdcgdVeMgBKcKSNZ3pbjvCcpMLULyYh0ngSMK2+3nKtzQnorxP
         slAykLlCinJb8/wf1J8x04nnZpBf5jzkjclPanRPtdzmUrIyu8bPi0aUtDT8CUFRt0/+
         k/qIAPrA7jFAX2nfKTSJvV90ogwoyFSd31L2jc1z15AyLmaOAVPJ9qWSTzMNo+eP0HLX
         QAgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TZNvFjsH;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c4cc961si15175751cf.702.2024.11.21.23.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 23:33:30 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TZNvFjsH;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732260810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTNQLKJJURGDiqF2foy9j4Ao8eKJsVx0hra1W2AjOOc=;
	b=TZNvFjsH0mpVpLPIU0lbVFDBA4jwudHk4oTGHM55qOqMteYmh2xdu+QIR+bagyCrZutBFW
	KvnULlK/bPL6Q+nSjWDMyeh5rWZN1txTYiIn9YchhmuHJ5SAaVSHytI75CCvLayXNt2JLP
	3vQ3/nM6bD9hMHzFJZcWFFTh5/4+Fcw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-doJfGQZfNrCtVO_Y9bxdnQ-1; Fri,
 22 Nov 2024 02:33:28 -0500
X-MC-Unique: doJfGQZfNrCtVO_Y9bxdnQ-1
X-Mimecast-MFC-AGG-ID: doJfGQZfNrCtVO_Y9bxdnQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 377FA1955F57;
	Fri, 22 Nov 2024 07:33:26 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CFCE21956056;
	Fri, 22 Nov 2024 07:33:22 +0000 (UTC)
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
Subject: [PATCH v3 1/3] tests/functional: Convert Aspeed aarch64 SDK tests
Date: Fri, 22 Nov 2024 08:33:07 +0100
Message-ID: <20241122073309.1897944-2-clg@redhat.com>
In-Reply-To: <20241122073309.1897944-1-clg@redhat.com>
References: <20241122073309.1897944-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: lAAAMNWoDoRe

Drop the SSH connection which was introduced in the avocado tests to
workaround read issues when interacting with console.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/machine_aspeed.py         | 78 --------------------
 tests/functional/meson.build            |  2 +
 tests/functional/test_aarch64_aspeed.py | 97 +++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 78 deletions(-)
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
index 000000000000..53ee23ef2ce7
--- /dev/null
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -0,0 +1,97 @@
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
