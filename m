Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6ff432351sm578507166b.68.2025.02.03.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:40:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8F12F5F8BF;
	Mon,  3 Feb 2025 14:40:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	Peter Xu <peterx@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Kyle Evans <kevans@freebsd.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-rust@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 00/18] maintainer updates for feb25 (qtest, gdbstub, plugins)
Date: Mon,  3 Feb 2025 14:40:30 +0000
Message-Id: <20250203144048.2131117-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: PMK4GU2LVGgj

Another month and another set of updates from across my maintainer
trees. They include:

  * qtest set/step clock cleanups

It seems the earlier patch to avoid deadlock when shutting down was
overly broad. So in this series after a little clean-up to the qtest
reply code we tighten up some checks for steps that make no sense and
eventually revert the original deadlock avoiding patch.

  * reducing migration test scope depending on accel

Fabino's continued work on the migration tests and avoiding them
taking too much of the overall test execution time. KVM guests still
get the full range and we smoke test TCG guests.

  * gdbstub late attachment

These are Ilya's patches to make it easier to debug heavily
multi-process linux-user invocations. Comes with documentation and
a test case ;-)

  * plugins

Fix a compiler false positive.

As this is the first iteration I intend to send out a pre-PR later
this week if everything is reviewed ok with a PR shortly after.

Alex.

Alex Bennée (7):
  tests/docker: replicate the check-rust-tools-nightly CI job
  tests/qtest: don't attempt to clock_step while waiting for virtio ISR
  tests/qtest: don't step clock at start of npcm7xx periodic IRQ test
  tests/qtest: simplify qtest_process_inbuf
  tests/qtest: rename qtest_send_prefix and roll-up into qtest_send
  tests/qtest: tighten up the checks on clock_step
  Revert "util/timer: avoid deadlock when shutting down"

Fabiano Rosas (2):
  tests/qtest/migration: Add --full option
  tests/qtest/migration: Pick smoke tests

Ilya Leoshkevich (8):
  gdbstub: Allow the %d placeholder in the socket path
  gdbstub: Try unlinking the unix socket before binding
  user: Introduce user/signal.h
  user: Introduce host_interrupt_signal
  osdep: Introduce qemu_kill_thread()
  gdbstub: Allow late attachment
  docs/user: Document the %d placeholder and suspend=n QEMU_GDB features
  tests/tcg: Add late gdbstub attach test

Marc-André Lureau (1):
  plugins: fix -Werror=maybe-uninitialized false-positive

 MAINTAINERS                                |   1 +
 docs/user/main.rst                         |  16 ++-
 bsd-user/signal-common.h                   |   1 -
 include/qemu/osdep.h                       |   9 ++
 include/system/qtest.h                     |   1 -
 include/user/signal.h                      |  25 ++++
 linux-user/signal-common.h                 |   1 -
 tests/qtest/migration/framework.h          |   1 +
 bsd-user/main.c                            |   1 -
 bsd-user/signal.c                          |  13 ++
 contrib/plugins/cache.c                    |   2 +-
 gdbstub/user.c                             | 150 ++++++++++++++++-----
 hw/ppc/spapr_rtas.c                        |   1 -
 hw/riscv/riscv_hart.c                      |   1 -
 linux-user/main.c                          |   1 -
 linux-user/signal.c                        |  26 +++-
 linux-user/syscall.c                       |   1 +
 stubs/monitor-fd.c                         |   9 ++
 system/qtest.c                             |  59 +++-----
 tests/qtest/libqos/virtio-pci-modern.c     |   6 +-
 tests/qtest/libqos/virtio-pci.c            |   6 +-
 tests/qtest/migration-test.c               |  25 ++++
 tests/qtest/migration/compression-tests.c  |  15 ++-
 tests/qtest/migration/cpr-tests.c          |   6 +
 tests/qtest/migration/file-tests.c         |  19 ++-
 tests/qtest/migration/misc-tests.c         |  16 ++-
 tests/qtest/migration/postcopy-tests.c     |  14 +-
 tests/qtest/migration/precopy-tests.c      |  23 +++-
 tests/qtest/migration/tls-tests.c          |  14 +-
 tests/qtest/npcm7xx_timer-test.c           |   1 -
 tests/tcg/multiarch/late-attach.c          |  41 ++++++
 util/oslib-posix.c                         |  15 +++
 util/qemu-timer.c                          |  16 +--
 stubs/meson.build                          |   2 +
 tests/docker/Makefile.include              |   3 +
 tests/docker/test-rust                     |  21 +++
 tests/guest-debug/run-test.py              |  15 ++-
 tests/qtest/meson.build                    |  11 +-
 tests/tcg/multiarch/Makefile.target        |   9 +-
 tests/tcg/multiarch/gdbstub/late-attach.py |  28 ++++
 util/meson.build                           |   2 +
 41 files changed, 491 insertions(+), 136 deletions(-)
 create mode 100644 include/user/signal.h
 create mode 100644 stubs/monitor-fd.c
 create mode 100644 tests/tcg/multiarch/late-attach.c
 create mode 100755 tests/docker/test-rust
 create mode 100644 tests/tcg/multiarch/gdbstub/late-attach.py

-- 
2.39.5
