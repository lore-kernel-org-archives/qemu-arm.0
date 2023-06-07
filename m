Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp156455ejb;
        Wed, 7 Jun 2023 03:53:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hrlZorX4PQPR46F2guDjks7fW7ilo121mdf5qWijhRfRcvAEeVhCb6DY+EGuqM23HJgdx
X-Received: by 2002:a05:6214:1306:b0:56a:d94d:6deb with SMTP id pn6-20020a056214130600b0056ad94d6debmr2958368qvb.25.1686135188576;
        Wed, 07 Jun 2023 03:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686135188; cv=none;
        d=google.com; s=arc-20160816;
        b=gnr7X/QRI3mIXRiBRtOm9sV6P9B1m24LW+yyGjgpGsgrLRgOhqEwbpR3BPK0kjIunc
         1pbn0Vf1AztenMTUivQi070fLQfrWRRvvEyi9i/87huyjaDoH9kcIdeGaSdM8TmfmbcJ
         6ahKMbDi9rHFsXsreePqnv5MqsXdEE/bglifWv+MXEMr2jiSWXeesCiguyApaEkAFdy6
         fwTbiurC1xtrKnSAAi57ZiDHb7olooB574L5VixMSFH7KGrAup/P4Uxy4LsDeORSbQY/
         r6hMihQp1J2PzEqNrsv1nAeyXucvIx7scWTMO+6V7wwBt2YMcQvI/rlvXexuzZ6Eudu2
         rIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uX6Y6qVyEV5mCjjSupMJaxYP6Mwlvvv2Pw7C18GnHx8=;
        b=UzTisNLZD8n9sXe5jIRhrjjkiq+vcsLA6x/rSrDGry65airS4eerINdAlqkhJ+yIbt
         28VToWUnmOYUImVXAx8fBOd54q0CdaooWw8rjWReiSASJvxLU9Rv2Ho3l+tJH1wHLwZ5
         ggdYCulLsLttGD40orsW/Aq5OvuY5BLwl/6OX1cTqE3rJUtPy35k3sZrCxRRXiGWdJZi
         v6lxrQOZ3masdXs5RklmvZVaIdnjNlom5U2mGb+Fsvj0ELmxHhMHBhOiIpmCFWFbPnw6
         HVCtRLfV0VIPmg6yITvKWZp74OEyrugcV2winDClGynAaU3JyHWYpB4bDrw75IpSZuhj
         W1jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=lRZPJ9ZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo15-20020ad45f0f000000b005ef470c0f01si7735598qvb.374.2023.06.07.03.53.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 03:53:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=lRZPJ9ZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6qmg-0005JY-DH; Wed, 07 Jun 2023 06:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6qme-0005Ic-9G; Wed, 07 Jun 2023 06:52:56 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6qmc-00015F-IH; Wed, 07 Jun 2023 06:52:56 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51456392cbbso944960a12.0; 
 Wed, 07 Jun 2023 03:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686135172; x=1688727172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uX6Y6qVyEV5mCjjSupMJaxYP6Mwlvvv2Pw7C18GnHx8=;
 b=lRZPJ9ZDUtzDqHmOmQwr0zTyTaCyJl65NyqhbY/P31S2E6VriKkcq+Bl8RfhkrxRdA
 uprXQ7BRqh85kkShI8xh2p4vsdtbQuFcGOgiuLD5fSAfuUXFtAgrl7b1qZz5kOaCkBre
 vO3Ivvv5t/8g504auRK4+9+WjqTVDYvKaG6Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686135172; x=1688727172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uX6Y6qVyEV5mCjjSupMJaxYP6Mwlvvv2Pw7C18GnHx8=;
 b=cLraWGhCtEkhNsxImARCtzMkzazBVq/j+ohhZTOvIu6GSgNRqqqJcscVsRP8jbj34L
 97zmFCaBtpwwOMIWeKxgduyE/+YBtabdYLidzLniDdTeMfXFF05sNRN7HNpWw+HqkGVk
 jDqIWKODvhdk1FYN7TjgpZSmoEqZ1F1gj8mXOWy7P7VHzJ6AYki2LxGsF5pjYpBA/3cR
 Rhu6aKhcb2DbsN4w4/nAkhJgXRhOgjC83axiKLMe7Ke8ACKwJbvsTq6XM2o9hC36oJLP
 rJ2NyNApBxGjT+zPMJJUuTgDY8oGXvKiA15n4mlmS7ei2053HjHkFwRvYnJ5fSqIeziR
 g7eA==
X-Gm-Message-State: AC+VfDyh2l7AuReS9C8a2BRgUJWuaD6u5XKLriXWXYnVGufW9zvfiXXa
 NPVVR3OwVXDuje9ZTqbswb4qXFaVaXVWrxYhq7Q=
X-Received: by 2002:a17:907:961a:b0:968:892b:1902 with SMTP id
 gb26-20020a170907961a00b00968892b1902mr13182281ejc.6.1686135172280; Wed, 07
 Jun 2023 03:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-8-clg@kaod.org>
