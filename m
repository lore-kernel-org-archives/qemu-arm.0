Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200D7FF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:19:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJv5F-00045d-Bu; Mon, 04 May 2026 11:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJv5E-00044p-DH
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJv5C-0000Rf-IN
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777907981;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLF3cVwZLFVPx9+1zUeFAQ710Kkrm/ftA6boOLLH1Rs=;
 b=MKC8Y6hLhWz582K0yFJrsmA6cXYgkAY19Olat7+1jvsE3UEdCZ+BlqnL0EO5OkAIcPe+S2
 QhwvqgbEILfbNY9zQdtaLlL6Dwip3KGJROcVnY1bZnCNHKCpT8id0GMQzMBxydZegBBKFC
 t2+KzB3X96lkWv0d6jmNua4BPJyTf1E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-qWCiYqKPNT-F3dwxX4OCzA-1; Mon, 04 May 2026 11:19:39 -0400
X-MC-Unique: qWCiYqKPNT-F3dwxX4OCzA-1
X-Mimecast-MFC-AGG-ID: qWCiYqKPNT-F3dwxX4OCzA_1777907978
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48a55de6fb0so34285675e9.3
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777907978; x=1778512778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLF3cVwZLFVPx9+1zUeFAQ710Kkrm/ftA6boOLLH1Rs=;
 b=rqZL3w1/Xof/3BzzRJCgoiyqG82US/NWxzAqcZVttjZh0tMGuc/NnqLn+y9o81i5dE
 7Hmj1NeF5mCkxjpYMernCQAqrBxJA7LbKVSnUneo5ppkAfAnS/oaId6xnN8S8wISvWzh
 Q7ojonWsUnQfy/7G/ve54NVnlRbXQyzupbAXV+VXF4uiokET46HWFZ6+bNgevziZlDun
 Ofv2PCW4NgDOpqrcmmRIrbJKlODXdvxt4pd6/y8V6YUX+/gQwkGFQrciprdzS4kW+f+/
 F/9axf60BsmwOCVX8P75Xbybats1fC0aemFivtv0a3NMpi6JnoxujNdaUeU47/TAjLRo
 oYTw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+38kZ7YHkaIid9paGHO3ePwGJUeaGUPBOru6qKsP/Knbx9Q4NkQfdv+Za7bg9XGh5Q9689YzD2vA==@nongnu.org
X-Gm-Message-State: AOJu0YyUFo6xQ9Tj+So/ACfQrfyzkb+pJ3bbQjAsGxJNo4/tG+6XIeUA
 VaWh78k3Clh98oRN/GJW6+LVyhhU9Hv+aVs0/tu7WKDvOSkTciqhM2GRfaTu53bZ19FAlvwlyIX
 +tkAcIg0+ejHSKw2x+afRSxxgPKbhMR1jBGR6bFYCzEbEP+AN38AZaQ==
X-Gm-Gg: AeBDies/On0J3OZ/72rFySZezh2SHmUI08/+CeFgeRO31rVvCFgCwBogPV0www2BnGW
 bpl87y7Az+oftmmvvjVYwzT5GYpXyg4ky3et9Der9bmo5EWmYP3yWlBdbAZDVmBHIJtX+IWjgM2
 kI49/iv830IjZ5oNWX2vV2zT8n4q+qhLSlTQQLMOifPHOYEpVGmA3R2+aw5zCh4Y2aM7osi4cAS
 dzuXgtDwcA7/DpPAYH8XsdA8K0rfRFNxslPLMaw9N84mGbnhBX3Gqm36gjdPZm2DP3mfkihX7b4
 N3d/rzc4rR/8H5M5qjgRbTFVl2EoSiE1SVBE1pJ51sfn34yoHgrTYR6fV3J4r/57FRtE/EzrvGG
 Be2x697WRMLRiMsG/aIyu306vRplcUW4GYSL83tE5qxztaSff0Jk8kyuKN7oYsJm2LIvzBAwFVL
 vSVeIT
X-Received: by 2002:a05:600c:4ed2:b0:488:a882:c7 with SMTP id
 5b1f17b1804b1-48a98671da2mr175018575e9.25.1777907978221; 
 Mon, 04 May 2026 08:19:38 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed2:b0:488:a882:c7 with SMTP id
 5b1f17b1804b1-48a98671da2mr175017745e9.25.1777907977761; 
 Mon, 04 May 2026 08:19:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8feb3659sm96864065e9.14.2026.05.04.08.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:19:37 -0700 (PDT)
Message-ID: <4eb065fa-69d7-4b0f-851d-1ab10c7512f7@redhat.com>
Date: Mon, 4 May 2026 17:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/31] hw/arm/tegra241-cmdqv: Add Tegra241 CMDQV ops
 backend stub
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-8-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-8-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bw_UilDcsA1kHveeYrcYHeBeb1Kap8Hs1tM5m1iYEKU_1777907978
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/15/26 12:55 PM, Shameer Kolothum wrote:
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
>  hw/arm/tegra241-cmdqv-stubs.c | 16 ++++++++++
>  hw/arm/tegra241-cmdqv.c       | 56 +++++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig                |  5 ++++
>  hw/arm/meson.build            |  2 ++
>  5 files changed, 94 insertions(+)
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
virtualization
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
> index 0000000000..eabf90daf8
> --- /dev/null
> +++ b/hw/arm/tegra241-cmdqv-stubs.c
> @@ -0,0 +1,16 @@
> +/*
> + * Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved
> + *
> + * Stubs for Tegra241 CMDQ-Virtualiisation extension for SMMUv3
same
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "smmuv3-accel.h"
> +#include "hw/arm/tegra241-cmdqv.h"
> +
> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void)
> +{
> +    return NULL;
> +}
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
> index 4e50fb1111..073f2ebaaf 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -618,6 +618,10 @@ config FSL_IMX8MP_EVK
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
> @@ -625,6 +629,7 @@ config ARM_SMMUV3_ACCEL
>  config ARM_SMMUV3
>      bool
>      select ARM_SMMUV3_ACCEL if IOMMUFD
> +    imply TEGRA241_CMDQV
>  
>  config FSL_IMX6UL
>      bool
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 3be1252c4f..64bcdc5a7c 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -87,6 +87,8 @@ arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
>  arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>  arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
>  stub_ss.add(files('smmuv3-accel-stubs.c'))
> +arm_common_ss.add(when: 'CONFIG_TEGRA241_CMDQV', if_true: files('tegra241-cmdqv.c'))
> +stub_ss.add(files('tegra241-cmdqv-stubs.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>  arm_common_ss.add(when: 'CONFIG_XEN', if_true: files(
Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric




