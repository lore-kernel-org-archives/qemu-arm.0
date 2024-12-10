Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4350159f6a4sm44457575e9.21.2024.12.10.12.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:43:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BF2E45FABD;
	Tue, 10 Dec 2024 20:43:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Eric Farman <farman@linux.ibm.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Bernhard Beschow <shentey@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Markus Armbruster <armbru@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 04/20] tests/functional: update the mips32 tuxrun tests
Date: Tue, 10 Dec 2024 20:43:33 +0000
Message-Id: <20241210204349.723590-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210204349.723590-1-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MOr4qe4cpxy5

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-25-alex.bennee@linaro.org>
---
 tests/functional/test_mips_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mips_tuxrun.py b/tests/functional/test_mips_tuxrun.py
index 6fec44c2bf..6771dbd57e 100755
--- a/tests/functional/test_mips_tuxrun.py
+++ b/tests/functional/test_mips_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMipsTest(TuxRunBaselineTest):
 
     ASSET_MIPS_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips32/vmlinux',
-        'bfd2172f8b17fb32970ca0c8c58f59c5a4ca38aa5855d920be3a69b5d16e52f0')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32/vmlinux',
+        'b6f97fc698ae8c96456ad8c996c7454228074df0d7520dedd0a15e2913700a19')
     ASSET_MIPS_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips32/rootfs.ext4.zst',
-        'fc3da0b4c2f38d74c6d705123bb0f633c76ed953128f9d0859378c328a6d11a0')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32/rootfs.ext4.zst',
+        '87055cf3cbde3fd134e5039e7b87feb03231d8c4b21ee712b8ba3308dfa72f50')
 
     def test_mips32(self):
         self.set_machine('malta')
-- 
2.39.5
