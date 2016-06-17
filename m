Received: by 10.25.21.96 with SMTP id l93csp269358lfi;
        Fri, 17 Jun 2016 06:38:29 -0700 (PDT)
X-Received: by 10.200.49.165 with SMTP id h34mr2369719qte.43.1466170709452;
        Fri, 17 Jun 2016 06:38:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w77si31476040qkb.113.2016.06.17.06.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 06:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDtye-0006xX-Rc
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 09:38:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bDten-00033n-Lp
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 09:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bDtei-0002nh-Je
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 09:17:57 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bDtei-0002mM-BQ; Fri, 17 Jun 2016 09:17:52 -0400
Received: by mail-lf0-x243.google.com with SMTP id w130so8334864lfd.2;
	Fri, 17 Jun 2016 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TJxerH+3u9E0WB2wGh98vaDB5QupWWkSJte5OoM1OIE=;
	b=a7pIcYjkYny7pwStPwD48XS64dYm37Do14z776MvYHKm9JSXHvbR5emW7Li9BrJPxg
	eGAEpiEeXGNHPsHtp5yRFsmkklj2lfEIiTc/lCg/dBX5cDXS0AkACZ1WR70rN7z6CMRj
	HlW+ZIJPLf/zwvaBAdASyGm5sOaDCxsIWeaB+qYx1cWD23zeaYEKb7YYjSYeitref8SW
	Bi4q+lQQaUxvAlmWxr8puwuLQUUcnjaPQzDHxHV3BzWRYfclJ0vo6cBBzPdMC3qzR1A5
	uzBjSkFpmT8c+s3ujrtLtLM197dByxLqKc3u9JQ6nUO3570Xpa23o1y7a+iThMyyI3Yi
	Vw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TJxerH+3u9E0WB2wGh98vaDB5QupWWkSJte5OoM1OIE=;
	b=M5l7R9PTGQVUqkefPCY1fGwquLsEx1ZdtYd1K3k7J+yrCpwzX6hfB6Ucs5mp6EzS/l
	t89HBi6pz6L45mpb8IJIRtkE3XWXTCKeInns/O2Yn5r9WbJ5tgH2fBA9KgXNCE7n/+v+
	nnXXEb7K1oy8+7b2zYlk9GAXzWGENQ1qGBEdw2EVAblx8tRtucnBQASLAGBx57w1HF8M
	+dAt4CVYsJS0qnsxFEN0kziBjDfMM4FXkTtoo6U5Q715iDtUnxneMZ9Jfs+Lt7/a9ewT
	hFzAE6rAGzSKsfMbfDR9bHd/cRMxFGqf1SnPEofZfw8/+YDqeYWEHinS89fILmqbd50o
	3ujg==
X-Gm-Message-State: ALyK8tIo2IZTABF3Hq5NwdSD+BdkmXvSqrbdDgtWUvhMF4cPq979AjP9eAAFfrP1tp1EMQ==
X-Received: by 10.25.1.65 with SMTP id 62mr760185lfb.54.1466169471327;
	Fri, 17 Jun 2016 06:17:51 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30])
	by smtp.gmail.com with ESMTPSA id d8sm2538183lbc.29.2016.06.17.06.17.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 06:17:50 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 17 Jun 2016 16:17:25 +0300
Message-Id: <cover.1466167530.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v14 0/3] PTimer fixes/features and ARM MPTimer
 conversion
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
X-TUID: 6SatlqCcIvm8

Hello,

Current QEMU ARM MPTimer device model provides only a certain subset of the
emulation behavior, so this patch series is supposed to add missing parts by
converting the MPTimer to use generic ptimer helper. It fixes some important
ptimer bugs and provides new features that are required for the ARM MPTimer.

Emulation behavior is verified against the real HW by running specially
crafted MPTimer tests in both icount and non-icount modes:

https://gist.github.com/digetx/dbd46109503b1a91941a

Changelog:

    I ommitted old changelog since the rest of the precursor ptimer patches
    already been applied and the ARM MPTimer patch has Peter's Crosthwaite r-b.

    V14: Set the ptimer policy in the ptimer_init() instead of adding
         ptimer_set_policy(), keeping ptimer VMState unchanged and dropped
         hw_error() hardening asserts as per Peter's Maydell V13 review
         comments, addressed the rest of the review comments.

Dmitry Osipenko (3):
  hw/ptimer: Support running with counter = 0 by introducing new policy
    feature
  hw/ptimer: Fix counter - 1 returned by ptimer_get_count for the active
    timer
  arm_mptimer: Convert to use ptimer

 hw/arm/musicpal.c              |   2 +-
 hw/core/ptimer.c               |  49 ++++++++-------
 hw/dma/xilinx_axidma.c         |   2 +-
 hw/m68k/mcf5206.c              |   2 +-
 hw/m68k/mcf5208.c              |   2 +-
 hw/net/fsl_etsec/etsec.c       |   2 +-
 hw/net/lan9118.c               |   2 +-
 hw/timer/allwinner-a10-pit.c   |   2 +-
 hw/timer/arm_mptimer.c         | 133 +++++++++++++++++++++--------------------
 hw/timer/arm_timer.c           |   2 +-
 hw/timer/aspeed_timer.c        |   2 +-
 hw/timer/digic-timer.c         |   2 +-
 hw/timer/etraxfs_timer.c       |   6 +-
 hw/timer/exynos4210_mct.c      |   7 ++-
 hw/timer/exynos4210_pwm.c      |   2 +-
 hw/timer/exynos4210_rtc.c      |   4 +-
 hw/timer/grlib_gptimer.c       |   2 +-
 hw/timer/imx_epit.c            |   4 +-
 hw/timer/imx_gpt.c             |   2 +-
 hw/timer/lm32_timer.c          |   2 +-
 hw/timer/milkymist-sysctl.c    |   4 +-
 hw/timer/puv3_ost.c            |   2 +-
 hw/timer/sh_timer.c            |   2 +-
 hw/timer/slavio_timer.c        |   2 +-
 hw/timer/xilinx_timer.c        |   2 +-
 include/hw/ptimer.h            |   7 ++-
 include/hw/timer/arm_mptimer.h |   5 +-
 27 files changed, 133 insertions(+), 122 deletions(-)

-- 
2.9.0

