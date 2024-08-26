Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp1207772njb;
        Mon, 26 Aug 2024 15:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2CVsNeWd+f88oEIHiKqhn4uzmHNVQdvpB+rHSdlZ8yoAUzKiR3JKihrBJZJ4zUyEbeQorEXFgK0LJag==@linaro.org
X-Google-Smtp-Source: AGHT+IEUYRNi6CbvZrdiBCN+GcylhmZna+Dl6hUlRB1YOgbD9qFtojQS9gtQMtld5ZoXC8S9nwHC
X-Received: by 2002:a05:622a:1b0b:b0:447:e38c:59f with SMTP id d75a77b69052e-45509d36805mr111002401cf.47.1724710369920;
        Mon, 26 Aug 2024 15:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724710369; cv=none;
        d=google.com; s=arc-20160816;
        b=q28abr6Ky8OiaMvHawJrwY31NRe6E7MNIKjdDuNuyH7GI04hGRV2gak6xFuj7g+qGp
         jZTDCsw284d4c1MyLkLeDAj9F6E3sYzgFnDZeB+GJyZwQR5FTcILM4Y3M5UJR4AjnICE
         3RC/sa4EeObPsXkN+BkdDy0vZHQWjpGVFiv+yq7InIjmdB8JMKdiKZIZzfX0y8IFfPCi
         ZusATzLYpiBhBmx+/dODAwecjj5vBhkHpkGEvAx5vNAcrzcV4YDVmUGyA43IRmdARytK
         56pTmcb2DwxDkuoqf37QtFLR6t2Y6L6RE93CS2e5+mJxUfGVIx7W/ouZITeApN1JqDkf
         IZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0M2cEI0ZxrImGj+myUthr78dS5dgAOhCAVweFn3WwQM=;
        fh=eQ0CVgO0Hr3FJS0p3Lq4WFG58LiztoKngqBWJ9gqvVA=;
        b=U5SphLUgUrb3rv/vQO7UjO4hSVrURs5wq8zyAfKBcrfMF3DBSonN25eLk+exs2/2KN
         LBvrgzfK85JCbnp0EXOqL7XEYUF9Jhp1x6e8IbNqDVEQMh5znzCIzBy/exKi3X5xHLnE
         2a8IpQsEJnOZUmE2jgZjGbSCFXSsFYYVEwi8w9yxqXUc9L3xbhlR4ClkjVCRQQ/8c2pI
         5HP51zCCmKx6vHPdV4AUEs+j/qp1aXjl2NgTtgf+O6SgHd1ZGKnok7p1jB5x3WBa7Kpu
         fSJlgwKIi9X96BgaVBasdKPEHce94I5nOs95eJS6PFVQpjKsfVgXTV8BE+N2gXwc3+14
         fnew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z9yICaAT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe0d107asi110558241cf.144.2024.08.26.15.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 15:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z9yICaAT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sihvq-000183-CD; Mon, 26 Aug 2024 18:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sihvn-0000wC-D8
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 18:11:23 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sihvk-0000n6-Ve
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 18:11:23 -0400
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7a1dcc7bc05so314762085a.0
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 15:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724710278; x=1725315078; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0M2cEI0ZxrImGj+myUthr78dS5dgAOhCAVweFn3WwQM=;
 b=Z9yICaATLktuDI/oKZSVvp9fO4a7sE38J471AG6oX1HV6g1OPw0phE7/fcAUR+g9pn
 qpK2zoE/zsvxuiGQ7MEnHgUsEb424zT6y1zDmMR41bSL3F+U76pVTGxYefdcsAWAxF5e
 rTebM8eFnSn5YpDJVKVawOWYV2SJC3ajmC+tGEbJclDCZn6c2tB1b+0azIW9I18jv7rk
 tnKOSOIJ/l2P9nElGkbhDP10z1dC6lX2Fxz7N4aEyIZSe6h/4yIpc8FEFGWI7F35UEWF
 SqbQScz5al9Fm2VHTeru9UPHJo8rnN0qrEdXrEVcwqQwXUqG8AHAep1SeNSgvH60aTwd
 FbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724710278; x=1725315078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0M2cEI0ZxrImGj+myUthr78dS5dgAOhCAVweFn3WwQM=;
 b=qlmaTQR7rGe/9Al0YU9RhM7tV8QoLTnGLz8ChoppNnWJG67eyQL0s6ALl62BOBEJMA
 L0Cu/HAGWXQ5j988iZYxpN6Fm7hCo85P0x/SQ7hsHtmFwxKA5fB5mNF9XcyZQbLt4rO5
 5P9v8slbheE3VRqx4jcQcYrfDnEnccE9pfg1XqwziiGfu4WqUExlncXCDtihdMeziZpP
 YfWP+kb894JNvQvwBOius7IMWy/qJJv6/li8CiZj+Vt2B4NqzqSJd+UgjvtsHyA/zj/4
 LOZcNkXHpjnb5Ro42lrpRvnZsYeX8xSCUhJL4nKgSkt3Ut0Y8V78alU6zFgAh8dg3m6m
 E1+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXghz0tm5AIllKiO/gnLZ5Pzb6lVB+SdzhtF/H08kGT0x0AsTIEci557P2d5GG9dGjrdz5JAAmCBA==@nongnu.org
