Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905f067sm168718566b.14.2025.01.10.05.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:23:22 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0F83C61546;
	Fri, 10 Jan 2025 13:17:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 22/32] tests/functional: bail aarch64_virt tests early if missing TCG
Date: Fri, 10 Jan 2025 13:17:44 +0000
Message-Id: <20250110131754.2769814-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110131754.2769814-1-alex.bennee@linaro.org>
References: <20250110131754.2769814-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZR9qH4PaJ2WX

The set_machine and require_accelerator steps can bail early so move
those to the front of the test functions. While we are at it also
clean up some long lines when adding the vm arguments.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250108121054.1126164-23-alex.bennee@linaro.org>

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index b3d3b0ee51..201c5ed023 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -40,9 +40,9 @@ def test_alpine_virt_tcg_gic_max(self):
         iso_path = self.ASSET_ALPINE_ISO.fetch()
 
         self.set_machine('virt')
-        self.vm.set_console()
         self.require_accelerator("tcg")
 
+        self.vm.set_console()
         self.vm.add_args("-accel", "tcg")
         self.vm.add_args("-cpu", "max,pauth-impdef=on")
         self.vm.add_args("-machine",
@@ -71,15 +71,16 @@ def common_aarch64_virt(self, machine):
         Common code to launch basic virt machine with kernel+initrd
         and a scratch disk.
         """
+        self.set_machine('virt')
+        self.require_accelerator("tcg")
+
         logger = logging.getLogger('aarch64_virt')
 
         kernel_path = self.ASSET_KERNEL.fetch()
 
-        self.set_machine('virt')
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
-        self.require_accelerator("tcg")
         self.vm.add_args('-cpu', 'max,pauth-impdef=on',
                          '-machine', machine,
                          '-accel', 'tcg',
@@ -100,7 +101,9 @@ def common_aarch64_virt(self, machine):
 
         # Add the device
         self.vm.add_args('-blockdev',
-                         f"driver=qcow2,file.driver=file,file.filename={image_path},node-name=scratch")
+                         "driver=qcow2,"
+                         "file.driver=file,"
+                         f"file.filename={image_path},node-name=scratch")
         self.vm.add_args('-device',
                          'virtio-blk-device,drive=scratch')
 
-- 
2.39.5
