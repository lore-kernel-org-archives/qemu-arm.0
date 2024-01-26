Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp739614ejc;
        Fri, 26 Jan 2024 00:31:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErEZbd6ehkNzk7zDRhL3yufNjTgYeeL+gxm2GohLFcTBMK2VEygjCkwswIUimoaWCD4qac
X-Received: by 2002:a05:6808:1514:b0:3bd:e2c1:a49b with SMTP id u20-20020a056808151400b003bde2c1a49bmr1196477oiw.3.1706257907669;
        Fri, 26 Jan 2024 00:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706257907; cv=none;
        d=google.com; s=arc-20160816;
        b=WkPzl+4FMYbItUq5+L+A0+N23Uc0e3ReUEMFkgNiYMNHWhpFetsfocPky/yRv/0FmQ
         UhT5x4pNkLBW9TTHr4subW1oliWKGC9OyOmTMBdyHIxQ44034HHUvQNtkR+DLa4wK32C
         BIGGiDLVwSDUHplgQ1w0rKU3WKWS/pW8nIwnYfdEHvZDx95x9a8z5jSAFbtmQB7LQk0g
         3o7xBaoeRrrEimE/wwcKyMSCClA3xceRol6A0wVCkEiOZqRjhJkE8DGYwP0TECdFvmcN
         vSJb1wk61rpqIUrmG6vfLmY6L/uYEqeF+EvD4ZqYlFkV5TfJXrU/udAEpzFf/v8JJ317
         G5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=zpq5jRja1tREG5ibCTyURxdqohMRcSZYY+hgDPOhB7I=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=PqTksTIvtdqcs/eYmkaiSUxPifhTfutZI2WEav9NYRlGw9v3xUrEInYY/YjEUgmQwB
         noEDknmkOz2P1lC3pVP0/Qon2emeUyqsmIEwn7KlR78VeL6PPoinhEVanX5J6w83iE1W
         LFfRY01iF7+gSRpWLP5N66EwT2pElM8knpCaBmncN6d+ner6Pccg6EKoFsmC0eAlHM/l
         GL6qb6yTikayHAqi5Trc8fZSyKMKTRLJlWRN8YxeFAYnzLjyQnht00PKj4QJvk9r1RAn
         L96cfOcH05vVupyRpYe4yVgQw31SLvTe/iEEytH++MWhUh9FGUA+bOU4dqFUyM3cVnJ4
         ztFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a05622a011300b0042a32d58254si725485qtw.99.2024.01.26.00.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 00:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTHcW-0002Xs-Ip; Fri, 26 Jan 2024 03:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTHcU-0002XZ-NP; Fri, 26 Jan 2024 03:31:26 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTHcS-00072c-HQ; Fri, 26 Jan 2024 03:31:26 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLrWW2RWPz4x5r;
 Fri, 26 Jan 2024 19:31:19 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLrWQ68Rvz4wx5;
 Fri, 26 Jan 2024 19:31:14 +1100 (AEDT)
Message-ID: <cc3daf3c-b6e0-42a9-9397-7171d1f63648@kaod.org>
Date: Fri, 26 Jan 2024 09:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/11] hw/fsi: Introduce IBM's Local bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-2-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240126034026.31068-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: SiHnXZyzTBGq

