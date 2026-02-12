Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C89EDF04C
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 08:10:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqRlz-0006Fs-IE; Thu, 12 Feb 2026 03:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqRly-0006Fa-VQ
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 03:10:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqRlw-0001Kh-F7
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 03:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770883799;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iPNFVM5K7kmcNeijs/QmTxaZEPuhFkkrDpri17Qs68=;
 b=jG8BAFFZZj+sRvqidlRRxT1U9iGIcRmYuBbC6gXBi6lmAxI1on9g+wugLG0Exxj4ttVsoJ
 DGUIvRCrqJKJ9lPFmtfqWPFf0+ki4W4JtOGxhrJAlPcaBE9n5NhuYnrBT1MHD4nRHtDHmn
 jbQdk104utvjHG6Ud0eFuRyyNqeUn2M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-A5rpfW3hPvSv8m9WEnfWAQ-1; Thu, 12 Feb 2026 03:09:57 -0500
X-MC-Unique: A5rpfW3hPvSv8m9WEnfWAQ-1
X-Mimecast-MFC-AGG-ID: A5rpfW3hPvSv8m9WEnfWAQ_1770883797
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48069a43217so72831005e9.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 00:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770883796; x=1771488596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iPNFVM5K7kmcNeijs/QmTxaZEPuhFkkrDpri17Qs68=;
 b=wv0pj2vghXdfcS7CEAPP+7ZLqo805eLo+jhnxfP4Xt6qRURorhd0MlvqCr8gBKATge
 +dcUNnC118VIWMj+rxszngQVZnCupGD8nse2323r8agW7DXF/pPSHLQWyWmDoSqPzPoJ
 kH+eJ/YPFhMOI5iUmU5Br8FCKcH0C/Jyr+7YW0xZ497rEi82Wrct5YtDPMUZRB/nc5f+
 SmIKxWEou/vYIVe1JuOy3zoy4yYR0jXwF0ozM1xXXBo9ARrHxPZuQvBNMg/IVbXwMax0
 xsJ0NHm8MR1yPaVOHCiDLa0/ibvETie7dRbXWdi2jLYjaBZR4/H036oksricufvWjkA4
 gzpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpA05yzcB+34tA69f8fyOnd4hJbgDuCWPUHcrctDI8KyjRRD+JaFte38ncwdhxhtFffOMw7qgzGw==@nongnu.org
X-Gm-Message-State: AOJu0YwVPQdxovhHwPw10lOXNjeJAxvHp7N5v4anoiCBvmwQQySnCzwT
 Z3ECwVWliOicpMqXfgy0b/12+UqDzUrvXPzOZcKLclHF56joof0ADHBjg0gPhutL4ghvBMKonwc
 vFAKXM0UJl5GLijSk3s+MBJm9/tIQltVkCnd8agCLdw+aB6SVruqHVg==
X-Gm-Gg: AZuq6aL4y5uRJM6xrCIM7NDXFG+Cq6CvkMRp+VgrNYdU/FuwaOfEVInCRYSMBL4X2If
 jh1gfELCslqY6F9+/GbNe2SAcY91ZHKifazvXmrqbI96IDaT/QlOx9hI6A1gk41ukcAjwjVHzsj
 2kyujShhtZHrzhOC8xXt4bBvV2h0NEg2TdxEB5Lo/YSSzGxyyDO2uSWSvVW02h2gJ3tWJm26ZQN
 LDvqy++qaZ38uAk5Mud2WknB64O/dCScjvUm4oxYy7ITxe6wrE6jhwi9uskCA1bbf5iWEVO7Fur
 erJQpdDXvjs7+SnJHdGaikLBG8cQQQJoR6K8DY3sfwWqwHACfL9bSzzes8njEuxbSNQcVkVdnDj
 qpDl4euJxpfGSJ4A/aPzvdFKE7uQm/pK41txdEBbQ23zGlyxDVdg0Mb1I7Q2K6SXfIqo1+g==
X-Received: by 2002:a05:600c:c165:b0:45d:dc85:c009 with SMTP id
 5b1f17b1804b1-483656c10b1mr20703275e9.10.1770883796593; 
 Thu, 12 Feb 2026 00:09:56 -0800 (PST)
