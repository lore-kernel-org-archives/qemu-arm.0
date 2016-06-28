Received: by 10.25.21.96 with SMTP id l93csp1665312lfi;
        Tue, 28 Jun 2016 07:24:28 -0700 (PDT)
X-Received: by 10.129.155.145 with SMTP id s139mr914962ywg.48.1467123868856;
        Tue, 28 Jun 2016 07:24:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c132si6252348yba.266.2016.06.28.07.24.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 07:24:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHtwC-0000nV-52
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 10:24:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHtw5-0000l1-Tm
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 10:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHtw3-00063X-OO
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 10:24:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHtw3-00063I-Hh; Tue, 28 Jun 2016 10:24:19 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHtWi-00062q-Ah; Tue, 28 Jun 2016 14:58:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 28 Jun 2016 14:58:04 +0100
Message-Id: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.7 0/3] Add memory_region_init_rom() and use
 to fix imx board crashes
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe DUBOIS <jcd@tribudubois.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kVMQEgv50jIo

    
The imx boards were all incorrectly creating ROMs using
memory_region_init_rom_device() with a NULL ops pointer.  This will
cause QEMU to abort if the guest tries to write to the ROM.  The way
we currently provide for "create a pure ROM" is to use
memory_region_init_ram() followed by memory_region_set_readonly(),
but this is a bit obscure. So provide a new memory_region_init_rom()
which does the equivalent of those two calls, and use it in
the imx boards.

We can then add an assert() in memory_region_init_rom_device()
to prevent further misuse. (Passing NULL was documented as
"I/O space is not supposed to be handled by QEMU itself", but this
doesn't make much sense (who would be handling the writes?) and
isn't used by any of the callers.)

This is for-2.7 because it fixes a crash in the imx boards
if the guest misbehaves:
https://bugs.launchpad.net/qemu/+bug/1596160

thanks
-- PMM

Peter Maydell (3):
  memory: Provide memory_region_init_rom()
  imx: Use memory_region_init_rom() for ROMs
  memory: Assert that memory_region_init_rom_device() ops aren't NULL

 docs/memory.txt       |  9 +++++++--
 hw/arm/fsl-imx25.c    |  8 ++++----
 hw/arm/fsl-imx31.c    |  9 ++++-----
 hw/arm/fsl-imx6.c     |  8 ++++----
 include/exec/memory.h | 24 ++++++++++++++++++++----
 memory.c              | 16 ++++++++++++++++
 6 files changed, 55 insertions(+), 19 deletions(-)

-- 
1.9.1

