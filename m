Received: by 10.223.172.38 with SMTP id v35csp1109586wrc;
        Wed, 20 Sep 2017 13:18:16 -0700 (PDT)
X-Received: by 10.55.20.16 with SMTP id e16mr9211433qkh.97.1505938696013;
        Wed, 20 Sep 2017 13:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505938696; cv=none;
        d=google.com; s=arc-20160816;
        b=fqKp5DEUtHibw4opFJXbGz0xBaiDS5akTvXaQ3EdmfdlJVrmoCqpwOsYgMGoKJg1+F
         kVuhjHxSDRTPYEN3e/dJ402oKh7FoFgGSBf+6UGs+EF2rA8ioSKx3TXtJrzP12ZDsoE2
         F13V6r/h8hThoyMiIVKczzUDVALBVPPXnjeD4ovz64jEmMabCGngvAUo3EuVKkDGkNzA
         GA3HlfBMYD/wHcahfufG8GoRor2/DyubTF5NXsCs5zXdGW6obZ+TSPbw3xSQLUYpuprX
         YIZg1Np0TeI4y1bggVfHwhPINrJFIoMIy7RiRsXurAMO8F9WCP57g7W8/Tl4VDYEUOG0
         Ks/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=qFwqEGt6qJ1SihLBkLZ/xpvOEpB0CFAu2sXovo/gg7s=;
        b=pVvipYEGMYuDF+mCks6MudzikPmzaWUwqx6WpZS/UFysmaOvZ+BXauND+RvchL5OE5
         BKZpXA2ec/NqGeNS5kWeOEVK69+BN9pqURJQojxOdvP7vBKAPL4mQXIyDcjkKIsE/5Ud
         /9C0l4Tcq0A15gLiejEOB3Q44uyP4b6hV37OZb+04126bHa2g2MotIXxbBT8h1qkCXEw
         nhmLzNh6Sb2C3eDFF6CiMnCkWSJ7hKtsuJHDqg5gvZBkALx3ZP8Zk9g++Yk0ql/DG/iU
         6+G5gCKUsxS4+t/eZ4mdHzZwACCGm0ncDlxTEqKDz08qwef7P3ZuWj6wUXxi7C8RlXjR
         O2dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RTmFx0iN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v41si2623057qtc.193.2017.09.20.13.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 13:18:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RTmFx0iN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dulRl-0007pg-Mq
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 16:18:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRW-0007ms-2V
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:17:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRU-0002aA-MI
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:17:58 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRO-0002VG-1E; Wed, 20 Sep 2017 16:17:50 -0400
Received: by mail-qt0-x242.google.com with SMTP id t46so2459882qtj.3;
	Wed, 20 Sep 2017 13:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qFwqEGt6qJ1SihLBkLZ/xpvOEpB0CFAu2sXovo/gg7s=;
	b=RTmFx0iN6zzJW5xd7aRoLUzSY+Fqjo9FszNaCnIDiyPfe/yXiF9XzMwIm2jbpXinXB
	pCZKTt5s0dRuiwxXwztdUon6X3Wwnz+3PufiMhuFHoXuUUG/ljueWRYxIeJaKvDvuhb6
	A8UKs5mvTZMrUtw2vDtXcYqN8erqo34BFPBX7d/dFDXvtOQOsRw/zN28sw+D/fIfOXbG
	viaAa8Y44C1qN515BsfxkxApGWUYb0Qu+lI1DRgdjUyNw1FO38lDDYGPLjh9mL/g6NNZ
	XWSHHZk/8OjRp1Jm+XU9EPHWjRHf6ICB3XWz56iYIyl/EQRfjSe0XhDUDMepCw4JmG1F
	J/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=qFwqEGt6qJ1SihLBkLZ/xpvOEpB0CFAu2sXovo/gg7s=;
	b=OSaOFh61tsufvCdbtxjIM5CfnNRyR6r5Uh5BS1R96VZ4fXAh/MAbgr8kqRCRDo7tRV
	o976gv4+B0oVRYA36lIwO6FsTIlDOWtoC9EGUa5hyRhGjo4vYKKigZnpDttVtNETfh+Z
	Q937P2S7CDcFkyI95z/BBE3q6MzCOsCLjV6kfzMFh4gy9sGZizS4quuaDPYNYfxMbxqt
	bzxcAi6pcch1wm12OweYtljAEY4FxTNbsXj+pV/gL2WGSTDlH7s5j1kQmH8OobsaTYpN
	C4gTtCvLsi1mM3p5Cjx2WboqtP/0qeWmqWzkk/s4afD7WaI3ht9GIFf243VZl0wcs07r
	uyCw==
X-Gm-Message-State: AHPjjUg3DsWsvqU132V/IgerPR/7almaAyc7v9JUGkZ1UwiT1A94Etwx
	X3S564H3Q3fxZ9nN/jSPlp4=
X-Google-Smtp-Source: AOwi7QDadJQAN5JkYKRrW45l0whQuL2WtCjILCAvZfqRh/YQbascMGTo2GT4yeBmE9F8Z6i89EbYvw==
X-Received: by 10.200.34.251 with SMTP id g56mr876251qta.160.1505938669316;
	Wed, 20 Sep 2017 13:17:49 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u52sm1953092qtb.34.2017.09.20.13.17.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 13:17:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 20 Sep 2017 17:17:32 -0300
Message-Id: <20170920201737.25723-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v11 0/5] Add support for Smartfusion2 SoC
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C2OhB59Ty/W/

Hi Peter,

Now than Igor's patch landed, I respin Sundeep's series updating it to work
after the "arm: drop intermediate cpu_model -> cpu type parsing and use cpu
type directly" patch.

v11:
- msf2-soc.c: add a check for null m3clk
- msf2-soc.c, msf2-som.c: drop cpu_model to directly use cpu type

--

Sundeep original cover:

I am trying to add Smartfusion2 SoC.
SoC is from Microsemi and System on Module(SOM)
board is from Emcraft systems. Smartfusion2 has hardened
Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
At the moment only system timer, sysreg and SPI
controller are modelled.

Testing:
./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio \
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

v10:
    Added msf2_sysreg_realize in msf2-sysreg.c
    modified unimplemented devices names:
        pdma->dma and hpdma->hs-dma
    used uint8_t for apb divisors properties
    simplified msf2_divbits() using ctz32()

v9:
    used trace instead of DB_PRINT in msf2-sysreg.c
    used LOG_UNIMP for non guest errors in msf2-sysreg.c
    added unimplemented devices in msf2-soc.c
    removed .alias suffix in alias memory region name for eNVM
    removed mc->ignore_memory_transaction_failures in msf2-som.c

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
 include/hw/arm/msf2-soc.h       |  67 +++++++
 include/hw/misc/msf2-sysreg.h   |  77 ++++++++
 include/hw/ssi/mss-spi.h        |  58 ++++++
 include/hw/timer/mss-timer.h    |  64 +++++++
 hw/arm/msf2-soc.c               | 238 +++++++++++++++++++++++
 hw/arm/msf2-som.c               | 105 +++++++++++
 hw/misc/msf2-sysreg.c           | 160 ++++++++++++++++
 hw/ssi/mss-spi.c                | 404 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/mss-timer.c            | 289 ++++++++++++++++++++++++++++
 hw/arm/Makefile.objs            |   1 +
 hw/misc/Makefile.objs           |   1 +
 hw/misc/trace-events            |   5 +
 hw/ssi/Makefile.objs            |   1 +
 hw/timer/Makefile.objs          |   1 +
 15 files changed, 1472 insertions(+)
 create mode 100644 include/hw/arm/msf2-soc.h
 create mode 100644 include/hw/misc/msf2-sysreg.h
 create mode 100644 include/hw/ssi/mss-spi.h
 create mode 100644 include/hw/timer/mss-timer.h
 create mode 100644 hw/arm/msf2-soc.c
 create mode 100644 hw/arm/msf2-som.c
 create mode 100644 hw/misc/msf2-sysreg.c
 create mode 100644 hw/ssi/mss-spi.c
 create mode 100644 hw/timer/mss-timer.c

-- 
2.14.1

