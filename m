Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d04da5e0sm86137845e9.0.2024.12.06.08.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:02:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 607185F8C4;
	Fri,  6 Dec 2024 16:02:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/3] target/arm: implement SEL2 physical and virtual timers
Date: Fri,  6 Dec 2024 16:02:36 +0000
Message-Id: <20241206160239.3229094-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: ge9Vn4BIzu0E

Follow Peter's review I've split this into a several patches as there
are some other fixes that should be made to other EL2 times that
shouldn't be rolled together.

v1
  - improve GTIMER docs
  - fix gt_recalc bug
  - address review comments for the main patch
  - cc qemu-stable (no rush for 9.2.0)

Please review.

Alex.

Alex Bennée (3):
  target/arm: document the architectural names of our GTIMERs
  target/arm: ensure cntvoff_el2 also used for EL2 virt timer
  target/arm: implement SEL2 physical and virtual timers

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
