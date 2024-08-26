Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp994073njb;
        Mon, 26 Aug 2024 03:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVixtL//trRfy+8P9Ies+zD8Zt8SHZ6ErwK5tpcZVRl6rai9+2tElGMt+rl/QlMMcP+IqtL2acShjJzEg==@linaro.org
X-Google-Smtp-Source: AGHT+IFCYDgw/otjbZvQC364oVxwoKNIftu+bc28+aH1fSKrCwwIC4DxqaIW0TGXAloz5KaE3fuW
X-Received: by 2002:a05:690c:250e:b0:6b1:f544:3dc4 with SMTP id 00721157ae682-6c62924f5c3mr88186907b3.34.1724668625118;
        Mon, 26 Aug 2024 03:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724668625; cv=none;
        d=google.com; s=arc-20160816;
        b=Z1n96KphNtWLHppeOFXAz5zJsdiwNIVjO6qlIQ/NLxU3MmALAZkyP63edRLb9G7ygf
         2cU9sMeQ6pq4bxCloaL+bDWh/CmDbTYesF8X5t8kgIxaXf/wbysWU2TwTkEE63B+tJEm
         Xv2WZnOFPT+3suC/Q5CAI1rLp8IUNP5vj2trcs2AJjQ/oJltwXclTpFtxNdRvY7S/hFS
         w3eSi6H1hc4uSFKPCdyQ703PK9BPP1pJAgxkhwIT8rppHEgwBIwjyu4mZpep6TqwOxn2
         E3ARAr3yXj6Hp/Z185drWfq27VG/p7/3vUuVdP9FVgmZgoDixafeEXEdW3Vr9MDWLaVI
         a2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uoYy6P6pN/vN476JRPZviJP4Z9rHALs5Uj2L5TsIgH0=;
        fh=LS9ng7L6REWwyLOQpLw16RVEK65ahyKRKGpc4036w5Y=;
        b=lMM7BydKXxR8py3wSPsflRWgBdq+JqMQ7+vEeQ3BnEFWP3roDbuS6TQb9luwgyjv07
         u442mNI/KLZD2KF7Lf0TMSfob8rAHErdZqmHVMFDSDb2Jz+f+pGCOvv/tPyvRAiUe9C6
         +AhyuF3pAkgdkcHkKT48BO+X4zMaAnKCKvUY+EG7Sge0Q3bpLHGNK8qKVhWHnSurs/Q2
         otbN1e1imlUkuLYMpsUaVMql/Mr0Yt9++KXkxzMMkB3n1Dk1Kb6AMJosKf+Jfhf2rLf3
         ifbYIEDUcaX8ZW+Pf/x5ADVdmmf8UHJ8o1FLHCbQvhHevD2CN12JRKE8//uaea0YRBxD
         LpxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vqdqCQFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162e0f779si107834746d6.441.2024.08.26.03.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 03:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vqdqCQFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siX5X-0001Y5-W3; Mon, 26 Aug 2024 06:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1siX5W-0001VF-70
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 06:36:42 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1siX5U-0006Ru-06
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 06:36:41 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso516667466b.2
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724668598; x=1725273398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uoYy6P6pN/vN476JRPZviJP4Z9rHALs5Uj2L5TsIgH0=;
 b=vqdqCQFsVQoxCS1FKGO9lcAuZkMaEY8D4BzS5DXHSujQbsFc52ugXZ8XOr5SbSTciV
 VCj0AUEUtNq1BsTSSG7EE7Vx9Snf5SgxnaW5ajd3r8MKz6QCxMfvfsntrxvEf7nJPPSW
 lBkFBLc1kT3SYZui6DWBJySXLkRVb43KVUlXxZXdfe/oppoVa1fadza7OlacV9f/NrR3
 IxoXn3EHEsHk5TUbPqDUuin57OWNPCdumcLjmNg/Dsy909VWH5noVnJR1Q1qEnoWUdlq
 4HF7RQNCDACaOB0re4HZkQwzEik9L4u9revZ/6DiCJDGa9rOFtIowcrcq65GQYxkdI8N
 nmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724668598; x=1725273398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uoYy6P6pN/vN476JRPZviJP4Z9rHALs5Uj2L5TsIgH0=;
 b=FJJhAAfegvtNgaJr5TdFxxqC55swXH2Zhg5oxQJ9AHtb6MsTlp9KOk7TlTEdozhrdz
 GI944Ohvhp4d/+fmp5/NWihlHkGwMJJ8POO8jLeKDI8/pYcs1PFsJPPYdF0ymUHrMmzs
 2LT+IvvgeMxd6jraBqVjxIgE0CJCXYJ7JRT+jg8doFeyDJx/3ExgZCByXRYxFzjO3RVt
 yYDTh510la/GzyN6N2fwW2S3GipHcLHzqEZl5ifK38ZSKferdMK6fT9umkHLHErj0Tk6
 kAwNg9XOHVm+QccaDbNGVwCIFpZHcuN5KK0dKOg5YE2aUxvbzLfsJcN5lYTevVCqKqlt
 zaCg==
