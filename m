Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA21CCF9EE
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 17:10:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDQjs-00044J-Pe; Mon, 27 Oct 2025 13:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDQjm-000438-T9
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 13:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDQjZ-00038g-4W
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 13:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761585013;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iU3A2OYhzZ9YCWm4uh9BVuSPAnX/4zlDC7AcJmuOEiE=;
 b=fVvImPYQrYmifYyA6h+g6O1RBMHWhowPstKuZgZ0Vg8K/0goSAKSK9WOiqsVIP27SKoJKQ
 d6XYe69Vy1xgXoGWhsN02E6/HTMvM/lpnVBOwlXR3umLi196UaZsKk4SkAO2xfQGBLi+O7
 Lp8K6Ts7jLjKWSeBkMZdIZMF2Jz/W84=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-5AnqURXEM_iYMMtzi207LQ-1; Mon, 27 Oct 2025 13:10:11 -0400
X-MC-Unique: 5AnqURXEM_iYMMtzi207LQ-1
X-Mimecast-MFC-AGG-ID: 5AnqURXEM_iYMMtzi207LQ_1761585010
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42700160169so2824280f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 10:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761585010; x=1762189810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iU3A2OYhzZ9YCWm4uh9BVuSPAnX/4zlDC7AcJmuOEiE=;
 b=v6O1AkaT4je5XyR0Xy/lNjD0fhPhlYZCBSkLkHALh7CVAUtlgtnbQZyxWGdPBRecFE
 OrlaApxsS/O7nHBJ2Hd90glmxVcPOcqvsxlcCiblbvm6L2tQTpAWZT+chteOeZiL5olJ
 fJZgx3bOgFVOny4OajoT05gje+r1+STtzV/5ZRzL+kidp1tlMhqPVznRDMj4xrMX+Feu
 WTrgw6hOOUznrjV0WkjUykLChv37nfuZC94TFABj0OCLaht/y1WlmA9HVz4aiIg1IbRT
 s6LDT8cCDEw8w6L8oI6HhWxCN6mLQlJu2yiuyCuk2eTr6VeN8beFLWn2kfT6ZEa5nRdc
 w1lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmZKcNv9RZlJlBr0S2u5sbG2TxUO3teRn3Pc3kIQBo3rQahN05LghLWi7pVmeyrQU4uDBvbZxwQw==@nongnu.org
X-Gm-Message-State: AOJu0YwMqqwfjwJC7Ygoa6K4zc46SIrk40KLN0SJowolEq0kImUqbBW0
 6OLz+igxzy+35hMYdhSorFNlMOlSkdXxczKuuPGh4gsZFIw+n0mwLa/wNxQagRii70fuj5b/psX
 is8OUxBRbHJIt3QKYPqXIb6ZZ/9V6z43NfYzH8gxjFk8V9Rbtg0bIeA==
X-Gm-Gg: ASbGnctAo4ELzW6OErt4EONI+nc1+UA9RgccqOViWxNTFbRt41ZWRcGsxxwDGeYyyqQ
 xiA0PBu9Mz+Cz69ChkcM2GhGuna1VsPoimZvAnej8O+32vGDQS3xv5+nKyv7pX1dbEN0iuTvnbt
 vGRV/mofHbMrky3GJwOO89inPcWgGTtor2+U82bHhlSCslYC+3Orr+mSAcfMt/9mMETGKXpZLnt
 2UCGABce/bqoXWBq0dC0OM9JHJQagg9Udqekt+t9+Laerl6vkjfBd60SVCigzec61pUXOHzEmAT
 nh7xtCkJ2J66sJxDM9hRN+ost2UB+JW3pvpg0D2P9udtwh1B0G2UuseJV4jjzdG+k2nhMU77Yl/
 VtQfOw+dM/zagbin015LVhbqEgl24Q2izvwIxgsf7kTZPKA==
X-Received: by 2002:a05:6000:2283:b0:427:492:79e5 with SMTP id
 ffacd0b85a97d-429a7e5684cmr363016f8f.21.1761585010361; 
 Mon, 27 Oct 2025 10:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJjE7n8Dn6Lbo+kfHEUD1/mpc5zrI3JKPHRvTfKoArnu26/OI79XxtBk7A4H67mcozw697JA==
X-Received: by 2002:a05:6000:2283:b0:427:492:79e5 with SMTP id
 ffacd0b85a97d-429a7e5684cmr362993f8f.21.1761585009889; 
 Mon, 27 Oct 2025 10:10:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d9e80sm15331351f8f.28.2025.10.27.10.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 10:10:09 -0700 (PDT)