X-Received: by 2002:a05:600c:c165:b0:45d:dc85:c009 with SMTP id
 5b1f17b1804b1-483656c10b1mr20702895e9.10.1770883796038; 
 Thu, 12 Feb 2026 00:09:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835a66fcf7sm47489735e9.7.2026.02.12.00.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 00:09:55 -0800 (PST)
Message-ID: <a5c6b9bd-d505-4917-8ca5-28e703c47ea0@redhat.com>
Date: Thu, 12 Feb 2026 09:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/24] backends/iommufd: Update
 iommufd_backend_alloc_viommu to allow user ptr
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-3-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-3-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bchNMSFlsODxHwFByNsD2sUNGDUdm35UMrJeTXtIQOo_1770883797
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> The updated IOMMUFD VIOMMU_ALLOC uAPI allows userspace to provide a data
> buffer when creating a vIOMMU (e.g. for Tegra241 CMDQV). Extend
> iommufd_backend_alloc_viommu() to pass a user pointer and size to the
> kernel.
>
> Update the caller accordingly.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  backends/iommufd.c       | 4 ++++
>  backends/trace-events    | 2 +-
>  hw/arm/smmuv3-accel.c    | 4 ++--
>  include/system/iommufd.h | 1 +
>  4 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 5daefe505e..8ab26eb786 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -460,6 +460,7 @@ bool iommufd_backend_invalidate_cache(IOMMUFDBackend *be, uint32_t id,
>  
>  bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>                                    uint32_t viommu_type, uint32_t hwpt_id,
> +                                  void *data_ptr, uint32_t data_len,
>                                    uint32_t *out_viommu_id, Error **errp)
>  {
>      int ret;
> @@ -468,11 +469,14 @@ bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>          .type = viommu_type,
>          .dev_id = dev_id,
>          .hwpt_id = hwpt_id,
> +        .data_len = data_len,
> +        .data_uptr = (uintptr_t)data_ptr,
>      };
>  
>      ret = ioctl(be->fd, IOMMU_VIOMMU_ALLOC, &alloc_viommu);
>  
>      trace_iommufd_backend_alloc_viommu(be->fd, dev_id, viommu_type, hwpt_id,
> +                                       data_len, (uintptr_t)data_ptr,
>                                         alloc_viommu.out_viommu_id, ret);
>      if (ret) {
>          error_setg_errno(errp, errno, "IOMMU_VIOMMU_ALLOC failed");
> diff --git a/backends/trace-events b/backends/trace-events
> index b9365113e7..332888a576 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -21,7 +21,7 @@ iommufd_backend_free_id(int iommufd, uint32_t id, int ret) " iommufd=%d id=%d (%
>  iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) " iommufd=%d hwpt=%u enable=%d (%d)"
>  iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t flags, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" flags=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
>  iommufd_backend_invalidate_cache(int iommufd, uint32_t id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
> -iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
> +iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint32_t data_len, uint64_t data_ptr, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u data_len=%u data_ptr=0x%"PRIx64" viommu_id=%u (%d)"
nit: I would put the data_ptr first and then the data length to match
most prevalent pattern. Also use hexa format for the length?

Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>  iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
>  iommufd_viommu_alloc_eventq(int iommufd, uint32_t viommu_id, uint32_t type, uint32_t veventq_id, uint32_t veventq_fd, int ret) " iommufd=%d viommu_id=%u type=%u veventq_id=%u veventq_fd=%u (%d)"
>  
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 14ea4eac37..9036b14601 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -531,8 +531,8 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>      IOMMUFDViommu *viommu;
>  
>      if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> -                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3,
> -                                      s2_hwpt_id, &viommu_id, errp)) {
> +                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3, s2_hwpt_id,
> +                                      NULL, 0, &viommu_id, errp)) {
>          return false;
>      }
>  
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index e4ca16da70..5ef23ad9e1 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -87,6 +87,7 @@ bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
>                                  Error **errp);
>  bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
>                                    uint32_t viommu_type, uint32_t hwpt_id,
> +                                  void *data_ptr, uint32_t data_len,
>                                    uint32_t *out_hwpt, Error **errp);
>  
>  bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,


