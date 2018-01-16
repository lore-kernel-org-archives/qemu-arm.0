Received: by 10.28.173.206 with SMTP id w197csp3513915wme;
        Mon, 15 Jan 2018 20:45:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBoslDy15K6T6uUQUr/KlbO8jUj3n0j1Dk3b2ken8Nz4F/fjYwPrchnzwXCw/ZVhrYBzB64Uc
X-Received: by 10.13.230.3 with SMTP id p3mr24642495ywe.137.1516077953814;
        Mon, 15 Jan 2018 20:45:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516077953; cv=none;
        d=google.com; s=arc-20160816;
        b=TdzoyF1ntWjohuKjms2G8kQ+LkyONRaw3ilQahr3ltjY/Oo/BfxuahIgRt2qMZcI9M
         4lk/EJnDlWObic2QyWf5cYM1/AF+kekv+4aKWKfS8SlIn3tXxRibzwR7I3UnWULLWzEu
         oaAPiWbexf2ii2rjv9sqAjSzrFh6QfBq/hP+nZxgyufB4/aweADs9tH/DDpIyCTQs7In
         3zEAh3A3hgjicAA9APCfkNQ3MPNBIMZLGMR5qZOkWdho/zokpdUlMSLyj1zd9e6kpdrP
         KhHMAVtx4QZ6b1rkJjVTM8w+xyUrbBOIiTLYwszzGzmyA9hSerOdvyEsi79Yjq/ji12l
         2acA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=RFE/NRiCZAsh/U13Ra0Xc2MRIY50IP4rS7KUaeVrR+M=;
        b=ZXSZsCA8L2/659wM3iiYUTwiuZd9cmpo/d6PkvPOjJ6uhaRC1F5YjFlYTFFkmJDKj6
         RcRDAJekO1E57A5fwW5nHCD+z5JyiPTtKQe2t9NNS+M/RKs1lhsErN8gpVzHmmLOuRUn
         z07s41ph7m2B61V0K/8cp4uDwnQW8EXEKNbDtzvNDoUic2EwDuLzOnuXzQShS+XTSJvm
         Zu11Mi3LwSyh8ANkmw/DQV+dJrLMF5SXmiA8ceCjxi/aNTDgg/THHlAOQ/zeiO7BN89t
         0AH/cFHvGdexVkkWyFUbRpeNwM3u40nCDx3gY3OZai40b6xKe1jiWJsNozgeOvi8uApL
         +WCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IyzpSsBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u82si294208ywa.639.2018.01.15.20.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 20:45:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IyzpSsBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebJ8D-0006nz-95
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 23:45:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebJ82-0006lr-4L
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 23:45:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebJ80-0003sT-S9
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 23:45:42 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebJ7w-0003rA-4R; Mon, 15 Jan 2018 23:45:36 -0500
Received: by mail-qk0-x243.google.com with SMTP id y80so12863151qkb.4;
	Mon, 15 Jan 2018 20:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RFE/NRiCZAsh/U13Ra0Xc2MRIY50IP4rS7KUaeVrR+M=;
	b=IyzpSsBohpfq5735PjCf8pwi4Pz3cv0gd54HcecdWN240pcHle0ymgxbYGfE53MRim
	VsebOFwxoRX7mGu+gnJSD3uzCsacIMEjn3LdEPMwKrpaUDXUgvaSJ1U34qyvK/Gpsnwk
	2dX7WQlq8EVlIZPe9nQD9Wh6gyqgmuiD5JKbSR0ZZd6wf/hHsWr9CEuMvrNGAC8pK6w0
	YZB7YrWZThXyATRhU+mOxWsyo5EUjYZGXR11lXiBL/O4egXrJPOkaHYIGv5kZFa5cgrL
	o/M7Mrp6yucZkhzz1PwCSlVIYZorqz6UX97V3Oq8ftj/foyaSW/J2adfht/TlE+Pgk+3
	YTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=RFE/NRiCZAsh/U13Ra0Xc2MRIY50IP4rS7KUaeVrR+M=;
	b=HHDqLXJwelNUGamzB0ot1go4zb7J3oNNeV0n0oHt2mGGBniTltqYHbLEQ4XLPkFltW
	coNJJF9r27X9cGlIgUt6WRtVgGp12F/7fQjNtsB+Jy2ikL4sL3Bmzfi1exKXP3TWRql5
	lIwnegVIZqo7ZtsuTSyskb0nCYUdi16SQLxMGasA3HH9JlMwVz6tjUDRa8788rUabjPR
	Y2FQ830FG9ienwu9meKtJ2hiNBHA7VNrpAhQqUpCvcbfzgzAykwZndLbb42WYz0nkDd6
	S+Wj0AnxP4GmpX5ECwfLK1UegcX+RTEarPzricSgRgeG5YEK9hsCezNeIzdrZeeF4RpX
	4b/A==
