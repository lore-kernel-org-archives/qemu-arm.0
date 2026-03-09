Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2FCF3C241
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 12:52:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vza6J-0002Cv-VI; Mon, 09 Mar 2026 08:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vza6G-0002CR-Rb
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 08:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vza6E-000573-0W
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 08:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773060759;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40G9ayOCrNTb05Hj+WRDkI/31PcwhEEHVMSa1UvksJs=;
 b=cx+yUIhptojGSdZiTSju58vzzP3MOyIaTrsCycCu1Kx0Heeh/U6OxrjCqBeeg0ni2jGhSt
 O1O35al68vxgc/RBaepPmrB5quW0ZiHVx2SlLHodCM1fbLiueFvvsWHxQkMLT/4cTAXrq0
 AvGGrrVj2tazbm2LB4GkimLtuS2evDM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-8MidRomdNSC31C3d9Y_Xmw-1; Mon, 09 Mar 2026 08:52:38 -0400
X-MC-Unique: 8MidRomdNSC31C3d9Y_Xmw-1
X-Mimecast-MFC-AGG-ID: 8MidRomdNSC31C3d9Y_Xmw_1773060758
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-483786a09b1so2987925e9.3
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 05:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773060757; x=1773665557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40G9ayOCrNTb05Hj+WRDkI/31PcwhEEHVMSa1UvksJs=;
 b=VkVLNf4CKuzvotw1QpuQjsVDORN9mFce4lCqK+dnGdBDlzZ/FjPJ78UduegMee03ZU
 2jNMEeDmuQNOqJK7wtveN9ZwdQgxrzn0BssFKU+OFcGzXWPdK9K7UVRw9dmfx6mtOMRR
 1rg1LYSc9R+n2jDflgTzGeCYWFIKuUazmHjAbLnbs2UayH2wgsst7bNyy8gJLY5kr/9J
 c6Mzv0kH1VJyPX3PXoRZ6GveH5iHnYYftCOhlGthRiWTqc6BUe15PEBc8iuGZ/FqNrf9
 ZPkHof9/Fq/ZnL+79ZoYmd6NbnLPHKGsSf4PLGSecIq/7xX7zw5TvTrqUAxxiR0UZIE0
 fpdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViz3eRr7Kx55hXGc31l/SXbuxwe7hLfL/sYm5/i8rf8XxICYAHajxm5xa29NteV/Qw9xbjyojJ1Q==@nongnu.org
X-Gm-Message-State: AOJu0YxzvKDnhlItelm8XSyAhgadbUOA7pVh5nBL91oJ46eRJ88VGvYi
 yIMRwbHRTxO4xoI5vF5YXtsf9G1/xYA2MtXPfKYN5VaGBB3V7RsYZWDb68wbGo+0Xv/mXDlqVZu
 usWVB0J66FJMLQ+y4lXVfArp1yb05jrwoZlcYvtf7eqXUcsZ8Q8vlbfMAued9tQ==
X-Gm-Gg: ATEYQzz1pcZsY0Do0/alKnrDIFOZuXgmpj0EFjCNEN73b30dRu2HANQYUI3wnbUaruf
 0+4YrpKUPDxfud/yHikROxaLckKwessKly9Vm9Kh+1zR0z1z4Vk4LXpxOGi4027EjnJYw/hGjOO
 7NuHjVbVczgNtIELmvZqstBpEq6NCurOZYRAusZ+fwL3e5xWTgGLjPo0UWh8bLh+uufGrd8fMPc
 qSDv0O+7I8LN8PT3UwuKHIwtF0nPhMGQlQiFSCntDVsoEE5RG/UJxfXNmatpGD1VtIOohVvaiHb
 acbJHZTIO/MyXLxx3dIt3FkpuknrrbJsgyGbITRlRubbkDhau4sT+ENA1BbiP58sqVPAKa9hGEx
 OyXMnIodUms5b6RD9PFozEzq2lH+Js6YdP2QMeN0jyLvRtsI7ypheZvQCPYaepf0m4VLYOQ==
X-Received: by 2002:a05:6000:430b:b0:439:b1d8:6091 with SMTP id
 ffacd0b85a97d-439da5556a1mr16808343f8f.1.1773060757180; 
 Mon, 09 Mar 2026 05:52:37 -0700 (PDT)
X-Received: by 2002:a05:6000:430b:b0:439:b1d8:6091 with SMTP id
 ffacd0b85a97d-439da5556a1mr16808301f8f.1.1773060756695; 
 Mon, 09 Mar 2026 05:52:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2b9ccsm25718908f8f.19.2026.03.09.05.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 05:52:35 -0700 (PDT)
