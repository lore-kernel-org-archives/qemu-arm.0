Received: by 10.25.21.156 with SMTP id 28csp437655lfv;
        Thu, 21 Jul 2016 07:40:16 -0700 (PDT)
X-Received: by 10.37.223.213 with SMTP id w204mr26061255ybg.20.1469112016059;
        Thu, 21 Jul 2016 07:40:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o184si5169099qkd.244.2016.07.21.07.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:40:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQF95-0000vt-Df
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:40:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1Y-000314-Ic
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1T-0003iS-Hg
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:28 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1T-0003hW-4b; Thu, 21 Jul 2016 10:32:23 -0400
Received: by mail-lf0-x242.google.com with SMTP id f93so5656617lfi.0;
	Thu, 21 Jul 2016 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IzBsp3HugJ+hzNZzeS4zKWfm8CxefD/KQSCD5g+L3qo=;
	b=hTY0ps13HVrtP1FPPaRV9y6humo4R9tg470lfoPY41dzahJgIUEwvaEB2i8AvLp/BQ
	VMQB+cGUDR4mKGWvyv3JjKzsoorXiXIPEW+7zxhVBrGL26g09ZBvJG1Q2dSvvSh25RFX
	8CdmpwV1GPAxJs5XqbFNH8FZZCSZXD2Dk5Dj8UirZxr+jRJYfA2cqucUT5j9ZZoL5Pli
	zWdcqsWpq2+GzwrQ2ko458SJKACf+3ClDNUwBM8wMLd12JTbfalMtmFdLEs0q9pJKFPW
	cU4aQ7/ENhNHL3rEIfZX+tSgc5grgpa7YFFaJcnSHWYxBYv2ye2V7J0znj33w07QG29j
	zmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IzBsp3HugJ+hzNZzeS4zKWfm8CxefD/KQSCD5g+L3qo=;
	b=Y9+sy5F1A+4MtYpYi1yDdAvY6RDl812/E9/3IlOuMra7sPZiivn+fXwbj5+tU/dwSH
	25pQXJa5clc0bEJo5elLxxY3YcpxZexUpRn2uuR9kTWeAVzQXVyeThDrWT6UF1/hM5H9
	Ew20PjWbh6Ishd5LX5TvdrTooCtdvQQGgbspDauYEoahmfbNEOa9tJbUWvt3IiDnOnDn
	n13N8l4WuG213JihatlJDjTH2qKNnxdTjgq/Iu6pwQhmeeACiLSsHAEym0DPvNT1eAdi
	TQTRKcxlWGezol3BkClKvLcAuNdTQG+kEAeocvlTRRTCD2CzKfpNGp5LSJFEL2SNE5gD
	xw3Q==
X-Gm-Message-State: ALyK8tLnFELTFXM/dEDbphT8vH4PSPuuUiR6zrM74A8iV7F5OT1/zfgOw3uPqoyrYBQb4g==
X-Received: by 10.25.31.80 with SMTP id f77mr16988730lff.215.1469111540449;
	Thu, 21 Jul 2016 07:32:20 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:19 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:11 +0300
Message-Id: <cover.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v15 00/15] PTimer fixes/features and ARM
 MPTimer conversion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LdlmYMihwN2d

Hello,

Currently, QEMU ARM MPTimer device model provides only a certain subset of
the emulation behavior. This patch series is supposed to add missing parts by
converting the MPTimer to use generic ptimer helper. It fixes some important
ptimer bugs and provides new features that are required for the ARM MPTimer.

Changelog:
    V15: As per Peter's Maydell request: split ptimer policy patches,
         so that first "policy" patch only sets default policy to all
         of the timers without introducing new behaviour policies.

         The "deferred trigger" ptimer policy from V14 is converted to
         "continuous trigger" as it is more intuitive.

         New ptimer policies added.

         New ptimer patch "Actually stop timer in case of error".

         Fixed ARM MPTimer periodic/oneshot "on the fly" mode switch
         for the case when load = 0 and new mode has prescaler = 0.

         Added QTests for each of the ptimer policies.

         Added QTests for the ARM MPTimer.

    V14: Set the ptimer policy in the ptimer_init() instead of adding
         ptimer_set_policy(), keeping ptimer VMState unchanged and dropped
         hw_error() hardening asserts as per Peter's Maydell V13 review
         comments, addressed the rest of the review comments.

Dmitry Osipenko (15):
  hw/ptimer: Change ptimer_get_count to return "1" for the expired timer
  hw/ptimer: Fix counter - 1 returned by ptimer_get_count for the active
    timer
  hw/ptimer: Actually stop timer in case of error
  hw/ptimer: Introduce timer policy feature
  tests: Add ptimer tests
  hw/ptimer: Add "wraparound after one period" policy
  tests: ptimer: Add tests for "wraparound after one period" policy
  hw/ptimer: Add "continuous trigger" policy
  tests: ptimer: Add tests for "continuous trigger" policy
  hw/ptimer: Add "no immediate trigger" policy
  tests: ptimer: Add tests for "no immediate trigger" policy
  hw/ptimer: Add "no immediate reload" policy
  tests: ptimer: Add tests for "no immediate reload" policy
  arm_mptimer: Convert to use ptimer
  tests: Add tests for the ARM MPTimer

 hw/arm/musicpal.c              |    2 +-
 hw/core/ptimer.c               |   80 ++-
 hw/dma/xilinx_axidma.c         |    2 +-
 hw/m68k/mcf5206.c              |    2 +-
 hw/m68k/mcf5208.c              |    2 +-
 hw/net/fsl_etsec/etsec.c       |    2 +-
 hw/net/lan9118.c               |    2 +-
 hw/timer/allwinner-a10-pit.c   |    2 +-
 hw/timer/arm_mptimer.c         |  148 +++---
 hw/timer/arm_timer.c           |    2 +-
 hw/timer/digic-timer.c         |    2 +-
 hw/timer/etraxfs_timer.c       |    6 +-
 hw/timer/exynos4210_mct.c      |    7 +-
 hw/timer/exynos4210_pwm.c      |    2 +-
 hw/timer/exynos4210_rtc.c      |    4 +-
 hw/timer/grlib_gptimer.c       |    2 +-
 hw/timer/imx_epit.c            |    4 +-
 hw/timer/imx_gpt.c             |    2 +-
 hw/timer/lm32_timer.c          |    2 +-
 hw/timer/milkymist-sysctl.c    |    4 +-
 hw/timer/puv3_ost.c            |    2 +-
 hw/timer/sh_timer.c            |    2 +-
 hw/timer/slavio_timer.c        |    2 +-
 hw/timer/xilinx_timer.c        |    2 +-
 include/hw/ptimer.h            |   15 +-
 include/hw/timer/arm_mptimer.h |    5 +-
 stubs/vmstate.c                |    5 +
 tests/Makefile.include         |    4 +
 tests/ptimer-test-stubs.c      |  107 ++++
 tests/ptimer-test.c            |  659 ++++++++++++++++++++++++
 tests/ptimer-test.h            |   20 +
 tests/test-arm-mptimer.c       | 1079 ++++++++++++++++++++++++++++++++++++++++
 32 files changed, 2061 insertions(+), 120 deletions(-)
 create mode 100644 tests/ptimer-test-stubs.c
 create mode 100644 tests/ptimer-test.c
 create mode 100644 tests/ptimer-test.h
 create mode 100644 tests/test-arm-mptimer.c

-- 
2.9.2

