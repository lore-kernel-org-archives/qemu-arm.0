Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7709DE92FD0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:39:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ4X-0004Ov-OT; Mon, 29 Dec 2025 14:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4L-0003zY-Ow
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:19 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4K-0000Ig-8l
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:17 -0500
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4ee147baf7bso3867711cf.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037095; cv=none;
 d=google.com; s=arc-20240605;
 b=U8sBq6u1DCLl35aMXHzCJn7HX3GOIKKm2CP32wfSMcBtPunasqHS8X8N90ff3rfV2K
 ugqNYAYt9sIf3RCXr9xOJsurkY7mTYDoO+7d++znMamutz+fqFvHSpirkl4X4azbC0tA
 nIIuvOLy9riI1hKXpDIxPZvACoAdTWo6QfkTx13Scii8bPa8U5+Iyp5UiKMhzU89fwxf
 wbtTclau49ToOEPe7l7Eo0PIb8EP4WnbIA72ByvTqttVW9O04Hx4P9QDfW5sIjEGKy56
 ASgJPcstxHP/LBRvljk0da0fhzhfWAOiPekjr262ZxTRmWLfEz96+WK2Tz/y80bkuMYM
 chPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Tx/kKGsj4DN/Xe8t5AkqY7H+DrbYfDrbRqyOLZ/pb48=;
 fh=NB4QygjDlgpsmIuCtg2EBSPGraY1MWpPynd4HKtD3pU=;
 b=KOaU1OihcnJ35LeOupxAL+52weAffpERAfMkZpQyhRRXj7+JYMpLRHWqm+kDhRv7fg
 5Eae+uUKEmxJdR0mHjcs1zQbnCpjGAXUv7kH8GD1Ea+N5xCEuJh3jGCEe7cNjyBu3m2g
 Z+ChXMuGqtlrmxGUY1cztv5LKqKpZ87oLQHHy/PheOVYIz0y41/NFdv8kR2XErTFPIT/
 1M4L92s8md/uvxVohxbUcJwX1c2yKB5iqzXhIWJlNLMZhL0TDzDM1iBhMjCHvl/U4gCv
 y8429ezAIacgQvm9ecNQ/5H2Uqtooh3OJo7fNlm2J4nW87r8mNn+fnRF44Tld27D9pvs
 s56g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037095; x=1767641895; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tx/kKGsj4DN/Xe8t5AkqY7H+DrbYfDrbRqyOLZ/pb48=;
 b=pagOtDNy19FNifRk5YQU8afE9400erH8LY+JgtZtX03GPNmqqTxNUM1T8E4aQFzc+b
 pM+jqbU36ue0r9qFTkaDhbP/y95g4oZFMQ51y15Gv9PZ6RAWX4nLcIOYtGTz/DoUJ9Ya
 T4qOmWDkSO6JJJErwxwJ+vRJa+vxrzTfXFJKCOEa4NEdwDszl0rh369ZlibiZgFqhY66
 5OLjCXcXZnl5clk74o9BWOaVSmu2RbidJnkNp5ohIqFgAD0ZW8E2R1xIHSaBoPPG67Em
 5mriMUrpo8y2vTvxvJKJTDIbaysMTFD3xttVUv+Qh4n0APM608EIvpxQWWI43WAmtodf
 YUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037095; x=1767641895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tx/kKGsj4DN/Xe8t5AkqY7H+DrbYfDrbRqyOLZ/pb48=;
 b=GZxo6YDp+apDO3fL+KqW8fN0NmREh0lLvFnovq+2OubjphvagHI4eXhF3FZVfIcS3w
 fn28QqI/n7HaB44d5ntd1rKnOfMnr+R61a+mg0W87CByiXj+omLxsY4/ByELtUC/CYol
 K0iGWzA2lXS/06ka1axl5gdFg/9Z1mwfKpEqWfzg4DcUjaWk94GLSbFaixVbhswU8KFx
 Lo35Yfndbw8tolwnryvq3ZMB78hXPqe0WW3eL/7G7LoD+igdnUcyr4FRyDGM3kec7D5j
 qzmX3cCQEODDp6hZB+HpfT00gBArlKKQ6t5Z2iDm+tT1Al8jYQ3mHzFgQUKHvn53gWxO
 DrEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwxgp5oAmyIk9s1t2U/Uj3Pq6fkHEIj0hhUbyYnLDDXcBUbeiHbCOIE3OlCnda97jgxZzdL8Ipxw==@nongnu.org
X-Gm-Message-State: AOJu0Yx1sErnm+4Au/hezoemIUAWyhic3wqWb3Hq2BlRmRXPkCaji9jR
 1ZicNPw/+kMInJqKhU7AXi2sdfVFYyAYk/wqhLopQGQgGGBTd02QKrsS7ZkhegC7Ipr8eee5PVS
 F05mdPn0NJrCCi4t0UhWENqTEeA7EzTv7OWu92i81
