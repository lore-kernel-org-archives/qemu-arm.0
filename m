Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BE7E92FCB
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:39:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ5J-0005UA-7C; Mon, 29 Dec 2025 14:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4f-0004vD-12
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:40 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4d-0000N5-Da
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:36 -0500
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4f34f257a1bso3264721cf.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037114; cv=none;
 d=google.com; s=arc-20240605;
 b=JCs2wr7i6qKwCv/NcNIcukHKWOCg2Y3AATQV7P2gzgESEp54i8RZj8uDkycyd7OX9a
 SGDzji8vOIgk3Q5M4t6SMZKg7aFK4r5ETfGw4pSaO89aetavmnhTyijOwD0kmgyGNWcM
 iooWit6kGUBRfYlXW9AH5So65sk0vpU7YZD+5i/6NGQI2GyB61hmcrSdSS1sAs3PNv6I
 B/AuFijY8rAuY8fbL0ftilN878n/BMDqSxYaF4fHx/PRiiSMSgyNqTa/BhcQZutayNBq
 mDuHdoZzzcISQDcF97t/uMv4NHYCwxcS6F6CZ6LdwccPpqnDKiJcR1R2vVza6SVFDKsQ
 mXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=doKnHhUkFb/0NWLVCyNF9qJ6hCQOom1B9Iyu62HNW/U=;
 fh=oyabIWBtOeO2zMI+k9Jr1uG9PAn5HjZCGyAO6cy0obA=;
 b=XVJkenwdinFVBEf4ahPWN2KXpBmXX1VMNTaQMP6eSM6T48jdhnT8yXjXcxrrJigcqK
 RJUfE51tiZjy4Z/U89oN+3csdGDZmmCOWseecuKHI4iaboNzgmrlerKLcCIw4/zUGiv5
 ohHLZ5hf9xuel3A9GIOL331+gnDoIuLxNE9M9f16kA/aSCnB4psE6kUffXDh1S+eyxeK
 ACh5Gow9fIfzmEUjWzFKQFetYAHeEb3/WXS6XPlJxu0sscljOgCMwmfHrbr0pj5mm4+8
 d3DnNEeSDDB8k7uu8aR49GG7lEIn75pEGAYVqCiraVG16TmhPZTLWDypJQ46f0WQXqHg
 m9VA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037114; x=1767641914; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=doKnHhUkFb/0NWLVCyNF9qJ6hCQOom1B9Iyu62HNW/U=;
 b=DQdHGFktFTrUYMjtRHorguxtdbhUd7Fy7WpS5YE2SpvntGmBbb1ZC4MOhb/bgFb3XA
 ql7XZDRRB/9SfgNGeRAUvEmV+wsj8K1ToD0vXkM6yy48ZApC6ASpz5WOm6G9lrTykPrK
 OKFPI+jnHjDaRyLgLClfKaNXWIHon3QpV5ACSv0Bw+OQ3Mj+6OwtlthXr9US4vudMYbH
 Z/nmGt1LMhPYdrwrvs2ab67cg8LYk/jBoae0h8jEsNVicN38umB6vNgeVLe6UReUnD/X
 CJsKHvLH9kGNz56z4Cg0yRPUkW9QbcpwyEgWNoEwO0IJbow1fIPJzM0pa+uwYY/DpLIE
 7rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037114; x=1767641914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=doKnHhUkFb/0NWLVCyNF9qJ6hCQOom1B9Iyu62HNW/U=;
 b=SfBONiN9iy5jgoOALWpyjE4jHj3BPy34Qo/BYaET21+SnhtaTDLL7KZpbzeaMgPEL2
 hjvIyKxMKgmyIvidZQOXX1RBe065fwOwYLPSlE0u+jGMaqCadjPzVG2YWqj4ItHIS6Ft
 o3kpqgH74AGBPqOZMZBxvWyJ4i5yVgRt3nlIxJk4vgWgk+xjyuSkon65awJ02UCRps0/
 YIHBTz9C0VjGxXtl+fhmdbPJfPKI36sFc4G6ZP/e8SW3QM1krYzrmWzKzihmcqBUV/Ml
 fOBkuGPoA2wUiPx4FdkxCJIK6CGlKmCET0MtpfWfGzR9xT0LJYlI7LgLvfDKbGy+sxAr
 niTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqXrBs9RtK+nWavylCbNQBycGEaGkOlzaMP3IojXuFAk28I510X4DKsQbLciB7/vTgeEPxhVK+gg==@nongnu.org
X-Gm-Message-State: AOJu0Yz7wnlym7fmWJY8AJzgZmdSLAEyGoebrMwq/w9pRcjP7ADCacRt
 nDI+wivjUtJLDyprwl5oHqYtxrpQzsNOWhglAAqqx6enSD0DAevxQpMjTAQtdXMO4yhEyjhifdI
 6eEuq5Qimz9XFqlkmJDRB4/CmrcoDsD6+GEADWou+eWSQ3AgikJMvrhfxWak=
