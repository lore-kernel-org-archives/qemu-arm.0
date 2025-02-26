Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba549be9sm22704255e9.34.2025.02.26.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:44 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 446A5601A1;
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
Subject: [PATCH 04/25] tests/functional: expand tests to cover virgl
Date: Wed, 26 Feb 2025 14:03:22 +0000
Message-Id: <20250226140343.3907080-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: em98/3OL2Wib

Add two more test modes using glmark2-wayland to exercise the OpenGL
pass-through modes with virgl. Virgl can run with or without the
hostmem blob support.

We might want to eventually add more directed tests and individual
features later on but the glmark/vkmark tests are a good general
smoke test for accelerated 3D.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250219150009.1662688-5-alex.bennee@linaro.org>
---
 tests/functional/test_aarch64_virt_gpu.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index c9463d7285..7a8471d1ca 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -89,6 +89,26 @@ def _run_virt_gpu_test(self, gpu_device,  weston_cmd, weston_pattern):
         full_cmd = f"weston -B headless --renderer gl --shell kiosk -- {weston_cmd}"
         exec_command_and_wait_for_pattern(self, full_cmd, weston_pattern)
 
+    @skipIfMissingCommands('zstd')
+    def test_aarch64_virt_with_virgl_gpu(self):
+
+        self.require_device('virtio-gpu-gl-pci')
+
+        gpu_device = "virtio-gpu-gl-pci"
+        weston_cmd = "glmark2-wayland -b:duration=1.0"
+        weston_pattern = "glmark2 Score"
+        self._run_virt_gpu_test(gpu_device, weston_cmd, weston_pattern)
+
+    @skipIfMissingCommands('zstd')
+    def test_aarch64_virt_with_virgl_blobs_gpu(self):
+
+        self.require_device('virtio-gpu-gl-pci')
+
+        gpu_device = "virtio-gpu-gl-pci,hostmem=4G,blob=on"
+        weston_cmd = "glmark2-wayland -b:duration=1.0"
+        weston_pattern = "glmark2 Score"
+        self._run_virt_gpu_test(gpu_device, weston_cmd, weston_pattern)
+
     @skipIfMissingCommands('zstd')
     def test_aarch64_virt_with_vulkan_gpu(self):
 
-- 
2.39.5
