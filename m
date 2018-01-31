Received: by 10.28.71.27 with SMTP id u27csp11060wma;
        Wed, 31 Jan 2018 09:11:22 -0800 (PST)
X-Google-Smtp-Source: AH8x2243uh0hCPPGrrz82LoH4y6U6mnSNi2RD5vW6HwdCCPODMk7tRuAm9Rk8orHRL/xQuw6MyIH
X-Received: by 10.13.243.198 with SMTP id c189mr23369226ywf.141.1517418681782;
        Wed, 31 Jan 2018 09:11:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517418681; cv=none;
        d=google.com; s=arc-20160816;
        b=Blhsr1iTRrBgGwZqR/0GlL0XZwQseQ1wMQtllmpDwV4yPq5OVg8i8PCrf0AthBNmWx
         a7fFbdiO9PMy+K5vEp68bCoy8X8Wb/uT0FAHQR7bN2XJxvBwdhTXiBYabhaXhH/Dbcvp
         zHJC8TywXAD6seyL2gA8NFWLbyr9eo0ZZ72BJ3qV3nu/cTaubfWgut6i1r/VCc8GADnz
         VGNhYJEVyi1Bsve+8OlEshxPqrMXZNXylXW9fGrPLQaXDpcfheQfhzqMUGbSjEQA2Bh2
         N6Lh6nZr8crYcWXIzigkR+LCA2yK+TI7gWyDUPGpXgTkOcRWMf+Hno68YXIJvOJ8K85g
         vsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RT2inG0qi2/z+AhHekOi72yUVMN77deUNuRr7aHRfJU=;
        b=NvPl0+/oGUmrtgpcFnsNc528hkTN7b9zwzlb7o1kH2SJtTs44JT6MiMUtzP5b6eJNK
         6dd5aJqfpmg2zlbQXc8TSI3PqS7hIHef5KYZDJBl9r+OzFHNtdNsv/25Sb7NHknq/8bW
         tsuSPuaEJdiCW0x+heRsFpA5xGfz/dXduP6sTDH898wJVQmuIvUwPi3XOALRS9xKti2A
         rw5IxEDgz2/TzcYVJxY2wfxAVR3WH9re5K+tloUX06mVlMsb+Wz+YsAUr8cIsFH3RpRZ
         O2KyXNsjMML5G5ccsslqPaN/XS9vPN34EfpDFXm0AmQrqlUm7P3JIv9HhEcD2Q9q2AxW
         QxBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lPuWVVQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j12si3140306ywb.117.2018.01.31.09.11.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Jan 2018 09:11:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lPuWVVQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egvur-00009B-7x
	for alex.bennee@linaro.org; Wed, 31 Jan 2018 12:11:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvuV-000077-Gu
	for qemu-devel@nongnu.org; Wed, 31 Jan 2018 12:11:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvuR-000148-44
	for qemu-devel@nongnu.org; Wed, 31 Jan 2018 12:10:59 -0500
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:40672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvuQ-00013p-UV; Wed, 31 Jan 2018 12:10:55 -0500
Received: by mail-qt0-x230.google.com with SMTP id s39so22727665qth.7;
	Wed, 31 Jan 2018 09:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RT2inG0qi2/z+AhHekOi72yUVMN77deUNuRr7aHRfJU=;
	b=lPuWVVQtkTlI4XC9+TMTzWugwpaDbCjD3fpWz85kNm+5nHeyCZTBXvJxxyb8gINM4t
	lY0L8E2W1SRHhLBK5kz0ZVswiT/G/ab4FIqoXo2qW+EQPydn7JplY/K0uO2DSb7CIg2B
	7VfLRxVHF75c1ZUHLdN45kdAQkSaBtZgsaYHLYFVvD6kS5qyhSksPOeN44FOn2Ie92jL
	RAVcCrWAbvar+d8DDD6ZVC842omt/z54ztMvmBvg9g1Uqjuv0HLnbSgRpj/fdvX7vs6V
	97caFT2BV2jJsWFfHsZJN8j6/lkjxeQKpF7fb+yj1G5I6fDb6qEUsYOmk3/bDDC3yqmH
	OTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RT2inG0qi2/z+AhHekOi72yUVMN77deUNuRr7aHRfJU=;
	b=Ajod2aI1IKd6n0RGdapeYf4NIlAhptkukxhw3/BY5ALV23NjYnNG0A32wxdL1oYoTa
	m1Xt1NB4FjXzGunz+COM0RVNRSvk0KGUOGuADQ3JUAVSxONnLu6Hx1rFPp09z73W1Fwl
	mYrUTVr7IVHts3GZ/t+I/Y6xLJI+OE8vBUo9ohV5fCoOMTIHQlTMBLJYX90X2P5DD2M0
	yGuD2Rx2eoVqaLMba4/6aq7jHC/cEbG58/1ESfkof/w9xk7XoOv/aORiE0yeDIgxcdOG
	lIeyrinpxbyWzuNeA5HfhuwdjAkRq650hKsn/WoG7gIHzQI1Fv5IRQLJSlDTLdfYdATC
	f5VA==
