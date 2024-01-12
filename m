Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2421914ejs;
        Fri, 12 Jan 2024 07:03:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVa1O6NgGb8C/3df2mSwN01NExruu61X53esOcO0nhrcn8kNmw5g3PO/4MbyMNsSoIFjtK
X-Received: by 2002:a05:6830:11d0:b0:6dc:7f:1279 with SMTP id v16-20020a05683011d000b006dc007f1279mr1661830otq.58.1705071833608;
        Fri, 12 Jan 2024 07:03:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705071833; cv=none;
        d=google.com; s=arc-20160816;
        b=STBuxfWad4BiGdFJx4b25eQMl8bKLGmZzdNSTR8sjypdjYOZsYwtcPAZGo0os+fUXS
         KTcJ1+v3EbzrFKkdiaWyLjWi6jA5+g0Wx3jRZOGANYYrjagFYq7g/x1OJQiHxVo9pJ8G
         Mcz/il0f70YmAObBvg8cu8gMXpk2T2Dr3LZoy4rxcwXJB54NYcxsupM6TL43dOk3NJgY
         rojAkjgXaQf4tvZkyhT8oPmmFuuaUWDKfqgLCFPkxDGJdZVfZNAwsFN4jD0zCaiyV3nT
         zmGhtN7BQffp2tAzBh04567lmQMPKQVTthlHOFqvJ73bUb8Ckgr3sVKAaaIGuIXgF9yD
         tYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=m8a8l+Vtk5ncVZyFqCHhbPkmPsqSff4vcT0hFL3cpdU=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=j5yhhKQoGC6Ptl4kpvporUexjASqLdaUBsOOYb2PpCYm1bl5/0rN8y1i/Kpq2QDGaI
         Ym03idep+CebrLAc0ySrJWBLVs3rdKZXww+bwsgetDo/C5Dlyax6HCkBoYeLbvZPO8F1
         3Bcr87pU2oQqBSLefNAWd9mTPrvWpnVEijv75v0AF0q/dYugKnHzM4AKklZ6+b8mNiNo
         D/EBvTn09lvitj3Df7WK5sXQVF2jgIoxPf4G5I/Nm0itMVDalWjaODhJihyc4fLIypXS
         UCOlUNn6JZkyhjlTTXA8RDzxMCaXfDiMV2uC+r+e53v6CLrXNaXSgnwY8hZnCxxVBSRv
         0MRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id db21-20020a056130239500b007cda025d377si553498uab.96.2024.01.12.07.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jan 2024 07:03:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOJ49-0006lP-KV; Fri, 12 Jan 2024 10:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qInK=IW=kaod.org=clg@ozlabs.org>)
 id 1rOJ48-0006kw-OR; Fri, 12 Jan 2024 10:03:24 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qInK=IW=kaod.org=clg@ozlabs.org>)
 id 1rOJ43-0002T1-UX; Fri, 12 Jan 2024 10:03:24 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TBPt31CLtz4x5q;
 Sat, 13 Jan 2024 02:03:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TBPsz49vwz4x5l;
 Sat, 13 Jan 2024 02:03:03 +1100 (AEDT)
Message-ID: <aded5ed9-bdf5-4ee0-a213-aba7c1dcd74c@kaod.org>
Date: Fri, 12 Jan 2024 16:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/9] hw/fsi: Introduce IBM's FSI Bus and FSI slave
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240110231537.1654478-1-ninad@linux.ibm.com>
 <20240110231537.1654478-3-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240110231537.1654478-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=qInK=IW=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 84Qasyn0uQEg

On 1/11/24 00:15, Ninad Palsule wrote:
> This is a part of patchset where FSI bus is introduced.
> 
> The FSI bus is a simple bus where FSI master is attached.
> 
> The FSI slave: The slave is the terminal point of the FSI bus for
> FSI symbols addressed to it. Slaves can be cascaded off of one
> another. The slave's configuration registers appear in address space
> of the CFAM to which it is attached.

Please add another patch.

> [ clg: - removed include/hw/fsi/engine-scratchpad.h and
>         	 hw/fsi/engine-scratchpad.c
>         - dropped FSI_SCRATCHPAD
>         - included FSIBus definition
>         - dropped hw/fsi/trace-events changes ]