On 1/26/24 04:40, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The LBUS is modelled to maintain mapped memory for the devices. The
> memory is mapped after CFAM config, peek table and FSI slave registers.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> [ clg: - removed lbus_add_device() bc unused
>         - removed lbus_create_device() bc used only once
>         - removed "address" property
>         - updated meson.build to build fsi dir
>         - included an empty hw/fsi/trace-events ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
> v9:
>    - Changed LBUS memory region to 1MB.
> v11:
>    - Split lbus and scratchpad into separate patches.
>    - Added fsi_ prefix for all functions in lbus.
>    - Removed FSI_LBUS* typedefs.
>    - Replaced for loop with memset.
> ---
>   meson.build           |  1 +
>   hw/fsi/trace.h        |  1 +
>   include/hw/fsi/lbus.h | 32 ++++++++++++++++++++++++++++++++
>   hw/fsi/lbus.c         | 43 +++++++++++++++++++++++++++++++++++++++++++
>   hw/Kconfig            |  1 +
>   hw/fsi/Kconfig        |  2 ++
>   hw/fsi/meson.build    |  1 +
>   hw/fsi/trace-events   |  0
>   hw/meson.build        |  1 +
>   9 files changed, 82 insertions(+)
>   create mode 100644 hw/fsi/trace.h
>   create mode 100644 include/hw/fsi/lbus.h
>   create mode 100644 hw/fsi/lbus.c
>   create mode 100644 hw/fsi/Kconfig
>   create mode 100644 hw/fsi/meson.build
>   create mode 100644 hw/fsi/trace-events
> 
> diff --git a/meson.build b/meson.build
> index d0329966f1..7d926c6e82 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3290,6 +3290,7 @@ if have_system
>       'hw/char',
>       'hw/display',
>       'hw/dma',
> +    'hw/fsi',
>       'hw/hyperv',
>       'hw/i2c',
>       'hw/i386',
> diff --git a/hw/fsi/trace.h b/hw/fsi/trace.h
> new file mode 100644
> index 0000000000..ee67c7fb04
> --- /dev/null
> +++ b/hw/fsi/trace.h
> @@ -0,0 +1 @@
> +#include "trace/trace-hw_fsi.h"
> diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
> new file mode 100644
> index 0000000000..e8a22e22a8
> --- /dev/null
> +++ b/include/hw/fsi/lbus.h
> @@ -0,0 +1,32 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 IBM Corp.
> + *
> + * IBM Local bus and connected device structures.
> + */
> +#ifndef FSI_LBUS_H
> +#define FSI_LBUS_H
> +
> +#include "hw/qdev-core.h"
> +#include "qemu/units.h"
> +#include "exec/memory.h"
> +
> +#define TYPE_FSI_LBUS_DEVICE "fsi.lbus.device"
> +OBJECT_DECLARE_SIMPLE_TYPE(FSILBusDevice, FSI_LBUS_DEVICE)
> +
> +typedef struct FSILBusDevice {
> +    DeviceState parent;
> +
> +    MemoryRegion iomem;
> +} FSILBusDevice;
> +
> +#define TYPE_FSI_LBUS "fsi.lbus"
> +OBJECT_DECLARE_SIMPLE_TYPE(FSILBus, FSI_LBUS)
> +
> +typedef struct FSILBus {
> +    BusState bus;
> +
> +    MemoryRegion mr;
> +} FSILBus;
> +
> +#endif /* FSI_LBUS_H */
> diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
> new file mode 100644
> index 0000000000..44d2319087
> --- /dev/null
> +++ b/hw/fsi/lbus.c
> @@ -0,0 +1,43 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 IBM Corp.
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
> +#include "trace.h"
> +
> +static void fsi_lbus_init(Object *o)
> +{
> +    FSILBus *lbus = FSI_LBUS(o);
> +
> +    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_FSI_LBUS, 1 * MiB);
> +}
> +
> +static const TypeInfo fsi_lbus_info = {
> +    .name = TYPE_FSI_LBUS,
> +    .parent = TYPE_BUS,
> +    .instance_init = fsi_lbus_init,
> +    .instance_size = sizeof(FSILBus),
> +};
> +
> +static const TypeInfo fsi_lbus_device_type_info = {
> +    .name = TYPE_FSI_LBUS_DEVICE,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(FSILBusDevice),
> +    .abstract = true,
> +};
> +
> +static void fsi_lbus_register_types(void)
> +{
> +    type_register_static(&fsi_lbus_info);
> +    type_register_static(&fsi_lbus_device_type_info);
> +}
> +
> +type_init(fsi_lbus_register_types);
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 9ca7b38c31..2c00936c28 100644
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
> index 0000000000..9c34a418d7
> --- /dev/null
> +++ b/hw/fsi/Kconfig
> @@ -0,0 +1,2 @@
> +config FSI
> +    bool
> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
> new file mode 100644
> index 0000000000..93ba19dd04
> --- /dev/null
> +++ b/hw/fsi/meson.build
> @@ -0,0 +1 @@
> +system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c'))
> diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/hw/meson.build b/hw/meson.build
> index f01fac4617..463d702683 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -44,6 +44,7 @@ subdir('virtio')
>   subdir('watchdog')
>   subdir('xen')
>   subdir('xenpv')
> +subdir('fsi')
>   
>   subdir('alpha')
>   subdir('arm')

