Received: by 10.25.0.144 with SMTP id 138csp287958lfa;
        Fri, 28 Apr 2017 09:52:48 -0700 (PDT)
X-Received: by 10.237.46.230 with SMTP id k93mr10363104qtd.264.1493398368667;
        Fri, 28 Apr 2017 09:52:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si6431186qtd.160.2017.04.28.09.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 09:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d498S-0003sy-2z
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 12:52:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498M-0003rJ-Tg
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 12:52:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498L-00068b-Sx
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 12:52:42 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d498F-00063z-7R; Fri, 28 Apr 2017 12:52:35 -0400
Received: by mail-pg0-x241.google.com with SMTP id v20so3742380pgn.0;
	Fri, 28 Apr 2017 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fC+f1w+LYdTwEvvn/zDQ5teqlNBjTkI21LA0rf0aSfQ=;
	b=us5tVXqv6pqe0kN5ulXpQXGgU4uyiKwOK2n8jDvdCTynZ6T1hcyMWnOaoJAov9b3cD
	G0ptpEIf2AfT7TtTNmUZvcNeMkyD1LW6eg8Hw/XO41JDobN6/86gzFG8OtS0+Hv5y9uk
	ZlYTbOinyeq9uKLF0fZxVObSuXLeyeUewOAl3vkPyw7Govz/qJS7TIttdseIxeFWkO/m
	ThAsYxw1BaHXIWgY1t0briCBIYt9ARRBEF8eRNmeqUwuCqKwqlblF2ntlZMHH9QN3Exi
	NvGgSXbBXUEenpHobg0hO90AvCuE7RINgyhJImUUD2b4oDLTJNmYGgDDplZRYWZ/I8I+
	FgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fC+f1w+LYdTwEvvn/zDQ5teqlNBjTkI21LA0rf0aSfQ=;
	b=ESrRrcRJMGT1s2zDn/l8jpndI37t5nkurs9K0S4NXzV42ebkxybh781TUj5nfn22eU
	vUO4CxDHyvMEa+//6qQhJxfF7TFAjsytXnBIWHQqQLFWSLj5EZXI3f25m//Y2jrO9A0S
	ngU9IunyHmoisCVBr+7zHZwwY8nalBj2vP7DDTodiOhiKz7LP8goIZ7hcILaiv0JzRxQ
	O9JhFUt5MfgmvudSH9lFQTARsUMg9QSWzZ7MYXL0Yett1A6KuzOVTmMyGIPHEWm4ggOg
	N43zp9RJqzJk6jeGGhXOgGEfEszZMk++NxTeQfrC0Ol421iv/Ys0wSbhe3s1n897JpuN
	Xbcw==
X-Gm-Message-State: AN3rC/5DzXhlKgnBhJgttZtymV/1LTWvuuDrhFzDWDZWkQBJx2spe4QH
	QwjOr3ulNa7j3w==
X-Received: by 10.84.132.33 with SMTP id 30mr16778456ple.46.1493398354039;
	Fri, 28 Apr 2017 09:52:34 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	r86sm11383528pfb.24.2017.04.28.09.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Apr 2017 09:52:33 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 28 Apr 2017 22:21:48 +0530
Message-Id: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [Qemu-devel RFC v3 0/5] Add support for Smartfusion2 SoC
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
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LalcvIIEuAIh

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

U-boot is from Emcraft with modified SPI driver not to use PDMA.
Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource 
driver added by myself @
https://github.com/Subbaraya-Sundeep/linux.git

Baremetal elfs from Microsemi Softconsole IDE are also working.

Changes from v2:
    Added SoC file and board file.
Changes from v1:
    Added SPI controller.

Thanks,
Sundeep


Subbaraya Sundeep (5):
  msf2: Add Smartfusion2 System timer
  msf2: Microsemi Smartfusion2 System Register block.
  msf2: Add Smartfusion2 SPI controller
  msf2: Add Smartfusion2 SoC.
  msf2: Add Emcraft's Smartfusion2 SOM kit.

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   3 +-
 hw/arm/msf2_soc.c               | 194 +++++++++++++++++++++
 hw/arm/msf2_som.c               |  68 ++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2_sysreg.c           | 127 ++++++++++++++
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/msf2_spi.c               | 373 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/msf2_timer.c           | 250 +++++++++++++++++++++++++++
 include/hw/arm/msf2_soc.h       |  62 +++++++
 include/hw/misc/msf2_sysreg.h   |  77 +++++++++
 include/hw/ssi/msf2_spi.h       | 102 +++++++++++
 include/hw/timer/msf2_timer.h   |  82 +++++++++
 14 files changed, 1341 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/msf2_soc.c
 create mode 100644 hw/arm/msf2_som.c
 create mode 100644 hw/misc/msf2_sysreg.c
 create mode 100644 hw/ssi/msf2_spi.c
 create mode 100644 hw/timer/msf2_timer.c
 create mode 100644 include/hw/arm/msf2_soc.h
 create mode 100644 include/hw/misc/msf2_sysreg.h
 create mode 100644 include/hw/ssi/msf2_spi.h
 create mode 100644 include/hw/timer/msf2_timer.h

-- 
2.5.0

