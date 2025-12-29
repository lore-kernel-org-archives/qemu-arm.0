Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2061E92FCB
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:39:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ4P-00041d-HU; Mon, 29 Dec 2025 14:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ48-0003pn-3f
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:07 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ44-0000Fs-6H
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:03 -0500
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso4444521cf.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037079; cv=none;
 d=google.com; s=arc-20240605;
 b=YVdCeIK/otnchEcN4fG81V2CCvExF6KikSsrybJYIiOWT/EDo2hNv133KOQd02C6+o
 t6U6a1AxWcKCtO+q2RhYplI/hxf+A47KmGPtIy5GEGd4hSqCEUh3yFFwewNfAsA5+Lkz
 8yK9R+KPQoN4YAXDmTqNHQH/LcSOeHHr/nTtE0Gmry79MBb3gqIt4FGfNAA2JKyPhDnq
 sMD/2taFFuI+v7JlKWkt6Mai9TaTVe58iCZhN06olOReXYLDPsLmZqKPV6xE6gwzd6Ql
 6JOrpU4H9+RZ+eF7BM39aL/K/mXbVb100oB9y/YGBNt9JJVGzp4pwr74bSAijNuBqi9f
 Cngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hh+y2I4x1NXXfxMLFLJUYgBIldCrY0BkRVyLCywP4vU=;
 fh=IYzQ0tWoQmwXVhR7ig2raqIUrH18WN7VDfkWQmEVEb0=;
 b=fldObZYvOZ6AGmdTzP/76zd9F7Z4XzThweM54zv7xH6vPO8oJEIxWr5xjW6q/wkOg9
 J74oy3yGpntTRRhr+3mAGdgxmLL28XCsFgbd1ZG+Tyc2ji+0Pera46eP05Sg0reV0swY
 KGErWrMOwLaR3ZxkCK/eWy0VfnI67abJ3X7bnzKx5znByoGcY8M4xc9lPJ/KN+Ulad9+
 baL4USEJMwq4ah6pR4sW77PBVrlvaVvLBXTQXB3tej0voPQWU/XAWhFPnueqZ9BFkCYr
 PoPRhh+eVWJBaWO5goajeD/vKz23KANxSNgSAeIm//OCamzvsYrQ8VgOV5k2xAyecXT/
 crHg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037079; x=1767641879; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hh+y2I4x1NXXfxMLFLJUYgBIldCrY0BkRVyLCywP4vU=;
 b=r3skAinoqmNIvOHpLjN7myvF7lQwKOR7HMPtqbLHY0Qri+tb1YgFc2LXp/PPJ+1vcr
 HcOPMtjNMCNEArxApf9R39ct9NIbw6h/Dyjt7SZ2s3CWa36yTamkWXwbFPF3W4t0L6Uu
 MfexacoVnh11NHby+GWvoDOKeeLXhZcHk8SnyTyobgHk+MoGE8FgVUo3L2k9hsdTHLoW
 9E0TaGgMMrA/rE7xdUCH+w67GZ5aYX1Lqj0QBZkma00Ccm3JtBH5AQgPeZIcQKFAaweH
 gbFLUSax0ghqsDKrypn6SPbpab6AHmBC/HdqSc5TiszAZBGrw6KHHTPumDJFCZ1mIoWY
 oyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037079; x=1767641879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hh+y2I4x1NXXfxMLFLJUYgBIldCrY0BkRVyLCywP4vU=;
 b=kyUlwetBcPIh9y4X9xl9BX9qCReqBoEOR3DXvVzjAuUqwBOaiR5Vz97yclv79xE3kY
 nffPKcmWNhkhRU/EH8q9vsh25EzrJl/u1jpP4O6cNnju6FMErIqzUSnL2py5Irt+dBtA
 NrYGqvDtMc+f8DDuJbFLsQ+gsXzFwH/xAUM6qCtERZFu6A+RcfjHXJOtPrRWEp6IngOo
 cgB3BTgpoBXeLlPqKNKDHqyXMGkyIJ/Z2qUlgM2HHGz/XiZ5njU4uoz5qlL6ZPmB/DMp
 ccjW5/DmxJDq91BwhLTy2WTS708rlFptt7pFDg3nmS1Tdd/21LtX9cBzggnv/XHJvxJo
 TtmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbGR6RRmA3pUlSK1uzYvpcEOqIP0ZiFQIRlAFTrPNOVszQugN6l+4y0sghfOnxqxu0Ooqu4nA5WA==@nongnu.org
