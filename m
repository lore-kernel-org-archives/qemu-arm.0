Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8E1EE368D
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 14:28:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqXfS-0001hw-DI; Thu, 12 Feb 2026 09:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqXfQ-0001hV-L9
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:27:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqXfO-00020j-Mx
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770906457;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0oZt3CPgTlaglxzNcDmSSF0hYIldVkDAkiG1wJ2e+60=;
 b=AVIoO2JY++FKJP9NcVdy2pcDXBcbZEBjv2/rrdCa4h3F0kMP5RAKK6jMVk9SkYSOTgVtjD
 hXDUcSbiVCwPiNU2+KFTAV7x+Y54HF5LMdXgBmCdO8Qo6NcxjxuAfUmZ1FssLWCWwa5Q8S
 pEZ4dcqB7JvZsCKvj4d6xQ96I69t6DM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-4aLlq0uEMpqNcYXJtGEMaA-1; Thu, 12 Feb 2026 09:27:35 -0500
X-MC-Unique: 4aLlq0uEMpqNcYXJtGEMaA-1
X-Mimecast-MFC-AGG-ID: 4aLlq0uEMpqNcYXJtGEMaA_1770906455
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4376761037bso1374692f8f.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 06:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770906454; x=1771511254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0oZt3CPgTlaglxzNcDmSSF0hYIldVkDAkiG1wJ2e+60=;
 b=sRMjzqiZoRggXUciK/+QLwRXsyBHeamLEu6aUm7Aa6bcUkPCNOlgvNsQ1DbLNG3cgC
 J746aRVkxkNEN5Y1h6SdMbeTTat5W9Y005MVgv2I8XkELDBi+lmKKrKCGDvx+LJLuX70
 33XiQV6hvM1D4mvtsqK5GI2PF1lMvOey2xt3wb0PFEXM5fwkV6JtDU9nezLp+acmO589
 ZM84uCWlA6kdFs8xo5cSPUypIylhtFOlO4ajA7hcqKuvSE1rkHKetvAJ4TbAU4jjsq05
 vpLCXMpAwnrFU8YwE2Vp2rYXDxClHia80aQRNxhCOqTKpCvl0P7g9uyKGKxJ6/RtZctC
 5UFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ5+WxP/QcygOnyQuMkJM0gcU36uvq6ITsAcNG4OcDh3E7RnJSodEgDRD6ZYVYXuwooccfwdrfNw==@nongnu.org
X-Gm-Message-State: AOJu0Yy2A9lvNwNSshwMBswoUvEs6aSP9+ctJH0sZwvyzvCjiYDRxdtt
 2R39BwBXoZ3cfnDM9hWBOYd8WFxowlszZEoahDXuK3V8rIV+rnpUkSuzSq1NE/RZ298yjUQEn0+
 4LMtay/WE9kqq+X0gSUcKE1YPSKIsH6YDcM9QHs/YJHN66IqOGX9DDQ==
X-Gm-Gg: AZuq6aIhrQMqAfJHppUSAxtWzej/kSPDc68nwo9gdC7JqXhdojgszQKRCHYTHOz94g6
 3nYQzTQM+3BjyXA08Gvpl9o2B97KUqH3mskmnKrPsn2iF2OdPaLKu9e7m8ki9JJKP74i0RJDcHO
 GKYeBHyr9XJx80Qdk7anCKJyAWHt7e7sdSnd1AbvJwxpn+w00WIDPNS1W64hTO0l84oYYlQvNJ8
 gcqIhJEJnPM6GJ214Q1/lh/EFBRRzQUhv2J9mluSc5GVcyrU8ISlb6+ja3jL1S+41MDQ3ghtTL1
 posvC6Tc5pbG4cuREYJruGFnX/zeD6SmSehryErveP46i8MspZcXrqySLaXhU8frJVE+L7bLDFU
 yOLEMcAvkJhFpebBBykjjlFwGII4eSpjnERefA9NnXWmzvUBrMjaCGBXXM2h3JZ9R+xXoQQ==
