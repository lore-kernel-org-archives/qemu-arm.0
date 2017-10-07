Received: by 10.223.197.9 with SMTP id q9csp845487wrf;
        Sat, 7 Oct 2017 09:44:23 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD18xdhkY5b3MQRbud6J0o8jR2iRtuRHCVACLtf4PkFwIkqncsC+NaEvFkZlFL5Gxci6uaW
X-Received: by 10.55.52.147 with SMTP id b141mr3295001qka.76.1507394663683;
        Sat, 07 Oct 2017 09:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507394663; cv=none;
        d=google.com; s=arc-20160816;
        b=QFR63vEm2lYNmJ5DhwW1HRgsRx7DLerHGxiIGdk9qteGb9ymsnjpdmFzmi3pa3AC49
         7EYMbyK0FryvfqxwAL5dLbuIOdVKGXh5kbLk5CvJYevQJuO9jht4nLaNITJE09AOgXoB
         Zs/7zWO92tD8cDKyWLT+q9hEX4PWj4r15yP9dz978n38vVt6hXUABA8t+XNzmqZKwNEP
         StnKICZEO0EoSml+1WbCbxpZ4sT0SxwkGyAzJxajFiu0LCivSmXdDF4ktqxm4TAoF3uK
         b17rrd7SDQGuRnSUCOAaoYuBWhp5DnARwBz7m62o9oUjL4yAwAV5c5JON13zKPfgcyQW
         j5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=6Zp642PmNmJOui7Dizmr06/2054EeQ2BP/zQQ1OxwNE=;
        b=WCKHfNvdW2ZA6qvdyfwXEhrzkfvQxJ5NG8Ak3Q8hg2r0R+iXqlVfLQPwCUCr0mXUsO
         +oh+IG/6C6EtuPQU3uGf4F+8clYlGslAkxHVJUAgh1D9z2OUorLGK5S5bli0erJKdue3
         N0oIc4iRqbEfpQ8KYkvif/xYOtOXCjzg8/Dnod00dKLgNA1TA16IwXjCF/JoKvxlYTT7
         /WurWZoLkCikheCGDclTHY1xOpBcWvcOD+w1bEh3lPUneNO2QHfU+hl0ak/OuIOXZKcG
         23YQ+hYRysHeRFc38lrgmVZOeLgF8wAwqOhJmZCNwhZPWpdoCfhOnGzTr9C9PwJmMewt
         xKLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y40si3371210qtj.293.2017.10.07.09.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 07 Oct 2017 09:44:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0sD9-0007qC-7g
	for alex.bennee@linaro.org; Sat, 07 Oct 2017 12:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e0sBI-0007Ay-15
	for qemu-devel@nongnu.org; Sat, 07 Oct 2017 12:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e0sBE-0004Wk-V1
	for qemu-devel@nongnu.org; Sat, 07 Oct 2017 12:42:28 -0400
Received: from 1.mo177.mail-out.ovh.net ([178.33.107.143]:34488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e0sBE-0004WC-P7
	for qemu-devel@nongnu.org; Sat, 07 Oct 2017 12:42:24 -0400
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id B494979680
	for <qemu-devel@nongnu.org>; Sat,  7 Oct 2017 18:42:23 +0200 (CEST)
Received: from zorba.kaod.org (i15-les03-th2-31-37-69-229.sfr.lns.abo.bbox.fr
	[31.37.69.229]) (Authenticated sender: postmaster@kaod.org)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id EF5D97C0084;
	Sat,  7 Oct 2017 18:42:17 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <528c49b8-0d94-dad7-c664-c8a91b6b4a2e@kaod.org>
Date: Sat, 7 Oct 2017 18:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 283445305816157124
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrleehgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.107.143
Subject: Re: [Qemu-devel] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KTKl/R1GBYgV

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

OK. I am discovering this. I will take a look for the next
round.

C.=20
