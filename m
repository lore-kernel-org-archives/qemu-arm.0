Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f5ffsm2468928066b.12.2025.01.08.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:10:58 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 708665F94C;
	Wed,  8 Jan 2025 12:10:55 +0000 (GMT)
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
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v4 09/32] tests/functional: update the ppc64 tuxrun tests
Date: Wed,  8 Jan 2025 12:10:31 +0000
Message-Id: <20250108121054.1126164-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Yhmmy2QU+4S9

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-30-alex.bennee@linaro.org>
---
 tests/functional/test_ppc64_tuxrun.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/functional/test_ppc64_tuxrun.py b/tests/functional/test_ppc64_tuxrun.py
index 8a98d18ab3..05c6162b5e 100755
--- a/tests/functional/test_ppc64_tuxrun.py
+++ b/tests/functional/test_ppc64_tuxrun.py
@@ -85,11 +85,11 @@ def ppc64_common_tuxrun(self, kernel_asset, rootfs_asset, prefix):
                                drive="scsi-hd")
 
     ASSET_PPC64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/ppc64/vmlinux',
-        'f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3e09b64ab728')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc64/vmlinux',
+        '8219d5cb26e7654ad7826fe8aee6290f7c01eef44f2cd6d26c15fe8f99e1c17c')
     ASSET_PPC64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/ppc64/rootfs.ext4.zst',
-        '1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c6c45b00bdff')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc64/rootfs.ext4.zst',
+        'b68e12314303c5dd0fef37ae98021299a206085ae591893e73557af99a02d373')
 
     def test_ppc64(self):
         self.ppc64_common_tuxrun(kernel_asset=self.ASSET_PPC64_KERNEL,
@@ -97,11 +97,11 @@ def test_ppc64(self):
                                  prefix='tuxrun_ppc64_')
 
     ASSET_PPC64LE_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/ppc64le/vmlinux',
-        '979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c00e293e80cf2')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc64le/vmlinux',
+        '21aea1fbc18bf6fa7d8ca4ea48d4940b2c8363c077acd564eb47d769b7495279')
     ASSET_PPC64LE_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/ppc64le/rootfs.ext4.zst',
-        'b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42cf81a0a3906')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc64le/rootfs.ext4.zst',
+        '67d36a3f9597b738e8b7359bdf04500f4d9bb82fc35eaa65aa439d888b2392f4')
 
     def test_ppc64le(self):
         self.ppc64_common_tuxrun(kernel_asset=self.ASSET_PPC64LE_KERNEL,
-- 
2.39.5
