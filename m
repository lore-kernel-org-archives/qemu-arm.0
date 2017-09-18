Received: by 10.223.172.38 with SMTP id v35csp4112546wrc;
        Mon, 18 Sep 2017 12:23:58 -0700 (PDT)
X-Received: by 10.55.100.11 with SMTP id y11mr19935577qkb.54.1505762638273;
        Mon, 18 Sep 2017 12:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505762638; cv=none;
        d=google.com; s=arc-20160816;
        b=HbLmKMXhWtHExvhAEMP4FYpkKsF8Wb2dCAXU86Tr3OTP4EicQptNxZ+uSOIkVUEf6l
         LH4g1yZkay7OHTYmuD5UqKEu0u6GbtEreplXhvvsI6SIP8jim91sTKO5jzYBjwSV2SoF
         H2nZbm3xRNzYRVSytuIqA3jfYwXSneaLxBgZHqC++hxEQg/EE+hbCtOQ/Jv7CBhglLKy
         VvSvH1frQrCDTXNP+Toh4pGmkbrHSm/BYao8mt4pIntGCIWWmv5pqPuXBEjariOejBZ+
         MTSi2P/EXFJCSbzRJSFDLtnIcpnfymNHT7gwbXEmEZbRLbVqMN+ZdyYNzFuDvBlKMaMb
         UIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=nCTgyvYqB/u+xu6qca9t9ux5vSZFO7sI1NtvTW4OPc4=;
        b=bsnlQUJhMl0U62j/KZ6z7WkUWFcraSeV+z+84WJZ8OkI4LPiXRC3luMWvv57IPu4MW
         HewGbkYgF32PzygkSfa8yNGMzQVDvBNSCGBqlv1gRmSbgPMbtR0vbs8li+k2vhPNRyKi
         A8MeVyIytYeNAvxcRv0hsSUsQt7epXSCgd2wrqpfTRCEUzWVgDn/6kX/H8b+kh4cJtCj
         DwQUeLwTFdsvDK5BmYXe0TWtuQxK3kU07m2Okig806uBbEQAxPVF4Qr+sTSECcWA6ekJ
         xY01WR+50iq5sytGJlQL4hD+mBS26+Ql0CHkyyY/zu+yp41SMrXKubIQF8NVkSe1IbFJ
         CSEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JP76xzMr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11si1400165qka.403.2017.09.18.12.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JP76xzMr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du1e7-0004XG-To
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:23:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1dt-0004VA-Po
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1ds-00026q-Hh
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:23:41 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:37448)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1du1dm-00023O-2w; Mon, 18 Sep 2017 15:23:34 -0400
Received: by mail-pg0-x243.google.com with SMTP id v5so728181pgn.4;
	Mon, 18 Sep 2017 12:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nCTgyvYqB/u+xu6qca9t9ux5vSZFO7sI1NtvTW4OPc4=;
	b=JP76xzMrgW5l5emvRM2gY2Eh4OYJ+L+DNnW9tv21axt+0YIbsG+xrbMoNEnwZbgn37
	nelj05c0SOXmm+v+USih7X9OoDPCSFp6IKwTGZreDW/XifiUNGJMx4uf37QTpSejtcR9
	pBdgX3Kl4zejB9Lx3ag722yoYmBzTL4Kt5FQzvksQ53Vm9qUuOTVq+UmS+a+Kyqlnflv
	EnwPV9ALG8Cfvign24kCFLa+YVVBhYTx5dRZtRYCFTvOZ5GRJDiGehYuTTaO24UEkwY8
	TSnq3kFhns8vpwgTUu7QH6yS0lKi64xkfbPVpt6N3mzMlyGNFASQVOLuYMXof7dNgpBU
	OnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nCTgyvYqB/u+xu6qca9t9ux5vSZFO7sI1NtvTW4OPc4=;
	b=qglnEYwNeMJf+Tu9nbH4Of/krHx051pGYWjapZXS8ueRr5SZqk/7dltweVpkBtzPgm
	GfUvmewddTTrk1vNbGb88c7RNVWHLdaninyD5HuRwP08CJ0NicVQBinLUkbHh+o0d3Bz
	CTptCcmHdzsQVswApkTibXfghzxux3IqyOp41s+919X16K1KYZrmyE2Jq2pThqXIHFtk
	yar7YBsbWavk0ZWc2bhZsGA5hsi0TstTCEr1jpOa/s601Ry1vLRSwWMUw0VwjlYArjqC
	G6cycFMW9EW73smrWNeqs1XlXpuDJGNgLvcQNt5gWshfdDV4KmFLu4Ia2KAuO4YbjIvU
	SNgA==
X-Gm-Message-State: AHPjjUghCd2i9hIX7UKq7f5hbFuTdmBnmdChuYnSeEdsyDrxBYUM0WGR
	B1/B7K1nOOdH3QVr
X-Google-Smtp-Source: AOwi7QBhNtnEgSiDOjvbMpvPSPgxSKOSoGR0oVVBb5weQYd9NIpuIhtCgsh1iFiIS/ZmRNGbEolZ0Q==
X-Received: by 10.84.253.151 with SMTP id a23mr16176748plm.144.1505762612828; 
	Mon, 18 Sep 2017 12:23:32 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id w12sm169701pfk.83.2017.09.18.12.23.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 12:23:32 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 19 Sep 2017 00:53:16 +0530
Message-Id: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [Qemu devel v10 PATCH 0/5] Add support for Smartfusion2
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
X-TUID: a6eKPIe589hB

Hi Qemu-devel,

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
 hw/arm/Makefile.objs            |   1 +
 hw/arm/msf2-soc.c               | 232 +++++++++++++++++++++++
 hw/arm/msf2-som.c               |  94 ++++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2-sysreg.c           | 160 ++++++++++++++++
 hw/misc/trace-events            |   5 +
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/mss-spi.c                | 404 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/mss-timer.c            | 289 ++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  66 +++++++
 include/hw/misc/msf2-sysreg.h   |  77 ++++++++
 include/hw/ssi/mss-spi.h        |  58 ++++++
 include/hw/timer/mss-timer.h    |  64 +++++++
 15 files changed, 1454 insertions(+)
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

