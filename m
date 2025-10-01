Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766A4CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 16:26:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3zeD-0001kq-7T; Wed, 01 Oct 2025 12:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3zeA-0001kN-P3
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3ze2-0006Cf-0C
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759335929;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=451ofA1mqmEEQNSKFV2BxE045rqyo3qnKF1sK4cAmVA=;
 b=bgQL+XYmjQLFL60Ixod/Dnpla67L1UyojB34RnfigDTavhoHzm8MWVF52aM9WS653zcUe2
 aNBVMlO+PsHGl7f6JzUjzltQvXdVkvLg0APFVMPq+oNetnvqYIvcofvh+odB/RTnBIEe/r
 RGfXlT1MPl/NiqTOmkr3eDClIwXxl5c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-5KxXIGyJM5-Jin0IMRWojg-1; Wed, 01 Oct 2025 12:25:27 -0400
X-MC-Unique: 5KxXIGyJM5-Jin0IMRWojg-1
X-Mimecast-MFC-AGG-ID: 5KxXIGyJM5-Jin0IMRWojg_1759335926
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3ee10a24246so4144223f8f.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 09:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759335926; x=1759940726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=451ofA1mqmEEQNSKFV2BxE045rqyo3qnKF1sK4cAmVA=;
 b=TMgXfOmsWpYooJHGY698PdwcrzAMp4KsA8ZiT9xhNkSbwpUbStwvEN4zDHVEbRg1Y1
 zaZwlC28XSuV07c1EHpcYKfugOcTeq6fOQNIKwu9Dcs5wAWqHbMOmgV+Vd3PxKgGaxGe
 o9pYFna6Tfn4IrRN+6IU/iTLOzGT1qwp3AoCRmKVs8lIoQkcZC2fkVJsLCUFPUzXmbhS
 Reg4Us8+Inffo3rqB2mYqdQJf03sN3gkT9eq0sg79LH1it7xK+xwy18xUvJyQjqSHpNC
 qNST8dFOs+NPu9qmoJdbO7kC+cQi4eLYpvskhXNvON1FCAhJAu13iCvmYes6U9pBj7hR
 l13g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf7aLdCoNt7U/B0PWvHGMP456QmxkP1R4FO3iGVQJraMoWdHc5TaEoxcZq+5CIpVIw88Uhwut4SQ==@nongnu.org
X-Gm-Message-State: AOJu0YygNPHywVg3L57NxgoT0yDRLlC5tCwXa4G1lAGIGVd65R6Jf1p9
 YYZK6SY17F9rSHH+mnnGZ9dEWrFRvxVHimxDx1ETVDhMoYIDoTZb7WcuK/H+ljmgyxxWkdTMGqX
 CO0p9F9mBZv94a2uM/+rOw/2aaFM0kY7zgylDfGD/D3Djz5cAj7/LsQ==
X-Gm-Gg: ASbGncscrK04Cv4w0d7NZN7idTEy15Ao253IDDLszq3a9NYHomuy5aYDLRVd2D5bCx1
 Xv5d3LTj/tt4KiUFbQ4Z0plB5Mrk+09Pvu2zSmornvNGe1ACQAuSkO7lp3f6A6WG8L1RTYZKJRZ
 airHCuDZO6qqWdU/Kt7tXk2+D1cSEHZAEHnpgmZ7/tU1r4XfCZbw1WTziMQPiyjPXdob9Gy1s6a
 8E62qE46X7rf3Gv6k0VjZWgr4Nz1pj/PhEgPfilWdB1GfkOG5EuPN41MYSJXo76n8VLxSLVWGkv
 HknRxN39J1U74PMq+RFaUi/0JN1AxH8yDQ9BWWpJ8DPfH7IOA89GTqwidNvqxXqyloFg5pczQ74
 M9frc2sp93Pe77sjY
X-Received: by 2002:a05:6000:2910:b0:3ea:e0fd:28e8 with SMTP id
 ffacd0b85a97d-42557816d76mr2910260f8f.32.1759335926086; 
 Wed, 01 Oct 2025 09:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1rr+ZoKLEqTdSuKl3u6YTjvdJwXC3VPBvwBaYlIe1OUEzXQHWRTE7Jf3VrpxW5o6gyPNnwA==
X-Received: by 2002:a05:6000:2910:b0:3ea:e0fd:28e8 with SMTP id
 ffacd0b85a97d-42557816d76mr2910226f8f.32.1759335925600; 
 Wed, 01 Oct 2025 09:25:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72facf9sm28472904f8f.13.2025.10.01.09.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 09:25:25 -0700 (PDT)
