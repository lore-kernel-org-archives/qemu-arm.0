Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b46426d7sm61115695e9.36.2024.11.21.09.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:06:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5435E60435;
	Thu, 21 Nov 2024 16:58:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-riscv@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-s390x@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-rust@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ani Sinha <anisinha@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 21/39] tests/functional: update the aarch64 tuxrun tests
Date: Thu, 21 Nov 2024 16:57:48 +0000
Message-Id: <20241121165806.476008-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: e/waIU56vRjh

Now there are new upto date images available we should update to them.
With the new rootfs the blk I/O errors also go away on arm64be.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/test_aarch64_tuxrun.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/functional/test_aarch64_tuxrun.py b/tests/functional/test_aarch64_tuxrun.py
index da56aee4ed..75adc8acb8 100755
--- a/tests/functional/test_aarch64_tuxrun.py
+++ b/tests/functional/test_aarch64_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunAarch64Test(TuxRunBaselineTest):
 
     ASSET_ARM64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/arm64/Image',
-        'ce95a7101a5fecebe0fe630deee6bd97b32ba41bc8754090e9ad8961ea8674c7')
+        'https://storage.tuxboot.com/buildroot/20241119/arm64/Image',
+        'b74743c5e89e1cea0f73368d24ae0ae85c5204ff84be3b5e9610417417d2f235')
     ASSET_ARM64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/arm64/rootfs.ext4.zst',
-        'bbd5ed4b9c7d3f4ca19ba71a323a843c6b585e880115df3b7765769dbd9dd061')
+        'https://storage.tuxboot.com/buildroot/20241119/arm64/rootfs.ext4.zst',
+        'a1acaaae2068df4648d04ff75f532aaa8c5edcd6b936122b6f0db4848a07b465')
 
     def test_arm64(self):
         self.set_machine('virt')
@@ -32,11 +32,11 @@ def test_arm64(self):
                            rootfs_asset=self.ASSET_ARM64_ROOTFS)
 
     ASSET_ARM64BE_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/arm64be/Image',
-        'e0df4425eb2cd9ea9a283e808037f805641c65d8fcecc8f6407d8f4f339561b4')
+        'https://storage.tuxboot.com/buildroot/20241119/arm64be/Image',
+        'fd6af4f16689d17a2c24fe0053cc212edcdf77abdcaf301800b8d38fa9f6e109')
     ASSET_ARM64BE_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/arm64be/rootfs.ext4.zst',
-        'e6ffd8813c8a335bc15728f2835f90539c84be7f8f5f691a8b01451b47fb4bd7')
+        'https://storage.tuxboot.com/buildroot/20241119/arm64be/rootfs.ext4.zst',
+        'f5e9371b62701aab8dead52592ca7488c8a9e255c9be8d7635c7f30f477c2c21')
 
     def test_arm64be(self):
         self.set_machine('virt')
-- 
2.39.5
