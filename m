Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52249D3B7E2
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Dec 2025 18:22:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSfrl-0001LX-4I; Mon, 08 Dec 2025 13:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vSfrj-0001L3-Dj
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 13:21:43 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vSfrh-0000gl-NC
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 13:21:43 -0500
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4ed67a143c5so38081cf.0
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 10:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765218099; x=1765822899; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GegoaMD4IBYBNAojeiyyUljTu2SnAHNz/bqQ2Tbdcf4=;
 b=EA8e4llnYZQe5kD7JXNV9RKwiPxX/jX5de4weJB0wqxKrYrDCmHUlcKpws3ZWdVjRI
 4pAmkI/jN0Eakryx3k37QdpHjbCMjUWgjwJ+RQC6yGvT1iO5wq5ZATh6V3RRRo2/pyEF
 7YnpqBzvtiZcqsPDnQGPIrjmGbl7HRg4lPSWg5JmVsZVLxN61BNQnmZRPRVcpPZ01ILl
 SzPNaizzrM7kg7aEsN7Ucb2xWMZ7t/JmTgc1iM3d1vp0nyawif9Z8OKZqtdF5ER9xVQC
 Uuikf8AlbiMLfDwV5Hq6xKBCGxY/ihmGTyYRPs2qur0AZKOO+X0ByNpQCo/palx0G9ZQ
 XPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765218099; x=1765822899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GegoaMD4IBYBNAojeiyyUljTu2SnAHNz/bqQ2Tbdcf4=;
 b=G72/7R0spJUcscD+tPYDt65G2d8ouKgg5QActgsbCb34FRoI8W34IAMpJ+JhewMatf
 BEYZw+bTuD1XFF120Jm7VtXLiMVdiJWqMnOQcYdtTFg06jUe2mB6CmKy9Wwn/hxd1h8j
 1jrCKPrVAd14TghU/qZljHRA+fgCRVlDBfhqLNOBDMFnWKVJabAggA05UKYcafPUWi1r
 1c1CqRQ/a6gGV33D43X09jwLAxlS4SiXXhCF2nezhGF98OSAYTlNoC25TFz18pmsLOU0
 OBGqY7WSXmXdKpuHAypG4OyrYnIBfTSEIgt+bc7xllKUZyjlaPfma+E68VP+73sX3YJ3
 nc0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSyArrv/OI3GD79+1jEFM4wN6lfHOM+iWnFvTH4UlQvDwpo0gmkFNg8j/xjYaqjb+wVqjG17coow==@nongnu.org
X-Gm-Message-State: AOJu0YzCbEJD6pX5WH1goQm9bdUwK2Fw1CCgF586/RLkjCCi2iPqKYyb
 JEl4fI++Evwm+dOSgVvgIA4IrAWx1FNuopCWryycjKNqnpt0L7GUgKCjK0G9VjXbfAwA+0yRlR4
 iZZkCDXvQXBA6H/og+TmunpB+QkaM4puHkOokaFNu
X-Gm-Gg: ASbGncsjNhNK2p+wF/ZoN7wLgxZV8cr6drdCtKYgcsNoZJjMqE+7+yQ9hEbMUZfPcfI
 MfyfttOMxru9CBaQbR+R+x1i/cJYqf6BX3cWw4GfP7e5r3PQqcTIsWvXBogYcwQ2WNytiAdePyc
 NAq6f4bpji0drODeC2zTdmCSkLD8C35xiZsLhiWRkHV8jadL30e/5ubWB794T9Ey4Dh1lcEFXa/
 0DRcN7VUCumT1BF830BRyfp2QzzIztaP7z9TjCM6Sef+Rmo/OKirlydBvSC3HA5Rt1i8g8lKdIc
 RB5GwW48LKvDAL7gO8GAQfjF8g==
X-Google-Smtp-Source: AGHT+IF0d6Grur514sbwezzzvoHr3zDGB1sIe8vg3mNqeZJigmwuRQ/HvmsJI3sYYXQ2BQDq3VCiN5NIAZZ6fKii8PY=
X-Received: by 2002:a05:622a:8c0b:b0:4f0:2e33:81aa with SMTP id
 d75a77b69052e-4f1a50cebe6mr129061cf.11.1765218098803; Mon, 08 Dec 2025
 10:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20251208074436.1871180-1-kane_chen@aspeedtech.com>
 <20251208074436.1871180-18-kane_chen@aspeedtech.com>
In-Reply-To: <20251208074436.1871180-18-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 8 Dec 2025 10:21:27 -0800
X-Gm-Features: AQt7F2qF_pgj6RrViDlozXX_E7WkTMzPcE5whutxjgby_SkfLGxzznkl3wXsC7Q
Message-ID: <CA+QoejXUfmJfuWSPndkuF=Dqu7QBJF7ACgH90Wmfshr4+3pDoA@mail.gmail.com>
Subject: Re: [PATCH v3 17/18] hw/arm/aspeed: Attach SGPIOM device to AST1700
 model
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x835.google.com
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