X-Gm-Gg: AY/fxX7XP2DzLtsi7y2bXcQUFW7qNtoYWmrTRt6Uq+EmdRc60vZt4LkMUn67NaKlHw4
 rUC8yqQdEVQXmUFaUEa9PK3BflYhmEjPJ2D+9W7t6duEhN7UzXKrjMIAuxSv1R8ApZiPl/NlPtS
 Nhov/cZaSDU9DJAEXkndd14vs/4j7PELf3IjoRLLRSbwdsqlJ2PUwE9yx74asrj28HnhpHfo4Iw
 sFhARbjBhSgfYe1JII2a4/tMJbsb8ArMPZ4tHbiiqpKiG+frXkCPdkLk+nqFgyxADmljIPdTeiT
 KaLRSAjCIaDp+E/atvxZvWOZIQ==
X-Google-Smtp-Source: AGHT+IE/wk3Q05no2gfpDDoPnWBWyavz6UtpVf+wQcgbuIAXjhCA5iFhIrElQcVlQV4mm1Ao7axXC34WFY+o+Ylmlao=
X-Received: by 2002:ac8:5318:0:b0:4f4:e604:f5b with SMTP id
 d75a77b69052e-4f4e604104amr23970821cf.0.1767037095168; Mon, 29 Dec 2025
 11:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-9-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-9-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:04 -0800
X-Gm-Features: AQt7F2rCAi6qolQ773AMGUhXvMSt1fg29xSc9fKN5LSlFKHs0DqJ6JuuKaCF_80
Message-ID: <CA+QoejUGqebS+04GqEMnJpm1KLbe4nCnCg8CwZ7f4a8P3Mr05Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/19] hw/arm/aspeed: Attach UART device to AST1700
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
> Connect the UART controller to the AST1700 model by mapping its MMIO
> region.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


> ---
>  include/hw/arm/aspeed_ast1700.h |  2 ++
>  hw/arm/aspeed_ast1700.c         | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> index b9ee4952d0..a0d6b3ae44 100644
> --- a/include/hw/arm/aspeed_ast1700.h
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -10,6 +10,7 @@
>
>  #include "hw/sysbus.h"
>  #include "hw/misc/aspeed_ltpi.h"
> +#include "hw/char/serial-mm.h"
>
>  #define TYPE_ASPEED_AST1700 "aspeed.ast1700"
>
> @@ -21,6 +22,7 @@ struct AspeedAST1700SoCState {
>      MemoryRegion iomem;
>
>      AspeedLTPIState ltpi;
> +    SerialMM uart;
>  };
>
>  #endif /* ASPEED_AST1700_H */
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> index eeb586102f..f444582795 100644
> --- a/hw/arm/aspeed_ast1700.c
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -10,15 +10,18 @@
>  #include "hw/boards.h"
>  #include "hw/qdev-core.h"
>  #include "qom/object.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/arm/aspeed_ast1700.h"
>
>  #define AST2700_SOC_LTPI_SIZE        0x01000000
>
>  enum {
> +    ASPEED_AST1700_DEV_UART12,
>      ASPEED_AST1700_DEV_LTPI_CTRL,
>  };
>
>  static const hwaddr aspeed_ast1700_io_memmap[] =3D {
> +    [ASPEED_AST1700_DEV_UART12]    =3D  0x00C33B00,
>      [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
>  };
>
> @@ -32,6 +35,17 @@ static void aspeed_ast1700_realize(DeviceState *dev, E=
rror **errp)
>                         AST2700_SOC_LTPI_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
>
> +    /* UART */
> +    qdev_prop_set_uint8(DEVICE(&s->uart), "regshift", 2);
> +    qdev_prop_set_uint32(DEVICE(&s->uart), "baudbase", 38400);
> +    qdev_prop_set_uint8(DEVICE(&s->uart), "endianness", DEVICE_LITTLE_EN=
DIAN);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->uart), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->iomem,
> +                        aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_UART=
12],
> +                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart),=
 0));
> +
>      /* LTPI controller */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->ltpi), errp)) {
>          return;
> @@ -45,6 +59,10 @@ static void aspeed_ast1700_instance_init(Object *obj)
>  {
>      AspeedAST1700SoCState *s =3D ASPEED_AST1700(obj);
>
> +    /* UART */
> +    object_initialize_child(obj, "uart[*]", &s->uart,
> +                            TYPE_SERIAL_MM);
> +
>      /* LTPI controller */
>      object_initialize_child(obj, "ltpi-ctrl",
>                              &s->ltpi, TYPE_ASPEED_LTPI);
> --
> 2.43.0
>

