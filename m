Received: by 10.25.227.6 with SMTP id a6csp1804925lfh;
        Sun, 2 Jul 2017 21:46:10 -0700 (PDT)
X-Received: by 10.200.55.44 with SMTP id o41mr39883059qtb.120.1499057169996;
        Sun, 02 Jul 2017 21:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499057169; cv=none;
        d=google.com; s=arc-20160816;
        b=D3vZbch3Lf5A/UetmekHYLGk2Vn420a52LzOyJNpOoOWWUvGKjnSIVIKtMrr0yB/iA
         /4kKd8h5IU99bY0/VpwM/oVhh6QkdWXV01NSte9C/1AOzk2Vw9HnCnM202ZqRBDiScXW
         8nRA/6Cs7M8hJ8WtguZvhZnO0W4psXOsP7guN9g2nDWC1jmbUleJr3smm1bXYi5qFYaE
         dK47tjz1TlrtRy1YpDt7rRkV0vWctq/aHq42xkUNPJAxaj7sefbFV+eknfULfmqDGniJ
         8g9jlWPa7+wUoZiwpVk1h74YCjpv2v/dVn35BCkFEPZ7iXb66P+0VFStPdH3w5/EFXuk
         +wRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Dq1hrHKAuhOlF3y6hHLrOkNaDPeF1D/iwWYan8wj7rY=;
        b=nvkxoCfNJbZi+eQMh7YyGBCp0VOu15oVNJwdEqvb4xD7f29RrJiRZlFuoeQrBzoz+j
         yG8OjOhKpdTMiJ968p49nNLIn3mt6GRGClggQVu3a2k230ngGZez3twcedwbgA1CYhio
         uATYYlnEmuZjH9IIk95Vr9O9CUEbKic8ipDFnd4ZIOQnr4yxfFwmGkSwZvXblM79tCTW
         kZXA+wCGw2phFkVlBIPYEBnhcrSfMlF2+oOx/jSqluMQDw+4FJBBHuoDnlkvvulZhqgv
         tobpZU6ImPedQDsmvmrAMRcuGD2LrLuBNK6Dh5bQdi5Irxzsb51qgKJBqt1WVUkhJUv5
         X6Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ppLpNzrH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h42si14105276qta.179.2017.07.02.21.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jul 2017 21:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ppLpNzrH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRtFP-00082A-DT
	for alex.bennee@linaro.org; Mon, 03 Jul 2017 00:46:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtFE-00080Z-GD
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 00:45:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtFD-000839-CQ
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 00:45:56 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dRtF6-0007jj-Up; Mon, 03 Jul 2017 00:45:49 -0400
Received: by mail-pg0-x241.google.com with SMTP id u62so21811898pgb.0;
	Sun, 02 Jul 2017 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Dq1hrHKAuhOlF3y6hHLrOkNaDPeF1D/iwWYan8wj7rY=;
	b=ppLpNzrHPYXnJT2wbOJiPwpiViGNtrs5u+LXGj91T94pRTyoBJpOaUNiCTXmOEwvkM
	FdWXEH/ya5dkLeyFT4++ok8deN0y9EdMWtTpXOeTn0J+anV+Qj8hUK99UZ3B4Hsjbo/n
	fBHtpoAket0HzJ/X6mC5O/h2OXpKQeEk98hpSv6F/tYnL3SvHAXNpZrD0HHUjtmVSPxp
	us9DV6ERXib13NumNNqt2MbCjiJY/lKORKCPV40FBPRMN1Bexss5r1bNVGUzAZ8YpClu
	yl5W3TiBKVsc0SuC/X/Fz5iMMOQBWLJ5w0gc63jwhx/L3APG6C/xcOz+e0VngPj8Y+e1
	L/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dq1hrHKAuhOlF3y6hHLrOkNaDPeF1D/iwWYan8wj7rY=;
	b=PdFKqYMcG3q5ZKj8ZWEjvZdtzMjYDpHD4gFJ5X5mOcId0JjxEirNrhwuj6PhS12HTw
	whxk2rEKs8uNhDF26fiwfmCkZDJ/Whni5sAt51lWt88uQ0Xxs+jUJ/xJtODKmkViGIwM
	mymdfDe/gLIigHogbsBoHY7nKJHeJMIo3XFmRdQK9sYpEhkOKPMTUAAs/D9NN5wAHCcM
	F4+N6VH+sRae/x0/PPn12sLhfta1fY7/I9irqIew33JBGRtln6dK4P65ULTub+7Ej6VM
	aKTTqBgdR+nLWi7iEi39pEvQ0D3T03ZvJ2mkf/Ek8Mhqp5rbpFK2ceE+2/djwnPmVxvK
	jKSg==
X-Gm-Message-State: AIVw112rjLVpTBYIubxnDlFbxi07gzKaDd3OJin4O/l9uIf45JNj9hcO
	qwuL0DH/ZuUspd84
X-Received: by 10.98.148.25 with SMTP id m25mr8072473pfe.7.1499057147551;
	Sun, 02 Jul 2017 21:45:47 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	v70sm9324145pfi.110.2017.07.02.21.45.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Jul 2017 21:45:46 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon,  3 Jul 2017 10:15:10 +0530
Message-Id: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [Qemu devel v6 PATCH 0/5] Add support for Smartfusion2
 SoC
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2G4o3NRjbcdz

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
  msf2: Microsemi Smartfusion2 System Register block.
  msf2: Add Smartfusion2 SPI controller
  msf2: Add Smartfusion2 SoC.
  msf2: Add Emcraft's Smartfusion2 SOM kit.

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   2 +
 hw/arm/msf2-soc.c               | 216 +++++++++++++++++++++
 hw/arm/msf2-som.c               |  94 +++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2-sysreg.c           | 200 +++++++++++++++++++
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/mss-spi.c                | 415 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/mss-timer.c            | 261 +++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  67 +++++++
 include/hw/misc/msf2-sysreg.h   |  82 ++++++++
 include/hw/ssi/mss-spi.h        |  62 ++++++
 include/hw/timer/mss-timer.h    |  67 +++++++
 14 files changed, 1470 insertions(+)
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

