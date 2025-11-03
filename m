Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7756DCCF9FE
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 13:43:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFunC-0007O8-Md; Mon, 03 Nov 2025 08:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFun6-0007JD-M1
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 08:40:13 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFumx-0004UD-QM
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 08:40:12 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47719ad0c7dso38557865e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 05:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762177197; x=1762781997; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ErTpQkwzrQmZsvx4oeCs0KM2vR7S1giusexASob2U0=;
 b=OEDPeJo+g+ucn4xkkCQWs+82eNGXHJ7UZYrdLfhCwSXPV5qz+D9HglK3OH6Sd+99zn
 KiAmL8clpXMpCNtlSoRtBrVOPWvpear9Nu2aqATUhJSu8rmIXQC9EA5F5hNMqs8wSnRw
 gRV+Yr1AyPOloGrtLJZ8iW4kPb1I7MDxhwJXeYme2KDr0N3iM9MXqJ1K8CRV63qIMUDy
 olPfQClZXTPUz5zT+0TWuTgnAHk9ZHHksNPOmJJQXBIS60WCBUqSFKrQy6Plgp9SdiiK
 5Pyq9YGM/8HvbfAWl0nfEuz4ABrTPzrydDazjrt+DjSUZfiGXEvA3u+UeukFbzT514vr
 Byxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762177197; x=1762781997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ErTpQkwzrQmZsvx4oeCs0KM2vR7S1giusexASob2U0=;
 b=MPXziZyMQ+80s6NpD4MHtS7GaeaH+z0e5HIMwomL5QrlSpJrpk9zas2sW7QluN2tO0
 /fcbioAGIfkWJGu0Kl0rwe48KoyNCYy0kn+r2XL+V3e0do3vCgA2DCSv73Dt2yDIkoqb
 kYshIYq7c/kDtioqMsXurgvpPx8F9RSY2n+B6kfbVlqGK2vVpUBsJHXdE9cBEJHBZ4Fq
 15DE9ZA22gpRD2t2mHR7aFz8jhH+QhNGwqAtw41eOfgoQj9r80NKxCnubm1caZCGSarE
 tPOSYzQmsUFaZ+Dxg4bTMBzShvo6tTCknskl/FSHfVStHQLLiSq4FM6VSCWOZw+pSBA1
 uvCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkULKJzx45XYiQMYKCQomSCzh30TAsEJBIag18FAFcVSpgFcwSdSG4PEvhbik/tKeROlQ6my3pow==@nongnu.org
X-Gm-Message-State: AOJu0Yx6wYgi9bQZBQ/CI9q9xs52lNUyA2HPU/LbDDsGH8kBluevk+lc
 Vm5HHlHBlkaKhWee/U8VutSrKWI5R/i/VqZH+tMACrWb6M2vCSjCh9Gjm6JR12YylkA=
X-Gm-Gg: ASbGncsMdcEM+IxWM+4Cru4rUD1m3ELMS0s4xW3C4goG4sWYKAPfdJJGgGfZ/8S5a09
 44mi/c/OvwelALlfwpa5zPbUYTmHN+LXzoJUNnu76gGg+QE+ruZjIhRhiP1Q8jqdCAg6I+JnuMI
 m+ZWYR8RHLGAAOaN8i5ZxtunWzv7ozn8I2AHIhZp+7dmQDwLodUPwzcZ6YAOvf8I6yo+3eVPNIF
 1uqZoaVTglQIuw1fNzE/92aaXABdR+E7IFqHdyzx4HkyKfDlxk6zuu8vbseVXPdrMEUeRp6fZPe
 UG+FuiHpcdBfUyNxUdmqUEex0F6SjxbhvrD7HUxQGTLREsudkYZPSXI2pFEphGkCa3MEL5/ZfLs
 DH6QKNIMYWdUYntbph3b6sACJEvmohgjRnrfQhTaObeTLZH753FlYGnrwu4HrO4uf8NSUiTlffg
 DmijNcsOUg/aVp/8oDnBHC956RwCOvF3JWtkB4RY0+vKA8KUfOHh4a
X-Google-Smtp-Source: AGHT+IGCX8gIpsPJyunbJLf3pmjZrnE3A8OXqHARBr9Zs0lA3tjGRIG0U0Bsa068MNDlFDfZzfjssg==
X-Received: by 2002:a05:600c:19d1:b0:471:747:2116 with SMTP id
 5b1f17b1804b1-477308b943dmr116875225e9.41.1762177197083; 
 Mon, 03 Nov 2025 05:39:57 -0800 (PST)
Received: from [172.18.140.215] (ip-185-104-138-156.ptr.icomera.net.
 [185.104.138.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fabe202sm90517505e9.0.2025.11.03.05.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 05:39:56 -0800 (PST)
Message-ID: <ea91137e-e5af-414b-86e2-2de7373bcb05@linaro.org>
Date: Mon, 3 Nov 2025 14:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/32] hw/arm/smmuv3-accel: Initialize shared system
 address space
Content-Language: en-US
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com,
 Peter Xu <peterx@redhat.com>, Mark Cave-Ayland <mark.caveayland@nutanix.com>
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-7-skolothumtho@nvidia.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251031105005.24618-7-skolothumtho@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

On 31/10/25 11:49, Shameer Kolothum wrote:
> To support accelerated SMMUv3 instances, introduce a shared system-wide
> AddressSpace (shared_as_sysmem) that aliases the global system memory.
> This shared AddressSpace will be used in a subsequent patch for all
> vfio-pci devices behind all accelerated SMMUv3 instances within a VM.
> 
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   hw/arm/smmuv3-accel.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 99ef0db8c4..f62b6cf2c9 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -11,6 +11,15 @@
>   #include "hw/arm/smmuv3.h"
>   #include "smmuv3-accel.h"
>   
> +/*
> + * The root region aliases the global system memory, and shared_as_sysmem
> + * provides a shared Address Space referencing it. This Address Space is used
> + * by all vfio-pci devices behind all accelerated SMMUv3 instances within a VM.
> + */
> +MemoryRegion root;
> +MemoryRegion sysmem;

Why can't we store that in SMMUv3State?

> +static AddressSpace *shared_as_sysmem;

FYI we have object_resolve_type_unambiguous() to check whether an
instance exists only once (singleton).

> +
>   static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
>                                                  PCIBus *bus, int devfn)
>   {
> @@ -51,9 +60,27 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>       .get_address_space = smmuv3_accel_find_add_as,
>   };
>   
> +static void smmuv3_accel_as_init(SMMUv3State *s)
> +{
> +
> +    if (shared_as_sysmem) {
> +        return;
> +    }
> +
> +    memory_region_init(&root, OBJECT(s), "root", UINT64_MAX);
> +    memory_region_init_alias(&sysmem, OBJECT(s), "smmuv3-accel-sysmem",
> +                             get_system_memory(), 0,
> +                             memory_region_size(get_system_memory()));
> +    memory_region_add_subregion(&root, 0, &sysmem);
> +
> +    shared_as_sysmem = g_new0(AddressSpace, 1);
> +    address_space_init(shared_as_sysmem, &root, "smmuv3-accel-as-sysmem");
> +}
> +
>   void smmuv3_accel_init(SMMUv3State *s)
>   {
>       SMMUState *bs = ARM_SMMU(s);
>   
>       bs->iommu_ops = &smmuv3_accel_ops;
> +    smmuv3_accel_as_init(s);
>   }


