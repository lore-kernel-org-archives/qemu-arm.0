Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d634c000000b0031773a8e5c4sm12032016wrw.37.2023.09.25.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0B0B31FFBC;
	Mon, 25 Sep 2023 15:48:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Snow <jsnow@redhat.com>,
	libvir-list@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Nicholas Piggin <npiggin@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 01/31] tests/avocado: update firmware to enable sbsa-ref/neoverse-v1
Date: Mon, 25 Sep 2023 15:48:24 +0100
Message-Id: <20230925144854.1872513-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UIo3rYUCTh33

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Update prebuilt firmware images to have TF-A with Neoverse V1 support enabled.
This allowed us to enable test for this cpu in sbsa-ref machine.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Acked-by: Leif Lindholm <quic_llindhol@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 25 ++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index a794245e7e..b39f5566d7 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -28,33 +28,32 @@ def fetch_firmware(self):
         """
         Flash volumes generated using:
 
-        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
+        - Fedora GNU Toolchain version 13.2.1 20230728 (Red Hat 13.2.1-1)
 
         - Trusted Firmware-A
-          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
+          https://github.com/ARM-software/arm-trusted-firmware/tree/cc933e1d
 
         - Tianocore EDK II
-          https://github.com/tianocore/edk2/tree/0f9283429dd4
-          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
-          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
+          https://github.com/tianocore/edk2/tree/29cce3356aec
+          https://github.com/tianocore/edk2-platforms/tree/fc22c0e69709
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
-            "https://fileserver.linaro.org/s/HrYMCjP7MEccjRP/"
+            "https://fileserver.linaro.org/s/g4C3WzJzNBES2p2/"
             "download/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "447eff64a90b84ce47703c6ec41fbfc25befaaea"
+        fs0_xz_hash = "374738599f7ba38c22924b2075ec5355c2b24a47"
         tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
 
         # Non-secure rom (UEFI and EFI variables)
         fs1_xz_url = (
-            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
+            "https://fileserver.linaro.org/s/scJRninsAFTwEct/"
             "download/SBSA_FLASH1.fd.xz"
         )
-        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
+        fs1_xz_hash = "5d3f156ebd6c6374da2121e15c7c8f4ed0351dcc"
         tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
@@ -144,10 +143,16 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
 
     def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:neoverse-n1
         """
         self.boot_alpine_linux("neoverse-n1")
 
+    def test_sbsaref_alpine_linux_neoverse_v1(self):
+        """
+        :avocado: tags=cpu:neoverse-v1
+        """
+        self.boot_alpine_linux("neoverse-v1,pauth-impdef=on")
+
     def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
-- 
2.39.2
