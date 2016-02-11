Received: by 10.25.159.19 with SMTP id i19csp312982lfe;
        Thu, 11 Feb 2016 08:23:09 -0800 (PST)
X-Received: by 10.55.74.209 with SMTP id x200mr56755045qka.106.1455207789039;
        Thu, 11 Feb 2016 08:23:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z136si10190165qhd.112.2016.02.11.08.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 08:23:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTu1M-0007sB-Ci
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 11:23:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTu1J-0007o8-42
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 11:23:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTu1I-0005If-9R
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 11:23:05 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:41147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTu1D-0005GI-Av; Thu, 11 Feb 2016 11:22:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTtiL-0007IJ-Dx; Thu, 11 Feb 2016 16:03:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 16:03:23 +0000
Message-Id: <1455206609-28009-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.146
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH v2 0/6] target-arm: Implement various EL3 traps
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
X-TUID: z5qmugYQYHvG

This patchset fixes or implements a lot of traps to EL3 as
listed in the ARM ARM section D1.15.4 "EL3 configurable controls".
Most of the rest we already had implemented.

NB: where the trap I was implementing for EL3 had an
obvious equivalent in EL2 I included the EL2 check in this
series, but I haven't attempted to implement traps which are
only EL2 and not EL3.

Changes v1->v2: rewrote patch 1 to use a new arm_highest_el()
function.

Patches 2..6 are already reviewed, only patch 1 needs doing.

thanks
-- PMM

Peter Maydell (6):
  target-arm: correct CNTFRQ access rights
  target-arm: Fix handling of SCR.SMD
  target-arm: Implement MDCR_EL3.TDOSA and MDCR_EL2.TDOSA traps
  target-arm: Implement MDCR_EL2.TDRA traps
  target-arm: Implement MDCR_EL3.TDA and MDCR_EL2.TDA traps
  target-arm: Report correct syndrome for FPEXC32_EL2 traps

 target-arm/cpu.h       |  29 ++++++++++++
 target-arm/helper.c    | 122 +++++++++++++++++++++++++++++++++++++++++--------
 target-arm/op_helper.c |  25 ++++++++--
 3 files changed, 153 insertions(+), 23 deletions(-)

-- 
1.9.1

