Received: by 10.25.21.156 with SMTP id 28csp1718262lfv;
        Sat, 30 Jul 2016 01:35:42 -0700 (PDT)
X-Received: by 10.200.49.203 with SMTP id i11mr72046830qte.40.1469867742749;
        Sat, 30 Jul 2016 01:35:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k66si5068921qkl.56.2016.07.30.01.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jul 2016 01:35:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bTPkE-00087J-4B
	for alex.bennee@linaro.org; Sat, 30 Jul 2016 04:35:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bTPk8-000879-WE
	for qemu-arm@nongnu.org; Sat, 30 Jul 2016 04:35:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bTPk4-00010d-Mj
	for qemu-arm@nongnu.org; Sat, 30 Jul 2016 04:35:35 -0400
Received: from 4.mo6.mail-out.ovh.net ([87.98.184.159]:43920)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bTPk4-00010R-CL
	for qemu-arm@nongnu.org; Sat, 30 Jul 2016 04:35:32 -0400
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 1E806FFBD2A
	for <qemu-arm@nongnu.org>; Sat, 30 Jul 2016 10:35:29 +0200 (CEST)
Received: from localhost.localdomain (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id 584C6207;
	Sat, 30 Jul 2016 10:35:25 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-2-git-send-email-clg@kaod.org>
	<1469672053.5468.81.camel@aj.id.au>
	<9316329d-c22d-aab1-c5d9-e10ab306ffb8@kaod.org>
	<1469754973.5468.149.camel@aj.id.au>
Message-ID: <98566db3-da3b-5696-f21c-db031757f83b@kaod.org>
Date: Sat, 30 Jul 2016 10:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1469754973.5468.149.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 7408421388100537264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjedugddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.184.159
Subject: Re: [Qemu-arm] [PATCH 1/6] palmetto-bmc: add a "silicon-rev"
 property at the soc level
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cAOY8TFA2EOs

On 07/29/2016 03:16 AM, Andrew Jeffery wrote:
> On Thu, 2016-07-28 at 09:51 +0200, C=C3=A9dric Le Goater wrote:
>> On 07/28/2016 04:14 AM, Andrew Jeffery wrote:
>>>
>>> On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
>>>>
>>>> The SCU controler holds the board revision number in its 0x7C
>>>> register. Let's use an alias to link a "silicon-rev" property of the
>>>> soc to the "silicon-rev" property of the SCU controler.
>>>>
>>>> The SDMC controler "silicon-rev" property is derived from the SCU on=
e
>>>> at realize time. I did not find a better way to handle this part.
>>>> Links and aliases being a one-to-one relation, I could not use one o=
f
>>>> them. I might wrong though.
>>> Are we trying to over-use the silicon-rev value (it would seem so at
>>> least in the face of the link/alias constraints)? We know which SDMC
>>> revision we need for each SoC and we'll be modelling an explicit SoC
>>> revision, so should we instead set a separate property on the SDMC in
>>> the SoCs' respective initialise functions (and leave silicon-rev to t=
he
>>> SCU)?=20
>> This is the case. no ?=20
>=20
> No, because you are selecting the SDMC configuration from the silicon-
> rev rather than letting e.g. the SDMC configuration define which
> silicon-rev the SoC takes.
>=20
> My thinking is the silicon rev is a property of the SoC. The platform
> should select a SoC to use and not be setting silicon revision values,
> that is I think it's a layering violation for the platform to be
> setting the silicon-rev (and also the CPU).
>=20
> We also wind up in a situation where the ast2500 soc identifies as an
> ast2400 in TypeInfo.name due to the approach to reuse by this series.

OK. To be cleaner, we could add a AspeedSoCClass and a set of predefined=20
subclasses for each revision we support, that we would instantiate at the=
=20
platform level.
 =20
The AspeedSocClass would be similar to the AspeedBoardConfig struct in=20
the current patchset, plus the cpu model. How would that be ?  =20

>> SCU holds the silicon-rev value. The patch adds a property alias to th=
e=20
>> SCU 'silicon-rev' property at the soc level. This is convenient
>=20
> Right, but "convenient" here is a bit of a stretch given we are
> subsequently fetching the value out of the SCU to select the SDMC
> configuration. You might argue that it's due to limitations of the
> property alias/link API, but maybe we could rearrange things so this
> goes away.

yes that would be nicer not to have to re-set the silicon rev of the=20
controllers of a SoC.

>>  for the
>> platform to initialize the soc. This is similar to what the rpi2 does,
>> which goes one level in the aliasing.
>=20
> Okay, maybe I'm barking up trees unnecessarily.

No. your point on the SoC reuse is very valid. I try not to overspecify=20
too early but I agree I took a little shortcut. I will kick a v3 with
the above. It should not be too much of a change.

>> Then, at initialize time, the SCU 'silicon-rev' property value is read
>> to initialize the SDMC controller. If we have more controllers in the=20
>> future needing 'silicon-rev,  we could follow the same pattern. Not=20
>> saying this is perfect.=20
>>
>> What I would have liked to do, is to link all the 'silicon-rev' do
>> the SCU one. I did not find a way.
>=20
> Yes, that would be nice. I did briefly poke around to see if there was
> a solution to the link/alias issue but it seems not.=20
>=20
>>
>>>
>>> My thought was the silicon-rev value is reflective of the SoC
>>> design rather than the other way around - but maybe that's splitting
>>> hairs.=20
>> ah. is your concern about which object is holding the value ? If so,
>> I thought that keeping it where it belongs on real HW was the better=20
>> option, that is in SCU, and then build from there.
>=20
> No, that's not my concern, but I agree that it would not reflect the
> hardware if there was a property on the SoC (i.e. there is nowhere
> besides the SCU that the value is held).

So I understand that the 'silicon-rev' location is not the biggest concer=
n
and we can keep it as it is in the patchset. Being able to alias the=20
different 'silicon-rev' properties to a common one would be nice though.
=20
>>> It would also be trading off a bit of ugliness in this patch for
>>> potential bugs if the properties get out of sync.
>> This is the exact the purpose of the patch ! I failed to make it feel
>> that way :)
>=20
> Right. I think we need another layer of abstraction, essentially a soc
> configuration struct that is accessed by what are currently the
> ast2400_{init,realise}() functions. This will capture differences like
> changes in IO addresses, changes to IP behaviour, the CPU types and
> ultimately the silicon-rev value. What is now ast2400_init() and
> ast2400_realise() can become generic aspeed_soc_{init,realise}(), and
> then we wrap calls to this up in SoC-specific
> ast2{4,5}00_{init,realise}() where we set the configuration struct. It
> is a bit more work but I think the result would better reflect the
> hardware and avoid introducing what feel to me like layering
> violations.
>
> Thoughts?

Looks good. However I don't think there is no need for init() and realize=
()=20
ops right now. A .class_data should be sufficient. see this patch [1]. I =
still=20
need to rework that i2c patch btw. =20

We can rework the SoC realize() if the need arise.

Cheers,

C.

[1] https://patchwork.kernel.org/patch/9129887/
