Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc9b3sm5710878f8f.97.2025.02.26.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:44 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 196F15FC78;
	Wed, 26 Feb 2025 14:03:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 02/25] tests/functional: factor out common code in gpu test
Date: Wed, 26 Feb 2025 14:03:20 +0000
Message-Id: <20250226140343.3907080-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qhP2yYPiYlcP

In preparation for handling more tests split out the common machine
setup details from the test specific stuff.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250219150009.1662688-3-alex.bennee@linaro.org>
---
 tests/functional/test_aarch64_virt_gpu.py | 30 +++++++++++------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index f21ae18392..06093c6b60 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -39,12 +39,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
         'rootfs.ext4.zstd',
         '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
 
-    @skipIfMissingCommands('zstd')
-    def test_aarch64_virt_with_vulkan_gpu(self):
-        # This tests boots with a buildroot test image that contains
-        # vkmark and other GPU exercising tools. We run a headless
-        # weston that nevertheless still exercises the virtio-gpu
-        # backend.
+    def _run_virt_gpu_test(self, gpu_device,  weston_cmd, weston_pattern):
 
         self.set_machine('virt')
         self.require_accelerator("tcg")
@@ -62,10 +57,10 @@ def test_aarch64_virt_with_vulkan_gpu(self):
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.add_args("-smp", "2", "-m", "2048")
-        self.vm.add_args("-device",
-                         "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
-        self.vm.add_args("-display", "egl-headless")
-        self.vm.add_args("-display", "dbus,gl=on")
+        self.vm.add_args("-device", gpu_device)
+        for opt in ["egl-headless", "dbus,gl=on"]:
+            self.vm.add_args("-display", opt)
+
         self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
         self.vm.add_args("-blockdev",
                          "driver=raw,file.driver=file,"
@@ -91,12 +86,15 @@ def test_aarch64_virt_with_vulkan_gpu(self):
         self.wait_for_console_pattern('buildroot login:')
         exec_command(self, 'root')
         exec_command(self, 'export XDG_RUNTIME_DIR=/tmp')
-        exec_command_and_wait_for_pattern(self,
-                                          "weston -B headless "
-                                          "--renderer gl "
-                                          "--shell kiosk "
-                                          "-- vkmark -b:duration=1.0",
-                                          "vkmark Score")
+        full_cmd = f"weston -B headless --renderer gl --shell kiosk -- {weston_cmd}"
+        exec_command_and_wait_for_pattern(self, full_cmd, weston_pattern)
+
+    @skipIfMissingCommands('zstd')
+    def test_aarch64_virt_with_vulkan_gpu(self):
+        gpu_device = "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on"
+        weston_cmd = "vkmark -b:duration=1.0"
+        weston_pattern = "vkmark Score"
+        self._run_virt_gpu_test(gpu_device, weston_cmd, weston_pattern)
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.39.5