In-Reply-To: <20230607043943.1837186-8-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2023 10:52:39 +0000
Message-ID: <CACPK8Xczhgv6RsjCVahFV0vovhHEudvGjYbVNxyF4V1nbR0e1w@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] hw/ssi: Check for duplicate addresses
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uASeGTW/0LKI

On Wed, 7 Jun 2023 at 04:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This to avoid address conflicts on the same SSI bus. Adapt machines
> using multiple devices on the same bus to avoid breakage.
>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

One small suggestion below that we could do as a follow up.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/stellaris.c                  |  4 +++-
>  hw/arm/xilinx_zynq.c                |  1 +
>  hw/arm/xlnx-versal-virt.c           |  1 +
>  hw/arm/xlnx-zcu102.c                |  2 ++
>  hw/microblaze/petalogix_ml605_mmu.c |  1 +
>  hw/ssi/ssi.c                        | 21 +++++++++++++++++++++
>  6 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index f7e99baf6236..6744571d55f4 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1242,7 +1242,9 @@ static void stellaris_init(MachineState *ms, stella=
ris_board_info *board)
>                                     qdev_get_child_bus(sddev, "sd-bus"),
>                                     &error_fatal);
>
> -            ssddev =3D ssi_create_peripheral(bus, "ssd0323");

Should we update ssi_create_peripheral to make the chip select explicit?

> +            ssddev =3D qdev_new("ssd0323");
> +            qdev_prop_set_uint8(ssddev, "addr", 1);
> +            qdev_realize_and_unref(ssddev, bus, &error_fatal);
>
>              gpio_d_splitter =3D qdev_new(TYPE_SPLIT_IRQ);
>              qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 3190cc0b8dbc..28e9df684213 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -164,6 +164,7 @@ static inline int zynq_init_spi_flashes(uint32_t base=
_addr, qemu_irq irq,
>                                          blk_by_legacy_dinfo(dinfo),
>                                          &error_fatal);
>              }
> +            qdev_prop_set_uint8(flash_dev, "addr", j);
>              qdev_realize_and_unref(flash_dev, BUS(spi), &error_fatal);
>
>              cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0=
);
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 668a9d65a437..c90345375090 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -701,6 +701,7 @@ static void versal_virt_init(MachineState *machine)
>              qdev_prop_set_drive_err(flash_dev, "drive",
>                                      blk_by_legacy_dinfo(dinfo), &error_f=
atal);
>          }
> +        qdev_prop_set_uint8(flash_dev, "addr", i);
>          qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
>
>          cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 4c84bb932aa0..6224b8fc1110 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -201,6 +201,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>              qdev_prop_set_drive_err(flash_dev, "drive",
>                                      blk_by_legacy_dinfo(dinfo), &error_f=
atal);
>          }
> +        qdev_prop_set_uint8(flash_dev, "addr", i);
>          qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
>
>          cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
> @@ -224,6 +225,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>              qdev_prop_set_drive_err(flash_dev, "drive",
>                                      blk_by_legacy_dinfo(dinfo), &error_f=
atal);
>          }
> +        qdev_prop_set_uint8(flash_dev, "addr", i);
>          qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
>
>          cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogi=
x_ml605_mmu.c
> index a24fadddcac0..4c5e4510c333 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -192,6 +192,7 @@ petalogix_ml605_init(MachineState *machine)
>                                          blk_by_legacy_dinfo(dinfo),
>                                          &error_fatal);
>              }
> +            qdev_prop_set_uint8(dev, "addr", i);
>              qdev_realize_and_unref(dev, BUS(spi), &error_fatal);
>
>              cs_line =3D qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
> index 7c71fce0db90..aa0bfa57bb26 100644
> --- a/hw/ssi/ssi.c
> +++ b/hw/ssi/ssi.c
> @@ -42,10 +42,31 @@ DeviceState *ssi_get_cs(SSIBus *bus, uint8_t addr)
>      return NULL;
>  }
>
> +static bool ssi_bus_check_address(BusState *b, DeviceState *dev, Error *=
*errp)
> +{
> +    SSIPeripheral *s =3D SSI_PERIPHERAL(dev);
> +
> +    if (ssi_get_cs(SSI_BUS(b), s->addr)) {
> +        error_setg(errp, "addr '0x%x' in use by a %s device", s->addr,
> +                   object_get_typename(OBJECT(dev)));
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void ssi_bus_class_init(ObjectClass *klass, void *data)
> +{
> +    BusClass *k =3D BUS_CLASS(klass);
> +
> +    k->check_address =3D ssi_bus_check_address;
> +}
> +
>  static const TypeInfo ssi_bus_info =3D {
>      .name =3D TYPE_SSI_BUS,
>      .parent =3D TYPE_BUS,
>      .instance_size =3D sizeof(SSIBus),
> +    .class_init =3D ssi_bus_class_init,
>  };
>
>  static void ssi_cs_default(void *opaque, int n, int level)
> --
> 2.40.1
>
