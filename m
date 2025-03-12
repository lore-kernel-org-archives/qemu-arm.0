Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp336120njc;
        Wed, 12 Mar 2025 08:19:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMIIeIgDBudqUuessinq+cpIwlvPk9FnIqQoivBn605umFrhFPQbg33qur/bjrvHtmnQa8elN1kZ5T6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGz5e5XH3yZDp3h26Jp4EKzMrUVtWVSY46AftNNL0rb3R6Q4YfUVkBDIe1OjtsraGYvALGr
X-Received: by 2002:a05:622a:93:b0:476:83d6:75ea with SMTP id d75a77b69052e-47683d6a14bmr188468811cf.15.1741792768296;
        Wed, 12 Mar 2025 08:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741792768; cv=none;
        d=google.com; s=arc-20240605;
        b=jb1AjLYBf1LIan1zgOXmOqpFr5mTLCZzn1ZtLplkHDc1undU+EAkjnLQunJfWEBEnK
         3qjA0yveUPhmw4oQLmmtfFK1Kjj1hDRAcwzjvpSL7Cj4r9+gNbEUa0PsaO0X+DwvzZvU
         WbsaAf7wGCSBUNni7jRPnEX7MILSmuEg+JWMdciXZXvsPFNmYZILt/WzS9q8t9MmBDFk
         23vz0Xl9oBW0HRPdpDBgcGM7grLJEOfGjTxrjAjjqHmkbat/aV92Y912YAt7aIMSOa6v
         9IMs6EZA1qtU9AkTsGkYV7XSJzlqUojPYm5hwUO8p6qW+vFL18PgpQc4j6D6P/wzJvZg
         Xa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QERvyYhYB+2oQkqCtVctitqp2mOQxeiJezvgVXmaPZE=;
        fh=OGa20lxz8ZJymAJ5F5l940bYfIoyA36ABmB2t0mJMcg=;
        b=jW1ZHXmefKCQLUd4PBlO3PvdSX5RmEoKRbOJ6SxQa81G/tLskxLQfA0bYIVp7ZV+qx
         HcPrPMnOqgBJDFP/H8GyJCQdM6EFzlQn15g8Bfw+vJdie2rcOEl/Vd3DmpTHNsYiuqdW
         Zvu8Hhqv4B1Tzs7ARmaEpfTrvHLWS7ddqLYWY4E0nAuPB3vXEV61YAOLkA+yrej8DdGv
         UxMD8nsr48fx2ZT+aeCpnbR95dGY4uWGOJ4sHuo9uROoI6UpD7KYSj8Sxw19bhcnJkVW
         9eYbkZkvAIhhYjZXGjs126h62ZFR/FhALUumTTwSTI2hngqSE5APbf6aHX/xv24d7Msk
         QIrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uyoz92OO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-86d33be2569si3024426241.45.2025.03.12.08.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 08:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uyoz92OO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsNrc-0002iE-PG; Wed, 12 Mar 2025 11:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsNrP-0002a7-9c
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 11:19:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsNrN-00087x-2I
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 11:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741792741;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QERvyYhYB+2oQkqCtVctitqp2mOQxeiJezvgVXmaPZE=;
 b=Uyoz92OOpY3vGIqbzUROakFhxvUSmfCAG7cpYuibgWIJgmh2jSauyR5sWg8SHDHOFBtwXL
 J/Us9JLWkaAxyAS17w6/uDrgK/50d00SjrsSC5o/BpdLEB8Hiuu8vdKlLdSmqPwYxYpMTb
 L+mVavg+JN/ipbAeBDDMOw6wuypu+04=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-SIh5ZLg7Oa-G6dmyt-d3Qg-1; Wed, 12 Mar 2025 11:15:15 -0400
