Received: by 10.182.158.201 with SMTP id ww9csp4394997obb;
        Wed, 23 Dec 2015 16:26:20 -0800 (PST)
X-Received: by 10.140.151.133 with SMTP id 127mr46744314qhx.61.1450916780629;
        Wed, 23 Dec 2015 16:26:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v70si42381454qka.110.2015.12.23.16.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:26:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtjY-0000xS-5s
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:26:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjB-0000Cc-MF
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:25:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjA-0004u7-Fu
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:25:57 -0500
Received: from mail-bn1bbn0102.outbound.protection.outlook.com
	([157.56.111.102]:56128
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtj1-0004si-UI; Wed, 23 Dec 2015 19:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=CnA9d7Lsa+/Ztxm4PpkgydqNfgmVrCimSwEDJ6p7hzU=;
	b=o9D3xC6xy1hQxIEM60ERxDQF6fm+vxXeP0PYDdKUBKQs8e2nON6Kuh0S1BVMK49giBh6trh28SBUalHpZfWkfarccAgtHm1q8ViDiiWapwRe9p1iWh/bnaQuP5QeRxYuj6IqOkUOOO9S6suTimlvaJzIJxk2jqYaNl/sTSF93H0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:4::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:25:45 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 23 Dec 2015 16:25:24 -0800
Message-ID: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:4::724]
X-ClientProxiedBy: BY1PR16CA0031.namprd16.prod.outlook.com (25.162.29.41) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:hEfdw+xL+7XW1UbZK0MQCmyqcCoUSbeThx13GtanBw7Rhe77ECwxabF0FSseAiB7ak/FTqO38KHVo3EMO1Q41Kwd1q9gctyc1qk4a+y+6kfyEWXupQzuSJYHq6cuAUR7rhKC26ZourtCzE3ZLjH6oQ==;
	3:6MEBIE6O3CAexIceL7Vdm+73Xpqy0poSVssxjKYhpqsOFU4dgLC6OvcVKbZHwsu5dbvE8Y/TIUnWzVfYh/ParrEwNxcAOb8vpfeJyheC9XulDTlUQWPYpZY3ziROWIPi;
	25:tlBITXVKISXI/c3a3us6gf0ZRUVXHNW8fBitzYph0nehznq88tYVHeKgFCbUHEVYFKi5XOjH3qt+XA+X99qn8Cvjy71hR+aB/Lv05gUbpnpL9pxUTNs7P29hTnlPAuGuas0VMCVp48irjaTkP/Piyu9PdmapjetaxBeMjQ/E8fhZCpE68bXTnm7QNCCcMWKZ4iTjyK9ZkOd03SgTVmr0Vsw8KrdviSYIUVgbTz7TgCg5a/N6bJvkLGBDhOJZIZbwFl1qkdUEVEHgraXQbnv1TgnTV/hOnJx1fRBJfWdoHTY=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:jqhR43iSJFD7+Kzu+h039kaB+HrnXPMVoVSH2noluE59+m9hRQOTWKhRXuab/0Iqpp7QNT2mc3ZM6E63tw3J12Jt2zv8H2MH9/4gmuZ+ov996VztyW0jsXlhy/uRobvIb+tfzaRU2SOj/CHIES6ZfV336YsMD+DFOLZl3KuRO0XHEY7EGZ2ObYdOwuNDEEPEXyfpJIk+9uwcBGf1y3VRZoa+hwRq936PjjgfkroEkZh7s8jJS2f2Agu10oOlWeObDhqA5w/U/rD07sKOCg6C/6+qhoyLnWxNrYxGZ1hxCxokFi/3WgS++3whGRrtmHcrG6GcaRvkcEqPAYSBAu2CW1w7SAq/rwzdAS8qXhcCtDrIqqDN42I25kZ7zJwIirjxpdLyZ/66IQym7ipo+Rrlt1/RUsi/R4+6eFfQI/v5TVZ4ji+n8KcFvG2rr1QSJiPvZOCeCmU4PnFq73E4wW6XPdZg/jv5z7Tt80CYC6UGMyAVju0L9dpsWNPZmvZARYXM;
	4:7ydN2ITEr4eg1cwJD8V+NOEkLZMWUAK0RhvG53yCqBLpGrdeA79pPx0F6IWKlEsQConK/HR6bf557FbmBuX4kwkFwrFYVDXLRj2/9fbVd/2KzHhCi5ULhbUhBDtlAxvbCRYDZu5ktNFOB+zV+wWWIxLGqc0nXpoPbDke3dTRzZGtAqopmkHeKj+gFdaH6rUgjKi/ZunlnvcIjNeuSljt3qSRr1/W5R2JSlWbhb3ti+HLkZ4aRUJrJRHHNSP+xq92QREP/z5HZI2CEFpmqfqTKU65qXIyoxA+5Rd83qsH/3ilITO5BC15xMcsiH2NLblDtml/BNYDvUk/C0uvETj1DPYz3+Z96yu6nXx7dLr5eIaSs/cS70jEI25DmYHNK3P3
