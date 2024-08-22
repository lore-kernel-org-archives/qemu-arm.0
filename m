Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp604901njb;
        Thu, 22 Aug 2024 05:07:56 -0700 (PDT)
X-Received: by 2002:a05:600c:35ca:b0:426:61ef:ec36 with SMTP id 5b1f17b1804b1-42abd0e7c9fmr41917065e9.0.1724328475750;
        Thu, 22 Aug 2024 05:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724328475; cv=none;
        d=google.com; s=arc-20160816;
        b=CIf6uals94jQKwrfIA2KxU0m2Md+Yz6NbI8/Ab/LxAJhg0ttJCmzLoJGsGv8QPfYgx
         F6M024omn9incSLAlZI4GW3kMAJoTYBT8hYzUNWkEUYEN9YgstivP9Z8V2tCm2eoKOCi
         /2XO20X9614HLq2je/gGWByKVC1GM6y4lYThaF25wT5F9ungk1cGL4opEqCQTY48MdT0
         +IepGcxOzlVJ64CAhx8Oz/dLGzD0hFiCth9DIt0vYsyoVga7vDvvgNpuBLhNLKFkiOIF
         lvgKjbF8644ziPg+BIduRkXRTnFvL5NhKlGUT3pi2fcO/K9wPGgSj7coSRgmsyb9F/eX
         LWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4Zk1/6OYAiP7rVpOU6oHGiW3F+xDoqsXkjFUmuJvrU8=;
        fh=ZaYG/1ZWS8o2Jnomr9WcBkK0PSPQoU9HrgyOfb2gu+4=;
        b=Cq6ttm2Ax6+vPkSTWc3rmEv3D+rRKw1LZ/Urpey+5llL1jKom1nefMM1kSdfP7PN1A
         lE/r0pyIQH5Dc/ro2sVaVSDXE6EHMoyqW7rX9fZu02LGY8+Ohja/Q7p4JFiJeEuSPonu
         RPsP+/5+sNK1wDS+DCTnb2bS80CMTJj7ACldVKEyo3ucNspQcvVdnzHkTzvDHLEB6GuI
         C/fs8LMaxEBU0vpJy9ONDBSwdqugbVFq4WuPfeAyA633ttCBeumtAZlXacghTp6bHcmz
         g2B5qcHqw6B+2IsxvqLuaaRBS+FE5MNn1oJVt4IskROQLnWN4RnSilCec1tkzO4l5wLz
         Y0gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EpPZA21u;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42ac5155cc8sor4874315e9.3.2024.08.22.05.07.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 Aug 2024 05:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EpPZA21u;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724328475; x=1724933275; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zk1/6OYAiP7rVpOU6oHGiW3F+xDoqsXkjFUmuJvrU8=;
        b=EpPZA21ugAFq0Lbw7riqRpmm4YvpEaqPEYPR02PVV4TGCtKJD8AD3YmAmJRHIz4wnN
         cGDH/6aa3MDkpf/Vu1OkOwkxxTfTI7hKk8gThlaxolg8z47zmAzsMWr2eTkQXCytT1Z0
         CycJHhiGaPqGQ483KzOh8K6e3TSkHAumdHzIlQR875RHukeBH6juJgovK0b/UmooGZX7
         B/MgZXZ1BuMuAJTWFXdbW9OifFqGrY0vmPlQRkP/dSheE4YMH1s94yd9rzKzs160Jm1R
         t76RD38pjTQATHA32D9x/yTp+UTjercNfzmXppEbCgJQVsyjhbEB94bwF5/Dyajg4JkQ
         r/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328475; x=1724933275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Zk1/6OYAiP7rVpOU6oHGiW3F+xDoqsXkjFUmuJvrU8=;
        b=r/sDHk6KW58w7bNHSSBGsTJ4d8tgndsEY33ksh5MqG3qj22MwyicQAhJ9wBDvxnWGL
         kN6hkvKwRaKhBkQ0DCIFKagiD6pOnA+wrwHAKL5NXyF0+80o2jTOzaiOzfPYNkpQY8s8
         FFrg0Fs7l4zHjfYrHTcHwyPXIVs45qaRj+9ZBuzXQCNJdf6RPVY1yNVfLpxS6EV6abo+
         rGzmIBHda6Nx4WpJUimEV3stANHj6veyhBZQhEl37nBCCrWCCekpA/DJyhzpzGW+55+x
         gl2GWdSoPo/frw3fobab7WkY6IZKMnp8izlbNS79Hc77PS5XnZkwRGmBzqOJYoa69gEm
         j4cA==