X-MC-Unique: SIh5ZLg7Oa-G6dmyt-d3Qg-1
X-Mimecast-MFC-AGG-ID: SIh5ZLg7Oa-G6dmyt-d3Qg_1741792515
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c3b6450ed8so1235190685a.3
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 08:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741792515; x=1742397315;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QERvyYhYB+2oQkqCtVctitqp2mOQxeiJezvgVXmaPZE=;
 b=jayyV5yy/BUw+5oNi7GUcbzsyiCJ2GQLq5pKpnfxa4ivow7qjb9ahXmRAWn5v/IMJl
 C8MPxPsfY7aTL/rM/WYXNih70gohU32EH5kiePuwgbjDrRTe0A6+jcTIxICuty3HUSjR
 wMFEPA09MA7LqruZ7RXapce2wwgOxdqIs0E3WUkUSMIV7RhS4HfGD3RfEpKQEyZ78ZVI
 RGZJ2TJrV92xc+bcTF53X63GbIeQc1wIOAl+2EwkaAN+Buh6YhlIGrWv1tQkZxZikPPv
 TR5G78fwrplPZp15G5r1Vye0wr14hkVQ0fmPzGtbcg3DRlgptU9bTGV/WbrhLg+WsD2a
 nVWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVskjtluGj1h5pJllNixXtBD8tGkJPdboz8eGix9liRCcWXRzny1+IqW+5FJvi8ZXfdUW9438suSQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw/Sh7AIHo0F+obv99vdx6FM3zTgt1shpBWArLjZ1LjTB0c3Rts
 LsvkCFAtMU7a+kB8zDAMi/28Dt8KnYxrb4lGJ1jV/g+7dfoHYbZJdr7KLl5nHp2R/iXXeB2zUa7
 CtL4jl1miDfGsdyC5YCjTjSqNr33w6DFvafJVTuFhibI7gdi27g==
X-Gm-Gg: ASbGncuPoKlWT/pk5vWMGB7wsHap9w8ISgdcYqMSiK2DGsoCoN802nVsH4hZg1AOwzv
 Jg6UPzvPsPCUdBWQCzKHCtww6vt6spNioyYhgO2M6G95aNwMCjAJv9oJEwXvNQ/wfYX5uXVI9Js
 7pdApRkJglj0VEKVS6Fgp9g0qyDUTxkxolE+Bb+mxoXSVzN+VQMlLYWzNW6bYBaDQeraddIAk60
 S+yb7J1Ms4NevACjOYXAPGe3dMh1hzf8O13uHBJ9n1X7kPc1hS24v+COvMCbe/Soh/YcTCMkYRO
 mcRum1qIqVK0fc70RHwGCJHnmkPihl6xxiZRUM+K323Ub7bZ4Wv1+0QNhQ55q/8=
X-Received: by 2002:a05:620a:800f:b0:7c5:4b91:6a42 with SMTP id
 af79cd13be357-7c54b9170e1mr2046540785a.17.1741792515268; 
 Wed, 12 Mar 2025 08:15:15 -0700 (PDT)
X-Received: by 2002:a05:620a:800f:b0:7c5:4b91:6a42 with SMTP id
 af79cd13be357-7c54b9170e1mr2046532885a.17.1741792514817; 
 Wed, 12 Mar 2025 08:15:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c56453475esm216461985a.22.2025.03.12.08.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 08:15:14 -0700 (PDT)
Message-ID: <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
Date: Wed, 12 Mar 2025 16:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aU_TFpIVi9u8yMSvQ9KEZ1sPES18rW5MDwkjIskyIpk_1741792515
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A/WzkhSLfezh

Hi Shameer,


On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> Based on SMMUv3 as a parent device, add a user-creatable smmuv3-accel
> device. In order to support vfio-pci dev assignment with a Guest
guest
> SMMUv3, the physical SMMUv3 has to be configured in nested(S1+s2)
nested (s1+s2)
> mode, with Guest owning the S1 page tables. Subsequent patches will
the guest
> add support for smmuv3-accel to provide this.
Can't this -accel smmu also works with emulated devices? Do we want an
exclusive usage?

