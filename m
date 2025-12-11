Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96797D41D50
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 15:26:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTiZC-0006Fv-Eq; Thu, 11 Dec 2025 10:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vTiZA-0006Fd-Sm
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 10:26:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vTiZ9-0005k4-7v
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 10:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765466810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hqF8KkHOx3PIG2nfiXsklOUWdhu31DmxYT0+RuF4hyo=;
 b=I0mx1KpKOFYOiPwud6uyGPsSdHE97+wn8txtmmgk3Svhlni5PeYwsOr1P01xuUzPGx3otV
 sIHCBAOkeGc4DyEW+7UcNglNMdTDNSkCWb06c8PKgCXRhEukVOdAJ9MquaNKlCYLq6eaLd
 +oRdvgDCuAoFs1KASV1RGwtM3F+cLa0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-vVhh-l4sNlWULdOnBN1KLw-1; Thu, 11 Dec 2025 10:26:48 -0500
X-MC-Unique: vVhh-l4sNlWULdOnBN1KLw-1
X-Mimecast-MFC-AGG-ID: vVhh-l4sNlWULdOnBN1KLw_1765466807
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477b8a667bcso3072155e9.2
 for <qemu-arm@nongnu.org>; Thu, 11 Dec 2025 07:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765466807; x=1766071607;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqF8KkHOx3PIG2nfiXsklOUWdhu31DmxYT0+RuF4hyo=;
 b=MB/GoaznysVvMEuDGFMUKhymHvXjq4jAndE4gqCu4hqom3DfrPL+L+NTpY0U28g54M
 HvSBfEejRooiFirh4dILyJ5QWBFh8dCoaBkbaBr4c4k21NMsypHZh8LyCWhu+6BPc+uC
 qeiy0G/x7F5wPpEI8P52fIURg9OjqkPI4qg8jjyklZ4pegKx8tZeTDwI2Y74IJZwKM+r
 W95ovtJClgyVOOhtOk+9CHhpBhniBtb6+j4iltZUPUlfdqq8li6s2PpDLZ8uXfrCS5e5
 GzLLd91YU3smUWmph4pqkHZWnJq8vy3n8zVi6E92WhNzAaQVs7koEXuzZT20hLeUzhJe
 e74g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbCedJp9zrgr0HsQFknuQ3xBCuiWtNLRc8Aygm8jgfI+jFmbQgeM5CMFJ0E/41ae1mPhaQ00X6iA==@nongnu.org
X-Gm-Message-State: AOJu0YwSL/uX8FRPytaPPkpWZ4c1SjsF+c4bkBmJKbny0JoHXzs2pqWe
 sM9SSEYh7ip/WCWCYxdHllkkyc75mX9c7zPpcttvDB3SQ2h890Zgeyuv+AkEiYSsz6AU6YbUPo1
 j1RuZMHUZPlWme9xJZTsEQr6RHE8qa4YcsAArQI5s/XS1jPc+fMcw58C2vGzBzQ==
X-Gm-Gg: AY/fxX7PFs4l0zrRicdkTT1FAL3/aNRajo6e9yYebVbulULLopkTdus1KSOXbTGPXhN
 CJlAgQMITRc6ck6vKocnBWGPInRe/KX5DKm6H0qIet44eB1Qby7H8ndOKHt3R+2HVitsntqOaSn
 WgBbug9TA13VDUvPvrWRd8D+Bfwvv6k9rYIOEz6GicFv/qReF1Rs8GIu7EK+38tXF77RxI/jAW5
 rNAXOLSawDAau4WAj8s1xKdJjJTPfx4sxrcNLkWuAvkY1E7+s0eRA4c/FRTMWH8vLPITIjiNo45
 42c6eTWKIqalXFVnRtMDi8rRWdbWIvKgDSiP2k7wA0ssC6K5InJkkQzlARDR9RmYhpiBuOXRxOb
 c/d62hrNBzGw/6S7RHoIjfUgGsyZM6X/WRtZQSMer2DJDM/7o
