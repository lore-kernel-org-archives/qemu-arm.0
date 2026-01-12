Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D1FC9EC77
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 11:45:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfGMG-0007K2-2u; Mon, 12 Jan 2026 06:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vfGMB-0007FQ-UW
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 06:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vfGMA-0004fY-4e
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 06:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768218308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=68FKbIRYPA5moLbkgPsZxgaBLh7tBsg1Fb25YY+NDyg=;
 b=IXfBRMSVTPmiWMe2CBSmmpfeS6ZSqpRyN17EA7EsFyA9jW0natA4j57k1cSdqQNBe0clcJ
 TIZtL6ywrBbnp4NYSFIkzqSb2hrwoKzx7I+EIaurhRxGhy9FNiWzcdT/WGMDMVcOgLDcrE
 a2g3OBvVWfSdBJRu8zC1qDkB/mRocuQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-ak8H7ic2M6qc0JTb_DPs7w-1; Mon, 12 Jan 2026 06:45:06 -0500
X-MC-Unique: ak8H7ic2M6qc0JTb_DPs7w-1
X-Mimecast-MFC-AGG-ID: ak8H7ic2M6qc0JTb_DPs7w_1768218305
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4325cc15176so3179921f8f.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 03:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768218305; x=1768823105;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68FKbIRYPA5moLbkgPsZxgaBLh7tBsg1Fb25YY+NDyg=;
 b=f+2Yu6Cj+P5p6snaSp6D+B94QwtCmQFKp1EH9sfSEuJHHX1nHp8LoYskeTMBWWO2r2
 pG1Mm/ibocIszTXXm3B9cDk2fuLQQav6QHhXlBddjS6vo/6YyVpW8wVv/6BGt5FTmi6B
 JczdQVubb20WXsLl9TikZpJqRtEUAVtREZ8Q4c/1kiR0PjWAmgVP1NKUxkIwWk9uT61K
 uj6a8Ix9ufFKa73TIgC06Cc6sQJMH2NO9fUAcV00Rby1fVBQ1i5jUnZUkFAaCv/2X0uP
 agl3i7olbPR0x0BcuH8cjr1DhW+Ct/HGgXtb2x4R2SmP6SHLrfoMKPnWuHVwWoFBzoFE
 lKyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnQJzggsS299frdoRYPFvA0lz1OHDqLdWIR6Yj2mP1501pdRPibQq0fwNlkqa8Xg+o58kuFSDFWA==@nongnu.org
X-Gm-Message-State: AOJu0YwGz5B6lGfaCoEJoztCf/zI1/N1utYFE7KDBH9eMq5BX504ri3M
 RBJwriPw3kAFrves2ttvCH2WVE+YAQTmnq8jIPKKKjC6oxOQdj4/svFftXcbT/mJzIB+OUX4QOi
 kJzNdrAMbebrXozKR49n5RUCaOwCA1uTdyUPl2ebFMbv93durv2K9sQ==
X-Gm-Gg: AY/fxX6xhJSZSX67RrCsc7h5eJnobyV3iJtre3AECSrXXTSRpA14Sxre8iNsPBXnwJW
 DBVqvHdCsUvqWHmTK5/MObXRmUfoqPtaboNxFDg+1kVvgBm5R9/PAIzNNEcHkZ9sUx/1LO1UqIx
 BwZ+tsRNpvvvzvYV8zcUU3QOp0gu2YlX0TC1j6X63F2eJn8+YzYHmaHc1Zc3cuHGWu5lVFzuaRV
 2ai12JhFIlIVoMxh8xO/48XvHtpDP5BbgYUNaDwZMyw1JmK2m06CEvdSy8pPbbsnUTUVdYjQ3Wa
 GcGFiAgnO2WHPVIFd1dN89BnbtMcV1vOuTv9i0qSYX6SklTRYikGb1SE1uAIbz7g+r0AwqjAa0e
 zX3sYhMxMyXYrIjVuSjfcawhkg1rWlOLIATINwxAJAPS3PHd6
X-Received: by 2002:a05:6000:1449:b0:430:fd9f:e705 with SMTP id
 ffacd0b85a97d-432c3787561mr21610265f8f.27.1768218305417; 
 Mon, 12 Jan 2026 03:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvZaLF4t/QXrnLZls7jOh7oifonI1qS39UeTvcHlYhoOW1QGx24WtBNKA8GxgjhoD8c4XoyA==
