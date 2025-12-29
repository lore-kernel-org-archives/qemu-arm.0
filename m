Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D912BE92FC4
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:41:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ5V-0006FT-40; Mon, 29 Dec 2025 14:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4h-0004ww-Mn
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:41 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4g-0000NY-3m
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:39 -0500
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4ee243b98caso3941961cf.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037117; cv=none;
 d=google.com; s=arc-20240605;
 b=i/G8m8ViMjCJQePEuG/UqUQxEJv4omt2q7brCkDvoVXRmAwIm/Ivtf9YCmWm8Bbw4a
 4mE/Trehxnus1ZzTW1GG+iPSK3RwSJTEDNEauiBEhsKjQqVoSJvhGQb79CT419K0DvXw
 DtnRDWBAw+65yJC9NIWI69jmVLoNb5CSsdndQPRWtq0T/0mUnzyy/g4Zkm3NU11ZA2SK
 odriqhrSgY9//BpXoypmPMPuhd5pAJtyHTVQZb//L+405DDa1MdH98jgZFuimZpQkW04
 uBQR46pFEgqql/R3rSiLTxL2FjuN8F+L2l5eq53Dp/5EEKFHsv2g9NdVZULvG8R2juh7
 XQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FnS7ZbKw9aNcaKVTwK+oR+E5vW6qeLZ6zAVdP6qoM+I=;
 fh=UUnof64kFFW4xVCjFpL6+KzmzxtkfQ7K8Xo08oggOmU=;
 b=Iswz3bQnF0dYOsSJZI5HFZpZceRB6rpCq0/Pvxv853TQgx8Cm3lEN8RegEvBi7ANVh
 u8Z/kdzdB1y60DjMuTvmBpUHx6Je4bqgmuiFGugTAnBrUxVUglAAIERsRPwTTBOpgaot
 FXzTQZ/2jWQUaTqW0ooRByGMwptbMh/BZ0dwAYkyX9JdiPavke76VhoWyidkWcWyonUN
 35To1jFqRWEYJzg/uSMdOr3yJy0vr6PBixuWJIyuuM5heaY+ScgjUXaLhPwHADwfeQlo
 2vgk1KASRqTVJU0uAcA9XbdpewUrpc+bggKZKUDaWdtYukiddud+LCF6krm+EWBK8+XA
 +6dw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037117; x=1767641917; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnS7ZbKw9aNcaKVTwK+oR+E5vW6qeLZ6zAVdP6qoM+I=;
 b=TooNPuuxJoihR7+VU190E/koRQD+1nJxpdJTxbzUGYjgW8iC8slc8YiD9JY0da/c1p
 c1sBtjdeSx69k6iIBb/jbHjgGLgwYmR/9DSn7fxtvUhbuLGBNnX/14CrSjkZ6VnOUDM+
 K1F9/JXRBnTiaovIQfDIzvvc1G89Y+myaZlqQy/0aImhuu0jcetTn2+Y+YO8iCyyFmS5
 doQhyIXP2/yE6osZ9TGFqd8enLeYvH90ZnfG3a+BQQjYx+IL6Ew3qS0d8ip5bje9Ewe6
 cg22NIoAkAy+lBIy6rM9dGEpGEAL4196PoJ6mKRub5YgQGhvnY9pkpHveB3Ol+dNoJUZ
 tnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037117; x=1767641917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FnS7ZbKw9aNcaKVTwK+oR+E5vW6qeLZ6zAVdP6qoM+I=;
 b=VVVxV9sY4dtd8Ex/z0R+ZY21YuA2rMomCTXdm2JzicAz5POdo4Y8qmWWGmjlfJgQ9o
 k+w1PSm3zkKRNlwPIEjOR9jXKjBHi6nQJk1ABcbMGzxmmxsED0WofaLoXECwMDuz8jZ5
 ab+YYmZBBEq5GH5k0n71aS4dVky7CUazPG4x9gblxXuPNX9IMFJw/9D1VoNv9GqZM+Ne
 Z6ijvg+9gdG9YVkIKWvzd85NmOVU1dKPLXtZyyuo4v8Vj0+dyMQ/MdsaTiwRVUq+OFnJ
 cUT3hATVSLi8FDucujPIIHIevU83wWOyre2fMuKcJ/icOAvAX41Qe+0Fvmn6vdUP1nsa
 l1KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTTIi6tPgoZ0t5mL7UEAlvJlLb7EdvNkFt7VSlnIAoLNdpFamIHyiBqoWYA80Ld+4TCRHFJNugDA==@nongnu.org
X-Gm-Message-State: AOJu0Yy0c1JyaA8XGcXgERSDs8ch0noScfFBNuNeWNyqwz6w2Cqyylnx
 52c6qj8Bx+fS2PklrKAC9PMUc4ag+Nve/oXgI2tYurD9mzRUS7YxfbeWkK6HpqeRrVApA87dGPx
 lMcxCXKEMIZmo4oSg24R2S0EzLeebuDWbRA/KG3oH
