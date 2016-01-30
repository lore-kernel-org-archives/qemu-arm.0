Received: by 10.25.159.19 with SMTP id i19csp1541766lfe;
        Sat, 30 Jan 2016 08:48:46 -0800 (PST)
X-Received: by 10.55.192.7 with SMTP id o7mr18234885qki.93.1454172526861;
        Sat, 30 Jan 2016 08:48:46 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l73si2063276qhc.94.2016.01.30.08.48.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:48:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYha-0003oL-C5
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:48:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgg-0002WI-KK
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgc-0002CK-J3
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:50 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:36538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgc-0002BN-4i; Sat, 30 Jan 2016 11:47:46 -0500
Received: by mail-lb0-x242.google.com with SMTP id zr1so1519281lbb.3;
	Sat, 30 Jan 2016 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=i2OUfy7WdWYk6gA0Wgylw8xe5H2vki3EgggP4sY6gTQ=;
	b=qaNgXPfeBekzO+PDKRgTouHYgnRDH9mXeEOPslE45H+SNpI3kih3NJhms1K9lUyn7x
	dCWb/shkpSmM144eViCX+vGPN+5jLCqDFvSF6O3JnppbEBbkiiU+l0owE3rpCqXmvLTF
	KSOxaZCF7XOxXr7vTXtCQMes06rk0fcuPlS68oDeaKkjdCAU57z+zgJmFiBIhSkY4LbJ
	ZpyOg6HMc9JIVFRR7mtWCMMwbHvPSbRoQsKjuWSKcSOkoye0iyP/IxuiBulql5D9SDfr
	AmVDiILrD71OTCueXH3dZFWakYyiDGjNz5Tvqr23uE1hJs2n1nw0CvePiZlCGRvxnUh8
	ZvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i2OUfy7WdWYk6gA0Wgylw8xe5H2vki3EgggP4sY6gTQ=;
	b=frErfcQt+q7a2fTZot8uWsGJ62JZPEJSaIpGnkMOUg3Rqz3lFY8XkRC0mH7VoprWJJ
	/Dl/YDtJ9BfLON/rjFy2pvzonVTBQUHdPplWkKoNhZCnNusk9QG1e5lu19hfxIlpzoqT
	QHqcd5n/HIzyownKjYL3NBeuwqiABo+Pp1NSSux1tlxB8hdA1ZpGw3TQ5VPUPjrXNuIH
	53dHoEdqAe5Irhuhl8WDVMpFSbGrmQnssf9HIY3UkVWpO4YOlmR/dsQZYaBP2hABqG7O
	2AS/8vzshFiegbfMy/c52i13uIRgMokie6U9WLTXVdtK9Bt4ZL9VIxx5VNeXFwIBXJfK
	BVwg==
X-Gm-Message-State: AG10YOR/nuaKduUAkzDtu3nhCCxTKd7Z+1vhdc1AbFzgT4OZoSLwA2HSjHZDNxQZMk9Syw==
X-Received: by 10.112.134.70 with SMTP id pi6mr4555766lbb.59.1454172465079;
	Sat, 30 Jan 2016 08:47:45 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:09 +0300
Message-Id: <cover.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v12 0/9] PTimer fixes/features and ARM MPTimer
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
X-TUID: +uzru+xvoB0l

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

    v12: Timer isn't doing uninterruptible IRQ, but ticks continuously.
         On setting counter/load to 0 with prescaler != 0, timer would trigger
         IRQ after one period. Verified on real HW, tests updated.

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

    v12: Fixed missed abort on setting freq > 1000000000.
         New patches:
            "Fix counter - 1 returned by ptimer_get_count for the active timer"
            "Perform delayed tick instead of immediate if delta = 0"

Dmitry Osipenko (9):
  hw/ptimer: Fix issues caused by the adjusted timer limit value
  hw/ptimer: Perform counter wrap around if timer already expired
  hw/ptimer: Update .delta on period/freq change
  hw/ptimer: Support "on the fly" timer mode switch
  hw/ptimer: Introduce ptimer_get_limit
  hw/ptimer: Legalize running with delta = load = 0 and abort on period
    = 0
  hw/ptimer: Fix counter - 1 returned by ptimer_get_count for the active
    timer
  hw/ptimer: Perform delayed tick instead of immediate if delta = 0
  arm_mptimer: Convert to use ptimer

 hw/core/ptimer.c               | 114 ++++++++++++++++++++---------------
 hw/timer/arm_mptimer.c         | 133 +++++++++++++++++++++--------------------
 include/hw/ptimer.h            |   1 +
 include/hw/timer/arm_mptimer.h |   5 +-
 4 files changed, 138 insertions(+), 115 deletions(-)

-- 
2.7.0

