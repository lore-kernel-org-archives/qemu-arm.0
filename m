Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F21CCFA03
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 08:46:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGvdD-0001ns-3c; Thu, 06 Nov 2025 03:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGvdB-0001n4-7V
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 03:46:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGvd5-0000ve-8V
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 03:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762418760;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1Hvu5InP1NiVOb7qGH8XRbwDQN1L1qk73OrVYDw2B8=;
 b=EwJvmW9Rx9iAMbRm5+i9qDQ5fUjF/YpZf9iz+GT2wPWmBQ0WYqqpq+hJaa8L13c8EdWZyQ
 Kq0JiZkjaXmsrgV4NZ4kT40rvgGwQ20Gpw8TzLK8dig8TPAklqudJW4Odx4ETfYJsZzYAx
 SI8ycfTGmILOp+Een3YHEFcX9opUe3U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-xn0Gc1gxPw2FnKoqgr2w9Q-1; Thu, 06 Nov 2025 03:45:59 -0500
X-MC-Unique: xn0Gc1gxPw2FnKoqgr2w9Q-1
X-Mimecast-MFC-AGG-ID: xn0Gc1gxPw2FnKoqgr2w9Q_1762418758
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e47d14dceso3028155e9.2
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 00:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762418758; x=1763023558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L1Hvu5InP1NiVOb7qGH8XRbwDQN1L1qk73OrVYDw2B8=;
 b=bmcb8XPMb9FttjMkx3PZdsFx8frfSKx+JiwnMQPOdb3ma/2+YO/LdskgIgz+DHzsOc
 +1/6/Kzl9bQchrGBgWBo/4mM/wb/koI2P+lGSSduVpnKbL77W5Dj7uFjWLWfmQWcoSXB
 rLtS+F3+dMXZj4xckGtVJVOTXfHnimjzSybFL8xD4OJsE3nXpi738Hu+VmAsnKsdjjeS
 B02xVWpvA/QWcgzmCXF/fwKgEKv6q01ORk3dsWOTCiJ3sroXSVd1b+ns2A6QpTT1brLp
 Dz/vvlF0kwe5tGzNMwoIiRaNDpJNacq2YappLSo5GpGxFLlyWimrc0fotY6eY4lsE2vi
 UWJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHlBLi8nWRbek8X2dseOK4bkQfVfJ9Vt8U30mEFNtb22Qq+6EIgOp8SREJ/ijahfem+D3E2CzyDg==@nongnu.org
X-Gm-Message-State: AOJu0YxHLYET3K1dsUr1WmZ1LB2niM8WSX+t7GUbqHqilJwGUHAKz5cm
 P5bSjqmR1v862O0KTokSrUgrPTs5PhcgIOy8QCQv0/8A9HzijuSW+jiVDLX2lnvjjoGdMpxgJyJ
 QA59MD7e7dAGc7LDKR34rFPiDOU9aNlF65A3BZl2eW5IyJI6pZfRQ2Q==
X-Gm-Gg: ASbGncu17BgCczLlEOF0NWxTm6HzgPQczFGOkx+yho1sCI0K/ZY/UC9I7n9ImSBM9K/
 tS1rH95S3YgqR/qXcMJjbC+O2IxcLC9lZuLAbJj4rqO/8tXeVRrICvWhnjbqOOcfCBSTrv6Sc/M
 vaAofWhZ3gb/VxvaXChrHc5vIEhiSLLiewT08PhrMobG8gnjPLy/1GOK9tzcac53n0dugvI1ImK
 K3jrUjfYXvj7RoYO8qNf80gGvjuJ3cgdCO4vRfFI6fySbJJNqRcqwJlxbAeBE9ggYmY31i4lfnq
 ngWNTtfshktlDtEvnM9XPSLW2fG9rXmqqfUoYNJ0NEFG0JcK/QvCmVwMWUgDtrn2AATAvEFtclE
 W0Vwf3M+51/gTGsrhmOU07wjRbnYW4ldMT0kLCr8VPrBPng==
X-Received: by 2002:a05:600c:45c7:b0:477:19c2:9765 with SMTP id
 5b1f17b1804b1-4775cdad684mr58104305e9.4.1762418758257; 
 Thu, 06 Nov 2025 00:45:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRsJ/vUrRvb6R51p9yDw2mUterNInMI9xJbtNzCEsIig1yamvxe62pvURMCrgSultJhDo8vA==
X-Received: by 2002:a05:600c:45c7:b0:477:19c2:9765 with SMTP id
 5b1f17b1804b1-4775cdad684mr58103995e9.4.1762418757802; 
 Thu, 06 Nov 2025 00:45:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429ef2d58c2sm1723932f8f.16.2025.11.06.00.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 00:45:57 -0800 (PST)
