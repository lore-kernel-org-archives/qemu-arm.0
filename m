Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm26068538a12.70.2025.01.08.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:11:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CBD195F8AC;
	Wed,  8 Jan 2025 12:10:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-riscv@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <lvivier@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 23/32] tests/functional: extend test_aarch64_virt with vulkan test
Date: Wed,  8 Jan 2025 12:10:45 +0000
Message-Id: <20250108121054.1126164-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TQjWE0KFx8Pg

Now that we have virtio-gpu Vulkan support, let's add a test for it.
Currently this is using images build by buildroot:

  https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.html

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use decorator for has_cmd(zstd)
  - un-handled->unhandled
  - drop extra - from --snapshot
  - drop unneeded virtualization=on
  - only show 1s of each scene
  - fix long lines
v3
  - move set_machine/require_accelerator to top of test
  - use uncompress utility function
  - remove extra ()'s from ASSETS
v4
  - split misc fixups into earlier commits
  - don't swallow leading newlines before class
  - fixup commit message
---
 tests/functional/test_aarch64_virt.py | 74 ++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index 201c5ed023..6b2336a28d 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -13,10 +13,12 @@
 import logging
 from subprocess import check_call, DEVNULL
 
+from qemu.machine.machine import VMLaunchFailure
+
 from qemu_test import QemuSystemTest, Asset
-from qemu_test import exec_command_and_wait_for_pattern
+from qemu_test import exec_command, exec_command_and_wait_for_pattern
 from qemu_test import wait_for_console_pattern
-from qemu_test import get_qemu_img
+from qemu_test import skipIfMissingCommands, get_qemu_img
 
 
 class Aarch64VirtMachine(QemuSystemTest):
@@ -132,5 +134,73 @@ def test_aarch64_virt_gicv2(self):
         self.common_aarch64_virt("virt,gic-version=2")
 
 
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
+    def test_aarch64_virt_with_gpu(self):
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
+            else:
+                self.log.info("unhandled launch failure: {excp.output}")
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
+
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.39.5
