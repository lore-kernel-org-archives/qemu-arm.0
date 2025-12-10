Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0883FD3E780
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 23:02:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTTBo-0006oR-9v; Wed, 10 Dec 2025 18:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vTTBl-0006ei-Ls
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 18:01:41 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vTTBj-0006e0-IH
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 18:01:41 -0500
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4ee147baf7bso87041cf.1
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 15:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765407698; cv=none;
 d=google.com; s=arc-20240605;
 b=hlE0cO5B0I0MFdW0JX8xm4BZO8EEvC3Q+toQzMs/pyGZqoe5eSrtwQEI+Bq8fUimVx
 EMSCUqd8mzAOqurakoF8QmHnKtPl6nkZQlO2cFZhWDw4ycmIbhvJ7exkQfNej9wq7vMQ
 LZ7+lQ/uEQnVLno/h8RExZ0kue82TJiBCNYMnuflWGhd5uKwWIDUZfH2H5OaixcXpw55
 LogLyjMIml6bn57dhJgw5J0a09eFL8Q6mT7t2bmkQadbV/zE/9iiBCumEbWKxH+7/J/4
 ibAhYe+aHZQj5Lr3emunrTKhFLWIyu0v1QSp91IGqdFkPDUtHROrDfeASGW9RaqvllFk
 MFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iWPg/v0L4IQLXZBLH3FMvO+yqWCnPAWLyl+BgWkHjHQ=;
 fh=QOcX2bcP8EgpR5dxlcUPsGb4PHE8jO9ENfwhR+Vm38Y=;
 b=FPIwbAonwYpm35QnbkBWyHtlDC8il85tkTccP3MeA/chSSPTN+8OmVayDxNpdnoI6G
 LNDMCQ5rdXaK9fzATmUBsBokm6MLzaeEPcAS89Yuc2m1joCCgmVeswmdEGmK7VrcI8am
 06+jObhYgZGNkCj+bvosHnjZIqZb+pLmWg64SP798qdPymjRaoyHtM6lCAv6RvoSRZ0M
 YZG00pO/ZTLkOMFp5hJAiE9q29SfBRw/EIFwQWjnN91BX58R3XDIRBcashuHrFaQmc/Y
 CQNBw2m0wZSjQXXBuX71QCdiVUjtNm7GqukQtyMe4z/bVZxxjQcum301d7ERjE/j5ELA
 DkEg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765407698; x=1766012498; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWPg/v0L4IQLXZBLH3FMvO+yqWCnPAWLyl+BgWkHjHQ=;
 b=o7afAXDEcx4oqsTZ+ilx2U+2SoJ7Zg7T3VqAWoi3jlVaLIk2Cp34kM3tO1UiHFLZRm
 wLM6ax/cwuapVmvS00uqo/1a2RLFLqP/NE2DDC3aWWJizHNISYpo6uVDyfxp+rEk9tRs
 XqJEAiB7KBB/B1wDFb8eKxvgEJUOKrNSRknS1Jj9Ej/2tZOK5UxAWU9KzXT7lOb+xqt7
 rQsSYwhHGWaG4stwMv7yXwWc05OyZ1BCYe7lJCVq8zoNNT6E90keA9X+g+9eyI8udpBP
 yw7PlWgNNmot+101glCNLpZgPbE9LIaxSpfPm6VhhE80ErzUQDAQ5HUcNox7QSFIIj9E
 ik2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765407698; x=1766012498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iWPg/v0L4IQLXZBLH3FMvO+yqWCnPAWLyl+BgWkHjHQ=;
 b=Yhq2u7XI18/S4V7FmGYD4GseIBS1NAaiMVNNBFuvB0WV3vj5N0t4W8KHZfEs2Z5/eT
 KWGs7F92UHpFArj95C03pczZW27TWdXehhSWgVMB1MbBcBzWru4QtrF52x5l3e2ddpQv
 FgXBRzhoAZbsuQ6yPRuBI0IZ9EDfXU7PIif4RiQbnLFLIN0n/hmG9s3rkY/qN1d9RMTk
 Z1G/ecTsshiV9KdcKi54M6GM/ayXSUZicLH9Yydv+5jho8cQDAU1tP8JDcHJBVMr5m7/
 p65GuZLe5O6OlyvDqZptYmvLWafQRn6cskrrpK6nAXUZf+HrvuzNCE2YpxAbZG53/nnA
 Jg+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbpfsNsK+QA9Gr4B5NnGi98BwciHZ0seLmB0um1ovAYhXHRw5gcXfmSF2wmu5N3eL7l8I8rtv1Ng==@nongnu.org
