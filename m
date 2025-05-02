Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1034852njj;
        Fri, 2 May 2025 11:17:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmHFHs9OMY6dGBaXo+5S34dRDqPbG69HlkS404+gVlWmnZ8/RZvnuuQfu0Ovh0pclB2LR20SrV+9ePLw==@linaro.org
X-Google-Smtp-Source: AGHT+IFJwdW2SvRuwvzdcN4BpHiODX/GwUymwzoD/lXGYyj8v1quuoPAy8YiTdKQ/TRcuW4avWqO
X-Received: by 2002:a05:620a:410c:b0:7c8:c97:627f with SMTP id af79cd13be357-7cad5b8d856mr500316585a.46.1746209864343;
        Fri, 02 May 2025 11:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746209864; cv=none;
        d=google.com; s=arc-20240605;
        b=fraetB04faNrxkyHHC8AO4LvraxjuKvT5QUsDaBQJ/6fI6YXNQueaan8FSbNTnmi3d
         OIV/dWSagsnL5F8uxqJw2TzjQrDmGlkN91bMgO2ocKxcP7dsFNWv3ul8zB6ech2A50N3
         4UDsNtzg8hIf1BlofGbUsbG2owpeAJwPWt5SROgyLPaUO83tiyfDh4M0tjiJYYwslNwD
         3NpyTkk5fh4NAiTDQpj/i8fx07qeo7ASR+gLHxQuOxTXwawThlrTws1bbdULaxaPAe2x
         AlGHxvF/wPd1EEO5s7AI9ZakMS1EmLHygmHsWFkbziqP3MRtGMzkG0sFW2cqIMa255Vt
         MmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DJnKAunZ1Djkl7EOu7Ew/I8Ps+gfCr9/BDa7pBfgzXo=;
        fh=W+dmC/Leair4Z3hffd85EVhBb03SNZOVDQAeFMO0Tmw=;
        b=MUffe/xh6PMVWBwusKSA484xq2vIWow5uOyEO+GdlXctofIZMiGwfe33fo8mZffcZk
         3niiktOT3fj7ZBtxzXJMGq2Eaq0uXovDs0nOa24r0w0HVItxV3jLHKPZixCdFrJNvuWM
         QwJYqyFqWjukIw9X/nuuWXlXVgEFoQl3IHeZp3nUfptVA0JO/IWLAq5ppWUCBKdKRxbj
         IfzOlQsCT2CRLm6wrGvj8Dxweo3ujnY0ezFCw86XRlg0FakfY/fvEORwLoTj183lXOtn
         AuHQ941tTDsuaev8jangwtVm/Lc/zL+XXvWkcdbZUejraCVeaE048zVdJ3618Ln5CrCF
         Fffw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CqVptS7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad241feaasi343310585a.314.2025.05.02.11.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 11:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CqVptS7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAuxB-0005mr-O4; Fri, 02 May 2025 14:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uAux4-0005lc-5j
 for qemu-arm@nongnu.org; Fri, 02 May 2025 14:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uAux0-0006YA-Kx
 for qemu-arm@nongnu.org; Fri, 02 May 2025 14:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746209850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJnKAunZ1Djkl7EOu7Ew/I8Ps+gfCr9/BDa7pBfgzXo=;
 b=CqVptS7yYBQq48fxhvyW68HY2PlnAZ/rj9Q7FUGwuvBHUFApuvVvIwONG+itLLfECeLajn
 v6bTNTGaXiFM4hhvl3XdyXrr8SP6Uy9oOTlYX+ZG7SzfhnX0qZwRfcYQ60g9UiqC5z1ph3
 wuOZ5Ky8U7b7MLVdW56jBDrwQAUde6c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-1woI9t8QN-aEA9ckg5gGGA-1; Fri, 02 May 2025 14:17:28 -0400
X-MC-Unique: 1woI9t8QN-aEA9ckg5gGGA-1
X-Mimecast-MFC-AGG-ID: 1woI9t8QN-aEA9ckg5gGGA_1746209848
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-476870bad3bso36805481cf.3
 for <qemu-arm@nongnu.org>; Fri, 02 May 2025 11:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746209848; x=1746814648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DJnKAunZ1Djkl7EOu7Ew/I8Ps+gfCr9/BDa7pBfgzXo=;
 b=R3Gh4vYLtarq8tI/queQOZROVg5SQHMkg/0+Mbxv2USSTzH6IM9kMBJe+Sqp4UqbMk
 XeMDjf3oy160Vyn2jQI/Wo6Cj0L6+eS8RKbM+aH9z/SaRIxCY7DlpthRJhxzjUfpu4tO
 sUjA9NVEUjIYLZ27vjtfDnMsCDeqLSQTWFPABWBkTb556WCbpkVKxMiqZPc3RIudPLZ/
 dnn8vywl00p+6nJT5C0CrP3SM+tjyULTkBpkcnJ7iocAZ4HJQ2z42u2mk9TQ7OqOmPF1
 GiwZ35spzqJF6t4aAPgzZb5UG8TBBRx0dN2PRQqiDsTgUOil0H3zr41LZvfQQRGgE89b
 BILQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzQ0ww5J2rnie2UFkCWsYrWQZZjkigMtWjGb7sVvbwSqa5MwxveUcoHnJ83+41xAL5faPdiSCC7A==@nongnu.org
