Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1232725wrg;
        Mon, 3 Jun 2019 16:48:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymRxKUOdejjbHLgtH4p4S/ZyeGsZ7yMMRmV+6bgq7VMJL17PdkhqX9Wg6FtEVRszO5EYcA
X-Received: by 2002:a37:e10e:: with SMTP id c14mr5701900qkm.54.1559605721786;
        Mon, 03 Jun 2019 16:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559605721; cv=none;
        d=google.com; s=arc-20160816;
        b=iM9+Cb4rbBPV1ftBs+zJVsRgaQmBT7QfFXjQGBVg6959bW5U+mb332vqCro+yakPzR
         ScQYmd+9A8v39PTLkpdNxWg7I327Wr7q8rZP4AyIOv8nmjOQxd85aeiRS8U58/VflvxL
         aUYPWQNcZpdaU+J0uF8iVmDr3YO/Nyjo5Ec4o+k4AghZg85Yv2fr0WfyMiFN0ek6o7ZL
         M6SQYWag/x1eJ2jcUSmtZ26P4o2HnKRxwDFKTn3FLJcdNWNtRNfcvocwLiR03vHiKCd9
         yd/14eaW1UbOJiS7/R1CfrenbDjVQ+6MNm/NfnZgPjv0ZUYBpSGh1gBEFqfPa8YblsUs
         OKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=IedQnp4n7sc7uhKmP28GSGedfo6Wzjji7nOXohQAD28=;
        b=ZTex570N5wyyP1Lm7w74liSyh4uaw2FXRC7oDpDSbQxekdT72nXyezEU4H6eo3DOFb
         rcuqqgXOTJVlKd0ajKiwmvk4b3rH4M+D4UD1qMYKhomdl/FtV9HtaXJTg4ku1uROZRoJ
         /xGryBnOHNNhzycLUY79EM9ZiZdjdnEYgKHvgXA7IP0IteNPpVTwbRss+TUbI+K/DmOM
         He+qfhqxXZrO20/UGYjnSjmSJMfPzI9o/5boSx3Zy7lG4GHlUXp432XZvRIxV/Nc1/Q7
         ftkX4x4UtJEyL84wNcB5AGOjeHkqOiSLH0JjiU6cQ1yeDi2IwUubfLAIiVJmAYXqlVjo
         xh5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=cnYlZ8d6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si10539743qtf.386.2019.06.03.16.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jun 2019 16:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=cnYlZ8d6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hXwgy-00087t-TD
	for alex.bennee@linaro.org; Mon, 03 Jun 2019 19:48:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hXwgS-0007hA-JY
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 19:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hXwWD-0003XI-Mx
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 19:37:34 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:35100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hXwWC-0003Tv-GU; Mon, 03 Jun 2019 19:37:33 -0400
Received: by mail-qt1-x841.google.com with SMTP id d23so11669531qto.2;
	Mon, 03 Jun 2019 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IedQnp4n7sc7uhKmP28GSGedfo6Wzjji7nOXohQAD28=;
	b=cnYlZ8d6hCbp1G6CpcTvjkH9vK0QIu19eYL0DUWg9YQo8i7PtV+73O24HR/z6K/3Es
	9+4WyhPfyNR1B0Aznzd4dJ8uKFRWJw7h5PKE9o+fSZnWJ6S/4b9CM4b8seCNWus7uvz3
	9XfpvGR6ZYBoHNNTYL62iQcZfhQySX0oaHDiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IedQnp4n7sc7uhKmP28GSGedfo6Wzjji7nOXohQAD28=;
	b=VZD4SvKjG942LrVgqg9F7jSns4TCwYzyHfojJWFbEWvi+O69+jeZiBqrqfkNNX33S+
	Sob2ZRdZb+RfT+93yIQ9Zl3DwnRx/feaXy/sCK4BguS8L9Ey4B1MeaB824r9aILqiH27
	tvPB7h0nXETcvAjmCBUNY/aF5dnx3iiU1EtpXGSV+2QGBCIaiK3qSrwjsuc/HW6kkuAW
	gtYfjIkoxdazmi03+rFxVju5aRdnmhiB+33O7ghYeEACTo04Vgc1RyoRpyCtSu36zoOZ
	1G/aL4eZylvG0fJNFboh+cBRKNlDksO1/ZlT/sqUpFXt0Usyb8b9JYjlB28Yp21HT+n8
	P/vg==
