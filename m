Received: by 10.223.172.38 with SMTP id v35csp4139519wrc;
        Mon, 18 Sep 2017 12:54:16 -0700 (PDT)
X-Received: by 10.200.52.232 with SMTP id x37mr52248397qtb.85.1505764456507;
        Mon, 18 Sep 2017 12:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764456; cv=none;
        d=google.com; s=arc-20160816;
        b=GTYFP3Obc7fClSMyrz8HZnDfgYa/jktfoksW72LjrCJlghn5x7Pt5wYqK/bZ2LBBm4
         CEG9j9UlhTlRrDmmZ3NFmo+mteP/hFruN1RU8kWPrkFeN1WjleUgsIQQgBk8cbXeJ6/3
         fpufRLRowvTb6OOwCLizt1IWS8zrVomJRjWMhIW3zjKCDYkkrdbhlFOItwl+c32rfsNw
         smIargITpRgRXNKYJtuZ7CopPM7xc/M4qWVv5ohqvsmnf/JF8nZTooFT6X1YqCfQkfCh
         60vfFWNF3iLjrjGlnR/+2F0RPi88eFXdme610vH6i1nkdX+Wi3/MynGZzstgPrcxcPKK
         KMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=75BMCxLQ5BeIwkRT5+xjb0soXVo4boMzQ4jMHV8V12Y=;
        b=FtYyMmOowJDYK1O/SmYwRVX7kB7VULxY3y5fKb9Hht2ihacNblLahvz3D03pq0aXBb
         bjo/tZKb3KPDh+kSSPpErjRpJ9dwGpHbqS81GTj9KOX0PoPyL5efCUhoyEbpArhlVVM4
         2qfKzjqr40eAEwOPudDjO2t4oMYAWh6YcMudcc21CU2ki7GJ3WT3Sv8WtnMBiZo5qXRP
         80UuJRLWEMgxbJ5RPZ7aKYaiVkHWLTQGD0jk01mK7xvONgOAw/VJ7qgV6HdsBVhDkO/s
         +TAXYXy5TDjj84xY+JlgPYARM3I1uSgCkqYXdMAIyLb86V7di1LzKPSFDAQR7eU7yRth
         kObw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gZRB6vkh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p77si7339407qka.377.2017.09.18.12.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gZRB6vkh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du27S-0000Ky-4s
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:54:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24s-0006np-NM
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 15:51:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24r-0006Hz-Qh
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 15:51:34 -0400
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:48964)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24l-0006Dz-IQ; Mon, 18 Sep 2017 15:51:27 -0400
Received: by mail-pg0-x22a.google.com with SMTP id v23so719517pgc.5;
	Mon, 18 Sep 2017 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=75BMCxLQ5BeIwkRT5+xjb0soXVo4boMzQ4jMHV8V12Y=;
	b=gZRB6vkhDSiblrOZaRvabkJpoctecBUcykztcAfhOA9QB0ZTzRiY0mIuO4Uyjm7iTq
	c7UusCnd0jNRsxrqTjhqMU5DCfdxowrgWRJuDG9V3S0e7V92WCDX3ahMeRjmu9WvtmJQ
	QQN2YFEodV7yO3qXZZ/adU4Cj0GZ+eML8isiqjMB7v+bXa1Nyak+PlhPhyDYKnCqpc44
	sagAvPGtm6kvleyEitHSCHoEcEtPC3NluzwUsKfv/u/W0js4XFY8Ls7ReLGs/Q2oE17d
	rzKuYp/bT8XsnJoUxGcaipsXA8wFJLijHSZXul5/4MReCa0o2HOG7BBI1FrGPCPgsYCZ
	QMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=75BMCxLQ5BeIwkRT5+xjb0soXVo4boMzQ4jMHV8V12Y=;
	b=tBQMzil/i0biembQUEsKxocycj3Yv2cwIQeiyqOKmOyB4rmAs8/Cwzu3BSSCMH2/Ah
	LXrWW2diSBbruWaEOZb+yKpirUJAERq1r3KXbIIXbV5VdQ5Va5a+3mU9T7QvDFQhZmWH
	Ti9SaWgEAGhvsc6iMxhLXC5oMeDHydaWIr/1953c8taJi/q558Q5J1JlKpv0KZyrzhD2
	rxhBni/kxzPDBhPGWgVVZbX1Sj6PfV35kOWVo1m0uqKjA7xotOEkf4t7c0p+gCsKByoZ
	D7Qpjr7y4OoJulGIDZYy+e+qgFiC7Y5vLJW5eakz1AxaQNaiu77f84w0Kh35Jzh59Xzm
	vbZw==