X-Gm-Message-State: AOJu0YzIp08+71fyVoDlmibXsiq8hChxPyX74/WxQOkesaoUc6GgoVgz
 prCBftAixYTpe+NSxgPCFCsA9ITBngTzLXHtEnzU6HrmU1pQPmS75fx11ASfOXc=
X-Received: by 2002:a17:907:6088:b0:a86:96ca:7f54 with SMTP id
 a640c23a62f3a-a86a52b6521mr654164866b.21.1724668597537; 
 Mon, 26 Aug 2024 03:36:37 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.216.241])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f484b29sm641463066b.162.2024.08.26.03.36.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Aug 2024 03:36:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3] tests/functional: Convert Aarch64 Virt machine avocado
 tests
Date: Mon, 26 Aug 2024 12:36:34 +0200
Message-ID: <20240826103634.52384-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GI+a8fy4lgWY

Straight forward conversion. Update the SHA1 hash to
SHA256 since SHA1 should not be used anymore nowadays.

Provide get_qemu_img() helper in qemu_test.

  $ make check-functional-aarch64 V=1
  ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv2                 OK
  ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv3                 OK
  ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_alpine_virt_tcg_gic_max            OK
  1/4 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_virt  OK   30.44s  3 subtests passed
  ...

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20240822114146.86838-1-philmd@linaro.org>
---
 MAINTAINERS                                   |  2 +-
 tests/functional/meson.build                  |  2 +
 tests/functional/qemu_test/__init__.py        |  2 +-
 tests/functional/qemu_test/cmd.py             | 15 ++++
 .../test_aarch64_virt.py}                     | 69 ++++++++-----------
 5 files changed, 46 insertions(+), 44 deletions(-)
 rename tests/{avocado/machine_aarch64_virt.py => functional/test_aarch64_virt.py} (69%)
 mode change 100644 => 100755

diff --git a/MAINTAINERS b/MAINTAINERS
index c720c02800..502065a1f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1023,7 +1023,7 @@ S: Maintained
 F: hw/arm/virt*
 F: include/hw/arm/virt.h
 F: docs/system/arm/virt.rst