X-Gm-Gg: AY/fxX6VMfFOHpq/j76OopHDO5Z3JLk2o6DCXW365IbT1iphn6RncMcUbO6HawkBDJd
 B2XwLCjL9w06P/IVrSB4YFiTm0vmXEhqV9qebRU9t4XzxY/4gHkPOxOekWHEDx5Q50RSPvS9Ntm
 KVFDziG+ytyZefXlXr3PhIOXzdB76l/BNLcZ7ko53GJwRRNJJpr4HJ0w02ncZWAcCWX7HBMehWA
 RUUPEBWKS8UV4wc5/4uEa4RxGvcfiVKQS7B5pJU+FMTTpLgxLNS09xY4xuzvVum+6adYjWC3cSR
 fheX28QHcCtBc950b5mhEs34AA==
X-Google-Smtp-Source: AGHT+IEyQOupiZr2zpS8yq9ARPqaemPv9uB0Uydep4wqnLCVzrMioJxYouzQJGTv2b+3RZ9L3JmCEUYCAa+28Z9gwIc=
X-Received: by 2002:a05:622a:15cb:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-4f4e4e3df06mr29408191cf.8.1767037114066; Mon, 29 Dec 2025
 11:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-16-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-16-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:22 -0800
X-Gm-Features: AQt7F2r8-mK_VxsCyp_o_MeLLc9rqwqoFwNmN-zKlpw3EFjXPPzjx7oRyON4QXU
Message-ID: <CA+QoejWSscrjQPpTsd14Y43ULWG=HJy4=4fYG_kJiW2VQ6xS+g@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] hw/arm/aspeed: Attach WDT device to AST1700 model
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82b.google.com
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
> Connect the WDT device to AST1700 model.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


> ---
>  include/hw/arm/aspeed_ast1700.h |  4 ++++
>  hw/arm/aspeed_ast1700.c         | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index d4b7abee7d..f43c0c5475 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -15,8 +15,11 @@
>  #include "hw/i2c/aspeed_i2c.h"
>  #include "hw/misc/aspeed_ltpi.h"
>  #include "hw/ssi/aspeed_smc.h"
> +#include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/char/serial-mm.h"
>
> +#define AST1700_WDT_NUM              9
> +
>  #define TYPE_ASPEED_AST1700 "aspeed.ast1700"
>
>  OBJECT_DECLARE_SIMPLE_TYPE(AspeedAST1700SoCState, ASPEED_AST1700)
> @@ -36,6 +39,7 @@ struct AspeedAST1700SoCState {
>      AspeedSCUState scu;
>      AspeedGPIOState gpio;
>      AspeedI2CState i2c;
> +    AspeedWDTState wdt[AST1700_WDT_NUM];
>  };
>
>  #endif /* ASPEED_AST1700_H */
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index fad3b86e8d..9fb84dd159 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -25,6 +25,7 @@ enum {
>      ASPEED_AST1700_DEV_I2C,
>      ASPEED_AST1700_DEV_UART12,
>      ASPEED_AST1700_DEV_LTPI_CTRL,
> +    ASPEED_AST1700_DEV_WDT,
>      ASPEED_AST1700_DEV_SPI0_MEM,
>  };
>
> @@ -37,6 +38,7 @@ static const hwaddr aspeed_ast1700_io_memmap[] =3D {
>      [ASPEED_AST1700_DEV_I2C]       =3D  0x00C0F000,
>      [ASPEED_AST1700_DEV_UART12]    =3D  0x00C33B00,
>      [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
> +    [ASPEED_AST1700_DEV_WDT]       =3D  0x00C37000,
>      [ASPEED_AST1700_DEV_SPI0_MEM]  =3D  0x04000000,
>  };
>
> @@ -129,6 +131,22 @@ static void aspeed_ast1700_realize(DeviceState *dev,=
 Error **errp)
>      memory_region_add_subregion(&s->iomem,
>                          aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_LTPI=
_CTRL],
>                          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ltpi),=
 0));
> +    /* WDT */
> +    for (int i =3D 0; i < AST1700_WDT_NUM; i++) {
> +        AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> +        hwaddr wdt_offset =3D aspeed_ast1700_io_memmap[ASPEED_AST1700_DE=
V_WDT] +
> +                            i * awc->iosize;
> +
> +        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->s=
cu),
> +                                 errp);
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
> +            return;
> +        }
> +        memory_region_add_subregion(&s->iomem,
> +                        wdt_offset,
> +                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->wdt[i]=
), 0));
> +    }
> +
>  }
>
>  static void aspeed_ast1700_instance_init(Object *obj)
> @@ -163,6 +181,12 @@ static void aspeed_ast1700_instance_init(Object *obj=
)
>      object_initialize_child(obj, "ltpi-ctrl",
>                              &s->ltpi, TYPE_ASPEED_LTPI);
>
> +    /* WDT */
> +    for (int i =3D 0; i < AST1700_WDT_NUM; i++) {
> +        object_initialize_child(obj, "ioexp-wdt[*]",
> +                                &s->wdt[i], "aspeed.wdt-ast2700");
> +    }
> +
>      return;
>  }
>
> --
> 2.43.0
>

