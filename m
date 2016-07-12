Received: by 10.25.21.156 with SMTP id 28csp463540lfv;
        Tue, 12 Jul 2016 09:20:30 -0700 (PDT)
X-Received: by 10.55.161.73 with SMTP id k70mr3909885qke.189.1468340430359;
        Tue, 12 Jul 2016 09:20:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h186si3029280qkd.278.2016.07.12.09.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 09:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bN0Q9-0004qV-RA
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 12:20:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bN0Q2-0004pW-Ov
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 12:20:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bN0Px-0002n7-OD
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 12:20:22 -0400
Received: from 7.mo179.mail-out.ovh.net ([46.105.61.94]:45455)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bN0Px-0002mx-Hb
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 12:20:17 -0400
Received: from player698.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id D1E1AFFCFC1
	for <qemu-arm@nongnu.org>; Tue, 12 Jul 2016 18:20:15 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id F371C520074;
	Tue, 12 Jul 2016 18:20:09 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467994016-11678-1-git-send-email-clg@kaod.org>
	<CAFEAcA_pvYaFuo=U_LjnD6-+2iHzbaAahjTMxf_X41+BGDR0vA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <08ab3354-d97f-2f80-b6d5-d8169b46e199@kaod.org>
Date: Tue, 12 Jul 2016 18:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_pvYaFuo=U_LjnD6-+2iHzbaAahjTMxf_X41+BGDR0vA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 1782862505079966635
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrfeekgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.61.94
Subject: Re: [Qemu-arm] [PATCH 0/5] ast2400: some cleanups and a simple
 memory controller model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: keh3m8y6FOrN

Hello Peter,

On 07/12/2016 04:19 PM, Peter Maydell wrote:
> On 8 July 2016 at 17:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> Here are a couple of cleanups and a very basic memory controller model
>> providing a configuration register. This is needed to determine the
>> RAM size of the SOC, only used by U-Boot as of today.
>>
>> Ultimately, we would want to add more support for U-Boot and be able
>> to boot from flash 0 but the device model of the m25p80 object is not
>> designed to use a memory region. And so, it is difficult to define a
>> rom device for the flash backend.
>>
>> Some initial patches were proposed but they are not being friendly
>> with the object interface. Work in progress.
>=20
> Hi; the release process is now at the point where I wouldn't really
> want to put this into 2.7; I can be persuaded if you have a solid
> justification, though.

Here is my take to it  :

* 1/5 hw/misc: fix typo in Aspeed SCU hw-strap2 property name
 =20
  That's a minor fix

* 2/5 ast2400: replace aspeed_smc_is_implemented()

  That is not a fix but it removes some ugliness in the code, which=20
  you had noticed, and which prevents us from fixing possible issues=20
  nicely. So this is a preventive cleanup :)

* 3/5 ast2400: pretend DMAs are done for U-boot

  This is a work around fix. U-boot[1] uses DMAs to calibrate the=20
  SPI flash module. It will spin until the DMA transfers are done.

* 4/5 ast2400: externalize revision numbers

  This is minor fix de-duplicating code and a prereq for the next
  patch.

* 5/5  ast2400: add a memory controller device model

  That's an enhancement. It adds a basic device model for the memory
  controller. This is needed by some version of the SDK relying on
  the configuration register to know how much RAM the SOC has. Older
  versions used a hardcoded value. =20


The first patches should not be too much of a problem regarding the=20
soft freeze. The last can wait 2.8 if you prefer, we need more work=20
to fully support u-boot anyhow. I would be happy to have review=20
though :) The model is very much like the SCU.

Thanks,

C.

[1] not supported yet in qemu because of the lack of a rom device=20
    memory region needed to boot from the flash module.