X-Gm-Message-State: AOJu0Yxmtqb0eQ2/RjxftWpeDVX0rotbIsZb4Cw26wCG21Uj4eiRg6YK
 T5sOi6LYWnFZY6WvB5Q6+4bzxBWqqtsN/eLBd3L6pLYUOaIBnfCZkiVfnSmW//E=
X-Received: by 2002:a05:620a:31a7:b0:79f:d55:24dd with SMTP id
 af79cd13be357-7a6897b7ad1mr1387471685a.57.1724710278202; 
 Mon, 26 Aug 2024 15:11:18 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.216.241])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f361318sm489319185a.57.2024.08.26.15.11.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Aug 2024 15:11:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] tests/functional: Convert ARM Raspi2 avocado tests
Date: Tue, 27 Aug 2024 00:10:56 +0200
Message-ID: <20240826221058.75126-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826221058.75126-1-philmd@linaro.org>
References: <20240826221058.75126-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=philmd@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3rfF9tUyiIjk

Straight forward conversion. Update the SHA1 hashes to SHA256
hashes since SHA1 should not be used anymore nowadays.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                         |   1 +
 tests/avocado/boot_linux_console.py |  85 -----------------------
 tests/functional/meson.build        |   1 +
 tests/functional/test_arm_raspi2.py | 103 ++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+), 85 deletions(-)
 create mode 100755 tests/functional/test_arm_raspi2.py

diff --git a/MAINTAINERS b/MAINTAINERS
index e2e62afcdc..e2bbf1a994 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -910,6 +910,7 @@ F: hw/*/bcm283*
 F: include/hw/arm/rasp*
 F: include/hw/*/bcm283*
 F: docs/system/arm/raspi.rst
+F: tests/functional/test_arm_raspi2.py
 
 Real View
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 370beb795a..226b92d057 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -203,91 +203,6 @@ def test_arm_emcraft_sf2(self):
         exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
             '3 packets transmitted, 3 packets received, 0% packet loss')
 
