Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n12-20020a1c720c000000b003f90b58df65sm2177937wmc.29.2023.06.23.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:21:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 841341FFBB;
	Fri, 23 Jun 2023 13:21:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Riku Voipio <riku.voipio@iki.fi>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leonardo Bras <leobras@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 00/26] maintainer omnibus: testing, fuzz, plugins, documentation
Date: Fri, 23 Jun 2023 13:20:34 +0100
Message-Id: <20230623122100.1640995-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: eFEqDhBdZiH6

As softfreeze is fast approaching I thought it would be work combining
my various trees into an omnibus series to ease the review and
merging.

The testing updates exposed a number of latent leaks that confused the
oss-fuzz jobs (hence the test-fuzz addition to help debug that). This
also includes some minor plugin updates and finally some documentation
updates that clean-up and expose the QOM and QDEV APIs which are so
core to emulating anything in QEMU.

Please review.

Alex Bennée (20):
  gitlab: reduce testing scope of check-gcov
  tests/tcg: add mechanism to handle plugin arguments
  qemu-keymap: use modern name for Arabic keymap
  qemu-keymap: properly check return from xkb_keymap_mod_get_index
  scripts/oss-fuzz: add a suppression for keymap
  tests/qtests: clean-up and fix leak in generic_fuzz
  tests/docker: add test-fuzz
  Makefile: add lcitool-refresh to UNCHECKED_GOALS
  tests/lcitool: update to latest version
  tests/lcitool: add an explicit gcc-native package
  tests/lcitool: introduce qemu-minimal
  tests/docker: convert riscv64-cross to lcitool
  plugins: force slow path when plugins instrument memory ops
  plugins: fix memory leak while parsing options
  plugins: update lockstep to use g_memdup2
  docs/devel: add some front matter to the devel index
  include/migration: mark vmstate_register() as a legacy function
  include/hw/qdev-core: fixup kerneldoc annotations
  docs/devel: split qom-api reference into new file
  docs/devel: introduce some key concepts for QOM development

Ani Sinha (1):
  docs/devel: remind developers to run CI container pipeline when
    updating images

Daniel P. Berrangé (2):
  gitlab: explicit set artifacts publishing criteria
  gitlab: ensure coverage job also publishes meson log

Erik Skultety (1):
  tests/lcitool: Bump fedora container versions

Marcin Juszkiewicz (1):
  tests/avocado: update firmware to enable sbsa-ref/max

Philippe Mathieu-Daudé (1):
  docs/devel/qom.rst: Correct code style

 docs/devel/index-api.rst                      |   2 +
 docs/devel/index-process.rst                  |   2 +
 docs/devel/index-tcg.rst                      |   2 +
 docs/devel/index.rst                          |  24 +-
 docs/devel/qdev-api.rst                       |   7 +
 docs/devel/qom-api.rst                        |   9 +
 docs/devel/qom.rst                            |  54 ++-
 docs/devel/tcg.rst                            |   2 +
 docs/devel/testing.rst                        |   6 +
 Makefile                                      |   2 +-
 include/exec/cpu-all.h                        |   2 +-
 include/hw/core/cpu.h                         |  17 +
 include/hw/qdev-core.h                        | 365 ++++++++++++------
 include/migration/vmstate.h                   |   9 +-
 accel/tcg/cputlb.c                            |   4 +-
 accel/tcg/user-exec.c                         |   6 +-
 contrib/plugins/cache.c                       |   2 +-
 contrib/plugins/drcov.c                       |   2 +-
 contrib/plugins/execlog.c                     |   2 +-
 contrib/plugins/hotblocks.c                   |   2 +-
 contrib/plugins/hotpages.c                    |   2 +-
 contrib/plugins/howvec.c                      |   2 +-
 contrib/plugins/hwprofile.c                   |   2 +-
 contrib/plugins/lockstep.c                    |   4 +-
 qemu-keymap.c                                 |  24 +-
 target/arm/tcg/sve_helper.c                   |   4 -
 tests/plugin/bb.c                             |   2 +-
 tests/plugin/insn.c                           |   2 +-
 tests/plugin/mem.c                            |   2 +-
 tests/plugin/syscall.c                        |   2 +-
 tests/qtest/fuzz/generic_fuzz.c               |  11 +-
 .gitlab-ci.d/buildtest-template.yml           |   4 +-
 .gitlab-ci.d/buildtest.yml                    |   7 +-
 .gitlab-ci.d/crossbuild-template.yml          |   1 +
 .gitlab-ci.d/crossbuilds.yml                  |   2 +
 .gitlab-ci.d/opensbi.yml                      |   1 +
 pc-bios/keymaps/meson.build                   |   2 +-
 scripts/oss-fuzz/lsan_suppressions.txt        |   3 +
 tests/avocado/machine_aarch64_sbsaref.py      |  22 +-
 tests/docker/dockerfiles/alpine.docker        |   4 +-
 .../dockerfiles/debian-amd64-cross.docker     |   1 +
 .../dockerfiles/debian-arm64-cross.docker     |   1 +
 .../dockerfiles/debian-armel-cross.docker     |   1 +
 .../dockerfiles/debian-armhf-cross.docker     |   1 +
 .../dockerfiles/debian-mips64el-cross.docker  |   1 +
 .../dockerfiles/debian-mipsel-cross.docker    |   1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |   1 +
 .../dockerfiles/debian-riscv64-cross.docker   | 119 +++---
 .../dockerfiles/debian-s390x-cross.docker     |   1 +
 .../dockerfiles/fedora-win32-cross.docker     |   5 +-
 .../dockerfiles/fedora-win64-cross.docker     |   5 +-
 tests/docker/dockerfiles/fedora.docker        |   4 +-
 tests/docker/test-fuzz                        |  28 ++
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu-minimal.yml       |  27 ++
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |  18 +-
 tests/tcg/Makefile.target                     |   8 +-
 tests/tcg/aarch64/Makefile.target             |   8 +
 59 files changed, 627 insertions(+), 230 deletions(-)
 create mode 100644 docs/devel/qdev-api.rst
 create mode 100644 docs/devel/qom-api.rst
 create mode 100755 tests/docker/test-fuzz
 create mode 100644 tests/lcitool/projects/qemu-minimal.yml

-- 
2.39.2
