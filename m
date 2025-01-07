Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm50109865f8f.12.2025.01.07.08.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:52:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2781E5F8FC;
	Tue,  7 Jan 2025 16:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-riscv@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-s390x@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Fabiano Rosas <farosas@suse.de>,
	Weiwei Li <liwei1518@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eric Farman <farman@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v3 01/29] tests/functional: update the arm tuxrun tests
Date: Tue,  7 Jan 2025 16:51:39 +0000
Message-Id: <20250107165208.743958-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /nLLxyblwqQ2

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-21-alex.bennee@linaro.org>
---
 tests/functional/test_arm_tuxrun.py | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/functional/test_arm_tuxrun.py b/tests/functional/test_arm_tuxrun.py
index 944f0756e1..4ac85f48ac 100755
--- a/tests/functional/test_arm_tuxrun.py
+++ b/tests/functional/test_arm_tuxrun.py
@@ -17,14 +17,14 @@
 class TuxRunArmTest(TuxRunBaselineTest):
 
     ASSET_ARMV5_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/armv5/zImage',
-        'c95af2f27647c12265d75e9df44c22ff5228c59855f54aaa70f41ec2842e3a4d')
+        'https://storage.tuxboot.com/buildroot/20241119/armv5/zImage',
+        '3931a3908dbcf0ec0fe292d035ffc4dfed95f797dedd4a59ccfcf7a46e6f92d4')
     ASSET_ARMV5_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/armv5/rootfs.ext4.zst',
-        '17177afa74e7294da0642861f08c88ca3c836764299a54bf6d1ce276cb9712a5')
+        'https://storage.tuxboot.com/buildroot/20241119/armv5/rootfs.ext4.zst',
+        '60ff78b68c7021df378e4fc2d66d3b016484d1acc7e07fb8920c1d8e30f4571f')
     ASSET_ARMV5_DTB = Asset(
-        'https://storage.tuxboot.com/20230331/armv5/versatile-pb.dtb',
-        '0bc0c0b0858cefd3c32b385c0d66d97142ded29472a496f4f490e42fc7615b25')
+        'https://storage.tuxboot.com/buildroot/20241119/armv5/versatile-pb.dtb',
+        '50988e69ef3f3b08bfb9146e8fe414129990029e8dfbed444953b7e14809530a')
 
     def test_armv5(self):
         self.set_machine('versatilepb')
@@ -37,11 +37,11 @@ def test_armv5(self):
                            drive="virtio-blk-pci")
 
     ASSET_ARMV7_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/armv7/zImage',
-        '4c7a22e9f15875bec06bd2a29d822496571eb297d4f22694099ffcdb19077572')
+        'https://storage.tuxboot.com/buildroot/20241119/armv7/zImage',
+        '1377bc3d90de5ce57ab17cd67429fe8b15c2e9964248c775c682b67e6299b991')
     ASSET_ARMV7_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/armv7/rootfs.ext4.zst',
-        'ab1fbbeaddda1ffdd45c9405a28cd5370c20f23a7cbc809cc90dc9f243a8eb5a')
+        'https://storage.tuxboot.com/buildroot/20241119/armv7/rootfs.ext4.zst',
+        'ed2cbc69bd6b3fbd5cafb5ee961393c7cfbe726446f14301c67d6b1f28bfdb51')
 
     def test_armv7(self):
         self.set_machine('virt')
@@ -52,11 +52,11 @@ def test_armv7(self):
                            rootfs_asset=self.ASSET_ARMV7_ROOTFS)
 
     ASSET_ARMV7BE_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/armv7be/zImage',
-        '7facc62082b57af12015b08f7fdbaf2f123ba07a478367853ae12b219afc9f2f')
+        'https://storage.tuxboot.com/buildroot/20241119/armv7be/zImage',
+        'a244e6da99f1bbd254827ec7681bd4aac9eb1aa05aaebc6b15e5d289ebb683f3')
     ASSET_ARMV7BE_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/armv7be/rootfs.ext4.zst',
-        '42ed46dd2d59986206c5b1f6cf35eab58fe3fd20c96b41aaa16b32f3f90a9835')
+        'https://storage.tuxboot.com/buildroot/20241119/armv7be/rootfs.ext4.zst',
+        'd4f9c57860a512163f30ecc69b2174d1a1bdeb853a43dc49a09cfcfe84e428ea')
 
     def test_armv7be(self):
         self.set_machine('virt')
-- 
2.39.5