Message-ID: <b36b05e2-3453-4655-b060-7259624feb08@redhat.com>
Date: Wed, 1 Oct 2025 18:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/27] hw/arm/smmuv3-accel: Introduce smmuv3 accel
 device
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-6-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-6-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SWnCWOq8Zre82PlF_MNC5q7P_sPahbK2RNOI2zN7DO8_1759335926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.518,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> Set up dedicated PCIIOMMUOps for the accel SMMUv3, since it will need
> different callback handling in upcoming patches. This also adds a
> CONFIG_ARM_SMMUV3_ACCEL build option so the feature can be disabled
> at compile time. Because we now include CONFIG_DEVICES in the header to
> check for ARM_SMMUV3_ACCEL, the meson file entry for smmuv3.c needs to
> be changed as well.
>
> The “accel” property isn’t user visible yet, it will be introduced in
> a later patch once all the supporting pieces are ready.
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/Kconfig          |  5 ++++
>  hw/arm/meson.build      |  3 ++-
>  hw/arm/smmuv3-accel.c   | 52 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h   | 27 +++++++++++++++++++++
>  hw/arm/smmuv3.c         |  5 ++++
>  include/hw/arm/smmuv3.h |  3 +++
>  6 files changed, 94 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/smmuv3-accel.c
>  create mode 100644 hw/arm/smmuv3-accel.h
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3baa6c6c74..157c0f3517 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -12,6 +12,7 @@ config ARM_VIRT
>      select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
> +    select ARM_SMMUV3_ACCEL
>      select GPIO_KEY
>      select DEVICE_TREE
>      select FW_CFG_DMA
> @@ -625,6 +626,10 @@ config FSL_IMX8MP_EVK
>  config ARM_SMMUV3
>      bool
>  
> +config ARM_SMMUV3_ACCEL
> +    bool
> +    depends on ARM_SMMUV3 && IOMMUFD
> +
>  config FSL_IMX6UL
>      bool
>      default y
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index dc68391305..bcb27c0bf6 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -61,7 +61,8 @@ arm_common_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx8mp.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
> -arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
> +arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
> +arm_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>  arm_ss.add(when: 'CONFIG_XEN', if_true: files(
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> new file mode 100644
> index 0000000000..79f1713be6
> --- /dev/null
> +++ b/hw/arm/smmuv3-accel.c
> @@ -0,0 +1,52 @@
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
> +#include "hw/arm/smmuv3.h"
> +#include "smmuv3-accel.h"
> +
> +static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
> +                                               PCIBus *bus, int devfn)
> +{
> +    SMMUDevice *sdev = sbus->pbdev[devfn];
> +    SMMUv3AccelDevice *accel_dev;
> +
> +    if (sdev) {
> +        return container_of(sdev, SMMUv3AccelDevice, sdev);
> +    }
> +
> +    accel_dev = g_new0(SMMUv3AccelDevice, 1);
> +    sdev = &accel_dev->sdev;
> +
> +    sbus->pbdev[devfn] = sdev;
> +    smmu_init_sdev(bs, sdev, bus, devfn);
> +    return accel_dev;
> +}
> +
> +static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
> +                                              int devfn)
> +{
> +    SMMUState *bs = opaque;
> +    SMMUPciBus *sbus = smmu_get_sbus(bs, bus);
> +    SMMUv3AccelDevice *accel_dev = smmuv3_accel_get_dev(bs, sbus, bus, devfn);
> +    SMMUDevice *sdev = &accel_dev->sdev;
> +
> +    return &sdev->as;
> +}
> +
> +static const PCIIOMMUOps smmuv3_accel_ops = {
> +    .get_address_space = smmuv3_accel_find_add_as,
> +};
> +
> +void smmuv3_accel_init(SMMUv3State *s)
> +{
> +    SMMUState *bs = ARM_SMMU(s);
> +
> +    bs->iommu_ops = &smmuv3_accel_ops;
> +}
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> new file mode 100644
> index 0000000000..70da16960f
> --- /dev/null
> +++ b/hw/arm/smmuv3-accel.h
> @@ -0,0 +1,27 @@
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
> +#include CONFIG_DEVICES
> +
> +typedef struct SMMUv3AccelDevice {
> +    SMMUDevice  sdev;
> +} SMMUv3AccelDevice;
> +
> +#ifdef CONFIG_ARM_SMMUV3_ACCEL
> +void smmuv3_accel_init(SMMUv3State *s);
> +#else
> +static inline void smmuv3_accel_init(SMMUv3State *s)
> +{
> +}
> +#endif
> +
> +#endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index bcf8af8dc7..ef991cb7d8 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -32,6 +32,7 @@
>  #include "qapi/error.h"
>  
>  #include "hw/arm/smmuv3.h"
> +#include "smmuv3-accel.h"
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
>  
> @@ -1882,6 +1883,10 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>      Error *local_err = NULL;
>  
> +    if (s->accel) {
> +        smmuv3_accel_init(s);
> +    }
> +
>      c->parent_realize(d, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index d183a62766..bb7076286b 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -63,6 +63,9 @@ struct SMMUv3State {
>      qemu_irq     irq[4];
>      QemuMutex mutex;
>      char *stage;
> +
> +    /* SMMU has HW accelerator support for nested S1 + s2 */
> +    bool accel;
>  };
>  
>  typedef enum {


