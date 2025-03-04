Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf4f8a2035sm692348266b.107.2025.03.04.14.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0DE725FD05;
	Tue,  4 Mar 2025 22:24:40 +0000 (GMT)
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
Subject: [PATCH v2 07/32] tests/functional: update the aarch64_virg_gpu images
Date: Tue,  4 Mar 2025 22:24:14 +0000
Message-Id: <20250304222439.2035603-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 538Ja56a2Lda

Update to the most recent aarch64_virt_gpu image. The principle
differences are:

  - target a v8.0 baseline CPU
  - latest vkmark (2025.1)
  - actually uses the rootfs (previously was initrd)
  - rootfs includes more testing tools for interactive use

See README.md in https://fileserver.linaro.org/s/ce5jXBFinPxtEdx for
details about the image creation and the buildroot config.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_aarch64_virt_gpu.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index 3fdb31f034..e417ca9beb 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -25,14 +25,14 @@ class Aarch64VirtGPUMachine(LinuxKernelTest):
     ASSET_VIRT_GPU_KERNEL = Asset(
         'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
         'download?path=%2F&files='
-        'Image',
-        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
+        'Image.6.12.16.aarch64',
+        '7888c51c55d37e86bbbdeb5acea9f08c34e6b0f03c1f5b2463285f6a6f6eec8b')
 
     ASSET_VIRT_GPU_ROOTFS = Asset(
         'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
         'download?path=%2F&files='
-        'rootfs.ext4.zstd',
-        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
+        'rootfs.aarch64.ext2.zstd',
+        'd45118c899420b7e673f1539a37a35480134b3e36e3a59e2cb69b1781cbb14ef')
 
     def _launch_virt_gpu(self, gpu_device):
 
@@ -47,7 +47,7 @@ def _launch_virt_gpu(self, gpu_device):
                                'console=ttyAMA0 root=/dev/vda')
 
         self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=on")
+        self.vm.add_args("-cpu", "cortex-a72")
         self.vm.add_args("-machine", "virt,gic-version=max",
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
-- 
2.39.5
