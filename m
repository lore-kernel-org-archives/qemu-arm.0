Received: by 10.25.159.19 with SMTP id i19csp402967lfe;
        Thu, 11 Feb 2016 11:24:16 -0800 (PST)
X-Received: by 10.140.95.119 with SMTP id h110mr58379153qge.105.1455218656138;
        Thu, 11 Feb 2016 11:24:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si11055407qki.76.2016.02.11.11.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 11:24:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTwqd-0003QJ-H6
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 14:24:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTwpT-0001Qh-It
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 14:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTwpS-0006XA-Iu
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 14:23:03 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTwpQ-0006W4-Gz; Thu, 11 Feb 2016 14:23:00 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTweb-0007NH-GD; Thu, 11 Feb 2016 19:11:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 19:11:45 +0000
Message-Id: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 0/4] target-arm: Clean up trap/undef handling of
	SRS
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
X-TUID: 53Medr1rBGjZ

The SRS instruction is a bit of an oddity because it isn't
used by Linux these days. Nonetheless it has a bunch of
UNPREDICTABLE, UNDEF and trapping behaviour that we weren't
correctly implementing:

 - trap to EL3 if EL3 is AArch64 and we are at Secure EL1
 - UNDEFINED in Hyp mode
 - UNPREDICTABLE in User or System mode
 - UNPREDICTABLE if the specified mode is:
 -- not implemented
 -- not a valid mode number
 -- a mode that's at a higher exception level
 -- Monitor, if we are Non-secure

This series implements the checks we were missing and makes
us UNDEF for all the UNPREDICTABLE cases.

Patch 1 does the easy checks that can be done at translate time;
patches 2 and 3 are code motion in preparation for patch 4, which
puts in a run-time check for the one awkward case we don't have
enough information to UNDEF at translate time.

thanks
-- PMM

Peter Maydell (4):
  target-arm: Clean up trap/undef handling of SRS
  target-arm: Move get/set_r13_banked() to op_helper.c
  target-arm: Combine user-only and softmmu get/set_r13_banked()
  target-arm: UNDEF in the UNPREDICTABLE SRS-from-System case

 target-arm/helper.c    | 33 -------------------------
 target-arm/op_helper.c | 32 ++++++++++++++++++++++++
 target-arm/translate.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 94 insertions(+), 38 deletions(-)

-- 
1.9.1