X-Gm-Message-State: AKwxytc71OKDM//mXs+YesMv5pJKMYss9ENini9kSU3PvFuGkp4bikxt
	Yl2OEGhThCp++19a2bJ4JmQ=
X-Received: by 10.55.108.71 with SMTP id h68mr17410085qkc.28.1516077935517;
	Mon, 15 Jan 2018 20:45:35 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	y140sm817606qkb.37.2018.01.15.20.45.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 20:45:34 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-9-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ebab631b-7d14-dd9a-8e81-e76830bfda02@amsat.org>
Date: Tue, 16 Jan 2018 01:45:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180116013709.13830-9-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v4 08/14] i.MX: Add implementation of i.MX7
 GPR IP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: el0IZ0brw9kp

On 01/15/2018 10:37 PM, Andrey Smirnov wrote:
> Add minimal code needed to allow upstream Linux guest to boot.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/misc/Makefile.objs      |   1 +
>  hw/misc/imx7_gpr.c         | 119 +++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/imx7_gpr.h |  28 +++++++++++
>  3 files changed, 148 insertions(+)
>  create mode 100644 hw/misc/imx7_gpr.c
>  create mode 100644 include/hw/misc/imx7_gpr.h
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 019886912c..fce426eb75 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -36,6 +36,7 @@ obj-$(CONFIG_IMX) += imx6_src.o
>  obj-$(CONFIG_IMX) += imx7_ccm.o
>  obj-$(CONFIG_IMX) += imx2_wdt.o
>  obj-$(CONFIG_IMX) += imx7_snvs.o
> +obj-$(CONFIG_IMX) += imx7_gpr.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>  obj-$(CONFIG_MAINSTONE) += mst_fpga.o
> diff --git a/hw/misc/imx7_gpr.c b/hw/misc/imx7_gpr.c
> new file mode 100644
> index 0000000000..9e8ccea9e8
> --- /dev/null
> +++ b/hw/misc/imx7_gpr.c
> @@ -0,0 +1,119 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * i.MX7 GPR IP block emulation code
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
> +#include "hw/misc/imx7_gpr.h"
> +#include "qemu/log.h"
> +#include "sysemu/sysemu.h"
> +
> +enum IMX7GPRRegisters {
> +    IOMUXC_GPR0  = 0x00,
> +    IOMUXC_GPR1  = 0x04,
> +    IOMUXC_GPR2  = 0x08,
> +    IOMUXC_GPR3  = 0x0c,
> +    IOMUXC_GPR4  = 0x10,
> +    IOMUXC_GPR5  = 0x14,
> +    IOMUXC_GPR6  = 0x18,
> +    IOMUXC_GPR7  = 0x1c,
> +    IOMUXC_GPR8  = 0x20,
> +    IOMUXC_GPR9  = 0x24,
> +    IOMUXC_GPR10 = 0x28,
> +    IOMUXC_GPR11 = 0x2c,
> +    IOMUXC_GPR12 = 0x30,
> +    IOMUXC_GPR13 = 0x34,
> +    IOMUXC_GPR14 = 0x38,
> +    IOMUXC_GPR15 = 0x3c,
> +    IOMUXC_GPR16 = 0x40,
> +    IOMUXC_GPR17 = 0x44,
> +    IOMUXC_GPR18 = 0x48,
> +    IOMUXC_GPR19 = 0x4c,
> +    IOMUXC_GPR20 = 0x50,
> +    IOMUXC_GPR21 = 0x54,
> +    IOMUXC_GPR22 = 0x58,
> +};
> +
> +#define IMX7D_GPR1_IRQ_MASK                 BIT(12)
> +#define IMX7D_GPR1_ENET1_TX_CLK_SEL_MASK    BIT(13)
> +#define IMX7D_GPR1_ENET2_TX_CLK_SEL_MASK    BIT(14)
> +#define IMX7D_GPR1_ENET_TX_CLK_SEL_MASK     (0x3 << 13)
> +#define IMX7D_GPR1_ENET1_CLK_DIR_MASK       BIT(17)
> +#define IMX7D_GPR1_ENET2_CLK_DIR_MASK       BIT(18)
> +#define IMX7D_GPR1_ENET_CLK_DIR_MASK        (0x3 << 17)
> +
> +#define IMX7D_GPR5_CSI_MUX_CONTROL_MIPI     BIT(4)
> +#define IMX7D_GPR12_PCIE_PHY_REFCLK_SEL     BIT(5)
> +#define IMX7D_GPR22_PCIE_PHY_PLL_LOCKED     BIT(31)
> +
> +
> +static uint64_t imx7_gpr_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    if (offset == IOMUXC_GPR22) {
> +        return IMX7D_GPR22_PCIE_PHY_PLL_LOCKED;
> +    }
> +
> +    return 0;
> +}
> +
> +static void imx7_gpr_write(void *opaque, hwaddr offset,
> +                           uint64_t v, unsigned size)
> +{

If you ever respin, please add a trace point here (just copy/paste from
another file from the same directory), and in the read() function.

Linux will evolve and use more registers from this device (and the other
devices you are modelling), and a Linux driver busy loop is likely to
hang QEMU. A trace event will ease your board next user soon :)

