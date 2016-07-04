Received: by 10.25.21.96 with SMTP id l93csp1524831lfi;
        Mon, 4 Jul 2016 06:35:48 -0700 (PDT)
X-Received: by 10.55.26.102 with SMTP id a99mr15213425qka.145.1467639345311;
        Mon, 04 Jul 2016 06:35:45 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si2455836qke.191.2016.07.04.06.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 06:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK42K-0006t1-Mj
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 09:35:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK3AO-0007Td-Rg
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:40:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK3AK-00082n-MJ
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:39:59 -0400
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:39212)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK3AK-00082X-GX
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:39:56 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 8B759FFBD25
	for <qemu-devel@nongnu.org>; Mon,  4 Jul 2016 14:39:55 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id D12DA48009D;
	Mon,  4 Jul 2016 14:39:48 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-2-git-send-email-clg@kaod.org>
	<CAFEAcA9RzmF7UcCL3fuBCPtWbBrWUYs8836=OjC5d=H3n4u+Bw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8a6e0fd8-cd84-53c2-e230-a401ffac4212@kaod.org>
Date: Mon, 4 Jul 2016 14:39:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9RzmF7UcCL3fuBCPtWbBrWUYs8836=OjC5d=H3n4u+Bw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 6420444222065183500
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.178.58
Subject: Re: [Qemu-devel] [PATCH 1/7] tests: add a m25p80 test
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Marcin_Krzemi=c5=84ski?= <mar.krzeminski@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TZ94QQ7uD4ST

On 07/04/2016 02:24 PM, Peter Maydell wrote:
> On 4 July 2016 at 13:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> This test uses the palmetto platform and the AST2400 SPI controller to
>> test the m25p80 flash module device model. The flash model is defined
>> by the platform (n25q256a) and it would be nice to find way to control
>> it, using a property probably.
>=20
>=20
>> +static inline void flash_writel(uint32_t data)
>> +{
>> +    data =3D cpu_to_be32(data);
>> +    memwrite(AST2400_FLASH_BASE, &data, 4);
>> +}
>> +
>> +static inline uint32_t flash_readl(void)
>> +{
>> +    uint32_t data;
>> +
>> +    memread(AST2400_FLASH_BASE, &data, 4);
>> +    return be32_to_cpu(data);
>> +}
>=20
> These are weird. As per my question in the other thread, if you
> were writing this as a piece of test code that ran natively
> in the guest, how would you write it?

Here is the uboot flash code :

	https://github.com/openbmc/u-boot/blob/v2016.05-aspeed-openbmc/arch/arm/=
mach-aspeed/flash.c#L420

So these are doing byte per byte, but there is no reason not to do
long.


C.

