Received: by 10.25.159.19 with SMTP id i19csp768732lfe;
        Fri, 15 Jan 2016 15:59:31 -0800 (PST)
X-Received: by 10.140.216.20 with SMTP id m20mr17818025qhb.90.1452902371777;
        Fri, 15 Jan 2016 15:59:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si16053910qge.94.2016.01.15.15.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 15:59:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEHD-0004ZN-Cv
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 18:59:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHB-0004Wj-2i
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 18:59:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEH9-000131-Ob
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 18:59:28 -0500
Received: from mail-bn1bon0131.outbound.protection.outlook.com
	([157.56.111.131]:48916
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKEH3-00010z-84; Fri, 15 Jan 2016 18:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6bJeAVYcH9f1SLPG63y9sPEjiqVgWLl/AbmwDonVp4s=;
	b=k5BDWXzad2UsQcTywnElpsfeLZdqjqvg3HrKS53nrOIpd4mRS8WWFWS8Edg0+gw+aGvsj1kCUzXxp+5pO/HLGAPuudHqcyBDhLeC1GcrtBbdbo9tN6eD4UMMtm7pZhxWdYbhtsf/MBH9gozBVnlC0UjGHFB63WHET89u4Qn245A=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 23:59:18 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 15:58:49 -0800
Message-ID: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: BY1PR16CA0020.namprd16.prod.outlook.com (25.162.29.30) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-MS-Office365-Filtering-Correlation-Id: ac1fd9cc-cf2d-4083-a5b4-08d31e07e208
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:coZu2HC2nyoZHWzIfEh8YN05mE7+arzBmPNLd92XFch5oc8k1f+WWLf3hpyFK6uwSmGxSv06MYBFWT1tVYTBqnuLGsbDaq+kTabKYAcOJo2s5bjfVttACNksQudVz73WKozt1Xr8VokBvnTVaGVk8TSlH1fPw9oXe+GWduIWSvJfZXTLLinYXfvepMdzz8sJ;
	3:ImevbM3/m2st15ZzgNs2EAQN5b9t3338I6LUb+A/nrqdLTv8ONIyC2aea7CDm93+ICQ08EPkjdXNCdQL1V3k/u7wwnJKDrON5Cx/PYOeAuf7COMQe5JicYBbI9NRNyUT;
	25:3MMKvmiPnfnsuEShTeEzg6jw/58+wTVio/hhfzHJ/i0ERgNwCqPEepWKVAWP+wk9OJ409tBxZuxqaZPsWjXJxO4Pm8ALAelYcnEDkhzduduFgjwxijAag+p/QczZXkB3PYKW72AWQwE/Ji+8EamaZZ4czl07b+0woHZ1y0POpg0lBQiRdAIdgOL2KILSXtE90DHtDztPr/5KjTtAT5QRZAwI9TPu02UhnMWmc00EC/68qkv4182YIMuRRFBD6ppZ+FiIkIxbeAwbzgB4FO/inntkKQZVWZSoE7OELKMg+/Q=
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:gYap7P4AsftEcbDhxiGhEFld3ksGoK4e1enVVyUhW8P+KkLps9T6DBgB3YmnQFgbjyywXDSmZbYQW5H3TaMYhvbJeJahXrBo3FYSWB/FUlOVwKPCJRNMG+je0xvVDYqfSy3yVt7uYS7ccA7Su8ZB7u/0k11tJG2mY0pHeAG1VolCF2IhVv4JwgTlfXYxBvuJ2U7GG0OlDMEeCuwyBmD9sXAJyMSacsYeE0TsFeDl5VR696fqntDhW0KIh8OgslwDtKtKtZTVgfRV+M/llnR8eqlXGmAwKooLrZ7JzoPM+AhbaiFIaxtTdCwLwj7oFCe3clybHu3nz2YRqTz/9CQxsFGUKX5eQGGBIoRMLrqDTSlC/efxGHbtvmpKJreMgbFmaJreATXgLWzqohBYN/xfTccD65sM7gaPtXLanDct2DO1y+XHqcpzxYE06XCvy4SOA6CC5L0Ktz+SJu5F/j1DhI9/MZC8o/48hSWQ9DGWRJoEJpsTRjP8YZXHJm3fO8Y9;
	4:vSXcuhhtth7Ord8h5MRu2MoSF+FXdRnTRmL+aRtjtCsQsAhCJRvZ3Yr18qSvlsiLazfP4zwitMv+2edOeaSNDZmywVqM7mSdxBVYH8BVQxlC392C+8KU3W9lZmnHuQKpznp3jFnDaUfNsLa1swvHoqESwQQoEqWIf1cygehXs5MRD3PF/FrweavzY3nAuw/cbUZ1kXQPjc3TXXhyQo/L2rnl3bisHA8N2AvdJLGjT5n9Rcg6R153lExhVsYdQIklcDsPCPv5NcGY+6nCZ1HEtKg+BaLPS0v05LQqlceyhvRkFtw+wLqr7TUBHld4GGPlLS3RCUljs576GNZieD0uuHGbVrxnsC0kiLhLZPztR2cZimC5Dhd5HJRJ04doE0YF
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2033618598ECE02DAA045A809ECD0@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 08220FA8D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(55674003)(199003)(4001430100002)(575784001)(106356001)(15975445007)(86362001)(2351001)(2906002)(586003)(77096005)(189998001)(42186005)(5008740100001)(229853001)(50986999)(1096002)(47776003)(4326007)(6116002)(87976001)(48376002)(5004730100002)(92566002)(122386002)(5005710100001)(86612001)(40100003)(101416001)(50466002)(107886002)(50226001)(10090500001)(110136002)(5001960100002)(81156007)(5003940100001)(97736004)(19580395003)(105586002)(36756003)(10290500002)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:7wPDxgvpkxP3mEoXGBWcP7BJQEN4ZAMzbae1uTU?=
	=?us-ascii?Q?vyF0RMTFNRpK/W7qkxyRViSBX84uOdgaqQH+6AaC3E5vKg7beRacLpYaPNQ6?=
	=?us-ascii?Q?N0IXj/eAI4oRJbMQXCifXbK02XYvQe5pEVru/SeyhAhtpspZ82ml9OKR8gvi?=
	=?us-ascii?Q?3/N0qHo7/q/bs5ldldoKFoTxkHW7YJiM3fvFUBMVUWmd9QlAl4RDI/cgyzZd?=
	=?us-ascii?Q?vLa6yrdy4R8iaTDDAAoeo3VfaEXY5EI/9arN9taY1VLHvgTGzmObqtybhtxe?=
	=?us-ascii?Q?XOiqg00Xn0rIOtzCzNpW5O9yc7tjmZDGbif2VoKgwBl4TZe2MvhKird7T/sS?=
	=?us-ascii?Q?kPPowMinMeKxP5ZmVMUSGQHx6s3vDFRvgDeBBccjeXqg8gbX27ng7IZ1hE3w?=
	=?us-ascii?Q?nwLg3tgjdfUOtRcSBDlG8gi0ORwePVu3co3WxL9sf77+1LRjlKqf7WL2+GE8?=
	=?us-ascii?Q?7CcKRQsFTNCYBhL/FQHX1eUBfX/jkz01Rh2EVfqxwFkJfQ/itQHTn0hb7d9q?=
	=?us-ascii?Q?MwVuxKh/1Sg8dPx85Mkz/b+YKMD6GJoYtxIaIxNhXi1UP0t+zfAog6JJnZB1?=
	=?us-ascii?Q?pznqSAdfbx2JEwC1WYFVkzV287ocrPwoSGwtlQtfzWE06ohq/sPoePbE2QtE?=
	=?us-ascii?Q?Am6oA0N45DYiEMie7qEDmSTxDl6d9KbFl+OxE9qkmDIwkAwKXISr6a9k16Zh?=
	=?us-ascii?Q?MHx7OTlWak3/Sl0d6zK7S1mG2h8+H8VB8ZsyXFodr3Fx5pRDRTWQPjTfQfwe?=
	=?us-ascii?Q?yGCE1HrllZnLZNyEqkycM2/+BwEiWtz3Pdy9J9SUOkwZL1nzskIOTZbl15E0?=
	=?us-ascii?Q?lkXE7YBNLxWw3F/m196l4tFjnNw6Xxi9BUUzUniOyeNVBNS3m+QflVpk2x62?=
	=?us-ascii?Q?hqw6fIBde+H6fHjf8cM/ntyzCP1FGgyZ0caUmrJjiAoAokjZeJ77N63XVVll?=
	=?us-ascii?Q?nEZ5Acy0v1UyE6kw4r1Kl3oVXioiTuQY7Vcj5OUerY9rbMtbi8eParKYp5bK?=
	=?us-ascii?Q?m8dTwXhogiLkAd+9Ql2lkWZr4UeS8vhozBTdYFJmtQvSQ/kirL3Ni/F7WpP/?=
	=?us-ascii?Q?HZ7ve+kIRVR5aXC2XSOFqzl4XfPJF9vkhEBt2tddn7zvsQ2iJvfiG7/Ag02R?=
	=?us-ascii?Q?AdxdkcSsDEHc9kSIT8W03foVGa0sp83/7SthY51ekisw+SCR8tHFXMvxaPU7?=
	=?us-ascii?Q?L+vpXXx/ruqfvZjYKC2ZstNSZzweUN0wCmUn3HdA7h9wnfcwyrLqWr5c7fg?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:U2/cs50StziYY2u2pfrb1WIMRH845SuOPYP54ajh5EHtLOOeQS4C5xWBDOL8zuzQ/gvZeG5J+WzEHc3kKV7yi4pJ1sF72WxvwuoZj+Ke0V3kK6akJK4DmX6AOvEMZX7QBKf7xsgjxAb2YnXpiDQw7A==;
	24:LBgKK3jZmSleoyqAjm0PIosvW71UhOA3wKjA1SiOutGL0lWQYzIITWWtY0iWNUzUNUzx7RtIBsyfu4JxS5sUNTY91gI+dEIa0oiWrKSJlnY=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2016 23:59:18.5818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.131
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-arm] [PATCH v4 0/8] Raspberry Pi 2 support
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
X-TUID: Z8KDmUWrpxYG