X-Received: by 2002:a05:600c:45c6:b0:477:7b9a:bb07 with SMTP id
 5b1f17b1804b1-47a8379fe10mr71571015e9.35.1765466806880; 
 Thu, 11 Dec 2025 07:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmrX2zF/PugTqYOO4uogPs7c51AIGjoXU/6W4K9OiR7u7mw7yLETT3dehG7LX5FhSA8sb5Xg==
X-Received: by 2002:a05:600c:45c6:b0:477:7b9a:bb07 with SMTP id
 5b1f17b1804b1-47a8379fe10mr71570635e9.35.1765466806375; 
 Thu, 11 Dec 2025 07:26:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d1e539sm16302125e9.0.2025.12.11.07.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:26:45 -0800 (PST)
Message-ID: <0b95b9d4-1f6f-4034-b343-d3961c57c342@redhat.com>
Date: Thu, 11 Dec 2025 16:26:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 31/33] Extend get_cap() callback to support PASID
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-32-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20251120132213.56581-32-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bWZkKQhjqRA5q4HnPaZ_Qku-pzO9MMYeq6nR9exnZAI_1765466807
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/20/25 14:22, Shameer Kolothum wrote:
> Modify get_cap() callback so that it can return cap via an output
> uint64_t param. And add support for generic iommu hw capability
> info and max_pasid_log2(pasid width).

This is doing multiple changes. Please split.

Thanks,

C.


> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   backends/iommufd.c                 | 23 ++++++++++++++++++-----
>   hw/i386/intel_iommu.c              |  8 +++++---
>   hw/vfio/container-legacy.c         |  8 ++++++--
>   include/system/host_iommu_device.h | 18 ++++++++++++------
>   4 files changed, 41 insertions(+), 16 deletions(-)
> 
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 6381f9664b..718d63f5cf 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -523,19 +523,32 @@ bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>       return idevc->detach_hwpt(idev, errp);
>   }
>   
> -static int hiod_iommufd_get_cap(HostIOMMUDevice *hiod, int cap, Error **errp)
> +static int hiod_iommufd_get_cap(HostIOMMUDevice *hiod, int cap_id,
> +                                uint64_t *out_cap, Error **errp)
>   {
>       HostIOMMUDeviceCaps *caps = &hiod->caps;
>   
> -    switch (cap) {
> +    g_assert(out_cap);
> +
> +    switch (cap_id) {
>       case HOST_IOMMU_DEVICE_CAP_IOMMU_TYPE:
> -        return caps->type;
> +        *out_cap = caps->type;
> +        break;
>       case HOST_IOMMU_DEVICE_CAP_AW_BITS:
> -        return vfio_device_get_aw_bits(hiod->agent);
> +        *out_cap = vfio_device_get_aw_bits(hiod->agent);
> +        break;
> +    case HOST_IOMMU_DEVICE_CAP_GENERIC_HW:
> +        *out_cap = caps->hw_caps;
> +        break;
> +    case HOST_IOMMU_DEVICE_CAP_MAX_PASID_LOG2:
> +        *out_cap = caps->max_pasid_log2;
> +        break;
>       default:
> -        error_setg(errp, "%s: unsupported capability %x", hiod->name, cap);
> +        *out_cap = 0;
> +        error_setg(errp, "%s: unsupported capability %x", hiod->name, cap_id);
>           return -EINVAL;
>       }
> +    return 0;
>   }
>   
>   static void hiod_iommufd_class_init(ObjectClass *oc, const void *data)
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 78b142ccea..d5c131a814 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -4605,6 +4605,7 @@ static bool vtd_check_hiod(IntelIOMMUState *s, HostIOMMUDevice *hiod,
>                              Error **errp)
>   {
>       HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
> +    uint64_t out_cap;
>       int ret;
>   
>       if (!hiodc->get_cap) {
> @@ -4613,12 +4614,13 @@ static bool vtd_check_hiod(IntelIOMMUState *s, HostIOMMUDevice *hiod,
>       }
>   
>       /* Common checks */
> -    ret = hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_AW_BITS, errp);
> +    ret = hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_AW_BITS, &out_cap, errp);
>       if (ret < 0) {
>           return false;
>       }
> -    if (s->aw_bits > ret) {
> -        error_setg(errp, "aw-bits %d > host aw-bits %d", s->aw_bits, ret);
> +    if (s->aw_bits > out_cap) {
> +        error_setg(errp, "aw-bits %d > host aw-bits 0x%" PRIx64, s->aw_bits,
> +                   out_cap);
>           return false;
>       }
>   
> diff --git a/hw/vfio/container-legacy.c b/hw/vfio/container-legacy.c
> index 32c260b345..1acf063762 100644
> --- a/hw/vfio/container-legacy.c
> +++ b/hw/vfio/container-legacy.c
> @@ -1203,15 +1203,19 @@ static bool hiod_legacy_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
>   }
>   
>   static int hiod_legacy_vfio_get_cap(HostIOMMUDevice *hiod, int cap,
> -                                    Error **errp)
> +                                    uint64_t *out_cap, Error **errp)
>   {
> +    g_assert(out_cap);
> +
>       switch (cap) {
>       case HOST_IOMMU_DEVICE_CAP_AW_BITS:
> -        return vfio_device_get_aw_bits(hiod->agent);
> +        *out_cap = vfio_device_get_aw_bits(hiod->agent);
> +        break;
>       default:
>           error_setg(errp, "%s: unsupported capability %x", hiod->name, cap);
>           return -EINVAL;
>       }
> +    return 0;
>   }
>   
>   static GList *
> diff --git a/include/system/host_iommu_device.h b/include/system/host_iommu_device.h
> index bfb2b60478..4e891e5225 100644
> --- a/include/system/host_iommu_device.h
> +++ b/include/system/host_iommu_device.h
> @@ -88,19 +88,21 @@ struct HostIOMMUDeviceClass {
>        * @get_cap: check if a host IOMMU device capability is supported.
>        *
>        * Optional callback, if not implemented, hint not supporting query
> -     * of @cap.
> +     * of @cap_id.
>        *
>        * @hiod: pointer to a host IOMMU device instance.
>        *
> -     * @cap: capability to check.
> +     * @cap_id: capability to check.
> +     *
> +     * @out_cap: 0 if a @cap_id is unsupported or else the capability
> +     * value for @cap_id.
>        *
>        * @errp: pass an Error out when fails to query capability.
>        *
> -     * Returns: <0 on failure, 0 if a @cap is unsupported, or else
> -     * 1 or some positive value for some special @cap,
> -     * i.e., HOST_IOMMU_DEVICE_CAP_AW_BITS.
> +     * Returns: <0 if @cap_id is not supported, 0 on success.
>        */
> -    int (*get_cap)(HostIOMMUDevice *hiod, int cap, Error **errp);
> +    int (*get_cap)(HostIOMMUDevice *hiod, int cap_id, uint64_t *out_cap,
> +                   Error **errp);
>       /**
>        * @get_iova_ranges: Return the list of usable iova_ranges along with
>        * @hiod Host IOMMU device
> @@ -123,6 +125,10 @@ struct HostIOMMUDeviceClass {
>    */
>   #define HOST_IOMMU_DEVICE_CAP_IOMMU_TYPE        0
>   #define HOST_IOMMU_DEVICE_CAP_AW_BITS           1
> +/* Generic IOMMU HW capability info */
> +#define HOST_IOMMU_DEVICE_CAP_GENERIC_HW        2
> +/* PASID width */
> +#define HOST_IOMMU_DEVICE_CAP_MAX_PASID_LOG2    3
>   
>   #define HOST_IOMMU_DEVICE_CAP_AW_BITS_MAX       64
>   #endif


