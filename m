Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43366cbcdd8sm183016145e9.1.2024.11.25.07.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 07:26:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9AED35F869;
	Mon, 25 Nov 2024 15:21:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 20/28] tests/functional: update the aarch64 tuxrun tests
Date: Mon, 25 Nov 2024 15:20:57 +0000
Message-Id: <20241125152105.2100395-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125152105.2100395-1-alex.bennee@linaro.org>
References: <20241125152105.2100395-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yWmRNnBsQRpI

Now there are new up to date images available we should update to them.
With the new rootfs the blk I/O errors also go away on arm64be.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-22-alex.bennee@linaro.org>

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
