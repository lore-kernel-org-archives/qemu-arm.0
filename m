Received: by 10.223.172.38 with SMTP id v35csp945465wrc;
        Fri, 15 Sep 2017 09:59:49 -0700 (PDT)
X-Received: by 10.237.62.176 with SMTP id n45mr35760373qtf.302.1505494788858;
        Fri, 15 Sep 2017 09:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505494788; cv=none;
        d=google.com; s=arc-20160816;
        b=hT0HLJDL0qs0gDZG2JEpS6UnsqEtMGqTdFxGAyxqBHs3gXk0+gl+hR6Wk03T2ptO2Y
         N7wiuLtPlbsy1K9kBVg6XS0ih3rzy5MCjqSs5VbaiscjvKPRQd8wbD0K7p24LdRzlNev
         92Ku+uhrNJ6PC7rqSywMxU6DPrefzLVyR26PVZJk7SWkvKLLJjG79+uOMbq/8SKBwD+F
         gLI9sQs6MvqKyE5dxoM9jaa38+dXTO446uaoOkOXoNViQP/b/WGG4FKIAoC3DDrJ2Zrc
         /Y42ei7Sj8dfsy0ZwXGd40ga0nyaWR6OZatPaPRzfvwmN6gnD/g2ROVZEjNaq/R56hj1
         4aiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Xi6Kr8c339VXNEMa+l7BMRn3pc3+reYk7v8xWJnIBp4=;
        b=kh46FSDdpCmtztdpOI7BIpyeDgFAzPHm9IuSOjSnqeL+EJ+ivO+jh/JjXg7CfWX0q2
         aYZDoiHp5jhKi0oWtP20Wgyssn6Sb8TVqH1UYRCdpDgO8IVa7zMDOEzcUzn6G4nUWdVn
         0TVF76mNC3E8vMlvQMKUMOep7IU2zgPodwqapJYIOLM/rZF2acKpvumX8WaRJSApj1bV
         bmW7q7I3VDwsu2oMZz9kXBy4fSRXlhWNLwRZjY4gczVnqv2C5lPcryVl75qDq7LWcE1T
         O497AUoOoZcWNWtxA/xvdbl1uhKsG316cOXRP9rhKVcvvFMKxKhALsD5sLKqUKG+J9mN
         Xg6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EMM8TwPY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p51si1371266qtj.477.2017.09.15.09.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Sep 2017 09:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EMM8TwPY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dstxy-0005NZ-Ih
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 12:59:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dstxo-0005Ls-7I
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 12:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dstxn-00041I-11
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 12:59:36 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:34730)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dstxi-0003yH-2L; Fri, 15 Sep 2017 12:59:30 -0400
Received: by mail-pg0-x241.google.com with SMTP id v82so1610107pgb.1;
	Fri, 15 Sep 2017 09:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xi6Kr8c339VXNEMa+l7BMRn3pc3+reYk7v8xWJnIBp4=;
	b=EMM8TwPYsSQ7Ns7SMnxQP+vHnxSH7ZNEwp3LlRzBpMWUffjob3rw7Lm+3REhrPxCS9
	wmBkhGREympvHOXVbXjHC8j+1DrlOErOx6uyJJemoJVHFyVHqP1yyocY7EET6fuvTzNy
	UBRIyuUBG8rxJ/DVFp+7m9QXA9moFt4/Ujcwyy/s18x46gDKhyGmpdfUlCTl1ch8DPsE
	MY7oeIf8u6UBIFP2WjVJyD/j6ySf8o3qkyRyUPRu8z5cM60ATal35OjeQ3UKsqWg+uSb
	FSKek5X+9uvbeR5CVyXioOrh2b+upcBzfU+QG+YeUoVvLMFWzWKvWSC8AUDvEP8cqUV3
	+8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xi6Kr8c339VXNEMa+l7BMRn3pc3+reYk7v8xWJnIBp4=;
	b=kPQGhMhSzHrx2NqP3UZDWUqyPrGUu4TshHVfjgThEtzcTldFcr90t/Waky/+Rs1Zd/
	QD3AelQs0NgXPxqSxMAw/OP0tmKIHU4chyObfiplfeHTkunThrZFcKDC7VhcgY5sgZla
	GgCrfj30itTqvIS/ilR0xUvi4DbAPT29WRLlxib9FbdKVp2ZdJptr0JacCRE4fuJKlSc
	caE7VRWDGelH+Ng5REbvox+3AEY8YWxuoBcZ7sv68lj5Os9Z4iUviCa85euc1TGZi+Hl
	Vx3FCIqkC5ULQXVBthKDknism0LDeoW81bC4l+MAhuYq2HgfYN3FqWim7Z5fp8/jRjJ3
	Su0w==
X-Gm-Message-State: AHPjjUhvXY2fIDwNDPal1jcU2CQef+5C8CHrVPpo9rCKDb2ZaNPm5fNM
	+H1J1Ouz60jDEDAY
X-Google-Smtp-Source: ADKCNb52LJffXfsjWTd7If+PUtHmbxjc6KAJFoQWLTyEwll4M0UUjCqwK7Ws5buxqBdEDdv8zyC41g==
X-Received: by 10.98.62.131 with SMTP id y3mr24477661pfj.178.1505494767348;
	Fri, 15 Sep 2017 09:59:27 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	s17sm3111350pgq.25.2017.09.15.09.59.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 09:59:26 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 15 Sep 2017 22:29:08 +0530
Message-Id: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [Qemu devel v9 PATCH 0/5] Add support for Smartfusion2
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
X-TUID: 09nUP9jd+znh

Hi Qemu-devel,

I am trying to add Smartfusion2 SoC.
SoC is from Microsemi and System on Module(SOM)
board is from Emcraft systems. Smartfusion2 has hardened
Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
At the moment only system timer, sysreg and SPI
controller are modelled.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

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

v9:
	used trace instead of DB_PRINT in msf2-sysreg.c
	used LOG_UNIMP for non guest errors in msf2-sysreg.c
	added unimplemented devices in msf2-soc.c
	removed .alias suffix in alias memory region name for eNVM

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
 hw/arm/msf2-soc.c               | 232 +++++++++++++++++++++++
 hw/arm/msf2-som.c               |  94 ++++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2-sysreg.c           | 168 +++++++++++++++++
 hw/misc/trace-events            |   5 +
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/mss-spi.c                | 404 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/mss-timer.c            | 289 ++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  66 +++++++
 include/hw/misc/msf2-sysreg.h   |  77 ++++++++
 include/hw/ssi/mss-spi.h        |  58 ++++++
 include/hw/timer/mss-timer.h    |  64 +++++++
 15 files changed, 1462 insertions(+)
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

