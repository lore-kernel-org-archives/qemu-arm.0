Received: by 10.25.159.19 with SMTP id i19csp3908516lfe;
        Thu, 21 Jan 2016 11:04:56 -0800 (PST)
X-Received: by 10.140.43.69 with SMTP id d63mr53711316qga.18.1453403096472;
        Thu, 21 Jan 2016 11:04:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 100si2678477qgx.37.2016.01.21.11.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 11:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMKXP-0007b4-Ql
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 14:04:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXM-0007UR-EV
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 14:04:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXL-0001Ey-4a
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 14:04:52 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:35611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aMKXE-0001AE-Rw; Thu, 21 Jan 2016 14:04:45 -0500
Received: by mail-lb0-x241.google.com with SMTP id dx9so2488442lbc.2;
	Thu, 21 Jan 2016 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3FpLbzMc3xNg8E2wHBlTmjjBQTYHykzXinDPf3gQRgA=;
	b=KCZFsuzyVfMulbdooZiynmf2ZgGkkbSHWkmcMqZF73N6T545waFcc4S818W/1oyyzo
	WV9Tr37oO8+QKA1g59FNWDII3KPnqXlHNg8HHUGkb2SWJ1gbD4b1TosqLqG6rjAfomOr
	IQtvzGkVuuMpBpQ0IFbRa+ZVyycPdqlnmuf0kTGZI1W1ZcUiu2PeKmExwUUhvxy/L2gS
	HidLLKCZI/yn0/5aiUP3bzX6Ls/vGKa6LYz96v7r6f/LJ2H2vqvht+0TrsNxGbNiPonK
	vLdUkguCRja/OYak9KltArl3Nb6GYERxRWjBgNkR1aIN6csnmcMsp+JwbyLEbu/RBDr4
	emTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3FpLbzMc3xNg8E2wHBlTmjjBQTYHykzXinDPf3gQRgA=;
	b=BSvyiltH92sNlqwRMnoxVBnK8UcoyfrQUBjDoBJ5zzofb5smAdYOHkpf483bQ1hv1V
	gtjX+UPztjNmuGYGhA2k8ZbIqI5idvTMKBwkhxtwtAUvgFxkesmoCj1wVufyAXu2PAW4
	Xc8/bYVTat5e8TvOwDt0cGSW0D91+LaAcycZeUt22N4qITACL24bnaT1GQbvO79HxSWG
	BgCOmLyDNQEtLHkEp1Nub8H/hBi8yVHBTH8TMefvRUgeG7mSLejDsUIadgSMtrKqV0s1
	jKrWEDpndzKd1S32fkAkYjng6VfTgsFn+L1mOAYlMkN1u8zsVaw0bVAklyqDmLJ+cyAc
	r6kQ==
X-Gm-Message-State: ALoCoQnRcAy0RGpx4qMc0Z/FlV4zQx8VMnf3Xz0F94C4gYT4avU1MLCgejWVXo8fyWA6w3hHxuQCWkIaSP/5a179IiEbOsF46w==
X-Received: by 10.112.132.66 with SMTP id os2mr16605871lbb.111.1453403082643; 
	Thu, 21 Jan 2016 11:04:42 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163])
	by smtp.gmail.com with ESMTPSA id m21sm382496lfe.29.2016.01.21.11.04.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 11:04:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jan 2016 22:03:43 +0300
Message-Id: <cover.1453402860.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-arm] [PATCH v11 0/7] PTimer fixes/features and ARM MPTimer
	conversion
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Hnvkz0s/nd8N

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

    V11: Fixed missed periodic timer stopping on setting counter => 0 with
         load = 0 and prescaler = 0.

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

    V11: Dropped timer tick from "Perform tick and counter wrap around if
         timer already expired" patch since it would cause bogus tick after
         QEMU been reset if ptimer was stopped and it's QEMUtimer expired
         during reset.
         Patch "Legalize running with delta = load = 0" now explicitly
         forbids period = 0.

Dmitry Osipenko (7):
  hw/ptimer: Fix issues caused by the adjusted timer limit value
  hw/ptimer: Perform counter wrap around if timer already expired
  hw/ptimer: Update .delta on period/freq change
  hw/ptimer: Support "on the fly" timer mode switch
  hw/ptimer: Introduce ptimer_get_limit
  hw/ptimer: Legalize running with delta = load = 0 and abort on period
    = 0
  arm_mptimer: Convert to use ptimer

 hw/core/ptimer.c               | 111 ++++++++++++++++++++--------------
 hw/timer/arm_mptimer.c         | 131 +++++++++++++++++++++--------------------
 include/hw/ptimer.h            |   1 +
 include/hw/timer/arm_mptimer.h |   5 +-
 4 files changed, 135 insertions(+), 113 deletions(-)

-- 
2.7.0

