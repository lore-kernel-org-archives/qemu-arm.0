Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ad15bfsm5627948a12.19.2024.12.18.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:21:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2C61D5FD7E;
	Wed, 18 Dec 2024 16:21:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Beraldo Leal <bleal@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2 11/27] tests/functional: update the riscv64 tuxrun tests
Date: Wed, 18 Dec 2024 16:20:47 +0000
Message-Id: <20241218162104.3493551-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1b+kgArfpDIW

Now there are new up to date images available we should update to them.
Note we re-use the riscv32 kernel and rootfs for test_riscv64_rv32.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-32-alex.bennee@linaro.org>
---
 tests/functional/test_riscv64_tuxrun.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/functional/test_riscv64_tuxrun.py b/tests/functional/test_riscv64_tuxrun.py
index 4e2449539c..0d8de36204 100755
--- a/tests/functional/test_riscv64_tuxrun.py
+++ b/tests/functional/test_riscv64_tuxrun.py
@@ -17,18 +17,18 @@
 class TuxRunRiscV64Test(TuxRunBaselineTest):
 
     ASSET_RISCV64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/riscv64/Image',
-        'cd634badc65e52fb63465ec99e309c0de0369f0841b7d9486f9729e119bac25e')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv64/Image',
+        '2bd8132a3bf21570290042324fff48c987f42f2a00c08de979f43f0662ebadba')
     ASSET_RISCV64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/riscv64/rootfs.ext4.zst',
-        'b18e3a3bdf27be03da0b285e84cb71bf09eca071c3a087b42884b6982ed679eb')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv64/rootfs.ext4.zst',
+        'aa4736a9872651dfc0d95e709465eedf1134fd19d42b8cb305bfd776f9801004')
 
     ASSET_RISCV32_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/riscv32/Image',
-        '89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv32/Image',
+        '872bc8f8e0d4661825d5f47f7bec64988e9d0a8bd5db8917d57e16f66d83b329')
     ASSET_RISCV32_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/riscv32/rootfs.ext4.zst',
-        '7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv32/rootfs.ext4.zst',
+        '511ad34e63222db08d6c1da16fad224970de36517a784110956ba6a24a0ee5f6')
 
     def test_riscv64(self):
         self.set_machine('virt')
-- 
2.39.5
