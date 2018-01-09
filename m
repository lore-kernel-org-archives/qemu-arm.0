Received: by 10.28.173.206 with SMTP id w197csp4243932wme;
        Tue, 9 Jan 2018 15:15:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBouWyODR/7Jj/lphtX9+xsW2YgYrjXgHhz4qGdtQP4Fink++W79ZdXFZm8jZL2uzBnnGDc7J
X-Received: by 10.37.175.7 with SMTP id a7mr15857221ybh.95.1515539736093;
        Tue, 09 Jan 2018 15:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515539736; cv=none;
        d=google.com; s=arc-20160816;
        b=kcNuCGan0+9gplMRWjpI1/EwNX69pPt9XiTZ57E06PMj/xnI812krPNbpLRhKToSOq
         pcmp+xNjIwt8E070LeRPqufuIaF4qxn5iAxr0ZpmFijpaoBgnuacBOlkVcIqeud9lPDL
         XuLp/4ewAM0mbtaUD558VJyKs5CHSnDngbhu9WNBViUTiee8biKTOnFQPLV0/vWFRjVe
         v9/OG/xAz5Wp3u1/6BMZcGmqwycGvM6cY0gs5xyxcsbiNlTZb23kvtP7UYTEF4SUuzvV
         KEJ8k3b+lMNJgmeZRhRYMtuEVv38K0Lh0HRbv2b8adJvC9jgkWlX714lnwB4Tzun3ZyP
         p2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=cQFK9Yi3hLDi6mQqNcRLztYQaXqjvvMgE8hKDFWLnvc=;
        b=DuLkFONT6Ilx2syDQyFMssr/NO6yZVyccPTtj//uFCDbA4B6f01q5+aq7+bV1TxC+6
         E1YkoolAine5Fyj6dYKlQB6p5iG+0D6jc0eh+3ou9b5tJdOAIvfq5TmDGeJPMMPqNrzS
         UH2dk5xzaSbNw06QJf3ZA6gMr54EDTzGqSrdsz8wyYdeZJ5KO8NC/XDqlvRrw/Y4EvoJ
         1LgfeW+CIfmYdPv/rsVLW8ZEwallhZsxx/9morZfTBlLgGREw1GioUV6wDJKKujTqNZu
         ZoNtyTubwFs27g2WHve5f+XXJ79QHtZpB6U9FDRiim7iOx4FQ97YXyU6fm3/PUrORVd1
         ifmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d+xKZ8w2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 141si1193063ybe.589.2018.01.09.15.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 15:15:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d+xKZ8w2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZ37H-0007D0-Fr
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 18:15:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ373-0007Bq-Ua
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 18:15:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ372-0007UZ-Lw
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 18:15:21 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:44636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eZ36s-0007Lk-EN; Tue, 09 Jan 2018 18:15:10 -0500
Received: by mail-wm0-x234.google.com with SMTP id t8so23336913wmc.3;
	Tue, 09 Jan 2018 15:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=cQFK9Yi3hLDi6mQqNcRLztYQaXqjvvMgE8hKDFWLnvc=;
	b=d+xKZ8w2RtwwUJeE946PVL93KmTf3FDrz4bfGeR5JMj9xTq4Pvf35tjGNpGnYYHkXZ
	tKwctNjo8fW3loMA2mwCkXnqDsTtXxRD0HKcmmARgzOy3hshdUQlVBnCnZd2crtfJhNj
	CHk2PymjS5nblEcNSqVdFAjstOvTmR+CxHO1cGcRnKETcpT4bdKro4LW54XSUQi1NO8i
	/ozZDHkQ3XZDhUlSDOom6PRmMWidHXsV6Tn/Z5depxq6LHem7VEcEdcjwXVuOklItybB
	YZtsiiOQzP5UMSNanKbCbLaL4feIw0r2Y9nA8I1cDIq8Df8fvKLmfJd9tTds89jpzMGy
	CmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=cQFK9Yi3hLDi6mQqNcRLztYQaXqjvvMgE8hKDFWLnvc=;
	b=o5Ddir8NzsUebgxTjdYR4UiRzCJBplapFojKTTofM0mMcNDlX+g8OxWsS7cIOphjbc
	HenW0aPWrMoDTiH33FH/JKihe7mq3pl+/aEbZcfAGGViE76L1Vg2EFskqKvCq1dFayT4
	UTir4/5ToGdcVzQgpYiCNAvMBvsGs1//2Miwojn6BMBtfVbOegEmhrEzweb1/wmcQ7Ve
	f6Y76XFm8gJ0YZMt7HAaXP95LU9CGeoZqBWV0tZx/yXm4A5DWulSik+6+CL8WpuurIfd
	dVyDbk6oxmIEfcdNz2xTV46H3bEe8Eks8vfEUrtP3UbvZM0fYYit6h5as6+VQ6s2h6B0
	XUZg==
