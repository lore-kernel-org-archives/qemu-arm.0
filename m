Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBD5E7E358
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Apr 2026 09:16:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8acz-0004zo-Vo; Fri, 03 Apr 2026 05:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1w8acx-0004yr-7D
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 05:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1w8acv-0005Mv-61
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 05:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775207739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/YVG5zEQaIXFEnuMRpB3HAGNmijTTDSxzi9qniyqcYc=;
 b=gi5vu18FnzM5flceR0WyQjz0alPokUiZWOllLBwrVGX6y5vm1c66KRcFLWd/moPig6xKHf
 +ne+he9nvFFsX3J6WoEu8+hjrRPeHz6gJA4sKTSOFekzpXa5Cj1T5LhJcFpgqQ+hjwVZcO
 LOsjOnyOpCy0DNhm0uHuCcYMsgku2WE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-3jNuHAKFPxWxZ6VwbU9VpA-1; Fri, 03 Apr 2026 05:15:37 -0400
X-MC-Unique: 3jNuHAKFPxWxZ6VwbU9VpA-1
X-Mimecast-MFC-AGG-ID: 3jNuHAKFPxWxZ6VwbU9VpA_1775207736
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-43b96365ea8so2267534f8f.2
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2026 02:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775207736; x=1775812536;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YVG5zEQaIXFEnuMRpB3HAGNmijTTDSxzi9qniyqcYc=;
 b=rFx0W+GO/l85Hs6pr85NH40aG1oj2ZQnwWfViz6HbhC961oMfj/U9LXSZDjpyhhRKR
 9pQw28Z9AOf486dnfXnpLca9BAVdLvbCkdl/xhttVugtkvWnOmfAaZSJa/VmfmGwS9w1
 tvjPMaVXbLo+NW+Z1wxipbs6aCjSRqnt3ocM2UI1DNSKMlF0p+YKGxmlTPJJlZtLeeYH
 snrUj4W6YlCgh5DBchZEdWmpFZ3vxl26T/fy70BVLcH3HooAFq42E8HE6GQfysiHvVoq
 u0tfGx7lIm141RAEls4lflg5Dv5ZeXQAQE2Y9rQkUypct8h1PEQLQB8xzLLu087FJpIz
 n4ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWwrmgDzzpu+pxiT9CSkwBxhrGiD9hmp2jCacjR4WzDXVIiDWoBFft/hXOJpIaFSfpZuufmpox0g==@nongnu.org
X-Gm-Message-State: AOJu0YzR1gb/wTXgk5j3Lp6Xzlbpxv3H2xOelRUWrZbK4h14wG4Z6X8a
 LJbSJebt3ShBSaxATyIcKFCL5CB+RcZ+j1uORi6E15tsf7XQAmxT/nzLm/25u8+Y3zXyhVfCE1T
 ktxCMA6bIjVqSn4M1S5eeXOo1dTUSrUWH/pD8983939dM3p6WtOqupg==
X-Gm-Gg: AeBDiesjh543eyLWg8yXCIk01pdKOeNslr4GobhECi4HgAx0C6cK0L3elz00gLB0RZH
 oS9mk6+lCFeyUBEnOko9ZhnZSRxlk6AJ3KPAUsdgHqZBVvCnotNUIeitNS6XvEVja3eORrzqsnn
 LSbetq70o0SzjAzGDlyJiUsAqpLrwbJXUkPxtFEbDgOIEKXUihwappY+Y9kLkyJWntSc4Z5d67T
 vPPU4wieDGDNcClEOqalUdd0rGzjEv+j4wG+ir9nzWgUj4yZGoBRKZwTAWpzi9ploatDeHj2rN2
 zuyWZizO+Epo1bL0S+unSHWLX96CUG/SpdHHF/zoxCOnDeZ2iF5y/vOIvQRup5Erstmma0GRyf2
 YH3KLLII0QV0gdqwwY8Gr0yC7lQqpQ4WABdvUYvdKA4PidHFg2Sk2/LHLm864