Message-ID: <775ba0b8-9c6a-414f-a3be-370a32d24c03@redhat.com>
Date: Mon, 9 Mar 2026 13:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/32] hw/arm/tegra241-cmdqv: Add Tegra241 CMDQV ops
 backend stub
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jiandi An <jan@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "phrdina@redhat.com"
 <phrdina@redhat.com>
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-7-skolothumtho@nvidia.com>
 <1d42eed4-d9cd-46a3-9613-00c1b347fa4d@redhat.com>
 <CH3PR12MB7548056692A093B5E6C5B3DCAB79A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548056692A093B5E6C5B3DCAB79A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CQjv26fL2_XQ1I43VrpTYvRbwfEbvei5qJ5Tgq6db5U_1773060758
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 3/9/26 11:48 AM, Shameer Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 09 March 2026 09:18
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>; phrdina@redhat.com
>> Subject: Re: [PATCH v3 06/32] hw/arm/tegra241-cmdqv: Add Tegra241
>> CMDQV ops backend stub
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 2/26/26 11:50 AM, Shameer Kolothum wrote:
>>> Introduce a Tegra241 CMDQV backend that plugs into the SMMUv3
>>> accelerated CMDQV ops interface.
>>>
>>> This patch wires up the Tegra241 CMDQV backend and provides a stub
>>> implementation for CMDQV probe, initialization, vIOMMU allocation and
>>> reset handling.
>>>
>>> Functional CMDQV support is added in follow-up patches.
>>>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/tegra241-cmdqv.h       | 15 ++++++++++
>>>  hw/arm/tegra241-cmdqv-stubs.c | 18 +++++++++++
>>>  hw/arm/tegra241-cmdqv.c       | 56
>> +++++++++++++++++++++++++++++++++++
>>>  hw/arm/Kconfig                |  5 ++++
>>>  hw/arm/meson.build            |  2 ++
>>>  5 files changed, 96 insertions(+)
>>>  create mode 100644 hw/arm/tegra241-cmdqv.h  create mode 100644
>>> hw/arm/tegra241-cmdqv-stubs.c  create mode 100644
>>> hw/arm/tegra241-cmdqv.c
>>>
>>> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h new
>>> file mode 100644 index 0000000000..07e10e86ee
>>> --- /dev/null
>>> +++ b/hw/arm/tegra241-cmdqv.h
>>> @@ -0,0 +1,15 @@
>>> +/*
>>> + * Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All
>>> +rights reserved
>>> + * NVIDIA Tegra241 CMDQ-Virtualiisation extension for SMMUv3
>>> + *
>>> + * Written by Nicolin Chen, Shameer Kolothum
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later  */
>>> +
>>> +#ifndef HW_ARM_TEGRA241_CMDQV_H
>>> +#define HW_ARM_TEGRA241_CMDQV_H
>>> +
>>> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void);
>>> +
>>> +#endif /* HW_ARM_TEGRA241_CMDQV_H */
>>> diff --git a/hw/arm/tegra241-cmdqv-stubs.c
>>> b/hw/arm/tegra241-cmdqv-stubs.c new file mode 100644 index
>>> 0000000000..eedc7bfdcd
>>> --- /dev/null
>>> +++ b/hw/arm/tegra241-cmdqv-stubs.c
>>> @@ -0,0 +1,18 @@
>>> +/*
>>> + * Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All
>>> +rights reserved
>>> + *
>>> + * Stubs for Tegra241 CMDQ-Virtualiisation extension for SMMUv3
>> ^typo
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "hw/arm/smmuv3.h"
>>> +#include "smmuv3-accel.h"
>>> +#include "hw/arm/tegra241-cmdqv.h"
>>> +
>>> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void) {
>>> +    return NULL;
>>> +}
>>> +
>>> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c new
>>> file mode 100644 index 0000000000..ad5a0d4611
>>> --- /dev/null
>>> +++ b/hw/arm/tegra241-cmdqv.c
>>> @@ -0,0 +1,56 @@
>>> +/*
>>> + * Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All
>>> +rights reserved
>>> + * NVIDIA Tegra241 CMDQ-Virtualization extension for SMMUv3
>>> + *
>>> + * Written by Nicolin Chen, Shameer Kolothum
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later  */
>>> +
>>> +#include "qemu/osdep.h"
>>> +
>>> +#include "hw/arm/smmuv3.h"
>>> +#include "smmuv3-accel.h"
>>> +#include "tegra241-cmdqv.h"
>>> +
>>> +static void tegra241_cmdqv_free_viommu(SMMUv3State *s) { }
>>> +
>>> +static bool
>>> +tegra241_cmdqv_alloc_viommu(SMMUv3State *s,
>> HostIOMMUDeviceIOMMUFD *idev,
>>> +                            uint32_t *out_viommu_id, Error **errp) {
>>> +    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
>>> +    return false;
>>> +}
>>> +
>>> +static void tegra241_cmdqv_reset(SMMUv3State *s) { }
>>> +
>>> +static bool tegra241_cmdqv_init(SMMUv3State *s, Error **errp) {
>>> +    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
>>> +    return false;
>>> +}
>>> +
>>> +static bool tegra241_cmdqv_probe(SMMUv3State *s,
>> HostIOMMUDeviceIOMMUFD *idev,
>>> +                                 Error **errp) {
>>> +    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
>>> +    return false;
>>> +}
>>> +
>>> +static const SMMUv3AccelCmdqvOps tegra241_cmdqv_ops = {
>>> +    .probe = tegra241_cmdqv_probe,
>>> +    .init = tegra241_cmdqv_init,
>>> +    .alloc_viommu = tegra241_cmdqv_alloc_viommu,
>>> +    .free_viommu = tegra241_cmdqv_free_viommu,
>>> +    .reset = tegra241_cmdqv_reset,
>> I think I would create a no_cmdqv_ops to convert the existing code without
>> any cmdqv support to the same api. This would avoid the repeating:
>>
>> if (cmdqv_ops && cmdqv_ops-><func>) check in subsequent patches.
> I guess you are suggesting having something like,
>
> static const SMMUv3AccelCmdqvOps no_cmdqv_ops = {
>     .probe = no_cmdqv_probe,
>     .alloc_viommu = no_cmdqv_alloc_viommu,
>     ...
> };
>
> static bool no_cmdqv_probe(SMMUv3State *s,
>                            HostIOMMUDeviceIOMMUFD *idev,
>                            Error **errp)
> {
>     return true;
> }
>
> static bool no_cmdqv_alloc_viommu(SMMUv3State *s,
>                                   HostIOMMUDeviceIOMMUFD *idev,
>                                   uint32_t *id,
>                                   Error **errp)
> {
>    return false; /* We have to call the default vIOMMU alloc*/
> }
>
> And then call them directly. I will take a look at that approach.

Well forget it, I don't think it is worth the pain.
>
>> Also this looks a bit strange to have different signatures for the functions used
>> with both vcmdq on and off
> Is the concern here is mainly around alloc_viommu( that is the one which require fallback
> to default vIOMMU alloc)?
>
> static bool
> smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                           Error **errp)
>
> and 
>
> bool (*alloc_viommu)(SMMUv3State *s,
>                          HostIOMMUDeviceIOMMUFD *idev,
>                          uint32_t *out_viommu_id,
>                          Error **errp);
>
> Making those consistent would likely require some refactoring of the
> existing path. I will have a play with that and see.

