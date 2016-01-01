Received: by 10.182.158.201 with SMTP id ww9csp8831936obb;
        Thu, 31 Dec 2015 16:32:00 -0800 (PST)
X-Received: by 10.55.76.11 with SMTP id z11mr94853235qka.83.1451608320894;
        Thu, 31 Dec 2015 16:32:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64si48375131qgf.1.2015.12.31.16.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 16:32:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:57072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEndQ-0002xH-FJ
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 19:32:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndO-0002pr-1g
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:31:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndM-00065H-Tk
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:31:57 -0500
Received: from mail-bl2on0137.outbound.protection.outlook.com
	([65.55.169.137]:60296
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEndG-00063I-E4; Thu, 31 Dec 2015 19:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Pe2HAd0Avb1Q7TdlM4Qy1fL0+YfJ5+ExKIYEIoeUXZo=;
	b=fXS+SNIpvoLY54+Eu4iAChlWSQalb43YLO16nCL9y0PK3tDQO06fbCxEXmevn8VBHnJistihX7JP5H5/51Unf+CZlsIDSY1yMyQBqgdEARsVxtI+SnzIrEzGkPngnhLqm2Pct8EWdDBLx7xlF3lOz1GXGXvZn+1ns5G7KwQK+ww=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:7::724)
	by CY1PR0301MB2043.namprd03.prod.outlook.com (10.164.2.25) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 1 Jan 2016 00:31:46 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 31 Dec 2015 16:31:27 -0800
Message-ID: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:7::724]
X-ClientProxiedBy: CO2PR04CA028.namprd04.prod.outlook.com (10.141.240.156) To
	CY1PR0301MB2043.namprd03.prod.outlook.com (25.164.2.25)
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	2:BEcyAHR9vEpG5DWIs8LKIUn0DYGEuGiNbpHEBNMnM62XYOiqStwW+mX93wXpHLvI9mMokHvQAeamPyrK/zyl0+Z6KFX2aIr7gKoKujaZA7ZAGoBKr3kXhQnNvxvjaXxfUkJ1ihxp9jccdcTtg2IoJQ==;
	3:402RD7/YQ4krTWkr56B+EsqmTTzPaEIYuPJDH5XuJtHWpnDpxea8Ae0xOddSn5/OWBrvLCNouwB3IqWRjURz4RXVdfJ6eACoGYfe84sX8IyedoyiDgTpqpLltUnBHoe+;
	25:NOFczYw9JlgQ8ns/Itm+48BtTkYnf1jrip3o47ripwsN1vCnLn4r0XWV9Zo7jDpOCWeCyJcpwP8TqMnn+KlwqeJAnJzMJ5Ekl+hZpMf1IqRfVbBJDjRN/ZccYwyrAIK9nQ2/GcaxHWqI246PzcaRfl05WU+nOnRbDDvNsxh20PP/M5oMdGc57djCl3qi4fIptPkL9lX8qTb0Q1A9nWV/PLqrl68ZC6gC/MhpXt3LW7wguJssfkoHkTkY7LqQCV9XQ7kRZ68AWcK9z6HuaTAYEgB4obXCIvuDsHVnLKyyL2c=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2043;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	20:ZtqyQxb+AQtCH00RRAOkSMdeTNhAKYwslUDjYwmGT8oWJjryMUJdHAj1ro6ziDvla2kl97TG1GONE5nmkK1IkfhQcyuKa0slmKzfsbUG8O7TZjQxNo/+RrpBJ/aQg1L0eTdz6+xQIJp3Kq64djZnlToLhooJvYz0eEftWS8490QNqWvcbxqjCVBHGik3ByhnSqI4m0hAtoKbaPzAls7un3EYWORFtp343nKqk7NKgaKRC5Go3+9Fju4Mih1SKsabVrmADUTFu1kEY0wPrIaDpSVCGWORQyttNi7N5NdfUHzKczJ0xU/OszSOT7VbqgcqsoL03J5xmgrpzSUxutFV28EKtyV9a9YgX/DEpHDckB9HA7uKFp9RKYxvGyMttlhScVnDscuPmhxgdA5oCs4roHrqqOB9GqNtIEfqJfPX6tji2y6R/x6gpJXXBrT5cckg7xJJmbxAy4uDAbopCQGhHpcxD+TD1m0RulOn6Az9e94o2KcKJLQFlAbvUdD8BTQq;
	4:ylG7Hep685FCUSWERqaAQnZQW+Vjfj94vmVHYGMgJvw8JpTt8uyXvpizL57c1Zs8bITC5QTGxVq2qYwSuQ+WlGXwmniCitBRnJsopKxZ4ym4iAU1r104Awoq9vHudG8wM66lqpMAggJTmf3rXETismhQDCsPaQnZz4XiZtFs5uR69L3w57tW+VQriRxqg/CLUnR3XpfBeHXdxZ/IUiuuvkDdNeTTXKoqiIQgcNT10a5kIuD1XZi3vuv1DQRszsfA6N6K6GkjGc7ugfdgQ1kwjQO/1R15Ii1yzaVJWZCc9giJdlC//Mj3OxlRH3OcscZwfkTWR39fQaW1F2czBRdLnGNVoC0Z7+o9p2Imhen5D+5uJXDmGPxf76fafEZcbgMh
