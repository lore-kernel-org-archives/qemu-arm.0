Received: by 10.223.197.9 with SMTP id q9csp328574wrf;
        Wed, 11 Oct 2017 00:28:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCeRDtr2WfQVBNkmKqfGkfnPUbOtZayQ/74wRyXwAbfHDN9GPkNoqrjmaqkom/qsiFxAI5y
X-Received: by 10.200.34.239 with SMTP id g44mr6265541qta.111.1507706921352;
        Wed, 11 Oct 2017 00:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507706921; cv=none;
        d=google.com; s=arc-20160816;
        b=xaJjIUUtpeqkJab7P666sVe88GBnak1MUfhfYuiOAU/thRqCkaXY1sMoXLvxOAAone
         FG7phl0B/0p3cXpQ2z4Q3v19291IIyw2Qu4KdJJ9zWqdB1yY0rkxwsz1zG/RqtOpdywG
         zgGmKIAlZXtjAFc/NLHKIFP7iqCRGEX8cYYUfRX2HcUyuXBmGzoRws6w+TdxGoDAVI4h
         qg0l7wsjsYMWmZS/EHzlsb/0UNKH8MjwDKi2k2i00JsUxQWllTUy6YtvDU63byOPZx3b
         IFfa0dZKCB3Ha0bMINaO2SpsZCEPs3+78xyYcPpbHIdVB/BRtmANwEEkWFCjy/Ed+wJd
         ITGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=RYCPnSzFMkP59MYawVpqkDIEQ7DVUZJfiy2m8qt0Wnk=;
        b=o3Iv7D9nS5Tk7AlCiwrt/5kXgJMHEGqdByh+Co8utYnLvEveV/6nJkLh4OfGTBlCI7
         VQ3enL7KK1Ly0GqIDLltdQt4IlDkVz6vGFThTAHoygbonUhYOzIbIXUoKpOkuBa+/Tas
         fvtPLjucnJ0Py25JF3vmj6UZpOwQ8jF9gCDnVjFjdMD7adWZ2ZSpINJuB8BQpEiuquRX
         sJktb3m4Ke2DOx7oXToOB+M4f8UndtDvBbow7j+ab5WyttuXJZRZyQCoOMz2OHYzJe1e
         Z3qerW1MV54JzEdcTtqAMn2zrgTtzPTWT75DktUEboA98C6oixMGwq2qE7ZV1LKkYZ42
         cn2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p16si357719qtg.298.2017.10.11.00.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 00:28:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2BRX-0006Da-49
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 03:28:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e2BRL-0006DQ-4s
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 03:28:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e2BRH-0005Q5-5t
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 03:28:27 -0400
Received: from 5.mo177.mail-out.ovh.net ([46.105.39.154]:40060)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e2BRG-0005Pf-VG
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 03:28:23 -0400
Received: from player792.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 319147B628
	for <qemu-arm@nongnu.org>; Wed, 11 Oct 2017 09:28:20 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player792.ha.ovh.net (Postfix) with ESMTPSA id BC027A0074;
	Wed, 11 Oct 2017 09:28:14 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<1507507449.5452.147.camel@aj.id.au>
	<48144f71-c876-0e89-f01e-cbfe87687aee@kaod.org>
	<1507693785.5452.175.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ca6255bb-64f8-10bf-1e1f-a693ae38f4c3@kaod.org>
Date: Wed, 11 Oct 2017 09:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507693785.5452.175.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 14417148310479145924
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtddugdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.39.154
Subject: Re: [Qemu-arm] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nD9rwaKIIQXj

On 10/11/2017 05:49 AM, Andrew Jeffery wrote:
> On Tue, 2017-10-10 at 15:30 +0200, C=C3=A9dric Le Goater wrote:
>> On 10/09/2017 02:04 AM, Andrew Jeffery wrote:
>>> On Wed, 2017-09-20 at 09:01 +0200, C=C3=A9dric Le Goater wrote:
>>>> The Witherspoon boards are OpenPOWER system hosting POWER9 Processor=
s.
>>>> Let's add support for their BMC including a couple of I2C devices as
>>>> found on real HW.
>>>> =C2=A0
>>>>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>>> ---
>>>> =C2=A0hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++=
++++++++
>>>> =C2=A01 file changed, 49 insertions(+)
>>>> =C2=A0
>>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>>> index ab895ad490af..81f522f711ae 100644
>>>> --- a/hw/arm/aspeed.c
>>>> +++ b/hw/arm/aspeed.c
>>>> @@ -46,6 +46,7 @@ enum {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PALMETTO_BMC,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST2500_EVB,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ROMULUS_BMC,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0WITHERSPOON_BMC,
>>>> =C2=A0};
>>>> =C2=A0
>>>> =C2=A0/* Palmetto hardware value: 0x120CE416 */
>>>> @@ -83,8 +84,12 @@ enum {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_AST2500_HW=
_STRAP_ACPI_ENABLE |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_HW_STRAP_S=
PI_MODE(SCU_HW_STRAP_SPI_MASTER))
>>>> =C2=A0
>>>> +/* Witherspoon hardware value: 0xF10AD216 (but use romulus definiti=
on) */
>>>> +#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>>>> +
>>>> =C2=A0static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
>>>> =C2=A0static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
>>>> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
>>>> =C2=A0
>>>> =C2=A0static const AspeedBoardConfig aspeed_boards[] =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[PALMETTO_BMC] =3D {
>>>> @@ -110,6 +115,14 @@ static const AspeedBoardConfig aspeed_boards[] =
=3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D=
 "mx66l1g45g",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=
=A0=C2=A0=C2=A0=3D 2,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0[WITHERSPOON_BMC]=C2=A0=C2=A0=3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.soc_name=C2=A0=C2=A0=
=3D "ast2500-a1",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hw_strap1 =3D WITH=
ERSPOON_BMC_HW_STRAP1,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fmc_model =3D "mx2=
5l25635e",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D "mx6=
6l1g45g",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=A0=
=C2=A0=C2=A0=3D 2,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.i2c_init=C2=A0=C2=A0=
=3D witherspoon_bmc_i2c_init,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0},
>>>> =C2=A0};
>>>> =C2=A0
>>>> =C2=A0#define FIRMWARE_ADDR 0x0
>>>> @@ -337,11 +350,47 @@ static const TypeInfo romulus_bmc_type =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D romulus_bmc_class_init=
,
>>>> =C2=A0};
>>>> =C2=A0
>>>> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 4), "tmp423", 0x4c);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 5), "tmp423", 0x4c);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 9), "tmp105", 0x4a);
>>>
>>> Looks like I need to track down newer versions of the schematics I ha=
ve.
>>
>> the device on the board is a tmp275 but the tmp105 model is compatible=
.
>=20
> It neither device is listed in the version I have :)

Here is my source :

	https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-=
bmc-opp-witherspoon.dts#L504

C.=20
