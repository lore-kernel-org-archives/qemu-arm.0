Received: by 10.223.172.38 with SMTP id v35csp619900wrc;
        Thu, 7 Sep 2017 12:26:41 -0700 (PDT)
X-Received: by 10.237.63.124 with SMTP id q57mr636455qtf.23.1504812400177;
        Thu, 07 Sep 2017 12:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504812400; cv=none;
        d=google.com; s=arc-20160816;
        b=Hmmw9B+r3OM3BcboQZ3ZsRUCZswV1+ipgXji8eafg9sRXDuU4Ug+xAKLEJ2MHZiwQf
         EmFucyq0eQLyIj+Plk+oCmcOvXWyoDGNY679RBVomT7FTuhrAfll8upqw4Smz3v/7ISd
         kZ6KysePtZu5NgNJXuGSc5oRu/lGfdJqPOZTNvwAAds47sQlSejiYax1JhWvF4fCsioQ
         YiFekc55XA2yAcWOu2iDzMlMvtgE+vxsf9ucShZaB//nYHsif/L2c6qtXf1gcdzCMcIy
         AhitWG6DgGldNnwFtrdI0+P2uA6LvZa/17uZkNE1h6RkqHRNm+WtutPrSPyVyDdseKte
         MJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=NSUEm6nOemPHRRZewEWgc5QEfVJIGgS+q91Cb++JYUM=;
        b=TPFbY6+4HMZY5irNuJttHHv/54GLOGT38uGKzoadDuedxE+xoObvJt27YVzwuPJ4W2
         XmToAoR0+DjHiE/hP3nchgpO0XmprGrPyzcWfpoLxexlFWqg+JsmW4muExFXEiUlOvxu
         6nLVTuGicdtX01l2FpaqJK18PVVRt9+M+wlBHVpppuwCEDx8cLu+/JaRAGMnUXcO/Y/s
         n6HRwOSI4ZxjIfh3dlpk/a3qvViMwnV/8IBhFlJJsePb9ggUfdGEdrNZVeW+Jea8pmYI
         eXubdeO3CayDyqbjRQWgCznu+auzaHth/STs+2fKYIQ2JMWU+F40EF7RZJNh0msaZO1f
         33iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jSEdjXZq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55si63635qtn.534.2017.09.07.12.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 12:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jSEdjXZq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq2Rh-0007mH-Rg
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 15:26:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dq2Pk-0006b2-32
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 15:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dq2Pe-0004Ap-Vu
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 15:24:36 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dq2Pe-00049Z-PO; Thu, 07 Sep 2017 15:24:30 -0400
Received: by mail-pf0-x241.google.com with SMTP id g13so288989pfm.2;
	Thu, 07 Sep 2017 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NSUEm6nOemPHRRZewEWgc5QEfVJIGgS+q91Cb++JYUM=;
	b=jSEdjXZqmkfmRTkHcvBoWT9dAk8hRDCrPx38ib7WTRmNtVEQD4kJcv7VztEk1iNfCo
	Hr+ndKHGTo1FS8Sk7iITxvzlD/fHd70ldBrueCeiz6gIWScTSSEyxSgPVZya96iGNQdy
	u5IwUq5KqPD/mZGQhwSrtGm9pEszv1zRuTsh/dkDVcOVTY8Lyq9u0zliSWX4XfRXOK0G
	i863+/oiwv0RcrfALukxJ/jyGEFuDDeRl5y9IpC+AFTWND5iqwM/KSMyuH+/CGyp+Lxd
	hlSNGregPhR+98XgqfyRp7HXDQikfuqTIfLv6VlOhTCt5p8kbG56fYL7RZV/+dFy04zk
	fsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NSUEm6nOemPHRRZewEWgc5QEfVJIGgS+q91Cb++JYUM=;
	b=sd3AH2I5iAMltFt73mZnDDAcQ9AZxUC8XRY65TreHfA8oLmO85Wtv2Ss+tyezwlRCQ
	X43gY3WOTevYeKHCFswJtjs8cPT9nVMjORAahAc5w0XKFzzkRfgWgK8TLXdHbAT9UAAO
	b4Qv/KPMqpQFh/G5OgMejSlsoEZ3I+Rjs4pH2rnPK8pMWQ+G0fJhfabc2o+YNY2Ofziw
	+i9CwTZlZ8W5/Tp3/ZuqcbvCvzINdrGlS5PAp02N/tLHtm0+c2llf9jPNvvt1Nx7uTRd
	hZHgjmaMHaQF8ow0OR6JLCXSZ2sJgZJCJYQa+4/KrDzSyqbDL7p8b6nl0WIw5NGaBLnx
	/hog==
