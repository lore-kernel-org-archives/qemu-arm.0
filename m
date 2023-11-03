Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y23-20020a05600c341700b00406408dc788sm3402021wmp.44.2023.11.03.12.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 12:59:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id AAAC9656E5;
	Fri,  3 Nov 2023 19:59:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	qemu-ppc@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Nicholas Piggin <npiggin@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 00/29] gdbstub and plugin read register and windows support
Date: Fri,  3 Nov 2023 19:59:27 +0000
Message-Id: <20231103195956.1998255-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: /hMBIiMRXwPI

Here are my final updates for the 8.2 cycle which I can hopefully
merge if we get enough review. Aside from the usual tweaks and fixes
there are two new features:

TCG Plugin Register Access

This is based on Akihiko's previously posted series with some changes
by myself. I wasn't keen on the plugin facing API so I've re-written
it to use an opaque handle and hide the gdb details from the plugin. I
think this allows for potential future improvements as well as being
ready for up-coming heterogeneous support. The new API allowed for
making the execlog register tracking a bit more flexible and able to
track multiple registers.

Windows Support

This fairly late breaking patch finally adds support for Windows to
the TCG plugins subsystem. I'm pretty pleased with Greg's approach
which improves on previous attempts by avoiding re-implementing a
linker for POSIX targets. I don't have access to Windows though so I'm
calling on Windows users to test the solution.

The following patches still need review:

  contrib/plugins: extend execlog to track register changes
  plugins: add an API to read registers
  gdbstub: expose api to find registers
  tests/avocado: update the tcg_plugins test
  tests/tcg: add an explicit gdbstub register tester
  target/arm: hide aliased MIDR from gdbstub
  target/arm: hide all versions of DBGD[RS]AR from gdbstub
  target/arm: hide the 32bit version of PAR from gdbstub
  gdb-xml: fix duplicate register in arm-neon.xml

Akihiko Odaki (16):
  default-configs: Add TARGET_XML_FILES definition
  gdbstub: Add num_regs member to GDBFeature
  gdbstub: Introduce gdb_find_static_feature()
  gdbstub: Introduce GDBFeatureBuilder
  target/arm: Use GDBFeature for dynamic XML
  target/ppc: Use GDBFeature for dynamic XML
  target/riscv: Use GDBFeature for dynamic XML
  gdbstub: Use GDBFeature for gdb_register_coprocessor
  gdbstub: Use GDBFeature for GDBRegisterState
  gdbstub: Change gdb_get_reg_cb and gdb_set_reg_cb
  gdbstub: Simplify XML lookup
  gdbstub: Infer number of core registers from XML
  hw/core/cpu: Remove gdb_get_dynamic_xml member
  gdbstub: Add members to identify registers to GDBFeature
  cpu: Call plugin hooks only when ready
  plugins: Use different helpers when reading registers

Alex Bennée (9):
  gdb-xml: fix duplicate register in arm-neon.xml
  target/arm: hide the 32bit version of PAR from gdbstub
  target/arm: hide all versions of DBGD[RS]AR from gdbstub
  target/arm: hide aliased MIDR from gdbstub
  tests/tcg: add an explicit gdbstub register tester
  tests/avocado: update the tcg_plugins test
  gdbstub: expose api to find registers
  plugins: add an API to read registers
  contrib/plugins: extend execlog to track register changes

Greg Manning (4):
  plugins: add dllexport and dllimport to api funcs
  plugins: make test/example plugins work on windows
  plugins: disable lockstep plugin on windows
  plugins: allow plugins to be enabled on windows

 docs/devel/tcg-plugins.rst                    |  10 +-
 configure                                     |   9 +-
 configs/targets/loongarch64-linux-user.mak    |   1 +
 meson.build                                   |   5 +
 accel/tcg/plugin-helpers.h                    |   3 +-
 include/exec/gdbstub.h                        | 121 +++++++-
 include/hw/core/cpu.h                         |   7 +-
 include/qemu/plugin.h                         |   1 +
 include/qemu/qemu-plugin.h                    | 104 ++++++-
 target/arm/cpu.h                              |  27 +-
 target/arm/internals.h                        |  14 +-
 target/hexagon/internal.h                     |   4 +-
 target/microblaze/cpu.h                       |   4 +-
 target/ppc/cpu-qom.h                          |   4 +-
 target/ppc/cpu.h                              |   2 -
 target/riscv/cpu.h                            |   5 +-
 target/s390x/cpu.h                            |   2 -
 accel/tcg/plugin-gen.c                        |  43 ++-
 contrib/plugins/execlog.c                     | 180 +++++++++---
 contrib/plugins/win32_linker.c                |  34 +++
 cpu-target.c                                  |  11 -
 gdbstub/gdbstub.c                             | 273 +++++++++++++-----
 hw/core/cpu-common.c                          |  15 +-
 plugins/api.c                                 | 114 +++++++-
 target/arm/cpu.c                              |   2 -
 target/arm/cpu64.c                            |   1 -
 target/arm/debug_helper.c                     |   8 +-
 target/arm/gdbstub.c                          | 230 +++++++--------
 target/arm/gdbstub64.c                        | 122 ++++----
 target/arm/helper.c                           |   4 +-
 target/avr/cpu.c                              |   1 -
 target/hexagon/cpu.c                          |   4 +-
 target/hexagon/gdbstub.c                      |  10 +-
 target/i386/cpu.c                             |   2 -
 target/loongarch/cpu.c                        |   2 -
 target/loongarch/gdbstub.c                    |  13 +-
 target/m68k/cpu.c                             |   1 -
 target/m68k/helper.c                          |  26 +-
 target/microblaze/cpu.c                       |   6 +-
 target/microblaze/gdbstub.c                   |   9 +-
 target/ppc/cpu_init.c                         |   7 -
 target/ppc/gdbstub.c                          | 114 ++++----
 target/riscv/cpu.c                            |  15 -
 target/riscv/gdbstub.c                        | 139 +++++----
 target/rx/cpu.c                               |   1 -
 target/s390x/cpu.c                            |   1 -
 target/s390x/gdbstub.c                        | 105 ++++---
 contrib/plugins/Makefile                      |  26 +-
 gdb-xml/arm-neon.xml                          |   2 +-
 plugins/meson.build                           |  17 ++
 plugins/qemu-plugins.symbols                  |   2 +
 scripts/feature_to_c.py                       |  58 +++-
 tests/avocado/tcg_plugins.py                  |  28 +-
 tests/plugin/meson.build                      |  14 +-
 tests/tcg/multiarch/Makefile.target           |  11 +-
 tests/tcg/multiarch/gdbstub/registers.py      | 188 ++++++++++++
 .../multiarch/system/Makefile.softmmu-target  |  13 +-
 57 files changed, 1577 insertions(+), 598 deletions(-)
 create mode 100644 contrib/plugins/win32_linker.c
 create mode 100644 tests/tcg/multiarch/gdbstub/registers.py

-- 
2.39.2
