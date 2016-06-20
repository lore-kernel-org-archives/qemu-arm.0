Received: by 10.25.21.96 with SMTP id l93csp1524563lfi;
        Mon, 20 Jun 2016 09:14:35 -0700 (PDT)
X-Received: by 10.13.242.134 with SMTP id b128mr8954577ywf.318.1466439274985;
        Mon, 20 Jun 2016 09:14:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r5si5421558ywr.211.2016.06.20.09.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 09:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bF1qM-0004eO-Ch
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 12:14:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bF1eb-0007A7-RG
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 12:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bF1eQ-0006qh-Ow
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 12:02:25 -0400
Received: from 19.mo7.mail-out.ovh.net ([178.33.251.118]:40793)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bF1eQ-0006pv-Ht
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 12:02:14 -0400
Received: from player739.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id BBD1BFFA2A5
	for <qemu-devel@nongnu.org>; Mon, 20 Jun 2016 18:02:12 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player739.ha.ovh.net (Postfix) with ESMTPSA id 275124A0078;
	Mon, 20 Jun 2016 18:02:04 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1466165724-7620-1-git-send-email-clg@kaod.org>
	<1466165724-7620-5-git-send-email-clg@kaod.org>
	<CAFEAcA_C-0MO7T8b2iyRqbj+eEe0ns-Jejo24M+dzpQj6GCvcQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <19bc939e-885d-efa6-3324-a3b95d4b47c9@kaod.org>
Date: Mon, 20 Jun 2016 18:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_C-0MO7T8b2iyRqbj+eEe0ns-Jejo24M+dzpQj6GCvcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 1406248985234082771
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrleehgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.251.118
Subject: Re: [Qemu-devel] [PATCH v2 4/5] ast2400: create SPI flash slaves
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AntUW5PVAk3a

On 06/20/2016 05:38 PM, Peter Maydell wrote:
> On 17 June 2016 at 13:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> A set of SPI flash slaves is attached under the flash controllers of
>> the palmetto platform. "n25q256a" flash modules are used for the BMC
>> and "mx25l25635e" for the host. These types are common in the
>> OpenPower ecosystem.
>>
>> The segment addresses used for the memory mappings are the defaults
>> provided by the specs. They can be changed with the Segment Address
>> Register but this is not supported in the current implementation.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>=20
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 6a02906c8f97..a8337eb81975 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>=20
>> +void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype=
,
>> +                             Error **errp)
>> +{
>> +    int i ;
>> +    char name[32];
>> +
>> +    for (i =3D 0; i < s->num_cs; ++i) {
>> +        Object *obj =3D object_new(TYPE_ASPEED_SMC_FLASH);
>> +        AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(obj);
>> +        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>=20
> You don't want to be calling drive_get_next() in code in
> hw/ssi -- that should be done at the board level, and then
> the board creates the flash device and sets its drive property
> and connects the flash device up to the SSI controller.

OK. I will rework that part.
=20
Thanks,

C.

