Received: by 10.25.21.96 with SMTP id l93csp358350lfi;
        Wed, 22 Jun 2016 23:28:25 -0700 (PDT)
X-Received: by 10.200.51.212 with SMTP id d20mr41794865qtb.14.1466663305506;
        Wed, 22 Jun 2016 23:28:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67si4208642qkc.263.2016.06.22.23.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 23:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFy7k-0007MF-P6
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 02:28:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bFy7g-0007JR-Jd
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 02:28:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bFy7X-000410-U2
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 02:28:19 -0400
Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26]:42140)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bFy7X-00040l-NM
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 02:28:11 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id B8972FF9ACB
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 08:28:10 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 77F5A2C00A7;
	Thu, 23 Jun 2016 08:28:06 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-4-git-send-email-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a7c723c8-96de-e2e3-2023-3100a08d926f@kaod.org>
Date: Thu, 23 Jun 2016 08:28:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466648115-17015-4-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 9329769579683941296
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdehgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.76.26
Subject: Re: [Qemu-arm] [PATCH v2 3/3] palmetto-bmc: Configure the SCU's
 hardware strapping register
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iNFIltX78RoH

On 06/23/2016 04:15 AM, Andrew Jeffery wrote:
> The magic constant configures the following options:
>=20
> * 28:27: Configure DRAM size as 256MB
> * 26:24: DDR3 SDRAM with CL =3D 6, CWL =3D 5
> * 23: Configure 24/48MHz CLKIN
> * 22: Disable GPIOE pass-through mode
> * 21: Disable GPIOD pass-through mode
> * 20: Enable LPC decode of SuperIO 0x2E/0x4E addresses
> * 19: Disable ACPI
> * 18: Configure 48MHz CLKIN
> * 17: Disable BMC 2nd boot watchdog timer
> * 16: Decode SuperIO address 0x2E
> * 15: VGA Class Code
> * 14: Enable LPC dedicated reset pin
> * 13:12: Enable SPI Master and SPI Slave to AHB Bridge
> * 11:10: Select CPU:AHB ratio =3D 2:1
> * 9:8: Select 384MHz H-PLL
> * 7: Configure MAC#2 for RMII/NCSI
> * 6: Configure MAC#1 for RMII/NCSI
> * 5: No VGA BIOS ROM
> * 4: Boot using 32bit SPI address mode
> * 3:2: Select 16MB VGA memory
> * 1:0: Boot from SPI flash memory
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---

Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Thanks,

C.


