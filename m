Received: by 10.25.208.211 with SMTP id h202csp13174lfg;
        Thu, 3 Mar 2016 10:26:00 -0800 (PST)
X-Received: by 10.55.212.207 with SMTP id s76mr4968285qks.78.1457029559998;
        Thu, 03 Mar 2016 10:25:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h68si7976561qgf.82.2016.03.03.10.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 10:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abXwl-00052R-DK
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 13:25:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvl-0003pj-LQ
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:25:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvg-0007Ys-Qp
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:24:57 -0500
Received: from mail-by2on0131.outbound.protection.outlook.com
	([207.46.100.131]:35372
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1abXvg-0007YX-Bf; Thu, 03 Mar 2016 13:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ekAvKq95AA7xORE+zuQym9nPm3RXItHx2NA3XhkbWMU=;
	b=gyM5D0PUR+OG/tzGTdV3nLYNet/fZcz2Oeuf9EvHzIGHl17NAC9Dyu+mYh84NnEVCL8JzdIBPba07xI2RvVQPulNPtcaspyQKJdDK+ikh77ljN7gck7/WIF/zmx0K0oDjnCJ/8ei+VMnSU88ugLjjJPgk+g//iUp8Eecb9sLH0w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by CY1PR0301MB2042.namprd03.prod.outlook.com (10.164.2.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Thu, 3 Mar 2016 18:24:49 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 10:24:34 -0800
Message-ID: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: CO2PR20CA0017.namprd20.prod.outlook.com (25.163.96.27) To
	CY1PR0301MB2042.namprd03.prod.outlook.com (25.164.2.24)
X-MS-Office365-Filtering-Correlation-Id: ddde9789-4b78-4d30-559c-08d343911b9b
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	2:UOwkXkcL83wy0JF1McSEAlwnaTYhlft9grHwToFtdktVapMPmE7eEc+sou7BSJk1qTGsI8VlF1ihC7qtnqi76+IewyllIMdC43FY1mL0aKXcGdaUhJAVOuB9T7Mf8yZaGue+ScQGuBh/o98xU/j9t1k2VrreJGWGWmBmYbBw2iX4YRME9YW8N1gwleg6C5YS;
	3:P5cNB7lg6VfUuQHN2/aNlP1FDQwRqrUK1LZOhzWdL0LFsClGttfF7I6YRW04VgjyMVEjZDzJaRW/b0B/M2DkFckIcyngJLbs+kKXSaFWbRO8OTviFwQESUlt1Jqfkn01;
	25:Qi+Zbj+GM+sLcCLMELPMxX64H9FO2b3IsWFTeQXCj0AgqjoUbNVEyiodxH544OfPo9+BU9SrwSVnBVyC4x5HWLSUZUvVIppuBUL+qUf045kBo7Vk/Z+WT2LDYMYpvE8lY/ObRLu8bOVTgM5zu3xljAH3gD/IDL8OvxLquogSUcZbUg7Tw7WVaFzsSv2q9ymMFAIswLXMYK9VXCBVXtQB2uLfOby9o6qrewwGGJgRYEdVMPzlfLsCalTJ9QzYAl4dqm5BjVpV0/dkYTlfh614Krq2VRTWJmxoIM+4TSAvKRwu+a0kVSbQul561wol+Mjd/2zbrRgNyx7jpK0Yn7YZig==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2042;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	20:WtB456hAfVGHcmAlGtrlCBVvDWrZaUr4xqk6Yr87PiWUkRhAq5gK1RJjQJf5GExoo4rozhiMpO07ts19OBBx6G+K10Ul9dFSeq3SGJT+hHnUUB8m/4/GxCCaUT94ejkJhD7h1LbNBG0sYAle4SQUQRkudw5UqdTVyIUqHeiXTV8dTLywuQfh4lfP3YnKybogLed8Sy9Rot/3ILKcxEDkZjRAGntDhibNA3f49Jhxt89jXuKuKP68jR621ymbSJkxrweZ3qNj48SdCAosFCCps5I2BWqY6OxcQ3Y0fuTcx0aabJUiXO6BnbUFxCFkWeDlUXB40dqIV9ee008kWXGiGOXRcQbN/4f8njCF15Kx7nt6LTt3y7DeyqwkoIkneV152RAH4zto2R1CYGiWdQIok/Unq3Gf6K/naBq33/arz3YHjXvpZORy3xdjJrB1xbhiqIRezKOHrULoPkPp4JuPBq/zZ1QUiZuz8suMMWXeTo+oM1a8kzwY7SvqmIqeKmco;
	4:lMy0N6nYn5P26ZzwuBwnSJFLznLfiBBp+hiBTj7OzTFtUVAL4aWxXHlj679D0SBjPFQLWAzfU6XQeY/6MDfcWfU+Mp0CILHdI9ByCBGBT3kjmfuP8VV3tZOrDiNkm1f0J4vUnH4DFpjzp//sCVYVktEtqTHtt3BJnnEccXHTZKf6wHjlLlOb7ZKhRGnIxOh9cUK2hog817stt0TYlArHwr/fnLp1ixeouMROGq4/HhjkbOLMnbLhzvJbAQ8tju+5RQVkpQkyluCYk9i07DGWvl8YFPYR4tVCIqf5Pdf5Yj7rXCdzxVWH7IZ+zIF4B521ka3y5onD1dyINQ0CLW94PM5do4b9KQieEHNpno9fwZCORGFkWcWvNlRa7r+RNkov
X-Microsoft-Antispam-PRVS: <CY1PR0301MB20428195E210710996CCF48A9EBD0@CY1PR0301MB2042.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:CY1PR0301MB2042; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2042; 
X-Forefront-PRVS: 0870212862
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(2351001)(50986999)(4326007)(1096002)(2906002)(5005710100001)(87976001)(10290500002)(40100003)(36756003)(4001430100002)(6116002)(47776003)(586003)(122386002)(42186005)(92566002)(86612001)(19580395003)(77096005)(10090500001)(575784001)(5003940100001)(86362001)(189998001)(15975445007)(50226001)(229853001)(48376002)(5008740100001)(110136002)(50466002)(5004730100002)(107886002)(81166005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2042;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2042;
	23:i6NDXk7UcUYmO305a1oGPLsfP4PokDSCvvkVW4n?=
	=?us-ascii?Q?0ByYq0pZJ8idcyjAd0x1BdxxqmhL6ILJQVUdiKt3bT2pebM2ehBs06nnh345?=
	=?us-ascii?Q?HFISdDRzbvdr0r+lmrmJ0d1zAf9az55YoEQY/r6FCfrDmvTUuFJx7dL4rqR+?=
	=?us-ascii?Q?2JSUZVsydM1oZK9T7i5K0r27BGMdhWt35dqz6g0dyRhH66Yjiwi5liDRLWV2?=
	=?us-ascii?Q?1+lrmWl1S3J93vQ8dAPP4+7vvEJkNxRVIcjirsIZw45zs+7oqvjvOP9/9ujO?=
	=?us-ascii?Q?4FdXQlM49y5WPU/uhMHI0UKIVIa5PpSH4J1zN92EhMD8UzvN936xNCH0mqor?=
	=?us-ascii?Q?D6P/DPHs5BUhWq+jY5iHWA4GwOf1+dssV2gHFZdJT00lpczj/EZGO2GMJkvs?=
	=?us-ascii?Q?ZEP8xsi594d0aiyyCh0WsNbk5ex/XG0iDPTPsebrk993VjxFnw1aMdEJC5mF?=
	=?us-ascii?Q?KxkoKlZYYRtIawX6TOElYu2qwKgtMCxuyTgKs/zP/A7oFtcuvnraLefqxv33?=
	=?us-ascii?Q?00+bQgsQoYGTdqL47UyFT41HIvOWmUBYNaqMV6MkDeC2I3HJuM3tBkTMdoqL?=
	=?us-ascii?Q?Cmm7IjZILZ2Lnzay9OGWKyCW5xM5zUzS54uLgE33gHJGFNgeOE0RMB73HKAv?=
	=?us-ascii?Q?5hyxvAcvrpP8szhTJqaYAOATq3JVXPMeDhNohHqD/1PiYsWxRVXNbpoBTiqZ?=
	=?us-ascii?Q?ww0sAzbReLDR4ptPKuuWboYUAdZR76I7lO5h4toXlUaOog+3EbRpGYR66x+W?=
	=?us-ascii?Q?V8H/ymmp0ajnacuKXZwxwODZsoYMpMnXCnljPDqapkoztPhoBNUxD5wEO/7n?=
	=?us-ascii?Q?eyiKwZX4Z966d4Dt8YM3KglLwIUdfzUHPisewwO07JJtVT30sNxFa6M/gGS9?=
	=?us-ascii?Q?uugaAEiAgiPn5YSVVrwlWE6hcfGc1p5v3YQXvDwHA6geP1QXqhtuY2fsnTix?=
	=?us-ascii?Q?D5uwAnqdDQzxmzueenPAP5TlVhKWzRHUReFuYkP5TYhSa4Cq3P+0L9WMEpqM?=
	=?us-ascii?Q?YOYN6t6km42GENG1ongvzGiILaAb2QqE8L/0QJqNryThZqO6MJFeyiLwY89a?=
	=?us-ascii?Q?BVVPhVJo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	5:tW//oVgEvXHldUfPKzKBeHAgZJN3BRji65Hziu0yLUuFNokeR3zpPEFuj0mxFQ+tws2NRn3uED/FBHWUI/YlBNKn0tlRdVTTfTnBK8Ef4krbYmLs5iKqWhdsxC09/HK2JVjzp5dYkpP/ytgXSc3p6A==;
	24:BRVi2KpuTJTO1SCbNH+ZG8LlbPIvtKzc0ROUquTWvyw8ighnaAp+5aj6JmyHFzjWTyTPQIvI3czs0W53SeIxMiGbcARDX6jAT+Iq8BTtCxw=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2016 18:24:49.5917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2042
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.131
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 0/5] Raspberry Pi framebuffer,
	DMA and Windows support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S9MITa0hTpGl

This patch series adds support for the AUX (second UART), framebuffer
and DMA controller on Raspberry Pi 2, and enables booting Windows on
this device. As with the previous series, it is heavily based on the
original (out of tree) work of Gregory Estrade, Stefan Weil and others
to support Raspberry Pi 1.

After this series, it is possible to boot Windows by following the
instructions at https://github.com/0xabu/qemu/wiki. You also boot
Raspbian to the GUI using a command such as:

  qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
  2015-09-24-raspbian-jessie.img -append "rw earlyprintk loglevel=8
  console=ttyAMA0 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootwait"
  -dtb raspbian-boot/bcm2709-rpi-2-b.dtb -serial stdio

I plan to add USB, and remaining timers / system devices in
future patch series, along with support for pi1 (bcm2835). In the
meantime, the complete code is available at https://github.com/0xabu/qemu

v2:
 * added DMA controller
 * revised per PMM's review feedback
 * rebased on top of the patch for fixing ldl_phys/stl_phys in raspi
   devices, presently in target-arm.next

Cheers,
Andrew

Andrew Baumann (5):
  bcm2835_peripherals: enable sdhci pending-insert quirk for raspberry
    pi
  bcm2835_aux: add emulation of BCM2835 AUX (aka UART1) block
  bcm2835_fb: add framebuffer device for Raspberry Pi
  bcm2835_property: implement framebuffer control/configuration
    properties
  bcm2835_dma: add emulation of Raspberry Pi DMA controller

 hw/arm/bcm2835_peripherals.c         | 100 ++++++++-
 hw/arm/bcm2836.c                     |   2 +
 hw/arm/raspi.c                       |  12 +-
 hw/char/Makefile.objs                |   1 +
 hw/char/bcm2835_aux.c                | 316 ++++++++++++++++++++++++++
 hw/display/Makefile.objs             |   1 +
 hw/display/bcm2835_fb.c              | 424 +++++++++++++++++++++++++++++++++++
 hw/dma/Makefile.objs                 |   1 +
 hw/dma/bcm2835_dma.c                 | 408 +++++++++++++++++++++++++++++++++
 hw/misc/bcm2835_property.c           | 139 +++++++++++-
 include/hw/arm/bcm2835_peripherals.h |   6 +
 include/hw/char/bcm2835_aux.h        |  33 +++
 include/hw/display/bcm2835_fb.h      |  47 ++++
 include/hw/dma/bcm2835_dma.h         |  47 ++++
 include/hw/misc/bcm2835_property.h   |   5 +-
 15 files changed, 1529 insertions(+), 13 deletions(-)
 create mode 100644 hw/char/bcm2835_aux.c
 create mode 100644 hw/display/bcm2835_fb.c
 create mode 100644 hw/dma/bcm2835_dma.c
 create mode 100644 include/hw/char/bcm2835_aux.h
 create mode 100644 include/hw/display/bcm2835_fb.h
 create mode 100644 include/hw/dma/bcm2835_dma.h

-- 
2.5.3