X-Gm-Message-State: AOJu0Yxs3SeUOAr9QFj+Jpt79X91VcRpOEAJx20uD/b7xtsM9+rafrIm
	6q0LkKyfsm+NDq3iU5LRslvwuKmTXyfrBfGpuz02lM4uUZ8lrA3ifEhen3gO6u9lzg==
X-Google-Smtp-Source: AGHT+IFImfvX9ICeeSlaI6pA4CfbGpns2tsWMDSoDzqpOGAB/H8jmR2m4e7WRlwtGZqejO9hotlJXQ==
X-Received: by 2002:adf:dd89:0:b0:371:8bc9:167c with SMTP id ffacd0b85a97d-372fd701305mr3105528f8f.41.1724328475004;
        Thu, 22 Aug 2024 05:07:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.206.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730821ab1bsm1518781f8f.99.2024.08.22.05.07.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Aug 2024 05:07:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] tests/functional: Convert Aarch64 Virt machine avocado tests
Date: Thu, 22 Aug 2024 14:07:50 +0200
Message-ID: <20240822120750.89065-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qAXdVN+eePd9

Straight forward conversion. Update the SHA1 hash to
SHA256 since SHA1 should not be used anymore nowadays.
Use has_cmd() and run_cmd() methods from qemu_test.

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
 .../test_aarch64_virt.py}                     | 63 ++++++++-----------
 3 files changed, 29 insertions(+), 38 deletions(-)
 rename tests/{avocado/machine_aarch64_virt.py => functional/test_aarch64_virt.py} (74%)
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
index aebeec1e0e..d31a1e7ac0 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -12,6 +12,7 @@ endif
 # Timeouts for individual tests that can be slow e.g. with debugging enabled
 test_timeouts = {
   'aarch64_sbsaref' : 18000,
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
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
old mode 100644
new mode 100755
similarity index 74%
rename from tests/avocado/machine_aarch64_virt.py
rename to tests/functional/test_aarch64_virt.py
index 6831d2c0ed..d9a8e118c1
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+#
 # Functional test that boots a various Linux systems and checks the
 # console output.
 #
@@ -12,12 +14,10 @@
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
+from qemu_test import has_cmd, run_cmd
 
 class Aarch64VirtMachine(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
@@ -28,23 +28,18 @@ def wait_for_console_pattern(self, success_message, vm=None):
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
@@ -68,6 +63,11 @@ def test_alpine_virt_tcg_gic_max(self):
         self.wait_for_console_pattern('Welcome to Alpine Linux 3.17')
 
 
+    ASSET_KERNEL = Asset(
+        ('https://fileserver.linaro.org/s/'
+         'z6B2ARM7DQT3HWN/download'),
+        '12a54d4805cda6ab647cb7c7bbdb16fafb3df400e0d6f16445c1a0436100ef8d')
+
     def common_aarch64_virt(self, machine):
         """
         Common code to launch basic virt machine with kernel+initrd
@@ -75,11 +75,9 @@ def common_aarch64_virt(self, machine):
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
@@ -100,12 +98,11 @@ def common_aarch64_virt(self, machine):
         image_path = os.path.join(self.workdir, 'scratch.qcow2')
         qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
         if not os.path.exists(qemu_img):
-            qemu_img = find_command('qemu-img', False)
+            qemu_img = has_cmd('qemu-img')
         if qemu_img is False:
             self.cancel('Could not find "qemu-img", which is required to '
                         'create the temporary qcow2 image')
-        cmd = '%s create -f qcow2 %s 8M' % (qemu_img, image_path)
-        process.run(cmd)
+        run_cmd([qemu_img, 'create', '-f', 'qcow2', image_path, '8M'])
 
         # Add the device
         self.vm.add_args('-blockdev',
@@ -128,19 +125,11 @@ def common_aarch64_virt(self, machine):
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
