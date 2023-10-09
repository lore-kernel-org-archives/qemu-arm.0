Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q14-20020adfcb8e000000b003296b488961sm9530042wrh.31.2023.10.09.09.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:41:06 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4707B1FFBD;
	Mon,  9 Oct 2023 17:41:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Brad Smith <brad@comstyle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	David Hildenbrand <david@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/25] tests/avocado: remove flaky test marking for test_sbsaref_edk2_firmware
Date: Mon,  9 Oct 2023 17:40:41 +0100
Message-Id: <20231009164104.369749-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hU+GlfhulB3s

After testing locally I decided to revert a5754847e0 (tests/avocado: Disable the
test_sbsaref_edk2_firmware by default) as the test seems pretty
stable:

   env QEMU_TEST_FLAKY_TESTS=1 retry.py -n 50 -c -- \
     ./tests/venv/bin/avocado run \
     ./tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_edk2_firmware

yields:

  Results summary:
  0: 50 times (100.00%), avg time 2.064 (0.04 varience/0.19 deviation)
  Ran command 50 times, 50 passes

Maybe f0ec14c78c (tests/avocado: Fix console data loss) has made it
more reliable?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/machine_aarch64_sbsaref.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index b272053eaf..bdd1efc768 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -75,7 +75,6 @@ def fetch_firmware(self):
             "sbsa-ref",
         )
 
-    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is not reliable')
     def test_sbsaref_edk2_firmware(self):
         """
         :avocado: tags=cpu:cortex-a57
-- 
2.39.2