X-Gm-Message-State: AHPjjUg6Y70gebf0FNoN/6EGBZ0ThWR45yn/xXQPfRJeu2gk+GN8hICM
	Dzbfb6sF3BiiPnsB
X-Google-Smtp-Source: ADKCNb4NTdZqvjRJguDnq0xGY/KxdNDckz3l5gpbKhneJtUQD3PWMiEjW7AdStBRVFU7/0XwiM2gow==
X-Received: by 10.84.241.77 with SMTP id u13mr457637plm.149.1504812268257;
	Thu, 07 Sep 2017 12:24:28 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	y74sm462919pfa.164.2017.09.07.12.24.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Sep 2017 12:24:27 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  8 Sep 2017 00:54:06 +0530
Message-Id: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [Qemu devel v8 PATCH 0/5] Add support for Smartfusion2
 SoC
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hdd1GZw09/E5

Hi Qemu-devel,

I am trying to add Smartfusion2 SoC.
SoC is from Microsemi and System on Module(SOM)
board is from Emcraft systems. Smartfusion2 has hardened
Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
At the moment only system timer, sysreg and SPI
controller are modelled.

Testing:
./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial mon:stdio \
-kernel u-boot.bin -display none -drive file=spi.bin,if=mtd,format=raw

Binaries u-boot.bin and spi.bin are at:
https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git

U-boot is from Emcraft with modified
    - SPI driver not to use PDMA.
    - ugly hack to pass dtb to kernel in r1.
@
https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git

Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
driver added by myself @
https://github.com/Subbaraya-Sundeep/linux.git

v8:
	memory_region_init_ram to memory_region_init_rom in soc
	%s/emcraft_sf2_init/emcraft_sf2_s2s010_init/g in som
	Added mc->ignore_memory_transaction_failures = true in som
		as per latest commit.
	Code simplifications as suggested by Alistair in sysreg and ssi.

v7:
	Removed vmstate_register_ram_global as per latest commit
	Moved header files to C which are local to C source files
	Removed abort() from msf2-sysreg.c
	Added VMStateDescription in mss-timer.c

v6:
    Moved some defines from header files to source files
    Added properties m3clk, apb0div, apb0div1 properties
    to soc.
    Added properties apb0divisor, apb1divisor to sysreg
    Update system_clock_source in msf2-soc.c
    Changed machine name smartfusion2-som->emcraft-sf2

v5
    As per Philippe comments:
        Added abort in Sysreg if guest tries to remap memory
        other than default mapping.
        Use of CONFIG_MSF2 in Makefile for soc.c
        Fixed incorrect logic in timer model.
        Renamed msf2-timer.c -> mss-timer.c
                msf2-spi.c -> mss-spi.c also type names
        Renamed function msf2_init->emcraft_sf2_init in msf2-som.c
        Added part-name,eNVM-size,eSRAM-size,pclk0 and pclk1
            properties to soc.
        Pass soc part-name,memory size and clock rate properties from som.
v4:
    Fixed build failure by using PRIx macros.
v3:
    Added SoC file and board file as per Alistair comments.
v2:
    Added SPI controller so that u-boot loads kernel from spi flash.
v1:
    Initial patch set with timer and sysreg

Thanks,
Sundeep


Subbaraya Sundeep (5):
  msf2: Add Smartfusion2 System timer
  msf2: Microsemi Smartfusion2 System Register block
  msf2: Add Smartfusion2 SPI controller
  msf2: Add Smartfusion2 SoC
  msf2: Add Emcraft's Smartfusion2 SOM kit

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/msf2-soc.c               | 218 ++++++++++++++++++++++
 hw/arm/msf2-som.c               |  95 ++++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2-sysreg.c           | 195 +++++++++++++++++++
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/mss-spi.c                | 404 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/mss-timer.c            | 289 ++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  66 +++++++
 include/hw/misc/msf2-sysreg.h   |  78 ++++++++
 include/hw/ssi/mss-spi.h        |  58 ++++++
 include/hw/timer/mss-timer.h    |  64 +++++++
 14 files changed, 1472 insertions(+)
 create mode 100644 hw/arm/msf2-soc.c
 create mode 100644 hw/arm/msf2-som.c
 create mode 100644 hw/misc/msf2-sysreg.c
 create mode 100644 hw/ssi/mss-spi.c
 create mode 100644 hw/timer/mss-timer.c
 create mode 100644 include/hw/arm/msf2-soc.h
 create mode 100644 include/hw/misc/msf2-sysreg.h
 create mode 100644 include/hw/ssi/mss-spi.h
 create mode 100644 include/hw/timer/mss-timer.h

-- 
2.5.0