Same here. That's OK for now.

Thanks

Eric
>
> Thanks,
> Shameer
>
>> Eric
>>
>>
>>> +};
>>> +
>>> +const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void) {
>>> +    return &tegra241_cmdqv_ops;
>>> +}
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig index
>>> c66c452737..3305c6e76e 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -626,6 +626,10 @@ config FSL_IMX8MP_EVK
>>>      depends on TCG
>>>      select FSL_IMX8MP
>>>
>>> +config TEGRA241_CMDQV
>>> +    bool
>>> +    depends on ARM_SMMUV3_ACCEL
>>> +
>>>  config ARM_SMMUV3_ACCEL
>>>      bool
>>>      depends on ARM_SMMUV3
>>> @@ -633,6 +637,7 @@ config ARM_SMMUV3_ACCEL  config
>> ARM_SMMUV3
>>>      bool
>>>      select ARM_SMMUV3_ACCEL if IOMMUFD
>>> +    imply TEGRA241_CMDQV
>>>
>>>  config FSL_IMX6UL
>>>      bool
>>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>>> index 8f834c32b1..fc83b635e7 100644
>>> --- a/hw/arm/meson.build
>>> +++ b/hw/arm/meson.build
>>> @@ -88,6 +88,8 @@ arm_common_ss.add(when:
>> 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
>>>  arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true:
>> files('smmuv3.c'))
>>>  arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true:
>> files('smmuv3-accel.c'))
>>>  stub_ss.add(files('smmuv3-accel-stubs.c'))
>>> +arm_common_ss.add(when: 'CONFIG_TEGRA241_CMDQV', if_true:
>> files('tegra241-cmdqv.c'))
>>> +stub_ss.add(files('tegra241-cmdqv-stubs.c'))
>>>  arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-
>> imx6ul.c', 'mcimx6ul-evk.c'))
>>>  arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true:
>> files('nrf51_soc.c'))
>>>  arm_common_ss.add(when: 'CONFIG_XEN', if_true: files(