Move the list down before my S-o-b.

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   include/hw/fsi/fsi.h |  38 +++++++++++++++
>   hw/fsi/fsi.c         | 111 +++++++++++++++++++++++++++++++++++++++++++
>   hw/fsi/meson.build   |   2 +-
>   hw/fsi/trace-events  |   2 +
>   4 files changed, 152 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/fsi/fsi.h
>   create mode 100644 hw/fsi/fsi.c
> 
> diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
> new file mode 100644
> index 0000000000..6e11747dd5
> --- /dev/null
> +++ b/include/hw/fsi/fsi.h
> @@ -0,0 +1,38 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 IBM Corp.
> + *
> + * IBM Flexible Service Interface
> + */
> +#ifndef FSI_FSI_H
> +#define FSI_FSI_H
> +
> +#include "exec/memory.h"
> +#include "hw/qdev-core.h"
> +#include "hw/fsi/lbus.h"
> +#include "qemu/bitops.h"
> +
> +/* Bitwise operations at the word level. */
> +#define BE_BIT(x)           BIT(31 - (x))
> +#define BE_GENMASK(hb, lb)  MAKE_64BIT_MASK((lb), ((hb) - (lb) + 1))
> +
> +#define TYPE_FSI_BUS "fsi.bus"
> +OBJECT_DECLARE_SIMPLE_TYPE(FSIBus, FSI_BUS)
> +
> +typedef struct FSIBus {
> +    BusState bus;
> +} FSIBus;
> +
> +#define TYPE_FSI_SLAVE "fsi.slave"
> +OBJECT_DECLARE_SIMPLE_TYPE(FSISlaveState, FSI_SLAVE)
> +
> +#define FSI_SLAVE_CONTROL_NR_REGS ((0x40 >> 2) + 1)
> +
> +typedef struct FSISlaveState {
> +    DeviceState parent;
> +
> +    MemoryRegion iomem;
> +    uint32_t regs[FSI_SLAVE_CONTROL_NR_REGS];
> +} FSISlaveState;
> +
> +#endif /* FSI_FSI_H */
> diff --git a/hw/fsi/fsi.c b/hw/fsi/fsi.c
> new file mode 100644
> index 0000000000..0c73ca14ad
> --- /dev/null
> +++ b/hw/fsi/fsi.c
> @@ -0,0 +1,111 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 IBM Corp.
> + *
> + * IBM Flexible Service Interface
> + */
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +
> +#include "hw/fsi/fsi.h"
> +
> +static const TypeInfo fsi_bus_info = {
> +    .name = TYPE_FSI_BUS,
> +    .parent = TYPE_BUS,
> +    .instance_size = sizeof(FSIBus),
> +};
> +
> +static void fsi_bus_register_types(void)
> +{
> +    type_register_static(&fsi_bus_info);
> +}
> +
> +type_init(fsi_bus_register_types);
> +
> +#define TO_REG(x)                               ((x) >> 2)
> +
> +static uint64_t fsi_slave_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    FSISlaveState *s = FSI_SLAVE(opaque);
> +    int reg = TO_REG(addr);
> +
> +    trace_fsi_slave_read(addr, size);
> +
> +    if (reg >= FSI_SLAVE_CONTROL_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out of bounds read: 0x%"HWADDR_PRIx" for %u\n",
> +                      __func__, addr, size);
> +        return 0;
> +    }
> +
> +    return s->regs[reg];
> +}
> +
> +static void fsi_slave_write(void *opaque, hwaddr addr, uint64_t data,
> +                                 unsigned size)
> +{
> +    FSISlaveState *s = FSI_SLAVE(opaque);
> +    int reg = TO_REG(addr);
> +
> +    trace_fsi_slave_write(addr, size, data);
> +
> +    if (reg >= FSI_SLAVE_CONTROL_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out of bounds write: 0x%"HWADDR_PRIx" for %u\n",
> +                      __func__, addr, size);
> +        return;
> +    }
> +
> +    s->regs[reg] = data;
> +}
> +
> +static const struct MemoryRegionOps fsi_slave_ops = {
> +    .read = fsi_slave_read,
> +    .write = fsi_slave_write,
> +    .endianness = DEVICE_BIG_ENDIAN,
> +};
> +
> +static void fsi_slave_reset(DeviceState *dev)
> +{
> +    FSISlaveState *s = FSI_SLAVE(dev);
> +    int i;
> +
> +    /* Initialize registers */
> +    for (i = 0; i < FSI_SLAVE_CONTROL_NR_REGS; i++) {
> +        s->regs[i] = 0;
> +    }

memset(s->regs, 0, sizeof(s->regs));


> +}
> +
> +static void fsi_slave_init(Object *o)
> +{
> +    FSISlaveState *s = FSI_SLAVE(o);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &fsi_slave_ops,
> +                          s, TYPE_FSI_SLAVE, 0x400);
> +}
> +
> +static void fsi_slave_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->bus_type = TYPE_FSI_BUS;
> +    dc->desc = "FSI Slave";
> +    dc->reset = fsi_slave_reset;
> +}
> +
> +static const TypeInfo fsi_slave_info = {
> +    .name = TYPE_FSI_SLAVE,
> +    .parent = TYPE_DEVICE,
> +    .instance_init = fsi_slave_init,
> +    .instance_size = sizeof(FSISlaveState),
> +    .class_init = fsi_slave_class_init,
> +};
> +
> +static void fsi_slave_register_types(void)
> +{
> +    type_register_static(&fsi_slave_info);
> +}
> +
> +type_init(fsi_slave_register_types);
> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
> index 93ba19dd04..574f5f9289 100644
> --- a/hw/fsi/meson.build
> +++ b/hw/fsi/meson.build
> @@ -1 +1 @@
> -system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c'))
> +system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c','fsi.c'))
> diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
> index c5753e2791..8f29adb7df 100644
> --- a/hw/fsi/trace-events
> +++ b/hw/fsi/trace-events
> @@ -1,2 +1,4 @@
>   fsi_scratchpad_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
>   fsi_scratchpad_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
> +fsi_slave_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
> +fsi_slave_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64

