Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp527321wrm;
        Wed, 16 Oct 2019 23:34:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJT1cU2AkaG4ncDyzMOh90mX4DxI/txyydLp5kW2gYuLDbCXPE/EE4big+4U0lwYeCt537
X-Received: by 2002:a50:f152:: with SMTP id z18mr1990073edl.263.1571294089045;
        Wed, 16 Oct 2019 23:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571294089; cv=none;
        d=google.com; s=arc-20160816;
        b=FQMoW+U2/dbAqe9L/vAPIZytqEGrRNtlbrDCNA4Sa2emPfRjVHar+m9X8+Pa+8whVU
         sg3DRSAQA4yC4d+dYKCpZvZAajgiix7UdUPsy0q4yMdPHhm/0dHk2EIpQ/Jy6LQ14+/p
         EN/qXgEn5QCtDrNCeSQkBdtxE1EaQR//9jncBIV7DuQSps5zBwRQjltDtEzqY7+H8IXE
         TLhm7F3ErxRjSDOOl4bCEr9UDkK5OY45ezpd1r/Q3tnQ4upkBchc5fQ0Pn6kPfOTXPQI
         aLZntqPuprmE64V5a9Z3LFeFVI/yq3laiIzmGdejmbl/A1KOfjltj5B6228clV9OB+CC
         /uAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=liYEOxYNZbGAJroK2AsMxBWZpouKVq7N+VunlUN+J9k=;
        b=b6IFjXiEiRKsvpH040/+spyE3ZO887SdZe2126qV9spI0HXMqmqHP/7nHxf8VWSP9E
         PPD1UDleOPF5XT9GlKHDNnAYEDgwgew9tfoi4Fmran059O3MCILBlIxOYawFLIDWzqUq
         SfSF0VE7nT5Shpdcls1Qx5cOD3qoWE19ZLzTEFY3VBCwHF7CrS9FWbD5ySHi0aBZSGtr
         BFIoCkHnfgWWf5GLsjP14hD/Gny2Kx6i0ro2O4jb/pEsMrFk4b8gYXYPX3LCRtiAydkJ
         V6P8WTn6oLfUuMMacPFry1W8LdMo7SisLoovBpm3j6H+WOoGsqXJ6XdJRl7ABvXVjcbR
         Zn8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=Jy+lkGxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si843378eje.50.2019.10.16.23.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 23:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=Jy+lkGxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKzN1-00038w-WF
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 02:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iKzLz-00036j-Kf
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 02:33:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iKzLy-0006RM-DP
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 02:33:43 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:36531)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iKzLx-0006QI-Q3; Thu, 17 Oct 2019 02:33:42 -0400
Received: by mail-qk1-x743.google.com with SMTP id y189so886760qkc.3;
 Wed, 16 Oct 2019 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=liYEOxYNZbGAJroK2AsMxBWZpouKVq7N+VunlUN+J9k=;
 b=Jy+lkGxuNzyQS5aPmMqdNWInJeLZPl26ozmTl/EMaQ7sReehhYRFoHQjdv+SxsMyt1
 mRcFBLcwTuwO8vEu/JsxELDNHueRa6YRzi90hjpUQ33zlFt5P8SnPl7EdEcxR4kR1OuH
 noGcbbB+VX8FViAnrO53Vgudta8l9MySuv+m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=liYEOxYNZbGAJroK2AsMxBWZpouKVq7N+VunlUN+J9k=;
 b=nJ9jEaaK1CJo9JsRYGnpYFy5Ni3gzCF5LeVHeStLNQKTyAOVfg4LCDtuFuwiOHy51r
 e9TtUq160URup93VCn2vo2Nih9lDAVrEY0q/H6P7yXMC90fmuYwoQtkKZGI5UsTzYEo6
 AePCEMfaMnzvS2saKZQOCcu5exdlzdggMBcPFpfdLRihumih1EjMn4X74PDmvbaZ/jK1
 1texpv73aNZpIAvovCKhpcHEOBMyBnU0BHwhnaKDh3ZbOTGbKHgbcja6vPgQ7tjtw0zK
 Qyn7SXtxTU4rUPlIf/7Rxmr65iEejsXSiK/IXO98H3et/kq2+xeGXz8Qw5v+9zOrJO4m
 GcyA==
