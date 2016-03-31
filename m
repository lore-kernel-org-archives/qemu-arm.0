Received: by 10.25.208.211 with SMTP id h202csp202015lfg;
        Thu, 31 Mar 2016 07:49:46 -0700 (PDT)
X-Received: by 10.140.169.4 with SMTP id p4mr17741011qhp.71.1459435786609;
        Thu, 31 Mar 2016 07:49:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si8002913qkz.109.2016.03.31.07.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 07:49:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aldus-0007DX-70
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 10:49:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aldup-000793-0g
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1alduo-0003uh-Al
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:49:42 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1alduo-0003tV-4j; Thu, 31 Mar 2016 10:49:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aldul-0001lb-CM; Thu, 31 Mar 2016 15:49:39 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Mar 2016 15:49:34 +0100
Message-Id: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>
Subject: [Qemu-arm] [PATCH for-2.6 0/4] various regdef fixes for EL2/EL3 regs
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
X-TUID: 0EUcBfZrkehL

This patchset fixes a number of minor bugs in regdefs for some EL2
and EL3 registers. The most interesting one here is the first --
we weren't resetting SCTLR_EL3 correctly for 64-bit CPUs. The
rest are things I discovered by code inspection looking at other
registers:
 * we weren't migrating ESR_EL2 and ESR_EL3
 * we weren't migrating the (RES0) high 32 bits of VTCR_EL2
 * unneeded TLB flush on TCR_EL2 writes

I think these should go into 2.6 since they're bug fixes.

thanks
-- PMM


Peter Maydell (4):
  target-arm: Correctly reset SCTLR_EL3 for 64-bit CPUs
  target-arm: Remove incorrect ALIAS tags from ESR_EL2 and ESR_EL3
  target-arm: Make the 64-bit version of VTCR do the migration
  target-arm: Avoid unnecessary TLB flush on TCR_EL2 writes

 target-arm/helper.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

-- 
1.9.1