Message-ID: <518b7ace-f71c-43d4-bd85-7dc485c19649@redhat.com>
Date: Thu, 6 Nov 2025 09:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/32] Extend get_cap() callback to support PASID
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-31-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-31-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: azRZkukYX-pQTz84VEtV1-v9uOdfiiBmGQF1Tf8rbtY_1762418758
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/31/25 11:50 AM, Shameer Kolothum wrote:
> Modify get_cap() callback so that it can return cap via an output
> uint64_t param. And add support for generic iommu hw capability
> info and max_pasid_log2(pasid width).
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  backends/iommufd.c                 | 18 +++++++++++++++---
>  hw/i386/intel_iommu.c              |  5 +++--
>  hw/vfio/container-legacy.c         |  8 ++++++--
>  include/system/host_iommu_device.h | 14 ++++++++++----
>  4 files changed, 34 insertions(+), 11 deletions(-)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 6381f9664b..392f9cf2a8 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -523,19 +523,31 @@ bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>      return idevc->detach_hwpt(idev, errp);
>  }
>  
> -static int hiod_iommufd_get_cap(HostIOMMUDevice *hiod, int cap, Error **errp)
> +static int hiod_iommufd_get_cap(HostIOMMUDevice *hiod, int cap,
s/cap/capid? to avoid confusion with actual cap value?
> +                                uint64_t *out_cap, Error **errp)
>  {
>      HostIOMMUDeviceCaps *caps = &hiod->caps;
>  
> +    g_assert(out_cap);
> +
>      switch (cap) {
>      case HOST_IOMMU_DEVICE_CAP_IOMMU_TYPE:
> -        return caps->type;
> +        *out_cap = caps->type;
> +        break;
>      case HOST_IOMMU_DEVICE_CAP_AW_BITS:
> -        return vfio_device_get_aw_bits(hiod->agent);
> +        *out_cap = vfio_device_get_aw_bits(hiod->agent);
> +        break;
> +    case HOST_IOMMU_DEVICE_CAP_GENERIC_HW:
> +        *out_cap = caps->hw_caps;
> +        break;
> +    case HOST_IOMMU_DEVICE_CAP_MAX_PASID_LOG2:
> +        *out_cap = caps->max_pasid_log2;
> +        break;
>      default:
>          error_setg(errp, "%s: unsupported capability %x", hiod->name, cap);
>          return -EINVAL;
>      }
> +    return 0;
>  }
>  
>  static void hiod_iommufd_class_init(ObjectClass *oc, const void *data)
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6a168d5107..91d0d643ea 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -4444,6 +4444,7 @@ static bool vtd_check_hiod(IntelIOMMUState *s, HostIOMMUDevice *hiod,
>                             Error **errp)
>  {
>      HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
> +    uint64_t out_cap;
>      int ret;
>  
>      if (!hiodc->get_cap) {
> @@ -4452,11 +4453,11 @@ static bool vtd_check_hiod(IntelIOMMUState *s, HostIOMMUDevice *hiod,
>      }
>  
>      /* Common checks */
> -    ret = hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_AW_BITS, errp);
> +    ret = hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_AW_BITS, &out_cap, errp);
>      if (ret < 0) {
>          return false;
>      }
> -    if (s->aw_bits > ret) {
> +    if (s->aw_bits > out_cap) {
>          error_setg(errp, "aw-bits %d > host aw-bits %d", s->aw_bits, ret);
you also need to replace ret and out_cap here and also use 0x%PRIx64
>          return false;
>      }
> diff --git a/hw/vfio/container-legacy.c b/hw/vfio/container-legacy.c
> index a3615d7b5d..ac8370bd4b 100644
> --- a/hw/vfio/container-legacy.c
> +++ b/hw/vfio/container-legacy.c
> @@ -1197,15 +1197,19 @@ static bool hiod_legacy_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
>  }
>  
>  static int hiod_legacy_vfio_get_cap(HostIOMMUDevice *hiod, int cap,
> -                                    Error **errp)
> +                                    uint64_t *out_cap, Error **errp)
>  {
> +    g_assert(out_cap);
> +
>      switch (cap) {
>      case HOST_IOMMU_DEVICE_CAP_AW_BITS:
> -        return vfio_device_get_aw_bits(hiod->agent);
> +        *out_cap = vfio_device_get_aw_bits(hiod->agent);
> +        break;
>      default:
>          error_setg(errp, "%s: unsupported capability %x", hiod->name, cap);
>          return -EINVAL;
>      }
> +    return 0;
>  }
>  
>  static GList *
> diff --git a/include/system/host_iommu_device.h b/include/system/host_iommu_device.h
> index bfb2b60478..f89dbafd9e 100644
> --- a/include/system/host_iommu_device.h
> +++ b/include/system/host_iommu_device.h
> @@ -94,13 +94,15 @@ struct HostIOMMUDeviceClass {
>       *
>       * @cap: capability to check.
>       *
> +     * @out_cap: 0 if a @cap is unsupported or else 1 or some positive
> +     * value for some special @cap, i.e., HOST_IOMMU_DEVICE_CAP_AW_BITS.
this does not match what is done in the impl. In case @cap is not
supported you do not zero it.
> +     *
>       * @errp: pass an Error out when fails to query capability.
>       *
> -     * Returns: <0 on failure, 0 if a @cap is unsupported, or else
> -     * 1 or some positive value for some special @cap,
I would rather say the capability value
> -     * i.e., HOST_IOMMU_DEVICE_CAP_AW_BITS.
> +     * Returns: <0 on failure, 0 on success.
<0 if cap is not supported
>       */
> -    int (*get_cap)(HostIOMMUDevice *hiod, int cap, Error **errp);
> +    int (*get_cap)(HostIOMMUDevice *hiod, int cap, uint64_t *out_cap,
> +                   Error **errp);
>      /**
>       * @get_iova_ranges: Return the list of usable iova_ranges along with
>       * @hiod Host IOMMU device
> @@ -123,6 +125,10 @@ struct HostIOMMUDeviceClass {
>   */
>  #define HOST_IOMMU_DEVICE_CAP_IOMMU_TYPE        0
>  #define HOST_IOMMU_DEVICE_CAP_AW_BITS           1
> +/* Generic IOMMU HW capability info */
> +#define HOST_IOMMU_DEVICE_CAP_GENERIC_HW        2
> +/* PASID width */
> +#define HOST_IOMMU_DEVICE_CAP_MAX_PASID_LOG2    3
>  
>  #define HOST_IOMMU_DEVICE_CAP_AW_BITS_MAX       64
>  #endif
Eric


