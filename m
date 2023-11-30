Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm2331660wmo.44.2023.11.30.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:33:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 718D55F794;
	Thu, 30 Nov 2023 15:33:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/3] final fixes for 8.2
Date: Thu, 30 Nov 2023 15:33:30 +0000
Message-Id: <20231130153333.2424775-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 0hkzqxdDltmK

8.2 is looking fairly stable but I do have one bug fix for gdbstub
which I came across while debugging something else. The changes for
avocado rationalise all flaky tests under the QEMU_TEST_FLAKY_TESTS
environment variable. The final patch re-adds the flaky tests to the
CI as a manually run allow_fail job so we can still attempt to debug
their failure in the place they tend to fall over.

Alex.

Alex Bennée (3):
  gdbstub: use a better signal when we halt for IO reasons
  docs/devel: rationalise unstable gitlab tests under FLAKY_TESTS
  gitlab: add optional job to run flaky avocado tests

 docs/devel/testing.rst                   | 32 ++++++++++++++++--------
 gdbstub/internals.h                      |  1 +
 gdbstub/system.c                         |  2 +-
 .gitlab-ci.d/buildtest.yml               | 30 ++++++++++++++++++++++
 tests/avocado/boot_linux.py              | 10 +++++---
 tests/avocado/boot_linux_console.py      |  6 +++--
 tests/avocado/intel_iommu.py             |  6 +++--
 tests/avocado/linux_initrd.py            |  7 ++++--
 tests/avocado/machine_aspeed.py          | 10 +++++---
 tests/avocado/machine_mips_malta.py      | 10 +++++---
 tests/avocado/machine_rx_gdbsim.py       | 10 +++++---
 tests/avocado/machine_s390_ccw_virtio.py |  3 ++-
 tests/avocado/replay_kernel.py           |  7 ++++--
 tests/avocado/reverse_debugging.py       | 16 ++++++++----
 tests/avocado/smmu.py                    |  6 +++--
 tests/avocado/tuxrun_baselines.py        |  5 ++--
 16 files changed, 119 insertions(+), 42 deletions(-)

-- 
2.39.2