X-Gm-Message-State: AHPjjUi1cm3bcZAJZ498YXX1ktBEdQa8pogpJbBFrzUTbTQBtznolGS/
	DqNykD67FmxHvTC8rzw=
X-Google-Smtp-Source: ADKCNb4HGzZz5V/ffAcQ4sqWFd6yyt/yTU3TdDKzAi6FYkcoWkwKQIjPJjjSwz8KuiKZnxrtRLpG4A==
X-Received: by 10.84.224.199 with SMTP id k7mr37490825pln.403.1505764284770;
	Mon, 18 Sep 2017 12:51:24 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:24 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:43 -0700
Message-Id: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
Subject: [Qemu-devel] [PATCH 00/17] Initial i.MX7 support
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gr5OQlnx70SC

Hi everyone,

This patch series contains the work that I've done in order to enable
support for i.MX7 emulation in QEMU. Majority of the set are just odd
fixes and small features implementation that I had to do to already
exisitng code but last 5 commits contain new emulation code.

As the one before last commit in the series states the supported i.MX7
features are:

    * up to 2 Cortex A9 cores (SMP works with PSCI)
    * A7 MPCORE (identical to A15 MPCORE)
    * 7 i.MX UARTs
    * 1 CCM device
    * 2 Ethernet controllers (FEC)
    * 3 SD controllers (USDHC)
    * 1 SNVS device
    * 1 WDT device

I also have a follow up series that implements bit needes for PCIe
emulation support (DesignWare IP emulation + supporting code) which
I'll be submitting after this series is accepted.

Feedback is welcome!

Thanks,
Andrey Smirnov

Andrey Smirnov (17):
  imx_fec: Do not link to netdev
  imx_fec: Do not calculate FEC
  imx_fec: Refactor imx_eth_enable_rx()
  imx_fec: Change queue flushing heuristics
  imx_fec: Use ENET_FTRL to determine truncation length
  imx_fec: Use MIN instead of explicit ternary operator
  imx_fec: Emulate SHIFT16 in ENETx_RACC
  imx_fec: Add support for multiple Tx DMA rings
  imx_fec: Use correct length for packet size
  sdhci: Add i.MX specific subtype of SDHCI
  sdhci: Implement write method of ACMD12ERRSTS register
  i.MX: Add i.MX7 CCM, PMU and ANALOG device
  i.MX: Add code to emulate i.MX2 watchdog IP block
  i.MX7: Add code to emulate SNVS IP-block
  include/qemu: Add sizes.h from Linux
  i.MX: Add i.MX7 SOC implementation.
  Implement support for i.MX7 Sabre board

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   2 +
 hw/arm/fsl-imx6.c               |   1 +
 hw/arm/fsl-imx7.c               | 327 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/mcimx7d-sabre.c          | 100 ++++++++++++
 hw/misc/Makefile.objs           |   3 +
 hw/misc/imx2_wdt.c              | 117 ++++++++++++++
 hw/misc/imx7_ccm.c              | 201 ++++++++++++++++++++++++
 hw/misc/imx7_snvs.c             |  84 +++++++++++
 hw/net/imx_fec.c                | 153 ++++++++++++++-----
 hw/sd/sdhci-internal.h          |  15 ++
 hw/sd/sdhci.c                   | 126 +++++++++++++++-
 include/hw/arm/fsl-imx7.h       | 114 ++++++++++++++
 include/hw/misc/imx2_wdt.h      |  36 +++++
 include/hw/misc/imx7_ccm.h      |  76 ++++++++++
 include/hw/misc/imx7_snvs.h     |  35 +++++
 include/hw/net/imx_fec.h        |  26 +++-
 include/hw/sd/sdhci.h           |   8 +
 include/qemu/sizes.h            |  47 ++++++
 19 files changed, 1433 insertions(+), 39 deletions(-)
 create mode 100644 hw/arm/fsl-imx7.c
 create mode 100644 hw/arm/mcimx7d-sabre.c
 create mode 100644 hw/misc/imx2_wdt.c
 create mode 100644 hw/misc/imx7_ccm.c
 create mode 100644 hw/misc/imx7_snvs.c
 create mode 100644 include/hw/arm/fsl-imx7.h
 create mode 100644 include/hw/misc/imx2_wdt.h
 create mode 100644 include/hw/misc/imx7_ccm.h
 create mode 100644 include/hw/misc/imx7_snvs.h
 create mode 100644 include/qemu/sizes.h

-- 
2.13.5