X-Gm-Message-State: AOJu0Yyd0sT9TQ9CSqqwVfqkuX+b45LdLliJsfBsOfJgmjv61VWxmOBa
 TYSYOCJav4D8CtnQw72tTXjnTep+XQIuVbTw9tJ9q/5WGUH+gy8FYlauO6ksHTuop2jaXS5+ZSm
 FQZS120qHX4duzEdkUWWGwbl6wLrzW2BcH6ilavjT
X-Gm-Gg: AY/fxX5ojS7Gw+JWawRYO67wz4/u8taayi4sDQooMdkojihJuGRcXAG/MAbnhs7/RDn
 7nIyGQv/tU5QtDvwsAtn+yBUywK3Mumq0HBYEDL8hH3jdEzeZtB/VA6fqGtb56quLZtVHxaiWNh
 4sGIEQL0m39Q7Ue0qdSgUz335wTHXz+DEnjo4KKNFPvPhF5E8ls+hi07QkzEj2hj4MF/F8P/loC
 mC3xSfOpXFYSA3Cc05Lj/lyvQoHJ2fAayqvAVzXX9JdbtoBGui8OBuXsFFUb9lHVvxkfoxu98tb
 avcpDujgaDYTHawL7KA6YK/Gxw==
X-Google-Smtp-Source: AGHT+IF6PeYQUrJDoR57gwgl67N/WK0qPSJUZGpCQNZTAq/EpYrMat/9OVgO/ryjrMyfQS9S0TvZTUbdkwMErS9LYVU=
X-Received: by 2002:ac8:5983:0:b0:4ed:70d6:6618 with SMTP id
 d75a77b69052e-4f4e4e2b2aamr41070791cf.10.1767037078836; Mon, 29 Dec 2025
 11:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-6-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-6-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:37:47 -0800
X-Gm-Features: AQt7F2oqqY2oM69j1tsipzNH4KjH7n_aP70jUH1KJunyhyuYGKsgkDr_u7N7jNU
Message-ID: <CA+QoejVaqC9EPEPaTcTkz6-srE-At8xrCtrWTbZr9xiDD+iecA@mail.gmail.com>
Subject: Re: [PATCH v4 05/19] hw/arm/aspeed: Integrate AST1700 device into
 AST27X0
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82c.google.com
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
> Connect the AST1700 device as a child of the AST27X0 model to reflect
> its role in DC-SCM 2.0 LTPI-based architectures. This patch wires
> the AST1700 device into the platform without introducing functional
> peripherals.
>
> This forms the base for LTPI expander emulation in QEMU using
> AST27X0 as the host controller.
>
> Note: ioexp_num is set to 0 at this stage. Once all related devices
> and interrupts are fully implemented, ioexp_num will be updated to
> its expected value. This ensures the machine remains functional at
> every commit and avoids potential compiler or build issues.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