On Sun, Dec 7, 2025 at 11:48=E2=80=AFPM Kane Chen via <qemu-devel@nongnu.or=
g> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Connect the SGPIOM device to AST1700 model.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> ---
>  include/hw/arm/aspeed_ast1700.h |  3 +++
>  hw/arm/aspeed_ast1700.c         | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index 7292719dc2..490f2a3b05 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -12,6 +12,7 @@
>  #include "hw/misc/aspeed_scu.h"
>  #include "hw/adc/aspeed_adc.h"
>  #include "hw/gpio/aspeed_gpio.h"
> +#include "hw/gpio/aspeed_sgpio.h"

As far as I can tell this depends on Yubin Zou's SGPIO series (link below)?
Does that mean the series looks good? Can you reply to the series
itself if it is?

 https://lore.kernel.org//qemu-devel/20251106-aspeed-sgpio-v1-0-b026093716f=
a@google.com
>  #include "hw/i2c/aspeed_i2c.h"
>  #include "hw/misc/aspeed_ltpi.h"
>  #include "hw/misc/aspeed_pwm.h"
> @@ -19,6 +20,7 @@
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/char/serial-mm.h"
>
> +#define AST1700_SGPIO_NUM            2
>  #define AST1700_WDT_NUM              9
>
>  #define TYPE_ASPEED_AST1700 "aspeed.ast1700"
> @@ -39,6 +41,7 @@ struct AspeedAST1700SoCState {
>      AspeedADCState adc;
>      AspeedSCUState scu;
>      AspeedGPIOState gpio;
> +    AspeedSGPIOState sgpiom[AST1700_SGPIO_NUM];
>      AspeedI2CState i2c;
>      AspeedPWMState pwm;
>      AspeedWDTState wdt[AST1700_WDT_NUM];
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index c9d7a97a80..e027ae02ad 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -23,6 +23,8 @@ enum {
>      ASPEED_AST1700_DEV_ADC,
>      ASPEED_AST1700_DEV_SCU,
>      ASPEED_AST1700_DEV_GPIO,
> +    ASPEED_AST1700_DEV_SGPIOM0,
> +    ASPEED_AST1700_DEV_SGPIOM1,
>      ASPEED_AST1700_DEV_I2C,
>      ASPEED_AST1700_DEV_UART12,
>      ASPEED_AST1700_DEV_LTPI_CTRL,
> @@ -37,6 +39,8 @@ static const hwaddr aspeed_ast1700_io_memmap[] =3D {
>      [ASPEED_AST1700_DEV_ADC]       =3D  0x00C00000,
>      [ASPEED_AST1700_DEV_SCU]       =3D  0x00C02000,
>      [ASPEED_AST1700_DEV_GPIO]      =3D  0x00C0B000,
> +    [ASPEED_AST1700_DEV_SGPIOM0]   =3D  0x00C0C000,
> +    [ASPEED_AST1700_DEV_SGPIOM1]   =3D  0x00C0D000,
>      [ASPEED_AST1700_DEV_I2C]       =3D  0x00C0F000,
>      [ASPEED_AST1700_DEV_UART12]    =3D  0x00C33B00,
>      [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
> @@ -142,6 +146,16 @@ static void aspeed_ast1700_realize(DeviceState *dev,=
 Error **errp)
>                          aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_LTPI=
_CTRL],
>                          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ltpi),=
 0));
>
> +    /* SGPIOM */
> +    for (int i =3D 0; i < AST1700_SGPIO_NUM; i++) {
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->sgpiom[i]), errp)) {
> +            return;
> +        }
> +        memory_region_add_subregion(&s->iomem,
> +                    aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_SGPIOM0 =
+ i],
> +                    sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sgpiom[i])=
, 0));
> +    }
> +
>      /* WDT */
>      for (int i =3D 0; i < AST1700_WDT_NUM; i++) {
>          AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> @@ -194,6 +208,12 @@ static void aspeed_ast1700_instance_init(Object *obj=
)
>      object_initialize_child(obj, "ltpi-ctrl",
>                              &s->ltpi, TYPE_ASPEED_LTPI);
>
> +    /* SGPIOM */
> +    for (int i =3D 0; i < AST1700_SGPIO_NUM; i++) {
> +        object_initialize_child(obj, "ioexp-sgpiom[*]", &s->sgpiom[i],
> +                                "aspeed.sgpio-ast2700");
> +    }
> +
>      /* WDT */
>      for (int i =3D 0; i < AST1700_WDT_NUM; i++) {
>          object_initialize_child(obj, "ioexp-wdt[*]",
> --
> 2.43.0
>
>