Message-ID: <b84a3e58-b30a-4d3a-82f1-b24e32a66b29@redhat.com>
Date: Mon, 27 Oct 2025 18:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/27] backends/iommufd: Retrieve PASID width from
 iommufd_backend_get_device_info()
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-25-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-25-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BL8JRjRFtpULHRxeJNa6Py0LsKh_21CPwLQdZ5xj8Xc_1761585010
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> And store it in HostIOMMUDeviceCaps for later use.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  backends/iommufd.c                 | 6 +++++-
>  hw/arm/smmuv3-accel.c              | 3 ++-
>  hw/vfio/iommufd.c                  | 7 +++++--
>  include/system/host_iommu_device.h | 2 ++
>  include/system/iommufd.h           | 3 ++-
>  5 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index d3029d4658..023e67bc46 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -388,7 +388,8 @@ bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be,
>  
>  bool iommufd_backend_get_device_info(IOMMUFDBackend *be, uint32_t devid,
>                                       uint32_t *type, void *data, uint32_t len,
> -                                     uint64_t *caps, Error **errp)
> +                                     uint64_t *caps, uint8_t *pasid_log2,
max_pasid_log2
> +                                     Error **errp)
>  {
>      struct iommu_hw_info info = {
>          .size = sizeof(info),
> @@ -407,6 +408,9 @@ bool iommufd_backend_get_device_info(IOMMUFDBackend *be, uint32_t devid,
>      g_assert(caps);
>      *caps = info.out_capabilities;
>  
> +    if (pasid_log2) {
> +        *pasid_log2 = info.out_max_pasid_log2;
> +    }
>      return true;
>  }
>  
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index ba37d690ad..283d36e6cd 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -124,7 +124,8 @@ smmuv3_accel_hw_compatible(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>      uint64_t caps;
>  
>      if (!iommufd_backend_get_device_info(idev->iommufd, idev->devid, &data_type,
> -                                         &info, sizeof(info), &caps, errp)) {
> +                                         &info, sizeof(info), &caps, NULL,
> +                                         errp)) {
>          return false;
>      }
>  
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index 525df30ed1..89aa1b76a8 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -366,7 +366,8 @@ static bool iommufd_cdev_autodomains_get(VFIODevice *vbasedev,
>       * instead.
>       */
>      if (!iommufd_backend_get_device_info(vbasedev->iommufd, vbasedev->devid,
> -                                         &type, NULL, 0, &hw_caps, errp)) {
> +                                         &type, NULL, 0, &hw_caps, NULL,
> +                                         errp)) {
>          return false;
>      }
>  
> @@ -901,19 +902,21 @@ static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
>      HostIOMMUDeviceCaps *caps = &hiod->caps;
>      VendorCaps *vendor_caps = &caps->vendor_caps;
>      enum iommu_hw_info_type type;
> +    uint8_t pasid_log2;
>      uint64_t hw_caps;
>  
>      hiod->agent = opaque;
>  
>      if (!iommufd_backend_get_device_info(vdev->iommufd, vdev->devid, &type,
>                                           vendor_caps, sizeof(*vendor_caps),
> -                                         &hw_caps, errp)) {
> +                                         &hw_caps, &pasid_log2, errp)) {
>          return false;
>      }
>  
>      hiod->name = g_strdup(vdev->name);
>      caps->type = type;
>      caps->hw_caps = hw_caps;
> +    caps->max_pasid_log2 = pasid_log2;
>  
>      idev = HOST_IOMMU_DEVICE_IOMMUFD(hiod);
>      idev->iommufd = vdev->iommufd;
> diff --git a/include/system/host_iommu_device.h b/include/system/host_iommu_device.h
> index ab849a4a82..c6a2a3899a 100644
> --- a/include/system/host_iommu_device.h
> +++ b/include/system/host_iommu_device.h
> @@ -29,6 +29,7 @@ typedef union VendorCaps {
>   *
>   * @hw_caps: host platform IOMMU capabilities (e.g. on IOMMUFD this represents
>   *           the @out_capabilities value returned from IOMMU_GET_HW_INFO ioctl)
> + * @max_pasid_log2: width of PASIDs supported by host IOMMU device
>   *
>   * @vendor_caps: host platform IOMMU vendor specific capabilities (e.g. on
>   *               IOMMUFD this represents a user-space buffer filled by kernel
> @@ -37,6 +38,7 @@ typedef union VendorCaps {
>  typedef struct HostIOMMUDeviceCaps {
>      uint32_t type;
>      uint64_t hw_caps;
> +    uint8_t max_pasid_log2;
>      VendorCaps vendor_caps;
>  } HostIOMMUDeviceCaps;
>  #endif
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index e852193f35..d3efcffc45 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -71,7 +71,8 @@ int iommufd_backend_unmap_dma(IOMMUFDBackend *be, uint32_t ioas_id,
>                                hwaddr iova, ram_addr_t size);
>  bool iommufd_backend_get_device_info(IOMMUFDBackend *be, uint32_t devid,
>                                       uint32_t *type, void *data, uint32_t len,
> -                                     uint64_t *caps, Error **errp);
> +                                     uint64_t *caps, uint8_t *pasid_log2,
max_pasid_log2
> +                                     Error **errp);
>  bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
>                                  uint32_t pt_id, uint32_t flags,
>                                  uint32_t data_type, uint32_t data_len,
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric



