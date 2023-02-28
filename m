Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d51c5000000b002c70d97af78sm10764063wrv.85.2023.02.28.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8BCB51FFCB;
	Tue, 28 Feb 2023 19:06:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Date: Tue, 28 Feb 2023 19:06:53 +0000
Message-Id: <20230228190653.1602033-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /FEjcz+7WH8Q

This test is exceptionally heavyweight (nearly 330s) compared to the
two (both endians) TuxRun baseline tests which complete in under 160s.
The coverage is slightly reduced but a more directed test could make
up the difference.

tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:

Overall coverage rate:
  lines......: 9.6% (44110 of 458817 lines)
  functions..: 16.5% (6767 of 41054 functions)
  branches...: 6.0% (13395 of 222634 branches)

tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:

Overall coverage rate:
  lines......: 11.6% (53408 of 458817 lines)
  functions..: 18.7% (7691 of 41054 functions)
  branches...: 7.9% (17692 of 224218 branches)

So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED is
specified by the user.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index fe0bb180d9..f09f7b1dbf 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -84,6 +84,8 @@ def test_virt_kvm(self):
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
+# See the tux_baseline.py tests for almost the same coverage in a lot
+# less time.
 class BootLinuxPPC64(LinuxTest):
     """
     :avocado: tags=arch:ppc64
@@ -91,6 +93,8 @@ class BootLinuxPPC64(LinuxTest):
 
     timeout = 360
 
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_pseries_tcg(self):
         """
         :avocado: tags=machine:pseries
-- 
2.39.2
