Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d170esm61614305e9.3.2024.11.21.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:06:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E350860481;
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
Subject: [PATCH 27/39] tests/functional: update the mips64el tuxrun tests
Date: Thu, 21 Nov 2024 16:57:54 +0000
Message-Id: <20241121165806.476008-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lSg4M2TCTWNp

Now there are new upto date images available we should update to them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/test_mips64el_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mips64el_tuxrun.py b/tests/functional/test_mips64el_tuxrun.py
index 819549a27b..0a24757c51 100755
--- a/tests/functional/test_mips64el_tuxrun.py
+++ b/tests/functional/test_mips64el_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMips64ELTest(TuxRunBaselineTest):
 
     ASSET_MIPS64EL_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips64el/vmlinux',
-        'd4e08965e2155c4cccce7c5f34d18fe34c636cda2f2c9844387d614950155266')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64el/vmlinux',
+        '0d2829a96f005229839c4cd586d4d8a136ea4b488d29821611c8e97f2266bfa9')
     ASSET_MIPS64EL_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips64el/rootfs.ext4.zst',
-        'fba585368f5915b1498ed081863474b2d7ec4e97cdd46d21bdcb2f9698f83de4')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64el/rootfs.ext4.zst',
+        '69c8b69a4f1582ce4c6f01a994968f5d73bffb2fc99cbeeeb26c8b5a28eaeb84')
 
     def test_mips64el(self):
         self.set_machine('malta')
-- 
2.39.5
