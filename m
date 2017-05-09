Received: by 10.25.0.6 with SMTP id 6csp226883lfa;
        Tue, 9 May 2017 09:45:46 -0700 (PDT)
X-Received: by 10.200.36.66 with SMTP id d2mr1256842qtd.9.1494348346294;
        Tue, 09 May 2017 09:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494348346; cv=none;
        d=google.com; s=arc-20160816;
        b=FYKfT/G7DLoRNVwdzDEE4iQJHoiQE21J/EzxeAv7mAba7tF4HI1grFJrAQemHYlnHE
         NQKYbz/FBVQDv9EX5fZgBS2Nu89K4iQVCpuCyuzwKyqp5jpXa//YPdX9NQcV9lUhFvtE
         vsrU3bDmQsDZcDYEq4Qsr88LPFYk0qzSrdMoi6ueTZ3LDtJ+417fGw//ZxZ2Rfd7arlf
         s4Uafz2kUoJ9yvCwjRCR7xEu9CCn1yPhxQ9DkX4Y6kHOfhP52iIOK6Jdzbq/sEJHoSEq
         XICGui89tcSqXVVNMc2IXfqsHcGwElVSoj5BWXjbq1tLZGvq6p5Sx4uAjIIkAbT/TvdS
         wxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=oL6RW3KUr2jQwB1SNGW23QFm+Janlrd6nhJRfPwZA7Q=;
        b=jkAGbUTaGm3A92FK3+NtLn0HMLEK6PPjME/VjJbJ8M5XiVtZ7SgsSct0awksdt2VtA
         IEhd7THPWiQTYZbDBQ5gtR1k8b+Lh/PF7XVevwwUankrmB2hRGvB+jSFPLI4+YPptmmp
         Rau4tkqPSlYUIPrJUVjJk/W+evtc1XPq5PwfKsF1fPe+bDbkUBJpzVcp+X5YRDvLI+uV
         ZIozzpcRFZWR3wtAcegcMN6MM4OKLsTNsOHtXnhzS6AuTmkyUaFoHwxAiFPsKcR3Pv38
         xIWjGwq2Xs+elf5tIqaCBjZuCmuXSGcw+KDGJAPihI092ygbUsXkJkSoZDLgvxTtR2Wl
         he5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 50si442237qtp.88.2017.05.09.09.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 May 2017 09:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d88Gf-00084X-PY
	for alex.bennee@linaro.org; Tue, 09 May 2017 12:45:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d88GX-00083F-0H
	for qemu-arm@nongnu.org; Tue, 09 May 2017 12:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d88GW-0005HX-20
	for qemu-arm@nongnu.org; Tue, 09 May 2017 12:45:37 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:35213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d88GQ-0005Fq-0n; Tue, 09 May 2017 12:45:30 -0400
Received: by mail-pf0-x244.google.com with SMTP id u26so661468pfd.2;
	Tue, 09 May 2017 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oL6RW3KUr2jQwB1SNGW23QFm+Janlrd6nhJRfPwZA7Q=;
	b=QcNIM1AFTCWWlmFHttdTC3p6magm1GOAEbuKBKAhHaYxRzRzJJqxrx3p3XT+728RgL
	+qguMfdUmZTLQ80QoUEjjar30Q+Qh7oZqQ4Q6xMuCAX1LJioqhAtvwQfCLdrDRjua6q9
	Fj0Wnqn0mGMGIvKOv6y4uUDIWj+NRBuWJ67BISaosmvf30yYKQZj3RlDmHkDybLgAAOZ
	OU2+UT4QoXm8n0N+mUUOPI13m6CdLxPyUFQvZsYw42gXY96UVF22c7O1I5vp6rEKYvDe
	gBA94LOubvS6sU6JbpjY7bktz11xko0E5ZIsthrwV5eGmQyNuE24531AsWWJ+n65FI71
	eDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oL6RW3KUr2jQwB1SNGW23QFm+Janlrd6nhJRfPwZA7Q=;
	b=qJAbmGxVStnFB9Llcq2ow6t+zH/KUC4Q9/XgzDd8xLStDUQReDnn4NQVnEcv8m+0Hg
	EhPXtzm3wNMT06Vx6GeqEKtBjKIllMziJ3vNNqm6QKLvEz53ToEX0ylDkjsBeHvGs+Gz
	wig6W0w74qyhzwsrRrh5TnmoC0nmJgj37Xz6tSnXpD+/5+PBLSXsr0wX6AgPr/w1lUIu
	7UixNPhiid5bG1obGelxKS57K5rU/51Ed04dUvczB0omFfCTX7ME98rE6SvRtEP8vXKG
	M3KnCUeyKbbXrcNLP4GMIsERqs5j4BQXRlONC2yef2un3uLzFpL/1v20V5f/ASsFFVCw
	kpsw==
X-Gm-Message-State: AODbwcCyLUR5C8/x7jqT/XW7Ju93A+RI9xeEQMGGuV6Yp/5Nj3B2wPK0
	kkmmN47WuoV7oA==
X-Received: by 10.98.41.196 with SMTP id p187mr958404pfp.150.1494348328713;
	Tue, 09 May 2017 09:45:28 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	o194sm833320pfg.117.2017.05.09.09.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 May 2017 09:45:28 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue,  9 May 2017 22:14:41 +0530
Message-Id: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [Qemu-devel PATCH 0/5] Add support for Smartfusion2 SoC
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
X-TUID: 2LsTPydgVZ8k

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
 hw/arm/msf2-soc.c               | 188 ++++++++++++++++++++
 hw/arm/msf2-som.c               |  67 +++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2-sysreg.c           | 131 ++++++++++++++
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/msf2-spi.c               | 378 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/msf2-timer.c           | 252 +++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  60 +++++++
 include/hw/misc/msf2-sysreg.h   |  80 +++++++++
 include/hw/ssi/msf2-spi.h       | 105 +++++++++++
 include/hw/timer/msf2-timer.h   |  85 +++++++++
 14 files changed, 1352 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/msf2-soc.c
 create mode 100644 hw/arm/msf2-som.c
 create mode 100644 hw/misc/msf2-sysreg.c
 create mode 100644 hw/ssi/msf2-spi.c
 create mode 100644 hw/timer/msf2-timer.c
 create mode 100644 include/hw/arm/msf2-soc.h
 create mode 100644 include/hw/misc/msf2-sysreg.h
 create mode 100644 include/hw/ssi/msf2-spi.h
 create mode 100644 include/hw/timer/msf2-timer.h

-- 
2.5.0

