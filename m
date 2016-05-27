Received: by 10.25.27.66 with SMTP id b63csp274674lfb;
        Fri, 27 May 2016 10:04:59 -0700 (PDT)
X-Received: by 10.55.20.208 with SMTP id 77mr9491998qku.124.1464368699493;
        Fri, 27 May 2016 10:04:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h3si18333648qtd.74.2016.05.27.10.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LBy-0002QC-Ob
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:04:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBq-0002NO-Mx
	for qemu-arm@nongnu.org; Fri, 27 May 2016 13:04:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBp-0003pw-7G
	for qemu-arm@nongnu.org; Fri, 27 May 2016 13:04:50 -0400
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:35072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBk-0003oC-16; Fri, 27 May 2016 13:04:44 -0400
Received: by mail-lb0-x244.google.com with SMTP id sh2so6034726lbb.2;
	Fri, 27 May 2016 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Eh0FJDAx1urnEmzTWKdlHipMOpOGrQEsc1hOXG0zH1Q=;
	b=1H899Hy2oaJ8UafqPkoWuiZE49x10VvGd5bTkQdNuN1tFAZaZrkAN5AsdtL8EJOQvl
	U8XK4ACV7PF6n/hP5KKGzc44SXn1+56UACmCNx+5ajiLZtYsX+qSgdC1r+NeIhttfBg1
	x6aJbp+W+k8j7gS1kXj/nFDCZkmFnVaAbgNiqY8ZiJprSZ7S16lqUre6sH4pyHVVoHsO
	7JXiQKgs1QOf7T0VyI2CSdxy4Ju7LjSUm9gfK3CXBgSb0EA9MOumC+yCCBLjz2qiQBxd
	lvCybRAglFfCbkEQoyrYPUB/t1QPUjI6yT9jm92RfWH3QSzT9dFj5f24w8u79sioGgif
	mGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Eh0FJDAx1urnEmzTWKdlHipMOpOGrQEsc1hOXG0zH1Q=;
	b=RHtU006UKYR6G0kmL/WvfMePQm7diHV9fMliPF6IfZCNWxlGMdtB4iDjA7P2zX+lNx
	tRIEzH2wR5BWC/4JbmtRTfKhO1eH4OF9gVT2R6wqgeUONbfsR1bS0FRfgSD4dtmPDEA+
	fEWxoqBFOWIx/IQenDHT2LNNEFroPWTLkoA1WVSQ+UsQvmIbiA2y6jBCk1Jc1v+oM2yQ
	X7hU8Sle2aM+kzKkbS4pZ6JHsBctQSQ9tcAzeuQ/2V+tx+asu31x94Ja2n1NAuyTX/ph
	3GKwIKSI+ICvQlCrE73ByfYga16v9ULQbd5MFnK8Qx1hLMd53n141rkxgKMK1mkXp1Z6
	xBoA==
X-Gm-Message-State: ALyK8tJJcecz2u0RMeFI028ntz3i63TOqGIew0BxLzJ5cvXmWiHj/XsHJeSC/ac4NP0YNQ==
X-Received: by 10.112.147.65 with SMTP id ti1mr4428738lbb.81.1464368682719;
	Fri, 27 May 2016 10:04:42 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:42 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:28 +0300
Message-Id: <cover.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Subject: [Qemu-arm] [PATCH v13 0/8] PTimer fixes/features and ARM MPTimer
 conversion
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EV88xP6rEV4Y

Hello,

Current QEMU ARM MPTimer device model provides only a certain subset of the
emulation behavior, so this patch series is supposed to add missing parts by
converting the MPTimer to use generic ptimer helper. It fixes some important
ptimer bugs and provides new features that are required for the ARM MPTimer.

Emulation behavior is verified against the real HW by running specially
crafted MPTimer tests in both icount and non-icount modes:

https://gist.github.com/digetx/dbd46109503b1a91941a


