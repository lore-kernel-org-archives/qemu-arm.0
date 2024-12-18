Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963ce2f2sm580246466b.201.2024.12.18.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:15:12 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 77E245F796;
	Wed, 18 Dec 2024 18:15:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 0/5] target/arm: implement SEL2 physical and virtual timers
Date: Wed, 18 Dec 2024 18:15:06 +0000
Message-Id: <20241218181511.3575613-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: UIU2oDlLoRE3

Follow Peter's review I've split this into a several patches as there
are some other fixes that should be made to other EL2 times that
shouldn't be rolled together.

v2
  - split machine enabling into patches
  - rename IRQ
  - use CP_ACCESS_TRAP_UNCATEGORIZED for UNDEF cases

v1
  - improve GTIMER docs
  - fix gt_recalc bug
  - address review comments for the main patch
  - cc qemu-stable (no rush for 9.2.0)

The following still need review:

  hw/arm: enable secure EL2 timers for sbsa machine
  hw/arm: enable secure EL2 timers for virt machine
  target/arm: implement SEL2 physical and virtual timers
  target/arm: ensure cntvoff_el2 also used for EL2 virt timer

Alex.

Alex Bennée (5):
  target/arm: document the architectural names of our GTIMERs
  target/arm: ensure cntvoff_el2 also used for EL2 virt timer
  target/arm: implement SEL2 physical and virtual timers
  hw/arm: enable secure EL2 timers for virt machine
  hw/arm: enable secure EL2 timers for sbsa machine

 include/hw/arm/bsa.h |   2 +
 target/arm/cpu.h     |   2 +
 target/arm/gtimer.h  |  14 ++--
 hw/arm/sbsa-ref.c    |   2 +
 hw/arm/virt.c        |   2 +
 target/arm/cpu.c     |   4 +
 target/arm/helper.c  | 179 +++++++++++++++++++++++++++++++++++++++++--
 7 files changed, 194 insertions(+), 11 deletions(-)

-- 
2.39.5