This patch series adds initial support for Raspberry Pi 2
(bcm2836). It is heavily based on the original (out of tree) work of
Gregory Estrade, Stefan Weil and others to support Raspberry Pi
1. Thanks are also due to Peter Crosthwaite for the code reviews and
feedback.

At the end of this series, it is possible to boot a recent raspbian
kernel to a serial console using an invocation such as:

  qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
  2015-09-24-raspbian-jessie.vhd -append "rw earlyprintk loglevel=8
  console=ttyAMA0 root=/dev/mmcblk0p2" -serial stdio

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

XXX: patch 7/8 (new in v4) changes the secure boot setup blob for
Highbank to a common version shared with pi, and I have not tested it
with that board.

Cheers,
Andrew

Andrew Baumann (8):
  bcm2835_mbox: add BCM2835 mailboxes
  bcm2835_property: add bcm2835 property channel
  bcm2835_ic: add bcm2835 interrupt controller
  bcm2835_peripherals: add rollup device for bcm2835 peripherals
  bcm2836_control: add bcm2836 ARM control logic
  bcm2836: add bcm2836 soc device
  arm/boot: move highbank secure board setup code to common routine
  raspi: add raspberry pi 2 machine

 default-configs/arm-softmmu.mak      |   1 +
 hw/arm/Makefile.objs                 |   1 +
 hw/arm/bcm2835_peripherals.c         | 205 +++++++++++++++++++++
 hw/arm/bcm2836.c                     | 165 +++++++++++++++++
 hw/arm/boot.c                        |  53 ++++++
 hw/arm/highbank.c                    |  37 +---
 hw/arm/raspi.c                       | 156 ++++++++++++++++
 hw/intc/Makefile.objs                |   1 +
 hw/intc/bcm2835_ic.c                 | 236 +++++++++++++++++++++++++
 hw/intc/bcm2836_control.c            | 303 +++++++++++++++++++++++++++++++
 hw/misc/Makefile.objs                |   2 +
 hw/misc/bcm2835_mbox.c               | 333 +++++++++++++++++++++++++++++++++++
 hw/misc/bcm2835_property.c           | 286 ++++++++++++++++++++++++++++++
 include/hw/arm/arm.h                 |   5 +
 include/hw/arm/bcm2835_peripherals.h |  42 +++++
 include/hw/arm/bcm2836.h             |  34 ++++
 include/hw/arm/raspi_platform.h      | 128 ++++++++++++++
 include/hw/intc/bcm2835_ic.h         |  33 ++++
 include/hw/intc/bcm2836_control.h    |  51 ++++++
 include/hw/misc/bcm2835_mbox.h       |  37 ++++
 include/hw/misc/bcm2835_mbox_defs.h  |  27 +++
 include/hw/misc/bcm2835_property.h   |  31 ++++
 22 files changed, 2132 insertions(+), 35 deletions(-)
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

