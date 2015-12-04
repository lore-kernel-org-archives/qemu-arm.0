Received: by 10.182.158.201 with SMTP id ww9csp285057obb;
        Thu, 3 Dec 2015 16:02:47 -0800 (PST)
X-Received: by 10.55.79.207 with SMTP id d198mr14128915qkb.49.1449187367065;
        Thu, 03 Dec 2015 16:02:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6si8034419qka.65.2015.12.03.16.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 16:02:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4dpm-0003Ro-Oz
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 19:02:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4doW-0001P6-Sn
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 19:01:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4doS-0000eb-SN
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 19:01:28 -0500
Received: from mail-bn1on0114.outbound.protection.outlook.com
	([157.56.110.114]:23186
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4doS-0000eP-Kk; Thu, 03 Dec 2015 19:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=94s1pc3yYYK2j0fml5TSMk/EygA32rqTTI3My+LihmQ=;
	b=ILDXay65fYwN1WQvmIjTLUOsKgfN+B3nBi4rEGXOi7xC/rmDF+jka20QjmsStdpiHDgrCJYy/bOqv7jmXE+VqCiSlMwUX9yrCUfvahqDFH6TA1JKFDfpo6iBcqfsV2ILHbQorTShbq37ExxecYVNX57u5LZxCVDHv95ScgQY0NQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:e::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.337.19; Fri, 4 Dec 2015 00:01:22 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 16:00:55 -0800
Message-ID: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:e::724]
X-ClientProxiedBy: BY1PR16CA0018.namprd16.prod.outlook.com (25.162.29.28) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:Yfh+JZFJSXWLlUYrxjZu6rE56Ce13tTeWayfsqbWkRIfrUqOtrirVEYhupxrGcwKZVBVkznQ1gpKLM2ucQV+hCpcjlssVmL20EmcxDeOi8Wdrkn+KWueNxf3h7HDKr3TwHzzhBFSyqnVjvHfokgxZg==;
	3:yogTqNmuB+TXNKpIyW73DF1+El+DHC0Lno4dQDCj4UL3r/KZF05L5+q1d66pKvQi3OmEsFFTV1OK0jLSWNNb8nO3WZMXuhiVZlNVanNGrVSYODFgpSKsXHUoxghsxtGa;
	25:esQ2wK7SM7oktFFGV24YxtqdDcykzScDEitIz+ydydtMQmdUiWZypKbMZAc+sPh8uMEn8yb4hbNkhlVWC6ccO0E8fRBvsRA+Fhlia++755GBGR2d4RR6edNw10dA2b5+Ri9rmpxo20NUsc34JTfk8XbjnMnWuTMjqDDZPkPLxuYjE/Jp1ORGqGUi88EsGnzMIvcdXDFYJuKDGtad+ar5xwpCq7VU3uO7s6XJW5ySJ2faeMhThpfdPOAEQADN80e3bWRymWGGM5/8317RIJlEUw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:GraogFmpSm+S1F6rGne8IDTSuVwjzzL0bW/Ei4n1Pu4TlM1/DO/t8MLftHuuY3ojoxpzdfpyi6QBmZ9s1j8jbQ9CfXGTcdl/a+yyjDL7QwIP+2f7UJfOlU6/Fou1t0Z93Wv7QFJokyUwNNBvM3PG74PSbyKrXPizx5tTZEN+xIG79q/mmx2H5FmJAY73DA1TlcEMlZ50Fa2r6zdYJpqetk9KLg1ext5gRnrIz/kNiWCWgbzZehinDp8pmhcDbe1Aw1j276JfqtaXEfvNnI52dAFwEn4BPbwz6CN0DrWQWygsNGPLqvLHjaxZftd8NAVOnpVa4id1TVNLMYc7TK6WsEjbVqlPQmfKOBsuzcSfMtOQVyqYuJBB++g3GCU3SXV9JhOQRYBGwBH1AC+HKhM9r45EjslS+aDaVTSqCbycrUVTi9mQocn/KxZNO9C+8K+NC9BMfA9seWJAJvSqZXj/yIzIaJrexxEGmfNs+5weWnGrUcsAcs4kl9212ckZehRc;
	4:ACiWfPkZ/P7YjfcrnKjZSe9YmqgSPGtbK9NOcM5frVe/jX9cZmGTbKJ9KazeE0GtkTb3iegKmuPfUQMrse2obqFLRHuqmizKzDJbpXI1IwYotb/NV7Rj83iO5sD41DWyTmaGoxBTmQ9CtZ+GvWTf4U60lR3vCZo1MrramSs0H5so4ZlbGQQRGNrrrRg9w+pKslUm2qLda1lRsOajMZHYZ1PgEVR99ihMfcNvC8R54ZbcDjPEICbcKy6Ao3AtZkId7XuqbkTpENH6bSLQE8X5ANMDVRnLMHxcVE8Fcuo1eF5h02BaBA2iNbynZgdYu/SbC6TN/D+IUqdf/Vz0WiO+wSsrkpI1a7KMfyP09e8QXIdlbVats0h1w70KYjAzEwG6
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2034B21707C298A446DFD8DF9E0C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(55674003)(189002)(199003)(10090500001)(5005710100001)(86612001)(86362001)(101416001)(50986999)(10290500002)(5004730100002)(575784001)(81156007)(77096005)(110136002)(97736004)(5001960100002)(87976001)(6116002)(40100003)(107886002)(229853001)(2351001)(586003)(1096002)(122386002)(19580395003)(50466002)(105586002)(15975445007)(5008740100001)(92566002)(47776003)(106356001)(189998001)(42186005)(36756003)(5003940100001)(4001430100002)(50226001)(48376002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2034;
	23:j4kDLdMM41K20cm4ldki8BS4qLjVaryMNyixaPR?=
	=?us-ascii?Q?p/YJsxq6CzY9WcOuZhEsgLycbKuXQvVDNVcOZci73w4tcCbUJmfzbCBayxq9?=
	=?us-ascii?Q?NnvNtMWKxUqKK1AIKVjXI+ivaaNU2OHiLJ6vFNSeIBDa6/K+fx8xsm3YEyoV?=
	=?us-ascii?Q?D3h3M3HaYelI4W8im3ARd+K6b97gUE+7xby1jCHFHU9M0PLcZzNwv+vhNbCm?=
	=?us-ascii?Q?yNXYq9APRsfIQu3xJD6PRSQ+rGaFNWahY+8R/SY5QWIzr7DGmPLiRYNUO5Fd?=
	=?us-ascii?Q?azkcPQvzXT+GRmj/Plcy7eZtKnPQhywY5/yDhEuOhGeEct8rosTyUritzVGV?=
	=?us-ascii?Q?iMzuJgjQpe2+PE9sb4ODt6bwwNc2K4PryX02mnkyVhI1PAnUEvfKVRL1BhmB?=
	=?us-ascii?Q?WqXzfZoRC5j0EhC8hplcVybXHnch2hzZZD9xSYS/qW2kRJKA5aBvM0R4E2uf?=
	=?us-ascii?Q?iYhorKIRBuHB1ohQ4g29vWHj/lnO5akOt7FjGqYC25UT3QLNEBC/U4trqPbp?=
	=?us-ascii?Q?AzbB0V70gWzCbnLYsD02fGRRBlyGppjelv3kBCOWk9WO11d/27OchxoCfjKp?=
	=?us-ascii?Q?gVoTcazIpeR81zL2+MGIO/BngdY6r845kICYwFOEPYnXirOl3mfK2nRStBSD?=
	=?us-ascii?Q?2yrrVsBkKObXmrxvro3M8PeI5+hm0tL/2OucFR2aXb+Rkd5/nFniGdSWXrQ4?=
	=?us-ascii?Q?TdeYwZHoovMiGre+bHojJ2qaj2ryBao2KhNGyyHzIdQpBOolNWpoZCj57M9o?=
	=?us-ascii?Q?LTZR9INiKcC7o7UtXXWtDOIJw3xEs+Q7X5hZkfDlPcRX7oNicHQ504sJe8T5?=
	=?us-ascii?Q?3Ul0rE8s8XinW/Xv6BV4KhIOprSxD1zjBLhK9xI1RE1FdOEUzLykKBH2ScHv?=
	=?us-ascii?Q?cXtxlekrtcSQq/f8QTbrSM+ap06asU+g8rNY0dCH8CsuDsQ0Yw82mhgDZ3y4?=
	=?us-ascii?Q?jw3Zp46hZjGunlZfQOjVBAvtPLXCsnkrc7t6bICXBXO3rUHKZLScNL+XKTNX?=
	=?us-ascii?Q?hNcYzcNExW04pvIZRq4lTfFrihP5CpUbe39fvmTgiOXJmHtxSGHl4V8qPPiv?=
	=?us-ascii?Q?PmMJMwnF7srA3Y/QSVH7T3JkjcqoZXZlJMu37jeU91BlxZjL8gxXEImIvj3u?=
	=?us-ascii?Q?H31Of6mybq1Nl0Cpvd+PJJxeY0/+/F+gM7Ulyu4ol+fVQ2uBrSR3Izg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:kSpqexffVfBpkwrum4HHNTsmkeGh1M6b4uG4afN6YKIvlCY9SDQsU7mn2b4fsQ+zzWMlv8Fw4vhIy8qauP5cejaGXOaZ+zTbTChbSnIwh3L6ULaj0jC4VOyanQr8dHyWcb2v6uRatC1ms6+Xt5AraA==;
	24:USbXwR1kz4jz+P/m6aI4UCuSLaquuvCazbiKX0XwSVMBm4H/Vbpu2QAPTYYevj7Wv8mJCRUx3bM6jCgIe3Sb7tFNn1jB+xoH2mzJjFVPRtg=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2015 00:01:22.0635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.114
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH 0/8] Raspberry Pi 2 support
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
X-TUID: k/39VgxVgSuw

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

