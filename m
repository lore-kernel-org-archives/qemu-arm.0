Received: by 10.28.4.212 with SMTP id 203csp1036368wme;
        Fri, 27 Apr 2018 10:36:27 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq+hyw9YtssUEBR82n7AlQlkuEAekL7awrNrNlUCMfVsWKp5vPsSKhY5HcRpuOxVbg/Er7M
X-Received: by 10.55.200.157 with SMTP id t29mr2848188qkl.380.1524850587031;
        Fri, 27 Apr 2018 10:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524850587; cv=none;
        d=google.com; s=arc-20160816;
        b=tDOwsyOyYVW5LPt/gCzqr4PbeaadqJbylLrpUimjshH0ziLP6Z1kT1bD0SCyGtjIvT
         wD/QjYS6W03EkjBq5CVsAArKRTBE8sdADUHBSSEsp64TU/ME9mq4TI60wV8ztOh2SWRX
         lmtzpCUYkX8wD4gthRO40UrxGDDECkdUgsFsaXPoUZleEpF2R2cI969KbQGFod0akp3N
         v3QjP1n7+/X+HhVhEsRk2C+8PknMGmbnrXrQKMHtyn69Takz2wNlxZFIKb925/xAQaOU
         BbGho6tVz5XCCb5jtewBXK0r514PtYxxJL6Lg46TIAm9MiBFu9YLo4kSGe4fMnQQJMln
         OmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=sdwjMUenhZ7eKZwlzmvWShQ9GaixGlwtiT4TbzkrjW8=;
        b=jt6J3BunvUKsnViwXBVN0z2l8YE/g9HPRLRH6zjOllSCHKWF8fuwmZ4KEvFnezF4OC
         xUWU0vwXHbjcFHrcA2y05MqjWZ/vgo3Nk6Hq5/ou4FFSjOJQBSoA+VLF1OAloGLQmdxw
         FG1fZxA7M3EgyiFp6cVU4UqbuoMjRfs4vbFxhaexfHxm6EDpRuyhDY5xnCDMxpXENTuo
         6MJ61EavP8pqV9SjFOGQDi9zmBey2HvS5bc6zDfdYh3HkTskmsIV1ydkhtJBtGDl8+34
         SF4kCDM/ohJLvUXopyMTKWGDo/3TVWAoEP/dUPF1bKIGEp0+TEvmMxaKZF/LI8WnwSQ5
         79PA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4-v6si958145qtk.160.2018.04.27.10.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 10:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC7II-0004UW-GC
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 13:36:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fC7I7-0004UE-Bd
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fC7I6-0007ro-Gv
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:36:15 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fC7I6-0007qu-9p; Fri, 27 Apr 2018 13:36:14 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fC7I4-0001W0-4i; Fri, 27 Apr 2018 18:36:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 27 Apr 2018 18:36:09 +0100
Message-Id: <20180427173611.10281-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] arm: convert a couple of devices away from
 old_mmio
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yowh3NaQLFkM

We've had an API transition running for years for MemoryRegionOps
away from the old_mmio function-per-width to the new-style single
function each for read and write. This patchset converts a couple
of devices used in Arm machines to the new style.

This leaves us with:
 * hw/char/parallel
 * hw/block/pflash_cfi02
 * hw/display/vga-isa-mm
 * hw/input/pckbd
 * hw/intc/apic
 * hw/m68k/mcf5206
 * hw/net/pcinet-pci
 * hw/pci-host/bonito
 * hw/ppc/ppc405_boards
 * hw/ppc/ppc405_uc
 * hw/ppc/prep
 * hw/sh4/sh7750
 * hw/timer/m48t59
 * hw/watchdog/wdt_i6300esb

for 17 uses in total.

The conversions are fairly simple, so it would be nice to get
this transition done for the next release -- then we can delete
the code in memory.c that has to consider old_mmio.

thanks
-- PMM

Peter Maydell (2):
  hw/usb/tusb6010: Convert away from old_mmio
  hw/net/smc91c111: Convert away from old_mmio

 hw/net/smc91c111.c | 54 +++++++++++++++++++++-------------------------
 hw/usb/tusb6010.c  | 40 ++++++++++++++++++++++++++++++----
 2 files changed, 61 insertions(+), 33 deletions(-)

-- 
2.17.0

