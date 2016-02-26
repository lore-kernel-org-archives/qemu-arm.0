Received: by 10.25.208.211 with SMTP id h202csp3355414lfg;
        Fri, 26 Feb 2016 05:25:10 -0800 (PST)
X-Received: by 10.140.223.9 with SMTP id t9mr1887816qhb.65.1456493110100;
        Fri, 26 Feb 2016 05:25:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a191si3992735qha.36.2016.02.26.05.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 05:25:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZIOL-0005Sv-Go
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 08:25:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aZINU-0003yT-D3
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 08:24:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aZINT-0006xn-My
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 08:24:16 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aZINT-0006wk-Gl; Fri, 26 Feb 2016 08:24:15 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aZINI-0003FQ-RG; Fri, 26 Feb 2016 13:24:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Feb 2016 13:24:02 +0000
Message-Id: <1456493044-10025-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, patches@linaro.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-devel] [PATCH 0/2] sdhci: Implement device reset
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
X-TUID: JOuAwV1dDra3

This patchset implements the DeviceClass reset method for
the sdhci devices, so that on QEMU system reset they are
reset. (Mostly guests didn't notice this was missing I
think because they tend to do a commanded reset via the
device register as part of driver initialization.)

For the reset patch to work and not crash QEMU on startup,
we need to fix a missing NULL pointer check in sd.c's
sd_get_inserted() function.

These patchsets apply on top of Andrew's rpi quirk
patchset which is in target-arm.next.

Review/testing appreciated.


Peter Maydell (2):
  sd.c: Handle NULL block backend in sd_get_inserted()
  sdhci: Implement DeviceClass reset

 hw/sd/sd.c    |  2 +-
 hw/sd/sdhci.c | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
1.9.1

