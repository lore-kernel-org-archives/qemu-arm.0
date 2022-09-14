Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c198c00b003b47e75b401sm13863904wmq.37.2022.09.14.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:09:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 304A21FFB7;
	Wed, 14 Sep 2022 17:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 0/4] use MemTxAttrs to signal cpu index
Date: Wed, 14 Sep 2022 17:09:51 +0100
Message-Id: <20220914160955.812151-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nb9cDlP2LqAk

Hi,

This ostensibly fixes a bug with gdbstub when accessing the GIC state
(via system registers). It also proposes a pattern for removing
current_cpu/qtest_enabled() hacks in hw/ by passing the cpu index via
MemTxAttrs. For the ARM timer code we also assert that those accesses
do come from a CPU (as opposed to HW DMA attempting to overwrite
stuff).

We do need to audit helpers in target/ which use the address_space API
to read and write data and ensure they properly form their MxTxAttrs
so this works cleanly.

What do people think?

Alex Bennée (4):
  hw: encode accessing CPU index in MemTxAttrs
  qtest: make read/write operation appear to be from CPU
  hw/intc/gic: use MxTxAttrs to divine accessing CPU
  hw/timer: convert mptimer access to attrs to derive cpu index

 include/exec/memattrs.h |  4 +++-
 accel/tcg/cputlb.c      | 22 ++++++++++++++++------
 hw/core/cpu-sysemu.c    | 17 +++++++++++++----
 hw/intc/arm_gic.c       | 39 ++++++++++++++++++++++-----------------
 hw/timer/arm_mptimer.c  | 25 ++++++++++++++-----------
 softmmu/qtest.c         | 31 +++++++++++++++++++------------
 6 files changed, 87 insertions(+), 51 deletions(-)

-- 
2.34.1
