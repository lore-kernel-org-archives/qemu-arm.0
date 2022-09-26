Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id x12-20020adfffcc000000b0022ac672654dsm14103341wrs.58.2022.09.26.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 06:39:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AD0D41FFB7;
	Mon, 26 Sep 2022 14:39:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	mads@ynddal.dk,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 00/11] gdbstub/next (MemTxAttrs and re-factoring)
Date: Mon, 26 Sep 2022 14:38:53 +0100
Message-Id: <20220926133904.3297263-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4ar10yTTlCXd

Hi,

This is v3 of the MexTxAttrs update alongside the current state of
gdbstub/next (as fixing current_cpu from gdbstub was the original
motivation).

Following feedback I've drastically simplified the first patch and
push the all the setting of requester_id to the per-arch tlb_fill and
get_phys_page_attrs_debug helpers to fill in correctly. There is also
a new patch to fix up HVF on Aarch64 which rely mostly on software
modelled devices.

The later re-factoring is unchanged having sailed through review
without any comments.

The following are left for review:

 - qtest: make read/write operation appear to be from CPU
 - target/arm: ensure HVF traps set appropriate MemTxAttrs
 - target/arm: enable tracking of CPU index in MemTxAttrs
 - hw: encode accessing CPU index in MemTxAttrs

Alex Bennée (11):
  hw: encode accessing CPU index in MemTxAttrs
  target/arm: enable tracking of CPU index in MemTxAttrs
  target/arm: ensure HVF traps set appropriate MemTxAttrs
  qtest: make read/write operation appear to be from CPU
  hw/intc/gic: use MxTxAttrs to divine accessing CPU
  hw/timer: convert mptimer access to attrs to derive cpu index
  configure: move detected gdb to TCG's config-host.mak
  gdbstub: move into its own sub directory
  gdbstub: move sstep flags probing into AccelClass
  gdbstub: move breakpoint logic to accel ops
  gdbstub: move guest debug support check to ops

 configure                      |   7 ++
 meson.build                    |   4 +-
 accel/kvm/kvm-cpus.h           |   4 +
 gdbstub/internals.h            |  17 ++++
 gdbstub/trace.h                |   1 +
 include/exec/memattrs.h        |  17 +++-
 include/qemu/accel.h           |  12 +++
 include/sysemu/accel-ops.h     |   7 ++
 include/sysemu/cpus.h          |   3 +
 include/sysemu/kvm.h           |  20 -----
 accel/accel-common.c           |  10 +++
 accel/kvm/kvm-accel-ops.c      |   9 ++
 accel/kvm/kvm-all.c            |  44 +++++-----
 accel/stubs/kvm-stub.c         |  16 ----
 accel/tcg/tcg-accel-ops.c      |  98 +++++++++++++++++++++
 accel/tcg/tcg-all.c            |  17 ++++
 gdbstub.c => gdbstub/gdbstub.c | 156 ++++-----------------------------
 gdbstub/softmmu.c              |  51 +++++++++++
 gdbstub/user.c                 |  68 ++++++++++++++
 hw/intc/arm_gic.c              |  39 +++++----
 hw/timer/arm_mptimer.c         |  25 +++---
 softmmu/cpus.c                 |   7 ++
 softmmu/qtest.c                |  26 +++---
 target/arm/hvf/hvf.c           |   4 +-
 target/arm/ptw.c               |   3 +
 MAINTAINERS                    |   2 +-
 gdbstub/meson.build            |   9 ++
 gdbstub/trace-events           |  29 ++++++
 trace-events                   |  28 ------
 29 files changed, 461 insertions(+), 272 deletions(-)
 create mode 100644 gdbstub/internals.h
 create mode 100644 gdbstub/trace.h
 rename gdbstub.c => gdbstub/gdbstub.c (95%)
 create mode 100644 gdbstub/softmmu.c
 create mode 100644 gdbstub/user.c
 create mode 100644 gdbstub/meson.build
 create mode 100644 gdbstub/trace-events

-- 
2.34.1
