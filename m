Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e21e1esm19018945e9.38.2025.01.08.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:18:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 878CA5FBC2;
	Wed,  8 Jan 2025 12:10:56 +0000 (GMT)
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
	Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 20/32] tests/functional: update tuxruntest to use uncompress utility
Date: Wed,  8 Jan 2025 12:10:42 +0000
Message-Id: <20250108121054.1126164-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: reZPsmplocLy

Use the utility functions to reduce code duplication.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/tuxruntest.py | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/tests/functional/qemu_test/tuxruntest.py b/tests/functional/qemu_test/tuxruntest.py
index 7227a83757..41a4945a14 100644
--- a/tests/functional/qemu_test/tuxruntest.py
+++ b/tests/functional/qemu_test/tuxruntest.py
@@ -73,17 +73,7 @@ def fetch_tuxrun_assets(self, kernel_asset, rootfs_asset, dtb_asset=None):
         Fetch the TuxBoot assets.
         """
         kernel_image =  kernel_asset.fetch()
-        disk_image_zst = rootfs_asset.fetch()
-
-        disk_image = self.scratch_file("rootfs.ext4")
-
-        check_call(['zstd', "-f", "-d", disk_image_zst,
-                    "-o", disk_image],
-                   stdout=DEVNULL, stderr=DEVNULL)
-        # zstd copies source archive permissions for the output
-        # file, so must make this writable for QEMU
-        os.chmod(disk_image, stat.S_IRUSR | stat.S_IWUSR)
-
+        disk_image = self.uncompress(rootfs_asset)
         dtb = dtb_asset.fetch() if dtb_asset is not None else None
 
         return (kernel_image, disk_image, dtb)
-- 
2.39.5
