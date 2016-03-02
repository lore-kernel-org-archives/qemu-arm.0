Received: by 10.25.208.211 with SMTP id h202csp2008208lfg;
        Tue, 1 Mar 2016 22:56:52 -0800 (PST)
X-Received: by 10.55.78.198 with SMTP id c189mr31713285qkb.95.1456901812769;
        Tue, 01 Mar 2016 22:56:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h68si34827046qgd.37.2016.03.01.22.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0iK-0005tg-4r
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:56:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iH-0005oU-0R
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:56:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iF-0003Mn-PT
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:56:48 -0500
Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e]:33829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iA-0003Lu-VK; Wed, 02 Mar 2016 01:56:43 -0500
Received: by mail-pa0-x22e.google.com with SMTP id fy10so127182954pac.1;
	Tue, 01 Mar 2016 22:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=awNjDRB8h7F2S7weLRARS0JhJpBtXK3SXEhpK0K/ypM=;
	b=zs0JZCwrATfMB5I/x6Abyz0B7GbQPsYSr3Xerb+OGT0JzGt7qQQw+WZdshsvgPBrbW
	Coc+KPrrF4HO2AVMMnWuEE5kzlF64K1D47s1PkEFQhxdX6htta8ToIfqdIKEjByslU96
	20xnS87Qemp8NhJsBZ5/mVS7Qlj8cwFHRSebfUikV/MgjXyiRouAwkYSILSN4CkkULut
	sSNZgte0DRrxq12R1gxmnVgd58UN1HJsAPxVT2KgdmKhRASDSTFEg3KizTi/7AiPII5o
	l+Bf8tCUcUlT4FoNlWuyNzTiAi75fLisnHwReFb0YrTvJ5QxmlQqJkuM0Vicxs8CyNpv
	kc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=awNjDRB8h7F2S7weLRARS0JhJpBtXK3SXEhpK0K/ypM=;
	b=G7irMQHmDmwwvzsm/yJJaGNV5V/Q8DFPaB0kS+QNzIwktpaXySA3OFATXvFRTiN46a
	c9HZF4MuD8t/tOZ2qVdQFLRD8zmnV6YA8ynBF78rP5RCSRKlFE11eT7brm+/hcfoCbZ3
	8RtHmjEd8MAW2sjqn+1UyqS1gecL9EyvOjWskQF6vyGITq5AKuYtj+mVDZ3gcffcBEjk
	QgGgFWD36EVbTvOI052Mt3VLl6SZA4RJnivT+0sYcTB63wzZYRAEEWo42h+fWriQAy40
	nfMaPShC1R7MBSjSkPOJb89ADt/Idi/6kMtyLSejoKBP7/BpNagCYd2nowtg5GAu9l0Q
	D3cw==
X-Gm-Message-State: AD7BkJIVBj7lBEN4DZYrFhRtsmz72FFRJhmVywN8GfxLJkKkvp90zBnP4EuK2MnZRIKIwA==
X-Received: by 10.66.157.161 with SMTP id wn1mr36408730pab.146.1456901802154; 
	Tue, 01 Mar 2016 22:56:42 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.56.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:56:41 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:04 -0800
Message-Id: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22e
Cc: peter.maydell@linaro.org, sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v2 00/18]  ARM big-endian and setend support
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
X-TUID: vcVXrmve2OFw

Hi All,

This patch series adds system-mode big-endian support for ARM. It also
implements the setend instruction, and loading of BE binaries even in
LE emulation mode.

Based on Paolo's original work.

I have tested all of LE, BE8 and BE32 in both linux-user mode (for
regressions) and system mode (BE8 and BE32 are new here).
My test application is here, the README gives some example command
lines you can run:

https://github.com/pcrost/arm-be-test

Regards,
Peter

Changed since v1:
Addressed PMM review
Added doc comments to new/changed loader.h APIs


Paolo Bonzini (8):
  linux-user: arm: fix coding style for some linux-user signal functions
  linux-user: arm: pass env to get_user_code_*
  target-arm: implement SCTLR.B, drop bswap_code
  linux-user: arm: handle CPSR.E correctly in strex emulation
  target-arm: pass DisasContext to gen_aa32_ld*/st*
  target-arm: introduce disas flag for endianness
  target-arm: implement setend
  target-arm: implement BE32 mode in system emulation

Peter Crosthwaite (10):
  target-arm: cpu: Move cpu_is_big_endian to header
  arm: cpu: handle BE32 user-mode as BE
  linux-user: arm: set CPSR.E/SCTLR.E0E correctly for BE mode
  target-arm: implement SCTLR.EE
  target-arm: a64: Add endianness support
  target-arm: introduce tbflag for endianness
  loader: add API to load elf header
  loader: load_elf(): Add doc comment
  loader: Add data swap option to load-elf
  arm: boot: Support big-endian elfs

 hw/alpha/dp264.c               |   4 +-
 hw/arm/armv7m.c                |   2 +-
 hw/arm/boot.c                  |  93 +++++++++-
 hw/core/loader.c               |  64 ++++++-
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
 include/hw/loader.h            |  41 ++++-
 linux-user/main.c              |  77 ++++++--
 linux-user/signal.c            | 110 +++++------
 target-arm/arm_ldst.h          |   8 +-
 target-arm/cpu.c               |  21 +--
 target-arm/cpu.h               |  98 +++++++++-
 target-arm/helper.c            |  31 +++-
 target-arm/helper.h            |   1 +
 target-arm/op_helper.c         |   5 +
 target-arm/translate-a64.c     |  56 +++---
 target-arm/translate.c         | 405 ++++++++++++++++++++++++-----------------
 target-arm/translate.h         |   3 +-
 46 files changed, 783 insertions(+), 350 deletions(-)

-- 
1.9.1

