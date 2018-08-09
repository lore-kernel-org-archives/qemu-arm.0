Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1874929wru;
        Thu, 9 Aug 2018 06:04:13 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzrf7Ji2WUR1fzs7VXql05edCO6iG+gSEXkeIgdmZ7Rxt9GQOw5ukVcRXujTWy5hE/31RfP
X-Received: by 2002:a37:4c85:: with SMTP id z127-v6mr1761373qka.302.1533819853511;
        Thu, 09 Aug 2018 06:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819853; cv=none;
        d=google.com; s=arc-20160816;
        b=Lp7gjGvPeukAYiZifE9/DVzVxW+Bpnk3grIqXrNnKqlauEsikKI4GawYsEnYTBKNr3
         sAc6MvfZyKNtQNefpFl7wbyQ0uB3b9cdQmjfOYpnGKyCSNNiOiLsUfqETRL9c3QHJlEv
         akuM0WkLLRd7Hu0HFWWLs6TEtEgcCb0MupbpY6+ROV7HTEP9pRwgeJsRf4hQsl81iJqT
         aZd/C2rYC2exal7JQwg+JDY8iokC966uS6mfAulnTv2jCimsuifIi2fA/WSstiWz9bvd
         fUP3H/0q7E1XzM0HuClli6aKKkiT2zVCzPWNMZ4p05iypDyaM95X7jweEeE0imN/Y0A3
         FgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=0SSluCM1kUcLol2P5uxDZy6M9C2fHFAgD5NwvqOLBQk=;
        b=ycJeXPwij8PopAqDBhnZoqWv12xtHWr5lN7OaUoHbX9ejIpo1r590t1ZyTFAXARq3U
         MsqCHUgpaoyEnt0jF9SYqngrgZ909/DCEb7oZU8vmgcAwSeTqCyy01gA1jIU682Qykd4
         5bMtL0uNvUgm+BP0s20SdcEOJLGRWFihVPdYkDoftTiskheMwyxMj5ScfrURdxFsWdFM
         3fJVw41CwUu6a52o0Zh7UQXCWlXkYWRoY6hHfpHvBuxXsPjOYxaFRAZs0hIGm4eiL9oC
         s1/eYs1u7CBtVnxqpA6E6SjSb1+mPybrI3p4x379GXRVE76CFED9HIc3rR2u8COzT2sd
         t05g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t34-v6si5075344qth.151.2018.08.09.06.04.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:04:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkbt-0007zh-26
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:04:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZJ-0005uo-3J
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZD-0003GN-79
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZC-00038J-Ty; Thu, 09 Aug 2018 09:01:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZ4-0003Ej-Sw; Thu, 09 Aug 2018 14:01:18 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:00:59 +0100
Message-Id: <20180809130115.28951-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/16] arm: Implement MPS2 watchdogs and DMA
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
X-TUID: SHYwMYXJQgnf

This patchset adds some more missing devices to the MPS2 AN505
board model:

Patches 1-3 implement and wire up the CMSDK APB watchdog devices.

Patch 4 adds a CMSDK timer device that had been forgotten.

Ppatches 5-6 implement and wire up the "system control element",
which is some simple control/ID registers in the IoTKit

Patches 7-16 are the meat of the patchset, and add support
for the DMA controllers and their associated Master Security
Controllers. A TrustZone MSC sits in front of a device which
can be a bus master (such as a DMA controller) and allows secure
software to configure it to either pass through or reject transactions
made by that bus master. Rejected transactions may be configured to
either be aborted, or to behave as RAZ/WI. An interrupt can be
signalled for a rejected transaction. The AN505 has four
PL081 DMA controllers, each with its own MSC.

Patches 10-15 are various minor cleanups and bugfixes in
the PL081 model that are needed for its use in the AN505.
In particular the PL081 was previously entirely broken as
it would hw_error() as soon as the guest enabled the DMA
engine. I assume this was either accidentally left-in debug code,
or a deliberate choice to guard a never-tested implementation
so as to be able to identify when we had guest code to test it
with. (Linux for the realview/versatile boards never tries to
use the PL08x there for DMA.)

This patchset is sufficient for the "DMA" test in the AN505
self-test binary to pass. (I suspect it is not giving the
PL081 or MSC a very thorough workout, though.)

Based-on: <20180730162458.23186-1-peter.maydell@linaro.org>
("[PATCH 0/5] mps2: Implement FPGAIO counters and dual-timer")

thanks
-- PMM

Peter Maydell (16):
  hw/watchdog/cmsdk_apb_watchdog: Implement CMSDK APB watchdog module
  nvic: Expose NMI line
  hw/arm/iotkit: Wire up the watchdogs
  hw/arm/iotkit: Wire up the S32KTIMER
  hw/misc/iotkit-sysctl: Implement IoTKit system control element
  hw/misc/iotkit: Wire up the system control element
  hw/misc/tz-msc: Model TrustZone Master Security Controller
  hw/misc/iotkit-secctl: Wire up registers for controlling MSCs
  hw/arm/iotkit: Wire up the lines for MSCs
  hw/dma/pl080: Allow use as embedded-struct device
  hw/dma/pl080: Support all three interrupt lines
  hw/dma/pl080: Don't use CPU address space for DMA accesses
  hw/dma/pl080: Provide device reset function
  hw/dma/pl080: Correct bug in register address decode logic
  hw/dma/pl080: Remove hw_error() if DMA is enabled
  hw/arm/mps2-tz: Create PL081s and MSCs

 Makefile.objs                            |   1 +
 hw/misc/Makefile.objs                    |   2 +
 hw/watchdog/Makefile.objs                |   1 +
 include/hw/arm/iotkit.h                  |  20 +-
 include/hw/dma/pl080.h                   |  71 +++++
 include/hw/misc/iotkit-secctl.h          |  14 +
 include/hw/misc/iotkit-sysctl.h          |  50 ++++
 include/hw/misc/tz-msc.h                 |  79 ++++++
 include/hw/watchdog/cmsdk-apb-watchdog.h |  59 ++++
 hw/arm/armv7m.c                          |   1 +
 hw/arm/iotkit.c                          |  99 ++++++-
 hw/arm/mps2-tz.c                         | 101 ++++++-
 hw/arm/realview.c                        |   8 +-
 hw/arm/versatilepb.c                     |   9 +-
 hw/dma/pl080.c                           | 113 ++++----
 hw/intc/armv7m_nvic.c                    |  19 ++
 hw/misc/iotkit-secctl.c                  |  73 ++++-
 hw/misc/iotkit-sysctl.c                  | 324 ++++++++++++++++++++++
 hw/misc/tz-msc.c                         | 308 +++++++++++++++++++++
 hw/watchdog/cmsdk-apb-watchdog.c         | 326 +++++++++++++++++++++++
 MAINTAINERS                              |   7 +
 default-configs/arm-softmmu.mak          |   3 +
 hw/intc/trace-events                     |   1 +
 hw/misc/trace-events                     |  16 ++
 hw/watchdog/trace-events                 |   6 +
 25 files changed, 1632 insertions(+), 79 deletions(-)
 create mode 100644 include/hw/dma/pl080.h
 create mode 100644 include/hw/misc/iotkit-sysctl.h
 create mode 100644 include/hw/misc/tz-msc.h
 create mode 100644 include/hw/watchdog/cmsdk-apb-watchdog.h
 create mode 100644 hw/misc/iotkit-sysctl.c
 create mode 100644 hw/misc/tz-msc.c
 create mode 100644 hw/watchdog/cmsdk-apb-watchdog.c
 create mode 100644 hw/watchdog/trace-events

-- 
2.17.1

