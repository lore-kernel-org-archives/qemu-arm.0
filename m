Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c378600b003e6dcd562a6sm1645702wmr.28.2023.03.10.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:31:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 85FC21FFB7;
	Fri, 10 Mar 2023 10:31:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 00/11] tweaks and fixes for 8.0-rc1 (tests, plugins, docs)
Date: Fri, 10 Mar 2023 10:31:12 +0000
Message-Id: <20230310103123.2118519-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 2WWOadNzCt2V

As usual for softfreeze I switch from my usual maintainer trees to
collecting up miscellaneous fixes and tweaks as we stabilise the
build. Currently these are still mostly testing focused although there
is a plugins fix I forgot to send a PR for earlier.

The following need review:

 - tests/avocado: don't use tags to define drive
 - include/exec: fix kerneldoc definition
 - tests/tcg: disable pauth for aarch64 gdb tests
 - tests/tcg: add some help output for running individual tests
 - include/qemu: add documentation for memory callbacks
 - gitlab: update centos-8-stream job
 - scripts/ci: update gitlab-runner playbook to handle CentOS
 - tests/docker: all add DOCKER_BUILDKIT to RUNC environment

Alex Bennée (9):
  tests/docker: all add DOCKER_BUILDKIT to RUNC environment
  scripts/ci: add libslirp-devel to build-environment
  scripts/ci: update gitlab-runner playbook to handle CentOS
  gitlab: update centos-8-stream job
  include/qemu: add documentation for memory callbacks
  tests/tcg: add some help output for running individual tests
  tests/tcg: disable pauth for aarch64 gdb tests
  include/exec: fix kerneldoc definition
  tests/avocado: don't use tags to define drive

Marcin Juszkiewicz (1):
  tests/avocado: update AArch64 tests to Alpine 3.17.2

Richard Henderson (1):
  tcg: Clear plugin_mem_cbs on TB exit

 include/exec/memory.h                         |  2 +-
 include/qemu/qemu-plugin.h                    | 47 +++++++++++++--
 accel/tcg/cpu-exec-common.c                   |  3 +
 accel/tcg/cpu-exec.c                          |  4 +-
 .../custom-runners/centos-stream-8-x86_64.yml | 18 ++----
 .../org.centos/stream/8/build-environment.yml |  1 +
 scripts/ci/setup/gitlab-runner.yml            | 20 ++++++-
 tests/avocado/machine_aarch64_virt.py         |  8 +--
 tests/avocado/tuxrun_baselines.py             | 60 ++++++++-----------
 tests/docker/Makefile.include                 |  2 +-
 tests/tcg/Makefile.target                     |  7 +++
 tests/tcg/aarch64/Makefile.target             |  2 +
 12 files changed, 112 insertions(+), 62 deletions(-)

-- 
2.39.2