X-Gm-Message-State: AOJu0YzybomcHWJhDZL17YoiK1uQsp3Dl6X56dZcKZJIeRabqGIoPeBp
 aAiD1Ww4MdWC/l+Ql3C6msvL+ZYmKuxMtVx4XdHLs2mblE5oUqdSkCi4MDmVQIkrle9CDebAOmq
 jwPlrQfGEyD+bulIimgbhZ3mDx6Z1P1+ddvpZE/hr
X-Gm-Gg: ASbGncsqH7ES1H0+oLyeQKi4FHRi9XGd0GvEdv/danCasFbE0MFJrhCrzBvGR3JScVI
 Q0URZBd3byJNUK0AWgQzsAmWFYWco2qAeDCr5TO1gAjX4PaqD+eu6hxnu+9WhxgDKUpuUJKKAD1
 1mouXY84RCLgp+/xgDf/IWoQfNbKlReWe9iiiIXjDLGM2XuY4z0k8I0y9FYVZ/gGDQQ+VzvA3Jo
 BVpLuXd1GU4VKSRQlI4xNYmS4eR8uB2r5C27hEjEdXCgQjPcgIt2JAqY0dl9F0Nxgfxs43FBNm4
 df6VZb9F3nJ/hDrjDvyc1S9Ux+NZ
X-Google-Smtp-Source: AGHT+IHVe34JnEt7j7l1hUiB4pWQjpJs0EXd8vLBcuow7RRkcPtTXMfHbY5A2KcY7FlPoBiYr4Y6BkIaQUesatLQ2+s=
X-Received: by 2002:a05:622a:2a18:b0:4f1:bee9:f24a with SMTP id
 d75a77b69052e-4f1bee9f407mr1527671cf.0.1765407698329; Wed, 10 Dec 2025
 15:01:38 -0800 (PST)
MIME-Version: 1.0
References: <20251208074436.1871180-1-kane_chen@aspeedtech.com>
 <20251208074436.1871180-15-kane_chen@aspeedtech.com>