Cheers,
Andrew

Andrew Baumann (8):
  bcm2835_sbm: add BCM2835 mailboxes
  bcm2835_property: add bcm2835 property channel
  bcm2835_ic: add bcm2835 interrupt controller
  bcm2835_emmc: add bcm2835 MMC/SD controller
  bcm2835_peripherals: add rollup device for bcm2835 peripherals
  bcm2836_control: add bcm2836 ARM control logic
  bcm2836: add bcm2836 soc device
  raspi: add raspberry pi 2 machine

 default-configs/arm-softmmu.mak      |   1 +
 hw/arm/Makefile.objs                 |   1 +
 hw/arm/bcm2835_peripherals.c         | 185 ++++++++
 hw/arm/bcm2836.c                     | 135 ++++++
 hw/arm/raspi.c                       | 179 ++++++++
 hw/intc/Makefile.objs                |   1 +
 hw/intc/bcm2835_ic.c                 | 234 ++++++++++
 hw/intc/bcm2836_control.c            | 344 +++++++++++++++
 hw/misc/Makefile.objs                |   2 +
 hw/misc/bcm2835_property.c           | 262 ++++++++++++
 hw/misc/bcm2835_sbm.c                | 280 ++++++++++++
 hw/sd/Makefile.objs                  |   1 +
 hw/sd/bcm2835_emmc.c                 | 800 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_arm_control.h | 481 +++++++++++++++++++++
 include/hw/arm/bcm2835_mbox.h        |  19 +
 include/hw/arm/bcm2835_peripherals.h |  42 ++
 include/hw/arm/bcm2836.h             |  33 ++
 include/hw/arm/raspi_platform.h      | 161 +++++++
 include/hw/intc/bcm2835_ic.h         |  26 ++
 include/hw/intc/bcm2836_control.h    |  49 +++
 include/hw/misc/bcm2835_property.h   |  27 ++
 include/hw/misc/bcm2835_sbm.h        |  37 ++
 include/hw/sd/bcm2835_emmc.h         |  56 +++
 23 files changed, 3356 insertions(+)
 create mode 100644 hw/arm/bcm2835_peripherals.c
 create mode 100644 hw/arm/bcm2836.c
 create mode 100644 hw/arm/raspi.c
 create mode 100644 hw/intc/bcm2835_ic.c
 create mode 100644 hw/intc/bcm2836_control.c
 create mode 100644 hw/misc/bcm2835_property.c
 create mode 100644 hw/misc/bcm2835_sbm.c
 create mode 100644 hw/sd/bcm2835_emmc.c
 create mode 100644 include/hw/arm/bcm2835_arm_control.h
 create mode 100644 include/hw/arm/bcm2835_mbox.h
 create mode 100644 include/hw/arm/bcm2835_peripherals.h
 create mode 100644 include/hw/arm/bcm2836.h
 create mode 100644 include/hw/arm/raspi_platform.h
 create mode 100644 include/hw/intc/bcm2835_ic.h
 create mode 100644 include/hw/intc/bcm2836_control.h
 create mode 100644 include/hw/misc/bcm2835_property.h
 create mode 100644 include/hw/misc/bcm2835_sbm.h
 create mode 100644 include/hw/sd/bcm2835_emmc.h

-- 
2.5.3

