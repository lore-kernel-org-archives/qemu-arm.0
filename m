Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad911a0sm510956266b.155.2024.07.29.07.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:44:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F29175F844;
	Mon, 29 Jul 2024 15:44:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Song Gao <gaosong@loongson.cn>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 00/14] Various fixes and tweaks for 9.1-rc0/1
Date: Mon, 29 Jul 2024 15:44:00 +0100
Message-Id: <20240729144414.830369-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: jywJ2xJ2eVvo

As usual during soft freeze I switch to cleaning up the various
niggles and bugs which have accumulated over the years.

Aside from some test build tweaks and some useful tools for debugging
CI failures I've also moved tests/plugin to tests/tcg/plugins to
better align with contrib/plugins and clearly marking what is TCG
only. I took the opportunity to clean up some of the documentation
while I was at it.

Please review:

  plugin/loader: handle basic help query
  contrib/plugins: add compat for g_memdup2
  contrib/plugins: be more vocal building
  docs: split TCG plugin usage from devel section
  tests/tcg: move test plugins into tcg subdir
  tests/avocado: remove tcg_plugins virt_mem_icount test
  docs/devel: document how to run individual TCG tests
  docs/devel: update the testing introduction
  tests/tcg: update README

Alex Bennée (9):
  tests/tcg: update README
  docs/devel: update the testing introduction
  docs/devel: document how to run individual TCG tests
  tests/avocado: remove tcg_plugins virt_mem_icount test
  tests/tcg: move test plugins into tcg subdir
  docs: split TCG plugin usage from devel section
  contrib/plugins: be more vocal building
  contrib/plugins: add compat for g_memdup2
  plugin/loader: handle basic help query

Daniel P. Berrangé (2):
  gitlab: record installed packages in /packages.txt in containers
  gitlab: display /packages.txt in build jobs

Peter Maydell (1):
  contrib/plugins/cache.c: Remove redundant check of l2_access

Richard Henderson (2):
  tests/tcg: Use --noexecstack with assembler files
  tests/tcg/loongarch64: Use --no-warn-rwx-segments to link system tests

 MAINTAINERS                                   |   2 +-
 docs/about/emulation.rst                      | 567 +++++++++++++++++-
 docs/devel/tcg-plugins.rst                    | 505 ----------------
 docs/devel/testing.rst                        |  34 +-
 contrib/plugins/cache.c                       |   2 +-
 contrib/plugins/lockstep.c                    |  25 +
 plugins/loader.c                              |   8 +-
 tests/{plugin => tcg/plugins}/bb.c            |   0
 tests/{plugin => tcg/plugins}/empty.c         |   0
 tests/{plugin => tcg/plugins}/inline.c        |   0
 tests/{plugin => tcg/plugins}/insn.c          |   0
 tests/{plugin => tcg/plugins}/mem.c           |   0
 tests/{plugin => tcg/plugins}/syscall.c       |   0
 .gitlab-ci.d/buildtest-template.yml           |   1 +
 .gitlab-ci.d/crossbuild-template.yml          |   2 +
 contrib/plugins/Makefile                      |  25 +-
 tests/avocado/tcg_plugins.py                  |  37 +-
 .../dockerfiles/debian-all-test-cross.docker  |   3 +-
 .../dockerfiles/debian-hexagon-cross.docker   |   3 +-
 .../debian-legacy-test-cross.docker           |   3 +-
 .../dockerfiles/debian-loongarch-cross.docker |   3 +-
 .../dockerfiles/debian-tricore-cross.docker   |   3 +-
 .../dockerfiles/debian-xtensa-cross.docker    |   3 +-
 tests/meson.build                             |   2 +-
 tests/tcg/Makefile.target                     |   6 +-
 tests/tcg/README                              |  23 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   2 +-
 tests/tcg/alpha/Makefile.softmmu-target       |   2 +-
 tests/tcg/arm/Makefile.softmmu-target         |   2 +-
 tests/tcg/arm/Makefile.target                 |   2 +-
 tests/tcg/i386/Makefile.softmmu-target        |   2 +-
 tests/tcg/loongarch64/Makefile.softmmu-target |   4 +-
 tests/{plugin => tcg/plugins}/meson.build     |   6 +-
 tests/tcg/riscv64/Makefile.softmmu-target     |   2 +-
 tests/tcg/s390x/Makefile.softmmu-target       |   2 +-
 tests/tcg/x86_64/Makefile.softmmu-target      |   2 +-
 36 files changed, 697 insertions(+), 586 deletions(-)
 rename tests/{plugin => tcg/plugins}/bb.c (100%)
 rename tests/{plugin => tcg/plugins}/empty.c (100%)
 rename tests/{plugin => tcg/plugins}/inline.c (100%)
 rename tests/{plugin => tcg/plugins}/insn.c (100%)
 rename tests/{plugin => tcg/plugins}/mem.c (100%)
 rename tests/{plugin => tcg/plugins}/syscall.c (100%)
 rename tests/{plugin => tcg/plugins}/meson.build (70%)

-- 
2.39.2
