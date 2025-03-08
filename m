Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01952dsm9757036f8f.45.2025.03.08.13.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 13:53:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A73275FA05;
	Sat,  8 Mar 2025 21:53:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 01/31] tests/functional: move aarch64 GPU test into own file
Date: Sat,  8 Mar 2025 21:52:56 +0000
Message-Id: <20250308215326.2907828-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250308215326.2907828-1-alex.bennee@linaro.org>
References: <20250308215326.2907828-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MxtDaV95J+cE

I want to expand the number of tests to cover a wide range of
configurations. That starts with splitting off from the normal virt
test from which it doesn't really share much code. We can also reduce
the timeout of the original virt test now it is now longer burdened
with testing the GPU.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250304222439.2035603-2-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 5df6020ed5..756432add4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2630,6 +2630,7 @@ F: hw/display/virtio-gpu*
 F: hw/display/virtio-vga.*
 F: include/hw/virtio/virtio-gpu.h
 F: docs/system/devices/virtio-gpu.rst
+F: tests/functional/test_aarch64_virt_gpu.py
 
 vhost-user-blk
 M: Raphael Norwitz <raphael@enfabrica.net>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 3fd2652c07..4b492135e0 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -18,7 +18,8 @@ test_timeouts = {
   'aarch64_sbsaref_alpine' : 1200,
   'aarch64_sbsaref_freebsd' : 720,
   'aarch64_tuxrun' : 240,
-  'aarch64_virt' : 720,
+  'aarch64_virt' : 360,
+  'aarch64_virt_gpu' : 480,
   'acpi_bits' : 420,
   'arm_aspeed_palmetto' : 120,
   'arm_aspeed_romulus' : 120,
@@ -81,6 +82,7 @@ tests_aarch64_system_thorough = [
   'aarch64_tcg_plugins',
   'aarch64_tuxrun',
   'aarch64_virt',
+  'aarch64_virt_gpu',
   'aarch64_xen',
   'aarch64_xlnx_versal',
   'multiprocess',
diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index 95f5ce8b4c..884aad7af6 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -134,77 +134,6 @@ def test_aarch64_virt_gicv2(self):
         self.common_aarch64_virt("virt,gic-version=2")
 
 
-    ASSET_VIRT_GPU_KERNEL = Asset(
-        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
-        'download?path=%2F&files='
-        'Image',
-        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
-
-    ASSET_VIRT_GPU_ROOTFS = Asset(
-        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
-        'download?path=%2F&files='
-        'rootfs.ext4.zstd',
-        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
-
-    @skipIfMissingCommands('zstd')
-    def test_aarch64_virt_with_gpu(self):
-        # This tests boots with a buildroot test image that contains
-        # vkmark and other GPU exercising tools. We run a headless
-        # weston that nevertheless still exercises the virtio-gpu
-        # backend.
-
-        self.set_machine('virt')
-        self.require_accelerator("tcg")
-
-        kernel_path = self.ASSET_VIRT_GPU_KERNEL.fetch()
-        image_path = self.uncompress(self.ASSET_VIRT_GPU_ROOTFS, format="zstd")
-
-        self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'console=ttyAMA0 root=/dev/vda')
-
-        self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=on")
-        self.vm.add_args("-machine", "virt,gic-version=max",
-                         '-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.add_args("-smp", "2", "-m", "2048")
-        self.vm.add_args("-device",
-                         "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
-        self.vm.add_args("-display", "egl-headless")
-        self.vm.add_args("-display", "dbus,gl=on")
-        self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
-        self.vm.add_args("-blockdev",
-                         "driver=raw,file.driver=file,"
-                         "node-name=hd0,read-only=on,"
-                         f"file.filename={image_path}")
-        self.vm.add_args("-snapshot")
-
-        try:
-            self.vm.launch()
-        except VMLaunchFailure as excp:
-            if "old virglrenderer, blob resources unsupported" in excp.output:
-                self.skipTest("No blob support for virtio-gpu")
-            elif "old virglrenderer, venus unsupported" in excp.output:
-                self.skipTest("No venus support for virtio-gpu")
-            elif "egl: no drm render node available" in excp.output:
-                self.skipTest("Can't access host DRM render node")
-            elif "'type' does not accept value 'egl-headless'" in excp.output:
-                self.skipTest("egl-headless support is not available")
-            else:
-                self.log.info(f"unhandled launch failure: {excp.output}")
-                raise excp
-
-        self.wait_for_console_pattern('buildroot login:')
-        exec_command(self, 'root')
-        exec_command(self, 'export XDG_RUNTIME_DIR=/tmp')
-        exec_command_and_wait_for_pattern(self,
-                                          "weston -B headless "
-                                          "--renderer gl "
-                                          "--shell kiosk "
-                                          "-- vkmark -b:duration=1.0",
-                                          "vkmark Score")
-
 
 if __name__ == '__main__':
     QemuSystemTest.main()
diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
new file mode 100755
index 0000000000..32af941cd5
--- /dev/null
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -0,0 +1,94 @@
+#!/usr/bin/env python3
+#
+# Functional tests for the various graphics modes we can support.
+#
+# Copyright (c) 2024, 2025 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu.machine.machine import VMLaunchFailure
+
+from qemu_test import Asset
+from qemu_test import exec_command, exec_command_and_wait_for_pattern
+from qemu_test import skipIfMissingCommands
+
+from qemu_test.linuxkernel import LinuxKernelTest
+
+class Aarch64VirtGPUMachine(LinuxKernelTest):
+
+    ASSET_VIRT_GPU_KERNEL = Asset(
+        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
+        'download?path=%2F&files='
+        'Image',
+        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
+
+    ASSET_VIRT_GPU_ROOTFS = Asset(
+        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
+        'download?path=%2F&files='
+        'rootfs.ext4.zstd',
+        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
+
+    @skipIfMissingCommands('zstd')
+    def test_aarch64_virt_with_vulkan_gpu(self):
+        # This tests boots with a buildroot test image that contains
+        # vkmark and other GPU exercising tools. We run a headless
+        # weston that nevertheless still exercises the virtio-gpu
+        # backend.
+
+        self.set_machine('virt')
+        self.require_accelerator("tcg")
+
+        kernel_path = self.ASSET_VIRT_GPU_KERNEL.fetch()
+        image_path = self.uncompress(self.ASSET_VIRT_GPU_ROOTFS, format="zstd")
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0 root=/dev/vda')
+
+        self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=on")
+        self.vm.add_args("-machine", "virt,gic-version=max",
+                         '-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.add_args("-smp", "2", "-m", "2048")
+        self.vm.add_args("-device",
+                         "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
+        self.vm.add_args("-display", "egl-headless")
+        self.vm.add_args("-display", "dbus,gl=on")
+        self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
+        self.vm.add_args("-blockdev",
+                         "driver=raw,file.driver=file,"
+                         "node-name=hd0,read-only=on,"
+                         f"file.filename={image_path}")
+        self.vm.add_args("-snapshot")
+
+        try:
+            self.vm.launch()
+        except VMLaunchFailure as excp:
+            if "old virglrenderer, blob resources unsupported" in excp.output:
+                self.skipTest("No blob support for virtio-gpu")
+            elif "old virglrenderer, venus unsupported" in excp.output:
+                self.skipTest("No venus support for virtio-gpu")
+            elif "egl: no drm render node available" in excp.output:
+                self.skipTest("Can't access host DRM render node")
+            elif "'type' does not accept value 'egl-headless'" in excp.output:
+                self.skipTest("egl-headless support is not available")
+            else:
+                self.log.info(f"unhandled launch failure: {excp.output}")
+                raise excp
+
+        self.wait_for_console_pattern('buildroot login:')
+        exec_command(self, 'root')
+        exec_command(self, 'export XDG_RUNTIME_DIR=/tmp')
+        exec_command_and_wait_for_pattern(self,
+                                          "weston -B headless "
+                                          "--renderer gl "
+                                          "--shell kiosk "
+                                          "-- vkmark -b:duration=1.0",
+                                          "vkmark Score")
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.39.5
