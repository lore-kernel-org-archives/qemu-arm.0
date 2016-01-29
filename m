Received: by 10.25.159.19 with SMTP id i19csp1202711lfe;
        Fri, 29 Jan 2016 14:51:13 -0800 (PST)
X-Received: by 10.140.169.9 with SMTP id p9mr14734295qhp.50.1454107873758;
        Fri, 29 Jan 2016 14:51:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si17368570qkb.126.2016.01.29.14.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:51:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHsn-0000UJ-6h
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:51:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsk-0000QY-11
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsi-0003QR-Ly
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:51:09 -0500
Received: from mail-bn1bbn0107.outbound.protection.outlook.com
	([157.56.111.107]:20016
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHsd-0003Lx-OU; Fri, 29 Jan 2016 17:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gBQUTDv8DxBeQuofI0IPstx1ZnjXAj4d1IfqjFtgEBY=;
	b=mow9hCifAw9+eh5OBpQViCcxiNLuTw2/9HPt44DQDwEcUzwak97PvmkqJJJfwnuNrftVeKUx1UnpCbD5IerOjYCiaMX3gktDzWBZjLYK5F0WlE7y5XPL88WvVhDom6yiCckQgBqvdRdO4Xb5E9i3qgedXr0cYFq8D99m6moxlmo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:c::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:50:59 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Jan 2016 14:50:36 -0800
Message-ID: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:c::724]
X-ClientProxiedBy: CY1PR17CA0008.namprd17.prod.outlook.com (25.163.68.18) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-MS-Office365-Filtering-Correlation-Id: 393f0207-8cc2-4e36-8e96-08d328fea8cc
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:SP3CrcoOq9GquN/fIZBbJQSUrjGhSuAciCDZmLJJkjdyVY5yrPdm7nDGnHLaHo4aUBiYSAYdGOb4w965G0icsGXAR2qUOJ5a4uuy6tmRWdCsAVmxucbiDW3Z5IvWC+Q1hoVkYGDZaqx4+8jyPTpxUqPJ2oadqumqNO19iAKumdwHI7gbBU4Vi9QM05pBWep2;
	3:AgEsaC9Dbs5rVUt+dffOvW1wbjJdAVTJIYnb1MgFERtqJUQVjCtjxae6nGq17dokeFAuOEV3au+We2OYSwCfmNeYXuyKbv/U81I6ndU9BRVhdgMwy1WYxYx0wnIOWB0n;
	25:gsY+vkz4E5KGvBONJmKEYZtr3cnr/IRfB6C2hQ/pKsUxpUmv8NWIZ1lP1QgznXYY81pm4ulLU4BlTeTOlP38FzlYz0RNdhROKbhP67ZJEAZ22kbBUD4lmGOIG1uTLgFpdB95kO7yYnJQQYfbZD3SytQn1nOsI9uDjXA5NO2RUoAH0wtWusw+M0QPXtGVLNsR07AanjucPvgFew7bVCFSmLKUU3UYuCe3rS6ubHyDq9vGAOOYOl+AMYksYtO8xeL8vjYv/0tYJ6ftg8sJ66/Uq0T09AHs1G55B1sfHlZiDuk=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:1WNSp+a6UnGNWtocGVw6SachFZqEyA+od6c6rdvqjFRnrRX93Y0lNlirlDW7iRs8p+xT0x8XNipHGyaC0o4Bt5A7saQ/mpFUSeruzbFTh8QZwdWkZfkTwBOjLw3tHSrE8QuGHoBhBFFG1KGod2eY6G01Tn95LX7TzLigzRiCceiaSOM0p3VDbnsvSQ+afSq0Z8TYk/WfMl2fujSI+hGBcf4YXYJ9riNfs4LrduC4Y8fLUEQgoKDAaZOFqbQ9WScuTKrTryb3s9kP5v+oiSVOv//q7rFmFuqm9dVWrzef0YphlzmpgMmsUD4rCft/Wfd3FiNoVDdzLDlauAbu3AGfyx84nrMvzU6IDC1193PxnMrztrhp1lVAz0MiX+2VEN5dCTwCCJobQ/16uEXIouAb5VoN5evxibKhhAdc5gV29h44riZfJ6Z64uN4I23cu70cWTqfrMUv1KUOU3jftfm7ZiwcfpndtTKc/VNCi/yiwX1HxUnVsTMWBV4DErUVk05m;
	4:Emi5oU9ZEgTA3URdjHvdeTdh/heBmkW4kAp6B0aQLdJwEXLoonRjSNFTBJo5STIyv+9qfNmJ+kDD5FaKkEPQFv1o5KykGQjialsjuAwV2CGZ9WzSkKC2A6RcLSJAlWbUT4v/opWvchr3GVSPwwpKazGlF9UkWMxzkw7dwYqbC1dywsld7myT8bIEo6j9aBmMdoAMbUI02THYs/S7hzBa/g2+NxxRltIhDzrIaW/1FFaueVCZrwjOGmaZy1gN+rvu5jMf9R8vV/iEO3+dk1JKEW0DsH9/FkZWXHkfEoXUI/+zoBsgwzCqc4/XtmLGXaepAqgW0fclPvs2QhQ+JtVS/t+GyKb+X1GHNzAuXjgrXoKTOdYzzFgOpRhhHppjaUFT
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2034F5D9662E19EA94C133A99EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
X-Forefront-PRVS: 083691450C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(55674003)(229853001)(1096002)(6116002)(15975445007)(3470700001)(122386002)(107886002)(5003940100001)(110136002)(5001960100002)(40100003)(48376002)(47776003)(86612001)(575784001)(86362001)(50986999)(4001430100002)(189998001)(586003)(92566002)(10290500002)(5008740100001)(87976001)(4326007)(50226001)(2351001)(10090500001)(50466002)(36756003)(5005710100001)(5004730100002)(77096005)(2906002)(19580395003)(42186005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2034;
	23:OfshYSjHD+k40VyBY7VVBpn1iivp14eDtyCl3zS?=
	=?us-ascii?Q?aTCPDeE8+iGdpY9Qih/aNtJAR9Gk0l5ARjhKgxLcX82h6oS8vj9H/CRBl9bb?=
	=?us-ascii?Q?oaWLeWid/twGuBjjN+87MuZK3Hw3l9nrl2HXOZ3jGppKSz5F6B14g/47zu9Z?=
	=?us-ascii?Q?q0F4bSywFfXmMYkA0Nc6CGD/6GXt8OMGA6YALnSKdSNTKwhREF9EBp3GC/+T?=
	=?us-ascii?Q?hU6g/EkSqYEuMxHx1E1iX4oVPVu8LXe/pwvdwsnZfknbp86P8IltrEsGTOL0?=
	=?us-ascii?Q?fok1Zlm7PRBj3+dt3tB2pNmnGHomumj+MSiTY7A5uRRfNoJn/ROzjGfrShmX?=
	=?us-ascii?Q?hQXNQnJJowhpKUDFDtRELyu84OWR4HQEur7tY6XyJcxeIPEN+TKQ1MLOst2G?=
	=?us-ascii?Q?NFR72InW/DF0T3IRowM7aw6nWMnsf66p0vRK7E68JuowKTk3WLsOyj21/9LN?=
	=?us-ascii?Q?duKYs9UF3sX0MMAc7Z8V9CrwE9ZnGdxiq3U/x7nbw9kYxy9iGYXn9V6skjHv?=
	=?us-ascii?Q?ix7hZSxd5bsY0dq/g6OCUEQDg5j9vvqVsrjISHkf8tYOFU2RoxAIeZtW32QQ?=
	=?us-ascii?Q?kMmOhfGy71IWBicMnHYrktsjTn08nWaVTFUCKtLaMBETjNm9OdHOShUiXspY?=
	=?us-ascii?Q?YrcWeMMhFdHzjWWh52/ez/QJ6QZnDYxnWwDMvSdOEMlbySx39YHyuk22qJHj?=
	=?us-ascii?Q?ZP5SxZnluFQtNtW+aoeZxuJYBM2Sc5DrXT8Dag9alwz5V4PAKayjYosck9QC?=
	=?us-ascii?Q?hEIp8J4MXQBcR2EdBYhdIVWvcmW9RR64yfpTLQN1PjAVupr/xuuQnA77kgwU?=
	=?us-ascii?Q?XkfMVTWaJrA2/EW8yqnIycm0peLpwkjwFNjB30SdvnIfpW0cSbg+iB5kHI1s?=
	=?us-ascii?Q?PG+RMgl9KkRNNAt58eHn+30VwYN0s091deHv2ufca5dKTwYu0Siez9iuKJhT?=
	=?us-ascii?Q?zSs4k7hk3ppMBk+xn92cmUCzk0SqrxJ0GIEf9EeKhCfduYnD3MOVGBBcKUpa?=
	=?us-ascii?Q?U5lPl8BtCoXxSr/g2PLD6/RZV5HpNGQSnazCyz+21MK0vvE09Delbxe2HT/b?=
	=?us-ascii?Q?pMkh5+O7AzW+E55OJhXVzib6lEGOm?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:syilYg0JQK7q3EQ3lOb4bviwyySzz6GvxafcXwNAC98Df5vB+9Iny/jhZEHJGrii7w1FOhKEL6m+jk1vqU2vvzvwU1vfiSE9GYpy16Q9WuSCrEB1zcEc/4Oc9bKAAQdgojuCu/0sQS18Bmyd8TK30w==;
	24:D9t9Jm9trgeSiSOUsCtHb9PRQQHSWoxDNw/gGNClubargXqqIbLjiW515j+Tc6eoJHY+1dJYRWGjQHXzkDZU0i7LIQ7v0XCY9/iiYIj9j94=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 22:50:59.9716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.107
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-arm] [PATCH v5 0/8] Raspberry Pi 2 support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A9ko7WysxJrp

