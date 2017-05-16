Received: by 10.25.0.6 with SMTP id 6csp1933825lfa;
        Tue, 16 May 2017 08:39:39 -0700 (PDT)
X-Received: by 10.55.161.72 with SMTP id k69mr11733905qke.81.1494949179490;
        Tue, 16 May 2017 08:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494949179; cv=none;
        d=google.com; s=arc-20160816;
        b=BTo+uYKEW5K25lLLo9Z1fuJtkFonhFm5HjE/RR0AMF2AgH8hcpXxypToSavA6wRHSr
         LJ903lTJE6rCR6J6MzbnO4bW3lZQOBbC9muiRJT+P4yZPqdWn256wPwCNeC4Rw5PygTD
         jNgigfYqe6FccivBGr7uq6BbBFLttWsdwM9RKpY/Oz90ZitY/Kqx91bcsvbrwURKl5uq
         G+HHAIMysu1jxpkty9OjjoL0dt1o3rgtjSisVsyOORNzzgG9M991nNbYR9HoKOndytn8
         Jw+9EH8shzAIEoSx13DeRIuzfzxScGzDv+esnk7pKrn2E8Qn8Q37ee05OCLmFpWRFokU
         pHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Bku2nHE5SEqWHdLK8vfo7qI9WU4Lq9ak7FnnA8ofz9M=;
        b=LHYDUD9nNAyHyKV4BK8bRLziJIChpVFKL4b+xYAZ1wMBkj5q+vpJvu1/y0XGS+FYcz
         HdAXSZGSSx/l2LC5dJcq2vUM2du8qGtLPOrNNH6kmbxRKYgRouIuc/4mGYVgRpCN7W5t
         ODqhv/VJjiBoSf4acJF9DpoMTabjidXY7ctqTdXcnPD0Ft9nNB69eAEhzjtvPHUGKe4Z
         ZIKrKe4IjwfS610wsN5Ddb0huXkZ9XVNKxM9tW6F3X0WDjVuxjffr6YNAXB62zs5RWzu
         2J8WB5lKhvjTURWdLam4P8mvK1CMI3yBXq1C05vvRBXOsSub2ZzyNASs/C3nL4ds7ljU
         aRNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i185si13874799qkd.249.2017.05.16.08.39.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 08:39:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAeZW-0002X9-VV
	for alex.bennee@linaro.org; Tue, 16 May 2017 11:39:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAeZR-0002Ub-Ig
	for qemu-arm@nongnu.org; Tue, 16 May 2017 11:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAeZQ-0001XW-BS
	for qemu-arm@nongnu.org; Tue, 16 May 2017 11:39:33 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34117)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dAeZK-0001VO-SE; Tue, 16 May 2017 11:39:26 -0400
Received: by mail-pg0-x244.google.com with SMTP id u187so21807407pgb.1;
	Tue, 16 May 2017 08:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Bku2nHE5SEqWHdLK8vfo7qI9WU4Lq9ak7FnnA8ofz9M=;
	b=fPK97j47kG5I//PymvRkxmXbvbI0ELiYrx0YX7lrsQFXfucj+0+qUGDdrJC4hqZ+Ay
	drlERgSMmw/tpNhuo1JNR3CpcHX4lPaNtkaxUmsYykDaFbc4FSwwqKUcatJ+Od4I7feA
	yFPb6g8r547MpF4EHqkVXGNK9A6iUyyC7jE4eM8z3GAxN9p7k86bb2Hs/5wj75+GODQr
	CRwUqnaC51xfHpAoq5+Ivszm3F1yizk//84YAuI+szDislgiBjPWAnq3pOwIyic3PxLQ
	2DjFcOMQHYBhRjaPm831uJexilv9QWaE2UmW8Xlh8cCfCZUtDNgoJ/2sewY7WitViZoR
	OIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bku2nHE5SEqWHdLK8vfo7qI9WU4Lq9ak7FnnA8ofz9M=;
	b=QsHKOju7vfPSOOlwcyxPQ40h/PNvIInpPVrohkmsxiOK62/5hxb34TrDdWgDJsHPpu
	WBBnKszcBrZ12bd0/FiokYZW5dcDhN7wHJNTKOMrux5c690ySNpNjs9W0O199t9FFffC
	r+RmvOD+bZTL86bghJnsuFT+jFBVqL62GmEukuS7Q0Bz/v2KUt7lwsaLMO78s0Dsb12j
	oeaXbSjfdbWJ/dhj8sSEYVgEOIwKRf1HCjWfzoltQbRgfMX5/CzlCbWj73yDMzPqjyFN
	SnDISPNPKYVTELqIqWe4meCX5HIuzfTWtRoWhcndLX8XpQOFuh7vdp8JmwhdkncKkyyJ
	KPzQ==
X-Gm-Message-State: AODbwcAxQJloWWTx/Z5sKo7Ena3SJaHCnTWJzPp0FLCRkaRXzrCPryT9
	/4awrZEsTf659Q==
X-Received: by 10.84.218.7 with SMTP id q7mr16487590pli.80.1494949162513;
	Tue, 16 May 2017 08:39:22 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	d86sm27874895pfj.75.2017.05.16.08.39.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 08:39:22 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 16 May 2017 21:08:48 +0530
Message-Id: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [Qemu devel v5 PATCH 0/5] Add support for Smartfusion2
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
X-TUID: /bM0XtaTt4dB

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
 hw/arm/msf2-soc.c               | 201 +++++++++++++++++++++
 hw/arm/msf2-som.c               |  89 ++++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2-sysreg.c           | 161 +++++++++++++++++
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/mss-spi.c                | 378 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/mss-timer.c            | 249 ++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  69 ++++++++
 include/hw/misc/msf2-sysreg.h   |  80 +++++++++
 include/hw/ssi/mss-spi.h        | 104 +++++++++++
 include/hw/timer/mss-timer.h    |  80 +++++++++
 14 files changed, 1417 insertions(+)
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