X-Gm-Message-State: AOJu0YylNUGGAi9t8Li/bXmjt0Q+yeumcdmZvsI9xIhSefVjfwdD52lA
 imjAdVot09kQTI2Yo45dOCpxCmT34wLzUU841G0Lh3FTIJjAlDvvJ1o22Qf4fZXExc7HOsisz65
 fMONPSI5ysuJ9Kz6Wnl7TBZeW+BeG72TO9qx+W0xYhKlrFW1GDA==
X-Gm-Gg: ASbGncvaInq/OCZLKT82Mcda+hYWT94NGxbIHOwCiSO9PKIM6FRB0hbw8VtXHY1/hES
 I06ee+4OMwFYkk/bOhqCr9kbECtPHf06s1AdUr2TyEul/VzHeMzQazJyTdwSBeDOWSmLGVmQJXh
 6Zetsd15bN1c/7SLIQDL3dxz1m2J1pH/JNZN1xHg9r3YlgbA6nvnVX7fW21OxSOG3UDzuHkw98b
 lpw4XAlm2ZRe3AWXXkyLts243q4TcTLFiWEGygM+le/ph8sGlSxh7tOQ7+iPBjS9Vq6f/SmeWer
 H2GVN2Zbc3gq
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id
 d75a77b69052e-48c32ac7333mr58708141cf.42.1746209847989; 
 Fri, 02 May 2025 11:17:27 -0700 (PDT)
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id
 d75a77b69052e-48c32ac7333mr58707841cf.42.1746209847697; 
 Fri, 02 May 2025 11:17:27 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-48b98d0fb2dsm20974591cf.77.2025.05.02.11.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 11:17:27 -0700 (PDT)
Message-ID: <03c31d89-ad24-4470-99d0-a77e693e3ba2@redhat.com>
Date: Fri, 2 May 2025 14:16:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lF0H6afzS2NJ8YORTzV9ukj7iYstLdwla1HUahgZiFg_1746209848
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 71kIUgz8HN9J



On 5/2/25 6:27 AM, Shameer Kolothum wrote:
> Although this change does not affect functionality at present, it lays
> the groundwork for enabling user-created SMMUv3 devices in
> future patches
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   hw/arm/smmuv3.c | 26 ++++++++++++++++++++++++++
>   hw/arm/virt.c   |  3 ++-
>   2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ab67972353..605de9b721 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -24,6 +24,7 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-core.h"
>   #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>   #include "cpu.h"
>   #include "exec/target_page.h"
>   #include "trace.h"
> @@ -1874,6 +1875,25 @@ static void smmu_reset_exit(Object *obj, ResetType type)
>       smmuv3_init_regs(s);
>   }
>   
> +static int smmuv3_pcie_bus(Object *obj, void *opaque)
> +{
> +    DeviceState *d = opaque;
> +    PCIBus *bus;
> +
> +    if (!object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        return 0;
> +    }
> +
> +    bus = PCI_HOST_BRIDGE(obj)->bus;
> +    if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus->name)) {
> +        object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
> +                                 &error_abort);
> +        /* Return non-zero as we got the bus and don't need further iteration.*/
> +        return 1;
> +    }
> +    return 0;
> +}
> +
>   static void smmu_realize(DeviceState *d, Error **errp)
>   {
>       SMMUState *sys = ARM_SMMU(d);
> @@ -1882,6 +1902,10 @@ static void smmu_realize(DeviceState *d, Error **errp)
>       SysBusDevice *dev = SYS_BUS_DEVICE(d);
>       Error *local_err = NULL;
>   
> +    if (!object_property_get_link(OBJECT(d), "primary-bus", &error_abort)) {
> +        object_child_foreach_recursive(object_get_root(), smmuv3_pcie_bus, d);
> +    }
> +
>       c->parent_realize(d, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> @@ -1996,6 +2020,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>       device_class_set_parent_realize(dc, smmu_realize,
>                                       &c->parent_realize);
>       device_class_set_props(dc, smmuv3_properties);
> +    dc->hotpluggable = false;
> +    dc->bus_type = TYPE_PCIE_BUS;
Does this force legacy SMMUv3 to be tied to a PCIe bus now?
if so, will that break some existing legacy smmuv3 configs?, i.e., virtio-scsi attached to a legacy smmuv3.

>   }
>   
>   static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 177f3dd22c..3bae4e374f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -56,6 +56,7 @@
>   #include "qemu/cutils.h"
>   #include "qemu/error-report.h"
>   #include "qemu/module.h"
> +#include "hw/pci/pci_bus.h"
>   #include "hw/pci-host/gpex.h"
>   #include "hw/virtio/virtio-pci.h"
>   #include "hw/core/sysbus-fdt.h"
> @@ -1442,7 +1443,7 @@ static void create_smmu(const VirtMachineState *vms,
>       }
>       object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                                &error_abort);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>       for (i = 0; i < NUM_SMMU_IRQS; i++) {
>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,

