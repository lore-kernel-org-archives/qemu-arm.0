Received: by 10.25.0.144 with SMTP id 138csp484970lfa;
        Sun, 9 Apr 2017 04:21:22 -0700 (PDT)
X-Received: by 10.55.24.202 with SMTP id 71mr35487229qky.190.1491736882176;
        Sun, 09 Apr 2017 04:21:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s68si10970089qkh.108.2017.04.09.04.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Apr 2017 04:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxAuH-0004xB-Fi
	for alex.bennee@linaro.org; Sun, 09 Apr 2017 07:21:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cxAse-00046x-Cx
	for qemu-devel@nongnu.org; Sun, 09 Apr 2017 07:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cxAsZ-0000ra-FA
	for qemu-devel@nongnu.org; Sun, 09 Apr 2017 07:19:40 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1cxAsZ-0000rJ-9T; Sun, 09 Apr 2017 07:19:35 -0400
Received: by mail-pf0-x243.google.com with SMTP id o126so5876995pfb.1;
	Sun, 09 Apr 2017 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=g8ovGA2ImiogYjHzRHubZbMvAxEpxNSMmWeklwFGurg=;
	b=JLMbOTcJ7k+ku1OAqtwr/NwDARpSVd7IdeQIywLXfpM0DPThP1Gzfq5d85lHkZ6KY2
	tpyys826DstAjUosp0qbeE9xO8ELk1+6DnbzAyVkLWEyn4n73eg5+xQZgLUwiVLOQ6mx
	hIkhBQEUZRUurzLI0wOsjwzGNYIqJUfh2MKq1aQlqP+DtrPY1gUO/R3GGzCfVxL6ZTbJ
	fM2bo9Wfbtg1ywLf6K86QotclmB2loc4tIMf0kCKDvz4oHy7bfz2f4D9kEnwWcmA09U7
	AWVu6x4o6SPGdJFLsfjk3VOBqLVekFvhe0ej5DEvq2lt9ufO86i8w878gZ3psQOzOACE
	/l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g8ovGA2ImiogYjHzRHubZbMvAxEpxNSMmWeklwFGurg=;
	b=PK+c/OXLrQjI8nQ4uqock3xFS943/jtX8VagLqyB61DJ1XQP4oj36GYBYqYVpq55J/
	UfUB5ssRXJ/dj6pRKj6m/UzpbOW4oquymv62XsXz9AvczaXPLUzcJsGh013Szw2Oknyr
	Q45kKqFaxdMpL5hh2UmXQg2IwPXRux10ps0005F0PVikCDdQzjWiK8nuy2RPnD4AWxlc
	ml5InEEYOiQgESfxtvNAQRf/5/R2t35NUBMEf2xTvu4kZofuIk8MMnS2ZAxXJUgnnaUM
	AXRTCy+FhibaUF6k955lnym4EwtamcQ9VB4hv37cEsGEbuvEfr+nyuNhlWLviiDgd6jV
	mOsA==
X-Gm-Message-State: AFeK/H3yp9cUly5qchnA6iUxLhHw5/kQneLENwnb4178xnZByD94ujDWAuJxhXuW0tlBnw==
X-Received: by 10.99.141.67 with SMTP id z64mr50265969pgd.118.1491736774119;
	Sun, 09 Apr 2017 04:19:34 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	g5sm18914139pgn.38.2017.04.09.04.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Apr 2017 04:19:33 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun,  9 Apr 2017 16:49:14 +0530
Message-Id: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [Qemu-devel RFC v2 0/4] Add support for Smartfusion2
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
	crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OoEZol7z2KZi

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

Changes from v1:
    Added SPI controller.

Thanks,
Sundeep

Subbaraya Sundeep (4):
  msf2: Add Smartfusion2 System timer
  msf2: Microsemi Smartfusion2 System Register block.
  msf2: Add Smartfusion2 SPI controller
  msf2: Add Emcraft's Smartfusion2 SOM kit.

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   2 +-
 hw/arm/msf2_soc.c               | 141 +++++++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/msf2_sysreg.c           | 168 +++++++++++++++
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/msf2_spi.c               | 449 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/msf2_timer.c           | 273 ++++++++++++++++++++++++
 9 files changed, 1036 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/msf2_soc.c
 create mode 100644 hw/misc/msf2_sysreg.c
 create mode 100644 hw/ssi/msf2_spi.c
 create mode 100644 hw/timer/msf2_timer.c

-- 
2.5.0

