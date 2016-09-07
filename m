Received: by 10.25.87.130 with SMTP id l124csp310854lfb;
        Wed, 7 Sep 2016 06:29:41 -0700 (PDT)
X-Received: by 10.55.18.40 with SMTP id c40mr39461444qkh.271.1473254980629;
        Wed, 07 Sep 2016 06:29:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c125si25035545qkd.97.2016.09.07.06.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcv5-0007jS-UB
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:29:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp1-0001Z4-L2
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcow-0005eV-J4
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:23 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcow-0005d9-7A; Wed, 07 Sep 2016 09:23:18 -0400
Received: by mail-lf0-x242.google.com with SMTP id j41so826115lfi.3;
	Wed, 07 Sep 2016 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6cpZi7qLlkYXcO2vLqft2W6jHGNwzD26DcVJ/NNWQo0=;
	b=Pte9FNOADy9QjOlHmhGXEXg/9nhihxpiGU63KJMeOMnxmlhyCwd4LJEIXTBQdkfaL0
	7jQuCTmiJjdkKIdE1InGgZH+KCdV/n4ATuDJj7h1LI6p9gclgzhST9FAHzeBIc0hlDnm
	N3UI+CCmvUh4zplz8fQdvPzEz8qjNmDYor69WpWP2IDc3L8xyB09dscuu+ybAqI4tWgA
	qg9fkI5KMn3BzcDTdSHldTQTiSV4cFgO2rFBwreHAB7q4C/BX96j6KYfWxSwIfW/BbCy
	fe/3yuQseJ4/fv58N3cwNXGOoIF7FIYqFjgnkDXIwFqZfQN0Y38aR2rkwY2B3rWvwkF0
	tJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6cpZi7qLlkYXcO2vLqft2W6jHGNwzD26DcVJ/NNWQo0=;
	b=KnUV8xOJSNgvHTKl07SvcqnfireT2FKiZ9DrrnPw2i67fWPJuot3za5ny7NeE7/b90
	P5UtJyUXUGta+mnCK9UhJwkemaVk5Mx3SE9cKOQnUDQ1pVjdoDsws8J2LDvla4BCKh53
	DQBmtHOfbwuyDN5GjGXXj1C3NYWts6dT7N5WinWYqqGGAS5mO2W1Se56rFJHWx3QU/rd
	dG3A0RXyqVShz4VEpuLI2f5QcYU/4jaa84hZgmJ5gTP9nOxC5oFelmon2cuLQ1NPoKjb
	m6SAA6uKKBgCfgN7xhqnwI6c8GHBKJBmiWPHmN/Gf1mmwYNlYA5Tls0D/SMFyIW+Kpjw
	8foQ==
X-Gm-Message-State: AE9vXwOahlWr4X8GiHd1Pk85Yp+Pd6xC+nT4kd3qAOOP7VVwwJd6Hz7+InEzzbIgS1JclQ==
X-Received: by 10.25.196.3 with SMTP id u3mr25555lff.164.1473254595839;
	Wed, 07 Sep 2016 06:23:15 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:15 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:11 +0300
Message-Id: <cover.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v16 00/16] PTimer fixes/features and ARM
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
X-TUID: IeE+iuqKUo4P

Hello,

Currently, QEMU ARM MPTimer device model provides only a certain subset of
the emulation behavior. This patch series is supposed to add missing parts by
converting the MPTimer to use generic ptimer helper. It fixes some important
ptimer bugs and provides new features that are required for the ARM MPTimer.

Changelog:
    V16: Suppressed ptimer warning messages under qtest.

         Added a comment for the default policy in the "include/hw/ptimer.h"

         Patches "Change ptimer_get_count to return "1" for the expired timer"
         and "Fix counter - 1 returned by ptimer_get_count for the active timer"
         are merged and converted into a "no counter round down" ptimer policy.

         Added "hw/timer/arm_mptimer.c" into the "make check" GCOV.

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

    V13-V2: https://lists.gnu.org/archive/html/qemu-arm/2016-05/msg00269.html

Dmitry Osipenko (16):
  hw/ptimer: Actually stop the timer in case of error
  hw/ptimer: Introduce timer policy feature
  tests: Add ptimer tests
  hw/ptimer: Suppress error messages under qtest
  hw/ptimer: Add "wraparound after one period" policy
  tests: ptimer: Add tests for "wraparound after one period" policy
  hw/ptimer: Add "continuous trigger" policy
  tests: ptimer: Add tests for "continuous trigger" policy
  hw/ptimer: Add "no immediate trigger" policy
  tests: ptimer: Add tests for "no immediate trigger" policy
  hw/ptimer: Add "no immediate reload" policy
  tests: ptimer: Add tests for "no immediate reload" policy
  hw/ptimer: Add "no counter round down" policy
  tests: ptimer: Add tests for "no counter round down" policy
  arm_mptimer: Convert to use ptimer
  tests: Add tests for the ARM MPTimer

 hw/arm/musicpal.c              |    2 +-
 hw/core/ptimer.c               |   93 +++-
 hw/dma/xilinx_axidma.c         |    2 +-
 hw/m68k/mcf5206.c              |    2 +-
 hw/m68k/mcf5208.c              |    2 +-
 hw/net/fsl_etsec/etsec.c       |    2 +-
 hw/net/lan9118.c               |    2 +-
 hw/timer/allwinner-a10-pit.c   |    2 +-
 hw/timer/arm_mptimer.c         |  149 +++---
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
 include/hw/ptimer.h            |   43 +-
 include/hw/timer/arm_mptimer.h |    5 +-
 stubs/vmstate.c                |    5 +
 tests/Makefile.include         |    5 +
 tests/ptimer-test-stubs.c      |  107 ++++
 tests/ptimer-test.c            |  717 ++++++++++++++++++++++++++
 tests/ptimer-test.h            |   22 +
 tests/test-arm-mptimer.c       | 1105 ++++++++++++++++++++++++++++++++++++++++
 32 files changed, 2188 insertions(+), 122 deletions(-)
 create mode 100644 tests/ptimer-test-stubs.c
 create mode 100644 tests/ptimer-test.c
 create mode 100644 tests/ptimer-test.h
 create mode 100644 tests/test-arm-mptimer.c

-- 
2.9.3

