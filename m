Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1201677ejt;
        Mon, 27 Nov 2023 08:24:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVdtHXxjrMaYYYvpbevDQZlugbirbvejXD9DIvm1kfWVUG0PqzWePfvxffYDfqGhipPL0g
X-Received: by 2002:ac8:5b8b:0:b0:410:9668:530a with SMTP id a11-20020ac85b8b000000b004109668530amr20755159qta.21.1701102246813;
        Mon, 27 Nov 2023 08:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701102246; cv=none;
        d=google.com; s=arc-20160816;
        b=tqzkWlGSMFLiXV5kuNz1kjTEobn6Jw0LQynWzXuLUs6sPpQg5utT+tzlBa/byRcr7v
         dTwKs12UCYfIDF6tnZxz6eNsVA+pUpwoOk/BUmzTObtg4Sq8Z+e41G4tpXbMLRbmTvF8
         9cH1X3cvMIrGRpHF6OvJgBP8kuRI6gSVOfxI/vBwN7Uy4GD2DjcCulHRiVp8rqvoI0cu
         6ULkOff7RIlxVLzzdaIvc012U6+9xDaiRkaxXVflD39cCc2H6q3a6bQnVwiEm2OyyISn
         sybx2leCQPpQFBkRL3FavaoevX0bCRKIlTlsCGO7OBlnfkRnlLICGjnB+GTlUJNLKhue
         4bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=5XEScOscOr397B6ihRhQNPMva7m4c7j8oAeRnN02YBY=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=nV01Edp9snPVA7yZ067b456kNIv9LIJ+BMQ8iSAuSuSkw7y1KCAR8f1e7hIefcnbUy
         TmmOU7uVJCZjxUtY5LB5zPmuZD0wu+HSQlypysjoj56jbfqqz+2s98mnrE17ZmLS5r34
         QOTYWt6XhF6Lo1E2ThkUuxFZ3xicLq3cxxNr8POJzpq0egbRXaS4DCa9HyD1AFGnUr2y
         lYpDyDvHvkVTwTNhv4S3XXFcQfDdalrVGMSwvRUb7xM1kYzhiz7DXnf5unHoWOBSdRx6
         hxoAGurkEhSq/jvIuT0zUv48WtZnnc5SAa7p/AVoVbDqtUDvtgmKfWwLAFYxTlV39CrS
         m5BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020ac84ccf000000b00423c17c188fsi2432779qtv.664.2023.11.27.08.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 08:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7eOj-00046Y-Gw; Mon, 27 Nov 2023 11:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5Qwu=HI=kaod.org=clg@ozlabs.org>)
 id 1r7eOi-000463-52; Mon, 27 Nov 2023 11:23:48 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5Qwu=HI=kaod.org=clg@ozlabs.org>)
 id 1r7eOf-0004zp-Ti; Mon, 27 Nov 2023 11:23:47 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sf9rG06JYz4xR5;
 Tue, 28 Nov 2023 03:23:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sf9r727Q0z4wcJ;
 Tue, 28 Nov 2023 03:23:34 +1100 (AEDT)
Message-ID: <6f8aede9-26ac-4921-8803-8eb1a74a48c0@kaod.org>
Date: Mon, 27 Nov 2023 17:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] hw/fsi: IBM's On-chip Peripheral Bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20231026164741.1184058-1-ninad@linux.ibm.com>
 <20231026164741.1184058-6-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231026164741.1184058-6-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5Qwu=HI=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: aCdQNQw0kdT6

On 10/26/23 18:47, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in
> POWER processors. This now makes an appearance in the ASPEED SoC due
> to tight integration of the FSI master IP with the OPB, mainly the
> existence of an MMIO-mapping of the CFAM address straight onto a
> sub-region of the OPB address space.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
> - Incorporated review comment by Joel.
> v5:
> - Incorporated review comments by Cedric.
> v6:
> - Incorporated review comments by Cedric & Daniel
> v7:
> - Incorporated review comments by Cedric.
> ---
>   include/hw/fsi/opb.h | 33 ++++++++++++++++++++
>   hw/fsi/fsi-master.c  |  3 +-
>   hw/fsi/opb.c         | 74 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/fsi/Kconfig       |  4 +++
>   hw/fsi/meson.build   |  1 +
>   5 files changed, 113 insertions(+), 2 deletions(-)
>   create mode 100644 include/hw/fsi/opb.h
>   create mode 100644 hw/fsi/opb.c
> 
> diff --git a/include/hw/fsi/opb.h b/include/hw/fsi/opb.h
> new file mode 100644
> index 0000000000..8b71bb55c2
> --- /dev/null
> +++ b/include/hw/fsi/opb.h
> @@ -0,0 +1,33 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM On-Chip Peripheral Bus
> + */
> +#ifndef FSI_OPB_H
> +#define FSI_OPB_H
> +
> +#include "exec/memory.h"
> +#include "hw/fsi/fsi-master.h"
> +
> +#define TYPE_OP_BUS "opb"
> +OBJECT_DECLARE_SIMPLE_TYPE(OPBus, OP_BUS)
> +
> +typedef struct OPBus {
> +        /*< private >*/
> +        BusState bus;
> +
> +        /*< public >*/
> +        MemoryRegion mr;
> +        AddressSpace as;
> +
> +        /* Model OPB as dumb enough just to provide an address-space */
> +        /* TODO: Maybe don't store device state in the bus? */
> +        FSIMasterState fsi;

Please remove. FSIMasterState should be introduced later.

> +} OPBus;
> +
> +typedef struct OPBusClass {
> +        BusClass parent_class;
> +} OPBusClass;
> +
> +#endif /* FSI_OPB_H */
> diff --git a/hw/fsi/fsi-master.c b/hw/fsi/fsi-master.c
> index bb7a893003..ec092b42ea 100644
> --- a/hw/fsi/fsi-master.c
> +++ b/hw/fsi/fsi-master.c
> @@ -11,8 +11,7 @@
>   #include "trace.h"
>   
>   #include "hw/fsi/fsi-master.h"
> -
> -#define TYPE_OP_BUS "opb"
> +#include "hw/fsi/opb.h"

