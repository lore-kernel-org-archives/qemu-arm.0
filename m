Received: by 10.182.158.201 with SMTP id ww9csp11163230obb;
        Tue, 5 Jan 2016 05:47:33 -0800 (PST)
X-Received: by 10.140.93.77 with SMTP id c71mr88016774qge.46.1452001653801;
        Tue, 05 Jan 2016 05:47:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si42941582qgf.53.2016.01.05.05.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jan 2016 05:47:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGRxV-0007HX-I3
	for alex.bennee@linaro.org; Tue, 05 Jan 2016 08:47:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGRvM-0004Po-Rv
	for qemu-devel@nongnu.org; Tue, 05 Jan 2016 08:45:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGRvJ-0004Ot-Lk
	for qemu-devel@nongnu.org; Tue, 05 Jan 2016 08:45:20 -0500
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234]:34728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGRvJ-0004Oj-DB; Tue, 05 Jan 2016 08:45:17 -0500
Received: by mail-lf0-x234.google.com with SMTP id y184so294126814lfc.1;
	Tue, 05 Jan 2016 05:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xzWHN8IVkIEDojh/z+ynpL9wIzIHbNU71oiTYzGxIcA=;
	b=qmodiZFjTISYdyPmCgQYmumMjGz0hjWAXMOs8wOiz+ujZsXiY7c3WBEuY1+4FpWjX/
	y+SykT8Q1xNiue1Q08bK3S7QgfktEjC8JohEhlawGwvDKLnXQRG/KO9XCP33MM2q+p0O
	VzOqxwnXztwwO+KkPG6hcvxco34oCxnEtiQ1pRlSPtmtm9vB/1XJHagasM8tfAg6fEhm
	wYqvKu7OMR+ILWHZbQZ0lnJWP6ynGeymiu0azzttvd5/Qobozhz8JeE/W1h5EGd2BWeX
	GB44olk5l7p2z5xPCiVzwz3ysC5e4lO3NA86gaSkihQF+ApzyjECcQZsUgH+dT1QpieZ
	AmbA==
X-Received: by 10.25.44.205 with SMTP id s196mr15346985lfs.0.1452001516602;
	Tue, 05 Jan 2016 05:45:16 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b10sm14750850lbd.17.2016.01.05.05.45.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 05:45:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Tue,  5 Jan 2016 16:44:22 +0300
Message-Id: <cover.1452001370.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v9 0/4] PTimer fixes and ARM MPTimer conversion
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
X-TUID: juzzmxDYw+vQ

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

ARM MPTimer tests: https://gist.github.com/digetx/dbd46109503b1a91941a


Patch for ptimer is introduced since V5 of "ARM MPTimer conversion".

Changelog for the "ptimer fixes" patch:

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

Dmitry Osipenko (4):
  hw/ptimer: Fix issues caused by the adjusted timer limit value
  hw/ptimer: Perform tick and counter wrap around if timer already
    expired
  hw/ptimer: Update .delta on period/freq change
  arm_mptimer: Convert to use ptimer

 hw/core/ptimer.c               |  94 ++++++++++++++++++++++++-----------
 hw/timer/arm_mptimer.c         | 110 ++++++++++++++++++-----------------------
 include/hw/timer/arm_mptimer.h |   4 +-
 3 files changed, 115 insertions(+), 93 deletions(-)

-- 
2.6.4