X-Gm-Gg: AY/fxX42C9s4rl8drV71ivkhmJX1PpnyxHib2xMRen7K2BaY9HMG2+mWWOD3bmie//+
 eeOQ9rUXfXykjokcL5fCcEAI5Bamewsw9vr1pZPxR8rL9rFW9fzIzczSR9NFh2HlDzDobsx6mqn
 o/zuBKNne8Ute8MnYmEDOwBvUvT2btDPL7tB/Tb95GdpvGxeAxFZDGDty3gRyQD+JLN0BlCzZ3o
 twEc9uZNVRaAHwUqX/lUTOohcJ+zlW+6doT+1Pu2Riqw9ICHaEVi9gUE/jw72LyCgQoESkNAzmp
 SyDRa8wlGnPlpx1HUqR3qbdZexuZC82yaK7v
X-Google-Smtp-Source: AGHT+IHlBUruX02pGWaUUIRzvK0SB3P0xjXTQFmZqKxxYH74nvJbudWuwUPYPisF99WI9d6AJp0llK1ZJ748N8NPPfY=
X-Received: by 2002:a05:622a:307:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-4f4e4e2b98bmr40540621cf.14.1767037117052; Mon, 29 Dec 2025
 11:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-17-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-17-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:24 -0800
X-Gm-Features: AQt7F2qnoat-JSv9_B8H8ezIGLpQOxltaU8FQJJhbs05xwmRyDcDUtzKchFOoz4
Message-ID: <CA+QoejUnESJLFqnyfiCV=d3wiBX6n8NnEqE7jAA6S4tbjUOWbw@mail.gmail.com>
Subject: Re: [PATCH v4 16/19] hw/arm/aspeed: Attach PWM device to AST1700 model
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82d.google.com
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
> Connect the PWM device to AST1700 model.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

> ---
>  include/hw/arm/aspeed_ast1700.h |  2 ++
>  hw/arm/aspeed_ast1700.c         | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index f43c0c5475..7292719dc2 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -14,6 +14,7 @@
>  #include "hw/gpio/aspeed_gpio.h"
>  #include "hw/i2c/aspeed_i2c.h"
>  #include "hw/misc/aspeed_ltpi.h"
> +#include "hw/misc/aspeed_pwm.h"
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/char/serial-mm.h"
> @@ -39,6 +40,7 @@ struct AspeedAST1700SoCState {
>      AspeedSCUState scu;
>      AspeedGPIOState gpio;
>      AspeedI2CState i2c;
> +    AspeedPWMState pwm;
>      AspeedWDTState wdt[AST1700_WDT_NUM];
>  };
>
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index 9fb84dd159..5a2552aa25 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -18,6 +18,7 @@
>
>  enum {
>      ASPEED_AST1700_DEV_SPI0,
> +    ASPEED_AST1700_DEV_PWM,
>      ASPEED_AST1700_DEV_SRAM,
>      ASPEED_AST1700_DEV_ADC,
>      ASPEED_AST1700_DEV_SCU,
> @@ -31,6 +32,7 @@ enum {
>
>  static const hwaddr aspeed_ast1700_io_memmap[] =3D {
>      [ASPEED_AST1700_DEV_SPI0]      =3D  0x00030000,
> +    [ASPEED_AST1700_DEV_PWM]       =3D  0x000C0000,
>      [ASPEED_AST1700_DEV_SRAM]      =3D  0x00BC0000,
>      [ASPEED_AST1700_DEV_ADC]       =3D  0x00C00000,
>      [ASPEED_AST1700_DEV_SCU]       =3D  0x00C02000,
> @@ -124,6 +126,14 @@ static void aspeed_ast1700_realize(DeviceState *dev,=
 Error **errp)
>                          aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_I2C]=
,
>                          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->i2c), =
0));
>
> +    /* PWM */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->pwm), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->iomem,
> +                        aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_PWM]=
,
> +                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pwm), =
0));
> +
>      /* LTPI controller */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->ltpi), errp)) {
>          return;
> @@ -177,6 +187,9 @@ static void aspeed_ast1700_instance_init(Object *obj)
>      object_initialize_child(obj, "ioexp-i2c[*]", &s->i2c,
>                              "aspeed.i2c-ast2700");
>
> +    /* PWM */
> +    object_initialize_child(obj, "pwm", &s->pwm, TYPE_ASPEED_PWM);
> +
>      /* LTPI controller */
>      object_initialize_child(obj, "ltpi-ctrl",
>                              &s->ltpi, TYPE_ASPEED_LTPI);
> --
> 2.43.0
>

