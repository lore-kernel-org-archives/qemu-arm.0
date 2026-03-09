Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D0DF3C245
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 13:00:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzaDR-0003zC-55; Mon, 09 Mar 2026 09:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzaDO-0003ye-Bk
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 09:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzaDM-0006nh-Be
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 09:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773061201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7q6Mt0SWI7ULkaVLz4mPtkMohfy5sqHJ6PlaNnk+v8=;
 b=M96unkjwZ8suhESsPOxZq0CR4+jkuzAFuWlht1EK7ZKIcTuldAV2k5qYNLe3JQoQFvhY33
 uVbLrcCE39+cMzYlQIx5zrX1Wg0qDvPw8doPhZACLfJM77Hbd/UnzIuZrj6+BHdbG1lA+K
 CQcc1ZhBC1mCHLAHFLXmdMA8tJVqKqk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-SyjPLvxnO5iA6bj0HnhEAg-1; Mon, 09 Mar 2026 09:00:00 -0400
X-MC-Unique: SyjPLvxnO5iA6bj0HnhEAg-1
X-Mimecast-MFC-AGG-ID: SyjPLvxnO5iA6bj0HnhEAg_1773061199
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b96e8e87061so131522866b.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 06:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773061199; x=1773665999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7q6Mt0SWI7ULkaVLz4mPtkMohfy5sqHJ6PlaNnk+v8=;
 b=C6TOGGGhWMlESYCqwwqibQy2v0D+GYGwfXuIrXaIQ+p1SDh61ye+nSO5yq4idMvbEB
 XFGTeJIWcMLsz4UahPZSuSMVCzA6x763T0yZNn7mS/qm1uSEBJa5yZB9c/HGiIUIUF6q
 aQwZ4eAepBhTIFGV6R5e1x/cVohaJtzdMwmr/cyIIW/zFrWvIs9BnnXR8alz7uucWCtX
 +3Jr9tPPudDvzJJBDS0fSNvCdw87XlKsJKdkOBL1rBimQcaE34kwDY2lnJ5PfUevMpHJ
 4qlj5Nq6h9BlNSl4VZwK4GFb6OJlvUbhcIXJGb3KPJmZiWENRtsgyW7UQnoNI5g5xMgD
 mKiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe4xTili1KrQofALSlzem8aB+ETqbJJ4EQ8kXFVoX+9ym9vCO6hpwK2DRkMmcZpJrkqiVLvgktvQ==@nongnu.org
X-Gm-Message-State: AOJu0YxdmqTIYErV1ZUB+2K4XlxUwlTNqjW+umFuJIRAQ1EsDFU9tFL2
 tfb2MncBhmxxtbwFBwHT4q+CVy5wpF0broky5x+OHersjbBxdISWLkjifL10HaQOzRMK716Ne9f
 558/d03NuXwQXgSvO3qY2nysF8b3IIId2muNlq371VBKgsMOAFcXiFw==
X-Gm-Gg: ATEYQzyriN5kadmSu14t3dVcSycSiEmTqOG7oxeuuVeSogDZMN/HCHdE+4102W04krP
 XYKkQDXKR6XpoImDJgLuHRu8uJkgTla0egIXOK0pO1ZA7meYQGobVdOryRZwbTP4R/kc77OggUf
 VGiuZVrEEiid04rbUWEPXg1dOzUmL3/YW5Y7fntkKoWScqiyuka6KNs1cE6UlzIgQ5UN5YGtVxf
 MlJvSkGmCcNTvCKEnwKjl6QTcg0JM0yJ251RZahgCindOC5ryfajmeeM3RgsECCDaGrWA+SZaOf
 sKJqBEqfB4CmWumsT4W9l6byaU0mwHQrWyqrKW8evboEKmfZF3n39EJMxguHIWXKbD9O0+RhHoF
 dDhiGjp9buK0ZEwcJPFqxneC+Jvwz1c3z31H319Aq6cX0dqgVmJwGmu37/J7xb2xfLFgLoA==
X-Received: by 2002:a17:907:728e:b0:b87:1e94:ef6a with SMTP id
 a640c23a62f3a-b942dfa042emr686968166b.47.1773061198963; 
 Mon, 09 Mar 2026 05:59:58 -0700 (PDT)
X-Received: by 2002:a17:907:728e:b0:b87:1e94:ef6a with SMTP id
 a640c23a62f3a-b942dfa042emr686964466b.47.1773061198391; 
 Mon, 09 Mar 2026 05:59:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b942f139e24sm371829466b.38.2026.03.09.05.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 05:59:57 -0700 (PDT)
