Received: by 10.25.159.19 with SMTP id i19csp1754000lfe;
        Sun, 17 Jan 2016 23:13:45 -0800 (PST)
X-Received: by 10.140.108.229 with SMTP id j92mr4657522qgf.17.1453101225852;
        Sun, 17 Jan 2016 23:13:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si29581105qkh.112.2016.01.17.23.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:13:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL40X-00041Z-6j
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:13:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zi-0002ws-Mx
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zf-000718-ED
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:54 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:36688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zf-000714-3x; Mon, 18 Jan 2016 02:12:51 -0500
Received: by mail-pa0-x230.google.com with SMTP id yy13so336752450pab.3;
	Sun, 17 Jan 2016 23:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GaLqmoARluf7TXKTSVTTio8V3IzKBNaqrxucNtbIFsg=;
	b=TY77iD0Hxrk54Lkfe/RyA35s6yGNnKULHajKswz3jEtYElMOGfwX0+Di3s6xFufmM0
	cmajjVIlEzKqvBNn5PKsAEuUUMMdUrK7oDXa9y8SAFHYWWa85XMDdDzT7dO6nl8fZOlK
	MFyO0c4mtFU0AJ5q8Weoqy8L9f8y1rSaC3RDva54dEdyNogcROgJyORYK9YYi0yWptOa
	5PUeYxmgKnihkTZCvZMfeaWdyNZGYTA9yKAXZpPE1b6+4RKxUN496O5DlofWnuTYxJHx
	yvxx9wnQtuFvNeiiA2dtocQx/bssd2qiZzIsudm8wCtouvCDByCd27rnXW9pcPDLs24d
	hQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GaLqmoARluf7TXKTSVTTio8V3IzKBNaqrxucNtbIFsg=;
	b=M4bEMqeLJCzeUiPBuVQrwMmzP/eyF6hx353aKUm31w5xniP7hAlU8Ot4Pn4Lt4DB7a
	L4HBKsRdtmE3gfQ17RCJuNadbtXg+yc72cZePLvTTKQyj7GQb4gQmwd/OUebD3JK4zGP
	SrD1WXuPgQ3d+BTNzamz8ExGttdmZSXwQTSWcmzfGvTh1uatPsaB8RcooAYzZtVzWyvJ
	QRa+umMh7+t9+cLQoYxjtQscFJ4+peWFij1en+tsFHemk0OSr0gF22vSQpCcNkmyhuqO
	opC7OxyL3zTqyFHWlVB4lA1PUD49EiW6hciGNCAD5DjcIV/mzHogvmXv+LN1vkCjeUAM
	66Qg==
X-Gm-Message-State: ALoCoQnUFzkJsLDJ8AaGXQ+rg/HRueGzJBofcMCLxpIlAUZRFXGBQS6ArBcVCuU5UjZBAZDRWyZWAnBIonbh9IfNzwxhOsSbNQ==
X-Received: by 10.66.142.73 with SMTP id ru9mr34201019pab.121.1453101170330;
	Sun, 17 Jan 2016 23:12:50 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.12.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:12:49 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:27 -0800
Message-Id: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::230
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 00/17]  ARM big-endian and setend support
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
X-TUID: mTs52C73G70h

Hi All,

This patch series adds system-mode big-endian support for ARM. It also
implements the setend instruction, and loading of BE binaries even in
LE emulation mode.

Based on Paolo's original work. I have moved all the BE32 related work
to the back of the series. Multiple parties are interested in the BE8
work just on its own, so that could potentially be merged w/o BE32.
PMM requested BE32 be at least thought out architecturally, so this
series sees BE32 functionality through.

I have tested all of LE. BE8 and BE32 in both linux-user mode (for
regressions) and system mode (BE8 and BE32 are new here).
My test application is here, the README gives some example command
lines you can run:

https://github.com/pcrost/arm-be-test

Regards,
Peter


Paolo Bonzini (8):
  linux-user: arm: fix coding style for some linux-user signal functions
  linux-user: arm: handle CPSR.E correctly in strex emulation
  target-arm: pass DisasContext to gen_aa32_ld*/st*
  target-arm: introduce disas flag for endianness
  target-arm: implement setend
  linux-user: arm: pass env to get_user_code_*
  target-arm: implement SCTLR.B, drop bswap_code
  target-arm: implement BE32 mode in system emulation

Peter Crosthwaite (9):
  linux-user: arm: set CPSR.E/SCTLR.E0E correctly for BE mode
  target-arm: implement SCTLR.EE
  target-arm: a64: Add endianness support
  target-arm: cpu: Move cpu_is_big_endian to header
  target-arm: introduce tbflag for endianness
  arm: linux-user: don't set CPSR.E in BE32 mode
  loader: add API to load elf header
  loader: Add data swap option to load-elf
  arm: boot: Support big-endian elfs

 hw/alpha/dp264.c               |   4 +-
 hw/arm/armv7m.c                |   2 +-
 hw/arm/boot.c                  |  96 ++++++++--
 hw/core/loader.c               |  57 +++++-
 hw/cris/boot.c                 |   2 +-
 hw/i386/multiboot.c            |   3 +-
 hw/lm32/lm32_boards.c          |   4 +-
 hw/lm32/milkymist.c            |   2 +-
 hw/m68k/an5206.c               |   2 +-
 hw/m68k/dummy_m68k.c           |   2 +-
 hw/m68k/mcf5208.c              |   2 +-
 hw/microblaze/boot.c           |   4 +-
 hw/mips/mips_fulong2e.c        |   2 +-
 hw/mips/mips_malta.c           |   2 +-
 hw/mips/mips_mipssim.c         |   2 +-
 hw/mips/mips_r4k.c             |   2 +-
 hw/moxie/moxiesim.c            |   3 +-
 hw/openrisc/openrisc_sim.c     |   3 +-
 hw/pci-host/prep.c             |   2 +-
 hw/ppc/e500.c                  |   2 +-
 hw/ppc/mac_newworld.c          |   5 +-
 hw/ppc/mac_oldworld.c          |   5 +-
 hw/ppc/ppc440_bamboo.c         |   3 +-
 hw/ppc/spapr.c                 |   6 +-
 hw/ppc/virtex_ml507.c          |   3 +-
 hw/s390x/ipl.c                 |   4 +-
 hw/sparc/leon3.c               |   2 +-
 hw/sparc/sun4m.c               |   4 +-
 hw/sparc64/sun4u.c             |   4 +-
 hw/tricore/tricore_testboard.c |   2 +-
 hw/xtensa/sim.c                |   4 +-
 hw/xtensa/xtfpga.c             |   2 +-
 include/hw/arm/arm.h           |   9 +
 include/hw/elf_ops.h           |  22 ++-
 include/hw/loader.h            |   3 +-
 linux-user/main.c              |  77 ++++++--
 linux-user/signal.c            | 110 +++++------
 target-arm/arm_ldst.h          |   8 +-
 target-arm/cpu.c               |  21 +--
 target-arm/cpu.h               | 103 ++++++++++-
 target-arm/helper.c            |  50 +++--
 target-arm/helper.h            |   1 +
 target-arm/op_helper.c         |   5 +
 target-arm/translate-a64.c     |  56 +++---
 target-arm/translate.c         | 407 ++++++++++++++++++++++++-----------------
 target-arm/translate.h         |   3 +-
 46 files changed, 752 insertions(+), 365 deletions(-)

-- 
1.9.1

