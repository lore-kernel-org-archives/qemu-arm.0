Received: by 10.182.158.201 with SMTP id ww9csp2039343obb;
        Sat, 19 Dec 2015 21:44:34 -0800 (PST)
X-Received: by 10.140.150.81 with SMTP id 78mr17490886qhw.14.1450590274902;
        Sat, 19 Dec 2015 21:44:34 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g205si24276618qkb.9.2015.12.19.21.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 21:44:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAWnK-0007WI-JA
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 00:44:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmn-0006sb-1o
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 00:44:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmi-0000b3-1c
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 00:44:00 -0500
Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e]:32806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAWmh-0000az-Rs; Sun, 20 Dec 2015 00:43:55 -0500
Received: by mail-pa0-x22e.google.com with SMTP id cy9so124382pac.0;
	Sat, 19 Dec 2015 21:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3E115lLHWvk4E80ghMCWp8J0QJHsDW1AJ1M0iLeok+A=;
	b=VvEXhkzTyFkNB0XaLXgeFuGVVNMxnnOKXC5t+HJ3v4QnnLLYI21hwskY6n6qhFZG2O
	PeZ7VkQsheQAGXCWtFBlxIZiFmaZTw4MEgdBuKLyezipoP8hqPXLhUGYXc0yaJ81sEnt
	aW2Akef0LSIY+EbLshRjM8Qm8Y+BDxvD/VYwZ5Dq3Q1izE09v1GM2myYsTRQBuceE9Ai
	9xlefbVMXeh0rxI6hFKrEHU/n2cV63zKb1WYMpbzKNS1B9tSVFwIE95Ir5ng+qN4W39N
	tRzY8aZTYJ59FeEts35wMbhEK5easVd/ARBwX50b+mC5f2IqMuCvwnpiZwc6lV//0nFF
	VoZQ==
X-Received: by 10.66.228.225 with SMTP id sl1mr17606651pac.63.1450590235128;
	Sat, 19 Dec 2015 21:43:55 -0800 (PST)
Received: from localhost.localdomain
	(c211-31-14-155.rochd5.qld.optusnet.com.au. [211.31.14.155])
	by smtp.gmail.com with ESMTPSA id c27sm894550pfd.50.2015.12.19.21.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 21:43:54 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 19 Dec 2015 21:43:32 -0800
Message-Id: <cover.1450570397.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22e
Cc: peter.maydell@linaro.org, crosthwaite.peter@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, alistair.francis@xilinx.com
Subject: [Qemu-devel] [PATCH v6 0/6]  Connect the SPI devices to ZynqMP
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
X-TUID: DPZ64rV4lqvj

Hi All,

This is a modification of Alistair's ZynqMP SPI work, which proposes a
solution to the SoC bus-aliasing problem. Patch 1 is the big change,
and patches 5 and 6 demo the capability.

I have only tested this -S as I do not have images that test SPI handy,
but qtree looks correct with the new SPI flashes.

V6:
Allow use of QOM paths for referencing qbusses
Use Alias to implement bus pinout.

Regards,
Peter

Original Cover from Alistair:

Connect the SPI devices to Xilinx's ZynqMP.

I also need to make some changes to the actual SPI device to
imporove the fuctionality, but for the time being this works.

V5:
 - Fix a typo
 - Use a qdev API to rename the SPI bus
V4:
 - Rebase
 - Rename the SPI busses so that they can all be accessed from the SoC
 - Only create one SPI flash device
V3:
 - Don't reach into the SoC to get the SPI Bus
V2:
 - Connect the SPI flash in the board code
 - Update git patches to properly indicate rename
 - Add sst25wf080 as a SPI flash


Alistair Francis (5):
  m25p80.c: Add sst25wf080 SPI flash device
  ssi: Move ssi.h into a separate directory
  xilinx_spips: Separate the state struct into a header
  xlnx-zynqmp: Connect the SPI devices
  xlnx-ep108: Connect the SPI Flash

Peter Crosthwaite (1):
  qdev: get_child_bus(): Use QOM lookup if available

 hw/arm/pxa2xx.c                     |  2 +-
 hw/arm/spitz.c                      |  2 +-
 hw/arm/stellaris.c                  |  2 +-
 hw/arm/strongarm.c                  |  2 +-
 hw/arm/tosa.c                       |  2 +-
 hw/arm/xilinx_zynq.c                |  2 +-
 hw/arm/xlnx-ep108.c                 | 16 +++++++++
 hw/arm/xlnx-zynqmp.c                | 30 ++++++++++++++++
 hw/arm/z2.c                         |  2 +-
 hw/block/m25p80.c                   |  3 +-
 hw/core/qdev.c                      |  6 ++++
 hw/display/ads7846.c                |  2 +-
 hw/display/ssd0323.c                |  2 +-
 hw/microblaze/petalogix_ml605_mmu.c |  2 +-
 hw/misc/max111x.c                   |  2 +-
 hw/sd/ssi-sd.c                      |  2 +-
 hw/ssi/pl022.c                      |  2 +-
 hw/ssi/ssi.c                        |  2 +-
 hw/ssi/xilinx_spi.c                 |  2 +-
 hw/ssi/xilinx_spips.c               | 48 +++----------------------
 include/hw/arm/xlnx-zynqmp.h        |  3 ++
 include/hw/{ => ssi}/ssi.h          | 10 +++---
 include/hw/ssi/xilinx_spips.h       | 72 +++++++++++++++++++++++++++++++++++++
 23 files changed, 155 insertions(+), 63 deletions(-)
 rename include/hw/{ => ssi}/ssi.h (96%)
 create mode 100644 include/hw/ssi/xilinx_spips.h

-- 
1.9.1