X-Microsoft-Antispam-PRVS: <CY1PR0301MB20436A22C95C8FF900B3DD0B9EFF0@CY1PR0301MB2043.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB2043; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2043; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(55674003)(229853001)(42186005)(40100003)(86362001)(189998001)(6116002)(4001430100002)(575784001)(15975445007)(5001960100002)(50226001)(107886002)(101416001)(105586002)(2351001)(86612001)(50986999)(110136002)(47776003)(81156007)(97736004)(122386002)(5008740100001)(5004730100002)(1096002)(36756003)(5005710100001)(87976001)(10290500002)(5003940100001)(106356001)(92566002)(77096005)(48376002)(586003)(50466002)(4326007)(10090500001)(19580395003)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2043;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2043;
	23:6tGo9uzfpTwMYGUDi8kXt3Tq4ZBmZpkTM9SlxLr?=
	=?us-ascii?Q?u8a4b2Z1atMRYsR+0lb08H/cTuJ8U+4Fvcany7r9YB4fJHX8yyGjsL1bNwlz?=
	=?us-ascii?Q?6eoJly1ofh0gIGyhBqoGUwkVNPAlbxgtZTHp5YzaCY6aHZQ7hC/ICzEsG2cG?=
	=?us-ascii?Q?vXpMz/kZD2O6BCuL4zubRRMPdszJeBYnQwz2Q3o83jDen2XWShIbBy/DyuRC?=
	=?us-ascii?Q?MEGvNvU8LaFw3jF5yxeKCb0qBjL6O4tAIbWM+gZ0QC1kG318Z4C+orAeHf+x?=
	=?us-ascii?Q?sRrXc+xOqViWClMnftAdHbuuXOha9xMVwz9XCJWkM/sd3mvQpwcxxfSua/jJ?=
	=?us-ascii?Q?x6kMJgfcBiRDCBWWKpy+oQx4iKKuR8Tv15z5ChJ/vw14MwPthDQ8kTPFDimc?=
	=?us-ascii?Q?R+RSH+LVA9LX5+9JYkWwhT4rTLjsbcWkHmIOkZ2oCwMNQAJ4sFw/R885rhEr?=
	=?us-ascii?Q?LGJc0RPR9zaxCFQFHBaweAWISe7lA9o+xXABJ3X+tZkThmuD65uTYGb60XaC?=
	=?us-ascii?Q?WPZ0O3Hptr6xhriDYUVg73mP3itTrZ3obA2ZBBEpyLMRPn5wKwKR22zLJBNP?=
	=?us-ascii?Q?2enzpA3lfoS1IW7yoE/WVy6ZN+URA1kcIft0bM2RNUiNlBoUHTTqHf6nVsk/?=
	=?us-ascii?Q?kofU4/ScAXfPCckk+gy+v2NNP6/VsSC5y/PjM7o7ziWalKAgBQocCc97SErn?=
	=?us-ascii?Q?t5f6k5j3PuDkJBkZZ2Grk6z6areE1dSTGNa542roUskYIo1P+2hscfu5AjXD?=
	=?us-ascii?Q?T0eqILPZiBNOaOGKweXX09LAWj99O7a8wSVkPwDVmQp4NVoYmYYHEl7e9lkK?=
	=?us-ascii?Q?EGZrjpmk6655TuF7hnn5fz7/MvgtVR4aRmqUYO/sIcvPiLfOwSbyl+aPoUK+?=
	=?us-ascii?Q?/9ozJWkVnDw8RanArIfnSPRTOB0LcxJrXBB7tAHUodVIiDEkR/vxhAnnrqSa?=
	=?us-ascii?Q?oOdtLE+saOy4S8faA2EGaag4bk6uP6u2bloArQI2nRGKMbYkvJ9SZmPZ+FGS?=
	=?us-ascii?Q?MMNEy0OVr6MR3l07ewaRlbt0kLLxwDizAhlh4ZjYNY5WRSA49mKzw5jHfhsC?=
	=?us-ascii?Q?VME19dO0R4rmsCRuaOJwpPPW2fuMbglH7nO8c7As6fh0XDZ2zF8HX0Ij61+H?=
	=?us-ascii?Q?kXr+Icghfy0KPKnIBfMOAu6jsDKKk1hyb8QWpVRfAYBCFksINkAOjK/r2Oc7?=
	=?us-ascii?Q?mUSrj/FpnnxnbjtI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	5:kGypZE0JOBWCMRNiAIm/o4wP1/0pcfI+48JGd3AYleD8Vsap0rfueeL9SaD9m1b2e969m24S4IrMnav3fqyqVAMwSWjW0jdptNaXmboCtowCNnbP6rh3GCdHe+qJ1u1l4hp9OQLIqZd7sGO/j2pLOQ==;
	24:cz/4Yqp4V4zrD8Y0KVlXbx50vHhS1jyWzNw/uSr6QWdFC6sUUz1mhks2MMvkXoyANU8BTEXGVllB+Td1D5++UKGseKOwX6IZ8KY/vuPRPVY=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2016 00:31:46.9195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2043
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.137
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v3 0/7] Raspberry Pi 2 support
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
X-TUID: WjCJwBSxQBv/

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
 hw/arm/bcm2835_peripherals.c         | 205 +++++++++++++++++++++
 hw/arm/bcm2836.c                     | 155 ++++++++++++++++
 hw/arm/raspi.c                       | 180 +++++++++++++++++++
 hw/intc/Makefile.objs                |   1 +
 hw/intc/bcm2835_ic.c                 | 236 +++++++++++++++++++++++++
 hw/intc/bcm2836_control.c            | 317 +++++++++++++++++++++++++++++++++
 hw/misc/Makefile.objs                |   2 +
 hw/misc/bcm2835_mbox.c               | 333 +++++++++++++++++++++++++++++++++++
 hw/misc/bcm2835_property.c           | 277 +++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |  42 +++++
 include/hw/arm/bcm2836.h             |  33 ++++
 include/hw/arm/raspi_platform.h      | 128 ++++++++++++++
 include/hw/intc/bcm2835_ic.h         |  33 ++++
 include/hw/intc/bcm2836_control.h    |  51 ++++++
 include/hw/misc/bcm2835_mbox.h       |  37 ++++
 include/hw/misc/bcm2835_mbox_defs.h  |  27 +++
 include/hw/misc/bcm2835_property.h   |  29 +++
 19 files changed, 2088 insertions(+)
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

