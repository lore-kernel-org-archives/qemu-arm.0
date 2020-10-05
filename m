Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp150310lfq;
        Mon, 5 Oct 2020 15:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMrOoiAqcdvTjE8GVucZX0aDCWTJGAoMf5rJzMdEewO90EBsvDJcxhybMG5Shs2o/k9wV8
X-Received: by 2002:a25:b29a:: with SMTP id k26mr3033109ybj.450.1601938600856;
        Mon, 05 Oct 2020 15:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601938600; cv=none;
        d=google.com; s=arc-20160816;
        b=N04bzC2BOn5T4iZsMKs43FoLMeY07Cog5T5ltaf5RrD9IFxwwDk9Gk16Yn5guYLCA5
         xRhPSddZqfLiQDEfz2zPFnkstgIidtuWT30L78ZwG6r7lOCUvXE1Duzni90Ms7kSectN
         02kdXvvmSkyvxRkWMJZsFke7HcAVkJzhAUBuM6+RHnfBbP1ACjt1W/PPROD60Nw6cihM
         OQpoa1+4lNTFqhmTzgka/F7hc+yCa6LPHuvjWKdGs87LVMIXPaz7C24Dl5RB3xo97+w7
         VaQXS6CP2onME3qhsHy4Q8Hw1eZKB5cCb/1KzTJnHKSiEJr64/ryp37yy+4DsSbeMhJa
         193A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gPKf2w9mX4wYAK4imtSS4zpT61Op7JZnKhqQzehCEVM=;
        b=GJRf093SxohCI43dG2Nxgx9EP0a+uQM/zapLS7DVfItEDF5xELtnzjx8XdyMo7JEu1
         32Dx63vrsqFgnagG87ut4YM2eXILEn9gv1ubBxz++8wriErzBuLbhxHFgLiJ7gdy9UNj
         Ui3jk1tl9PRpckx1P4DDtvA8qzDFBgEs0LcgOXX741sEV8WAWqX/fbK96OBjP1KYU54i
         lYGFK761KTGuIIAMICdBADcrcZo0GP+XgN/J2RVwpi3twKVi9sP9Oq6BxhP4MHhjRk57
         1xoPqATR0xiHeZ591W5ypEYBMAZ7WmnzfMCKQDhWcTFxThnzKGxbvVeMBGs3Kmi2PBJ0
         iynA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=h9s98Ogb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si1289206ybq.201.2020.10.05.15.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 15:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=h9s98Ogb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kPZPM-0007kS-1X
	for alex.bennee@linaro.org; Mon, 05 Oct 2020 18:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1kPZOj-0007k0-An; Mon, 05 Oct 2020 18:56:01 -0400
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1kPZOh-0002md-9p; Mon, 05 Oct 2020 18:56:01 -0400
Received: by mail-qv1-xf42.google.com with SMTP id cy2so6990929qvb.0;
 Mon, 05 Oct 2020 15:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gPKf2w9mX4wYAK4imtSS4zpT61Op7JZnKhqQzehCEVM=;
 b=h9s98OgbpV+4KhUR5qQMSsvBs7Dc+A1VSABFVLr9p3w77LoDE0MDK58TVGy6fqkRSE
 rvznW1OL1zuShPpeisGoKyOtdY9oUlxPGGh3zfoBW5iw/SXXYc39imBh68GF/HTObjnS
 v+yZLWDFcAwjNIhGOTZ5mSamRRcH/CSSkNjWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gPKf2w9mX4wYAK4imtSS4zpT61Op7JZnKhqQzehCEVM=;
 b=JLjPSA+FGjJ6qpUnSNN1gBqGeiVoaK6rDBXAYVbT6y6rwVziTjktdw0SrA3AiB8IF3
 BYRN9PuMmvAgX9MZBhoENmFuaVZZy1P4V5AUA6Sr20qWEdIFE/lOg5rgpATeEvLtWjlR
 Ln40y4Q319xRn6+zhKwDI/88jQ1DOR1kmWFRk4BDghpihbEPLL9cXpch+S0KeFE49abe
 Z3NbW4JGt2tL4XUuh4XIY7BwRgQUvUT9kQgl1FwhFGX2d9dFmaNVIhbS90C9ll7gsLyz
 UYlrHCfI4C8Jttw1ADrn8Q8d1MTO9tL0VaNrTcLzi3ZnwJmYw0HxKFYWzxii45q4QvDP
 dRaA==
X-Gm-Message-State: AOAM533uZ5xwmRCYNlPdC9r1xfgQUtaQz549jyBJXAAzmOFdpNW4O5mq
 bq/1VZC1Fra9xI5XR+05GBX0dt6ZQbfSDIaj27A=
X-Received: by 2002:a0c:f984:: with SMTP id t4mr2029982qvn.18.1601938557454;
 Mon, 05 Oct 2020 15:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200929055309.509-1-wangzhiqiang.bj@bytedance.com>
 <20200929055309.509-2-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20200929055309.509-2-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Oct 2020 22:55:45 +0000
Message-ID: <CACPK8Xf-R=1UrEVxF92Y4HGXadWfdvHjmjyDnH5K3GSJTkq7YA@mail.gmail.com>
Subject: Re: [PATCH 2/2] aspeed: Add support for the g220a-bmc board
To: John Wang <wangzhiqiang.bj@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f42;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, clkg@kaod.org,
 xuxiaohan@bytedance.com, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DXBZFHTCpWW5

On Tue, 29 Sep 2020 at 05:53, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> G220A is a 2 socket x86 motherboard supported by OpenBMC.
> Strapping configuration was obtained from hardware.
>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index bdb981d2f8..04c8ad2bcd 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -120,6 +120,20 @@ struct AspeedMachineState {
>          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
>          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>
> +#define G220A_BMC_HW_STRAP1 (                                      \
> +        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
> +        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
> +        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
> +        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
> +        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
> +        SCU_HW_STRAP_2ND_BOOT_WDT |                                     \
> +        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
> +        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                \
> +        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
> +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM) |                       \
> +        SCU_AST2500_HW_STRAP_RESERVED1)
> +
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>
> @@ -559,6 +573,30 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>      /* Bus 11: TODO ucd90160@64 */
>  }
>
> +static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    DeviceState *dev;
> +
> +    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3),
> +                                         "emc1413", 0x4c));
> +    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
> +    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
> +    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
> +
> +    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12),
> +                                         "emc1413", 0x4c));
> +    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
> +    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
> +    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
> +
> +    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
> +                                         "emc1413", 0x4c));
> +    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
> +    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
> +    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
> +}
> +
>  static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>  {
>      return ASPEED_MACHINE(obj)->mmio_exec;
> @@ -798,6 +836,24 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>
> +static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Bytedance G220A BMC (ARM1176)";
> +    amc->soc_name  = "ast2500-a1";
> +    amc->hw_strap1 = G220A_BMC_HW_STRAP1;
> +    amc->fmc_model = "n25q512a";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 2;
> +    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON;
> +    amc->i2c_init  = g220a_bmc_i2c_init;
> +    mc->default_ram_size = 1024 * MiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>  static const TypeInfo aspeed_machine_types[] = {
>      {
>          .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -835,6 +891,10 @@ static const TypeInfo aspeed_machine_types[] = {
>          .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_tacoma_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("g220a-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_g220a_class_init,
>      }, {
>          .name          = TYPE_ASPEED_MACHINE,
>          .parent        = TYPE_MACHINE,
> --
> 2.25.1
>
