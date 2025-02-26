Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd882a64sm5537849f8f.46.2025.02.26.06.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:47 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A46516034D;
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
	Thomas Huth <thuth@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [PATCH 08/25] tests/functional: skip vulkan tests with nVidia
Date: Wed, 26 Feb 2025 14:03:26 +0000
Message-Id: <20250226140343.3907080-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: C+fhmP41Z90C

While running the new GPU tests it was noted that the proprietary
nVidia driver barfed when run under the sanitiser:

  2025-02-20 11:13:08,226: [11:13:07.782] Output 'headless' attempts
  EOTF mode SDR and colorimetry mode default.
  2025-02-20 11:13:08,227: [11:13:07.784] Output 'headless' using color
  profile: stock sRGB color profile

  and that's the last thing it outputs.

  The sanitizer reports that when the framework sends the SIGTERM
  because of the timeout we get a write to a NULL pointer (but
  interesting not this time in an atexit callback):

  UndefinedBehaviorSanitizer:DEADLYSIGNAL
  ==471863==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address
  0x000000000000 (pc 0x7a18ceaafe80 bp 0x000000000000 sp 0x7ffe8e3ff6d0
  T471863)
  ==471863==The signal is caused by a WRITE memory access.
  ==471863==Hint: address points to the zero page.
      #0 0x7a18ceaafe80
  (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x16afe80)
  (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
      #1 0x7a18ce9e72c0
  (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15e72c0)
  (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
      #2 0x7a18ce9f11bb
  (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15f11bb)
  (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
      #3 0x7a18ce6dc9d1
  (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x12dc9d1)
  (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
      #4 0x7a18e7d15326 in vrend_renderer_create_fence
  /usr/src/virglrenderer-1.0.0-1ubuntu2/obj-x86_64-linux-gnu/../src/vrend_renderer.c:10883:26
      #5 0x55bfb6621871 in virtio_gpu_virgl_process_cmd

The #dri-devel channel confirmed:

  <digetx> stsquad: nv driver is known to not work with venus, don't use
      it for testing

So lets skip running the test to avoid known failures.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>

---
v2
  - implement block at the test level
---
 tests/functional/test_aarch64_virt_gpu.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index 7a8471d1ca..a4ae5777e6 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -9,8 +9,6 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import logging
-
 from qemu.machine.machine import VMLaunchFailure
 
 from qemu_test import QemuSystemTest, Asset
@@ -18,6 +16,10 @@
 from qemu_test import wait_for_console_pattern
 from qemu_test import skipIfMissingCommands
 
+from re import search
+from subprocess import check_output
+
+
 class Aarch64VirtGPUMachine(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
     timeout = 360
@@ -110,10 +112,16 @@ def test_aarch64_virt_with_virgl_blobs_gpu(self):
         self._run_virt_gpu_test(gpu_device, weston_cmd, weston_pattern)
 
     @skipIfMissingCommands('zstd')
+    @skipIfMissingCommands('vulkaninfo')
     def test_aarch64_virt_with_vulkan_gpu(self):
 
         self.require_device('virtio-gpu-gl-pci')
 
+        vk_info = check_output(["vulkaninfo", "--summary"], encoding="utf-8")
+
+        if search(r"driverID\s+=\s+DRIVER_ID_NVIDIA_PROPRIETARY", vk_info):
+            self.skipTest("Test skipped on NVIDIA proprietary driver")
+
         gpu_device = "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on"
         weston_cmd = "vkmark -b:duration=1.0"
         weston_pattern = "vkmark Score"
-- 
2.39.5
