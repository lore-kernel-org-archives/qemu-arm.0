Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA0ACD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 13:31:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUlh2-0008I9-BB; Wed, 03 Jun 2026 09:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wUlgz-0008Hi-El
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 09:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wUlgw-00033f-T8
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 09:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780493488;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NClKrh1w7sQfgBR0erzztR5juE216bC7a2pQEV9Eg1k=;
 b=ObZmfeASgnh26o/rabYN/I/hLaX3gABVIelcN9yO9359TmPym7Z2izreLIPibpmlm1zRps
 LKbHN2wbObzEbPigOunngtdoQM/cfpuo353VV1upQkc+lKngmkDIMrFDN6+qw0g8g3bwHd
 JSfOJB3QfE1vpxG7fqj827sgkLacbqY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-dfZfuKy9M--hEt75BKgVfA-1; Wed, 03 Jun 2026 09:31:24 -0400
X-MC-Unique: dfZfuKy9M--hEt75BKgVfA-1
X-Mimecast-MFC-AGG-ID: dfZfuKy9M--hEt75BKgVfA_1780493483
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-bec405b1c6fso324805966b.0
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2026 06:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780493483; x=1781098283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NClKrh1w7sQfgBR0erzztR5juE216bC7a2pQEV9Eg1k=;
 b=Gih3IpXxD7h4Mhqtc3fmtZeNgyvJAjeaMwzqtAUiAlyKrIgVywVEGFr9dEvqcTBxYz
 Bc9EKKfhLty7X52T4wkiUBliJlTcLVnNkkF9mmMsjxBEEIT+mSu8IblPylBFqtfizJWK
 q1pxthrBrHtd1JCr78XWiNtQdjAbJ8EDGPLTL+5mfsyYs/7UDKF3Bj0vn2I8N6aqXVQ/
 CeeM4OCt/FEeF9/gYTF/IvVK8cKhCj9VW9Yfm9k+kfAAsMb9/fP4xJSgIEptmTn2zZwM
 Jcl2GiaAGs+XlDUUv2lJXm0MVcqdES20O4KayVozioqfBY346vQ33fXScVUtm+75gFng
 Ynkg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/7f2+Qj2S0ZAWYA4vrFEeVdNfO3ctmP2UP4Qwg2cjSCcEpxzkgg6TgL7KR1wcu5UQk31tQenYylg==@nongnu.org
X-Gm-Message-State: AOJu0YxBmSl5+WtwPQkGA0BiUDFVDlPdi5laBQxNUyzAZfDbGqHqbpVk
 m5XdwF7cZ3BkAFbmlchHwkZiGyh3Ke5ChnEKCfFv+GKi11ASLKV414ot/uvM9Eb94UddCGe8+OH
 EMTE0h8qPdAwQbjD3fdvpjmKKJlfFPhNmjteZOoF2Oes4sdYnQ9pL0g==
X-Gm-Gg: Acq92OGVBqIYGTAEkomFzW93TzanWZzb4wYmw4wyE0yTHM1jNpttD9X+DSceXCN6HFz
 7Sn2UGHSdkYnEei/gswuVXaXqmb11OxODBL+Hij2nIb07yGZHD5D3npEXpoVgz/1v0k6pD4Iu5v
 i1kgA1a/SpaHfPMBWRr15kzgZYzg2Pfey2TbOMlPRBDc3r55Dsx8qM8KN7EVpi/LfcflyTsghsZ
 hcidMB1wk0u/Hs21Rork/3/AjpsW3T7AsM/iA7slNL/vCXAgDGK/jzMNolZ8tP9+EILQ+OzQldN
 WW7IOoz95oTAHDgGAC0Dzf3rIsRVnpTJ7eAOsMfQcn3udEPbQaJ4DZ8frPoR6Aqmh2YdePGLF8a
 WXV2DQKjngk0PxttDJmiHQRcSOICf2gWeojczMik3F08tQyTfKWC0K+pW98CiY7IlWHf5de+grt
 lXOFts
X-Received: by 2002:a17:906:730f:b0:bec:fa92:d36c with SMTP id
 a640c23a62f3a-bf0b36a4e53mr178668666b.38.1780493482721; 
 Wed, 03 Jun 2026 06:31:22 -0700 (PDT)
