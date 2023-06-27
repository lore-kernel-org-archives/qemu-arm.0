Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f4-20020a1c6a04000000b003fba2734f1esm2525151wmc.1.2023.06.27.09.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:09:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BE23F1FFC8;
	Tue, 27 Jun 2023 17:09:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 16/36] tests/avocado: update firmware to enable sbsa-ref/max
Date: Tue, 27 Jun 2023 17:09:23 +0100
Message-Id: <20230627160943.2956928-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aumcpLJBlDWO

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Update prebuilt firmware images to have TF-A with FEAT_FGT support
enabled. This allowed us to enable test for "max" cpu in sbsa-ref
machine.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-Id: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - re-enable for CI
---
 tests/avocado/machine_aarch64_sbsaref.py | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 0a79fa7ab6..cce6ef9f65 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -29,23 +29,23 @@ def fetch_firmware(self):
         """
         Flash volumes generated using:
 
-        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12.2.1-2)
+        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
 
         - Trusted Firmware-A
-          https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
+          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
 
         - Tianocore EDK II
-          https://github.com/tianocore/edk2/tree/494127613b
-          https://github.com/tianocore/edk2-non-osi/tree/41876073
-          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
+          https://github.com/tianocore/edk2/tree/0f9283429dd4
+          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
+          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
-            "https://fileserver.linaro.org/s/ATnSmq6k8SoXgbH/"
+            "https://fileserver.linaro.org/s/HrYMCjP7MEccjRP/"
             "download/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "a210a09692bcbe0a3743ffd0df44e80e0c7ad8ab"
+        fs0_xz_hash = "447eff64a90b84ce47703c6ec41fbfc25befaaea"
         tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
@@ -93,15 +93,15 @@ def test_sbsaref_edk2_firmware(self):
 
         # AP Trusted ROM
         wait_for_console_pattern(self, "Booting Trusted Firmware")
-        wait_for_console_pattern(self, "BL1: v2.8(release):v2.8")
+        wait_for_console_pattern(self, "BL1: v2.9(release):v2.9")
         wait_for_console_pattern(self, "BL1: Booting BL2")
 
         # Trusted Boot Firmware
-        wait_for_console_pattern(self, "BL2: v2.8(release)")
+        wait_for_console_pattern(self, "BL2: v2.9(release)")
         wait_for_console_pattern(self, "Booting BL31")
 
         # EL3 Runtime Software
-        wait_for_console_pattern(self, "BL31: v2.8(release)")
+        wait_for_console_pattern(self, "BL31: v2.9(release)")
 
         # Non-trusted Firmware
         wait_for_console_pattern(self, "UEFI firmware (version 1.0")
@@ -136,21 +136,18 @@ def boot_alpine_linux(self, cpu):
         self.vm.launch()
         wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
 
-    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
     def test_sbsaref_alpine_linux_cortex_a57(self):
         """
         :avocado: tags=cpu:cortex-a57
         """
         self.boot_alpine_linux("cortex-a57")
 
-    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
     def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
         :avocado: tags=cpu:max
         """
         self.boot_alpine_linux("neoverse-n1")
 
-    @skip("requires TF-A update to handle FEAT_FGT")
     def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
-- 
2.39.2
