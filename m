Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa13sm8651808a12.7.2025.03.04.14.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 937005FC1A;
	Tue,  4 Mar 2025 22:24:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 02/32] tests/functional: factor out common code in gpu test
Date: Tue,  4 Mar 2025 22:24:09 +0000
Message-Id: <20250304222439.2035603-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VfyfD6EntkwC

In preparation for handling more tests split out the common machine
setup details from the test specific stuff and add a helper for
launching the weston test. Instead of searching for "vkmark score" we
set a custom PS1 and wait for a successful completion. This ensures we
capture the score in the console log which otherwise wouldn't log
anything.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250226140343.3907080-3-alex.bennee@linaro.org>

---
v2
  - don't be cute with the -display options
  - dropped r-b as I factored more
  - split into _launch_virt_gpu and _run_weston_test
  - detect PS1 success
---
 tests/functional/test_aarch64_virt_gpu.py | 38 +++++++++++++----------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index 616e6ed656..bd325577c0 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -12,7 +12,7 @@
 from qemu.machine.machine import VMLaunchFailure
 
 from qemu_test import QemuSystemTest, Asset
-from qemu_test import exec_command, exec_command_and_wait_for_pattern
+from qemu_test import exec_command_and_wait_for_pattern as ec_and_wait
 from qemu_test import skipIfMissingCommands
 
 from qemu_test.linuxkernel import LinuxKernelTest
@@ -31,12 +31,7 @@ class Aarch64VirtGPUMachine(LinuxKernelTest):
         'rootfs.ext4.zstd',
         '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
 
-    @skipIfMissingCommands('zstd')
-    def test_aarch64_virt_with_vulkan_gpu(self):
-        # This tests boots with a buildroot test image that contains
-        # vkmark and other GPU exercising tools. We run a headless
-        # weston that nevertheless still exercises the virtio-gpu
-        # backend.
+    def _launch_virt_gpu(self, gpu_device):
 
         self.set_machine('virt')
         self.require_accelerator("tcg")
@@ -54,10 +49,10 @@ def test_aarch64_virt_with_vulkan_gpu(self):
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.add_args("-smp", "2", "-m", "2048")
-        self.vm.add_args("-device",
-                         "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
+        self.vm.add_args("-device", gpu_device)
         self.vm.add_args("-display", "egl-headless")
         self.vm.add_args("-display", "dbus,gl=on")
+
         self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
         self.vm.add_args("-blockdev",
                          "driver=raw,file.driver=file,"
@@ -81,14 +76,23 @@ def test_aarch64_virt_with_vulkan_gpu(self):
                 raise excp
 
         self.wait_for_console_pattern('buildroot login:')
-        exec_command(self, 'root')
-        exec_command(self, 'export XDG_RUNTIME_DIR=/tmp')
-        exec_command_and_wait_for_pattern(self,
-                                          "weston -B headless "
-                                          "--renderer gl "
-                                          "--shell kiosk "
-                                          "-- vkmark -b:duration=1.0",
-                                          "vkmark Score")
+        ec_and_wait(self, 'root', '#')
+
+    def _run_virt_weston_test(self, cmd):
+
+        # make it easier to detect successful return to shell
+        PS1 = 'RES=[$?] # '
+        OK_CMD = 'RES=[0] # '
+
+        ec_and_wait(self, 'export XDG_RUNTIME_DIR=/tmp', '#')
+        ec_and_wait(self, f"export PS1='{PS1}'", OK_CMD)
+        full_cmd = f"weston -B headless --renderer gl --shell kiosk -- {cmd}"
+        ec_and_wait(self, full_cmd, OK_CMD)
+
+    @skipIfMissingCommands('zstd')
+    def test_aarch64_virt_with_vulkan_gpu(self):
+        self._launch_virt_gpu("virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
+        self._run_virt_weston_test("vkmark -b:duration=1.0")
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.39.5
