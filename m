Received: by 10.25.159.19 with SMTP id i19csp899115lfe;
        Fri, 12 Feb 2016 07:51:01 -0800 (PST)
X-Received: by 10.140.235.137 with SMTP id g131mr2950343qhc.43.1455292261204;
        Fri, 12 Feb 2016 07:51:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37si16323672qgt.88.2016.02.12.07.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFzo-0004GM-EN
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:51:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUFzg-0004D7-7p
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUFzf-0006zX-E9
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:50:52 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUFzc-0006wv-TU; Fri, 12 Feb 2016 10:50:49 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUFhM-0007tL-0T; Fri, 12 Feb 2016 15:31:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 15:31:51 +0000
Message-Id: <1455291115-30305-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-arm] [PATCH v2 0/4] target-arm: Clean up trap/undef handling
	of SRS
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
X-TUID: +PUyUyriMp9d

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

Changes v1->v2: drop the user-mode-only assertions from the
get_/set_r13_banked() functions as suggested in review.

These have all now been reviewed so I'm just sending them out
to the list for completeness -- I'll put the patches in
target-arm.next in a moment.


thanks
-- PMM


Peter Maydell (4):
  target-arm: Clean up trap/undef handling of SRS
  target-arm: Move get/set_r13_banked() to op_helper.c
  target-arm: Combine user-only and softmmu get/set_r13_banked()
  target-arm: UNDEF in the UNPREDICTABLE SRS-from-System case

 target-arm/helper.c    | 33 -------------------------
 target-arm/op_helper.c | 26 ++++++++++++++++++++
 target-arm/translate.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 88 insertions(+), 38 deletions(-)

-- 
1.9.1

