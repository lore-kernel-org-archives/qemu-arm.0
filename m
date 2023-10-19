Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp346068ejb;
        Thu, 19 Oct 2023 01:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzxfDM3DEye8jstErnonetBvHbEUx3wns2htNVA2AQYoTAHSPT7JS5/ekPxOp7YHolJhV8
X-Received: by 2002:a05:622a:14c7:b0:417:f85b:5a5a with SMTP id u7-20020a05622a14c700b00417f85b5a5amr1567894qtx.5.1697702647105;
        Thu, 19 Oct 2023 01:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697702647; cv=none;
        d=google.com; s=arc-20160816;
        b=IWgtj0hYpsLTueyGQB+5XPu3/91oJKdEx3+WhDadlvHDTNogAq/HScJmAz82A/xIN6
         SSF9uU51Q9nBlW9CsDCGVs/SZGcEpjwjKCMI654Lv9Ps9r7Kj/2aasLeCXPFbefxHhSu
         xol+B0qy4tBDmkTNoQA4iztlkWw5wqIoNAVffGtRZfseN1EPQXf7XsDv3mcHKuZf3FlS
         q6VpfaQsd6N1CnfinSrNC4RuByRWm4AyPWzE4hz7n1wwV+TOC3fDnRYVbTOcHbg4so6G
         Cmde83/SEC7pVMVp05V7F7EAjn+quK0Y92uyLopsAm8TxpSx5vHERaYIjPDeSnhMgoHz
         Q6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=T4AqWwiad5P0KfSm5/F6yk4N5Xup2Jk1c9JH5xAhyQ4=;
        fh=mIJGsCCezl/E0qHOjEsRVAduFTIo6OTQPvroE0vb+p0=;
        b=Zmpmjgm3vtv386D/WFKg++B5TVkkoTO6ubtb5GXN4WsSikqbhIN6Vl17UAuwjGUwu5
         nEwVllK+3pWUBM2UPC1maf/tdaDgs/qsD53b1Np7G1v4LgPGeDR7+AoIhxXqAgGomhRj
         4C/bRkIayqnQBGSiKemTYFnFx7jCll3woY94iqsVLCZ4GHzew89z8j6U5RJgcwnWQTHT
         j3ahR7NRnoIafVRcVq+9+mqo6LWI6G2EnPOZj700vThrz+pyZ5TaVFX01dxCFOd+qLc0
         O37bsyyy2IhDzaYJsP6tbaSEv+1guGGI4j8D1HnMfy6TxLjda5l7bv88rm4E+hDW6hjZ
         Yf4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05622a00d500b004179ca2f158si1172174qtw.355.2023.10.19.01.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 01:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtO0S-000468-95; Thu, 19 Oct 2023 04:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=PA0m=GB=kaod.org=clg@ozlabs.org>)
 id 1qtO0Q-00045U-Br; Thu, 19 Oct 2023 04:03:46 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=PA0m=GB=kaod.org=clg@ozlabs.org>)
 id 1qtO0N-0006xa-V9; Thu, 19 Oct 2023 04:03:46 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SB0bK0zgkz4xdy;
 Thu, 19 Oct 2023 19:03:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SB0bF52sBz4x80;
 Thu, 19 Oct 2023 19:03:37 +1100 (AEDT)
Message-ID: <99d8e47e-ef22-4f0b-bae5-750a2d1b6970@kaod.org>
Date: Thu, 19 Oct 2023 10:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hw/fsi: Introduce IBM's Local bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
 <20231011151339.2782132-2-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231011151339.2782132-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=PA0m=GB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ulLuNGDpdyVh

