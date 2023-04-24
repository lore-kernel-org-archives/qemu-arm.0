Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l2-20020a1c7902000000b003f193d7c6b7sm8205254wme.41.2023.04.24.02.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:22:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7A0FF1FFB7;
	Mon, 24 Apr 2023 10:22:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Markus Armbruster <armbru@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	David Hildenbrand <david@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 00/18] testing/next: avocado, docs (pre-PR)
Date: Mon, 24 Apr 2023 10:22:31 +0100
Message-Id: <20230424092249.58552-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: wkjVPmUcVEoE

This is my pre-PR tree for the current state of testing/next and the
various documentation patches that haven't been picked up by others.
I'll look to send the PR later in the week.

The following patches still need review:

  tests/tcg: limit the scope of the plugin tests (1 acks, 1 sobs, 0 tbs)
  tests/avocado: use the new snapshots for testing

Alex Bennée (7):
  tests/avocado: use the new snapshots for testing
  qemu-options: finesse the recommendations around -blockdev
  tests/tcg: limit the scope of the plugin tests
  docs/system: remove excessive punctuation from guest-loader docs
  docs/devel: make a statement about includes
  docs/devel: mention the spacing requirement for QOM
  docs/style: call out the use of GUARD macros

Kautuk Consul (3):
  tests/requirements.txt: bump up avocado-framework version to 101.0
  avocado_qemu/__init__.py: factor out the qemu-img finding
  tests/avocado/tuxrun_baselines.py: improve code coverage for ppc64

Philippe Mathieu-Daudé (1):
  tests/avocado: Add set of boot tests on SBSA-ref

Thomas Huth (6):
  gitlab-ci: Avoid to re-run "configure" in the device-crash-test jobs
  scripts/device-crash-test: Add a parameter to run with TCG only
  .gitlab-ci.d/cirrus: Drop the CI job for compiling with FreeBSD 12
  tests/avocado: Make ssh_command_output_contains() globally available
  tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
  MAINTAINERS: Cover tests/avocado/machine_aspeed.py

Yohei Kojima (1):
  qemu-options.hx: Update descriptions of memory options for NUMA node

 MAINTAINERS                               |   3 +-
 docs/devel/qom.rst                        |   2 +
 docs/devel/style.rst                      | 108 ++++++++++
 docs/system/guest-loader.rst              |   6 +-
 .gitlab-ci.d/buildtest.yml                |   6 +-
 .gitlab-ci.d/cirrus.yml                   |  13 --
 .gitlab-ci.d/cirrus/freebsd-12.vars       |  16 --
 qemu-options.hx                           |  49 ++++-
 scripts/device-crash-test                 |   4 +-
 tests/Makefile.include                    |  18 +-
 tests/avocado/avocado_qemu/__init__.py    |  35 +++-
 tests/avocado/linux_ssh_mips_malta.py     |   8 -
 tests/avocado/machine_aarch64_sbsaref.py  | 158 +++++++++++++++
 tests/avocado/machine_aspeed.py           |  30 +--
 tests/avocado/tuxrun_baselines.py         | 232 +++++++++++++++++++---
 tests/lcitool/refresh                     |   1 -
 tests/requirements.txt                    |   2 +-
 tests/tcg/Makefile.target                 |  10 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   2 -
 tests/tcg/aarch64/Makefile.target         |   1 -
 tests/tcg/arm/Makefile.softmmu-target     |   4 +-
 tests/tcg/arm/Makefile.target             |   8 -
 tests/tcg/cris/Makefile.target            |   3 +
 tests/tcg/hppa/Makefile.target            |   2 -
 tests/tcg/i386/Makefile.target            |  10 -
 tests/tcg/ppc64/Makefile.target           |   2 -
 tests/tcg/riscv64/Makefile.softmmu-target |   3 +
 tests/tcg/riscv64/Makefile.target         |   1 -
 tests/tcg/s390x/Makefile.softmmu-target   |   3 +
 tests/tcg/tricore/Makefile.softmmu-target |   3 +
 tests/tcg/xtensa/Makefile.softmmu-target  |   3 +
 31 files changed, 599 insertions(+), 147 deletions(-)
 delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

-- 
2.39.2