This patch series adds initial support for Raspberry Pi 2
(bcm2836). It is heavily based on the original (out of tree) work of
Gregory Estrade, Stefan Weil and others to support Raspberry Pi
1. Thanks are also due to Peter Crosthwaite for the code reviews and
feedback.

At the end of this series, it is possible to boot a recent raspbian
kernel to a serial console using an invocation such as:

  qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
  2015-09-24-raspbian-jessie.vhd -append "rw earlyprintk loglevel=8
  console=ttyAMA0 root=/dev/mmcblk0p2 rootwait" -serial stdio

(where raspbian-boot is the boot partition from the matching image,
and after commenting-out or removing /etc/ld.so.preload to avoid an
unimplemented setend instruction).

I plan to add DMA, USB, framebuffer, timers, and other system devices
(power, mphi, aux/uart1) in future patches. In the meantime, the
complete code is available at: https://github.com/0xabu/qemu

Although this series includes many of the peripherals common to Pi1
(aka bcm2835 aka Pi0), it's not yet possible to boot a Pi1, because it
requires additional peripherals, so I'll also add that SoC and machine
in a later patch.

v2 changes:
 * cleanup based on reviews of mbox and ic devices by Peter Crosthwaite
   (see specific notes on each patch)
 * removed custom SD controller in favour of sdhci

