Received: by 10.223.159.82 with SMTP id f18csp1006423wrg;
        Tue, 21 Nov 2017 10:22:42 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaKE13CTd8uBHIucAg/lbJG7SOkLBA2N8Jcwhvki99kb80tSR6WmsOXbFLXJ4s56qW2kDAa
X-Received: by 10.37.130.78 with SMTP id d14mr11204467ybn.239.1511288562247;
        Tue, 21 Nov 2017 10:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511288562; cv=none;
        d=google.com; s=arc-20160816;
        b=cYN1mMy7pmTNzbP/Sk8HhzrG+fC7BNQDy+lPqs1shfChsgE2fz8wNJwEnv7qsaP4r6
         6m/PZtbEXbl9OQ8YxNTeKwdBtDqmNuugI2b4nTgGnsWyYCt+ceQuehueY5C2VduK/6K8
         5PyQBZ3KILgORbwbJyNhmnrCokxBuIap6gYlA/0NvtOTlwL6IIpHZiqbKOR333l8zpID
         ts6m8jJKnTjfCDJTWPCzJKL4QychB5YWK6jlb4sDeDTEPL5CeGPxZcjteG3U74Wh72MM
         ZOChsT1sO3D9h7KwJcXzBVVJFeF2WKNWQXO+ENbTgRDv6MUe8zzONvPLuV+u/YdOnOCH
         OqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=k+zzj7IPPwkvlr5L+OvDIQQmx/0gy3UmSCzho3lsK6g=;
        b=iuFechUjxzOCfk0twf2rUf0/psMfdFEG1QWAy2UHXqFPROswsp59YWSCLJhBq6vpAM
         xuxVSfVo7Dd3tE2tiDQ61Ezz0kTxndrTcSI+pjMNtn+PPJhaLRlzylYPj6jy1gZByb0n
         dh7WqJ0e36chdD8xHYML921hzhweEc4BwxS8az1YDM5cTjKbixdBoxreNnuDGwZ6xdcN
         PF/+lm+tAUVrMEnlePK/1wrHHfi4VwfczA6+pq+2It/wh/YQz3QlQbVQVeDPpxj4F50g
         KxEYvVTF4G2qgy3ZopB23kBbG3NLWcRynKQhuoBC5s/sv4K1cBpc3yY7M9zRu6WfO0gw
         DgGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=khK6322Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d203si2934411ywc.77.2017.11.21.10.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 10:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=khK6322Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHDBx-0000Wz-Kw
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 13:22:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHDBj-0000V2-QN
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:22:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHDBi-0004oO-He
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:22:27 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:35957)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHDBi-0004oE-Ct
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:22:26 -0500
Received: by mail-ot0-x241.google.com with SMTP id t79so11347652ota.3
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 10:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=k+zzj7IPPwkvlr5L+OvDIQQmx/0gy3UmSCzho3lsK6g=;
	b=khK6322QuFUzq9r7v5art9Ga7CP3agWlcISxwoucJa5CszRmMGR6lYjlMRxBjNaMOR
	fwyTkZ+6qrWtfkIJzJ5edwgQz+iasYvFPmUrC4fUbx5cc6Bs1u7mJKzHYC7gMYa+dMSf
	W0FM4/Cmygg792ajHRw4HGtNkzERdffu24DyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=k+zzj7IPPwkvlr5L+OvDIQQmx/0gy3UmSCzho3lsK6g=;
	b=dmy0CqtBSOyr+0o1Ti/rOhJz9fGeNDafkjupQqkSQk9Pul+3fUjlh1r6V0R0vgTa1W
	p7G1zvmn3XC7VK/AMOAw+clnKzrkXwKYifLG7yLPtP8+Kr6LXrAtDHZT9zxQBLzw6cVp
	DGJuvJ4rBdguWWSp+ClpPL/bty+UDRspYiLmQOxnhErJG/iEIqFv49wCi4l6eJEP0w+7
	ETi4nVfzuI01lpmjt0zAgc/cYjAXRQFgKS7t8r6Cbq3ds38ZDi4RTDvwmdwytYuC4tHd
	W3iRg+mKJby9bJSlA4s04NrzL9hDUKHohFtFd+DCVA9L/XekQM+xnRIn0H/AhdIiGGAH
	+FMw==
X-Gm-Message-State: AJaThX7+KOVyjd9LevU70bKe13vtWaLVzhbtbRHRQZRL/SYjvI7S/rTY
	8iR5grbFnEeEqjNAu41qi3FMhNA6PGVCIxgzkwfDpQ==
X-Received: by 10.157.90.6 with SMTP id v6mr9822333oth.54.1511288545763; Tue,
	21 Nov 2017 10:22:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 10:22:05 -0800 (PST)
In-Reply-To: <20171106154813.19936-31-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-31-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 18:22:05 +0000
Message-ID: <CAFEAcA8WbQobHPT8jZy6bnR9_wtmZ0ogJmmWo13_-StuDxXUWw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v3 30/30] Implement support for i.MX7 Sabre
 board
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: To7oLgFwb5qF

On 6 November 2017 at 15:48, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Implement code needed to set up emulation of MCIMX7SABRE board from
> NXP. For more info about the HW see:
>
> https://www.nxp.com/support/developer-resources/hardware-development-tool=
s/sabre-development-system/sabre-board-for-smart-devices-based-on-the-i.mx-=
7dual-applications-processors:MCIMX7SABRE

You could put this URL in a comment in the code as well.

> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/arm/Makefile.objs   |   2 +-
>  hw/arm/mcimx7d-sabre.c | 101 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 102 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/mcimx7d-sabre.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index f379ddc74b..eb6f6c5997 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -19,5 +19,5 @@ obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
>  obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
>  obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
>  obj-$(CONFIG_MPS2) +=3D mps2.o
> -obj-$(CONFIG_FSL_IMX7) +=3D fsl-imx7.o
> +obj-$(CONFIG_FSL_IMX7) +=3D fsl-imx7.o mcimx7d-sabre.o
>
> diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
> new file mode 100644
> index 0000000000..7ca8e668e8
> --- /dev/null
> +++ b/hw/arm/mcimx7d-sabre.c
> @@ -0,0 +1,101 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * MCIMX7D_SABRE Board System emulation.
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This code is licensed under the GPL, version 2 or later.
> + * See the file `COPYING' in the top level directory.
> + *
> + * It (partially) emulates a mcimx7d_sabre board, with a Freescale
> + * i.MX7 SoC
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"
> +#include "hw/arm/fsl-imx7.h"
> +#include "hw/boards.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/device_tree.h"
> +#include "qemu/error-report.h"
> +#include "sysemu/qtest.h"
> +#include "net/net.h"
> +
> +typedef struct {
> +    FslIMX7State soc;
> +    MemoryRegion ram;
> +} MCIMX7Sabre;
> +
> +static void mcimx7d_add_psci_node(const struct arm_boot_info *boot_info,
> +                                  void *fdt)
> +{
> +    const char comp[] =3D "arm,psci-0.2\0arm,psci";
> +
> +    qemu_fdt_add_subnode(fdt, "/psci");
> +    qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> +    qemu_fdt_setprop_string(fdt, "/psci", "method", "smc");
> +}

I'm still unconvinced by this (none of the other i.mx boards we have
have anything like it). How does the real hardware boot SMP ?

thanks
-- PMM
