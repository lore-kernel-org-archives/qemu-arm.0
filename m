Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1740209lfb;
        Mon, 6 Jun 2022 17:04:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ1Rz0Oy0YupK73kWD8u4Q/rDr5aNguAWtYnmjzzM58N6y8liVAGK1u2n5E2DSH/BSWh/W
X-Received: by 2002:a05:622a:590:b0:2f9:4396:aed3 with SMTP id c16-20020a05622a059000b002f94396aed3mr20554309qtb.353.1654560274974;
        Mon, 06 Jun 2022 17:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654560274; cv=none;
        d=google.com; s=arc-20160816;
        b=TMNzJQE6vFLn4aMG0K++Abv3A0Lhh64ncXHyd8wPezigk/ueZ8p7IcdX5S6drGIdPE
         cUsfeRAgqfnO5BvwHi+84jTNmvHrk9cug7qLMkwbTVAosYPrMQ6smJbHNB/h2TSDZtel
         Waw3U9k4ohpAWxUi0BrUOmjp8f5EpNHK8XVId4kLoD8OoKcU72GjlZOO3MzxrrrbrBKD
         cbNl/QtpS8FeD3Ua18WXyCtheTHh9ZgHFAxSi4Aw2YdRfy9R7QwJccyTUME2iccRFblc
         pX9t/ifZjhFd5olrnbTP5oTv/HTmMw6NMGVYniuNReNtf8qWRb6BEzHK9uQPvF60+ZG6
         +LFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BA8qyB9Wu/p0KgiU8jkA0ew7Df9DijdAvxcaN+ih1J8=;
        b=G7zh0Dvhjo/qDFGplppvQPWlD6+pIdRpRFCIkn9YmNrtZTKs8O4VOwfi/GSuK5cYdw
         TL0V+Taibt7A3Vh3/7SdeKZvyE5xL3B+WE+VQOachKaWQLh37DQRoeZqebPYPxDpNKl6
         LGqqq0W5SI7uaC9eI2tYG+FchzNjhX2gkhkbLs2vFO0qMsSCWs0d5YMSPndi+zQB8pHP
         qybvkoVgZEJcXaqT6EyV06dNt7ZhE8/yVOhnCz818O9ZjWkpDvkHr3gjHon5ygA4c5sT
         USzkzFmhe1eBmLAyVWbFljYwsh32iyQ9ogySH7rWRBecgQxOlobvTg/7nwo6MWMoFt/I
         ywbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=B0ixm1Ku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf12-20020a0562142a4c00b00461d0e69841si9301737qvb.399.2022.06.06.17.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 17:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=B0ixm1Ku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyMi1-00087o-AI
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 20:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyLzT-0000Ne-AD; Mon, 06 Jun 2022 19:18:31 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyLzR-0004N7-JL; Mon, 06 Jun 2022 19:18:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id u3so21773596wrg.3;
 Mon, 06 Jun 2022 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BA8qyB9Wu/p0KgiU8jkA0ew7Df9DijdAvxcaN+ih1J8=;
 b=B0ixm1Ku6myYzFCF5ZrTeGJsKzIKvLzrr9IDFtlMCpWsp5S1XnW5Turb2JCtXmvMlM
 Rf+DM5f/cZ1RhH4sK9jri7kfaqoDIorE4B8ZYPxaCkAqbGfFsKEw4uiKcB+Fnxh5SpnQ
 nW2FfAkfDMYZ9iAusivyDXKa78hcg1eb5vugU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BA8qyB9Wu/p0KgiU8jkA0ew7Df9DijdAvxcaN+ih1J8=;
 b=H8SVsvwfDh1yECnnujHBHMNlcylQnITZryte5DKo9DW5piSkg9OabpLTCPwy3Y/LOP
 Kvw3eXeX9USn/YYrm5ipR5MObnGwX58RCFevfitcVUvGXjaU6i5G7T0T+fjPQjzp+JMj
 C3/TebzVuwqobFBW/su4/cgjjdl+AEH7jhoWUY3QRgW+mfEZCvIE9MVW1Kz/ha4Gb4TD
 K+Oiqg956O2hNWPTpbI+ICpmwcsS3g40PaZdxts1Ty9pD4QFCTb7rdfb90qgEewFsS7t
 4v9VIaZq47UKe9sS26C6qA3RuOcI45/BLZxO9qqCQrdMRfy4CVLjKf2WcHTcHO+YwF3R
 m+ZQ==