ouch.

This is an ugly hack because the modeling is broken. OPB should be introduced
before tFSIMasterState.


>   #define TO_REG(x)                               ((x) >> 2)
>   
> diff --git a/hw/fsi/opb.c b/hw/fsi/opb.c
> new file mode 100644
> index 0000000000..04771b4b27
> --- /dev/null
> +++ b/hw/fsi/opb.c
> @@ -0,0 +1,74 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM On-chip Peripheral Bus
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +
> +#include "hw/fsi/opb.h"
> +
> +static void fsi_opb_realize(BusState *bus, Error **errp)
> +{
> +    OPBus *opb = OP_BUS(bus);
> +
> +    memory_region_init_io(&opb->mr, OBJECT(opb), NULL, opb,
> +                          NULL, UINT32_MAX);
> +    address_space_init(&opb->as, &opb->mr, "opb");

Please keep the above and put it in a instance_init handler and remove
the rest. It should go under AspeedAPB2OPBState.

> +
> +    if (!object_property_set_bool(OBJECT(&opb->fsi), "realized", true, errp)) {
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&opb->mr, 0x80000000, &opb->fsi.iomem);
> +
> +    /* OPB2FSI region */
> +    /*
> +     * Avoid endianness issues by mapping each slave's memory region directly.
> +     * Manually bridging multiple address-spaces causes endian swapping
> +     * headaches as memory_region_dispatch_read() and
> +     * memory_region_dispatch_write() correct the endianness based on the
> +     * target machine endianness and not relative to the device endianness on
> +     * either side of the bridge.
> +     */
> +    /*
> +     * XXX: This is a bit hairy and will need to be fixed when I sort out the
> +     * bus/slave relationship and any changes to the CFAM modelling (multiple
> +     * slaves, LBUS)
> +     */
> +    memory_region_add_subregion(&opb->mr, 0xa0000000, &opb->fsi.opb2fsi);
> +}
> +
> +static void fsi_opb_init(Object *o)
> +{
> +    OPBus *opb = OP_BUS(o);
> +
> +    object_initialize_child(o, "fsi-master", &opb->fsi, TYPE_FSI_MASTER);
> +    qdev_set_parent_bus(DEVICE(&opb->fsi), BUS(o), &error_abort);
> +}

Drop all of the above.


Thanks,

C.



> +
> +static void fsi_opb_class_init(ObjectClass *klass, void *data)
> +{
> +    BusClass *bc = BUS_CLASS(klass);
> +    bc->realize = fsi_opb_realize;
> +}
> +
> +static const TypeInfo opb_info = {
> +    .name = TYPE_OP_BUS,
> +    .parent = TYPE_BUS,
> +    .instance_init = fsi_opb_init,
> +    .instance_size = sizeof(OPBus),
> +    .class_init = fsi_opb_class_init,
> +    .class_size = sizeof(OPBusClass),
> +};
> +
> +static void fsi_opb_register_types(void)
> +{
> +    type_register_static(&opb_info);
> +}
> +
> +type_init(fsi_opb_register_types);
> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
> index 8d712e77ed..0f6e6d331a 100644
> --- a/hw/fsi/Kconfig
> +++ b/hw/fsi/Kconfig
> @@ -1,3 +1,7 @@
> +config FSI_OPB
> +    bool
> +    select FSI_CFAM
> +
>   config FSI_CFAM
>       bool
>       select FSI
> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
> index f617943b4a..407b8c2775 100644
> --- a/hw/fsi/meson.build
> +++ b/hw/fsi/meson.build
> @@ -2,3 +2,4 @@ system_ss.add(when: 'CONFIG_FSI_LBUS', if_true: files('lbus.c'))
>   system_ss.add(when: 'CONFIG_FSI_SCRATCHPAD', if_true: files('engine-scratchpad.c'))
>   system_ss.add(when: 'CONFIG_FSI_CFAM', if_true: files('cfam.c'))
>   system_ss.add(when: 'CONFIG_FSI', if_true: files('fsi.c','fsi-master.c','fsi-slave.c'))
> +system_ss.add(when: 'CONFIG_FSI_OPB', if_true: files('opb.c'))

