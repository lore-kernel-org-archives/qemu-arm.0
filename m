Received: by 10.25.159.19 with SMTP id i19csp270380lfe;
        Fri, 22 Jan 2016 08:19:12 -0800 (PST)
X-Received: by 10.141.6.130 with SMTP id i124mr4940728qhd.90.1453479552690;
        Fri, 22 Jan 2016 08:19:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si7783086qka.74.2016.01.22.08.19.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 08:19:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMeQZ-0008Ck-TE
	for alex.bennee@linaro.org; Fri, 22 Jan 2016 11:19:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePf-0006sT-Em
	for qemu-devel@nongnu.org; Fri, 22 Jan 2016 11:18:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePZ-00052h-Kr
	for qemu-devel@nongnu.org; Fri, 22 Jan 2016 11:18:15 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMePZ-00052d-DB; Fri, 22 Jan 2016 11:18:09 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOA-0003sJ-Uy; Fri, 22 Jan 2016 16:16:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2016 16:16:32 +0000
Message-Id: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, patches@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 00/10] hw/sd: QOMify sd.c (and pxa2xx_mmci)
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
X-TUID: 46SRtd9kyE0g

This series attempts to QOMify sd.c (the actual SD card model),
including a proper QOM bus between the controller and the card.

This series removes the experimental x-drive property on sdhci-pci;
the syntax for using that device changes:

instead of using the x-drive property:

  -device sdhci-pci,x-drive=mydrive -drive id=mydrive,[...]

we create a specific sd device (which is autoplugged into the
sdhci-pci device's "sd-bus" bus if you don't manually connect them):

  -device sdhci-pci -drive id=mydrive,[...] -device sd-card,drive=mydrive


The basic structure of the patch series is:
 * QOMify sd.c itself
 * Add the QOM bus APIs
 * Convert sdhci to use the QOM bus APIs
 * QOMify pxa2xx_mmci
 * Convert pxa2xx_mmci to use the QOM bus APIs

Some notes on compatibility/bisection:
 * the old-style non-QOMified controllers (which get their drive
   via blk_by_legacy_dinfo() continue to work through the whole series
 * the only QOMified controller which doesn't do that is sdhci-pci,
   which uses the experimental x-drive property to take a drive. This
   support and property is removed in patch 1; support for the new
   syntax is added in patch 5.
   (Since we're breaking the old syntax anyway I chose to not try to
   introduce the new syntax in the same commit as breaking the old one;
   I think it makes the patches easier to review.)

I don't have any Xilinx test images, so I haven't been able to test
the changes to those boards (beyond confirming that the board doesn't
crash on startup and that 'info qtree' seems to show SD cards
connected to the right things). I have tested sdhci-pci and
the pxa2xx.

Changes v1->v2:
 * change from "sd"/TYPE_SD/SD() to "sd-card"/TYPE_SD_CARD/SD_CARD()
 * similarly SD_CLASS -> SD_CARD_CLASS; SD_GET_CLASS -> SD_CARD_GET_CLASS;
   SDClass -> SDCardClass
 * fix pxa cut-n-paste flub
 * use error_propagate() rather than assuming input errp is non-NULL
 * remove stray blank lines/etc
 * use the new QOM alias-this-bus functionality as SPI does for Xilinx
 * use ARRAY_SIZE rather than sizeof
 * fix failure to register vmstate

If you want 'change' and 'eject' to work in the monitor you need to
base on top of Max's patches fixing that regression.
Git branch with that setup available at:
https://git.linaro.org/people/peter.maydell/qemu-arm.git pxa-mmci-qomify

thanks
-- PMM


Peter Maydell (10):
  hw/sd/sdhci.c: Remove x-drive property
  hw/sd/sd.c: QOMify
  hw/sd/sd.c: Convert sd_reset() function into Device reset method
  hw/sd: Add QOM bus which SD cards plug in to
  hw/sd/sdhci.c: Update to use SDBus APIs
  sdhci_sysbus: Create SD card device in users, not the device itself
  hw/sd/pxa2xx_mmci: convert to SysBusDevice object
  hw/sd/pxa2xx_mmci: Update to use new SDBus APIs
  hw/sd/pxa2xx_mmci: Convert to VMStateDescription
  hw/sd/pxa2xx_mmci: Add reset function

 hw/arm/xilinx_zynq.c  |  17 ++-
 hw/arm/xlnx-ep108.c   |  21 ++++
 hw/arm/xlnx-zynqmp.c  |   8 ++
 hw/sd/Makefile.objs   |   2 +-
 hw/sd/core.c          | 146 ++++++++++++++++++++++++
 hw/sd/pxa2xx_mmci.c   | 306 ++++++++++++++++++++++++++++++++------------------
 hw/sd/sd.c            | 149 +++++++++++++++++++-----
 hw/sd/sdhci.c         |  82 ++++++++------
 include/hw/sd/sd.h    |  65 +++++++++++
 include/hw/sd/sdhci.h |   3 +-
 10 files changed, 623 insertions(+), 176 deletions(-)
 create mode 100644 hw/sd/core.c

-- 
1.9.1