X-Received: by 2002:a05:6000:1789:b0:43c:f8ce:269 with SMTP id
 ffacd0b85a97d-43d2927659bmr3888163f8f.2.1775207736256; 
 Fri, 03 Apr 2026 02:15:36 -0700 (PDT)
X-Received: by 2002:a05:6000:1789:b0:43c:f8ce:269 with SMTP id
 ffacd0b85a97d-43d2927659bmr3888103f8f.2.1775207735715; 
 Fri, 03 Apr 2026 02:15:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f1esm14996648f8f.2.2026.04.03.02.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2026 02:15:34 -0700 (PDT)
Message-ID: <f15d6ad1-df46-4283-a2b9-4af2b5b20213@redhat.com>
Date: Fri, 3 Apr 2026 11:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/vfio/iommufd: Control dirty tracking for nesting
 parent HWPT
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, nicolinc@nvidia.com,
 nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com, jgg@nvidia.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
References: <20260401084133.56266-1-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260401084133.56266-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LhCsY-C3I_ygrWgfdlGm1FkhJPztyA-UiQRFkPWStsY_1775207736
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.542,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/1/26 10:41, Shameer Kolothum wrote:
> QEMU smmuv3 accel does not support live migration yet, so dirty
> tracking for the nesting parent HWPT is not useful.
> 
> Also, nested vIOMMU use cases can break on some platforms. For
> example, SMMUv3 with HTTU may advertise dirty tracking capability,
> but the kernel supports it only for stage-1. Requesting dirty
> tracking for a nesting parent HWPT (stage-2) can fail.
> 
> Add a vIOMMU flag to explicitly request dirty tracking for the
> nesting parent HWPT. For nested cases, dirty tracking is enabled
> only when requested by the vIOMMU.
> 
> Non-nested cases and Intel vIOMMU keep the existing behavior.
> 
> Fixes: fc6dafb98cec ("hw/arm/smmuv3: Implement get_viommu_cap() callback")
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   include/hw/core/iommu.h       |  2 ++
>   include/hw/vfio/vfio-device.h |  1 +
>   hw/i386/intel_iommu.c         |  7 +++++--
>   hw/vfio/device.c              | 11 +++++++++++
>   hw/vfio/iommufd.c             | 11 +++++++++--
>   5 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/core/iommu.h b/include/hw/core/iommu.h
> index 86af315c15..cd59a367ce 100644
> --- a/include/hw/core/iommu.h
> +++ b/include/hw/core/iommu.h
> @@ -21,6 +21,8 @@ enum viommu_flags {
>       /* vIOMMU needs nesting parent HWPT to create nested HWPT */
>       VIOMMU_FLAG_WANT_NESTING_PARENT = BIT_ULL(0),
>       VIOMMU_FLAG_PASID_SUPPORTED = BIT_ULL(1),
> +    /* vIOMMU needs dirty tracking on the nesting parent HWPT for nested use */
> +    VIOMMU_FLAG_WANT_NESTING_DIRTY_TRACKING = BIT_ULL(2),
>   };
>   
>   /* Host IOMMU quirks. Extracted from host IOMMU capabilities */
> diff --git a/include/hw/vfio/vfio-device.h b/include/hw/vfio/vfio-device.h
> index 828a31c006..a95c5bf503 100644
> --- a/include/hw/vfio/vfio-device.h
> +++ b/include/hw/vfio/vfio-device.h
> @@ -268,6 +268,7 @@ void vfio_device_prepare(VFIODevice *vbasedev, VFIOContainer *bcontainer,
>   void vfio_device_unprepare(VFIODevice *vbasedev);
>   
>   bool vfio_device_get_viommu_flags_want_nesting(VFIODevice *vbasedev);
> +bool vfio_device_get_viommu_flags_want_nesting_dirty(VFIODevice *vbasedev);
>   bool vfio_device_get_host_iommu_quirk_bypass_ro(VFIODevice *vbasedev,
>                                                   uint32_t type, void *caps,
>                                                   uint32_t size);
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 4924aa4375..5ec5ed82d7 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -4831,9 +4831,12 @@ static void vtd_dev_unset_iommu_device(PCIBus *bus, void *opaque, int devfn)
>   static uint64_t vtd_get_viommu_flags(void *opaque)
>   {
>       IntelIOMMUState *s = opaque;
> -    uint64_t flags;
> +    uint64_t flags = 0;
>   
> -    flags = s->fsts ? VIOMMU_FLAG_WANT_NESTING_PARENT : 0;
> +    if (s->fsts) {
> +        flags = VIOMMU_FLAG_WANT_NESTING_PARENT |
> +                VIOMMU_FLAG_WANT_NESTING_DIRTY_TRACKING;
> +    }
>   
>       return flags;
>   }
> diff --git a/hw/vfio/device.c b/hw/vfio/device.c
> index 973fc35b59..8f7ae919a5 100644
> --- a/hw/vfio/device.c
> +++ b/hw/vfio/device.c
> @@ -522,6 +522,17 @@ void vfio_device_unprepare(VFIODevice *vbasedev)
>       vbasedev->bcontainer = NULL;
>   }
>   
> +bool vfio_device_get_viommu_flags_want_nesting_dirty(VFIODevice *vbasedev)
> +{
> +    VFIOPCIDevice *vdev = vfio_pci_from_vfio_device(vbasedev);
> +
> +    if (vdev) {
> +        return !!(pci_device_get_viommu_flags(PCI_DEVICE(vdev)) &
> +                  VIOMMU_FLAG_WANT_NESTING_DIRTY_TRACKING);
> +    }
> +    return false;
> +}
> +
>   bool vfio_device_get_viommu_flags_want_nesting(VFIODevice *vbasedev)
>   {
>       VFIOPCIDevice *vdev = vfio_pci_from_vfio_device(vbasedev);
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index 131612eb83..231635cdc7 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -349,6 +349,7 @@ static bool iommufd_cdev_autodomains_get(VFIODevice *vbasedev,
>       ERRP_GUARD();
>       IOMMUFDBackend *iommufd = vbasedev->iommufd;
>       VFIOContainer *bcontainer = VFIO_IOMMU(container);
> +    bool viommu_nesting, viommu_nesting_dirty;
>       uint32_t type, flags = 0;
>       uint64_t hw_caps;
>       VendorCaps caps;
> @@ -402,8 +403,14 @@ static bool iommufd_cdev_autodomains_get(VFIODevice *vbasedev,
>           return false;
>       }
>   
> +    viommu_nesting = vfio_device_get_viommu_flags_want_nesting(vbasedev);
> +    viommu_nesting_dirty =
> +        vfio_device_get_viommu_flags_want_nesting_dirty(vbasedev);
> +
>       if (hw_caps & IOMMU_HW_CAP_DIRTY_TRACKING) {
> -        flags = IOMMU_HWPT_ALLOC_DIRTY_TRACKING;
> +        if (!viommu_nesting || viommu_nesting_dirty) {
> +            flags |= IOMMU_HWPT_ALLOC_DIRTY_TRACKING;
> +        }
>       }
>   
>       /*
> @@ -411,7 +418,7 @@ static bool iommufd_cdev_autodomains_get(VFIODevice *vbasedev,
>        * force to create it so that it could be reused by vIOMMU to create
>        * nested HWPT.
>        */
> -    if (vfio_device_get_viommu_flags_want_nesting(vbasedev)) {
> +    if (viommu_nesting) {
>           flags |= IOMMU_HWPT_ALLOC_NEST_PARENT;
>   
>           if (vfio_device_get_host_iommu_quirk_bypass_ro(vbasedev, type,



Applied to vfio-next.

Thanks,

C.