X-Received: by 2002:a05:6000:1449:b0:430:fd9f:e705 with SMTP id
 ffacd0b85a97d-432c3787561mr21610214f8f.27.1768218304924; 
 Mon, 12 Jan 2026 03:45:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0daa78sm38725179f8f.6.2026.01.12.03.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:45:04 -0800 (PST)
Message-ID: <30913bca-0c73-4448-82e2-02e1ea42cf09@redhat.com>
Date: Mon, 12 Jan 2026 12:45:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/36] backends/iommufd: Introduce
 iommufd_backend_alloc_vdev
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com,
 alex@shazbot.org, nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20260111195508.106943-1-skolothumtho@nvidia.com>
 <20260111195508.106943-2-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260111195508.106943-2-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cp3V86UYupRJY_xWOz8z4qymaJ60je-waZdR7hL6bUg_1768218305
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 1/11/26 20:52, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> Add a helper to allocate an iommufd device's virtual device (in the user
> space) per a viommu instance.
> 
> While at it, introduce a struct IOMMUFDVdev for later use by vendor
> IOMMU implementations.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   backends/iommufd.c       | 27 +++++++++++++++++++++++++++
>   backends/trace-events    |  1 +
>   include/system/iommufd.h | 12 ++++++++++++
>   3 files changed, 40 insertions(+)
> 
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 3d4a4ae736..e68a2c934f 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -472,6 +472,33 @@ bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>       return true;
>   }
>   
> +bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
> +                                uint32_t viommu_id, uint64_t virt_id,
> +                                uint32_t *out_vdev_id, Error **errp)
> +{
> +    int ret;
> +    struct iommu_vdevice_alloc alloc_vdev = {
> +        .size = sizeof(alloc_vdev),
> +        .viommu_id = viommu_id,
> +        .dev_id = dev_id,
> +        .virt_id = virt_id,
> +    };
> +
> +    ret = ioctl(be->fd, IOMMU_VDEVICE_ALLOC, &alloc_vdev);
> +
> +    trace_iommufd_backend_alloc_vdev(be->fd, dev_id, viommu_id, virt_id,
> +                                     alloc_vdev.out_vdevice_id, ret);
> +
> +    if (ret) {
> +        error_setg_errno(errp, errno, "IOMMU_VDEVICE_ALLOC failed");
> +        return false;
> +    }
> +
> +    g_assert(out_vdev_id);
> +    *out_vdev_id = alloc_vdev.out_vdevice_id;
> +    return true;
> +}
> +
>   bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                              uint32_t hwpt_id, Error **errp)
>   {
> diff --git a/backends/trace-events b/backends/trace-events
> index 01c2d9bde9..8408dc8701 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -22,3 +22,4 @@ iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) "
>   iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
>   iommufd_backend_invalidate_cache(int iommufd, uint32_t id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
>   iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
> +iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index c0d7c50f7e..67c42f78a3 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -48,6 +48,14 @@ typedef struct IOMMUFDViommu {
>       uint32_t viommu_id;  /* virtual IOMMU ID of allocated object */
>   } IOMMUFDViommu;
>   
> +/*
> + * Virtual device object for a physical device bind to a vIOMMU.
> + */
> +typedef struct IOMMUFDVdev {
> +    uint32_t vdevice_id; /* object handle for vDevice */
> +    uint32_t virt_id;  /* virtual device ID */
> +} IOMMUFDVdev;
> +
>   bool iommufd_backend_connect(IOMMUFDBackend *be, Error **errp);
>   void iommufd_backend_disconnect(IOMMUFDBackend *be);
>   
> @@ -73,6 +81,10 @@ bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>                                     uint32_t viommu_type, uint32_t hwpt_id,
>                                     uint32_t *out_hwpt, Error **errp);
>   
> +bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
> +                                uint32_t viommu_id, uint64_t virt_id,
> +                                uint32_t *out_vdev_id, Error **errp);
> +
>   bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                           bool start, Error **errp);
>   bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,

It looks like we are missing patch :

  "backends/iommufd: Introduce iommufd_backend_alloc_viommu"

I took the one from v6.

Thanks,

C.


