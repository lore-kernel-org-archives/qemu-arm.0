Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3662DE92FD0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:39:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ5J-0005WR-KV; Mon, 29 Dec 2025 14:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4c-0004fo-1b
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:34 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4a-0000MX-FM
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:33 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4ee147baf7bso3868041cf.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037111; cv=none;
 d=google.com; s=arc-20240605;
 b=MSczb4vFvz1EBaCdEeI8UNCO0AMZtXX0Rg694oi707ACWaSNxUEl7Pe2wcKPQaTSV1
 6huj0B2RTza+4ny8P5VHDZkWwdzSJOTXEfax7u1LmnQCkPrAfQ4RmMocnlnPWHKKJXvS
 mMEPmkYvb7lfTFH1L/lMq4uf5Dg2Xm2yaEUDDgadfbjotfIeYKvV6iUv60je9ngW6TSf
 xrGMxdcLJHCPQ0nuRdq9bet2jflV6S9m4Opz2ZM85IFboFy4Q8C//7d5k5BaK7FjH8BA
 eW2D1JiSmO1ytbVI+XZV+2w7/FVn29GUenPstjleAewrEpWSv8X2ynJNCUeG3i01fUXu
 AhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Oxi2gBJaCbN2rdJRawoPOCu6tIaYlgprDHm68pS7cJY=;
 fh=NN1mLTXCQOtMTKyo/iUam93NwmEFvwcNdAdRduPWb6k=;
 b=M0cGtNgtUh6pOEPedJYEacj87mRqzwN1X5ADrB0WUvFBFpu5FSV+q19/JyB7cazksl
 gEab9pyH4DpVtiDfc9Pv3I5tGKjPu9GjRpOZkUH3uqES34vTzoehwz9/fKwF2QwGUd6F
 AI9kt4l45mlX+Fte7FC+f809/tbNZ891o377evZVD6tczb6Zgz/giooCwrRzy6jkl770
 yXZRHWKOZmYEe70kDoeMXNxc4SKi1PmRXXzzzc1HfItTO4Og6dNz5Y/YUIRpY8Eqy6Sf
 asVJ/7WYPVK5P4voCfaBHx8VmJnoAUriUBr8QFKQUt21leQul3Zki+AXEgFqZvj6/dOk
 X9oA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037111; x=1767641911; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oxi2gBJaCbN2rdJRawoPOCu6tIaYlgprDHm68pS7cJY=;
 b=pA7/lOZARW8UVCrMy0Tf/6Yn7lwrTk3cN42hXpQ7IisHUeSN6a/qopyV/8E9MP17bg
 OwGDflZjOzP825y/MypI/E5EvgUuw4BBSc6LsKABztiLE5QE1fqL5JQ5IOo7olLe84Yo
 tS9BTDfl6QUudoG+qt0mlQJKdk+LThuwewrsUVyIXsNMdrqKzCUTXhJxwCSWgwerxV+e
 sZrzVjfSalyN8z9KMpuUxMgsDrZdwuBfcVJwvXEoDgKoBny0yyYPlwoxXDumU+jBbWlt
 8D1yH32QJVEN6BGEbHeiP9io9ott/M7K97Nd1BqRnaGy5/uw5bul6j5n3P0jzCJBVlN/
 K3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037111; x=1767641911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oxi2gBJaCbN2rdJRawoPOCu6tIaYlgprDHm68pS7cJY=;
 b=fswmlQB0H6HSTcRcD1R3iTLXRJuHQ62SCFJXBSJDeJWV0Qpd8RLsb4x5aATn3xonkP
 gTVH5Ja+N8A+BVXJS23oSr64UfNP64C2dLHqM8DHwBYFqwfJZTwp7ndQDAgr4ET0V1tM
 36WlGrW3mag0emYphc35+myXEMjFP8QjONPFxCgDyxelDDzPtWfGkIy5qumQTAm4uUE7
 w64sk4kyIzO5gOl53WmpPNO9oFIy/wLPM3MpTu6GMgDi5WVjE/um++p/Lf9Y/2Lhv2+g
 L0oXX8i+FA2c2kJ4CdopmYxjRMpuNivOz0VgAclllByE57Oj3IHg6XNbiz14zET9UVmj
 YEuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl1+fPueIIohisxPUI6DnTv7IiORPbNtRCq4brOueT2pbTkKi4Su4IlDKZ74tpv3VA7ut1xvuy4g==@nongnu.org
X-Gm-Message-State: AOJu0YyQ6zlYqAW0wOTy42XJbcMvnYR9gEu9+hBTflNq/ghN8iitbUY0
 7ABUgm/CUEDpZiVDAgDWP/SPnTniHXApGF0jaEVE9B3tXd/srt2J/O9xRdBtH6bF34QeqWqu+PP
 DTB0CiLN4ayeck5M8wC+fgm+eAaLDehMJcDlL44Xb
X-Gm-Gg: AY/fxX6cPLFfEU4q2Ha6ob1SRaKKB1DjSOY9fYg6r0XTUu9wIOkIzj+IRVnvjZFSf8G
 +t/6k/74C0Jk9N1OlAftvHnXrgFm2Q/opnyGEriS/YemsVuF1d3YpUdEz/ETj0KDM2luIl1KYTd
 k8t5omJf7r33p6LUyVIa67un6pLbPd5+QFDqHf2mmUY+eiiWVlc45pxme/bqCjcBwmonlxr8hte
 VMmU86fdp8gVim8uBrcNUTnnfhF1F73/tr6qVRbAYj66xztRpyb7/55juo/nbaxLUJuPC91Frs7
 /CTsnyC6lrtHioOvStuu+ODhLA==
X-Google-Smtp-Source: AGHT+IGAf3lHT1MDZvPNru5ZFtAyaf9Z2c3a7lsMQulfUCRBdqtOnpSSHR0gCNPWccwzeqeBKiwFzVREXA2l5d+lAJ8=
X-Received: by 2002:a05:622a:608:b0:4ed:ff79:e678 with SMTP id
 d75a77b69052e-4f4e4e613fcmr28442361cf.18.1767037111207; Mon, 29 Dec 2025
 11:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-14-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-14-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:20 -0800
X-Gm-Features: AQt7F2olQxxVhN3RObQYLvTXV4LPj0KJ167-hU600MkBpFnwNzE3hg_DSxVezBk
Message-ID: <CA+QoejVH=BqPx6R5LQP+owFEPanLQgxrhTZ4smzP-HJ3N8KF8w@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] hw/arm/aspeed: Attach GPIO device to AST1700
 model
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82a.google.com
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
> Connect the GPIO controller to the AST1700 model by mapping its MMIO
> region and wiring its interrupt line.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


> ---
>  include/hw/arm/aspeed_ast1700.h |  2 ++
>  hw/arm/aspeed_ast1700.c         | 14 ++++++++++++++
>  hw/arm/aspeed_ast27x0.c         |  4 ++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index 12c57145c6..7ea6ff4c1a 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -11,6 +11,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/misc/aspeed_scu.h"
>  #include "hw/adc/aspeed_adc.h"
> +#include "hw/gpio/aspeed_gpio.h"
>  #include "hw/misc/aspeed_ltpi.h"
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/char/serial-mm.h"
> @@ -32,6 +33,7 @@ struct AspeedAST1700SoCState {
>      AspeedSMCState spi;
>      AspeedADCState adc;
>      AspeedSCUState scu;
> +    AspeedGPIOState gpio;
>  };
>
>  #endif /* ASPEED_AST1700_H */
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index 6494a5c4eb..9a6019908e 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -21,6 +21,7 @@ enum {
>      ASPEED_AST1700_DEV_SRAM,
>      ASPEED_AST1700_DEV_ADC,
>      ASPEED_AST1700_DEV_SCU,
> +    ASPEED_AST1700_DEV_GPIO,
>      ASPEED_AST1700_DEV_UART12,
>      ASPEED_AST1700_DEV_LTPI_CTRL,
>      ASPEED_AST1700_DEV_SPI0_MEM,
> @@ -31,6 +32,7 @@ static const hwaddr aspeed_ast1700_io_memmap[] =3D {
>      [ASPEED_AST1700_DEV_SRAM]      =3D  0x00BC0000,
>      [ASPEED_AST1700_DEV_ADC]       =3D  0x00C00000,
>      [ASPEED_AST1700_DEV_SCU]       =3D  0x00C02000,
> +    [ASPEED_AST1700_DEV_GPIO]      =3D  0x00C0B000,
>      [ASPEED_AST1700_DEV_UART12]    =3D  0x00C33B00,
>      [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
>      [ASPEED_AST1700_DEV_SPI0_MEM]  =3D  0x04000000,
> @@ -98,6 +100,14 @@ static void aspeed_ast1700_realize(DeviceState *dev, =
Error **errp)
>                          aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_SCU]=
,
>                          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->scu), =
0));
>
> +    /* GPIO */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->iomem,
> +                        aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_GPIO=
],
> +                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio),=
 0));
> +
>      /* LTPI controller */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->ltpi), errp)) {
>          return;
> @@ -127,6 +137,10 @@ static void aspeed_ast1700_instance_init(Object *obj=
)
>      object_initialize_child(obj, "ioexp-scu[*]", &s->scu,
>                              TYPE_ASPEED_2700_SCU);
>
> +    /* GPIO */
> +    object_initialize_child(obj, "ioexp-gpio[*]", &s->gpio,
> +                            "aspeed.gpio-ast2700");
> +
>      /* LTPI controller */
>      object_initialize_child(obj, "ltpi-ctrl",
>                              &s->ltpi, TYPE_ASPEED_LTPI);
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 6b9ad328dc..d998326536 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -1124,6 +1124,10 @@ static void aspeed_soc_ast2700_realize(DeviceState=
 *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->ioexp[i].adc), 0,
>                             aspeed_soc_ast2700_get_irq(s, ASPEED_DEV_ADC)=
);
>
> +        /* GPIO */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ioexp[i].gpio), 0,
> +                           aspeed_soc_ast2700_get_irq(s, ASPEED_DEV_GPIO=
));
> +
>      }
>
>      aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->dpmcu),
> --
> 2.43.0
>

