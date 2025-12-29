Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053EAE92FCB
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:38:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ49-0003py-Ch; Mon, 29 Dec 2025 14:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ41-0003dL-OQ
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:37:58 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ40-0000FM-4i
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:37:57 -0500
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso4444441cf.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037075; cv=none;
 d=google.com; s=arc-20240605;
 b=EA1KkWfS3Ni74IRSf3KI+a5G9GE/IMJD5HxJUpNC5+g5V1sJttOep8+co0GR6Sm2Sa
 hnHN+df5vUWG5geOPA9p+gilFVQM9MS3cPYg0rsh+iyaHjuLks9jCW6PG4GSuqFUg7hZ
 uvxsxP575cE050D3OLiPD62ijJ65aQtfPiZ5MVl9s9jo3S6EjC2+XbE/TSlT5sX45r7A
 F0ggHM1PVjHE6kBcIEh8mxw13hYcNhoffif4iIDUJaQLKZhag+W4CeMFBOf43lLo4OQs
 gTlxlM5WUhCwGRAFWA1mYDb03wdq4VYfPD9x54hFeE3xnBXedtzuMpT6oySmb7jjQwhV
 AtFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BNytO7cdekShERP/NUifZdg59yBYmK6PZXPjLqQETPk=;
 fh=FLxM+ZVBdp3cRRr1I+WqvADGmT+QLpsK2FJQlIlpDM8=;
 b=IDpCzK55WOBCLqfxza64bhwdA9zF+ZczUT01l3KF2YM+nH3WtojuaXMlplU5AniUPS
 pkYmggafp9voFt2KxT6WSAyog0oTS0GIPEcrCn6iPp0pFjjO2IY+X7mORncIJpRLxn0G
 ztzzlYGZlQuetiTGtVPwdikENGYE1qodqHNUhrQ/qK392uf0uwQIOXT/GsJs2SBA5hDW
 Lnr5sdNA6gLtBVQyt9x1egFS6inu+sWGLNz9fKT4FREO9Ih889p+e+XbJE2m+td+gzgX
 XV06X9iLEK27IFOF7/M0mZ0mxslzeAuCxdJoZsneDjIVZbNwy34v/115TASgDWW5NLaq
 v6MA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037075; x=1767641875; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNytO7cdekShERP/NUifZdg59yBYmK6PZXPjLqQETPk=;
 b=YtGR49szDAWost0fR33H/SdHWg0fgdZ9ZTGKOlynV8wHr+Y3rYKkpQKQapCqntFcn4
 BwOn8UoX5l6gXbdsnA1V1+YEYoMFYADd3J1zGfN54OgH6DMMl9u5Cwc1i6oxhgNN4/Qb
 jqZcNFPvM67LMYU4EAc1BQoMppVRpbW7YFnjMIL3td/DEWNtamfo40SbKEW7454ksMLE
 4nm+33dj6Eo4IAJiV49uJRyyE103D5YrHbRT8VwQra1PsHMTUUShaqUvygP3A0ZGvT7i
 zp+A0BuGZhzwFu0cWpgLas5fENuuw/cYqvu2x7QLt4zA7cgR5h969ZzOnO0KqQN96RO6
 FkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037075; x=1767641875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BNytO7cdekShERP/NUifZdg59yBYmK6PZXPjLqQETPk=;
 b=qDVqNZO7cWilFr3rAenyeLgv6H+U7ifdF9irFBbgTLaI6Z1nBF/V8D5m/TRPsKsjWz
 KLxJEcpoDjwGH8+SD7WmRp2xsLKf+yH/MOfmaPO0AKYR0S++0OgYKEXgveDXPZB0vQJq
 SZC9l6MUe1ehCtRCcFaMHMHrHYYXexZIq0oV8nylao7juPBMbTGcVX31bv8sScGMbJP/
 5KX1RBibhvLr3dXZzp/XmrLM27B7KTB9VwCyAtdNlNMFPmIf1eVF447Aa+RRmGv6XGdU
 SGS/tr4cSGMidoQA07BmLHELWmfuGokjsinoM8F2UJeD1luUMaiRzjaEw+0+bkoo3FgO
 44Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhE833pPMWvdMekW+LmIgOG0PY2lk+vDLQ2eaLDelMtJfK7mel7/ycJa7sEgleME+QC55FYRU8ZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzw97Uqilno20IN0n2O9STpYFPnXwsQTPZN25v10FJY4XjPY7DS
 AzO0Taf2i4rR62uO7PelE2OiAIcjMCyypHvWoJX0N4uoWOqB5SOX1SYxDYn4SSyVYjBmMY4D6KB
 6TCh5OfFLzfwo/K/HBu2/Oa6o5dPawO7/+kuu25fw
X-Gm-Gg: AY/fxX4PvXjMHDKGHUNK3jvzCoxT7qZZruqZvm+rreMC+6KCgNUruUj8c87KfzG/trt
 KECcEeqE/Q/1MtW5xQTWEcryl2TX4qfrALCaWYUcQZtCh2Q6e7wEmtf3VLgu97gKb0PM1ki0api
 DbjNe9k9hrIXjITaOmnoUf8A7Xn/F0KOSfq0QLWrT/tQGYhrEc+2Pa5JobkoCi655LtD2Iu1IPf
 inBCm2leRtdh/SK1qSC+II1pi71Cxk7zHsvj4YVPJPat4GrulyM/PryCw8FvQaK/hgV1Ux8qelO
 4gNUtIAYmAs2lqjvy+rBhKQhcg==