v3 changes:
 * cleanup/tweaks to mbox, ic, peripherals and bcm2836_control devices from v2 review
 * changed how I allocate and pass ram from the board through to the SoC
 * cleanup raspi_platform.h
 * s/_/-/ in device/property/type names

v4 changes:
 * refactoring in bcm2836_control
 * minor cleanup / style tweaks in other device emulations
 * use qemu MAC address in bcm2835_property
 * avoid use of smp_cpus outside raspi.c
 * made setup blobs relocatable, and merged with highbank's copy in common code

v5 changes:
 * minor cleanup / style tweaks only

Cheers,
Andrew

Andrew Baumann (8):
  bcm2835_mbox: add BCM2835 mailboxes
  bcm2835_property: add bcm2835 property channel
  bcm2835_ic: add bcm2835 interrupt controller
  bcm2835_peripherals: add rollup device for bcm2835 peripherals
  bcm2836_control: add bcm2836 ARM control logic
  bcm2836: add bcm2836 SoC device
  arm/boot: move highbank secure board setup code to common routine
  raspi: add raspberry pi 2 machine

 default-configs/arm-softmmu.mak      |   1 +
 hw/arm/Makefile.objs                 |   1 +
 hw/arm/bcm2835_peripherals.c         | 204 +++++++++++++++++++++
 hw/arm/bcm2836.c                     | 165 +++++++++++++++++
 hw/arm/boot.c                        |  51 ++++++
 hw/arm/highbank.c                    |  37 +---
 hw/arm/raspi.c                       | 152 ++++++++++++++++
 hw/intc/Makefile.objs                |   1 +
 hw/intc/bcm2835_ic.c                 | 236 +++++++++++++++++++++++++
 hw/intc/bcm2836_control.c            | 303 +++++++++++++++++++++++++++++++
 hw/misc/Makefile.objs                |   2 +
 hw/misc/bcm2835_mbox.c               | 333 +++++++++++++++++++++++++++++++++++
 hw/misc/bcm2835_property.c           | 287 ++++++++++++++++++++++++++++++
 include/hw/arm/arm.h                 |   5 +
 include/hw/arm/bcm2835_peripherals.h |  42 +++++
 include/hw/arm/bcm2836.h             |  35 ++++
 include/hw/arm/raspi_platform.h      | 128 ++++++++++++++
 include/hw/intc/bcm2835_ic.h         |  33 ++++
 include/hw/intc/bcm2836_control.h    |  51 ++++++
 include/hw/misc/bcm2835_mbox.h       |  38 ++++
 include/hw/misc/bcm2835_mbox_defs.h  |  27 +++
 include/hw/misc/bcm2835_property.h   |  31 ++++
 22 files changed, 2128 insertions(+), 35 deletions(-)
 create mode 100644 hw/arm/bcm2835_peripherals.c
 create mode 100644 hw/arm/bcm2836.c
 create mode 100644 hw/arm/raspi.c
 create mode 100644 hw/intc/bcm2835_ic.c
 create mode 100644 hw/intc/bcm2836_control.c
 create mode 100644 hw/misc/bcm2835_mbox.c
 create mode 100644 hw/misc/bcm2835_property.c
 create mode 100644 include/hw/arm/bcm2835_peripherals.h
 create mode 100644 include/hw/arm/bcm2836.h
 create mode 100644 include/hw/arm/raspi_platform.h
 create mode 100644 include/hw/intc/bcm2835_ic.h
 create mode 100644 include/hw/intc/bcm2836_control.h
 create mode 100644 include/hw/misc/bcm2835_mbox.h
 create mode 100644 include/hw/misc/bcm2835_mbox_defs.h
 create mode 100644 include/hw/misc/bcm2835_property.h

-- 
2.5.3

