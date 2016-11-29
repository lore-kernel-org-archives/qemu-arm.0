Received: by 10.25.150.194 with SMTP id y185csp2411819lfd;
        Tue, 29 Nov 2016 07:45:12 -0800 (PST)
X-Received: by 10.55.176.131 with SMTP id z125mr22924100qke.286.1480434312151;
        Tue, 29 Nov 2016 07:45:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q58si27785798qta.108.2016.11.29.07.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkal-0006Ee-0T
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:45:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkaf-0006D6-7b
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkaa-000483-BS
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:05 -0500
Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232]:36335)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkaa-00047U-4t
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:00 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0D2011F72B
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:44:57 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id F083A1200B9;
	Tue, 29 Nov 2016 16:44:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:38 +0100
Message-Id: <1480434248-27138-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11707388706907392785
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.60.232
Subject: [Qemu-arm] [PATCH for-2.9 00/30] Aspeed SoC fixes and model
 improvements
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VHcBAK3uwP9/

Here is a collection of fixes and improvements on existing models for
the Aspeed SoCs

 * Block
   - add a 'model' option to -drive for MTD devices =20

 * SoC level=20
   - an AST2400 A1 SoC for the Palmetto machine
   - a new Romulus machine =20
   - a SRAM region (which is used at early boot in U-Boot, serves as a
     stack, and by DRAM calibration)

 * SMC (Flash controller)=20
   - Command mode support. Flash contents is accessed directly on the
     AHB bus  =20
   - DMA support
   - dummy bytes
   - auto strapping of configuration for boot flash
   - use CS0 as a boot ROM. Today, qemu can not boot from a MMIO region.
     As this is complex to do (TCG layer modification), we use a ROM
     region in which we copy the flash contents. Hopefully, I got it=20
     right this time.

 * Watchdog=20
   - new model. =20
   - not complete but reset under U-Boot and reboot under Linux now
     work   =20

Thanks,

C.

C=C3=A9dric Le Goater (29):
  target-arm: Add VBAR support to ARM1176 CPUs
  m25p80: add support for the mx66l1g45g
  aspeed: QOMify the CPU object and attach it to the SoC
  aspeed: remove cannot_destroy_with_object_finalize_yet
  aspeed: attach the second SPI controller object to the SoC
  aspeed: extend the board configuration with flash models
  aspeed: add support for the romulus-bmc board
  aspeed: add a memory region for SRAM
  aspeed: add the definitions for the AST2400 A1 SoC
  aspeed: change SoC revision of the palmetto-bmc machine
  aspeed/scu: fix SCU region size
  aspeed/smc: improve segment register support
  aspeed/smc: set the number of flash modules for the FMC controller
  aspeed/smc: rework the prototype of the AspeedSMCFlash helper routines
  aspeed/smc: introduce a aspeed_smc_flash_update_cs() helper
  aspeed/smc: autostrap CE0/1 configuration
  aspeed/smc: handle SPI flash Command mode
  aspeed/smc: extend tests for Command mode
  aspeed/smc: unfold the AspeedSMCController array
  aspeed/smc: add a 'sdram_base' property
  aspeed/smc: add support for DMAs
  aspeed/smc: handle dummy bytes when doing fast reads
  aspeed/smc: adjust the size of the register region
  aspeed: use first SPI flash as a boot ROM
  block: add a model option for MTD devices
  aspeed/smc: use flash model option
  aspeed: add a watchdog controller
  aspeed/scu: add a aspeed_scu_get_clk() helper
  wdt: aspeed: use scu to get clock freq

Joel Stanley (1):
  wdt: Add Aspeed watchdog device model

 blockdev.c                       |  12 +
 hw/arm/aspeed.c                  | 113 ++++++-
 hw/arm/aspeed_soc.c              | 109 +++++--
 hw/block/m25p80.c                |   1 +
 hw/misc/aspeed_scu.c             |  16 +-
 hw/misc/aspeed_sdmc.c            |   3 +
 hw/ssi/aspeed_smc.c              | 663 +++++++++++++++++++++++++++++++++=
------
 hw/watchdog/Makefile.objs        |   1 +
 hw/watchdog/wdt_aspeed.c         | 223 +++++++++++++
 include/hw/arm/aspeed_soc.h      |   6 +-
 include/hw/misc/aspeed_scu.h     |   2 +
 include/hw/ssi/aspeed_smc.h      |   8 +-
 include/hw/watchdog/wdt_aspeed.h |  43 +++
 include/sysemu/blockdev.h        |   1 +
 qemu-options.hx                  |   4 +-
 target-arm/cpu.c                 |   6 +
 target-arm/cpu.h                 |   1 +
 target-arm/helper.c              |  24 +-
 tests/m25p80-test.c              |  86 +++++
 19 files changed, 1197 insertions(+), 125 deletions(-)
 create mode 100644 hw/watchdog/wdt_aspeed.c
 create mode 100644 include/hw/watchdog/wdt_aspeed.h

--=20
2.7.4

