Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedebfsm10679155f8f.100.2024.11.25.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 07:21:09 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 43C725F9CF;
	Mon, 25 Nov 2024 15:21:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org (open list:Allwinner-h3)
Subject: [PULL 05/28] tests/functional: remove leftover :avocado: tags
Date: Mon, 25 Nov 2024 15:20:42 +0000
Message-Id: <20241125152105.2100395-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125152105.2100395-1-alex.bennee@linaro.org>
References: <20241125152105.2100395-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aGW77MZcetfW

From: Daniel P. Berrangé <berrange@redhat.com>

These tags are not honoured under the new functional test harness.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-6-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-6-alex.bennee@linaro.org>

diff --git a/tests/functional/test_arm_bpim2u.py b/tests/functional/test_arm_bpim2u.py
index 2f9fa145e3..35ea58d46c 100755
--- a/tests/functional/test_arm_bpim2u.py
+++ b/tests/functional/test_arm_bpim2u.py
@@ -37,11 +37,6 @@ class BananaPiMachine(LinuxKernelTest):
         '5b41b4e11423e562c6011640f9a7cd3bdd0a3d42b83430f7caa70a432e6cd82c')
 
     def test_arm_bpim2u(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:bpim2u
-        :avocado: tags=accel:tcg
-        """
         self.set_machine('bpim2u')
         deb_path = self.ASSET_DEB.fetch()
         kernel_path = self.extract_from_deb(deb_path,
@@ -64,11 +59,6 @@ def test_arm_bpim2u(self):
         os.remove(dtb_path)
 
     def test_arm_bpim2u_initrd(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=accel:tcg
-        :avocado: tags=machine:bpim2u
-        """
         self.set_machine('bpim2u')
         deb_path = self.ASSET_DEB.fetch()
         kernel_path = self.extract_from_deb(deb_path,
@@ -105,11 +95,6 @@ def test_arm_bpim2u_initrd(self):
         os.remove(initrd_path)
 
     def test_arm_bpim2u_gmac(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:bpim2u
-        :avocado: tags=device:sd
-        """
         self.set_machine('bpim2u')
         self.require_netdev('user')
 
@@ -160,11 +145,6 @@ def test_arm_bpim2u_gmac(self):
 
     @skipUnless(os.getenv('QEMU_TEST_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_bpim2u_openwrt_22_03_3(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:bpim2u
-        :avocado: tags=device:sd
-        """
         self.set_machine('bpim2u')
         # This test download a 8.9 MiB compressed image and expand it
         # to 127 MiB.
diff --git a/tests/functional/test_arm_orangepi.py b/tests/functional/test_arm_orangepi.py
index d2ed5fcc82..6d57223a03 100755
--- a/tests/functional/test_arm_orangepi.py
+++ b/tests/functional/test_arm_orangepi.py
@@ -49,11 +49,6 @@ class BananaPiMachine(LinuxKernelTest):
         '20d3e07dc057e15c12452620e90ecab2047f0f7940d9cba8182ebc795927177f')
 
     def test_arm_orangepi(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=accel:tcg
-        """
         self.set_machine('orangepi-pc')
         deb_path = self.ASSET_DEB.fetch()
         kernel_path = self.extract_from_deb(deb_path,
@@ -75,11 +70,6 @@ def test_arm_orangepi(self):
         os.remove(dtb_path)
 
     def test_arm_orangepi_initrd(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=accel:tcg
-        :avocado: tags=machine:orangepi-pc
-        """
         self.set_machine('orangepi-pc')
         deb_path = self.ASSET_DEB.fetch()
         kernel_path = self.extract_from_deb(deb_path,
@@ -115,12 +105,6 @@ def test_arm_orangepi_initrd(self):
         os.remove(initrd_path)
 
     def test_arm_orangepi_sd(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=accel:tcg
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=device:sd
-        """
         self.set_machine('orangepi-pc')
         self.require_netdev('user')
         deb_path = self.ASSET_DEB.fetch()
@@ -167,11 +151,6 @@ def test_arm_orangepi_sd(self):
 
     @skipUnless(os.getenv('QEMU_TEST_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_armbian(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=device:sd
-        """
         self.set_machine('orangepi-pc')
         # This test download a 275 MiB compressed image and expand it
         # to 1036 MiB, but the underlying filesystem is 1552 MiB...
@@ -208,12 +187,6 @@ def test_arm_orangepi_armbian(self):
 
     @skipUnless(os.getenv('QEMU_TEST_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_uboot_netbsd9(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=device:sd
-        :avocado: tags=os:netbsd
-        """
         self.set_machine('orangepi-pc')
         # This test download a 304MB compressed image and expand it to 2GB
         deb_path = self.ASSET_UBOOT.fetch()
-- 
2.39.5
