Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7B4E92FCB
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ4b-0004cf-1I; Mon, 29 Dec 2025 14:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4W-0004JH-Kg
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:28 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4V-0000KO-0j
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:28 -0500
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4f34f257a1bso3264601cf.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037106; cv=none;
 d=google.com; s=arc-20240605;
 b=DhLfuFlGaNWEqmA9liWH4IA12AWUMNkeKg9RBVKGTVqXyKpmLBRAQpoEcf/Kt9NWPN
 XWesVhncFaiqey1+uNAy69y1NIegEjrVEUkd2jXj9qtMjn2d4FB9KRqvs0ZT2txYfdXT
 4101y0q0aum6M0yh+QNNh3qo2yhdqQi/qR8SI90iXkdV5+AS6DnxgxTGopP9dwhFiYCE
 3xA5jQh492gHdOBvcRcdfDF5ZwisMaY+BJG7H1EDby9ALAv+n0ZZz7LOjyZxXybqJk4F
 Tg8hYKr9eSpJnSBe6VMREqcn5DzYR1sqsRwvxPRURpx/rCQpboYgIM6B3PRsNEPHUnv2
 1voQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+oW5uw9Cj2nS5XdVTupDCLeVWUAnBMas/8Gf/zVm9fo=;
 fh=tpzdQg6GceP/QIaQoYcYXSHAjdbpOaHsMhL2D6Yv3oI=;
 b=gvksa3eLPMHtdnHiQWTrI4k985rswWDlYtxvSgp7cRzvUWZtdIhGiEzEiUkbV0IrUt
 K0zCEwIVHBCPJCaqaM4ucKYMusiYQahAhCrioez0lkx0cJjM0nhmrFtra0dgfSSRm9tq
 JLofhrStxih1p9mZl7wDe0rLOCrN9av06FuqZ1zgXQtk2PpqAgj/Badqj74BmR+Mpfox
 vPyD0aS7inAQG6VQGqJQ+8op4EoIczkiGlt4nFchsyRrr9Dy5Zij3k80dTNYzoaJnQud
 peaW9FdjJSWcPSd9HePlGhyjkMyRF0piIA20PAimLi12Je/Mkzn7Awefcz7HUn6Miq59
 e7uQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037106; x=1767641906; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oW5uw9Cj2nS5XdVTupDCLeVWUAnBMas/8Gf/zVm9fo=;
 b=ycpMbTS0HvT3i/Qv+kzOktBRKRcC6gJLuTqOca9lDI02TAX0QRCfEo8CKYWl3/OR54
 f0NowYsb9I25IuSUabFjA2kSakOGYSQpRfiGVx8Ku21943wX/TypVsJdbWpxxYUOXrzj
 wBaEc3Na9fZp+iEZYp5UZwi6DGPiWQLcaQicU2O6s2r+E8kOWAoH4cjRHyDmI3EK+ZVa
 pjrbg7HKArsJH2izIVeA8fx5Yeww9CEh1f2twlkPvwxWvn3VDgwYXs5gRWXBf09TENDT
 4Hts3s6uldVniqnRwbOphNsexOO2uekNebQhcn6LEA/ChlnHBlGm4OMH2tWy9LNws7TE
 mZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037106; x=1767641906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+oW5uw9Cj2nS5XdVTupDCLeVWUAnBMas/8Gf/zVm9fo=;
 b=lpBtHySJ+SMHOy+LTawpjpbS24FC7FSaW7YuxotO7M1qIpZT2XyCrEAcG/cHUR33CH
 nzFWSAq75YEfxyBPnvaPTC7sZr8UHoVUCljjYqwWq5fatC+G93dMbwKMFRpvJ3oPtAdg
 1WI/ucgVf/AcJkeF70+TlA961GZ0m5lKoLEY5GpP+feOLrugumZTw2W9oPDzbcr2E8+O
 BmWl2XV4yDaW55xApJcC2c+ibOM13VB1Sk2dSIUj4yUjiiCeVX8bA/3ha3qgOfKwwZlc
 EBXqHbU6fjTRJmZ4kyonGoKmedh0FSs1knp9V5zjAtGI5d3JcdOQWWGS/nlYCFdyJvb0
 mcFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUARlZslhvhPsPLYJpMRGI/X7aBpwbElJQSM2dMnGzwUEQrszHR2qpl08B3np6fDeghnX76gO4B0A==@nongnu.org
X-Gm-Message-State: AOJu0YyxuVLYPAQxYjNuD/KgGd2jWPFPFdorpIGq4yb1Q3jpz4m6/Kzg
 6HGHoHIXseOdfWyvwwKGcLRp6sI3rBuuS3pSe6dWn5oeOON3DJ/mj9GM6wZ9r42c6aERgm7L+7H
 jOIoik85NRFBoTxhPXhP16SHwl5jzyvQ6KaW5N8Or
