Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1733292ejb;
        Fri, 4 Aug 2023 06:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUffscSwnDfdEWmdRicVKVm38CzeTnAL4TAVdM5N64PrEMvz+H1f81jNcfS9ep3w/xhryL
X-Received: by 2002:a05:620a:2948:b0:76c:e764:508a with SMTP id n8-20020a05620a294800b0076ce764508amr2476281qkp.3.1691154327712;
        Fri, 04 Aug 2023 06:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691154327; cv=none;
        d=google.com; s=arc-20160816;
        b=u/B7fGiUgKvOXnxftVdpH5HjWRiEp+8Hj/nl/fZ+1C795yUcDQb/l641h63yDd7LFJ
         wRSUfmQNGkLAIN1Pd8YMQNXVMGoSLC8j+nYVJkRzxm8J6Whffbg1XMZBDvFixhR9ECGX
         BZVxN4ZhEtEBAdZwzCToFC+f6qHArD11SpLva0Zcd7QivmqNAB2A1tH3lOitFpkGAdfz
         xNOk3U0+EdnaZHNjXAFHb6cG43wIQb2QM1LU/0LBQ/b1KRXnpWOG02gyOxV+sjXXGmTX
         RnH1lBMrc0J47q56d4N9B+VeiJHXdWsUfuH0coayRqCfPttf811NdoFz9skg+ytSrjRZ
         2Akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4+0hu2/zxCBq+nk9m4ve07j02umxgi8yd/3bORNaOik=;
        fh=Q0j2uzKr6UKEhKQFSk0NX8qyCOs2mRoOMSSQcpxrdkU=;
        b=ci6hyQygorKqfm2rCNf7TK4iVcIwO6nn2g7mh3fRYD0MGoJcz3Pc5WTCiUV9yCTDhD
         ysMDSUb1qn9HFdnGN+dmJ8Up3k8ZIi8WKmtlFRgrhiPwke3pevxfcM5KMyZmjXzt3Vro
         J3KzDdsVe4Tzz+zhGAvbYugsTcTW67hKpd01pINZc3xQHfKMSY9Lwbc/j3US2/ksRkSv
         gNBvbiqgdBnwxQyHRv17dtQp7GtTVt+HsbZ5ME61o0HRjsH3+A73JOv7lgNkTD73TUZ1
         kY10mZIriVAElDCOi9R/H+683uEeVqbw96vxZReC5aZyMcpqGJ9+jiOtc+8LeB+XyGUC
         Kh1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZcDY71P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020a05620a409400b0076cc49947e1si1236233qko.377.2023.08.04.06.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 06:05:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZcDY71P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRuU6-00075Q-0Z; Fri, 04 Aug 2023 09:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRuTw-000737-FB
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 09:04:41 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRuTt-0007rC-Vd
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 09:04:40 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe389d6f19so3510905e87.3
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691154276; x=1691759076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4+0hu2/zxCBq+nk9m4ve07j02umxgi8yd/3bORNaOik=;
 b=KZcDY71PJMCzKb4Lt6YcohznPXPjcUufnofbW0veWqr7z5xZNKLfyN+entqOjQY/ll
 IcWrLKasphKdctFAQ8fK1Z+Wb0J/LEQYdAPrfRL0wGBqBKTUSMdFAp0xk4cvIM8yytXm
 istrYlCm2Y9mBXxqSUD/a9CBXsNG198c923IIVhJ3i5MxUTGiv/ghVvrwVskaqlfcmZY
 0a8ZH85PvKaLKRVPwDvieoKihwGUfC9iKYmxOzzU7+Ir4v8tYcteHh+FrWcoOpG/7xlb
 QUGvmeetEl9zdziPenWkQZrwINuoh/1g9v1kxEQyY+tNx6KZEiROGDGd2ieV1xf/Rr1M
 PCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691154276; x=1691759076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4+0hu2/zxCBq+nk9m4ve07j02umxgi8yd/3bORNaOik=;
 b=eVD9D63m84bAw2CvDyKkaenb7ydjxXvg7hY0uJGmWEAkoiB9HJTsjHhMHBAj3cqXMq
 BLvJjiBexHykucqLPdlF4Y32yMe3oPgR8wdOVBLs+jdxHuzizh03lJonDwffLTmQQr81
 5kDLU19dSDLKCoHTBlATZGZv1Rh+70OglyF2BZWQ8GLSqDGWE70EQWKHVY9KIRfJWrlG
 Eo3UC348pKWSR7NGWo3M4MUhRCzTAh4iFgJ7Zc+34Vvw/hZ3Uo4ydcL2zQO9YGTrM7YE
 OsNPyxO1PArU75i6y+lGd2sEfTXEsz3K6NWZDowOYVLC+UCTHEz1q7mJ0iiNaDmAtS0t
 OOcw==