X-Gm-Message-State: AKGB3mLc+XVjmU+XyTTmq6WDCgZv6gMAoNG3gCJ28rLOt6oyLtn6eQ3x
	PnOZktHBOrKM0m2/kNXVPP2vXKQr1R+KJJgtJT0=
X-Received: by 10.28.55.74 with SMTP id e71mr14012115wma.50.1515539709312;
	Tue, 09 Jan 2018 15:15:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Tue, 9 Jan 2018 15:14:38 -0800 (PST)
In-Reply-To: <20180108154303.6522-11-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-11-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 9 Jan 2018 15:14:38 -0800
X-Google-Sender-Auth: HHTJzbaoh54GHFc0BGjTGo1g3bQ
Message-ID: <CAKmqyKOb7S1ff9uwQ8eYHxgvZRYMPCNr3wbgy-m5FZumHj3cSw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 10/31] sdhci: add a
 Designware/Samsung host controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T+rpHlIrAHNc

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/dw-mshc.c     | 64 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/sd/Makefile.objs |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 hw/sd/dw-mshc.c
>
> diff --git a/hw/sd/dw-mshc.c b/hw/sd/dw-mshc.c
> new file mode 100644
> index 0000000000..c2869cd569
> --- /dev/null
> +++ b/hw/sd/dw-mshc.c
> @@ -0,0 +1,64 @@
> +/*
> + * Synopsys Designware Mobile Storage Host Controller emulation
> + * (and Samsung Exynos specific extensions)
> + *
> + * Copyright (C) 2018 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * (at your option) any later version.  See the COPYING file in the
> + * top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include "hw/sd/sdhci.h"
> +#include "qapi/error.h"
> +
> +/* Compatible with:
> + * - SD Host Controller Specification Version 2.0
> + * - SDIO Specification Version 2.0
> + * - MMC Specification Version 4.3
> + *
> + * - SDMA
> + * - ADMA
> + */
> +static void exynos4210_dw_mshc_realize(DeviceState *dev, Error **errp)
> +{
> +    SDHCICommonClass *cc =3D SYSBUS_SDHCI_COMMON_GET_CLASS(dev);
> +    Object *obj =3D OBJECT(dev);
> +    Error *local_err =3D NULL;
> +
> +    object_property_set_uint(obj, 2, "sd-spec-version", &local_err);
> +    object_property_set_bool(obj, true, "suspend", &local_err);
> +    object_property_set_bool(obj, true, "1v8", &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    cc->parent_realize(dev, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +}
> +
> +static void exynos4210_dw_mshc_class_init(ObjectClass *klass, void *data=
)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    SDHCICommonClass *cc =3D SYSBUS_SDHCI_COMMON_CLASS(klass);
> +
> +    cc->parent_realize =3D dc->realize;

This need an explanation, why are we doing this weird realise logic?

Alistair

> +    dc->realize =3D exynos4210_dw_mshc_realize;
> +}
> +
> +static const TypeInfo exynos4210_dw_mshc_info =3D {
> +    .name =3D "samsung,exynos4210-dw-mshc",
> +    .parent =3D TYPE_SYSBUS_SDHCI,
> +    .class_init =3D exynos4210_dw_mshc_class_init,
> +};
> +
> +static void dw_mshc_sdhc_register_types(void)
> +{
> +    type_register_static(&exynos4210_dw_mshc_info);
> +}
> +
> +type_init(dw_mshc_sdhc_register_types)
> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
> index 0fe2501017..fd866d7f94 100644
> --- a/hw/sd/Makefile.objs
> +++ b/hw/sd/Makefile.objs
> @@ -3,6 +3,7 @@ common-obj-$(CONFIG_SD) +=3D core.o
>
>  # SD/MMC host adapters
>  common-obj-$(CONFIG_PL181) +=3D pl181.o
> +common-obj-$(CONFIG_EXYNOS4) +=3D dw-mshc.o
>  common-obj-$(CONFIG_SSI_SD) +=3D ssi-sd.o
>  common-obj-$(CONFIG_SDHCI) +=3D sdhci.o
>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-memcard.o
> --
> 2.15.1
>
>
