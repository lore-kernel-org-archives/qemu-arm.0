Received: by 10.223.159.82 with SMTP id f18csp994076wrg;
        Tue, 21 Nov 2017 10:11:03 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbmtd3Jg7cTgGhZBRwTLoPA6QgtgyjjAzZGGpXljhSijIacKQftzZoturvia4Um4chy3CRG
X-Received: by 10.129.72.136 with SMTP id v130mr12009302ywa.487.1511287863779;
        Tue, 21 Nov 2017 10:11:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511287863; cv=none;
        d=google.com; s=arc-20160816;
        b=YA5oRm/Dc6MDi89kNAZYFSyPRIDncGovQx/hkgSHeoAo6Pc9p2yv+zP3YXJ2oC42lG
         ewPlzvP54Xz2GtPM07rezRtXJQb+iCHMRKZ+G1GhVL7VgVhTvhs+9u7FkxgzzUaSE3gQ
         j+irleZ/UxU9tszal5H2jdSug3puKuQ3QlxgZqxCaDi1stR0PlPk1Z7UNMeeoTYPBwG8
         CZ2U61EndJuRlap4IsiAb42HoL8DTxIPoPp0RYJqXWCoaKR6iL5uMddwbePptyTtfUrI
         AmivtP4xXFdgRNiP4R2jmHUGRYuPImIqCKRA5cSRs6DzAOnz9qm2GtSLEiKUt3U7RKil
         OlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=WPKIR7Poc739ZfPESmXENQzbjrGrh2u97k+70XvpnOs=;
        b=rQEbje2+BFXTbsZVgLAE8p/gN0P2s0MDOrViJ0BOxM4jSe4QG5a6atAo71D5lxO1vE
         GpgxU30c7j44jt3v8uepBfmgTBPCVnYMiemn9ln/RvzYjzElJ9UXQnGmTYbBFcb+a8zF
         ZulWjs1jkT/q3gUIcDvTS5a3Pde2Rs0nWnGRDzGT0Sl+kVOQmZ9F3LNwMUo48eh8SQVz
         NLf0kpeNiZ+tC1P+slS2cpjFlWYg5SRyvsrFFOnVsGljwosWEr4O8UrlQWn3R2np6qcl
         aXpO6m/lk78zHPA/pl9IyPkhiX6Zd4kwmGXeUnF0skN1ZY5WMtnDnFgVgf0SvvPOlxCJ
         x58w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c4ZbPP0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q6si2987440ybq.688.2017.11.21.10.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 10:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c4ZbPP0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHD0h-0002zn-4y
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 13:11:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHD0U-0002xW-I5
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHD0T-0000S6-BY
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:10:50 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35183)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHD0T-0000Ru-4c
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:10:49 -0500
Received: by mail-oi0-x243.google.com with SMTP id e142so9160319oih.2
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 10:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WPKIR7Poc739ZfPESmXENQzbjrGrh2u97k+70XvpnOs=;
	b=c4ZbPP0V9K2FrwRRuMfB2kNCtIFaG+ERdv3eI2hVAzaBhN7xIP9LcpopSmFqW6QiEy
	8bFV8hV5FJ3lfIizr8Wlmto8o1+jInEKV7RdWGx96S82uD5U+faWmSbhSTye7KahveAg
	tgk6g9WKt3e9WM8f2iqClliweSKB9ThVMHOck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WPKIR7Poc739ZfPESmXENQzbjrGrh2u97k+70XvpnOs=;
	b=dlT8EJznSgOUpK4aMp+moimCEpEUJEnFZOnGwa/gjhNPmqH2J/obKR7Xnwcxo+A0ej
	c08NQ55OCWCYnMbcui/vaveGoLOGK+OxH1agM6K/x63pnjimzG6USEhWNMq1xUpR21l8
	emWKfl0BvqknobDJRl899tFPAEBb9AvO+vzKqa6DbNZ0nY7eixaoQV7ByKco4CV7bW6b
	XQUx/ElBunNV6CpJeIrVLQJ74K8hpbBa2BZLFDapDvlbisz9WJrd3X99JgytzR9pt8BY
	2GzPBOizdCOb91WpuNVr60+LnMhAnL91GX1MfGl71sHmw1LNCsaWzmESDbDhXe6o3reA
	qk1g==
X-Gm-Message-State: AJaThX4Nn4uP4qiqRT2zLOVv6esoTxH6O0mhIPzq6+9jzqeBbxBitgH2
	ZHrns9hlVp1U2Z9fzbMiLDBwWEt6C2Ot/SB6eTTNBA==
X-Received: by 10.202.205.147 with SMTP id d141mr1953464oig.256.1511287848473; 
	Tue, 21 Nov 2017 10:10:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 10:10:28 -0800 (PST)
In-Reply-To: <20171106154813.19936-15-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-15-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 18:10:28 +0000
Message-ID: <CAFEAcA8gxXmEL3yeu0J12C8D0AkKFqBKC1Sud2HLbT1EdUO41Q@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v3 14/30] i.MX: Add code to emulate i.MX2
 watchdog IP block
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
X-TUID: PYjrXZqSBw4K

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add enough code to emulate i.MX2 watchdog IP block so it would be
> possible to reboot the machine running Linux Guest.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/misc/Makefile.objs      |  1 +
>  hw/misc/imx2_wdt.c         | 88 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/misc/imx2_wdt.h | 34 ++++++++++++++++++
>  3 files changed, 123 insertions(+)
>  create mode 100644 hw/misc/imx2_wdt.c
>  create mode 100644 include/hw/misc/imx2_wdt.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ac1be05a03..c393a93456 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -35,6 +35,7 @@ obj-$(CONFIG_IMX) +=3D imx25_ccm.o
>  obj-$(CONFIG_IMX) +=3D imx6_ccm.o
>  obj-$(CONFIG_IMX) +=3D imx6_src.o
>  obj-$(CONFIG_IMX) +=3D imx7_ccm.o
> +obj-$(CONFIG_IMX) +=3D imx2_wdt.o
>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
>  obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
> diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
> new file mode 100644
> index 0000000000..3a1c33aa51
> --- /dev/null
> +++ b/hw/misc/imx2_wdt.c
> @@ -0,0 +1,88 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * i.MX2 Watchdog IP block
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "sysemu/watchdog.h"
> +
> +#include "hw/misc/imx2_wdt.h"
> +
> +#define IMX2_WDT_WCR_WDA    BIT(5)      /* -> External Reset WDOG_B */
> +#define IMX2_WDT_WCR_SRS    BIT(4)      /* -> Software Reset Signal */
> +
> +static uint64_t imx2_wdt_read(void *opaque, hwaddr addr,
> +                              unsigned int size)
> +{
> +    return 0;
> +}
> +
> +static void imx2_wdt_write(void *opaque, hwaddr addr,
> +                           uint64_t value, unsigned int size)
> +{
> +    if (addr =3D=3D IMX2_WDT_WCR &&
> +        (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
> +        watchdog_perform_action();
> +    }
> +}
> +
> +static const MemoryRegionOps imx2_wdt_ops =3D {
> +    .read  =3D imx2_wdt_read,
> +    .write =3D imx2_wdt_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .impl =3D {
> +        /*
> +         * Our device would not work correctly if the guest was doing
> +         * unaligned access. This might not be a limitation on the
> +         * real device but in practice there is no reason for a guest
> +         * to access this device unaligned.
> +         */
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +        .unaligned =3D false,
> +    },
> +};
> +
> +static void imx2_wdt_realize(DeviceState *dev, Error **errp)
> +{
> +    IMX2WdtState *s =3D IMX2_WDT(dev);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(dev),
> +                          &imx2_wdt_ops, s,
> +                          TYPE_IMX2_WDT".mmio",
> +                          IMX2_WDT_REG_NUM * sizeof(uint16_t));
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> +}
> +
> +static void imx2_wdt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D imx2_wdt_realize;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static const TypeInfo imx2_wdt_info =3D {
> +    .name          =3D TYPE_IMX2_WDT,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(IMX2WdtState),
> +    .class_init    =3D imx2_wdt_class_init,
> +};
> +
> +static WatchdogTimerModel model =3D {
> +    .wdt_name =3D "imx2-watchdog",
> +    .wdt_description =3D "i.MX2 Watchdog",
> +};
> +
> +static void imx2_wdt_register_type(void)
> +{
> +    watchdog_add_model(&model);
> +    type_register_static(&imx2_wdt_info);
> +}
> +type_init(imx2_wdt_register_type)
> diff --git a/include/hw/misc/imx2_wdt.h b/include/hw/misc/imx2_wdt.h
> new file mode 100644
> index 0000000000..e67ac6939d
> --- /dev/null
> +++ b/include/hw/misc/imx2_wdt.h
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * i.MX2 Watchdog IP block
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef IMX2_WDT_H
> +#define IMX2_WDT_H
> +
> +#include "qemu/bitops.h"
> +#include "hw/sysbus.h"

The bitops.h include should be in the .c file, not here.

> +
> +#define TYPE_IMX2_WDT "imx2.wdt"
> +#define IMX2_WDT(obj) OBJECT_CHECK(IMX2WdtState, (obj), TYPE_IMX2_WDT)
> +
> +enum IMX2WdtRegisters {
> +    IMX2_WDT_WCR     =3D 0x0000,
> +    IMX2_WDT_REG_NUM =3D 0x0008 / sizeof(uint16_t) + 1,
> +};
> +
> +
> +typedef struct IMX2WdtState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +} IMX2WdtState;
> +
> +#endif /* IMX7_SNVS_H */
> --
> 2.13.6
>
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
