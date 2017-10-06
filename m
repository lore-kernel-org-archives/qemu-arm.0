Received: by 10.223.197.9 with SMTP id q9csp1753514wrf;
        Fri, 6 Oct 2017 08:11:39 -0700 (PDT)
X-Received: by 10.200.6.13 with SMTP id d13mr3441422qth.217.1507302699093;
        Fri, 06 Oct 2017 08:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507302699; cv=none;
        d=google.com; s=arc-20160816;
        b=h207jJFRBlkNXoDXyq4PN11yqIzth7S4KX7b/4OoKsBgvihEwsH4PjyWU7p8lhEn57
         StRzhu+etuW44xU1KgYRAz2jydw/6GxV1S8euYyXTo3sj0Im4Z1RDSf2Cey82WCafri1
         MLqeJhsqdElF6mHBKCZ7BssD8YOkcx22WQWBdKg7/g/MZ95pDf2PZPXmlZzzNgv9Gvab
         euObLGQjBZCqwInGW+46OmvbnshYcyYo3f76L3ezx7xBQFjXy/Y8Gf507ysIHQAoVvWo
         hbOdAz8AGhWdlSMfWV8iLxRtNCyVqMz4qcUBeQM8L8q9WzCz7UDoMsZcWhhRPM5/dw1W
         SLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=eFr22qtis9lHtauhPvrRwMJACbMnNF7db50e1Mn7a+c=;
        b=xP+oWv9+3ntVAbnn2QiCg/BEbSdA/tkDo7UlQcZQ/Iy3VYNRJs3nWRSdbES7ZJ8Wcz
         B0s64D+oUcXyaBaXWxTr7yuFhQMk5KBraGDYND5fL3OXT2oHax3R4jP3+YSEQE4hOIDS
         oQejTziMO8Udj2ZWlCB5XWqvN7ymaikNrUHUkIsbzlKImvVoRMrQqMVuiphM4K0mNGVg
         gXdz5hZ0zpicittPFgBrBxGlC7e2UpcnJkmu1MPQpzGtUELIxq+HWobG2jLJ/EZ/da90
         ne5pypaLvubkYZIoHwgXkQHCHlf58beQgq+OO7utHhFg2LiuiscDk7+ifRgbMDdZ65zL
         +Z/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DrjuhTDb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d7si376217qtj.22.2017.10.06.08.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 08:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DrjuhTDb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0UHq-0001JK-Jo
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 11:11:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0UGx-0000xL-7d
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 11:10:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0UGw-0002jE-5v
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 11:10:43 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:57078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0UGv-0002hv-VM
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 11:10:42 -0400
Received: by mail-wr0-x232.google.com with SMTP id r79so7896882wrb.13
	for <qemu-devel@nongnu.org>; Fri, 06 Oct 2017 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eFr22qtis9lHtauhPvrRwMJACbMnNF7db50e1Mn7a+c=;
	b=DrjuhTDb6Btmx4bmT+31diyzdJuT7tbLrXPBRIEvhjxa7kz8jsTlxV0iHiDdpGdTJW
	SWrOUqlaksEdoG4BirMLlPHegiYLzYDjOV+OlvpIMe3QAgMGrkOWG8x2hzBPBJ+etGa+
	+r0zw5eG5+IIhM0+g/FTYrQiR19GyKj+iwsuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eFr22qtis9lHtauhPvrRwMJACbMnNF7db50e1Mn7a+c=;
	b=iUe5m7ZEnAL5koF6VLmlA/+81IbDBSydENeicgZjuah6UoLZj11N4AofqZuBqsHVuo
	p8C84lc7edRvmVucA0bMBRCx3gl+5GsD8+t32dYYUZolxM+AK09mNJ3Zq9iPzE1YFZBF
	DkJyjUEOMErpn2ALuQ/vk6tsway9KD7EGhbX5qcBLAw4X+I0bVbPzuzJ0X7Z9J2Baj1C
	e6i5wGtq/yod47D/0VwB6EZI0/Jg9nM97bu2vfCBa6g+krw4qESmR63sYnpFj7Jn4Sep
	o7N3ouG1hsTwd/D3nawIGevgCkZB99FssR2hK3cUK+zXgEtJxqWyhF+rAo9KQJ+Sg6OQ
	WpGw==
X-Gm-Message-State: AMCzsaURTFsSoR8p26X4i5DEz9m6okiKmVLn3QVMsrTxlGcE0RapLYvW
	MHzk2H/clNz6Eg3owfW3PBpX2yrHwHfXKX2x3n7rOkrk
X-Google-Smtp-Source: AOwi7QBPn7HEtdxsMExJLOeUNx4AxeS8uPCADiOuuRT7gQSI96ATONIluj3eK17dwlLgOdJ6HeYZ2wDLmSvVuDg/D8w=
X-Received: by 10.223.186.201 with SMTP id w9mr2319598wrg.230.1507302640789;
	Fri, 06 Oct 2017 08:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 08:10:20 -0700 (PDT)
In-Reply-To: <20170920070135.31379-2-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 16:10:20 +0100
Message-ID: <CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lDFexuw4VSQ3

On 20 September 2017 at 08:01, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The Witherspoon boards are OpenPOWER system hosting POWER9 Processors.
> Let's add support for their BMC including a couple of I2C devices as
> found on real HW.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ab895ad490af..81f522f711ae 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -46,6 +46,7 @@ enum {
>      PALMETTO_BMC,
>      AST2500_EVB,
>      ROMULUS_BMC,
> +    WITHERSPOON_BMC,
>  };
>
>  /* Palmetto hardware value: 0x120CE416 */
> @@ -83,8 +84,12 @@ enum {
>          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
>          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>
> +/* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
> +#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> +
>  static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
>  static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
>
>  static const AspeedBoardConfig aspeed_boards[] =3D {
>      [PALMETTO_BMC] =3D {
> @@ -110,6 +115,14 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
>          .spi_model =3D "mx66l1g45g",
>          .num_cs    =3D 2,
>      },
> +    [WITHERSPOON_BMC]  =3D {
> +        .soc_name  =3D "ast2500-a1",
> +        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
> +        .fmc_model =3D "mx25l25635e",
> +        .spi_model =3D "mx66l1g45g",
> +        .num_cs    =3D 2,
> +        .i2c_init  =3D witherspoon_bmc_i2c_init,
> +    },
>  };
>
>  #define FIRMWARE_ADDR 0x0
> @@ -337,11 +350,47 @@ static const TypeInfo romulus_bmc_type =3D {
>      .class_init =3D romulus_bmc_class_init,
>  };
>
> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
> +{
> +    AspeedSoCState *soc =3D &bmc->soc;
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp105",=
 0x4a);
> +}
> +
> +static void witherspoon_bmc_init(MachineState *machine)
> +{
> +    aspeed_board_init(machine, &aspeed_boards[WITHERSPOON_BMC]);
> +}
> +
> +static void witherspoon_bmc_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +    mc->desc =3D "OpenPOWER Witherspoon BMC (ARM1176)";
> +    mc->init =3D witherspoon_bmc_init;
> +    mc->max_cpus =3D 1;
> +    mc->no_sdcard =3D 1;
> +    mc->no_floppy =3D 1;
> +    mc->no_cdrom =3D 1;
> +    mc->no_parallel =3D 1;
> +    mc->ignore_memory_transaction_failures =3D true;

Please don't set this flag for new board models, it is only
for our legacy existing ones. Instead implement any devices
that you need for guest code to boot (stub them out with
create_unimplemented_device() if you like).

thanks
-- PMM
