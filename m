Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C57EA3F27
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 09:21:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vq6Om-0002AL-9s; Wed, 11 Feb 2026 04:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vq6Oj-00029o-Jj
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 04:20:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vq6Od-0002lf-P0
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 04:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770801628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0jEG2IR5xvO6nzxYDH9rkQXwR4xj8KvP+MXbhDP52uo=;
 b=a73KJ8XvVZcIIUouNM9ac5f5mFSBoXT2LZv3TJodyv7PHst8rJd/36j0z1EwHoj7OMNahZ
 lmVa+POcotCilnSKRhk+LENV1U25Ra5j7QZTdSuWxKjXMVorEQua6velXSez3l9tDNo5s5
 yIvJewaUHSQk3XFf7zvhgnKCHAHMJho=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-7QBztCK4ONq9Pg5lgdIM3g-1; Wed, 11 Feb 2026 04:20:25 -0500
X-MC-Unique: 7QBztCK4ONq9Pg5lgdIM3g-1
X-Mimecast-MFC-AGG-ID: 7QBztCK4ONq9Pg5lgdIM3g_1770801625
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48079ae1001so46604275e9.0
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 01:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770801625; x=1771406425;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jEG2IR5xvO6nzxYDH9rkQXwR4xj8KvP+MXbhDP52uo=;
 b=Ige93RdZCze6ygjHNFtSPXB00gwE7NEk8T/HCO3OdEV2GZ0fD++Wl2Pn5Xb/eHpLce
 /5dAjMeA0cUQJFrm50tCPew8N9KWRodoINRL5sd0ZqsiWLr8EGN3JMbBiS5zTXs9+2sy
 +W1WDFKAXsi6HDJRQ81BuAd4VBKRpiQoHXY2Bm+53OHTQiJGKA1V8GmRSm0+lGadNAdS
 OohScEuLCyKMsm5znJhwNO5VbUNAESBHlPc2dmT4MKPNmKakgy9uZq1STd4E8Z5j9gq3
 vT7Nu5bYT9+ONc3PBlcPbVgV6JVLpQiXOl/Z7br+K9kgo5G2iZO1NE3eM++ZhIxnNinI
 P6wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaK831EyN8LGVeATjPGIsNaUXpMY0JoRh3a+dGJf8e4EMTa9HBEzXEqjExtWr6+NFhlR4tlXlpOg==@nongnu.org
X-Gm-Message-State: AOJu0YzRD7la9TauiJ1WWv20MQMHD4q5HzFz7T5ZS7WZxyhfp9XcQhvV
 hDv8NbZ6dXEGUcO/41TN7X8Huf7RBmF5JA41UuDN/libOpyKGIJEjHbAMADV6Xhk3GSEjuJs1Y+
 2iQVVTkur4UXbqlGu+QRWEawIaTolKTqPqDPn3OcX4wmO0H3pesUPuQ==
X-Gm-Gg: AZuq6aLD8S8Wx5p0CV0ynnSuWiHBN3F5FjsdBuxAT6zP2iClztb3YoFfuFf3i7hmalX
 E5EACPAcNDOSR2hEH4KnN2nhqNCFSqZPLkHm3iVA8HKFqGgQG5NUeRlmZADOY9nyQwC/Nib8jGr
 +DEpZzQRNLf9h7ahRGFNeha+y6738qHkeH0w+sEXrwFNzX55IcJDCruJSqNzm7tmz5lV5Gk/sdt
 pUvk/+rN9QIwk9+85KEWKTeW8EuQUrOqnY+J+hpxhF/aYHWRHIFpGzRchOtwTxASPQQXVYHjoWG
 Ihw8xq+HKpp0tMhGqPn+PSl2P5CsXFPwwwSTvzatDFTOfPKAhuMgXun0rhJRT1zoWXFaye6z4oO
 dHTzPm4bp2T8YyK/YfdDmYLQWw3AFwn4PvUiltdOBT8TdEcFeH1LtbLtwz/+V
X-Received: by 2002:a05:600c:5288:b0:477:55ce:f3c2 with SMTP id
 5b1f17b1804b1-4835b90cf70mr21316905e9.14.1770801624575; 
 Wed, 11 Feb 2026 01:20:24 -0800 (PST)
X-Received: by 2002:a05:600c:5288:b0:477:55ce:f3c2 with SMTP id
 5b1f17b1804b1-4835b90cf70mr21316495e9.14.1770801624073; 
 Wed, 11 Feb 2026 01:20:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d56b44sm3265308f8f.16.2026.02.11.01.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 01:20:23 -0800 (PST)
