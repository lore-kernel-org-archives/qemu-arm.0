Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp95882njb;
        Fri, 23 Aug 2024 01:24:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3L7tckpMjpQ+cUNAUkKIaZzOvJEqGzs/DL8cAWBxqafggd3HLDIpwNZRnAPUBa2getDj9gvyLce7ESA==@linaro.org
X-Google-Smtp-Source: AGHT+IFmQm1P/AZZDshh8h8mJyzUt716+a1Jiu4GB7PIZuYpLiUdFort8bSyzCX9ii9Sv1eUjHje
X-Received: by 2002:a05:622a:244b:b0:454:b6d3:eb61 with SMTP id d75a77b69052e-4550939410cmr19467431cf.0.1724401486777;
        Fri, 23 Aug 2024 01:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724401486; cv=none;
        d=google.com; s=arc-20160816;
        b=C8XCRqtjCDTqLLIrW2gsHykhGWBhIFCHz6dr4QFRmjThscNdD7vewGaR+ngncnCrR+
         1uJzgHoR1FKyx8H76NPg7EX1psvgVPVc9KGE7FlfJ6x0+jtM/wUgPWzo+w2Ox0pdCI/W
         aI5C3BR2tvhLz7boBylcq0Qh8b0VmwS9Db1VpJOeDym9OQ8FV8oMh/sQjSk0kYJFOwTh
         K8dbkTNr7EWOe1hDvtq2/CUhkhJXlSwKZYm1eM+1Stvjdt4CvKBuaN1Heg8RGIJTxuhm
         vMyfzd7DkxrdEBqNzy/O2AJ9jnsdozxLMtn2Ti3aOw+8hPGj00thmShgvu9LUKH3rKUy
         u6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=iIsFxipTMZimD8/DiyXnMxsoAtbqM+WTVOu5fEOSSWs=;
        fh=ojXZAZZAZHbpNt3gd3i890MsOS+TzGK3e0B9gazjvVI=;
        b=RPihkOk0EJItHtFuSR/0oAmL6IYJr8MiVtgyzoiilxLWEowAD21aECY+eleED0QZ8D
         h2NpF5HorDlpmVnKAQ3GqntYD3kj9ZSbBwjmd7GKSPEoNO4/IPK0PB4sw0advOo3FCor
         7sWqvYHBUiwTj+WW7ymndofdLO7lDSgw0osBpe1j+n8ExTxp2yMeuDtVXWiTmzOXPk2/
         O7zk9WiAEZUb2fBw8uwZbvnmi2ls4i8KZ3weTopRa+HG6yp5dLC9WfBzOki5lhMeQSh0
         I55AITc5xzrhT4YlVBEVpDWu4O65KA/spsWAJ0o1bgO1Rkauq2f6bTURzwkrlK4T1JvQ
         qGrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1Rou3fv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe34c7f3si36118791cf.785.2024.08.23.01.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2024 01:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1Rou3fv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shPaz-0002k4-VM; Fri, 23 Aug 2024 04:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shPax-0002ih-OK
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 04:24:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shPav-00066V-GF
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 04:24:31 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-428e3129851so13069545e9.3
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2024 01:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724401468; x=1725006268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iIsFxipTMZimD8/DiyXnMxsoAtbqM+WTVOu5fEOSSWs=;
 b=Z1Rou3fvoVDFEAp4+2y8t+ZxUel0e9c6UecP+nauWA3IPcyhr4c5v0hAkaHs34JjtY
 YDuD7voauFGfOh9wkxASDIfXblYutWalCWFBIPOBn73bSUGBCxWqJZv8kROD2UxRGTRt
 jbkbNIkCNanj5hAqtmHSe20KLR/+zaX7kY+umW4gT5InDtHMg3837fGxLoItIYPYujpd
 fxHNdxyiL5RkseH5fDrxwvJ/+gIxypUnjz1z2JscEgInZ0Sp85y+Rq2/SoupNdPNgz8P
 V3HRcPy20FOTf8JxeCjUxutDpujnOqjl+rE5+DxeIgBnzXN0DbAZZU8l5ZvUzmeO2i/o
 LSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724401468; x=1725006268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iIsFxipTMZimD8/DiyXnMxsoAtbqM+WTVOu5fEOSSWs=;
 b=jCpzHD3x2pyELr/URfKkFdGsEI4Fj5teo67nQSCwvJGAXBjEmNVZDApBCJZd/l710j
 5JT+fLK3IqRCSox66B2cqloFKQ4RjzQWjrC8nkk2LJ5fqHd43X7H34/6utl4egKpwVBv
 kn4QYWp7CslqECHk91m11LkPhLgIihvUMshO6q0kfwjsJSf2j9eWq9xIpYi4Wh9ifkVn
 6Ln7cZTcfo+QJYFr3DV6PZHxfKb9gmyGOWJbVCStnUiG8BfSbNoVsOxfl/nvuAgPQwI7
 dTC423kYUupLSitkQDaBSFHpZpbJLBaVTxMyayN71VIBdjftjp6B9fgIC79+7ijJrJMd
 8Kpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV42gNZz6cPhFR9cHI3lyFLR727TkXElt+t30IQeQoMi1X++R/ejbbFBjXHfchbN2lN8FZq6Si50Q==@nongnu.org
X-Gm-Message-State: AOJu0YzlXP4e3HNPbCSZHIcENyrz00GeMnAP1bRxa3QjS6U++1p65L3X
 7nHlF1jUEBCJ5AhlSczbFXYKtRUHsgEk/3x975T57ts2+k/xI9neacYfpj1nDgQ=
X-Received: by 2002:a05:6000:18d:b0:368:65ad:529 with SMTP id
 ffacd0b85a97d-373118562a8mr828481f8f.17.1724401467495; 
 Fri, 23 Aug 2024 01:24:27 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.153])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730811044bsm3583448f8f.23.2024.08.23.01.24.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Aug 2024 01:24:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] tests/functional: Convert Aarch64 Virt machine avocado
 tests
Date: Fri, 23 Aug 2024 10:24:23 +0200
Message-ID: <20240823082423.6349-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: LSwQSTlmggsg

Straight forward conversion. Update the SHA1 hash to
SHA256 since SHA1 should not be used anymore nowadays.

Provide get_qemu_img() helper in qemu_test.

  $ make check-functional-aarch64 V=1
  ...
  ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv2                 OK
  ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv3                 OK
  ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_alpine_virt_tcg_gic_max            OK
  1/4 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_virt  OK   30.44s  3 subtests passed

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
index 8580ee8faf..7db609aac9 100644
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
+    test.cancel('Could not find "qemu-img", which is required to '
+                'create temporary images')
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

