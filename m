Received: by 10.80.163.71 with SMTP id 65csp1171881edn;
        Sun, 2 Oct 2016 09:10:02 -0700 (PDT)
X-Received: by 10.55.106.134 with SMTP id f128mr16092536qkc.309.1475424602762;
        Sun, 02 Oct 2016 09:10:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18si18478543qtc.24.2016.10.02.09.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjL0-0001kU-3a
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:10:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC4-0002gx-2F
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 12:00:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC2-0003JL-Cm
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 12:00:47 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjBw-0003Fc-Tz; Sun, 02 Oct 2016 12:00:41 -0400
Received: by mail-lf0-x243.google.com with SMTP id p80so146905lfp.1;
	Sun, 02 Oct 2016 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=34DRyAr+kKtNVSfG7CY2wmXhb7BRB2i6wwMN9AENHBY=;
	b=nhyvIcPaLnfdzls9jm5j82Mh229qQmvCV+98fbyV93NVpsKR2WDidD0pfhiM+6PlU9
	2thFuR1C78GOoAIh2/t51JMQ8ZfVem9ZQArWbYYhGvrXzsZjanevXYLD1oPuaAI+g5yG
	1W0ZAxp7sIxD1UEXKhwNz/qIYUtGp+RiKl3hDfcVss1GjOuGGDIE0EDQritzVSvVPJsb
	JmOLlh8IiVVX+OJUdDOI2ZIgiTuNDrtp8wA8QLaGo2qTl/4gt1+9VxGDXDsVH8ITqDjG
	DjC34ogCUGCbcVXgJ42TT/owhUaqihrxd9qRL+7p7A901rDJXcvHen2wjH+x8vlaYpCe
	duQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=34DRyAr+kKtNVSfG7CY2wmXhb7BRB2i6wwMN9AENHBY=;
	b=XBU8cNTa6l2pOOcHRggVixFOSd8BoED1QPna04bWTj0vy9rJlmvaJGTSwMrBbixbsZ
	o1naBFQ6fGydzUPAWxqXgDuGZsRwAAT+tmwqxopiX5uwkSVVFsJsDU59EI70b2Pk5H4Q
	Mw9OKc+FloNJ1Hp2AOvgDM7ze0K3m0gmGJwwB2Z3o5c/EhbeXPVF1WekfcLYFG+n4E6S
	Yi3gGu+q77SjC6KEHUCKpDNQ3gutgqy/uZtT1MU+UAXY1Y7R2/OhfQNtno5KHuiJgD5l
	6zwn841Ojxxe0zYp/+61D2YIvTTXhglCxqlmALekNfYabFlXxqpjz6rnoECZMGszNkFp
	2Vuw==
X-Gm-Message-State: AA6/9RnmaUmgOERSWpArmVkPXZv/73gy31N97l9KLJIlBMEEwvvNEcTEDIQvvPr/7NcYxQ==
X-Received: by 10.25.136.198 with SMTP id k189mr6291469lfd.132.1475424008895; 
	Sun, 02 Oct 2016 09:00:08 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:08 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:32 +0300
Message-Id: <cover.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-arm] [PATCH v17 00/14] PTimer fixes/features and ARM MPTimer
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
X-TUID: ajVegJfpoaq6

Hello,

Currently, QEMU ARM MPTimer device model provides only a certain subset of
the emulation behavior. This patch series is supposed to add missing parts by
converting the MPTimer to use generic ptimer helper. It fixes some important
ptimer bugs and provides new features that are required for the ARM MPTimer.

WARNING! I based V17 on top of the Paolo's patch [0], however I don't see
the original mail of that patch on the ML nor in patches/patchew.

[0] https://lists.nongnu.org/archive/html/qemu-devel/2016-09/msg06734.html

Changelog:
    V17: Extended ptimer tests uncovered the ptimer issues mentioned below,
         changed the copyright text as Eric Blake suggested in the comment
         to V16.

         Ptimer policies patches cleaned a bit (should be a bit easier to
         review, hopefully), added more comments, some fixes:

         "wraparound after one period" now does what it claims without the
         "no counter round down" policy.

         "no immediate reload" policy won't trigger twice, on setting
         counter to 0 and after the reload, if the "no immediate trigger"
         policy not used.

         If "continuous trigger" policy is used and periodic timer starts
         to run with counter != 0, it won't stop on reaching 0. It was hidden
         by some other policy.

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

Dmitry Osipenko (14):
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
  tests: ptimer: Change the copyright comment
  tests: ptimer: Replace 10000 with 1
  arm_mptimer: Convert to use ptimer
  tests: Add tests for the ARM MPTimer

 hw/core/ptimer.c               |  130 ++++-
 hw/timer/arm_mptimer.c         |  149 +++---
 include/hw/ptimer.h            |   20 +
 include/hw/timer/arm_mptimer.h |    5 +-
 tests/Makefile.include         |    3 +
 tests/ptimer-test-stubs.c      |    2 +-
 tests/ptimer-test.c            |  362 ++++++++++---
 tests/ptimer-test.h            |    2 +-
 tests/test-arm-mptimer.c       | 1105 ++++++++++++++++++++++++++++++++++++++++
 9 files changed, 1616 insertions(+), 162 deletions(-)
 create mode 100644 tests/test-arm-mptimer.c

-- 
2.9.3