X-Gm-Message-State: APjAAAUjWjZmNwOChTRJiEanO8Lxn64zRwVUGUiEAGwWcMbKxWGaAopU
 t9Je4zxtMNfBl36JUzRFEe0s/kEWU3OcUcRaHys=
X-Received: by 2002:a37:4dca:: with SMTP id a193mr1822231qkb.292.1571294020365; 
 Wed, 16 Oct 2019 23:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191016090745.15334-1-clg@kaod.org>
In-Reply-To: <20191016090745.15334-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Oct 2019 06:33:28 +0000
Message-ID: <CACPK8XdT0_JCxzfxd4dCafK0Ae9+18ZWcusuXV+d4eEmwwBnkA@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Add an AST2600 eval board
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TOMnveNPeNkd

On Wed, 16 Oct 2019 at 09:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Define the board with 1 GiB of RAM but some boards can have up to 2
> GiB.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>
>  Changes since AST2600 patchset:
>
>  - lowered the RAM size to 1 GiB as it was breaking the tests on some
>    hosts.

Peter,

After chatting with C=C3=A9dric I agree we should merge this patch.

As it turns out the EVBs have differing amounts of RAM; his has 1GB
while mine has 2GB. So we are not being inaccurate by setting 1GB as
the default here.

Cheers,

Joel

>
>  include/hw/arm/aspeed.h |  1 +
>  hw/arm/aspeed.c         | 23 +++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index 02073a6b4d61..f49bc7081e4d 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -18,6 +18,7 @@ typedef struct AspeedBoardConfig {
>      const char *desc;
>      const char *soc_name;
>      uint32_t hw_strap1;
> +    uint32_t hw_strap2;
>      const char *fmc_model;
>      const char *spi_model;
>      uint32_t num_cs;
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 52993f84b461..028191ff36fc 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -88,6 +88,10 @@ struct AspeedBoardState {
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>
> +/* AST2600 evb hardware value */
> +#define AST2600_EVB_HW_STRAP1 0x000000C0
> +#define AST2600_EVB_HW_STRAP2 0x00000003
> +
>  /*
>   * The max ram region is for firmwares that scan the address space
>   * with load/store to guess how much RAM the SoC has.
> @@ -187,6 +191,8 @@ static void aspeed_board_init(MachineState *machine,
>                               &error_abort);
>      object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1, "hw-strap=
1",
>                              &error_abort);
> +    object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap2, "hw-strap=
2",
> +                            &error_abort);
>      object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
>                              &error_abort);
>      object_property_set_int(OBJECT(&bmc->soc), machine->smp.cpus, "num-c=
pus",
> @@ -308,6 +314,12 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
mc)
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
>  }
>
> +static void ast2600_evb_i2c_init(AspeedBoardState *bmc)
> +{
> +    /* Start with some devices on our I2C busses */
> +    ast2500_evb_i2c_init(bmc);
> +}
> +
>  static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
>  {
>      AspeedSoCState *soc =3D &bmc->soc;
> @@ -455,6 +467,17 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
>          .num_cs    =3D 2,
>          .i2c_init  =3D witherspoon_bmc_i2c_init,
>          .ram       =3D 512 * MiB,
> +    }, {
> +        .name      =3D MACHINE_TYPE_NAME("ast2600-evb"),
> +        .desc      =3D "Aspeed AST2600 EVB (Cortex A7)",
> +        .soc_name  =3D "ast2600-a0",
> +        .hw_strap1 =3D AST2600_EVB_HW_STRAP1,
> +        .hw_strap2 =3D AST2600_EVB_HW_STRAP2,
> +        .fmc_model =3D "w25q512jv",
> +        .spi_model =3D "mx66u51235f",
> +        .num_cs    =3D 1,
> +        .i2c_init  =3D ast2600_evb_i2c_init,
> +        .ram       =3D 1 * GiB,
>      },
>  };
>
> --
> 2.21.0
>
