Received: by 10.223.188.70 with SMTP id a6csp4713250wrh;
        Mon, 28 Aug 2017 09:38:32 -0700 (PDT)
X-Received: by 10.55.49.65 with SMTP id x62mr1607396qkx.150.1503938312666;
        Mon, 28 Aug 2017 09:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503938312; cv=none;
        d=google.com; s=arc-20160816;
        b=fFyzz1k3JHhRM+Gjudx2bMa+4eBktJMzkd4xKwFsvqGGy5gFxAzRe/6RNVUXUXLEwr
         JpBLRFC/FZWIL7uve2iwXsa0+kj2a7kBTXFSsrKSph4BvM7+1MF50ZofHNrkYhRns6M+
         iJ7sxU25ofKfgWP8Gt91D3Un9rCC0CS0L2hzu+NYZFykXNjxl2Fit4vneKS3QCPBZ6z/
         XTTPyqOo/8aimpW/tdPQ0TdNoJKLPC8ehYiSQDmxIj40wDLkWcjTIoqKkdX1WjlpMJ4i
         dfm04x+Mi6WhMykTeonNK78euz1b/U2mEAItWtQrrjeXvHrQpyQfhsrBjVJD47s75SR0
         t9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=23YJHgwaJGjxqWxMYs/7oOQo3tJX4DFlPvGHz3aJXRU=;
        b=fVp2AnNT+PLFmcqT3MW7oZXJxwKaYaeSp12o6GFdgT+SRepjywOqUiu/svcY9lqy5U
         Rk8cVvWNbINGglsgIdJpqBSmMJuVwbQxo0KchBetsig/l2DvYPH8Mfxyp/MfdnhNZf5m
         cbLuXV+ROOglZKy+0htux3Fnf98+eO9tvlMBCWVTG+X5diH05ZKS5GXPZqtRRZl7LQzn
         Rml/zpWhch3GSLwLJBOiMHJmStNHXq/OZJ4rl9o6HvPcxJAdJGXoxYufGWfo6QWocGgY
         gE5n0v8R2RggaEOvUWbGlciRr9zuQRU3aQr+qF+2o9XZSYGubD5IS9Ol38ccP9lVOgH/
         0PKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xa2ACxvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r36si764804qta.164.2017.08.28.09.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 09:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xa2ACxvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmN3W-0001zm-D2
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 12:38:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmN3R-0001xa-Da
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 12:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmN3Q-0003Bt-61
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 12:38:25 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:38342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dmN3L-0002iZ-7V; Mon, 28 Aug 2017 12:38:19 -0400
Received: by mail-pg0-x244.google.com with SMTP id t3so728070pgt.5;
	Mon, 28 Aug 2017 09:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=23YJHgwaJGjxqWxMYs/7oOQo3tJX4DFlPvGHz3aJXRU=;
	b=Xa2ACxvMKDEgCHJ5kG+fgv+hwAHHNDNW5KRfpWdYCLAQqrGPNHP1iRynmQkk4JpB8j
	REuVTiaAPPEtvCfdOLWtj3i7hDEHJisf8AFVCdj9beQFfEmtfZAEWy48Wbx58zLA90Mn
	VR/l717CIOagIKYWSc9rXnZVTcMXtU28rukqrSXBvjxzd7EVTVI91FZr9bUE9Bxuq7NP
	/qgDjy+9ljeLDuaTgbf2+vqONv/lYKh2er9LhpdS4xfMx9x+fMqn8y3cEYkaVWcRartA
	N9qTgpHzr5Dvj+p03RUDrRiBhNbDvTJW5hkuVRLyAg7HQKmn2iFYzOx29V1a+a8gmcug
	GPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=23YJHgwaJGjxqWxMYs/7oOQo3tJX4DFlPvGHz3aJXRU=;
	b=GZtTy8SKwa+coCRXK8Tn2RYb/LVTdQA+581Vj4dZRujbJ/JV80aeJeB+vcxoHGO0/u
	M1eWbXSPXLCEylYxOKkrfe3daG1SDqtSQ2DYcQV2j3SdTtND7NaoIk9E4Fvna5kREaFf
	uwO2GFrCe2aPZRxPYTgml9/1lO6uTwc7dqtSeFy1d64ecAMqU9lhiwNJ4mu4nOLvoB/h
	7CX09irNHkrw0Aba/nFts6dnrtff2GJMwvcun6dYUymbYo+wu8HADHze5V+PaOtrKK6G
	jJD6V8K5V0qNfb6t4Qy4SNbMIWB1+ROTPxEH6I7Q1jY+PUgtvrjD6u3DyX9ZR3yMLhd0
	iWFA==
X-Gm-Message-State: AHYfb5iWhJvhA4xFkM0Rinbem2EAPhre7b2TB+a/K3bHBG9Avv+Zz7pw
	/zc2R34A7Argh+NN
X-Google-Smtp-Source: ADKCNb7Tq1YT95kiyqWJvsC6g66wvQBLPtl1AWMQ/rjrojF7HQaUT71i9r0BU0eCcgehGTNDMbSmYQ==
X-Received: by 10.99.125.5 with SMTP id y5mr1086865pgc.179.1503938296799;
	Mon, 28 Aug 2017 09:38:16 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	n66sm1935015pfi.44.2017.08.28.09.38.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Aug 2017 09:38:16 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 28 Aug 2017 22:07:58 +0530
Message-Id: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [Qemu devel v7 PATCH 0/5] Add support for Smartfusion2
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
X-TUID: +UtNKcqL3Vsk

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
 hw/arm/msf2-soc.c               | 215 +++++++++++++++++++++
 hw/arm/msf2-som.c               |  94 +++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2-sysreg.c           | 199 +++++++++++++++++++
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/mss-spi.c                | 409 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/mss-timer.c            | 289 ++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  66 +++++++
 include/hw/misc/msf2-sysreg.h   |  78 ++++++++
 include/hw/ssi/mss-spi.h        |  58 ++++++
 include/hw/timer/mss-timer.h    |  64 +++++++
 14 files changed, 1477 insertions(+)
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