X-Microsoft-Antispam-PRVS: <BLUPR0301MB203350026A56A0F674FB956B9EE70@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(55674003)(199003)(42186005)(122386002)(97736004)(586003)(81156007)(1096002)(4001430100002)(19580395003)(92566002)(5008740100001)(40100003)(575784001)(101416001)(87976001)(50986999)(48376002)(86612001)(6116002)(5004730100002)(50466002)(5003940100001)(110136002)(105586002)(5005710100001)(10090500001)(47776003)(36756003)(229853001)(189998001)(5001960100002)(2351001)(86362001)(107886002)(50226001)(106356001)(10290500002)(77096005)(15975445007)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:m29ghjYy3W0fMGArVdrsSQrpOz08G5jN40b6r/r?=
	=?us-ascii?Q?gnkyGk53baRKJ+nN8lymJUj2pOtpQAb8LgYV8kf4PF1JXto2ua8WXqatRB5g?=
	=?us-ascii?Q?VLHYa/4FQZJb/bUIdKaADBpWUkq3vV9GXKQPtwhuPxuO0Tz6gvBXxhXapIO1?=
	=?us-ascii?Q?RKKm9wpkEx/hJOu8X2rCJ+uyj8+SqP1Yrj3BqmTg4MeLn0kSc23UMpiVEeo7?=
	=?us-ascii?Q?KTxCi8oxNusums3dQZc5Lf7flH/nTErUmMNeIH7HSVAvpkTWUI4AU2t5x7j9?=
	=?us-ascii?Q?zmdG/IP5bV+QItFklVr/sfs995hh//EwLPYpgsiHa9CK1szos4+npMwJGLxu?=
	=?us-ascii?Q?7kLse2zdjVo3H8v2ZBM/BOazwMTjnBlEIt+b4oiT/mFP8X/SSfwDB4ayIBXb?=
	=?us-ascii?Q?qqdk9Z0bDGG1yqZLgY2GKM0BbTNsXgMVbb+wabePTxR40KouFud81T9qzt3F?=
	=?us-ascii?Q?Tic1GVXuh8SRtKC5NbhMC5J0pl0LOyZjASFGpWedlREy11JqyrBVRYt8JSPE?=
	=?us-ascii?Q?yCFYc2gSK2Zyeea3eYKdCwrEX8plhLAT/ETzj5bWYb0TW81yl4/thxcs0hzI?=
	=?us-ascii?Q?7F420FBzp9cSA81zdfIgDLgjRJKNpqJl2+J2pFGT/swjAzTKzYCZVCrfSS86?=
	=?us-ascii?Q?nsu0Kc4eG3QnRzAfZTmN8pipxukQd1egpK7fCK7n0DHqeLVLwv7d1Ora+E6G?=
	=?us-ascii?Q?2ZKjFh44EQBeLOA+qKqMKA0fUWn8WARLhexYpETWt5mswlZ1HNEJddX9axUm?=
	=?us-ascii?Q?NCPjVzadpc6SiDpTA3k7TvplZb0BKkZjO/7n3VvIZy6y8MtYppsnl/WJ8sM5?=
	=?us-ascii?Q?HK2N1shfq3nXCY0994MpXEmgeXLTDY8Wsev6YeRn9Ek3/hhYHFEZq8l7dh4M?=
	=?us-ascii?Q?HMJkVzzYTbls+20/LY36d7lLzHiWeXyDKw+xs/mAYgM1MRggaOws67psIwOK?=
	=?us-ascii?Q?LFDcV9NSC3BiwR67Yq558chnWGliMNkhtAm33ANDOrJtUNCya5OCHYsmCFTy?=
	=?us-ascii?Q?OyzUJnugJG8RQMJiTvGBJ6372NLRzyGYe+0fonayP13H039CdPv0e+01/gnL?=
	=?us-ascii?Q?HXJEYIMnmVrg4E37MmLIneqFgZo2jdI7QG61qMlP36gXjTwdc9yu1jPjoCAK?=
	=?us-ascii?Q?AGN3H5DbgNkvjKKNG6qkmGH+DASqPaPsdZoio1/uHrtws1SFaj3gZXw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:lGC+O+taAv4UkQgjzIt8ccRnghGC/5GgZ+81KWaZNL2QqS/3Lih7N55DeYKfrnbgybbL03tbhIF9thtWdjsd1tmDKCmF6j/naGAHT4rDQfjF0F0N9XIB2/wLWY548DOo2U4d/XsPD1TSuKRa2byNOw==;
	24:x3xTo5BMaWKbXEgv9SQzWF3NLkXfkmFxi+Jtd/Ea8LdaTsB5MSNTMPw3x+cXEHfD2qbTuRX+1BhaFmCLREf7p811AzZ80Dy8uvtAZpnYG+8=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2015 00:25:45.5866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.102
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v2 0/7] Raspberry Pi 2 support
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
X-TUID: F2hGTM3QS+Ts