Changelog for the ARM MPTimer QEMUTimer to ptimer conversion:

    V2: Fixed changing periodic timer counter value "on the fly". I added a
        test to the gist to cover that issue.

    V3: Fixed starting the timer with load = 0 and counter != 0, added tests
        to the gist for this issue. Changed vmstate version for all VMSD's,
        since loadvm doesn't check version of nested VMSD.

    V4: Fixed spurious IT bit set for the timer starting in the periodic mode
        with counter = 0. Test added.

    V5: Code cleanup, now depends on ptimer_set_limit() fix.

    V6: No code change, added test to check ptimer_get_count() with corrected
        .limit value.

    V7: No change.

    V8: No change.

    V9: No change.

    V10: Correctly handle cases when counter = load = 0 and prescaler != 0,
         i.e. triggering interrupt in that case. Call ptimer_* only when
         certain MPTimer state was changed, like prescaler change. Factor out
         timerblock_set_count from timerblock_run and inline both.
         Tests updated.

    V11: Fixed missed periodic timer stopping on setting counter => 0 with
         load = 0 and prescaler = 0.

    v12: Timer isn't doing uninterruptible IRQ, but ticks continuously.
         On setting counter/load to 0 with prescaler != 0, timer would trigger
         IRQ after one period. Verified on real HW, tests updated.

    v13: Rebased on recent master, use new ptimer policy feature.

Patches for ptimer are introduced since V5 of "ARM MPTimer conversion".

Changelog for the ptimer patches:

    V5: Only fixed ptimer_set_limit() for the disabled timer.

    V6: As was pointed by Peter Maydell, there are other issues beyond
        ptimer_set_limit(), so V6 supposed to cover all those issues.

    V7: Added accidentally removed !use_icount check.
        Added missed "else" statement.

    V8: Adjust period instead of the limit and do it for periodic timer only
        (.limit adjusting bug). Added patch/fix for freq/period change and
        ptimer_get_count() improvement.

    V9: Don't do wrap around if counter == 0, otherwise polled periodic
        timer won't ever return counter = 0.

    V10: Addressed V8/9 review comments.
         Adjust timer period based on delta instead of limit.
         Don't wrap around when in icount mode.
         New patches: "on the fly" mode switch, silence error msg when
                      delta = load = 0, introduce ptimer_get_limit.

    V11: Dropped timer tick from "Perform tick and counter wrap around if
         timer already expired" patch since it would cause bogus tick after
         QEMU been reset if ptimer was stopped and it's QEMUtimer expired
         during reset.
         Patch "Legalize running with delta = load = 0" now explicitly
         forbids period = 0.

    v12: Fixed missed abort on setting freq > 1000000000.
         New patches:
            "Fix counter - 1 returned by ptimer_get_count for the active timer"
            "Perform delayed tick instead of immediate if delta = 0"

    v13: Squashed the following two patches from v12:

        hw/ptimer: Legalize running with delta = load = 0 and abort on period = 0
        hw/ptimer: Perform delayed tick instead of immediate if delta = 0

        into

        hw/ptimer: Support running with counter = 0 by introducing new policy feature

        The second patch has no r-b, I omitted Peter's Crosthwaite r-b from the
        first patch. I think it's not valid now, otherwise please let me know.

Dmitry Osipenko (8):
  hw/ptimer: Fix issues caused by the adjusted timer limit value
  hw/ptimer: Perform counter wrap around if timer already expired
  hw/ptimer: Update .delta on period/freq change
  hw/ptimer: Support "on the fly" timer mode switch
  hw/ptimer: Introduce ptimer_get_limit
  hw/ptimer: Support running with counter = 0 by introducing new policy
    feature
  hw/ptimer: Fix counter - 1 returned by ptimer_get_count for the active
    timer
  arm_mptimer: Convert to use ptimer

 hw/core/ptimer.c               | 131 ++++++++++++++++++++++++---------------
 hw/timer/arm_mptimer.c         | 135 ++++++++++++++++++++++-------------------
 include/hw/ptimer.h            |   7 +++
 include/hw/timer/arm_mptimer.h |   5 +-
 4 files changed, 162 insertions(+), 116 deletions(-)

-- 
2.8.3