On 10/11/23 17:13, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The LBUS is modelled to maintain the qdev bus hierarchy and to take
> advantage of the object model to automatically generate the CFAM
> configuration block. The configuration block presents engines in the
> order they are attached to the CFAM's LBUS. Engine implementations
> should subclass the LBusDevice and set the 'config' member of
> LBusDeviceClass to match the engine's type.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> v2:
> - Incorporated Joel's review comments.
> v5:
> - Incorporated review comments by Cedric.
> ---
>   include/hw/fsi/lbus.h | 51 +++++++++++++++++++++++++
>   include/qemu/bitops.h |  6 +++
>   hw/fsi/lbus.c         | 87 +++++++++++++++++++++++++++++++++++++++++++
>   hw/Kconfig            |  1 +
>   hw/fsi/Kconfig        |  2 +
>   hw/fsi/meson.build    |  1 +
>   hw/meson.build        |  1 +
>   7 files changed, 149 insertions(+)
>   create mode 100644 include/hw/fsi/lbus.h
>   create mode 100644 hw/fsi/lbus.c
>   create mode 100644 hw/fsi/Kconfig
>   create mode 100644 hw/fsi/meson.build
> 
> diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
> new file mode 100644
> index 0000000000..408fe25831
> --- /dev/null
> +++ b/include/hw/fsi/lbus.h
> @@ -0,0 +1,51 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM Local bus and connected device structures.
> + */
> +#ifndef FSI_LBUS_H
> +#define FSI_LBUS_H
> +
> +#include "exec/memory.h"
> +#include "hw/qdev-core.h"
> +
> +#define TYPE_FSI_LBUS_DEVICE "fsi.lbus.device"
> +OBJECT_DECLARE_TYPE(FSILBusDevice, FSILBusDeviceClass, FSI_LBUS_DEVICE)
> +
> +#define FSI_LBUS_MEM_REGION_SIZE  (2 * 1024 * 1024)
> +#define FSI_LBUSDEV_IOMEM_SIZE    0x400
> +
> +typedef struct FSILBusDevice {
> +    DeviceState parent;
> +
> +    MemoryRegion iomem;
> +    uint32_t address;
> +} FSILBusDevice;
> +
> +typedef struct FSILBusDeviceClass {
> +    DeviceClass parent;
> +
> +    uint32_t config;
> +} FSILBusDeviceClass;
> +
> +typedef struct FSILBusNode {
> +    FSILBusDevice *ldev;
> +
> +    QLIST_ENTRY(FSILBusNode) next;
> +} FSILBusNode;
> +
> +#define TYPE_FSI_LBUS "fsi.lbus"
> +OBJECT_DECLARE_SIMPLE_TYPE(FSILBus, FSI_LBUS)
> +
> +typedef struct FSILBus {
> +    BusState bus;
> +
> +    MemoryRegion mr;
> +
> +    QLIST_HEAD(, FSILBusNode) devices;
> +} FSILBus;
> +
> +DeviceState *lbus_create_device(FSILBus *bus, const char *type, uint32_t addr);
> +int lbus_add_device(FSILBus *bus, FSILBusDevice *dev);
> +#endif /* FSI_LBUS_H */
> diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> index cb3526d1f4..e12496f619 100644
> --- a/include/qemu/bitops.h
> +++ b/include/qemu/bitops.h
> @@ -618,4 +618,10 @@ static inline uint64_t half_unshuffle64(uint64_t x)
>       return x;
>   }
>   
> +/* Bitwise operations at the word level. */
> +#define BE_BIT(x)                          BIT(31 - (x))
> +#define GENMASK(t, b) \
> +    (((1ULL << ((t) + 1)) - 1) & ~((1ULL << (b)) - 1))
> +#define BE_GENMASK(t, b)                   GENMASK(BE_BIT(t), BE_BIT(b))
> +
>   #endif
> diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
> new file mode 100644
> index 0000000000..d7117d1299
> --- /dev/null
> +++ b/hw/fsi/lbus.c
> @@ -0,0 +1,87 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM Local bus where FSI slaves are connected
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/fsi/lbus.h"
> +
> +#include "hw/qdev-properties.h"
> +
> +static void lbus_realize(BusState *bus, Error **errp)
> +{
> +    FSILBusNode *node;
> +    FSILBus *lbus = FSI_LBUS(bus);
> +
> +    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_FSI_LBUS,
> +                       FSI_LBUS_MEM_REGION_SIZE - FSI_LBUSDEV_IOMEM_SIZE);

