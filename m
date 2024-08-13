Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfee676sm11229207f8f.49.2024.08.13.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:23:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5F5195F7A3;
	Tue, 13 Aug 2024 21:23:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	Michael Roth <michael.roth@amd.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Weiwei Li <liwei1518@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Eric Auger <eric.auger@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Eric Blake <eblake@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 00/21] Various fixes and tweaks for 9.1-rc2/3
Date: Tue, 13 Aug 2024 21:23:08 +0100
Message-Id: <20240813202329.1237572-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 09Bepiizq6At

As usual during soft freeze I switch to cleaning up the various
niggles and bugs which have accumulated over the years.

New for this iteration are some late breaking plugin updates, fixes
for record/replay and a few documentation updates. Everything is
reviewed so I will roll a pull request later this week.

Alex Bennée (2):
  Makefile: trigger re-configure on updated pythondeps
  target/i386: allow access_ptr to force slow path on failed probe

Gustavo Romero (3):
  configure: Fix arch detection for GDB_HAS_MTE
  configure: Avoid use of param. expansion when using gdb_version
  configure: Fix GDB version detection for GDB_HAS_MTE

Nicholas Piggin (10):
  scripts/replay-dump.py: Update to current rr record format
  scripts/replay-dump.py: rejig decoders in event number order
  tests/avocado: excercise scripts/replay-dump.py in replay tests
  replay: allow runstate shutdown->running when replaying trace
  Revert "replay: stop us hanging in rr_wait_io_event"
  tests/avocado: replay_kernel.py add x86-64 q35 machine test
  chardev: set record/replay on the base device of a muxed device
  virtio-net: Use replay_schedule_bh_event for bhs that affect machine
    state
  virtio-net: Use virtual time for RSC timers
  savevm: Fix load_snapshot error path crash

Philippe Mathieu-Daudé (2):
  tests/avocado: Re-enable gdbsim-r5f562n8 testing U-Boot
  buildsys: Fix building without plugins on Darwin

Pierrick Bouvier (2):
  docs/devel: update tcg-plugins page
  plugins: fix race condition with scoreboards

Stefan Weil (1):
  docs: Fix some typos (found by typos) and grammar issues

Stefano Garzarella (1):
  scripts/checkpatch: more checks on files imported from Linux

 docs/about/emulation.rst                  |  49 ++++++-
 docs/devel/migration/uadk-compression.rst |   4 +-
 docs/devel/tcg-plugins.rst                |  13 +-
 docs/interop/qemu-ga.rst                  |   2 +-
 docs/tools/qemu-vmsr-helper.rst           |   4 +-
 configure                                 |   8 +-
 Makefile                                  |   3 +-
 qapi/rocker.json                          |   4 +-
 include/exec/memory.h                     |   2 +-
 include/sysemu/replay.h                   |   5 -
 include/sysemu/runstate.h                 |   1 +
 accel/tcg/tcg-accel-ops-rr.c              |   2 +-
 chardev/char.c                            |  71 ++++++---
 hw/arm/smmu-common.c                      |   2 +-
 hw/net/virtio-net.c                       |  17 +--
 migration/savevm.c                        |   1 +
 plugins/core.c                            |  43 ++++--
 qga/main.c                                |   2 +-
 replay/replay.c                           |  23 +--
 system/runstate.c                         |  31 +++-
 target/i386/tcg/access.c                  |  27 ++--
 plugins/meson.build                       |  50 +++----
 scripts/checkpatch.pl                     |  24 ++++
 scripts/replay-dump.py                    | 167 +++++++++++++++-------
 tests/avocado/machine_rx_gdbsim.py        |   2 -
 tests/avocado/replay_kernel.py            |  31 +++-
 tests/avocado/replay_linux.py             |  10 ++
 27 files changed, 406 insertions(+), 192 deletions(-)

-- 
2.39.2
