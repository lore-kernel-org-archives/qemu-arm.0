Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y8-20020a7bcd88000000b00406447b798bsm18773359wmj.37.2023.10.11.03.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 03:33:31 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4BB7D1FFBD;
	Wed, 11 Oct 2023 11:33:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org (open list:SBSA-REF)
Subject: [PULL 02/25] tests/avocado: remove flaky test marking for test_sbsaref_edk2_firmware
Date: Wed, 11 Oct 2023 11:33:06 +0100
Message-Id: <20231011103329.670525-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011103329.670525-1-alex.bennee@linaro.org>
References: <20231011103329.670525-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZPAyCZKzwaGa

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

Cc: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231009164104.369749-3-alex.bennee@linaro.org>

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
