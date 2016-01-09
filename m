Received: by 10.25.134.130 with SMTP id i124csp1101473lfd;
        Sat, 9 Jan 2016 09:45:21 -0800 (PST)
X-Received: by 10.140.159.194 with SMTP id f185mr15845039qhf.72.1452361521852;
        Sat, 09 Jan 2016 09:45:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n61si91307200qge.38.2016.01.09.09.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 09:45:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHxZp-0007tK-E3
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 12:45:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXM-0003Ha-55
	for qemu-devel@nongnu.org; Sat, 09 Jan 2016 12:42:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXH-0000fr-2p
	for qemu-devel@nongnu.org; Sat, 09 Jan 2016 12:42:48 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHxXG-0000fc-QG; Sat, 09 Jan 2016 12:42:42 -0500
Received: by mail-lf0-x242.google.com with SMTP id c134so2046146lfb.2;
	Sat, 09 Jan 2016 09:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NuW7JRIrhVBR4Kih4xgJj4t7QSeM4VGo/ka/Qbl/0qs=;
	b=dGyGOFZRuYl5zDLzC4UysId/8ZQF0O83PZ/fI6HpKa3fNhfs8zxx9GEk2vowgkgAJ0
	cA+Bys7ZHSoEs2Fn5QKE8l3dJPAvMH8fhexo2PpZ66f7MUuQsDbJKlo4PXtoixcK98oX
	FCz+fjShZlD/+/IVDRvxoUBmnfE8JpJ6jShs/4L6RRWMXAZSRpoUQhdjp5stQ0qzSP2z
	AsFNKIRUi3ygs+OVk+k1BrYQQsaSECUjSNDDWopCJJdXU41Bu7Hbq7PpzPoWCbW6ikb/
	wMbIvSpjxzdv0WAjaabixFdx8JXFiMrfWC7bgaN9Ib93TDI8MkWTAO9PHHhb+Lndx5G/
	zOcQ==
X-Received: by 10.25.148.141 with SMTP id w135mr17917326lfd.137.1452361361832; 
	Sat, 09 Jan 2016 09:42:41 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	f186sm8406450lfd.26.2016.01.09.09.42.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 09:42:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat,  9 Jan 2016 20:39:48 +0300
Message-Id: <cover.1452359845.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v10 0/7] PTimer fixes/features and ARM MPTimer
	conversion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XcOieRtu8F5I

Changelog for ARM MPTimer QEMUTimer to ptimer conversion:

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

ARM MPTimer tests: https://gist.github.com/digetx/dbd46109503b1a91941a


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

Dmitry Osipenko (7):
  hw/ptimer: Fix issues caused by the adjusted timer limit value
  hw/ptimer: Perform tick and counter wrap around if timer already
    expired
  hw/ptimer: Update .delta on period/freq change
  hw/ptimer: Support "on the fly" timer mode switch
  hw/ptimer: Legalize running with delta = load = 0
  hw/ptimer: Introduce ptimer_get_limit
  arm_mptimer: Convert to use ptimer

 hw/core/ptimer.c               | 109 +++++++++++++++++++++++------------
 hw/timer/arm_mptimer.c         | 127 ++++++++++++++++++++---------------------
 include/hw/ptimer.h            |   1 +
 include/hw/timer/arm_mptimer.h |   5 +-
 4 files changed, 137 insertions(+), 105 deletions(-)

-- 
2.6.4

