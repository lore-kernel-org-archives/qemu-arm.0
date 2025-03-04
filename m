Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf75c6d4f3sm441451566b.184.2025.03.04.14.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:40 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BDE4F5FCAA;
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
Subject: [PATCH v2 04/32] tests/functional: bail early if vkmark hangs
Date: Tue,  4 Mar 2025 22:24:11 +0000
Message-Id: <20250304222439.2035603-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qh8zriJMpqF8

The message:

  MESA-VIRTIO: debug: stuck in fence wait with iter at %d

Seems to occur more often on debug builds. Rather than waiting for our
long timeout to hit we might as well bail as soon as we see the
message.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_aarch64_virt_gpu.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index 4420a6175f..7d7749e243 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -78,7 +78,7 @@ def _launch_virt_gpu(self, gpu_device):
         self.wait_for_console_pattern('buildroot login:')
         ec_and_wait(self, 'root', '#')
 
-    def _run_virt_weston_test(self, cmd):
+    def _run_virt_weston_test(self, cmd, fail = None):
 
         # make it easier to detect successful return to shell
         PS1 = 'RES=[$?] # '
@@ -87,7 +87,7 @@ def _run_virt_weston_test(self, cmd):
         ec_and_wait(self, 'export XDG_RUNTIME_DIR=/tmp', '#')
         ec_and_wait(self, f"export PS1='{PS1}'", OK_CMD)
         full_cmd = f"weston -B headless --renderer gl --shell kiosk -- {cmd}"
-        ec_and_wait(self, full_cmd, OK_CMD)
+        ec_and_wait(self, full_cmd, OK_CMD, fail)
 
     @skipIfMissingCommands('zstd')
     def test_aarch64_virt_with_vulkan_gpu(self):
@@ -95,7 +95,9 @@ def test_aarch64_virt_with_vulkan_gpu(self):
         self.require_device('virtio-gpu-gl-pci')
 
         self._launch_virt_gpu("virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
-        self._run_virt_weston_test("vkmark -b:duration=1.0")
+        self._run_virt_weston_test("vkmark -b:duration=1.0",
+                                   "debug: stuck in fence wait with iter at")
+
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.39.5