-    def do_test_arm_raspi2(self, uart_id):
-        """
-        :avocado: tags=accel:tcg
-
-        The kernel can be rebuilt using the kernel source referenced
-        and following the instructions on the on:
-        https://www.raspberrypi.org/documentation/linux/kernel/building.md
-        """
-        serial_kernel_cmdline = {
-            0: 'earlycon=pl011,0x3f201000 console=ttyAMA0',
-        }
-        deb_url = ('http://archive.raspberrypi.org/debian/'
-                   'pool/main/r/raspberrypi-firmware/'
-                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
-        deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
-        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
-        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
-
-        self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               serial_kernel_cmdline[uart_id] +
-                               ' root=/dev/mmcblk0p2 rootwait ' +
-                               'dwc_otg.fiq_fsm_enable=0')
-        self.vm.add_args('-kernel', kernel_path,
-                         '-dtb', dtb_path,
-                         '-append', kernel_command_line,
-                         '-device', 'usb-kbd')
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
-        console_pattern = 'Product: QEMU USB Keyboard'
-        self.wait_for_console_pattern(console_pattern)
-
-    def test_arm_raspi2_uart0(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:raspi2b
-        :avocado: tags=device:pl011
-        :avocado: tags=accel:tcg
-        """
-        self.do_test_arm_raspi2(0)
-
-    def test_arm_raspi2_initrd(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:raspi2b
-        """
-        deb_url = ('http://archive.raspberrypi.org/debian/'
-                   'pool/main/r/raspberrypi-firmware/'
-                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
-        deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
-        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
-        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
-
-        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
-                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
-                      'arm/rootfs-armv7a.cpio.gz')
-        initrd_hash = '604b2e45cdf35045846b8bbfbf2129b1891bdc9c'
-        initrd_path_gz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
-        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
-        archive.gzip_uncompress(initrd_path_gz, initrd_path)
-
-        self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'earlycon=pl011,0x3f201000 console=ttyAMA0 '
-                               'panic=-1 noreboot ' +
-                               'dwc_otg.fiq_fsm_enable=0')
-        self.vm.add_args('-kernel', kernel_path,
-                         '-dtb', dtb_path,
-                         '-initrd', initrd_path,
-                         '-append', kernel_command_line,
-                         '-no-reboot')
-        self.vm.launch()
-        self.wait_for_console_pattern('Boot successful.')
-
-        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
-                                                'BCM2835')
-        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
-                                                '/soc/cprman@7e101000')
-        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
-        # Wait for VM to shut down gracefully
-        self.vm.wait()
-
     def test_arm_raspi4(self):
         """
         :avocado: tags=arch:aarch64
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 175e88bb87..ec77835199 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -29,6 +29,7 @@ tests_generic = [
 tests_arm_thorough = [
   'arm_canona1100',
   'arm_n8x0',
+  'arm_raspi2',
 ]
 
 tests_avr_thorough = [
diff --git a/tests/functional/test_arm_raspi2.py b/tests/functional/test_arm_raspi2.py
new file mode 100755
index 0000000000..7a8f86edee
--- /dev/null
+++ b/tests/functional/test_arm_raspi2.py
@@ -0,0 +1,103 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel on a Raspberry Pi machine
+# and checks the console
+#
+# Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import wait_for_console_pattern
+from qemu_test import exec_command_and_wait_for_pattern
+from qemu_test.linux_kernel import linux_kernel_wait_for_pattern
+from qemu_test.linux_kernel import KERNEL_COMMON_COMMAND_LINE
+from qemu_test.utils import extract_from_deb
+from qemu_test.utils import gzip_uncompress
+
+
+class ArmRaspi2Machine(QemuSystemTest):
+
+    ASSET_KERNEL_20190215 = Asset(
+        ('http://archive.raspberrypi.org/debian/'
+         'pool/main/r/raspberrypi-firmware/'
+         'raspberrypi-kernel_1.20190215-1_armhf.deb'),
+        '9f1759f7228113da24f5ee2aa6312946ec09a83e076aba9406c46ff776dfb291')
+
+    ASSET_INITRD = Asset(
+        ('https://github.com/groeck/linux-build-test/raw/'
+         '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
+         'arm/rootfs-armv7a.cpio.gz'),
+        '2c8dbdb16ea7af2dfbcbea96044dde639fb07d09fd3c4fb31f2027ef71e55ddd')
+
+    def do_test_arm_raspi2(self, uart_id):
+        """
+        The kernel can be rebuilt using the kernel source referenced
+        and following the instructions on the on:
+        https://www.raspberrypi.org/documentation/linux/kernel/building.md
+        """
+        serial_kernel_cmdline = {
+            0: 'earlycon=pl011,0x3f201000 console=ttyAMA0',
+        }
+        deb_path = self.ASSET_KERNEL_20190215.fetch()
+        kernel_path = extract_from_deb(deb_path, self.workdir,
+                                       '/boot/kernel7.img')
+        dtb_path = extract_from_deb(deb_path, self.workdir,
+                                    '/boot/bcm2709-rpi-2-b.dtb')
+
+        self.set_machine('raspi2b')
+        self.vm.set_console()
+        kernel_command_line = (KERNEL_COMMON_COMMAND_LINE +
+                               serial_kernel_cmdline[uart_id] +
+                               ' root=/dev/mmcblk0p2 rootwait ' +
+                               'dwc_otg.fiq_fsm_enable=0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line,
+                         '-device', 'usb-kbd')
+        self.vm.launch()
+
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        linux_kernel_wait_for_pattern(self, console_pattern)
+        linux_kernel_wait_for_pattern(self, 'Product: QEMU USB Keyboard')
+
+    def test_arm_raspi2_uart0(self):
+        self.do_test_arm_raspi2(0)
+
+    def test_arm_raspi2_initrd(self):
+        deb_path = self.ASSET_KERNEL_20190215.fetch()
+        kernel_path = extract_from_deb(deb_path, self.workdir,
+                                       '/boot/kernel7.img')
+        dtb_path = extract_from_deb(deb_path, self.workdir,
+                                    '/boot/bcm2709-rpi-2-b.dtb')
+        initrd_path_gz = self.ASSET_INITRD.fetch()
+        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
+        gzip_uncompress(initrd_path_gz, initrd_path)
+
+        self.set_machine('raspi2b')
+        self.vm.set_console()
+        kernel_command_line = (KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=pl011,0x3f201000 console=ttyAMA0 '
+                               'panic=-1 noreboot ' +
+                               'dwc_otg.fiq_fsm_enable=0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'BCM2835')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
+                                                '/soc/cprman@7e101000')
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.45.2