In-Reply-To: <20251208074436.1871180-15-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 10 Dec 2025 15:01:26 -0800
X-Gm-Features: AQt7F2rUSVXlMkUrJFUHdhWvpy1coQt7C5BWIJ44ZaY0j0e2IaomogpNlTyjodA
Message-ID: <CA+QoejVZ8-YBwXvpW_9NtLEr+kw-PpP7YnK9YMU1aU+opNCNKA@mail.gmail.com>
Subject: Re: [PATCH v3 14/18] hw/arm/aspeed: attach I2C device to AST1700 model
To: Kane Chen <kane_chen@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, Dec 7, 2025 at 11:49=E2=80=AFPM Kane Chen via <qemu-devel@nongnu.or=
g> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Connect the I2C controller to the AST1700 model by mapping its MMIO
> region and wiring its interrupt line.
>
> This patch also adds a bus_label property to distinguish I2C buses on
> the BMC from those on external boards. This prevents user-specified
> I2C devices from being attached to the wrong bus when provided via CLI.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> ---
>  include/hw/arm/aspeed_ast1700.h |  2 ++
>  include/hw/arm/aspeed_soc.h     |  2 ++
>  include/hw/i2c/aspeed_i2c.h     |  1 +
>  hw/arm/aspeed_ast1700.c         | 18 ++++++++++++
>  hw/arm/aspeed_ast27x0.c         | 49 ++++++++++++++++++++++++++++++---
>  hw/i2c/aspeed_i2c.c             | 19 +++++++++++--
>  6 files changed, 85 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index 7ea6ff4c1a..d4b7abee7d 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -12,6 +12,7 @@
>  #include "hw/misc/aspeed_scu.h"
>  #include "hw/adc/aspeed_adc.h"
>  #include "hw/gpio/aspeed_gpio.h"
> +#include "hw/i2c/aspeed_i2c.h"
>  #include "hw/misc/aspeed_ltpi.h"
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/char/serial-mm.h"
> @@ -34,6 +35,7 @@ struct AspeedAST1700SoCState {
>      AspeedADCState adc;
>      AspeedSCUState scu;
>      AspeedGPIOState gpio;
> +    AspeedI2CState i2c;
>  };
>
>  #endif /* ASPEED_AST1700_H */
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index cebd8c21c8..602ce3924d 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -290,6 +290,8 @@ enum {
>      ASPEED_DEV_LTPI_CTRL2,
>      ASPEED_DEV_LTPI_IO0,
>      ASPEED_DEV_LTPI_IO1,
> +    ASPEED_DEV_IOEXP0_I2C,
> +    ASPEED_DEV_IOEXP1_I2C,
>      ASPEED_DEV_IOEXP0_INTCIO,
>      ASPEED_DEV_IOEXP1_INTCIO,
>  };
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 2daacc10ce..babbad5ed9 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -269,6 +269,7 @@ struct AspeedI2CState {
>      uint32_t intr_status;
>      uint32_t ctrl_global;
>      uint32_t new_clk_divider;
> +    char *bus_label;
>      MemoryRegion pool_iomem;
>      uint8_t share_pool[ASPEED_I2C_SHARE_POOL_SIZE];
>
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index 1cb3cc4f7c..bd677727f5 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -22,6 +22,7 @@ enum {
>      ASPEED_AST1700_DEV_ADC,
>      ASPEED_AST1700_DEV_SCU,
>      ASPEED_AST1700_DEV_GPIO,
> +    ASPEED_AST1700_DEV_I2C,
>      ASPEED_AST1700_DEV_UART12,
>      ASPEED_AST1700_DEV_LTPI_CTRL,
>      ASPEED_AST1700_DEV_SPI0_MEM,
> @@ -33,6 +34,7 @@ static const hwaddr aspeed_ast1700_io_memmap[] =3D {
>      [ASPEED_AST1700_DEV_ADC]       =3D  0x00C00000,
>      [ASPEED_AST1700_DEV_SCU]       =3D  0x00C02000,
>      [ASPEED_AST1700_DEV_GPIO]      =3D  0x00C0B000,
> +    [ASPEED_AST1700_DEV_I2C]       =3D  0x00C0F000,
>      [ASPEED_AST1700_DEV_UART12]    =3D  0x00C33B00,
>      [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
>      [ASPEED_AST1700_DEV_SPI0_MEM]  =3D  0x04000000,
> @@ -108,6 +110,18 @@ static void aspeed_ast1700_realize(DeviceState *dev,=
 Error **errp)
>                          aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_GPIO=
],
>                          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio),=
 0));
>
> +    /* I2C */
> +    snprintf(dev_name, sizeof(dev_name), "ioexp%d", s->board_idx);
> +    qdev_prop_set_string(DEVICE(&s->i2c), "bus-label", dev_name);
> +    object_property_set_link(OBJECT(&s->i2c), "dram",
> +                             OBJECT(&s->iomem), errp);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->iomem,
> +                        aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_I2C]=
,
> +                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->i2c), =
0));
> +
>      /* LTPI controller */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->ltpi), errp)) {
>          return;
> @@ -141,6 +155,10 @@ static void aspeed_ast1700_instance_init(Object *obj=
)
>      object_initialize_child(obj, "ioexp-gpio[*]", &s->gpio,
>                              "aspeed.gpio-ast2700");
>
> +    /* I2C */
> +    object_initialize_child(obj, "ioexp-i2c[*]", &s->i2c,
> +                            "aspeed.i2c-ast2700");
> +
>      /* LTPI controller */
>      object_initialize_child(obj, "ltpi-ctrl",
>                              &s->ltpi, TYPE_ASPEED_LTPI);
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 402799416f..7433d365a3 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -205,6 +205,8 @@ static const int aspeed_soc_ast2700a1_irqmap[] =3D {
>      [ASPEED_DEV_ETH3]      =3D 196,
>      [ASPEED_DEV_PECI]      =3D 197,
>      [ASPEED_DEV_SDHCI]     =3D 197,
> +    [ASPEED_DEV_IOEXP0_I2C] =3D 198,
> +    [ASPEED_DEV_IOEXP1_I2C] =3D 200,
>  };
>
>  /* GICINT 128 */
> @@ -267,6 +269,18 @@ static const int ast2700_gic133_gic197_intcmap[] =3D=
 {
>      [ASPEED_DEV_PECI]      =3D 4,
>  };
>
> +/* Primary AST1700 Interrupts */
> +/* A1: GICINT 198 */
> +static const int ast2700_gic198_intcmap[] =3D {
> +    [ASPEED_DEV_IOEXP0_I2C]       =3D 0, /* 0 - 15 */
> +};
> +
> +/* Secondary AST1700 Interrupts */
> +/* A1: GINTC 200 */
> +static const int ast2700_gic200_intcmap[] =3D {
> +    [ASPEED_DEV_IOEXP1_I2C]       =3D 0, /* 0 - 15 */
> +};
> +
>  /* GICINT 128 ~ 136 */
>  /* GICINT 192 ~ 201 */
>  struct gic_intc_irq_info {
> @@ -283,9 +297,9 @@ static const struct gic_intc_irq_info ast2700_gic_int=
cmap[] =3D {
>      {195, 1, 3, ast2700_gic131_gic195_intcmap},
>      {196, 1, 4, ast2700_gic132_gic196_intcmap},
>      {197, 1, 5, ast2700_gic133_gic197_intcmap},
> -    {198, 1, 6, NULL},
> +    {198, 2, 0, ast2700_gic198_intcmap},
>      {199, 1, 7, NULL},
> -    {200, 1, 8, NULL},
> +    {200, 3, 0, ast2700_gic200_intcmap},
>      {201, 1, 9, NULL},
>      {128, 0, 1, ast2700_gic128_gic192_intcmap},
>      {129, 0, 2, NULL},
> @@ -333,8 +347,13 @@ static qemu_irq aspeed_soc_ast2700_get_irq_index(Asp=
eedSoCState *s, int dev,
>              assert(ast2700_gic_intcmap[i].ptr);
>              or_idx =3D ast2700_gic_intcmap[i].orgate_idx;
>              idx =3D ast2700_gic_intcmap[i].intc_idx;
> -            return qdev_get_gpio_in(DEVICE(&a->intc[idx].orgates[or_idx]=
),
> -                                    ast2700_gic_intcmap[i].ptr[dev] + in=
dex);
> +            if (idx < ASPEED_INTC_NUM) {
> +                return qdev_get_gpio_in(DEVICE(&a->intc[idx].orgates[or_=
idx]),
> +                                        ast2700_gic_intcmap[i].ptr[dev] =
+ index);
> +            } else {
> +                return qdev_get_gpio_in(DEVICE(&a->intcioexp[idx - ASPEE=
D_INTC_NUM].orgates[or_idx]),
> +                                        ast2700_gic_intcmap[i].ptr[dev] =
+ index);
> +            }

checkpatch.pl complains about some of these lines being 80+
characters, and errors on the last return being over 90 characters.

>          }
>      }
>
> @@ -1098,6 +1117,8 @@ static void aspeed_soc_ast2700_realize(DeviceState =
*dev, Error **errp)
>
>      /* IO Expander */
>      for (i =3D 0; i < sc->ioexp_num; i++) {
> +        AspeedI2CClass *i2c_ctl;
> +
>          qdev_prop_set_uint8(DEVICE(&s->ioexp[i]), "board-idx", i);
>          if (!sysbus_realize(SYS_BUS_DEVICE(&s->ioexp[i]), errp)) {
>              return;
> @@ -1128,6 +1149,26 @@ static void aspeed_soc_ast2700_realize(DeviceState=
 *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->ioexp[i].gpio), 0,
>                             aspeed_soc_ast2700_get_irq(s, ASPEED_DEV_GPIO=
));
>
> +        /* I2C */
> +        i2c_ctl =3D ASPEED_I2C_GET_CLASS(&s->ioexp[i].i2c);
> +        for (int j =3D 0; j < i2c_ctl->num_busses; j++) {
> +            /*
> +             * For I2C on AST1700:
> +             * I2C bus interrupts are connected to the OR gate from bit =
0 to bit
> +             * 15, and the OR gate output pin is connected to the input =
pin of
> +             * GICINT192 of IO expander Interrupt controller (INTC2/3). =
Then,
> +             * the output pin is connected to the INTC (CPU Die) input p=
in, and
> +             * its output pin is connected to the GIC.
> +             *
> +             * I2C bus 0 is connected to the OR gate at bit 0.
> +             * I2C bus 15 is connected to the OR gate at bit 15.
> +             */
> +            irq =3D aspeed_soc_ast2700_get_irq_index(s,
> +                                                   ASPEED_DEV_IOEXP0_I2C=
 + i,
> +                                                   j);
> +            sysbus_connect_irq(SYS_BUS_DEVICE(&s->ioexp[i].i2c.busses[j]=
),
> +                               0, irq);
> +        }
>      }
>
>      aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->dpmcu),
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 83fb906bdc..ca84068bb4 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -1261,6 +1261,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Er=
ror **errp)
>  static const Property aspeed_i2c_properties[] =3D {
>      DEFINE_PROP_LINK("dram", AspeedI2CState, dram_mr,
>                       TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_STRING("bus-label", AspeedI2CState, bus_label),
>  };
>
>  static void aspeed_i2c_class_init(ObjectClass *klass, const void *data)
> @@ -1421,14 +1422,28 @@ static void aspeed_i2c_bus_realize(DeviceState *d=
ev, Error **errp)
>  {
>      AspeedI2CBus *s =3D ASPEED_I2C_BUS(dev);
>      AspeedI2CClass *aic;
> -    g_autofree char *name =3D g_strdup_printf(TYPE_ASPEED_I2C_BUS ".%d",=
 s->id);
> -    g_autofree char *pool_name =3D g_strdup_printf("%s.pool", name);
> +    g_autofree char *name =3D NULL;
> +    g_autofree char *pool_name =3D NULL;
>
>      if (!s->controller) {
>          error_setg(errp, TYPE_ASPEED_I2C_BUS ": 'controller' link not se=
t");
>          return;
>      }
>
> +    /*
> +     * I2C bus naming:
> +     *   - Empty bus_label -> BMC internal controller, use default name.
> +     *   - Non-empty bus_label -> external/addon controller, prefix with=
 label
> +     *     to avoid conflicts and show bus origin.
> +     */
> +    if (!s->controller->bus_label || (strlen(s->controller->bus_label) =
=3D=3D 0)) {
> +        name =3D g_strdup_printf(TYPE_ASPEED_I2C_BUS ".%d", s->id);
> +    } else {
> +        name =3D g_strdup_printf("aspeed.%s.i2c.bus.%d",
> +                               s->controller->bus_label, s->id);
> +    }
> +    pool_name =3D g_strdup_printf("%s.pool", name);
> +
>      aic =3D ASPEED_I2C_GET_CLASS(s->controller);
>
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> --
> 2.43.0
>
>

