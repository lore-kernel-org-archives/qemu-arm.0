Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38676CD4F5E
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 05:29:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPZUb-0004Vg-1f; Wed, 20 May 2026 01:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPZUX-0004Tl-Ui
 for qemu-arm@nongnu.org; Wed, 20 May 2026 01:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPZUV-0006U2-BJ
 for qemu-arm@nongnu.org; Wed, 20 May 2026 01:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779254950;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=24T28WbTiXuvmHCalvk51F77sHhKg8vYObR3Hf/1szM=;
 b=h1icKdGnfOMLD0b5eYsl5OLJKeJ/vl3mgLvKH7wlcjAYTq1zaw64eEt615SOnDjp1UC3gi
 tRH08snnFuJOuWz6h0sQhKSAVgTCy5pj85eWb4xGWd29EGKt/JK8ivudOHCbJU1zdQIFSs
 qPSsc5klZhKfxTaXqDevAGM6pqCcLnA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-bKvlNHPdMB6KnRzPvJG5pQ-1; Wed, 20 May 2026 01:29:07 -0400
X-MC-Unique: bKvlNHPdMB6KnRzPvJG5pQ-1
X-Mimecast-MFC-AGG-ID: bKvlNHPdMB6KnRzPvJG5pQ_1779254947
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-43d7730e9e3so2470793f8f.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 22:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779254946; x=1779859746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24T28WbTiXuvmHCalvk51F77sHhKg8vYObR3Hf/1szM=;
 b=tV2YE9WFrj5eGKkfB7gTBVpJSPcKO3xe8eo+kebmG4zTPGQ+orwJxEAAmqf0lo16Ix
 Qf80cGsi6G5iYRqeg1tzjbSLMgo1AqX6DV1Z3SIFBB0ueDS6ZCZZ5e8GK01T7hgB2GgI
 N9doqFWAryD6ZLF33lFUc5aTIMC0m4JXr/E0mb/ASVTgW6nyWUS4/BsNALjOIzrRXYJD
 brcLBnngWk0UkW83qN36YIR32NNlUScAdtaWQ7lYRxNzz9gJG2pNHtn9OzxVXHJfilnQ
 K+V6Bq38KaRfxj4V2yEiDCw8ACTGo5BNgU5vzIswlLvsMUs4wlv1InsNLgmlyhjyco6Q
 f73w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BkVj9zb8SwWMZB11UXGtcWHl1JXiviVP7e4G8ZTOq8oX2RVq7XpJSysPIbt1QO/VwI9FFV4bXgg==@nongnu.org
X-Gm-Message-State: AOJu0Yxje3O1qdtRf86gjyjLiyWMd+F4FzDVDnKYxe8T0m4F0dgybv8V
 /g28JdKFPNeNeAxWaF643m3lbgHS0imdJ9abNKCaw+r5Jz1DvFTheRJh8a0oDWCJ4zJxNGo7OaE
 RiwwbEPLoEuTPi+CI7olUTjEFqiCPNax3Yyn0xgPru9WF2CRlAWYHgg==
X-Gm-Gg: Acq92OHi1vOf6uiGVc4i3H/+svrg8S3vxEBC8X3+TveHe1wHrAzu5Kl0+S80W3VAW7P
 HyMmxeirEXpYo5eezg9q8VSXLtKx67pP2jX02w7FRUEumC7gk+AvHusX7FlG7iL31BREwgL7dME
 dV1WUTqRmSz+Nqvyd7Ai+q2gW47pNET4b7faQhkK1/OF/M/VLAso/x2oGKlmkUR4Tz6I/rv9qY5
 y8vAh4W4Z/M5IN08DAYDEWt+b2cFRgTNCKFzg27NYHDDZUTohUJwYUos6U8Ab74QVwlnZPiYi/J
 00FHeD7DPakrve1fdaQ3CgIjMIuJq4u1L9BTKbFbMqS5IXtAixE7SSU2sLzuG13Ez1ihTgW71xw
 2ExI43ZDC35HCRH+16Oqzfj9oHFR8dR70WSWaSG00E4+aFeNkRdJLAXNmG7q1/eSeryajcg==
X-Received: by 2002:a05:6000:200f:b0:45d:b14b:23f8 with SMTP id
 ffacd0b85a97d-45e5c5af4eamr35667056f8f.18.1779254946584; 
 Tue, 19 May 2026 22:29:06 -0700 (PDT)
X-Received: by 2002:a05:6000:200f:b0:45d:b14b:23f8 with SMTP id
 ffacd0b85a97d-45e5c5af4eamr35667032f8f.18.1779254946175; 
 Tue, 19 May 2026 22:29:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a6449sm50807086f8f.37.2026.05.19.22.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 22:29:05 -0700 (PDT)
Message-ID: <cdadf6bd-d7d8-41cd-94f7-9031cc21cb3c@redhat.com>
Date: Wed, 20 May 2026 07:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/32] hw/arm/smmuv3-accel: Introduce CMDQV ops
 interface
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-7-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-7-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ufl-D8JysfYrFSbhjBdntdpTO0UN7dHd7J_LxD8ly_w_1779254947
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
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



On 5/19/26 12:36 PM, Shameer Kolothum wrote:
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
> ---
>  hw/arm/smmuv3-accel.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 87fecb5c68..f82a7112d8 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -10,11 +10,45 @@
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
> +     * @probe: Optional callback. Vendor-specific device probing.
> +     */
> +    bool (*probe)(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev, Error **errp);
> +    /**
> +     * @init: Optional callback. Initialize CMDQV hardware.
> +     */
> +    bool (*init)(SMMUv3State *s, Error **errp);
> +    /**
> +     * @alloc_viommu: Mandatory when probe is implemented.
see my comment on 8/32. Aren't probe and alloc_viommu somehow mandatory?

Eric
> +     * Allocate CMDQV viommu resources.
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
> @@ -27,6 +61,7 @@ typedef struct SMMUv3AccelState {
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
>      bool auto_mode;
>      bool auto_finalised;
> +    const SMMUv3AccelCmdqvOps *cmdqv_ops;
>  } SMMUv3AccelState;
>  
>  typedef struct SMMUS1Hwpt {


