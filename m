Received: by 10.25.21.96 with SMTP id l93csp1116788lfi;
        Fri, 24 Jun 2016 08:56:37 -0700 (PDT)
X-Received: by 10.55.221.138 with SMTP id u10mr5522410qku.59.1466783797247;
        Fri, 24 Jun 2016 08:56:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u67si5320052qki.205.2016.06.24.08.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 08:56:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGTTA-0000XS-LP
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 11:56:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bGTMd-0001Z3-Jl
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bGTMc-0004Kd-Kt
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:49:51 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bGTMc-0004KG-CU; Fri, 24 Jun 2016 11:49:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bGTMU-0003l1-Tn; Fri, 24 Jun 2016 16:49:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 Jun 2016 16:49:39 +0100
Message-Id: <1466783381-29506-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] target-arm: Fix SYS_HEAPINFO for 64-bit
 guests
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Tsung-Han Lin <tsunghan.tw@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d4KZhzfpdkpM

These patches fix bugs in the ARM semihosting SYS_HEAPINFO
syscall for 64-bit guests:
 * the fields in linux-user's TaskState should be abi_ulong,
   not uint32_t, since they're guest addresses
 * the SYS_HEAPINFO implementation needs to write its return
   data struct using fields of the right width

The recent patch from Tsung-Han Lin ("target-arm: fix semihosting ram
base issue") addressed this issue in passing, but these patches
take a slightly different approach:
 * factor out the "write fields back" code to reduce duplication
   between the various (32,64) x (user,system) cases
 * use put_user*() rather than tswap and direct write, to
   avoid potential issues with the guest handing us a
   misaligned pointer

thanks
-- PMM


Peter Maydell (2):
  linux-user: Make semihosting heap/stack fields abi_ulongs
  target-arm/arm-semi.c: Fix SYS_HEAPINFO for 64-bit guests

 linux-user/qemu.h     |  6 +++---
 target-arm/arm-semi.c | 47 ++++++++++++++++++++++++++---------------------
 2 files changed, 29 insertions(+), 24 deletions(-)

-- 
1.9.1

