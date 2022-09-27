Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p2-20020adfce02000000b00226dba960b4sm1983684wrn.3.2022.09.27.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:15:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E95D11FFB7;
	Tue, 27 Sep 2022 15:15:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 00/15] gdbstub/next (MemTxAttrs, re-factoring)
Date: Tue, 27 Sep 2022 15:14:49 +0100
Message-Id: <20220927141504.3886314-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 24f61Ak4Li/D

Hi,

Following feedback on the MemTxAttrs updates we now:

  - move unspecified to requester_type
  - document a machine specific decoding of requester_id
  - update the existing users
  - update HVF/KVM/m-profile/page-walking access functions
  - fail with MEMTX_ACCESS_ERROR if non-CPU accesses GIC

I suspect this will be my last run at this for a while so if it is
still wanting I'll split off the re-factoring work for a PR so it is
not held up. The following still need review:

 - accel/kvm: move kvm_update_guest_debug to inline stub
 - qtest: make read/write operation appear to be from CPU
 - target/arm: ensure m-profile helpers set appropriate MemTxAttrs
 - target/arm: ensure ptw accesses set appropriate MemTxAttrs
 - target/arm: ensure KVM traps set appropriate MemTxAttrs
 - target/arm: ensure HVF traps set appropriate MemTxAttrs
 - target/arm: ensure TCG IO accesses set appropriate MemTxAttrs
 - hw: encode accessing CPU index in MemTxAttrs


Alex Bennée (15):
  hw: encode accessing CPU index in MemTxAttrs
  target/arm: ensure TCG IO accesses set appropriate MemTxAttrs
  target/arm: ensure HVF traps set appropriate MemTxAttrs
  target/arm: ensure KVM traps set appropriate MemTxAttrs
  target/arm: ensure ptw accesses set appropriate MemTxAttrs
  target/arm: ensure m-profile helpers set appropriate MemTxAttrs
  qtest: make read/write operation appear to be from CPU
  hw/intc/gic: use MxTxAttrs to divine accessing CPU
  hw/timer: convert mptimer access to attrs to derive cpu index
  configure: move detected gdb to TCG's config-host.mak
  gdbstub: move into its own sub directory
  gdbstub: move sstep flags probing into AccelClass
  gdbstub: move breakpoint logic to accel ops
  gdbstub: move guest debug support check to ops
  accel/kvm: move kvm_update_guest_debug to inline stub

 configure                      |   7 ++
 meson.build                    |   4 +-
 accel/kvm/kvm-cpus.h           |   4 +
 gdbstub/internals.h            |  17 ++++
 gdbstub/trace.h                |   1 +
 include/exec/memattrs.h        |  39 ++++++--
 include/qemu/accel.h           |  12 +++
 include/sysemu/accel-ops.h     |   7 ++
 include/sysemu/cpus.h          |   3 +
 include/sysemu/kvm.h           |  36 +++----
 accel/accel-common.c           |  10 ++
 accel/kvm/kvm-accel-ops.c      |   9 ++
 accel/kvm/kvm-all.c            |  48 ++++-----
 accel/stubs/kvm-stub.c         |  21 ----
 accel/tcg/tcg-accel-ops.c      |  98 +++++++++++++++++++
 accel/tcg/tcg-all.c            |  17 ++++
 gdbstub.c => gdbstub/gdbstub.c | 156 +++--------------------------
 gdbstub/softmmu.c              |  51 ++++++++++
 gdbstub/user.c                 |  68 +++++++++++++
 hw/i386/amd_iommu.c            |   3 +-
 hw/i386/intel_iommu.c          |   2 +-
 hw/intc/arm_gic.c              | 174 ++++++++++++++++++++++-----------
 hw/misc/tz-mpc.c               |   2 +-
 hw/misc/tz-msc.c               |   8 +-
 hw/pci/pci.c                   |   7 +-
 hw/timer/arm_mptimer.c         |  25 ++---
 softmmu/cpus.c                 |   7 ++
 softmmu/qtest.c                |  26 ++---
 target/arm/hvf/hvf.c           |   4 +-
 target/arm/kvm.c               |  12 ++-
 target/arm/m_helper.c          |  12 +--
 target/arm/ptw.c               |   7 +-
 MAINTAINERS                    |   2 +-
 gdbstub/meson.build            |   9 ++
 gdbstub/trace-events           |  29 ++++++
 trace-events                   |  28 ------
 36 files changed, 615 insertions(+), 350 deletions(-)
 create mode 100644 gdbstub/internals.h
 create mode 100644 gdbstub/trace.h
 rename gdbstub.c => gdbstub/gdbstub.c (95%)
 create mode 100644 gdbstub/softmmu.c
 create mode 100644 gdbstub/user.c
 create mode 100644 gdbstub/meson.build
 create mode 100644 gdbstub/trace-events

-- 
2.34.1
