Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c818362sm733011766b.34.2024.05.29.09.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 09:09:35 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 068515F760;
	Wed, 29 May 2024 17:09:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	John Snow <jsnow@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 00/10] testing/next: purging centos and more lcitool
Date: Wed, 29 May 2024 17:09:24 +0100
Message-Id: <20240529160934.982373-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: d1UVedcENqRM

There are a few more bits referencing centos8 in the tree which needed
cleaning up. After this we can remove the dedicated runner from the
gitlab registration. If we want to keep a dedicated Centos runner then
we can add back the bits needed to set it up.

I plan to generate the PR on Friday.

Changes for v2:

  - I've completed the migration to drive the ansible pacakge lists from lcitool.
  - sbsa-ref test update from Marcin

The following patches need review:

  scripts/ci: drive ubuntu/build-environment.yml from lcitool
  tests/lcitool: generate package lists for ansible
  tests/lci-tool: bump to latest version
  docs/ci: clean-up references for consistency
  scripts/ci: remove CentOS bits from common build-environment

Alex Bennée (9):
  ci: remove centos-steam-8 customer runner
  docs/devel: update references to centos to non-versioned container
  tests/vm: update centos.aarch64 image to 9
  tests/vm: remove plain centos image
  scripts/ci: remove CentOS bits from common build-environment
  docs/ci: clean-up references for consistency
  tests/lcitool: bump to latest version
  tests/lcitool: generate package lists for ansible
  scripts/ci: drive ubuntu/build-environment.yml from lcitool

Marcin Juszkiewicz (1):
  tests/avocado: update sbsa-ref firmware

 docs/devel/ci-jobs.rst.inc                    |   7 -
 docs/devel/ci-runners.rst.inc                 |  13 +-
 docs/devel/testing.rst                        |   8 +-
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
 .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    | 125 ++++++++
 tests/avocado/machine_aarch64_sbsaref.py      |  20 +-
 tests/docker/dockerfiles/alpine.docker        |   4 +-
 .../dockerfiles/fedora-win64-cross.docker     |   4 +-
 tests/docker/dockerfiles/fedora.docker        |   4 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  22 +-
 tests/lcitool/targets/centos-stream-8.yml     |   3 -
 tests/vm/Makefile.include                     |   1 -
 tests/vm/centos                               |  51 ----
 tests/vm/centos.aarch64                       |  10 +-
 26 files changed, 374 insertions(+), 773 deletions(-)
 delete mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
 delete mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
 delete mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
 delete mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
 delete mode 100644 scripts/ci/org.centos/stream/README
 delete mode 100644 scripts/ci/setup/build-environment.yml
 create mode 100644 scripts/ci/setup/ubuntu/build-environment.yml
 create mode 100644 scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml
 create mode 100644 scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml
 delete mode 100644 tests/lcitool/targets/centos-stream-8.yml
 delete mode 100755 tests/vm/centos

-- 
2.39.2
