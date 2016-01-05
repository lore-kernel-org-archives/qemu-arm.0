Received: by 10.182.158.201 with SMTP id ww9csp10896961obb;
        Mon, 4 Jan 2016 18:37:38 -0800 (PST)
X-Received: by 10.55.77.202 with SMTP id a193mr119432830qkb.48.1451961458083;
        Mon, 04 Jan 2016 18:37:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s67si1967973qhs.12.2016.01.04.18.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jan 2016 18:37:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGHVB-0003lC-Jt
	for alex.bennee@linaro.org; Mon, 04 Jan 2016 21:37:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGHUe-00036Z-VD
	for qemu-devel@nongnu.org; Mon, 04 Jan 2016 21:37:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGHUb-000134-Mh
	for qemu-devel@nongnu.org; Mon, 04 Jan 2016 21:37:04 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:34410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGHUb-00012z-EN; Mon, 04 Jan 2016 21:37:01 -0500
Received: by mail-lb0-x241.google.com with SMTP id jk7so13895348lbc.1;
	Mon, 04 Jan 2016 18:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MeHHff45RZO++32GnQR2+4XEjh9BKi4hTF+9dUFRbAk=;
	b=DpWrXCLo4bEZHbWCyKEL8VbIrzFq8KqDGswfW3zCTWdC1lw4syRGyZxP0DP5vFDiTe
	cA+MVbUNJyq7HGFUgw7f962fUHtUaEJ6/E8G8Jo5j5IhMsdq06sjGJB4p23VcxT1P7gh
	8xwDqZmSrXXnRnaCO4HoHTLGGN4L8H2tZ3s4U3Ou+bli4T+lcAMdVKYVHjxacGMakcHp
	mdLtyWUnjlJJLRZGcrZf4g9cJJkVf1ff/BgtCrjpMxrqWUQ48kdCaabnZSP+rSnXYafc
	KI1sc8pYK/K/7dTwAoM/QyuSghIDjzkrbS2mC8VeWGLpRhQtgDRxQ/D+I1ShRaDXFTAk
	cAJQ==
X-Received: by 10.112.181.196 with SMTP id dy4mr15876643lbc.42.1451961420440; 
	Mon, 04 Jan 2016 18:37:00 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	d2sm16008201lbc.11.2016.01.04.18.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 18:36:59 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Tue,  5 Jan 2016 05:33:25 +0300
Message-Id: <cover.1451960508.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v8 0/4] PTimer fixes and ARM MPTimer conversion
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
X-TUID: 7Pm/dmE9M5dH

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