X-Gm-Gg: AY/fxX61zumn6uarPXo5vLLAowiO5O8w26hRdR9TjIR7lGtU1NdKjYVwVzxJfVqGV0e
 VI02rbxfAIFuRpEIA8wL/jamkF1IDtDB6bwpp05t6G+xg0PaiNDcnoHg2Z34tcSnlJdz/MB+Wxx
 tSjc+yU0qEyS3YkhvydXux517KVJePd49mFeNGZREPy1twv2it/ySlGQkKqwnDzefyybk7PU+0s
 trJEh5kqJnvc9g7bWxl3MTQWeehNfewv3PJqxS+WujTCKy/E46OB9sRhy7DBNMXAge/f1FoWiyJ
 An+cuUEp0M2+SQVgVghxRcr4+w==
X-Google-Smtp-Source: AGHT+IFku3zro8H7t30oXIuMmdkcxiJhuToVYn6viRo5lioopRN/2rCjzY1i5yQbpIm+RpkmfYbVqhgae+NiBDeQ4sM=
X-Received: by 2002:ac8:7d47:0:b0:4f1:9c6e:cf1c with SMTP id
 d75a77b69052e-4f4f3406765mr26764511cf.17.1767037105739; Mon, 29 Dec 2025
 11:38:25 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-12-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-12-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:14 -0800
X-Gm-Features: AQt7F2oDH4YO9h6Ef7fjK1MineJzFLnvM91K3KeDs744hxAtQshDbdbb3FuD_cE
Message-ID: <CA+QoejXxchTnioWJX_oFv7rgP68riG9QTGfngwDTq79kxWLt5A@mail.gmail.com>
Subject: Re: [PATCH v4 11/19] hw/arm/aspeed: Attach ADC device to AST1700 model
To: Kane Chen <kane_chen@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
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

On Tue, Dec 23, 2025 at 5:42=E2=80=AFPM Kane Chen <kane_chen@aspeedtech.com=
> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Connect the ADC device to AST1700 model.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


> ---
>  include/hw/arm/aspeed_ast1700.h |  2 ++
>  hw/arm/aspeed_ast1700.c         | 14 ++++++++++++++
>  hw/arm/aspeed_ast27x0.c         |  5 +++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index 5b120dd11a..0c1216c4ba 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -9,6 +9,7 @@
>  #define ASPEED_AST1700_H
>
>  #include "hw/sysbus.h"
> +#include "hw/adc/aspeed_adc.h"
>  #include "hw/misc/aspeed_ltpi.h"
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/char/serial-mm.h"
> @@ -27,6 +28,7 @@ struct AspeedAST1700SoCState {
>      SerialMM uart;
>      MemoryRegion sram;
>      AspeedSMCState spi;
> +    AspeedADCState adc;
>  };
>
>  #endif /* ASPEED_AST1700_H */
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index fc09bb1aed..e4d206045f 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -19,6 +19,7 @@
>  enum {
>      ASPEED_AST1700_DEV_SPI0,
>      ASPEED_AST1700_DEV_SRAM,
> +    ASPEED_AST1700_DEV_ADC,
>      ASPEED_AST1700_DEV_UART12,
>      ASPEED_AST1700_DEV_LTPI_CTRL,
>      ASPEED_AST1700_DEV_SPI0_MEM,
> @@ -27,6 +28,7 @@ enum {
>  static const hwaddr aspeed_ast1700_io_memmap[] =3D {
>      [ASPEED_AST1700_DEV_SPI0]      =3D  0x00030000,
>      [ASPEED_AST1700_DEV_SRAM]      =3D  0x00BC0000,
> +    [ASPEED_AST1700_DEV_ADC]       =3D  0x00C00000,
>      [ASPEED_AST1700_DEV_UART12]    =3D  0x00C33B00,
>      [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
>      [ASPEED_AST1700_DEV_SPI0_MEM]  =3D  0x04000000,
> @@ -76,6 +78,14 @@ static void aspeed_ast1700_realize(DeviceState *dev, E=
rror **errp)
>                          aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_SPI0=
_MEM],
>                          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->spi), =
1));
>
> +    /* ADC */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->iomem,
> +                        aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_ADC]=
,
> +                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->adc), =
0));
> +
>      /* LTPI controller */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->ltpi), errp)) {
>          return;
> @@ -97,6 +107,10 @@ static void aspeed_ast1700_instance_init(Object *obj)
>      object_initialize_child(obj, "ioexp-spi[*]", &s->spi,
>                              "aspeed.spi0-ast2700");
>
> +    /* ADC */
> +    object_initialize_child(obj, "ioexp-adc[*]", &s->adc,
> +                            "aspeed.adc-ast2700");
> +
>      /* LTPI controller */
>      object_initialize_child(obj, "ltpi-ctrl",
>                              &s->ltpi, TYPE_ASPEED_LTPI);
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index f2418e0e45..84ff8b5557 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -1117,6 +1117,11 @@ static void aspeed_soc_ast2700_realize(DeviceState=
 *dev, Error **errp)
>              sysbus_connect_irq(SYS_BUS_DEVICE(&a->intcioexp[i]), j,
>                                 irq);
>          }
> +
> +        /* ADC */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ioexp[i].adc), 0,
> +                           aspeed_soc_ast2700_get_irq(s, ASPEED_DEV_ADC)=
);
> +
>      }
>
>      aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->dpmcu),
> --
> 2.43.0
>