Message-ID: <3140f6ae-e8a2-44bd-acf9-820a45d0008d@redhat.com>
Date: Wed, 11 Feb 2026 10:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/24] backends/iommufd: Introduce
 iommufd_backend_alloc_hw_queue
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-4-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260206144823.80655-4-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6pgA29cBYA9WY2Ysm2uLdSIjLsuZ-66hLiAHKJEuQBs_1770801625
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/6/26 15:48, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> Add a helper to allocate an iommufd backed HW queue for a vIOMMU.
> 
> While at it, define a struct IOMMUFDHWqueue for use by vendor
> implementations.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   backends/iommufd.c       | 32 ++++++++++++++++++++++++++++++++
>   backends/trace-events    |  1 +
>   include/system/iommufd.h | 12 ++++++++++++


Could you please add to your .gitconfig :

[diff]
	orderFile = /path/to/qemu/scripts/git.orderfile


>   3 files changed, 45 insertions(+)
> 
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 8ab26eb786..c6b79da0d4 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -546,6 +546,38 @@ bool iommufd_backend_alloc_veventq(IOMMUFDBackend *be, uint32_t viommu_id,
>       return true;
>   }
>   
> +bool iommufd_backend_alloc_hw_queue(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                    enum iommu_hw_queue_type queue_type,
> +                                    uint32_t index, uint64_t addr,
> +                                    uint64_t length, uint32_t *out_hw_queue_id,
> +                                    Error **errp)
> +{
> +    int ret;
> +    struct iommu_hw_queue_alloc alloc_hw_queue = {
> +        .size = sizeof(alloc_hw_queue),
> +        .flags = 0,
> +        .viommu_id = viommu_id,
> +        .type = queue_type,
> +        .index = index,
> +        .nesting_parent_iova = addr,
> +        .length = length,
> +    };
> +
> +    ret = ioctl(be->fd, IOMMU_HW_QUEUE_ALLOC, &alloc_hw_queue);
> +
> +    trace_iommufd_backend_alloc_hw_queue(be->fd, viommu_id, queue_type,
> +                                         index, addr, length,
> +                                         alloc_hw_queue.out_hw_queue_id, ret);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "IOMMU_HW_QUEUE_ALLOC failed");
> +        return false;
> +    }
> +
> +    g_assert(out_hw_queue_id);
> +    *out_hw_queue_id = alloc_hw_queue.out_hw_queue_id;
> +    return true;
> +}
> +
>   bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                              uint32_t hwpt_id, Error **errp)
>   {
> diff --git a/backends/trace-events b/backends/trace-events
> index 332888a576..3e70338750 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -24,6 +24,7 @@ iommufd_backend_invalidate_cache(int iommufd, uint32_t id, uint32_t data_type, u
>   iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint32_t data_len, uint64_t data_ptr, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u data_len=%u data_ptr=0x%"PRIx64" viommu_id=%u (%d)"
>   iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
>   iommufd_viommu_alloc_eventq(int iommufd, uint32_t viommu_id, uint32_t type, uint32_t veventq_id, uint32_t veventq_fd, int ret) " iommufd=%d viommu_id=%u type=%u veventq_id=%u veventq_fd=%u (%d)"
> +iommufd_backend_alloc_hw_queue(int iommufd, uint32_t viommu_id, uint32_t queue_type, uint32_t index, uint64_t addr, uint64_t size, uint32_t queue_id, int ret) " iommufd=%d viommu_id=%u queue_type=%u index=%u addr=0x%"PRIx64" size=0x%"PRIx64" queue_id=%u (%d)"
>   
>   # igvm-cfg.c
>   igvm_reset_enter(int type) "type=%u"
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index 5ef23ad9e1..f72ad545f8 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -63,6 +63,12 @@ typedef struct IOMMUFDVeventq {
>       uint32_t veventq_fd;
>   } IOMMUFDVeventq;
>   
> +/* HW queue object for a vIOMMU-specific HW-accelerated queue */
> +typedef struct IOMMUFDHWqueue {
> +    IOMMUFDViommu *viommu;
> +    uint32_t hw_queue_id;
> +} IOMMUFDHWqueue;
> +
>   bool iommufd_backend_connect(IOMMUFDBackend *be, Error **errp);
>   void iommufd_backend_disconnect(IOMMUFDBackend *be);
>   
> @@ -99,6 +105,12 @@ bool iommufd_backend_alloc_veventq(IOMMUFDBackend *be, uint32_t viommu_id,
>                                      uint32_t *out_veventq_id,
>                                      uint32_t *out_veventq_fd, Error **errp);
>   
> +bool iommufd_backend_alloc_hw_queue(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                    enum iommu_hw_queue_type queue_type,

Please use a uint32_t for the queue_type parameter. 'enum iommu_hw_queue_type'
is a Linux-only type and build will break on other platform.

Thanks,

C.



> +                                    uint32_t index, uint64_t addr,
> +                                    uint64_t length, uint32_t *out_hw_queue_id,
> +                                    Error **errp);
> +
>   bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                           bool start, Error **errp);
>   bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,