X-Received: by 2002:a17:906:730f:b0:bec:fa92:d36c with SMTP id
 a640c23a62f3a-bf0b36a4e53mr178662966b.38.1780493482217; 
 Wed, 03 Jun 2026 06:31:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055307aacsm157525466b.47.2026.06.03.06.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 06:31:21 -0700 (PDT)
Message-ID: <b737a849-258f-455a-af1a-8eb61a2500e8@redhat.com>
Date: Wed, 3 Jun 2026 15:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/31] hw/arm/smmuv3-accel: Introduce CMDQV ops
 interface
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260601114221.457995-1-skolothumtho@nvidia.com>
 <20260601114221.457995-7-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260601114221.457995-7-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 83IM30iWPokqWVftbqjTM-NRUruYuvUIq9CZzVsBefw_1780493483
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 6/1/26 1:41 PM, Shameer Kolothum wrote:
> Command Queue Virtualization (CMDQV) is a hardware extension available
> on certain platforms that allows the SMMUv3 command queue to be
> virtualized and passed through to a VM, improving performance.
>
> For example, NVIDIA Tegra241 implements CMDQV to support virtualization
> of multiple command queues (VCMDQs).
>
> The term CMDQV is used here generically to refer to any platform that
> provides hardware support to virtualize the SMMUv3 command queue.
>
> CMDQV support is a specialization of the IOMMUFD-backed accelerated
> SMMUv3 path. Introduce an ops interface to factor out CMDQV-specific
> probe, initialization, and vIOMMU allocation logic from the base
> implementation. The ops pointer and associated state are stored in
> the accelerated SMMUv3 state.
>
> This provides an extensible design to support future vendor-specific
> CMDQV implementations.
>
> No functional change.
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmuv3-accel.h | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 87fecb5c68..b45f25ad03 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -10,11 +10,44 @@
>  #define HW_ARM_SMMUV3_ACCEL_H
>  
>  #include "hw/arm/smmu-common.h"
> +#include "hw/arm/smmuv3.h"
>  #include "system/iommufd.h"
>  #ifdef CONFIG_LINUX
>  #include <linux/iommufd.h>
>  #endif
>  
> +/*
> + * CMDQ-Virtualization (CMDQV) hardware support, extends the SMMUv3 to
> + * support multiple VCMDQs with virtualization capabilities.
> + * CMDQV specific behavior is factored behind this ops interface.
> + */
> +typedef struct SMMUv3AccelCmdqvOps {
> +    /**
> +     * @probe: Mandatory. Vendor-specific device probing.
> +     */
> +    bool (*probe)(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev, Error **errp);
> +    /**
> +     * @init: Optional callback. Initialize CMDQV hardware.
> +     */
> +    bool (*init)(SMMUv3State *s, Error **errp);
> +    /**
> +     * @alloc_viommu: Mandatory. Allocate CMDQV viommu resources.
> +     */
> +    bool (*alloc_viommu)(SMMUv3State *s,
> +                         HostIOMMUDeviceIOMMUFD *idev,
> +                         uint32_t *out_viommu_id,
> +                         Error **errp);
> +    /**
> +     * @free_viommu: Optional callback. Free CMDQV viommu resources.
> +     * If NULL, the viommu_id is freed directly via iommufd_backend_free_id().
> +     */
> +    void (*free_viommu)(SMMUv3State *s);
> +    /**
> +     * @reset: Optional callback. Reset CMDQV state.
> +     */
> +    void (*reset)(SMMUv3State *s);
> +} SMMUv3AccelCmdqvOps;
> +
>  /*
>   * Represents an accelerated SMMU instance backed by an iommufd vIOMMU object.
>   * Holds bypass and abort proxy HWPT IDs used for device attachment.
> @@ -27,6 +60,7 @@ typedef struct SMMUv3AccelState {
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
>      bool auto_mode;
>      bool auto_finalised;
> +    const SMMUv3AccelCmdqvOps *cmdqv_ops;
>  } SMMUv3AccelState;
>  
>  typedef struct SMMUS1Hwpt {


