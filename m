Received: by 10.25.208.211 with SMTP id h202csp2131915lfg;
        Tue, 8 Mar 2016 12:06:50 -0800 (PST)
X-Received: by 10.55.221.18 with SMTP id n18mr38437568qki.50.1457467610823;
        Tue, 08 Mar 2016 12:06:50 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c52si4637855qgc.5.2016.03.08.12.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 12:06:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=neutral (body hash did not verify) header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adNu6-0005AC-40
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 15:06:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt7-0003oN-95
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt2-0004G1-DQ
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:49 -0500
Received: from mail-bn1bon0131.outbound.protection.outlook.com
	([157.56.111.131]:1638
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1adNt2-0004Ez-26; Tue, 08 Mar 2016 15:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tGTPlEJbjq7JUgdwm3yvXcNC2D0IOhmnhrvkTytisOM=;
	b=aRwqacEBtmokNk2K6O08sS4URZgI6qwjxFmWMHhb8xXy5YJFDqr+bMCoQeVHYT9TAh3XJE3n8wQBR+DW0Oknijgdrlc4jB0thfY2MyJdRgSmgH+INFlIIHEQYsJNEt6CplGx2XTjwJDHETTb8LmFkmp3bzK1Ues0kcVoBoAQCgs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8::5f2)
	by BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Tue, 8 Mar 2016 20:05:40 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 8 Mar 2016 12:05:21 -0800
Message-ID: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:4898:80e8::5f2]
X-ClientProxiedBy: BY1PR10CA0031.namprd10.prod.outlook.com (25.160.197.41) To
	BLUPR0301MB2036.namprd03.prod.outlook.com (25.164.22.26)
