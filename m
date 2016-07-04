Received: by 10.25.21.96 with SMTP id l93csp1515499lfi;
        Mon, 4 Jul 2016 06:14:24 -0700 (PDT)
X-Received: by 10.55.65.71 with SMTP id o68mr15182199qka.163.1467638063938;
        Mon, 04 Jul 2016 06:14:23 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a45si1976729qta.99.2016.07.04.06.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 06:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK3hf-0005Xx-6l
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 09:14:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK3c0-0000xy-QY
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 09:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK3bw-0005Lf-Ij
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 09:08:31 -0400
Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]:47042)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK3bw-0005LS-C5
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 09:08:28 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 6F8E7FFB378
	for <qemu-devel@nongnu.org>; Mon,  4 Jul 2016 15:08:27 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id B9AFA4800B0;
	Mon,  4 Jul 2016 15:08:21 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-2-git-send-email-clg@kaod.org>
	<CAFEAcA9RzmF7UcCL3fuBCPtWbBrWUYs8836=OjC5d=H3n4u+Bw@mail.gmail.com>
	<8a6e0fd8-cd84-53c2-e230-a401ffac4212@kaod.org>
	<CAFEAcA-MKzmUAZTEbL7WMEOyP84y5=Jj7J-jprW6azMRBYwcaw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0c7b846a-4c48-e894-ddcd-6fa39bb9f6c5@kaod.org>
Date: Mon, 4 Jul 2016 15:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-MKzmUAZTEbL7WMEOyP84y5=Jj7J-jprW6azMRBYwcaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 6902610854404262668
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.57.200
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
X-TUID: zkR/kYeLUdOy

On 07/04/2016 02:51 PM, Peter Maydell wrote:
> On 4 July 2016 at 13:39, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 07/04/2016 02:24 PM, Peter Maydell wrote:
>>> On 4 July 2016 at 13:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>>> This test uses the palmetto platform and the AST2400 SPI controller =
to
>>>> test the m25p80 flash module device model. The flash model is define=
d
>>>> by the platform (n25q256a) and it would be nice to find way to contr=
ol
>>>> it, using a property probably.
>>>
>>>
>>>> +static inline void flash_writel(uint32_t data)
>>>> +{
>>>> +    data =3D cpu_to_be32(data);
>>>> +    memwrite(AST2400_FLASH_BASE, &data, 4);
>>>> +}
>>>> +
>>>> +static inline uint32_t flash_readl(void)
>>>> +{
>>>> +    uint32_t data;
>>>> +
>>>> +    memread(AST2400_FLASH_BASE, &data, 4);
>>>> +    return be32_to_cpu(data);
>>>> +}
>>>
>>> These are weird. As per my question in the other thread, if you
>>> were writing this as a piece of test code that ran natively
>>> in the guest, how would you write it?
>>
>> Here is the uboot flash code :
>>
>>         https://github.com/openbmc/u-boot/blob/v2016.05-aspeed-openbmc=
/arch/arm/mach-aspeed/flash.c#L420
>>
>> So these are doing byte per byte, but there is no reason not to do
>> long.
>=20
> If you want "write a long", that is what writel does,
> and your test code should be able to use it in exactly
> the same way native guest code would write a register
> value with a str instruction.
>=20
> It's very easy to work around endianness issues by
> randomly changing things until the tests pass, but it's
> much better to actually identify what you need to do
> and where the code is diverging from that.

I agree. Let's forget that patch until I have clarified
how it should be done.

Thanks,

C.

