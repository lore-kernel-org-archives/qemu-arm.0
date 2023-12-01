Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b0040839fcb217sm4911959wmp.8.2023.12.01.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:36:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DEB025FB5F;
	Fri,  1 Dec 2023 09:36:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Auger <eric.auger@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Cleber Rosa <crosa@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] final fixes for 8.2
Date: Fri,  1 Dec 2023 09:36:26 +0000
Message-Id: <20231201093633.2551497-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Z+On8TPFMFtp

8.2 is looking fairly stable but I do have one bug fix for gdbstub
which I came across while debugging something else. The changes for
avocado rationalise all flaky tests under the QEMU_TEST_FLAKY_TESTS
environment variable. The final patch re-adds the flaky tests to the
CI as a manually run allow_fail job so we can still attempt to debug
their failure in the place they tend to fall over.

v2
--

  - addressed some review comments
  - emphasised raising a bug for failing tests
  - drop some tests now missing assets online
  - fix wrong microblaze target for tests

The following still need review:

  gitlab: build the correct microblaze target
  tests/avocado: tag sbsa tests as tcg only
  tests/avocado: drop malta yamon tests
  tests/avocado: drop BootLinuxConsole.test_mips_malta_cpio test

Alex.

Alex Bennée (7):
  gdbstub: use a better signal when we halt for IO reasons
  docs/devel: rationalise unstable gitlab tests under FLAKY_TESTS
  tests/avocado: drop BootLinuxConsole.test_mips_malta_cpio test
  tests/avocado: drop malta yamon tests
  tests/avocado: tag sbsa tests as tcg only
  gitlab: build the correct microblaze target
  gitlab: add optional job to run flaky avocado tests

 docs/devel/testing.rst                   | 32 ++++++++++------
 gdbstub/internals.h                      |  1 +
 gdbstub/system.c                         |  2 +-
 .gitlab-ci.d/buildtest.yml               | 32 +++++++++++++++-
 tests/avocado/boot_linux.py              | 10 +++--
 tests/avocado/boot_linux_console.py      | 28 ++------------
 tests/avocado/intel_iommu.py             |  6 ++-
 tests/avocado/linux_initrd.py            |  7 +++-
 tests/avocado/machine_aarch64_sbsaref.py |  1 +
 tests/avocado/machine_aspeed.py          | 10 +++--
 tests/avocado/machine_mips_malta.py      | 47 ++++--------------------
 tests/avocado/machine_rx_gdbsim.py       | 10 +++--
 tests/avocado/machine_s390_ccw_virtio.py |  3 +-
 tests/avocado/replay_kernel.py           |  8 +++-
 tests/avocado/reverse_debugging.py       | 16 +++++---
 tests/avocado/smmu.py                    |  6 ++-
 tests/avocado/tuxrun_baselines.py        |  5 ++-
 17 files changed, 122 insertions(+), 102 deletions(-)

-- 
2.39.2
