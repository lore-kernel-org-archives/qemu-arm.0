Received: by 10.25.44.15 with SMTP id s15csp4683318lfs;
        Tue, 11 Jul 2017 04:19:54 -0700 (PDT)
X-Received: by 10.55.115.69 with SMTP id o66mr10274820qkc.110.1499771994702;
        Tue, 11 Jul 2017 04:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499771994; cv=none;
        d=google.com; s=arc-20160816;
        b=WggbeFhQmQUtnO9zoufCq1qTxZN+eLk62+dF0BmFW4PjPdx2/qMTK/Sn/GWet2PmlK
         ezn2UilJwTpJISl6pbNLkbIFtMIr9TmqAq6VGzLTocg5VWodvNDvFuhH0sHX2wjDt1+R
         VyQB4XIuBOXze3Ez3d3wtSliR1MeNeHZUsQph3YHKhRMTrb41hgwn881xgn28kTk0uj0
         nLnKUYR67f/82uiT1TeVChpzNMN+QT4FbwS5PAPiJSfJ/H1F/5iWRMQa8EYKPgF3xnpq
         ZGDMKyFDavf4pd9i/4ZOFHnMkwRaEuLWNe0vR4jPse/trI6xD7PsGHvIGYsT1qWD9S0M
         Sxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=v6UlAhqlb1FVB8LkGO8S1dlb5HiR1TUsScEhWyh7gZw=;
        b=o/6vjyE86IBARspBUlR/wtwbpYu3Z4rhJ3ipCFabNBKt8R2Rpq7143/YiFdFpgADCf
         lSdTBOL4AS13DjItWBQ96RBPGTRMrGXVyB9UKjddk4sJpxeklTihryrvvD8mgpWd0tGe
         +ofaD27Zy5SH/+XspScZu6N5F0bPaJ5QHi2y3coPkHrJnkhIFiLiVeRDR1XTeRfbUn1V
         gp+uZ+z8dUaPmgcR2W9sCtkS7vHzeaQFr2jdGkxadpen4ym5Rb1bPSiC7jMTfClxk9VA
         jvmnaCtJxMIMTe9MO/gCSzNNp6dAd8O6X5xMWC4mLnVxidDm/kdFxMzN/oXzSNWJeYGo
         jTWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id l9si13251278qtl.48.2017.07.11.04.19.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 04:19:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUtCp-0000dF-SD
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 07:19:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUtAb-0007Fh-ND
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 07:17:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dUtAa-00087h-Ln
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 07:17:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dUtAX-00081N-WE; Tue, 11 Jul 2017 07:17:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dUtAN-00032G-SM; Tue, 11 Jul 2017 12:17:19 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jul 2017 12:17:12 +0100
Message-Id: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 0/7] ARM: implement MPS2 board (with 2 FPGA
 flavours)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Toph21VMKgUC

This patchseries adds support for the ARM MPS2/MPS2+ dev board:

The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
FPGA but is otherwise the same as the 2). Since the CPU itself
and most of the devices are in the FPGA, the details of the board
as seen by the guest depend significantly on the FPGA image.

We model the following FPGA images:
 "mps2_an385" -- Cortex-M3 as documented in ARM Application Note AN385
 "mps2_an511" -- Cortex-M3 'DesignStart' as documented in AN511

They are fairly similar but differ in the details for some
peripherals.
Further info and links to all the documentation for the
board and the various FPGA images can be found here:
 https://developer.arm.com/products/system-design/development-boards/cortex-m-prototyping-system

This patchset adds the boards themselves, and the UART, timer
and system-controller devices they need. There are a number
of other devices on the board which are not yet modelled
(notably more GPIOs, a watchdog, another different kind of timer,
and a display device), but this minimal set is sufficient to
boot the "hello world" binary of the Zephyr RTOS and the
"blinky" binary of the mbed RTOS.
[To run the zephyr binary you also need this fix:
  http://patchwork.ozlabs.org/patch/782811/
 which is in the target-arm pullreq I just sent so should
 get into master in a few days.]

We can add more devices to the model later, but I figured
this was a sufficient place to start.

The underlying motivation here is that the v8M work that I
have planned will need a board, and there is a v8M FPGA
image for the MPS2 that we can use. It's also perhaps a more
useful M profile board for general purposes than the stellaris
boards (64K RAM) or the Netduino2 (128K RAM), since it has
16MB of RAM.

thanks
-- PMM

Peter Maydell (7):
  hw/arm/mps2: Implement skeleton mps2-an385 and mps2-an511 board models
  hw/char/cmsdk-apb-uart.c: Implement CMSDK APB UART
  hw/arm/mps2: Add UARTs
  hw/char/cmsdk-apb-timer: Implement CMSDK APB timer device
  hw/arm/mps2: Add timers
  hw/misc/mps2_scc: Implement MPS2 Serial Communication Controller
  hw/arm/mps2: Add SCC

 hw/arm/Makefile.objs               |   1 +
 hw/char/Makefile.objs              |   1 +
 hw/misc/Makefile.objs              |   1 +
 hw/timer/Makefile.objs             |   1 +
 include/hw/char/cmsdk-apb-uart.h   |  78 ++++++++
 include/hw/misc/mps2-scc.h         |  43 ++++
 include/hw/timer/cmsdk-apb-timer.h |  59 ++++++
 hw/arm/mps2.c                      | 378 +++++++++++++++++++++++++++++++++++
 hw/char/cmsdk-apb-uart.c           | 390 +++++++++++++++++++++++++++++++++++++
 hw/misc/mps2-scc.c                 | 310 +++++++++++++++++++++++++++++
 hw/timer/cmsdk-apb-timer.c         | 253 ++++++++++++++++++++++++
 default-configs/arm-softmmu.mak    |   6 +
 hw/char/trace-events               |   9 +
 hw/misc/trace-events               |   8 +
 hw/timer/trace-events              |   5 +
 15 files changed, 1543 insertions(+)
 create mode 100644 include/hw/char/cmsdk-apb-uart.h
 create mode 100644 include/hw/misc/mps2-scc.h
 create mode 100644 include/hw/timer/cmsdk-apb-timer.h
 create mode 100644 hw/arm/mps2.c
 create mode 100644 hw/char/cmsdk-apb-uart.c
 create mode 100644 hw/misc/mps2-scc.c
 create mode 100644 hw/timer/cmsdk-apb-timer.c

-- 
2.7.4

