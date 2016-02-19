Received: by 10.25.208.211 with SMTP id h202csp1192762lfg;
        Fri, 19 Feb 2016 06:40:53 -0800 (PST)
X-Received: by 10.140.219.134 with SMTP id p128mr16330001qhb.80.1455892853916;
        Fri, 19 Feb 2016 06:40:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c205si14574914qhc.97.2016.02.19.06.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 06:40:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWmEn-0000W1-48
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 09:40:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWmDu-0007kq-4d
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 09:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWmDo-00037N-C3
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 09:39:58 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:38468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWmDo-00036i-5D; Fri, 19 Feb 2016 09:39:52 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWmDg-0002xG-8L; Fri, 19 Feb 2016 14:39:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 14:39:42 +0000
Message-Id: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH v2 0/2] Implement MDCR_EL3.TPM and MDCR_EL2.TPM
	traps
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
X-TUID: eRgnjJn0VYp5

This patchset implements the MDCR_EL3 and MDCR_EL2 trap bits
to trap the performance monitor registers.

Patch 2 is the same as I sent out earlier today as a standalone
patch. Patch 1 fixes a couple of bugs in our SDCR handling, and
in particular imposes a mask so that if a guest has booted with
EL3 in AArch32 then it cannot set bits like TPM which are RES0
for the 32-bit version of the register.

Peter Maydell (2):
  target-arm: Fix handling of SDCR for 32-bit code
  target-arm: Implement MDCR_EL3.TPM and MDCR_EL2.TPM traps

 target-arm/cpu.h    |  4 ++++
 target-arm/helper.c | 66 +++++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 55 insertions(+), 15 deletions(-)

-- 
1.9.1