the region init should be done in an init handler (this to avoid the realize
of the bus)

> +
> +    QLIST_FOREACH(node, &lbus->devices, next) {
> +        memory_region_add_subregion(&lbus->mr, node->ldev->address,
> +                                    &node->ldev->iomem);

This is redudant with what is done in cfam_realize() and please
remove this list, also redudant with the bus list.

Thanks,

C.

> +    }
> +}
> +
> +static void lbus_class_init(ObjectClass *klass, void *data)
> +{
> +    BusClass *k = BUS_CLASS(klass);
> +    k->realize = lbus_realize;
> +}
> +
> +static const TypeInfo lbus_info = {
> +    .name = TYPE_FSI_LBUS,
> +    .parent = TYPE_BUS,
> +    .instance_size = sizeof(FSILBus),
> +    .class_init = lbus_class_init,
> +};
> +
> +static Property lbus_device_props[] = {
> +    DEFINE_PROP_UINT32("address", FSILBusDevice, address, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +DeviceState *lbus_create_device(FSILBus *bus, const char *type, uint32_t addr)
> +{
> +    DeviceState *dev;
> +    FSILBusNode *node;
> +    BusState *state = BUS(bus);
> +
> +    dev = qdev_new(type);
> +    qdev_prop_set_uint8(dev, "address", addr);
> +    qdev_realize_and_unref(dev, state, &error_fatal);
> +
> +    /* Move to post_load */
> +    node = g_malloc(sizeof(struct FSILBusNode));
> +    node->ldev = FSI_LBUS_DEVICE(dev);
> +    QLIST_INSERT_HEAD(&bus->devices, node, next);
> +
> +    return dev;
> +}
> +
> +static void lbus_device_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->bus_type = TYPE_FSI_LBUS;
> +    device_class_set_props(dc, lbus_device_props);
> +}
> +
> +static const TypeInfo lbus_device_type_info = {
> +    .name = TYPE_FSI_LBUS_DEVICE,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(FSILBusDevice),
> +    .abstract = true,
> +    .class_init = lbus_device_class_init,
> +    .class_size = sizeof(FSILBusDeviceClass),
> +};
> +
> +static void lbus_register_types(void)
> +{
> +    type_register_static(&lbus_info);
> +    type_register_static(&lbus_device_type_info);
> +}
> +
> +type_init(lbus_register_types);
> diff --git a/hw/Kconfig b/hw/Kconfig
> index ba62ff6417..2ccb73add5 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -9,6 +9,7 @@ source core/Kconfig
>   source cxl/Kconfig
>   source display/Kconfig
>   source dma/Kconfig
> +source fsi/Kconfig
>   source gpio/Kconfig
>   source hyperv/Kconfig
>   source i2c/Kconfig
> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
> new file mode 100644
> index 0000000000..e650c660f0
> --- /dev/null
> +++ b/hw/fsi/Kconfig
> @@ -0,0 +1,2 @@
> +config FSI_LBUS
> +    bool
> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
> new file mode 100644
> index 0000000000..4074d3a7d2
> --- /dev/null
> +++ b/hw/fsi/meson.build
> @@ -0,0 +1 @@
> +system_ss.add(when: 'CONFIG_FSI_LBUS', if_true: files('lbus.c'))
> diff --git a/hw/meson.build b/hw/meson.build
> index c7ac7d3d75..6c71ee9cfa 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -43,6 +43,7 @@ subdir('virtio')
>   subdir('watchdog')
>   subdir('xen')
>   subdir('xenpv')
> +subdir('fsi')
>   
>   subdir('alpha')
>   subdir('arm')