X-MS-Office365-Filtering-Correlation-Id: 816d2314-2402-485d-1047-08d3478d06ba
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	2:Oci37t3P8KC85jbkp/X5zeZ04b28Ld/tts91QYoaG9HrqliwBRiYK2Jt9fI/kxbWvFFORLAHQOJHRMlcszrMLLqLtoU+2yzQj6JCoq84fO+v2f41fpXVo5c0m19y10fg8emTZOpRnGMlzP+lfCQOx44ytiQRTfyjD7jmvK5Gwi9/wrWiEuSKIy3RrqJedjmW;
	3:clDEJHBIQ/ubw1DRCGUHsnksuEFOc3vWo9HsYe4JFrezHrDJC2UzssOFAAiwiWq4m/GqqCexj9Jb5N6Q6rLL7B8jEyMel5P3URhoENyYeVoP2uwjWpr8Rq5/1nE1Mqg7;
	25:qsZG0UqUBQGjURLGsjRYYxJLYMtH6CS5+0RYM6oCwG7fd8R1Jo9F40Vf8ZCtGKuEHhuojx4uLst3cSY1MPpShFTYuykTsk2GbyBi35VKXal/n4PQD9u1dA8PdOeVUJUlm36x//Sp3kZsAQSK6QxQ2g+Ix/3TMxS2i/HNAdtV/A7g9TpV07maqbvLdoJelrc9o7J/JOvHbsQnYHxkPbZZnF31STnbNUBdgvsYOYt/p0MOenD141/CST34NQrD+KD6YkOFcOjEw4tNcSGBB2F3X49b2mVQ/w1Ikgxk6yyISk2Pw8o3J5L2AFlYEqOT+erVZld/m3yaZbiXxC+maOzC3g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	20:G/9p3GgFg1WFkytsbIEks6bDz/OWKlUlsHBl/mK80dizikpPR0j2AQqyeQdhXX1KY74XwOeJrd3G8gu9Hg/pdvKG7Ilq+NCS40RQ6MW3qtzbnH/kRKvBd0owct6pD/2YkC1uw1vDzpSMYI9zhfdhMiY7epNI1nqlitiqb4DOrTqVKSfBkWEKQ8sPWy21TfZS/puhjMYiIr1VY0XvYeSrQpjRVobRUruX0RFMqAVMxuTq+yGJnAuLmY1RnUA2F3EWCy+LdimacIY2rQ1h1pyS8OEq34HY/wyrMXW98wDLhK3LkJvse4j75uCj4hOSgb/1qf0xG7sp6xqc0rxMKYJZMzbidWqJ1xzpPuYGV0lr5YYl8mmec/a7iTC7WiKR7CIye4lW4bN9kQewNalkdjKURfXyo5ZLJpUnevRtn7i40UHBePqFQsFSkaruvjlJ3yohFW9mDu7EJ3TEneTML8jbx3C+0C+7yjCrHvdPV/uOFeBYdHWNnoYz3RA4OYJKhPV/;
	4:9U7hWwS2ojslMV+nACH8Rrms+A0CUIpiworTEhyU1VCugLbpbB1rUMLHPw++vyH92gclcM1yE0/d17BSwp2gUb1TbCTc0wUBJC3ZCbWCtvg7mUERSLLAcDGI0bNoLaQcWqf9rVhqepjX8nvnNNNn5b+1a+qY7SKu7n2mOimLXu44s9m6tY02tMoFhwwfwzSzt+LAljS2dtrYKVkihoUGxDmM1UbOlM6kSATi0tySJs9fn8sejZLMGGZ/UHFWcjZn05JtjeTln6s4jTag/SqETuoFNywPRomaIZ7lfyBDywo3PzhslGru3Eo/rJwjAjdDhvqPwXpa2a86WEzw8ZXiXKk+azEsGYIHvbNeSmCXJTBNwtjgwosne4leQyIu9agZ
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2036ACCF1AB55C5BBCE54A849EB20@BLUPR0301MB2036.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
X-Forefront-PRVS: 08756AC3C8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(55674003)(10290500002)(47776003)(5005710100001)(86362001)(575784001)(189998001)(86612001)(36756003)(10090500001)(19580395003)(42186005)(2906002)(6116002)(23676002)(586003)(2870700001)(5008740100001)(4001430100002)(50986999)(5820100001)(92566002)(50466002)(77096005)(2351001)(229853001)(15975445007)(110136002)(107886002)(5004730100002)(81166005)(1096002)(4326007)(50226001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2036;
	23:L/0eDg9Zyp9avFfa4mpTsIFUUfX1w1NFOMsb0KV?=
	=?us-ascii?Q?MBYBYyxwbRAkSXygPo/JJ7UFJ8K2UW/KTJgAAkPCTo246Df1fEsgULop2nCM?=
	=?us-ascii?Q?90/q3Jrig1XcZpR1pc6/oKkeBiovMRfZ9w278nVSp8hmQyLzW4W7M6M4T52c?=
	=?us-ascii?Q?VdqC+OmPRgu1ElCTDp0+0s6qBAyAUPWTZVk32LAxfgW3+Pw2k2b4K9pFWHgE?=
	=?us-ascii?Q?4aNV8f4jqVwa6Vei/MfoX/z3S7XtgID53YWrGLKh1dXt6oDhhs/jyUTDPaMP?=
	=?us-ascii?Q?/aGa03CmioqRjkZatZ5te/L+zvNTmeyLXTk4LcuwaQYD4pu0v5mm7sCb7nCF?=
	=?us-ascii?Q?zPzSG8CMs4kHQjT/SUGmAyDjKAzUguKZym4nNJ6DD6kRFfi2nHrvme+QU1Ws?=
	=?us-ascii?Q?/gPjkRDVcJVwzwBiYMTwlb8CUumVqvf5iLw9txn4GRpRvU2+ePPWfnKmUgnl?=
	=?us-ascii?Q?UWlM6wIncSPzr/EMr2TOcD0dXbj2+8gxK5zib3a6hLOEXJ+eX2v06kzjIAKI?=
	=?us-ascii?Q?BDRHXYe5Iropg93fLUF3CZuZebyfZJUbYdE3NHdRti8k6adNS/3eqpd4ajsZ?=
	=?us-ascii?Q?RCyqWm8o8ada9E/Y0s5CAWhOV3Rwbiq04NYtE28CqgRe9W/tFhxCRFFlxKXL?=
	=?us-ascii?Q?lRXpf7CZKKxLc7Ai1jB0sBoYQETxZgymOks08WqRMaf2F5kdKzDUCtrrvW7a?=
	=?us-ascii?Q?DPjUZG29PUgPCF4b91q19w+U6PZ05huAC51VX+yglXvNUDw4ZxTottDJXvLk?=
	=?us-ascii?Q?OS98xY7eSS4+7eYkW0HOh7eFgN7k4vFrMVJ4lHAzdlTRD3lBLMyv6dVsTZ0N?=
	=?us-ascii?Q?Bc4G2fN28G4zb/M2sGDfLl1godZn+rDZkrVhN8gYj9LXIdhsoonV1yXmm51z?=
	=?us-ascii?Q?CdFxSV6vM8oqaCHqdkuq3QlUxG+G+ivn3j1htsOhheysn7cVM1m8SHUblFBN?=
	=?us-ascii?Q?xIRbRCQAzvreGTCNp843cxqi2iWsu9qi5g9cSqh9Z7t/oc7gewd7fIES8zkv?=
	=?us-ascii?Q?XGKVBjvTZRQswSKnef+waiYok?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	5:U11VNIIuBS3mpQ0FhMAU4FVSKw0vxQb6Swwa8d4eo7LIHqMo/fotP4sNOli/lISmZaMHAFyHfkIK/MZz+qO7FbgZ8jx35TgT2QckQW7gjPHHvqyI8BEdCjlv6FTjqIdaTD/vMpfU5jfoH+fx3mDDPQ==;
	24:dkkA1CnQLs5u0iEUqekdZjEqKN8oZe2p6vahBAX0nnTxUHYfJf7fDxO8v0HQLEaKILLnFbUCit3MafK3ktYFDSMVhWuOkRjxv2dN1+JbRRk=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2016 20:05:40.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.131
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v3 0/5] Raspberry Pi framebuffer,
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
X-TUID: ofnMvdaURvpU

