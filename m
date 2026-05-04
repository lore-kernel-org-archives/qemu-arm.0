Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56764CD3430
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:19:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJv4w-0003uZ-W1; Mon, 04 May 2026 11:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJv4r-0003nQ-Tg
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJv4q-0000N4-9Q
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777907959;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yt/VfQoTUiZe78brLczOhoVwGSx28VRzckW7rfcI65Y=;
 b=BspmdOUK9kW8Y+NjwmOZBRZOh1K7PcR6AYH2I72igFlsif+I/CDs2U6VTEvPwBjk63qglo
 UTQduFiWz4JWjgD68gVPwBEXg6MUdt7xtU68H+wwa82BMwLu4ldS3N4qssHhLB+Nn9k4ZY
 8+u3LV5aIIuxXnxaYuv9sqG2qitEqO0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-Y3GbmdUhOv2a3cjUQEjItw-1; Mon, 04 May 2026 11:19:16 -0400
X-MC-Unique: Y3GbmdUhOv2a3cjUQEjItw-1
X-Mimecast-MFC-AGG-ID: Y3GbmdUhOv2a3cjUQEjItw_1777907955
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4837bfcfe0dso53290715e9.1
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777907955; x=1778512755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yt/VfQoTUiZe78brLczOhoVwGSx28VRzckW7rfcI65Y=;
 b=Ddya0PMJal/wxREAbP+eFHmLN439KOSSmWZc1ZcfJtVo2zoM75uDqkfDQZSck7FKgO
 dYXBzCNhGf1ZFITU/XJCbLNl1/pVcbXC6bv9B2PBiGHs9v+IjBQMOqtq2MB/T9eSpJEM
 DGBJ33HsLEoTeNMpYrGviSDtJtvs5N8k0W8Cb9x+pxtYrkOdtmPS64ETUYcaXDsUyOJc
 lGu1tdOmRtoBG/4/3sJcao0U1x34tRQSeKoSum3tRcnrZdUPNKhclWq+2QjdHzUHnjVW
 Ijj0MamKPES5uRWYKsQysyuABcHNJaBgqar01BsKr563TWiCT69nfxVEHW5n3NbVtXY/
 71bg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/edkz5i+/SpFNnJhQ9Jrh0gbKWBsnpXHBdHtH0D2i/iPGlsCRH03rqlwgO53mUuOJIT88GcsVpgA==@nongnu.org
X-Gm-Message-State: AOJu0YxJiTsUT3kWnpeOkw6MD6ui+3u3bLF2rB5IlL90ZZ8WDCUjEGR5
 dmTqOj+ci9SsauRzorG5H+0nM+S400xdLNuXx2UUheI8cyFaumH50R16YjsAlxj80yLJ2wyRr38
 bh/dwNk3ewd/fnPx0whchu2vu52W11yvHbq/wz4umYcB9GeAi9OjQaQ==
X-Gm-Gg: AeBDieuL+/mbeW2Thbd3y7H0LmILHnvpB9d1RXTUt5dpaDZkd0R4DE+25hSnxwZfYYQ
 K+JPqmArcw17EyWsd+veW59rlRHsbPx1JrCrORubqg3rzrJc/I9B84qLW5azjf4EGYd1eZfIhr6
 ftZSMa6r+0DIJuQOo4B5pTCQ8r0R0ysGF84KmdtCxG520dliIr+18u7t5B913g+5dpUPlTFRCNw
 3HrvrGptw9hs/alc9+xTa4iFfE3X9YuA0w8831qijG2SBUnpxQfTSrCbWchFfX1fEwZSN72Rb2f
 DQsYHaJqWKD41yeka9aF3o0zaUBj2yC3UV39cHY0y5mSDKhxmbcnCm1EpyzrF/yqAbrmBoFJ2oQ
 FF2Td07vaYgHXlmCDAKUw+7XQb5MzKxhiwVo9ZfmrqG2WXBF9oujbBOVIVKHgFv2//c8qVxxB5P
 ME1BPQ
X-Received: by 2002:a05:600c:c0c5:b0:485:30d4:6b9e with SMTP id
 5b1f17b1804b1-48a98662e71mr136764415e9.21.1777907954819; 
 Mon, 04 May 2026 08:19:14 -0700 (PDT)
X-Received: by 2002:a05:600c:c0c5:b0:485:30d4:6b9e with SMTP id
 5b1f17b1804b1-48a98662e71mr136763895e9.21.1777907954468; 
 Mon, 04 May 2026 08:19:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a9919fc3asm113453245e9.0.2026.05.04.08.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:19:13 -0700 (PDT)
Message-ID: <a47b9e6b-0d29-4a49-bbfd-db40cc6a520c@redhat.com>
Date: Mon, 4 May 2026 17:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/31] hw/arm/smmuv3-accel: Introduce CMDQV ops
 interface
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-7-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-7-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AQcveUwQJF2oQK5HEzu7aHXgKFtRfJpF6N0xGdFvZi0_1777907955
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
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 7b4a0be000..86301afcb4 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -10,11 +10,28 @@
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
I would doc-comment which of those ops are mandated. For instance it
looks alloc_viommu is mandatory if the the whole ops exists. By the way,
it looks strange that !cmdqv_ops->free_viommu does not cause any assert
in 8/31 because we may not free the viommu_id if it does not exist?
Can't we enforce each mandated ops is implemented?

Thanks

Eric
> + */
> +typedef struct SMMUv3AccelCmdqvOps {
> +    bool (*probe)(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev, Error **errp);
> +    bool (*init)(SMMUv3State *s, Error **errp);
> +    bool (*alloc_viommu)(SMMUv3State *s,
> +                         HostIOMMUDeviceIOMMUFD *idev,
> +                         uint32_t *out_viommu_id,
> +                         Error **errp);
> +    void (*free_viommu)(SMMUv3State *s);
> +    void (*reset)(SMMUv3State *s);
> +} SMMUv3AccelCmdqvOps;
> +
>  /*
>   * Represents an accelerated SMMU instance backed by an iommufd vIOMMU object.
>   * Holds bypass and abort proxy HWPT IDs used for device attachment.
> @@ -27,6 +44,7 @@ typedef struct SMMUv3AccelState {
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
>      bool auto_mode;
>      bool auto_finalised;
> +    const SMMUv3AccelCmdqvOps *cmdqv_ops;
>  } SMMUv3AccelState;
>  
>  typedef struct SMMUS1Hwpt {


