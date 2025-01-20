Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73670dbbsm6283722a12.28.2025.01.20.13.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 13:02:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DCFB15F713;
	Mon, 20 Jan 2025 21:02:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/7] testing/next (qtest timer stuff)
Date: Mon, 20 Jan 2025 21:02:05 +0000
Message-Id: <20250120210212.3890255-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 3ipvp5o3HMdw

Hi,

Thomas found that a number of tests fail under CFI and other exotic
setups. The eventual realisation was that --enable-slirp masks a lot
of timer misuse because it ensures there is always a timer and
therefor things tend to move on (until the system is shutting down).

It turns out that bc02be4508 wasn't the solution after all. The first
few patches are clean-ups and various tightening of test expectations
before we revert the patch.

Please review:

  Revert "util/timer: avoid deadlock when shutting down"
  tests/qtest: tighten up the checks on clock_step
  tests/qtest: rename qtest_send_prefix and roll-up into qtest_send
  tests/qtest: simplify qtest_process_inbuf
  tests/qtest: don't step clock at start of npcm7xx periodic IRQ test
  tests/qtest: don't attempt to clock_step while waiting for virtio ISR
  tests/docker: replicate the check-rust-tools-nightly CI job

Alex.

Alex Bennée (7):
  tests/docker: replicate the check-rust-tools-nightly CI job
  tests/qtest: don't attempt to clock_step while waiting for virtio ISR
  tests/qtest: don't step clock at start of npcm7xx periodic IRQ test
  tests/qtest: simplify qtest_process_inbuf
  tests/qtest: rename qtest_send_prefix and roll-up into qtest_send
  tests/qtest: tighten up the checks on clock_step
  Revert "util/timer: avoid deadlock when shutting down"

 include/system/qtest.h                 |  1 -
 hw/ppc/spapr_rtas.c                    |  1 -
 hw/riscv/riscv_hart.c                  |  1 -
 system/qtest.c                         | 53 +++++++++-----------------
 tests/qtest/libqos/virtio-pci-modern.c |  6 +--
 tests/qtest/libqos/virtio-pci.c        |  6 +--
 tests/qtest/npcm7xx_timer-test.c       |  1 -
 util/qemu-timer.c                      | 16 ++------
 tests/docker/Makefile.include          |  3 ++
 tests/docker/test-rust                 | 21 ++++++++++
 10 files changed, 48 insertions(+), 61 deletions(-)
 create mode 100755 tests/docker/test-rust

-- 
2.39.5
