Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id c20-20020a7bc854000000b003b476cabf1csm4212138wml.26.2022.11.18.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:33:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AA10A1FFB7;
	Fri, 18 Nov 2022 11:33:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	philmd@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Date: Fri, 18 Nov 2022 11:33:09 +0000
Message-Id: <20221118113309.1057790-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gn75LUjtnHDo

The old URL wasn't stable. I suspect the current URL will only be
stable for a few months so maybe we need another strategy for hosting
rootfs snapshots?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux_console.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 4c9d551f47..5a2923c423 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
-                      'kci-2019.02/armel/base/rootfs.ext2.xz')
-        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
+                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
+        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
         rootfs_path_xz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
         rootfs_path = os.path.join(self.workdir, 'rootfs.cpio')
         archive.lzma_uncompress(rootfs_path_xz, rootfs_path)
-- 
2.34.1