> ---
>  include/hw/arm/aspeed_soc.h |  7 +++++--
>  hw/arm/aspeed_ast27x0.c     | 26 ++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 7b08cca908..f19bab3457 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -45,6 +45,7 @@
>  #include "hw/char/serial-mm.h"
>  #include "hw/intc/arm_gicv3.h"
>  #include "hw/misc/aspeed_ltpi.h"
> +#include "hw/arm/aspeed_ast1700.h"
>
>  #define VBOOTROM_FILE_NAME  "ast27x0_bootrom.bin"
>
> @@ -112,10 +113,10 @@ struct AspeedSoCState {
>      UnimplementedDeviceState dpmcu;
>      UnimplementedDeviceState espi;
>      UnimplementedDeviceState udc;
> -    UnimplementedDeviceState ltpi;
>      UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
>      AspeedAPB2OPBState fsi[2];
>      AspeedLTPIState ltpi_ctrl[ASPEED_IOEXP_NUM];
> +    AspeedAST1700SoCState ioexp[ASPEED_IOEXP_NUM];
>  };
>
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -178,6 +179,7 @@ struct AspeedSoCClass {
>      int macs_num;
>      int uarts_num;
>      int uarts_base;
> +    int ioexp_num;
>      const int *irqmap;
>      const hwaddr *memmap;
>      uint32_t num_cpus;
> @@ -190,7 +192,6 @@ enum {
>      ASPEED_DEV_IOMEM,
>      ASPEED_DEV_IOMEM0,
>      ASPEED_DEV_IOMEM1,
> -    ASPEED_DEV_LTPI,
>      ASPEED_DEV_UART0,
>      ASPEED_DEV_UART1,
>      ASPEED_DEV_UART2,
> @@ -285,6 +286,8 @@ enum {
>      ASPEED_DEV_IPC1,
>      ASPEED_DEV_LTPI_CTRL1,
>      ASPEED_DEV_LTPI_CTRL2,
> +    ASPEED_DEV_LTPI_IO0,
> +    ASPEED_DEV_LTPI_IO1,
>  };
>
>  const char *aspeed_soc_cpu_type(const char * const *valid_cpu_types);
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 341b53189b..de39a3e7eb 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -26,7 +26,6 @@
>  #define AST2700_SOC_IO_SIZE          0x00FE0000
>  #define AST2700_SOC_IOMEM_SIZE       0x01000000
>  #define AST2700_SOC_DPMCU_SIZE       0x00040000
> -#define AST2700_SOC_LTPI_SIZE        0x01000000
>
>  static const hwaddr aspeed_soc_ast2700_memmap[] =3D {
>      [ASPEED_DEV_VBOOTROM]  =3D  0x00000000,
> @@ -91,7 +90,8 @@ static const hwaddr aspeed_soc_ast2700_memmap[] =3D {
>      [ASPEED_DEV_LTPI_CTRL1] =3D  0x14C34000,
>      [ASPEED_DEV_LTPI_CTRL2] =3D  0x14C35000,
>      [ASPEED_DEV_WDT]       =3D  0x14C37000,
> -    [ASPEED_DEV_LTPI]      =3D  0x30000000,
> +    [ASPEED_DEV_LTPI_IO0]  =3D  0x30000000,
> +    [ASPEED_DEV_LTPI_IO1]  =3D  0x50000000,
>      [ASPEED_DEV_PCIE_MMIO0] =3D 0x60000000,
>      [ASPEED_DEV_PCIE_MMIO1] =3D 0x80000000,
>      [ASPEED_DEV_PCIE_MMIO2] =3D 0xA0000000,
> @@ -563,10 +563,14 @@ static void aspeed_soc_ast2700_init(Object *obj)
>                                  &s->ltpi_ctrl[i], TYPE_ASPEED_LTPI);
>      }
>
> +    for (i =3D 0; i < sc->ioexp_num; i++) {
> +        /* AST1700 IOEXP */
> +        object_initialize_child(obj, "ioexp[*]", &s->ioexp[i],
> +                                TYPE_ASPEED_AST1700);
> +    }
> +
>      object_initialize_child(obj, "dpmcu", &s->dpmcu,
>                              TYPE_UNIMPLEMENTED_DEVICE);
> -    object_initialize_child(obj, "ltpi", &s->ltpi,
> -                            TYPE_UNIMPLEMENTED_DEVICE);
>      object_initialize_child(obj, "iomem", &s->iomem,
>                              TYPE_UNIMPLEMENTED_DEVICE);
>      object_initialize_child(obj, "iomem0", &s->iomem0,
> @@ -1068,14 +1072,19 @@ static void aspeed_soc_ast2700_realize(DeviceStat=
e *dev, Error **errp)
>          aspeed_mmio_map(s->memory, SYS_BUS_DEVICE(ltpi_ctrl), 0, ltpi_ba=
se);
>      }
>
> +    /* IO Expander */
> +    for (i =3D 0; i < sc->ioexp_num; i++) {
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->ioexp[i]), errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioexp[i]), 0,
> +                        sc->memmap[ASPEED_DEV_LTPI_IO0 + i]);
> +    }
> +
>      aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->dpmcu),
>                                    "aspeed.dpmcu",
>                                    sc->memmap[ASPEED_DEV_DPMCU],
>                                    AST2700_SOC_DPMCU_SIZE);
> -    aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->ltpi),
> -                                  "aspeed.ltpi",
> -                                  sc->memmap[ASPEED_DEV_LTPI],
> -                                  AST2700_SOC_LTPI_SIZE);
>      aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->iomem),
>                                    "aspeed.io",
>                                    sc->memmap[ASPEED_DEV_IOMEM],
> @@ -1143,6 +1152,7 @@ static void aspeed_soc_ast2700a1_class_init(ObjectC=
lass *oc, const void *data)
>      sc->macs_num     =3D 3;
>      sc->uarts_num    =3D 13;
>      sc->num_cpus     =3D 4;
> +    sc->ioexp_num    =3D 0;
>      sc->uarts_base   =3D ASPEED_DEV_UART0;
>      sc->irqmap       =3D aspeed_soc_ast2700a1_irqmap;
>      sc->memmap       =3D aspeed_soc_ast2700_memmap;
> --
> 2.43.0
>