This patch series adds initial support for Raspberry Pi 2
(bcm2836). It is heavily based on the original (out of tree) work of
Gregory Estrade, Stefan Weil and others to support Raspberry Pi 1.

At the end of this series, it is possible to boot a recent raspbian
kernel to a serial console using an invocation such as:

  qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
  2015-09-24-raspbian-jessie.vhd -append "rw earlyprintk loglevel=8
  console=ttyAMA0 root=/dev/mmcblk0p2" -serial stdio

(where raspbian-boot is the boot partition from the matching image,
and after commenting-out or removing /etc/ld.so.preload to avoid an
unimplemented setend instruction).

I plan to add DMA, USB, framebuffer, timers, and other system devices
(vchiq, power, mphi, aux/uart1) in future patches. In the meantime,
the complete code is available at: https://github.com/0xabu/qemu

Although this series includes many of the peripherals common to Pi1
(aka bcm2835 aka Pi0), it's not yet possible to boot a Pi1, because it
requires additional peripherals, so I'll also add that SoC and machine
in a later patch.

v2 changes:
 * cleanup based on reviews of mbox and ic devices by Peter Crosthwaite
   (see specific notes on each patch)
 * removed custom SD controller in favour of sdhci

Cheers,
Andrew

Andrew Baumann (7):
  bcm2835_mbox: add BCM2835 mailboxes
  bcm2835_property: add bcm2835 property channel
  bcm2835_ic: add bcm2835 interrupt controller
  bcm2835_peripherals: add rollup device for bcm2835 peripherals
  bcm2836_control: add bcm2836 ARM control logic
  bcm2836: add bcm2836 soc device
  raspi: add raspberry pi 2 machine

 default-configs/arm-softmmu.mak      |   1 +
 hw/arm/Makefile.objs                 |   1 +
 hw/arm/bcm2835_peripherals.c         | 198 ++++++++++++++++++++
 hw/arm/bcm2836.c                     | 135 ++++++++++++++
 hw/arm/raspi.c                       | 179 +++++++++++++++++++
 hw/intc/Makefile.objs                |   1 +
 hw/intc/bcm2835_ic.c                 | 233 ++++++++++++++++++++++++
 hw/intc/bcm2836_control.c            | 338 +++++++++++++++++++++++++++++++++++
 hw/misc/Makefile.objs                |   2 +
 hw/misc/bcm2835_mbox.c               | 323 +++++++++++++++++++++++++++++++++
 hw/misc/bcm2835_property.c           | 277 ++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |  42 +++++
 include/hw/arm/bcm2836.h             |  33 ++++
 include/hw/arm/raspi_platform.h      | 161 +++++++++++++++++
 include/hw/intc/bcm2835_ic.h         |  33 ++++
 include/hw/intc/bcm2836_control.h    |  51 ++++++
 include/hw/misc/bcm2835_mbox.h       |  37 ++++
 include/hw/misc/bcm2835_mbox_defs.h  |  26 +++
 include/hw/misc/bcm2835_property.h   |  29 +++
 19 files changed, 2100 insertions(+)
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