This patch series adds support for the AUX (second UART), framebuffer
and DMA controller on Raspberry Pi 2, and enables booting Windows on
this device. As with the previous series, it is heavily based on the
original (out of tree) work of Gregory Estrade, Stefan Weil and others
to support Raspberry Pi 1.

After this series, it is possible to boot Windows by following the
instructions at https://github.com/0xabu/qemu/wiki. You also boot
Raspbian to the GUI using a command such as:

  qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
  2015-09-24-raspbian-jessie.img -append "rw earlyprintk loglevel=3D8
  console=3DttyAMA0 dwc_otg.lpm_enable=3D0 root=3D/dev/mmcblk0p2 rootwait"
  -dtb raspbian-boot/bcm2709-rpi-2-b.dtb -serial stdio

I plan to add USB, and remaining timers / system devices in
future patch series, along with support for pi1 (bcm2835). In the
meantime, the complete code is available at https://github.com/0xabu/qemu

v2:
 * added DMA controller
 * revised per PMM's review feedback
 * rebased on top of the patch for fixing ldl_phys/stl_phys in raspi
   devices, presently in target-arm.next

v3:
 * tweaked instantiation of uart1 char device
 * identified Gregory as primary author of framebuffer and DMA emulation

Cheers,
Andrew

Andrew Baumann (2):
  bcm2835_peripherals: enable sdhci pending-insert quirk for raspberry
    pi
  bcm2835_aux: add emulation of BCM2835 AUX (aka UART1) block

Gr=C3=A9gory ESTRADE (3):
  bcm2835_fb: add framebuffer device for Raspberry Pi
  bcm2835_property: implement framebuffer control/configuration
    properties
  bcm2835_dma: add emulation of Raspberry Pi DMA controller

 hw/arm/bcm2835_peripherals.c         | 103 ++++++++-
 hw/arm/bcm2836.c                     |   2 +
 hw/arm/raspi.c                       |  12 +-
 hw/char/Makefile.objs                |   1 +
 hw/char/bcm2835_aux.c                | 316 ++++++++++++++++++++++++++
 hw/display/Makefile.objs             |   1 +
 hw/display/bcm2835_fb.c              | 424 +++++++++++++++++++++++++++++++=
++++
 hw/dma/Makefile.objs                 |   1 +
 hw/dma/bcm2835_dma.c                 | 408 +++++++++++++++++++++++++++++++=
++
 hw/misc/bcm2835_property.c           | 139 +++++++++++-
 include/hw/arm/bcm2835_peripherals.h |   6 +
 include/hw/char/bcm2835_aux.h        |  33 +++
 include/hw/display/bcm2835_fb.h      |  47 ++++
 include/hw/dma/bcm2835_dma.h         |  47 ++++
 include/hw/misc/bcm2835_property.h   |   5 +-
 15 files changed, 1532 insertions(+), 13 deletions(-)
 create mode 100644 hw/char/bcm2835_aux.c
 create mode 100644 hw/display/bcm2835_fb.c
 create mode 100644 hw/dma/bcm2835_dma.c
 create mode 100644 include/hw/char/bcm2835_aux.h
 create mode 100644 include/hw/display/bcm2835_fb.h
 create mode 100644 include/hw/dma/bcm2835_dma.h

--=20
2.7.0