X-Google-Smtp-Source: AGHT+IFiyFpQYSOTfcJ/8n71wmHYit33YRiBjX3a0I5VR6xY4a/cLA6LO1ibTrXnGkT1qsqj0gpWcfXTmKE7JCDBZvo=
X-Received: by 2002:ac8:5808:0:b0:4e6:e07f:dc98 with SMTP id
 d75a77b69052e-4f4e5f731bcmr38412241cf.9.1767037074458; Mon, 29 Dec 2025
 11:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-5-kane_chen@aspeedtech.com>
In-Reply-To: <20251224014203.756264-5-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:37:43 -0800
X-Gm-Features: AQt7F2rbJJ6-FnZcQd3_U7ZtCMdFz3B1czUqAtA1wSfVYW5meIqSyqJom3bsF9U
Message-ID: <CA+QoejX3vMnho-crWmvC80uv+SsdrYgvq8u4E7DDyk8MoMbxXw@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] hw/arm/aspeed: Add AST1700 LTPI expander device
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x836.google.com
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
> Introduce a minimal QEMU device model for the ASPEED AST1700, an
> MCU-less I/O expander used in the LTPI topology defined by the
> DC-SCM 2.0 specification (see figure 2):
> https://www.opencompute.org/documents/ocp-dc-scm-2-0-ltpi-ver-1-0-pdf
>
> This initial implementation includes:
>
> * Definition of aspeed.ast1700 as a SysBusDevice
>
> * Setup of a basic memory region to reserve I/O space for future
>   peripheral modeling
>
> This stub establishes the foundation for LTPI-related device emulation,
> without implementing any functional peripherals at this stage.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

> ---
>  include/hw/arm/aspeed_ast1700.h | 23 ++++++++++++++++
>  hw/arm/aspeed_ast1700.c         | 47 +++++++++++++++++++++++++++++++++
>  hw/arm/meson.build              |  1 +
>  3 files changed, 71 insertions(+)
>  create mode 100644 include/hw/arm/aspeed_ast1700.h
>  create mode 100644 hw/arm/aspeed_ast1700.c
>
> diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_ast1=
700.h
> new file mode 100644
> index 0000000000..2a95ebfe89
> --- /dev/null
> +++ b/include/hw/arm/aspeed_ast1700.h
> @@ -0,0 +1,23 @@
> +/*
> + * ASPEED AST1700 IO Expander
> + *
> + * Copyright (C) 2025 ASPEED Technology Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef ASPEED_AST1700_H
> +#define ASPEED_AST1700_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_AST1700 "aspeed.ast1700"
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(AspeedAST1700SoCState, ASPEED_AST1700)
> +
> +struct AspeedAST1700SoCState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +};
> +
> +#endif /* ASPEED_AST1700_H */
> diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> new file mode 100644
> index 0000000000..bb6ca2ce9e
> --- /dev/null
> +++ b/hw/arm/aspeed_ast1700.c
> @@ -0,0 +1,47 @@
> +/*
> + * ASPEED AST1700 IO Expander
> + *
> + * Copyright (C) 2025 ASPEED Technology Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +#include "hw/arm/aspeed_ast1700.h"
> +
> +#define AST2700_SOC_LTPI_SIZE        0x01000000
> +
> +static void aspeed_ast1700_realize(DeviceState *dev, Error **errp)
> +{
> +    AspeedAST1700SoCState *s =3D ASPEED_AST1700(dev);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +
> +    /* Occupy memory space for all controllers in AST1700 */
> +    memory_region_init(&s->iomem, OBJECT(s), TYPE_ASPEED_AST1700,
> +                       AST2700_SOC_LTPI_SIZE);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void aspeed_ast1700_class_init(ObjectClass *klass, const void *da=
ta)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D aspeed_ast1700_realize;
> +}
> +
> +static const TypeInfo aspeed_ast1700_info =3D {
> +    .name          =3D TYPE_ASPEED_AST1700,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(AspeedAST1700SoCState),
> +    .class_init    =3D aspeed_ast1700_class_init,
> +};
> +
> +static void aspeed_ast1700_register_types(void)
> +{
> +    type_register_static(&aspeed_ast1700_info);
> +}
> +
> +type_init(aspeed_ast1700_register_types);

nit: missing trailing empty line.


> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index aeaf654790..175942263d 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -70,6 +70,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>    'aspeed_ast10x0_evb.c',
>    'fby35.c'))
>  arm_common_ss.add(when: ['CONFIG_ASPEED_SOC', 'TARGET_AARCH64'], if_true=
: files(
> +  'aspeed_ast1700.c',
>    'aspeed_ast27x0.c',
>    'aspeed_ast27x0_evb.c',
>    'aspeed_ast27x0-fc.c',
> --
> 2.43.0
>