X-Gm-Message-State: AOJu0Yy3ddLx6hjXnH5mKgtYiYJz9bO4jnUq8X14Ox9SBTojScZnl8hR
 vwNSKzLqPL5K31qI1RVwatStNOAYFpBZ2MXdsFW3NQ==
X-Received: by 2002:a19:914d:0:b0:4fa:d147:9df with SMTP id
 y13-20020a19914d000000b004fad14709dfmr1185325lfj.19.1691154275833; Fri, 04
 Aug 2023 06:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-15-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-15-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 14:04:24 +0100
Message-ID: <CAFEAcA9_NEucGBAwt+Bfda3K-nHDd2ocKa1UJH_ARsY23+DPdg@mail.gmail.com>
Subject: Re: [PATCH 14/44] Add BCM2838 PCIE Root Complex
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 40BUQD37Rhcd

On Wed, 26 Jul 2023 at 14:51, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_pcie.c         | 65 +++++++++++++++++++++++++++++++++++

PCI controllers live in hw/pci-host/ .

I'm not too familiar with the PCI subsystem, so I've cc'd
Marcel and Michael as the PCI maintainers.

The PCI-relevant patches in this series are 14 and 15:
https://patchew.org/QEMU/20230726132512.149618-1-sergey.kambalin@auriga.com/20230726132512.149618-15-sergey.kambalin@auriga.com/
https://patchew.org/QEMU/20230726132512.149618-1-sergey.kambalin@auriga.com/20230726132512.149618-16-sergey.kambalin@auriga.com/
and maybe 16:
https://patchew.org/QEMU/20230726132512.149618-1-sergey.kambalin@auriga.com/20230726132512.149618-17-sergey.kambalin@auriga.com/
>  hw/arm/meson.build            |  5 ++-
>  hw/arm/trace-events           |  4 +++
>  include/hw/arm/bcm2838_pcie.h | 44 ++++++++++++++++++++++++
>  4 files changed, 117 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/bcm2838_pcie.c
>  create mode 100644 include/hw/arm/bcm2838_pcie.h
>
> diff --git a/hw/arm/bcm2838_pcie.c b/hw/arm/bcm2838_pcie.c
> new file mode 100644
> index 0000000000..522e19f3cf
> --- /dev/null
> +++ b/hw/arm/bcm2838_pcie.c
> @@ -0,0 +1,65 @@
> +/*
> + * BCM2838 PCIe Root Complex emulation
> + *
> + * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "hw/irq.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "qemu/module.h"
> +#include "hw/arm/bcm2838_pcie.h"
> +#include "trace.h"
> +
> +/*
> + * RC root part (D0:F0)
> + */
> +
> +static void bcm2838_pcie_root_init(Object *obj)
> +{
> +    PCIBridge *br = PCI_BRIDGE(obj);
> +    BCM2838PcieRootState *s = BCM2838_PCIE_ROOT(obj);
> +
> +    br->bus_name = "pcie.1";
> +    memset(s->regs, 0xFF, sizeof(s->regs));

Generally registers should be set in some reset method,
not in an instance_init method. (Your base class here
uses 3-phase-reset, so you will need to do so too.)

> +}
> +
> +static void bcm2838_pcie_root_class_init(ObjectClass *class, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(class);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(class);
> +
> +    dc->desc = "BCM2711 PCIe Bridge";
> +    /*
> +     * PCI-facing part of the host bridge, not usable without the host-facing
> +     * part, which can't be device_add'ed.
> +     */
> +    dc->user_creatable = false;
> +    k->vendor_id = BCM2838_PCIE_VENDOR_ID;
> +    k->device_id = BCM2838_PCIE_DEVICE_ID;
> +    k->revision = BCM2838_PCIE_REVISION;
> +    rpc->exp_offset = BCM2838_PCIE_EXP_CAP_OFFSET;
> +    rpc->aer_offset = BCM2838_PCIE_AER_CAP_OFFSET;
> +}
> +
> +static const TypeInfo bcm2838_pcie_root_info = {
> +    .name = TYPE_BCM2838_PCIE_ROOT,
> +    .parent = TYPE_PCIE_ROOT_PORT,
> +    .instance_size = sizeof(BCM2838PcieRootState),
> +    .instance_init = bcm2838_pcie_root_init,
> +    .class_init = bcm2838_pcie_root_class_init,
> +};
> +
> +static void bcm2838_pcie_register(void)
> +{
> +    type_register_static(&bcm2838_pcie_root_info);
> +}
> +
> +type_init(bcm2838_pcie_register)
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 768b2608c1..72680fa534 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -39,7 +39,10 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubi
>  arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
>  arm_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40.c', 'bananapi_m2u.c'))
>  arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
> -arm_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files('bcm2838.c', 'raspi4b.c'))
> +arm_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files(
> +  'bcm2838.c',
> +  'bcm2838_pcie.c',
> +  'raspi4b.c'))
>  arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
>  arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
>  arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 4f0167e638..6cfab31539 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -55,5 +55,9 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>  smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
>
> +# bcm2838_pcie.c
> +bcm2838_pcie_host_read(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04"PRIx64": 0x%016"PRIx64
> +bcm2838_pcie_host_write(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04"PRIx64": 0x%016"PRIx64
> +
>  # bcm2838.c
>  bcm2838_gic_set_irq(int irq, int level) "gic irq:%d lvl:%d"
> diff --git a/include/hw/arm/bcm2838_pcie.h b/include/hw/arm/bcm2838_pcie.h
> new file mode 100644
> index 0000000000..b3d39b808d
> --- /dev/null
> +++ b/include/hw/arm/bcm2838_pcie.h
> @@ -0,0 +1,44 @@
> +/*
> + * BCM2838 PCIe Root Complex emulation
> + *
> + * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef BCM2838_PCIE_H
> +#define BCM2838_PCIE_H
> +
> +#include "exec/hwaddr.h"
> +#include "hw/sysbus.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pcie_host.h"
> +#include "hw/pci/pcie_port.h"
> +#include "qom/object.h"
> +
> +#define TYPE_BCM2838_PCIE_ROOT "bcm2838-pcie-root"
> +OBJECT_DECLARE_SIMPLE_TYPE(BCM2838PcieRootState, BCM2838_PCIE_ROOT)
> +
> +#define BCM2838_PCIE_VENDOR_ID      0x14E4
> +#define BCM2838_PCIE_DEVICE_ID      0x2711
> +#define BCM2838_PCIE_REVISION       20
> +
> +#define BCM2838_PCIE_REGS_SIZE      0x9310
> +#define BCM2838_PCIE_NUM_IRQS       4
> +
> +#define BCM2838_PCIE_EXP_CAP_OFFSET 0xAC
> +#define BCM2838_PCIE_AER_CAP_OFFSET 0x100
> +
> +#define BCM2838_PCIE_EXT_CFG_DATA   0x8000
> +#define BCM2838_PCIE_EXT_CFG_INDEX  0x9000
> +
> +struct BCM2838PcieRootState {
> +    /*< private >*/
> +    PCIESlot parent_obj;
> +
> +    /*< public >*/
> +    uint8_t regs[BCM2838_PCIE_REGS_SIZE - PCIE_CONFIG_SPACE_SIZE];
> +};
> +
> +
> +#endif /* BCM2838_PCIE_H */
> --
> 2.34.1

thanks
-- PMM
