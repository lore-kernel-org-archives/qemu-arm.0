Received: by 10.223.197.9 with SMTP id q9csp3352601wrf;
        Tue, 10 Oct 2017 02:19:52 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDwCApy5jhBt5Ub7nTGEsxTzNDObAdksDh2lMkg8AeTdI3tvKbd1YSV4KgVU65viy7ke7rz
X-Received: by 10.55.42.23 with SMTP id q23mr13183403qkh.108.1507627192858;
        Tue, 10 Oct 2017 02:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507627192; cv=none;
        d=google.com; s=arc-20160816;
        b=sxTKB+9x60Om8PQPwQP4LaUPxle9ZiCftkfiwOz9hGOOkroLkDPmtNYaz76Uw7HKim
         q2e2kN4DIxThZSjmjpsLK46jU117LGIah44Ca+wambx03B7FWiUX/bDie0ThoJDQj/EC
         sPzy7p1MqOqm+dd7Wo5UbV036N+ftW1SvM8/s31/HHKKRA163tigGeLeqPZhf9iw38/c
         RoPME47DEgNeIE365I86iAhbqgo0kryC8QufiULo3/vPyL6LO75/UKrKRos0AqGTIsBU
         +Hdo/RyuP5/ca4Iwz2kmqBTVXMgLlq/FyhmARqaCM2+EHVgY1JgHL6mJErAlAc9U2Lkd
         TOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=2W5q0kbhIDH3Qkwkbp8yi6glho65eZtOsJXPuLIRgFI=;
        b=jBdqMO8UQeiIWbkRT+2H423E83Yem33wxcTpMH+tr8IImhD5EhyyNYpvQXckqmOmVh
         2p42IUUkaPFEkb84/PI3spTp4WsjQQ54oi087i30s72tD5kVrh3BRj2OcDDSa+wcVZBG
         +HZgKp4hDe68s5MmjDG69AZBV1LE50EA80GdpZhreWAs1/nNI7mkQrFQqDD88k1pSXjw
         GUeNY4ULWBSr858Wkk7PKTumHIjmK+A3/EsUmmsMYiMGQOSmIyAiUxGoo5Vaub550ZWQ
         mQQUpFVD/ZQSxn6aUiX2mrIq031EbB60nwTDIru9uufbXcRqWcNEtts1q8HsozreMukm
         H5Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si2633132qkd.122.2017.10.10.02.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 02:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1qha-0008Ag-Lw
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 05:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e1qhM-00087k-Hr
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 05:19:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e1qhC-0001Ji-NB
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 05:19:36 -0400
Received: from 7.mo178.mail-out.ovh.net ([46.105.58.91]:47889)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e1qhC-0001Hy-GO
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 05:19:26 -0400
Received: from player728.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 68BE95A407
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 11:19:19 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice3n7.emea.ibm.com
	[195.212.29.177]) (Authenticated sender: postmaster@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id 591185400A4;
	Tue, 10 Oct 2017 11:19:10 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f3871f0a-7df2-a5e0-1770-8df04bb76750@kaod.org>
Date: Tue, 10 Oct 2017 11:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10418514788376415172
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledruddtuddgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.58.91
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iv+qRShmr7Lu

On 10/06/2017 05:10 PM, Peter Maydell wrote:
> On 20 September 2017 at 08:01, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> The Witherspoon boards are OpenPOWER system hosting POWER9 Processors.
>> Let's add support for their BMC including a couple of I2C devices as
>> found on real HW.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/aspeed.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++=
+
>>  1 file changed, 49 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ab895ad490af..81f522f711ae 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -46,6 +46,7 @@ enum {
>>      PALMETTO_BMC,
>>      AST2500_EVB,
>>      ROMULUS_BMC,
>> +    WITHERSPOON_BMC,
>>  };
>>
>>  /* Palmetto hardware value: 0x120CE416 */
>> @@ -83,8 +84,12 @@ enum {
>>          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                           =
   \
>>          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>>
>> +/* Witherspoon hardware value: 0xF10AD216 (but use romulus definition=
) */
>> +#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>> +
>>  static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
>>  static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
>> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
>>
>>  static const AspeedBoardConfig aspeed_boards[] =3D {
>>      [PALMETTO_BMC] =3D {
>> @@ -110,6 +115,14 @@ static const AspeedBoardConfig aspeed_boards[] =3D=
 {
>>          .spi_model =3D "mx66l1g45g",
>>          .num_cs    =3D 2,
>>      },
>> +    [WITHERSPOON_BMC]  =3D {
>> +        .soc_name  =3D "ast2500-a1",
>> +        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
>> +        .fmc_model =3D "mx25l25635e",
>> +        .spi_model =3D "mx66l1g45g",
>> +        .num_cs    =3D 2,
>> +        .i2c_init  =3D witherspoon_bmc_i2c_init,
>> +    },
>>  };
>>
>>  #define FIRMWARE_ADDR 0x0
>> @@ -337,11 +350,47 @@ static const TypeInfo romulus_bmc_type =3D {
>>      .class_init =3D romulus_bmc_class_init,
>>  };
>>
>> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>> +{
>> +    AspeedSoCState *soc =3D &bmc->soc;
>> +
>> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp42=
3", 0x4c);
>> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp42=
3", 0x4c);
>> +
>> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp10=
5", 0x4a);
>> +}
>> +
>> +static void witherspoon_bmc_init(MachineState *machine)
>> +{
>> +    aspeed_board_init(machine, &aspeed_boards[WITHERSPOON_BMC]);
>> +}
>> +
>> +static void witherspoon_bmc_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc =3D MACHINE_CLASS(oc);
>> +
>> +    mc->desc =3D "OpenPOWER Witherspoon BMC (ARM1176)";
>> +    mc->init =3D witherspoon_bmc_init;
>> +    mc->max_cpus =3D 1;
>> +    mc->no_sdcard =3D 1;
>> +    mc->no_floppy =3D 1;
>> +    mc->no_cdrom =3D 1;
>> +    mc->no_parallel =3D 1;
>> +    mc->ignore_memory_transaction_failures =3D true;
>=20
> Please don't set this flag for new board models, it is only
> for our legacy existing ones. Instead implement any devices
> that you need for guest code to boot (stub them out with
> create_unimplemented_device() if you like).

I have dug into this a little more and it seems that it is=20
required for the Aspeed bootloader (a modified u-boot) which=20
uses static variables in early init phases. So legacy firmwares=20
won't work in QEMU but will on real HW.=20

It's fine with me but what is the goal of the approach ? Force=20
SoC providers into fixing their FW when they use QEMU ?

Thanks,

C.=20