I would also document in the commit msg that a new property is added in
the parent SMMU (accel).
Will this device be migratable? Do we need a migration blocker?
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/Kconfig                |  5 ++++
>  hw/arm/meson.build            |  1 +
>  hw/arm/smmu-common.c          |  1 +
>  hw/arm/smmuv3-accel.c         | 51 +++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmu-common.h  |  3 +++
>  include/hw/arm/smmuv3-accel.h | 31 +++++++++++++++++++++
>  6 files changed, 92 insertions(+)
>  create mode 100644 hw/arm/smmuv3-accel.c
>  create mode 100644 include/hw/arm/smmuv3-accel.h
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 504841ccab..f889842dd8 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -14,6 +14,7 @@ config ARM_VIRT
>      select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
> +    select ARM_SMMUV3_ACCEL
>      select GPIO_KEY
>      select DEVICE_TREE
>      select FW_CFG_DMA
> @@ -596,6 +597,10 @@ config FSL_IMX7
>  config ARM_SMMUV3
>      bool
>  
> +config ARM_SMMUV3_ACCEL
> +    select ARM_SMMUV3
> +    bool
> +
>  config FSL_IMX6UL
>      bool
>      default y
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 465c757f97..e8593363b0 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -55,6 +55,7 @@ arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
>  arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
> +arm_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>  arm_ss.add(when: 'CONFIG_XEN', if_true: files(
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 8c1b407b82..f5caf1665c 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -943,6 +943,7 @@ static const Property smmu_dev_properties[] = {
>      DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
>      DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
>                       TYPE_PCI_BUS, PCIBus *),
> +    DEFINE_PROP_BOOL("accel", SMMUState, accel, false),
>  };
>  
>  static void smmu_base_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> new file mode 100644
> index 0000000000..c327661636
> --- /dev/null
> +++ b/hw/arm/smmuv3-accel.c
> @@ -0,0 +1,51 @@
> +/*
> + * Copyright (c) 2025 Huawei Technologies R & D (UK) Ltd
> + * Copyright (C) 2025 NVIDIA
> + * Written by Nicolin Chen, Shameer Kolothum
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "hw/arm/smmuv3-accel.h"
> +
> +static void smmu_accel_realize(DeviceState *d, Error **errp)
> +{
> +    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(d);
> +    SMMUv3AccelClass *c = ARM_SMMUV3_ACCEL_GET_CLASS(s_accel);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(d);
> +    Error *local_err = NULL;
> +
> +    object_property_set_bool(OBJECT(dev), "accel", true, &error_abort);
you shouldn't need dev and simply use OBJECT(d)
> +    c->parent_realize(d, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +}
> +
> +static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    SMMUv3AccelClass *c = ARM_SMMUV3_ACCEL_CLASS(klass);
> +
> +    device_class_set_parent_realize(dc, smmu_accel_realize,
> +                                    &c->parent_realize);
> +    dc->hotpluggable = false;
> +}
> +
> +static const TypeInfo smmuv3_accel_type_info = {
> +    .name          = TYPE_ARM_SMMUV3_ACCEL,
> +    .parent        = TYPE_ARM_SMMUV3,
> +    .instance_size = sizeof(SMMUv3AccelState),
> +    .class_size    = sizeof(SMMUv3AccelClass),
> +    .class_init    = smmuv3_accel_class_init,
> +};
> +
> +static void smmuv3_accel_register_types(void)
> +{
> +    type_register_static(&smmuv3_accel_type_info);
> +}
> +
> +type_init(smmuv3_accel_register_types)
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index d1a4a64551..b5c63cfd5d 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -157,6 +157,9 @@ struct SMMUState {
>      QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
>      uint8_t bus_num;
>      PCIBus *primary_bus;
> +
> +    /* For smmuv3-accel */
> +    bool accel;
>  };
>  
>  struct SMMUBaseClass {
> diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
> new file mode 100644
> index 0000000000..56fe376bf4
> --- /dev/null
> +++ b/include/hw/arm/smmuv3-accel.h
> @@ -0,0 +1,31 @@
> +/*
> + * Copyright (c) 2025 Huawei Technologies R & D (UK) Ltd
> + * Copyright (C) 2025 NVIDIA
> + * Written by Nicolin Chen, Shameer Kolothum
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_ARM_SMMUV3_ACCEL_H
> +#define HW_ARM_SMMUV3_ACCEL_H
> +
> +#include "hw/arm/smmu-common.h"
> +#include "hw/arm/smmuv3.h"
> +#include "qom/object.h"
> +
> +#define TYPE_ARM_SMMUV3_ACCEL   "arm-smmuv3-accel"
> +OBJECT_DECLARE_TYPE(SMMUv3AccelState, SMMUv3AccelClass, ARM_SMMUV3_ACCEL)
> +
> +struct SMMUv3AccelState {
> +    SMMUv3State smmuv3_state;
> +};
> +
> +struct SMMUv3AccelClass {
> +    /*< private >*/
> +    SMMUv3Class smmuv3_class;
> +    /*< public >*/
> +
> +    DeviceRealize parent_realize;
> +};
> +
> +#endif /* HW_ARM_SMMUV3_ACCEL_H */
Thanks

Eric