X-Gm-Message-State: AOAM533R/mVXFqs61W03goNs5I+RXpbSzKmIf8Vs1lhuW/ouXxpaPIN+
 ySVSRHZ8zvr5/ATS6/Pab5koyHdVvq2axr1PdUc=
X-Received: by 2002:a5d:428f:0:b0:210:30cd:3753 with SMTP id
 k15-20020a5d428f000000b0021030cd3753mr24228904wrq.549.1654557507017; Mon, 06
 Jun 2022 16:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-14-clg@kaod.org>
In-Reply-To: <20220606150732.2282041-14-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jun 2022 23:18:14 +0000
Message-ID: <CACPK8XeqgDE+oNSJS8PHQW8hxx25atYW6ww1_0d-nsJuc1vQBg@mail.gmail.com>
Subject: Re: [PATCH 13/21] aspeed: Add I2C buses to AST1030 model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>, 
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nbliWV/0zXQv

On Mon, 6 Jun 2022 at 15:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Troy Lee <troy_lee@aspeedtech.com>
>
> Instantiate the I2C buses in AST1030 model and create two slave device
> for ast1030-evb.
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> [ clg : - adapted to current ast1030 upstream models
>         - fixed typo in commit log ]
> Message-Id: <20220324100439.478317-3-troy_lee@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

one question about a comment below.

> ---
>  hw/arm/aspeed.c         | 13 +++++++++++++
>  hw/arm/aspeed_ast10x0.c | 18 ++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 98dc185acd9a..5c3802308e80 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1401,6 +1401,18 @@ static void aspeed_minibmc_machine_init(MachineSta=
te *machine)
>                         AST1030_INTERNAL_FLASH_SIZE);
>  }
>
> +static void ast1030_evb_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc =3D &bmc->soc;
> +
> +    /* U10 24C08 connects to SDA/SCL Groupt 1 by default */
> +    uint8_t *eeprom_buf =3D g_malloc0(32 * 1024);
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50, eeprom=
_buf);
> +
> +    /* U11 LM75 connects to SDA/SCL Group 2 by default */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", =
0x4d);
> +}
> +
>  static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *o=
c,
>                                                            void *data)
>  {
> @@ -1412,6 +1424,7 @@ static void aspeed_minibmc_machine_ast1030_evb_clas=
s_init(ObjectClass *oc,
>      amc->hw_strap1 =3D 0;
>      amc->hw_strap2 =3D 0;
>      mc->init =3D aspeed_minibmc_machine_init;
> +    amc->i2c_init =3D ast1030_evb_i2c_init;
>      mc->default_ram_size =3D 0;
>      mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D 1;
>      amc->fmc_model =3D "sst25vf032b";
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index d53454168403..a2ed275712fb 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -114,6 +114,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
>      object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu), "hw-str=
ap1");
>      object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu), "hw-str=
ap2");
>
> +    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
> +    object_initialize_child(obj, "i2c", &s->i2c, typename);
> +
>      snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
>      object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
>
> @@ -188,6 +191,21 @@ static void aspeed_soc_ast1030_realize(DeviceState *=
dev_soc, Error **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SC=
U]);
>
> +    /* I2C */
> +
> +    object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(&s->sram),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2=
C]);
> +    for (i =3D 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
> +        qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->armv7m),
> +                                        sc->irqmap[ASPEED_DEV_I2C] + i);
> +        /* The AST2600 I2C controller has one IRQ per bus. */

I know it's the same hardware, but is the "AST2600" part of the comment cor=
rect?

> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
> +    }
> +
>      /* LPC */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
>          return;
> --
> 2.35.3
>
