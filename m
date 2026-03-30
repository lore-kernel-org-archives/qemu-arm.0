Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA62FF494F
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 12:44:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7By9-0003Za-Ik; Mon, 30 Mar 2026 08:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1w7Bxw-0003YS-Mi
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 08:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1w7Bxu-0000Ih-Sk
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 08:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774874614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZUutERt4XQnSPrBR6sxfSapl2uL95o6z7FZVlJWTzMs=;
 b=hr6kFBB8RhakBNslz7ukSFE61fGkPy//326yJxHoL9pIQg4v+W0rrswUxMFOLh3QdwFuQ/
 +9B8dqi2UCsWz4JT3yOp191GSc1FOIvBkn3YlwnwrAlmBF4bdTmJBMsmUeKx87xuPxG/Hb
 4YxLDOLRM3weXlhQPr79iGdGSu5tztU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-mWo4e-o2OUSPfzKIgbkXUA-1; Mon, 30 Mar 2026 08:43:33 -0400
X-MC-Unique: mWo4e-o2OUSPfzKIgbkXUA-1
X-Mimecast-MFC-AGG-ID: mWo4e-o2OUSPfzKIgbkXUA_1774874612
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43d022974acso731224f8f.2
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2026 05:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774874612; x=1775479412;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZUutERt4XQnSPrBR6sxfSapl2uL95o6z7FZVlJWTzMs=;
 b=ebhUZHRFGPA4ay52dlPu+NSyxqKFE+VFJ5JqzYP19o9dFGWq/ZIY5MgKMTr8g10hK6
 zEabeg8g9ok3eVNzHRLGabk/JYfSpFp3Rl0RVrUT/QoTiPxGn5aEXm+yIUhIpjlHOWk0
 Sp1ucCnedNyO7fWFvtDHdVlpkFo7by8u+sjiVFmNsDMVWvDEErOjd4IX2Rv1x9HimZq5
 kzcHOwFSm7ciKduzcpp7S9msRlFr8SNms6MZCd5gmHNpeFdJCgXqUpLqOjJpRXUNWHux
 inQo2GG8YcngcYXpSVQaq6tSpWZ07FuD7z5lODMOqHL+vk9OotD7afXH/W0NB8dqa3rO
 6SYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvbeXV4IrN2p9sE0xidbp0cQ4WGNJIoLJXPfTDAj4fbDxelu5HWbC8vjA0bGaUd3pKDknS0Dfwhw==@nongnu.org
X-Gm-Message-State: AOJu0YwhBBIkCl5wDl2iNpumbCEtuILC2SY/wyZ3i2lgGkh6WWt5Go2j
 n96xIVw1dUXQzlXthx+ErWJMLgV73lwKcO9FVo1BhFMddedQqWewPwgUvDJQDAW7k6DbDBt9zii
 sfxwoWX9WBGaVEZlr8a4iQY/UwGxfEvRKtFKgh8MTSgZYwEU6A+NI+w==
X-Gm-Gg: ATEYQzwnxyHF4FEUSOrf5+jsgziTJAH6O6P3aNqYy6u/3dQpH1i/BNZc+UAgPsNlNmS
 sEnKzqhTDi7g0loAA75DktcaV8nOvAcqsW2Eu9i53Qsv8j4PvOdQ7HWBQmw01nPdSzREN7q1n47
 /jiNxJFTRL3TyObyfJx7lkmF3Z7kteMGHFyoUJZavAZWFaR/kEUNwcwW05dcZb0tAR8l4Pu18tw
 WlRIrZZ7s6KDNeZQ3U7xq0XtNfvRdZ01dmywZ9gR9+QxYdRceWPWFNpKelG2/60DL7e6j4LMmcQ
 2mxcenR6NIB7hWpVaw+mEUKmtMX05hbjcfZm2Tu7/S7d0UlC9iri8yAg4BFhsnmMCDUG6xP1xMw
 LiWuXnPepX0hPkkJUSDN7BDa85M4lD7oZjsqylgGV7oxOm1IaCHw4c6ItEQbq
X-Received: by 2002:a05:6000:2483:b0:43d:292:ace1 with SMTP id
 ffacd0b85a97d-43d0292ae1cmr3628342f8f.32.1774874611724; 
 Mon, 30 Mar 2026 05:43:31 -0700 (PDT)
X-Received: by 2002:a05:6000:2483:b0:43d:292:ace1 with SMTP id
 ffacd0b85a97d-43d0292ae1cmr3628272f8f.32.1774874611165; 
 Mon, 30 Mar 2026 05:43:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf1db08e6sm28551755f8f.0.2026.03.30.05.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 05:43:30 -0700 (PDT)
Message-ID: <13a43ce3-3afc-4308-8fb7-fc0441fef3d2@redhat.com>
Date: Mon, 30 Mar 2026 14:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] iommufd: Extend attach/detach_hwpt callbacks to
 support pasid
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: alex@shazbot.org, eric.auger@redhat.com, mst@redhat.com,
 jasowang@redhat.com, jgg@nvidia.com, nicolinc@nvidia.com,
 skolothumtho@nvidia.com, joao.m.martins@oracle.com,
 clement.mathieu--drif@bull.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 xudong.hao@intel.com, qemu-arm@nongnu.org