-F: tests/avocado/machine_aarch64_virt.py
+F: tests/functional/test_aarch64_virt.py
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 2445239a5c..8e04695a4c 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -12,6 +12,7 @@ endif
 # Timeouts for individual tests that can be slow e.g. with debugging enabled
 test_timeouts = {
   'aarch64_sbsaref' : 180,
+  'aarch64_virt' : 360,
   'acpi_bits' : 240,
   'netdev_ethtool' : 180,
   'ppc_40p' : 240,
@@ -29,6 +30,7 @@ tests_generic = [
 
 tests_aarch64_thorough = [
   'aarch64_sbsaref',
+  'aarch64_virt',
 ]
 
 tests_arm_thorough = [
diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
index 6e9b017264..f33282efe8 100644
--- a/tests/functional/qemu_test/__init__.py
+++ b/tests/functional/qemu_test/__init__.py
@@ -10,5 +10,5 @@
 from .config import BUILD_DIR
 from .cmd import has_cmd, has_cmds, run_cmd, is_readable_executable_file, \
     interrupt_interactive_console_until_pattern, wait_for_console_pattern, \
-    exec_command, exec_command_and_wait_for_pattern
+    exec_command, exec_command_and_wait_for_pattern, get_qemu_img
 from .testcase import QemuBaseTest, QemuUserTest, QemuSystemTest
diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
index 8580ee8faf..3acd617324 100644
--- a/tests/functional/qemu_test/cmd.py
+++ b/tests/functional/qemu_test/cmd.py
@@ -16,6 +16,8 @@
 import os.path
 import subprocess
 
+from .config import BUILD_DIR
+
 
 def has_cmd(name, args=None):
     """
@@ -176,3 +178,16 @@ def exec_command_and_wait_for_pattern(test, command,
     :param failure_message: if this message appears, test fails
     """
     _console_interaction(test, success_message, failure_message, command + '\r')
+
+def get_qemu_img(test):
+    test.log.debug('Looking for and selecting a qemu-img binary')
+
+    # If qemu-img has been built, use it, otherwise the system wide one
+    # will be used.
+    qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
+    if os.path.exists(qemu_img):
+        return qemu_img
+    if has_cmd('qemu-img'):
+        return 'qemu-img'
+    test.skipTest('Could not find "qemu-img", which is required to '
+                  'create temporary images')
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
old mode 100644
new mode 100755
similarity index 69%
rename from tests/avocado/machine_aarch64_virt.py
rename to tests/functional/test_aarch64_virt.py
index 6831d2c0ed..c967da41b4
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+#
 # Functional test that boots a various Linux systems and checks the
 # console output.
 #
@@ -12,12 +14,11 @@
 import os
 import logging
 
-from avocado_qemu import QemuSystemTest
-from avocado_qemu import wait_for_console_pattern
-from avocado_qemu import exec_command
-from avocado_qemu import BUILD_DIR
-from avocado.utils import process
-from avocado.utils.path import find_command
+from qemu_test import BUILD_DIR
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import exec_command, wait_for_console_pattern
+from qemu_test import get_qemu_img, run_cmd
+
 
 class Aarch64VirtMachine(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
@@ -28,23 +29,18 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
+    ASSET_ALPINE_ISO = Asset(
+        ('https://dl-cdn.alpinelinux.org/'
+         'alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso'),
+        '5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027')
+
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
     def test_alpine_virt_tcg_gic_max(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
-        :avocado: tags=accel:tcg
-        """
-        iso_url = (
-            "https://dl-cdn.alpinelinux.org/"
-            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso"
-        )
-
-        iso_hash = "5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027"
-        iso_path = self.fetch_asset(iso_url, algorithm="sha256", asset_hash=iso_hash)
+        iso_path = self.ASSET_ALPINE_ISO.fetch()
 
+        self.set_machine('virt')
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
@@ -68,6 +64,11 @@ def test_alpine_virt_tcg_gic_max(self):
         self.wait_for_console_pattern('Welcome to Alpine Linux 3.17')
 
 
+    ASSET_KERNEL = Asset(
+        ('https://fileserver.linaro.org/s/'
+         'z6B2ARM7DQT3HWN/download'),
+        '12a54d4805cda6ab647cb7c7bbdb16fafb3df400e0d6f16445c1a0436100ef8d')
+
     def common_aarch64_virt(self, machine):
         """
         Common code to launch basic virt machine with kernel+initrd
@@ -75,11 +76,9 @@ def common_aarch64_virt(self, machine):
         """
         logger = logging.getLogger('aarch64_virt')
 
-        kernel_url = ('https://fileserver.linaro.org/s/'
-                      'z6B2ARM7DQT3HWN/download')
-        kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        kernel_path = self.ASSET_KERNEL.fetch()
 
+        self.set_machine('virt')
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
@@ -98,14 +97,8 @@ def common_aarch64_virt(self, machine):
         # Also add a scratch block device
         logger.info('creating scratch qcow2 image')
         image_path = os.path.join(self.workdir, 'scratch.qcow2')
-        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
-        if not os.path.exists(qemu_img):
-            qemu_img = find_command('qemu-img', False)
-        if qemu_img is False:
-            self.cancel('Could not find "qemu-img", which is required to '
-                        'create the temporary qcow2 image')
-        cmd = '%s create -f qcow2 %s 8M' % (qemu_img, image_path)
-        process.run(cmd)
+        qemu_img = get_qemu_img(self)
+        run_cmd([qemu_img, 'create', '-f', 'qcow2', image_path, '8M'])
 
         # Add the device
         self.vm.add_args('-blockdev',
@@ -128,19 +121,11 @@ def common_aarch64_virt(self, machine):
         time.sleep(0.1)
 
     def test_aarch64_virt_gicv3(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
-        """
         self.common_aarch64_virt("virt,gic_version=3")
 
     def test_aarch64_virt_gicv2(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
-        """
         self.common_aarch64_virt("virt,gic-version=2")
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.45.2

