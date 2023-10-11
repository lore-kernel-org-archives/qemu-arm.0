Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m12-20020a056000024c00b0032d88e370basm950574wrz.34.2023.10.11.03.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 03:33:30 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 346BB1FFBC;
	Wed, 11 Oct 2023 11:33:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Brad Smith <brad@comstyle.com>,
	qemu-arm@nongnu.org (open list:SBSA-REF)
Subject: [PULL 01/25] tests/avocado: update firmware to enable OpenBSD test on sbsa-ref
Date: Wed, 11 Oct 2023 11:33:05 +0100
Message-Id: <20231011103329.670525-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011103329.670525-1-alex.bennee@linaro.org>
References: <20231011103329.670525-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FLm6UE8pOy5N

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Update prebuilt firmware images:
- Neoverse V1/N2 cpu support
- non-secure EL2 virtual timer
- XHCI controller in DSDT

With those changes we can now run OpenBSD as part of sbsa-ref tests.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-Id: <20230927120050.210187-2-marcin.juszkiewicz@linaro.org>
[AJB: fix whitespace and longline]
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231009164104.369749-2-alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index a794245e7e..b272053eaf 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -28,33 +28,33 @@ def fetch_firmware(self):
         """
         Flash volumes generated using:
 
-        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
+        - Fedora GNU Toolchain version 13.2.1 20230728 (Red Hat 13.2.1-1)
 
         - Trusted Firmware-A
-          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
+          https://github.com/ARM-software/arm-trusted-firmware/tree/7c3ff62d
 
         - Tianocore EDK II
           https://github.com/tianocore/edk2/tree/0f9283429dd4
-          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
-          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
+          https://github.com/tianocore/edk2/tree/ad1c0394b177
+          https://github.com/tianocore/edk2-platforms/tree/d03a60523a60
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
-            "https://fileserver.linaro.org/s/HrYMCjP7MEccjRP/"
+            "https://fileserver.linaro.org/s/rE43RJyTfxPtBkc/"
             "download/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "447eff64a90b84ce47703c6ec41fbfc25befaaea"
+        fs0_xz_hash = "cdb8e4ffdaaa79292b7b465693f9e5fae6b7062d"
         tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
 
         # Non-secure rom (UEFI and EFI variables)
         fs1_xz_url = (
-            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
+            "https://fileserver.linaro.org/s/AGWPDXbcqJTKS4R/"
             "download/SBSA_FLASH1.fd.xz"
         )
-        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
+        fs1_xz_hash = "411155ae6984334714dff08d5d628178e790c875"
         tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
@@ -144,7 +144,7 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
 
     def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:neoverse-n1
         """
         self.boot_alpine_linux("neoverse-n1")
 
@@ -152,4 +152,54 @@ def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
         """
-        self.boot_alpine_linux("max,pauth-impdef=on")
+        self.boot_alpine_linux("max")
+
+
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def boot_openbsd73(self, cpu):
+        self.fetch_firmware()
+
+        img_url = (
+            "https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.img"
+        )
+
+        img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
+        img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
+
+        self.vm.set_console()
+        self.vm.add_args(
+            "-cpu",
+            cpu,
+            "-drive",
+            f"file={img_path},format=raw",
+            "-device",
+            "virtio-rng-pci,rng=rng0",
+            "-object",
+            "rng-random,id=rng0,filename=/dev/urandom",
+        )
+
+        self.vm.launch()
+        wait_for_console_pattern(self,
+                                 "Welcome to the OpenBSD/arm64"
+                                 " 7.3 installation program.")
+
+    def test_sbsaref_openbsd73_cortex_a57(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.boot_openbsd73("cortex-a57")
+
+    def test_sbsaref_openbsd73_neoverse_n1(self):
+        """
+        :avocado: tags=cpu:neoverse-n1
+        """
+        self.boot_openbsd73("neoverse-n1")
+
+    def test_sbsaref_openbsd73_max(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_openbsd73("max")
+
-- 
2.39.2