References: <20260326091130.321483-1-zhenzhong.duan@intel.com>
 <20260326091130.321483-3-zhenzhong.duan@intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260326091130.321483-3-zhenzhong.duan@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3jJPsndNSwZ6u6zeFGqKTs1ya7p5BRIUsp1B1f3zNNU_1774874612
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Zhenzhong

On 3/26/26 10:11, Zhenzhong Duan wrote:
> Same for the two wrappers and their call sites.
> 
> Suggested-by: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
> Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Reviewed-by: Yi Liu <yi.l.liu@intel.com>
> ---
>   include/system/iommufd.h    | 16 +++++++++++-----
>   backends/iommufd.c          |  9 +++++----
>   hw/arm/smmuv3-accel.c       | 12 ++++++++----
>   hw/i386/intel_iommu_accel.c |  8 +++++---
>   hw/vfio/iommufd.c           | 10 +++++-----
>   5 files changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index 7062944fe6..45a9e87cb0 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -138,14 +138,16 @@ struct HostIOMMUDeviceIOMMUFDClass {
>        *
>        * @idev: host IOMMU device backed by IOMMUFD backend.
>        *
> +     * @pasid: target pasid of attach.
> +     *
>        * @hwpt_id: ID of IOMMUFD hardware page table.
>        *
>        * @errp: pass an Error out when attachment fails.
>        *
>        * Returns: true on success, false on failure.
>        */
> -    bool (*attach_hwpt)(HostIOMMUDeviceIOMMUFD *idev, uint32_t hwpt_id,
> -                        Error **errp);
> +    bool (*attach_hwpt)(HostIOMMUDeviceIOMMUFD *idev, uint32_t pasid,
> +                        uint32_t hwpt_id, Error **errp);
>       /**
>        * @detach_hwpt: detach host IOMMU device from IOMMUFD hardware page table.
>        * VFIO and VDPA device can have different implementation.
> @@ -154,15 +156,19 @@ struct HostIOMMUDeviceIOMMUFDClass {
>        *
>        * @idev: host IOMMU device backed by IOMMUFD backend.
>        *
> +     * @pasid: target pasid of detach.
> +     *
>        * @errp: pass an Error out when attachment fails.
>        *
>        * Returns: true on success, false on failure.
>        */
> -    bool (*detach_hwpt)(HostIOMMUDeviceIOMMUFD *idev, Error **errp);
> +    bool (*detach_hwpt)(HostIOMMUDeviceIOMMUFD *idev, uint32_t pasid,
> +                        Error **errp);
>   };
>   
>   bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
> -                                           uint32_t hwpt_id, Error **errp);
> -bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
> +                                           uint32_t pasid, uint32_t hwpt_id,
>                                              Error **errp);
> +bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
> +                                           uint32_t pasid, Error **errp);
>   #endif
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index e1fee16acf..ab612e4874 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -539,23 +539,24 @@ bool iommufd_backend_alloc_veventq(IOMMUFDBackend *be, uint32_t viommu_id,
>   }
>   
>   bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
> -                                           uint32_t hwpt_id, Error **errp)
> +                                           uint32_t pasid, uint32_t hwpt_id,
> +                                           Error **errp)
>   {
>       HostIOMMUDeviceIOMMUFDClass *idevc =
>           HOST_IOMMU_DEVICE_IOMMUFD_GET_CLASS(idev);


For consistency with the rest of the code, I would rename all the
idev and idevc variables, to hiod and hiodc.

Thanks,

C.



>   
>       g_assert(idevc->attach_hwpt);
> -    return idevc->attach_hwpt(idev, hwpt_id, errp);
> +    return idevc->attach_hwpt(idev, pasid, hwpt_id, errp);
>   }
>   
>   bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
> -                                           Error **errp)
> +                                           uint32_t pasid, Error **errp)
>   {
>       HostIOMMUDeviceIOMMUFDClass *idevc =
>           HOST_IOMMU_DEVICE_IOMMUFD_GET_CLASS(idev);
>   
>       g_assert(idevc->detach_hwpt);
> -    return idevc->detach_hwpt(idev, errp);
> +    return idevc->detach_hwpt(idev, pasid, errp);
>   }
>   
>   static int hiod_iommufd_get_cap(HostIOMMUDevice *hiod, int cap, Error **errp)
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 65c2f44880..0af6b3296d 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -300,7 +300,8 @@ bool smmuv3_accel_install_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
>           return false;
>       }
>   
> -    if (!host_iommu_device_iommufd_attach_hwpt(idev, hwpt_id, errp)) {
> +    if (!host_iommu_device_iommufd_attach_hwpt(idev, IOMMU_NO_PASID, hwpt_id,
> +                                               errp)) {
>           if (s1_hwpt) {
>               iommufd_backend_free_id(idev->iommufd, s1_hwpt->hwpt_id);
>               g_free(s1_hwpt);
> @@ -575,7 +576,8 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>   
>       /* Attach a HWPT based on SMMUv3 GBPA.ABORT value */
>       hwpt_id = smmuv3_accel_gbpa_hwpt(s, accel);
> -    if (!host_iommu_device_iommufd_attach_hwpt(idev, hwpt_id, errp)) {
> +    if (!host_iommu_device_iommufd_attach_hwpt(idev, IOMMU_NO_PASID, hwpt_id,
> +                                               errp)) {
>           goto free_veventq;
>       }
>       return true;
> @@ -665,7 +667,8 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>       idev = accel_dev->idev;
>       accel = accel_dev->s_accel;
>       /* Re-attach the default s2 hwpt id */
> -    if (!host_iommu_device_iommufd_attach_hwpt(idev, idev->hwpt_id, NULL)) {
> +    if (!host_iommu_device_iommufd_attach_hwpt(idev, IOMMU_NO_PASID,
> +                                               idev->hwpt_id, NULL)) {
>           error_report("Unable to attach the default HW pagetable: idev devid "
>                        "0x%x", idev->devid);
>       }
> @@ -879,7 +882,8 @@ bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp)
>   
>       hwpt_id = smmuv3_accel_gbpa_hwpt(s, accel);
>       QLIST_FOREACH(accel_dev, &accel->device_list, next) {
> -        if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->idev, hwpt_id,
> +        if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->idev,
> +                                                   IOMMU_NO_PASID, hwpt_id,
>                                                      &local_err)) {
>               error_append_hint(&local_err, "Failed to attach GBPA hwpt %u for "
>                                 "idev devid %u", hwpt_id, accel_dev->idev->devid);
> diff --git a/hw/i386/intel_iommu_accel.c b/hw/i386/intel_iommu_accel.c
> index 67d54849f2..45c08c8f6f 100644
> --- a/hw/i386/intel_iommu_accel.c
> +++ b/hw/i386/intel_iommu_accel.c
> @@ -121,7 +121,8 @@ static bool vtd_device_attach_iommufd(VTDHostIOMMUDevice *vtd_hiod,
>           }
>       }
>   
> -    ret = host_iommu_device_iommufd_attach_hwpt(idev, hwpt_id, errp);
> +    ret = host_iommu_device_iommufd_attach_hwpt(idev, IOMMU_NO_PASID, hwpt_id,
> +                                                errp);
>       trace_vtd_device_attach_hwpt(idev->devid, vtd_as->pasid, hwpt_id, ret);
>       if (ret) {
>           /* Destroy old fs_hwpt if it's a replacement */
> @@ -145,7 +146,7 @@ static bool vtd_device_detach_iommufd(VTDHostIOMMUDevice *vtd_hiod,
>       bool ret;
>   
>       if (s->dmar_enabled && s->root_scalable) {
> -        ret = host_iommu_device_iommufd_detach_hwpt(idev, errp);
> +        ret = host_iommu_device_iommufd_detach_hwpt(idev, IOMMU_NO_PASID, errp);
>           trace_vtd_device_detach_hwpt(idev->devid, pasid, ret);
>       } else {
>           /*
> @@ -153,7 +154,8 @@ static bool vtd_device_detach_iommufd(VTDHostIOMMUDevice *vtd_hiod,
>            * we fallback to the default HWPT which contains shadow page table.
>            * So guest DMA could still work.
>            */
> -        ret = host_iommu_device_iommufd_attach_hwpt(idev, idev->hwpt_id, errp);
> +        ret = host_iommu_device_iommufd_attach_hwpt(idev, IOMMU_NO_PASID,
> +                                                    idev->hwpt_id, errp);
>           trace_vtd_device_reattach_def_hwpt(idev->devid, pasid, idev->hwpt_id,
>                                              ret);
>       }
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index 93f1e61a8c..e822039858 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -927,21 +927,21 @@ static void vfio_iommu_iommufd_class_init(ObjectClass *klass, const void *data)
>   
>   static bool
>   host_iommu_device_iommufd_vfio_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
> -                                           uint32_t hwpt_id, Error **errp)
> +                                           uint32_t pasid, uint32_t hwpt_id,
> +                                           Error **errp)
>   {
>       VFIODevice *vbasedev = HOST_IOMMU_DEVICE(idev)->agent;
>   
> -    return !iommufd_cdev_pasid_attach_ioas_hwpt(vbasedev, IOMMU_NO_PASID,
> -                                                hwpt_id, errp);
> +    return !iommufd_cdev_pasid_attach_ioas_hwpt(vbasedev, pasid, hwpt_id, errp);
>   }
>   
>   static bool
>   host_iommu_device_iommufd_vfio_detach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
> -                                           Error **errp)
> +                                           uint32_t pasid, Error **errp)
>   {
>       VFIODevice *vbasedev = HOST_IOMMU_DEVICE(idev)->agent;
>   
> -    return iommufd_cdev_pasid_detach_ioas_hwpt(vbasedev, IOMMU_NO_PASID, errp);
> +    return iommufd_cdev_pasid_detach_ioas_hwpt(vbasedev, pasid, errp);
>   }
>   
>   static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,


