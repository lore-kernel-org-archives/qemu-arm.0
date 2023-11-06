Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e14-20020a5d530e000000b0032daf848f68sm312642wrv.59.2023.11.06.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:51:12 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8064965565;
	Mon,  6 Nov 2023 18:51:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 00/22] Maintainer updates for 8.2 (gdbstub, tests, plugins) pre-PR
Date: Mon,  6 Nov 2023 18:50:50 +0000
Message-Id: <20231106185112.2755262-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: XxsarQxCoh2M

I ran into various issues getting the register API ready in time so
those have been dropped although I've included a bunch of the
pre-requisites. There has been more tweaking of the registers test
which keeps finding kinks in our gdbstub report. I've also rolled up
the acked gitdm changes. There has been a bit of juggling to the
configure and meson bits for the Windows plugin support. Finally I
noticed nios2 signal handling is broken again so I've disabled testing
again and we shouldn't re-enable it until we can defend in CI (if we
ever want to, the architecture is currently orphaned).

I'll be rolling the PR tomorrow for soft-freeze so this is your last
chance to complain ;-)

The following still need review:

  Revert "tests/tcg/nios2: Re-enable linux-user tests"
  configure: tell meson and contrib_plugins about DLLTOOL
  tests/avocado: update the tcg_plugins test
  tests/tcg: add an explicit gdbstub register tester
  target/arm: hide aliased MIDR from gdbstub
  target/arm: hide all versions of DBGD[RS]AR from gdbstub
  target/arm: hide the 32bit version of PAR from gdbstub

Akihiko Odaki (5):
  default-configs: Add TARGET_XML_FILES definition
  gdbstub: Add num_regs member to GDBFeature
  gdbstub: Introduce gdb_find_static_feature()
  gdbstub: Introduce GDBFeatureBuilder
  cpu: Call plugin hooks only when ready

Alex Bennée (12):
  gdb-xml: fix duplicate register in arm-neon.xml
  target/arm: hide the 32bit version of PAR from gdbstub
  target/arm: hide all versions of DBGD[RS]AR from gdbstub
  target/arm: hide aliased MIDR from gdbstub
  tests/tcg: add an explicit gdbstub register tester
  tests/avocado: update the tcg_plugins test
  configure: tell meson and contrib_plugins about DLLTOOL
  contrib/gitdm: Add Rivos Inc to the domain map
  contrib/gitdm: map HiSilicon to Huawei
  contrib/gitdm: add Daynix to domain-map
  mailmap: fixup some more corrupted author fields
  Revert "tests/tcg/nios2: Re-enable linux-user tests"

Greg Manning (4):
  plugins: add dllexport and dllimport to api funcs
  plugins: make test/example plugins work on windows
  plugins: disable lockstep plugin on windows
  plugins: allow plugins to be enabled on windows

luzhipeng (1):
  contrib/gitdm: add domain-map for Cestc

 configure                                     |  13 +-
 configs/targets/loongarch64-linux-user.mak    |   1 +
 meson.build                                   |   5 +
 include/exec/gdbstub.h                        |  59 ++++++
 include/qemu/qemu-plugin.h                    |  50 ++++-
 contrib/plugins/win32_linker.c                |  34 +++
 cpu-target.c                                  |  11 -
 gdbstub/gdbstub.c                             |  78 +++++++
 hw/core/cpu-common.c                          |  10 +
 target/arm/debug_helper.c                     |   8 +-
 target/arm/helper.c                           |   4 +-
 .mailmap                                      |   2 +
 contrib/gitdm/domain-map                      |   4 +
 contrib/plugins/Makefile                      |  26 ++-
 gdb-xml/arm-neon.xml                          |   2 +-
 plugins/meson.build                           |  19 ++
 scripts/feature_to_c.py                       |  46 +++-
 tests/avocado/tcg_plugins.py                  |  28 ++-
 tests/plugin/meson.build                      |  14 +-
 tests/tcg/multiarch/Makefile.target           |  11 +-
 tests/tcg/multiarch/gdbstub/registers.py      | 196 ++++++++++++++++++
 .../multiarch/system/Makefile.softmmu-target  |  13 +-
 tests/tcg/nios2/Makefile.target               |  11 +
 23 files changed, 601 insertions(+), 44 deletions(-)
 create mode 100644 contrib/plugins/win32_linker.c
 create mode 100644 tests/tcg/multiarch/gdbstub/registers.py
 create mode 100644 tests/tcg/nios2/Makefile.target

-- 
2.39.2