That said,

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +}
> +
> +static const struct MemoryRegionOps imx7_gpr_ops = {
> +    .read = imx7_gpr_read,
> +    .write = imx7_gpr_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        /*
> +         * Our device would not work correctly if the guest was doing
> +         * unaligned access. This might not be a limitation on the
> +         * real device but in practice there is no reason for a guest
> +         * to access this device unaligned.
> +         */
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +        .unaligned = false,
> +    },
> +};
> +
> +static void imx7_gpr_init(Object *obj)
> +{
> +    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
> +    IMX7GPRState *s = IMX7_GPR(obj);
> +
> +    memory_region_init_io(&s->mmio, obj, &imx7_gpr_ops, s,
> +                          TYPE_IMX7_GPR, 64 * 1024);
> +    sysbus_init_mmio(sd, &s->mmio);
> +}
> +
> +static void imx7_gpr_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc  = "i.MX7 General Purpose Registers Module";
> +}
> +
> +static const TypeInfo imx7_gpr_info = {
> +    .name          = TYPE_IMX7_GPR,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(IMX7GPRState),
> +    .instance_init = imx7_gpr_init,
> +    .class_init    = imx7_gpr_class_init,
> +};
> +
> +static void imx7_gpr_register_type(void)
> +{
> +    type_register_static(&imx7_gpr_info);
> +}
> +type_init(imx7_gpr_register_type)
> diff --git a/include/hw/misc/imx7_gpr.h b/include/hw/misc/imx7_gpr.h
> new file mode 100644
> index 0000000000..e19373d274
> --- /dev/null
> +++ b/include/hw/misc/imx7_gpr.h
> @@ -0,0 +1,28 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * i.MX7 GPR IP block emulation code
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef IMX7_GPR_H
> +#define IMX7_GPR_H
> +
> +#include "qemu/bitops.h"
> +#include "hw/sysbus.h"
> +
> +#define TYPE_IMX7_GPR "imx7.gpr"
> +#define IMX7_GPR(obj) OBJECT_CHECK(IMX7GPRState, (obj), TYPE_IMX7_GPR)
> +
> +typedef struct IMX7GPRState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +} IMX7GPRState;
> +
> +#endif /* IMX7_GPR_H */
> 