Message-ID: <8f010ea3-b5ef-45bb-b4ad-c46359c30b48@redhat.com>
Date: Mon, 9 Mar 2026 13:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/32] hw/arm/tegra241-cmdqv: Add Tegra241 CMDQV ops
 backend stub
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-7-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-7-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -hJr5pwGp1Nw89K_jH0HEAr_mKBEBaGsYCFBJtZEPzE_1773061199
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/26/26 11:50 AM, Shameer Kolothum wrote:
> Introduce a Tegra241 CMDQV backend that plugs into the SMMUv3 accelerated
> CMDQV ops interface.
>
> This patch wires up the Tegra241 CMDQV backend and provides a stub
> implementation for CMDQV probe, initialization, vIOMMU allocation
> and reset handling.
>
> Functional CMDQV support is added in follow-up patches.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h       | 15 ++++++++++
>  hw/arm/tegra241-cmdqv-stubs.c | 18 +++++++++++
>  hw/arm/tegra241-cmdqv.c       | 56 +++++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig                |  5 ++++
>  hw/arm/meson.build            |  2 ++
>  5 files changed, 96 insertions(+)
>  create mode 100644 hw/arm/tegra241-cmdqv.h
>  create mode 100644 hw/arm/tegra241-cmdqv-stubs.c
>  create mode 100644 hw/arm/tegra241-cmdqv.c
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> new file mode 100644
> index 0000000000..07e10e86ee
> --- /dev/null
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -0,0 +1,15 @@
> +/*
> + * Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved
> + * NVIDIA Tegra241 CMDQ-Virtualiisation extension for SMMUv3
> + *
> + * Written by Nicolin Chen, Shameer Kolothum
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_ARM_TEGRA241_CMDQV_H
> +#define HW_ARM_TEGRA241_CMDQV_H
> +
> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void);
> +
> +#endif /* HW_ARM_TEGRA241_CMDQV_H */
> diff --git a/hw/arm/tegra241-cmdqv-stubs.c b/hw/arm/tegra241-cmdqv-stubs.c
> new file mode 100644
> index 0000000000..eedc7bfdcd
> --- /dev/null
> +++ b/hw/arm/tegra241-cmdqv-stubs.c
> @@ -0,0 +1,18 @@
> +/*
> + * Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved
> + *
> + * Stubs for Tegra241 CMDQ-Virtualiisation extension for SMMUv3
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/arm/smmuv3.h"
> +#include "smmuv3-accel.h"
> +#include "hw/arm/tegra241-cmdqv.h"
not sure you need all those headers for the stub

Eric
> +
> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void)
> +{
> +    return NULL;
> +}
> +
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> new file mode 100644
> index 0000000000..ad5a0d4611
> --- /dev/null
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -0,0 +1,56 @@
> +/*
> + * Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved
> + * NVIDIA Tegra241 CMDQ-Virtualization extension for SMMUv3
> + *
> + * Written by Nicolin Chen, Shameer Kolothum
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "hw/arm/smmuv3.h"
> +#include "smmuv3-accel.h"
> +#include "tegra241-cmdqv.h"
> +
> +static void tegra241_cmdqv_free_viommu(SMMUv3State *s)
> +{
> +}
> +
> +static bool
> +tegra241_cmdqv_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
> +                            uint32_t *out_viommu_id, Error **errp)
> +{
> +    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
> +    return false;
> +}
> +
> +static void tegra241_cmdqv_reset(SMMUv3State *s)
> +{
> +}
> +
> +static bool tegra241_cmdqv_init(SMMUv3State *s, Error **errp)
> +{
> +    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
> +    return false;
> +}
> +
> +static bool tegra241_cmdqv_probe(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
> +                                 Error **errp)
> +{
> +    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
> +    return false;
> +}
> +
> +static const SMMUv3AccelCmdqvOps tegra241_cmdqv_ops = {
> +    .probe = tegra241_cmdqv_probe,
> +    .init = tegra241_cmdqv_init,
> +    .alloc_viommu = tegra241_cmdqv_alloc_viommu,
> +    .free_viommu = tegra241_cmdqv_free_viommu,
> +    .reset = tegra241_cmdqv_reset,
> +};
> +
> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void)
> +{
> +    return &tegra241_cmdqv_ops;
> +}
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index c66c452737..3305c6e76e 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -626,6 +626,10 @@ config FSL_IMX8MP_EVK
>      depends on TCG
>      select FSL_IMX8MP
>  
> +config TEGRA241_CMDQV
> +    bool
> +    depends on ARM_SMMUV3_ACCEL
> +
>  config ARM_SMMUV3_ACCEL
>      bool
>      depends on ARM_SMMUV3
> @@ -633,6 +637,7 @@ config ARM_SMMUV3_ACCEL
>  config ARM_SMMUV3
>      bool
>      select ARM_SMMUV3_ACCEL if IOMMUFD
> +    imply TEGRA241_CMDQV
>  
>  config FSL_IMX6UL
>      bool
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 8f834c32b1..fc83b635e7 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -88,6 +88,8 @@ arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
>  arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>  arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
>  stub_ss.add(files('smmuv3-accel-stubs.c'))
> +arm_common_ss.add(when: 'CONFIG_TEGRA241_CMDQV', if_true: files('tegra241-cmdqv.c'))
> +stub_ss.add(files('tegra241-cmdqv-stubs.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>  arm_common_ss.add(when: 'CONFIG_XEN', if_true: files(