X-Received: by 2002:a05:600d:6405:10b0:481:a662:b3f3 with SMTP id
 5b1f17b1804b1-48366000be0mr28920105e9.7.1770906454505; 
 Thu, 12 Feb 2026 06:27:34 -0800 (PST)
X-Received: by 2002:a05:600d:6405:10b0:481:a662:b3f3 with SMTP id
 5b1f17b1804b1-48366000be0mr28919645e9.7.1770906454108; 
 Thu, 12 Feb 2026 06:27:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd20519sm207781085e9.15.2026.02.12.06.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 06:27:33 -0800 (PST)
Message-ID: <0cd3bc01-7213-4cc5-996f-e8a518ffd0a3@redhat.com>
Date: Thu, 12 Feb 2026 15:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/24] hw/arm/tegra241-cmdqv: Add Tegra241 CMDQV ops
 backend stub
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-7-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-7-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o5tgwQVcCMLel-bYejjwFDzadIWEgtIC8ya5-Hs9ttk_1770906455
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> Introduce a Tegra241 CMDQV backend that plugs into the SMMUv3 accelerated
> CMDQV ops interface.
>
> This patch wires up the Tegra241 CMDQV backend and provides a stub
> implementation for CMDQV initialization, vIOMMU/vEVENTQ allocation
> and reset handling.
>
> Functional CMDQV support is added in follow-up patches.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/Kconfig          |  5 ++++
>  hw/arm/meson.build      |  1 +
>  hw/arm/tegra241-cmdqv.c | 60 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/tegra241-cmdqv.h | 23 ++++++++++++++++
>  4 files changed, 89 insertions(+)
>  create mode 100644 hw/arm/tegra241-cmdqv.c
>  create mode 100644 hw/arm/tegra241-cmdqv.h
>
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
> index c250487e64..4ec91db50a 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -86,6 +86,7 @@ arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx8mp.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
> +arm_ss.add(when: 'CONFIG_TEGRA241_CMDQV', if_true: files('tegra241-cmdqv.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
>  arm_common_ss.add(when: 'CONFIG_XEN', if_true: files(
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> new file mode 100644
> index 0000000000..6f30ca035b
> --- /dev/null
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -0,0 +1,60 @@
> +/*
> + * Copyright (C) 2025, NVIDIA CORPORATION
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
> +static void tegra241_cmdqv_free_veventq(SMMUv3State *s)
> +{
> +}
> +
> +static bool tegra241_cmdqv_alloc_veventq(SMMUv3State *s, Error **errp)
> +{
> +    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
> +    return false;
> +}
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
> +static const SMMUv3AccelCmdqvOps tegra241_cmdqv_ops_impl = {
> +    .init = tegra241_cmdqv_init,
> +    .alloc_viommu = tegra241_cmdqv_alloc_viommu,
> +    .free_viommu = tegra241_cmdqv_free_viommu,
> +    .alloc_veventq = tegra241_cmdqv_alloc_veventq,
> +    .free_veventq = tegra241_cmdqv_free_veventq,
> +    .reset = tegra241_cmdqv_reset,
> +};
> +
> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_ops(void)
> +{
> +    return &tegra241_cmdqv_ops_impl;
> +}
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> new file mode 100644
> index 0000000000..81c9deb384
> --- /dev/null
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (C) 2025, NVIDIA CORPORATION
> + * NVIDIA Tegra241 CMDQ-Virtualiisation extension for SMMUv3
> + *
> + * Written by Nicolin Chen, Shameer Kolothum
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_TEGRA241_CMDQV_H
nit: to match existing pattern this should be HW_ARM_TEGRA241_CMDQV_H
> +#define HW_TEGRA241_CMDQV_H
> +
> +#include CONFIG_DEVICES
> +
> +#ifdef CONFIG_TEGRA241_CMDQV
> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_ops(void);
> +#else
> +static inline const SMMUv3AccelCmdqvOps *tegra241_cmdqv_ops(void)
> +{
> +    return NULL;
> +}
> +#endif
> +#endif /* HW_TEGRA241_CMDQV_H */