X-Gm-Message-State: AKwxytcayjxbpw5xjdp+BCI0jFJPddp/8PfYJtp+7O2+qi/jp8DnfuGF
	LuNqQbQqZeo2aZ5E+a4uNCI=
X-Received: by 10.237.35.195 with SMTP id k3mr49713350qtc.272.1517418654472;
	Wed, 31 Jan 2018 09:10:54 -0800 (PST)
Received: from [10.17.0.157] ([190.210.239.69])
	by smtp.gmail.com with ESMTPSA id y9sm12871940qti.7.2018.01.31.09.10.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 09:10:54 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-6-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <24dcdefa-51f6-c3c1-61a2-c0f3eff7a800@amsat.org>
Date: Wed, 31 Jan 2018 14:10:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180116013709.13830-6-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: Re: [Qemu-devel] [PATCH v4 05/14] i.MX: Add code to emulate i.MX7
 SNVS IP-block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mUUTy949JSkq

On 01/15/2018 10:37 PM, Andrey Smirnov wrote:
> Add code to emulate SNVS IP-block. Currently only the bits needed to
> be able to emulate machine shutdown are implemented.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/misc/Makefile.objs       |  1 +
>  hw/misc/imx7_snvs.c         | 83 +++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/imx7_snvs.h | 35 +++++++++++++++++++
>  3 files changed, 119 insertions(+)
>  create mode 100644 hw/misc/imx7_snvs.c
>  create mode 100644 include/hw/misc/imx7_snvs.h
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 4b2b705a6c..019886912c 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -35,6 +35,7 @@ obj-$(CONFIG_IMX) += imx6_ccm.o
>  obj-$(CONFIG_IMX) += imx6_src.o
>  obj-$(CONFIG_IMX) += imx7_ccm.o
>  obj-$(CONFIG_IMX) += imx2_wdt.o
> +obj-$(CONFIG_IMX) += imx7_snvs.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>  obj-$(CONFIG_MAINSTONE) += mst_fpga.o
> diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
> new file mode 100644
> index 0000000000..670b9f4639
> --- /dev/null
> +++ b/hw/misc/imx7_snvs.c
> @@ -0,0 +1,83 @@
> +/*
> + * IMX7 Secure Non-Volatile Storage
> + *
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * Bare minimum emulation code needed to support being able to shut
> + * down linux guest gracefully.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/misc/imx7_snvs.h"
> +#include "qemu/log.h"
> +#include "sysemu/sysemu.h"
> +
> +static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void imx7_snvs_write(void *opaque, hwaddr offset,
> +                            uint64_t v, unsigned size)
> +{
> +    const uint32_t value = v;
> +    const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
> +
> +    if (offset == SNVS_LPCR && ((value & mask) == mask)) {
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    }
> +}
> +
> +static const struct MemoryRegionOps imx7_snvs_ops = {
> +    .read = imx7_snvs_read,

Same here, you can remove the imx7_snvs_read() function since
memory_region_dispatch_read() takes care of this and return 0.

> +    .write = imx7_snvs_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        /*
> +         * Our device would not work correctly if the guest was doing
> +         * unaligned access. This might not be a limitation on the real
> +         * device but in practice there is no reason for a guest to access
> +         * this device unaligned.
> +         */
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +        .unaligned = false,
> +    },
> +};
> +
> +static void imx7_snvs_init(Object *obj)
> +{
> +    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
> +    IMX7SNVSState *s = IMX7_SNVS(obj);
> +
> +    memory_region_init_io(&s->mmio, obj, &imx7_snvs_ops, s,
> +                          TYPE_IMX7_SNVS, 0x1000);
> +
> +    sysbus_init_mmio(sd, &s->mmio);
> +}
> +
> +static void imx7_snvs_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc  = "i.MX7 Secure Non-Volatile Storage Module";
> +}
> +
> +static const TypeInfo imx7_snvs_info = {
> +    .name          = TYPE_IMX7_SNVS,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(IMX7SNVSState),
> +    .instance_init = imx7_snvs_init,
> +    .class_init    = imx7_snvs_class_init,
> +};
> +
> +static void imx7_snvs_register_type(void)
> +{
> +    type_register_static(&imx7_snvs_info);
> +}
> +type_init(imx7_snvs_register_type)
> diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
> new file mode 100644
> index 0000000000..255f8f26f9
> --- /dev/null
> +++ b/include/hw/misc/imx7_snvs.h
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * i.MX7 SNVS block emulation code
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef IMX7_SNVS_H
> +#define IMX7_SNVS_H
> +
> +#include "qemu/bitops.h"
> +#include "hw/sysbus.h"
> +
> +
> +enum IMX7SNVSRegisters {
> +    SNVS_LPCR = 0x38,
> +    SNVS_LPCR_TOP   = BIT(6),
> +    SNVS_LPCR_DP_EN = BIT(5)
> +};
> +
> +#define TYPE_IMX7_SNVS "imx7.snvs"
> +#define IMX7_SNVS(obj) OBJECT_CHECK(IMX7SNVSState, (obj), TYPE_IMX7_SNVS)
> +
> +typedef struct IMX7SNVSState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +} IMX7SNVSState;
> +
> +#endif /* IMX7_SNVS_H */
> 
