Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf5453f468sm663503566b.51.2025.03.04.14.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id ECB705FCF6;
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
Subject: [PATCH v2 06/32] tests/functional: expand tests to cover virgl
Date: Tue,  4 Mar 2025 22:24:13 +0000
Message-Id: <20250304222439.2035603-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ni+DSXIooUAP

Add two more test modes using glmark2-wayland to exercise the OpenGL
pass-through modes with virgl. Virgl can run with or without the
hostmem blob support. To avoid repeating ourselves too much we make
the initial pass a simple --validate pass.

We might want to eventually add more directed tests and individual
features later on but the glmark/vkmark tests are a good general
smoke test for accelerated 3D.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20250226140343.3907080-5-alex.bennee@linaro.org>

---
v2
  - re-base with re-factor and don't run whole suite of glmark on both
  virgl builds
---
 tests/functional/test_aarch64_virt_gpu.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index 55957dae0a..3fdb31f034 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -92,6 +92,28 @@ def _run_virt_weston_test(self, cmd, fail = None):
         full_cmd = f"weston -B headless --renderer gl --shell kiosk -- {cmd}"
         ec_and_wait(self, full_cmd, OK_CMD, fail)
 
+    @skipIfMissingCommands('zstd')
+    def test_aarch64_virt_with_virgl_gpu(self):
+
+        self.require_device('virtio-gpu-gl-pci')
+
+        self._launch_virt_gpu("virtio-gpu-gl-pci")
+
+        # subset of the glmark tests
+        tests = " ".join([f"-b {test}" for test in
+                          ["build", "texture", "shading",
+                           "bump", "desktop", "buffer"]])
+
+        self._run_virt_weston_test("glmark2-wayland --validate " + tests)
+
+    @skipIfMissingCommands('zstd')
+    def test_aarch64_virt_with_virgl_blobs_gpu(self):
+
+        self.require_device('virtio-gpu-gl-pci')
+
+        self._launch_virt_gpu("virtio-gpu-gl-pci,hostmem=4G,blob=on")
+        self._run_virt_weston_test("glmark2-wayland -b:duration=1.0")
+
     @skipIfMissingCommands('zstd')
     def test_aarch64_virt_with_vulkan_gpu(self):
 
-- 
2.39.5
