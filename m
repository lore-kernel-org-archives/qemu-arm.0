Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id i4-20020a5d55c4000000b002f74578f494sm8171246wrw.41.2023.04.17.06.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 06:43:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CDDB81FFB7;
	Mon, 17 Apr 2023 14:43:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Markus Armbruster <armbru@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v4 0/6] testing/next: avocado, docs, gitlab
Date: Mon, 17 Apr 2023 14:43:15 +0100
Message-Id: <20230417134321.3627231-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: RThpk09b90C+

This is the current state of my testing tree. It contains a few
patches that didn't make it into 8.0 and more testing fixes including
a bump to the avocado release including Thomas' --max-parallel-tasks
hack to avoid running the tests in parallel. So far it doesn't look
like its causing any problems although I am seeing some timeouts on
the BSDs.

The following patches need review:

tests/avocado: use the new snapshots for testing
tests/requirements.txt: bump up avocado-framework version to 101.0 (0 acks, 1 sobs, 1 tbs)

Alex Bennée (2):
  tests/avocado: use the new snapshots for testing
  qemu-options: finesse the recommendations around -blockdev

Kautuk Consul (1):
  tests/requirements.txt: bump up avocado-framework version to 101.0

Philippe Mathieu-Daudé (1):
  tests/avocado: Add set of boot tests on SBSA-ref

Thomas Huth (2):
  gitlab-ci: Avoid to re-run "configure" in the device-crash-test jobs
  scripts/device-crash-test: Add a parameter to run with TCG only

 MAINTAINERS                              |   1 +
 .gitlab-ci.d/buildtest.yml               |   6 +-
 qemu-options.hx                          |  24 +++-
 scripts/device-crash-test                |   4 +-
 tests/Makefile.include                   |  18 ++-
 tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++
 tests/avocado/tuxrun_baselines.py        | 170 +++++++++++++++++++----
 tests/requirements.txt                   |   2 +-
 8 files changed, 343 insertions(+), 40 deletions(-)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

-- 
2.39.2
