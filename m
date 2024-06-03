Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213e75eef3sm34987555e9.6.2024.06.03.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:53:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 78DBA5F860;
	Mon,  3 Jun 2024 18:53:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH v3 00/12] testing/next: purging centos and more lcitool (pre-PR)
Date: Mon,  3 Jun 2024 18:53:16 +0100
Message-Id: <20240603175328.3823123-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: ZjzcEIzhLDSG

There are a few more bits referencing centos8 in the tree which needed
cleaning up. After this we can remove the dedicated runner from the
gitlab registration. If we want to keep a dedicated Centos runner then
we can add back the bits needed to set it up.

Due to some failures with the santizers on the latest Fedora I've
merged a few of Thomas's fixes and updates.

I plan to generate the PR on Wednesday.

Changes for v3:
  - added Thomas' clean-ups and disable function ptr sanitizer check
  - all lcitool bits merged in upstream now

Changes for v2:

  - I've completed the migration to drive the ansible pacakge lists from lcitool.
  - sbsa-ref test update from Marcin

The following patches need review:

  scripts/ci: drive ubuntu/build-environment.yml from lcitool
  tests/lcitool: generate package lists for ansible
  docs/ci: clean-up references for consistency
  scripts/ci: remove CentOS bits from common build-environment

Alex Bennée (8):
  ci: remove centos-steam-8 customer runner
  docs/devel: update references to centos to non-versioned container
  tests/vm: update centos.aarch64 image to 9
  tests/vm: remove plain centos image
  scripts/ci: remove CentOS bits from common build-environment
  docs/ci: clean-up references for consistency
  tests/lcitool: generate package lists for ansible
  scripts/ci: drive ubuntu/build-environment.yml from lcitool

Thomas Huth (4):
  tests/lcitool: Delete obsolete centos-stream-8.yml file
  .gitlab-ci.d/buildtest.yml: Use -fno-sanitize=function in the
    clang-system job
  tests/lcitool: Bump to latest libvirt-ci and update Fedora and Alpine
    version
  tests/lcitool: Install mingw-w64-tools for the Windows cross-builds

 docs/devel/ci-jobs.rst.inc                    |   7 -
 docs/devel/ci-runners.rst.inc                 |  13 +-
 docs/devel/testing.rst                        |   8 +-
 .gitlab-ci.d/buildtest.yml                    |   1 +
 .gitlab-ci.d/custom-runners.yml               |   1 -
 .../custom-runners/centos-stream-8-x86_64.yml |  24 --
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-s390x.yml     |   2 +-
 .../org.centos/stream/8/build-environment.yml |  82 -----
 .../ci/org.centos/stream/8/x86_64/configure   | 198 ------------
 .../org.centos/stream/8/x86_64/test-avocado   |  65 ----
 scripts/ci/org.centos/stream/README           |  17 --
 scripts/ci/setup/build-environment.yml        | 284 ------------------
 scripts/ci/setup/ubuntu/build-environment.yml |  69 +++++
 .../ci/setup/ubuntu/ubuntu-2204-aarch64.yaml  | 127 ++++++++
 .../setup/ubuntu/ubuntu-2204-armhf-cross.yml  | 127 ++++++++
 .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    | 125 ++++++++
 tests/docker/dockerfiles/alpine.docker        |   4 +-
 .../dockerfiles/fedora-win64-cross.docker     |   6 +-
 tests/docker/dockerfiles/fedora.docker        |   5 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu-win-installer.yml |   1 +
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |  22 +-
 tests/lcitool/targets/centos-stream-8.yml     |   3 -
 tests/vm/Makefile.include                     |   1 -
 tests/vm/centos                               |  51 ----
 tests/vm/centos.aarch64                       |  10 +-
 29 files changed, 497 insertions(+), 763 deletions(-)
 delete mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
 delete mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
 delete mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
 delete mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
 delete mode 100644 scripts/ci/org.centos/stream/README
 delete mode 100644 scripts/ci/setup/build-environment.yml
 create mode 100644 scripts/ci/setup/ubuntu/build-environment.yml
 create mode 100644 scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml
 create mode 100644 scripts/ci/setup/ubuntu/ubuntu-2204-armhf-cross.yml
 create mode 100644 scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml
 delete mode 100644 tests/lcitool/targets/centos-stream-8.yml
 delete mode 100755 tests/vm/centos

-- 
2.39.2