X-Gm-Message-State: APjAAAUiHnhmcujBjJx97vWmIQ3RCJm2KMxE7ahFDe1q2WPrrgpqP7qY
	6HUJ/NLZ+pliWmNTprIpG3D6fQzhHj5PANjqh18=
X-Received: by 2002:a0c:8732:: with SMTP id 47mr3389651qvh.105.1559605049053; 
	Mon, 03 Jun 2019 16:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <1559589055-71202-1-git-send-email-anoo@linux.ibm.com>
In-Reply-To: <1559589055-71202-1-git-send-email-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jun 2019 23:37:17 +0000
Message-ID: <CACPK8XdDBYK4V50efHiqjwR7GAu+WYMsxpeRyOMTgATS05re7g@mail.gmail.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-arm] [PATCH qemu] aspeed: Add support for the swift-bmc
 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Adriana Kobylak <anoo@us.ibm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gwiPGf+OnP7l

On Mon, 3 Jun 2019 at 19:11, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The Swift board is an OpenPOWER system hosting POWER processors.
> Add support for their BMC including the I2C devices as found on HW.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 33070a6..cd95b3c 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -73,6 +73,9 @@ struct AspeedBoardState {
>          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
>          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>
> +/* TODO: Swift hardware value: ? (use romulus definition for now) */
> +#define SWIFT_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1

I got this from hardware: 0xF11AD206

The rest looks okay.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> +
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>
> @@ -287,6 +290,35 @@ static void romulus_bmc_i2c_init(AspeedBoardState *b=
mc)
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
>  }
>
> +static void swift_bmc_i2c_init(AspeedBoardState *bmc)
> +{
> +    AspeedSoCState *soc =3D &bmc->soc;
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
> +
> +    /* The swift board expects a TMP275 but a TMP105 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x48);
> +    /* The swift board expects a pca9551 but a pca9552 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "pca9552"=
, 0x60);
> +
> +    /* The swift board expects an Epson RX8900 RTC but a ds1338 is compa=
tible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "ds1338",=
 0x32);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552"=
, 0x60);
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp423",=
 0x4c);
> +    /* The swift board expects a pca9539 but a pca9552 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "pca9552"=
, 0x74);
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "tmp423"=
, 0x4c);
> +    /* The swift board expects a pca9539 but a pca9552 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "pca9552=
",
> +                     0x74);
> +
> +    /* The swift board expects a TMP275 but a TMP105 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105"=
, 0x48);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105"=
, 0x4a);
> +}
> +
>  static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>  {
>      AspeedSoCState *soc =3D &bmc->soc;
> @@ -378,6 +410,16 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
>          .i2c_init  =3D romulus_bmc_i2c_init,
>          .ram       =3D 512 * MiB,
>      }, {
> +        .name      =3D MACHINE_TYPE_NAME("swift-bmc"),
> +        .desc      =3D "OpenPOWER Swift BMC (ARM1176)",
> +        .soc_name  =3D "ast2500-a1",
> +        .hw_strap1 =3D SWIFT_BMC_HW_STRAP1,
> +        .fmc_model =3D "mx66l1g45g",
> +        .spi_model =3D "mx66l1g45g",
> +        .num_cs    =3D 2,
> +        .i2c_init  =3D swift_bmc_i2c_init,
> +        .ram       =3D 512 * MiB,
> +    }, {
>          .name      =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
>          .desc      =3D "OpenPOWER Witherspoon BMC (ARM1176)",
>          .soc_name  =3D "ast2500-a1",
> --
> 1.8.3.1
>
