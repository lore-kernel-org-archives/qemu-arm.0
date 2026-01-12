Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6F9C9EC97
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 15:04:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJMg-0003dG-UG; Mon, 12 Jan 2026 09:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfJMS-0003VW-L4
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:57:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfJMQ-00022P-VM
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768229858;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MJ7u+G8s9lVs8w5hv+FIzeJcnkYeYWliICTSz7UkUo=;
 b=i9mlOSJrNlNnorpdp3XlpjdR0yuYxfxi1tYtW2ZuPvgc/g4rEeakZiDF5j7RkuB0Ml3dt+
 W8pi7cak60AljvBygGgKMPScJq5oPseEYicskenF71WRDlZRxY4svyTzH97iLNQlrcctHW
 IdNT+tuHm0PFSIErDjYgKuMcQyrVzVU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-OIfyGp0QMi29NL4ffHwmMQ-1; Mon, 12 Jan 2026 09:57:28 -0500
X-MC-Unique: OIfyGp0QMi29NL4ffHwmMQ-1
X-Mimecast-MFC-AGG-ID: OIfyGp0QMi29NL4ffHwmMQ_1768229847
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso43750815e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229847; x=1768834647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MJ7u+G8s9lVs8w5hv+FIzeJcnkYeYWliICTSz7UkUo=;
 b=mgzGPP5HnoT9LNWyr0ggIaC/Ky9kI2pYYtOnYSVRV73kAqrxAgnGz1BWsCf5TEqvtH
 qO1MnpKt2gN6MtWLrk2lELDaOSthqoEqXOtY1/Lbqrx8P6fdQa6AbFb5fxXRkcqXgbY+
 HLXf2ghURlVHZDZlbJLAZBDeDTw+ofxIAnG4R6JiK8QZhFPwKaA5GjoI9a1ksCE+RQ3F
 t/+njM+PRt4mwaPEK2XQxzkiMFvN34174oFR2ArP89OJ/Ef86UjxeKgLcd9uJm2nvHVB
 Cuyqg8yxgoD9osy7VoYw9SD48qLj2p+nCDB4i0ltw3WWgB5hq5bb2nVcR0hofquKCKta
 p07A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbylCsTz4qjhMGf160bBoAD5fdfIc+RsUYEVIVutIAzz0gvbWgO8nEdHb7KF0uMsR2o2AWTt7kOw==@nongnu.org
X-Gm-Message-State: AOJu0Yz8dt/LPsCMc1vWLc0iWzrsIyXMClCxmKFBQ+DF2zsoAvZW8a7B
 Tz/A9X30awM1Zaf0qKn8149UdqmXiv4EscdHnKRBqx/WT6LJU/XrRnU2B9LDqs7lz7m5KWE0vZ7
 ugDNnJZveLG0NVOEh+RpCxWY4FxWzx/emY7L3ODxOYB3yL0aIF3HOyw==
X-Gm-Gg: AY/fxX6TAt5ONQoyeR/JvkRXQs/OVlMrSxPPq4xNNINUC1wYXbZUJtvUGmambBkFDv3
 tCjhbgqAR2yZD1O44hWBwD4DUyD3hBlMRhh9X1b/NNF5D/YNTsDr6YmkyQal5V8+/fhXpO2RfG+
 ShJGaOurxs15xx+8p1KNPYzewxdk1/c1nO42YvGIfha8/iKBsKE7JFQ7SEa8BiaG9nNpVwn21+J
 s30IiOtPhvuTcxdS4bN7zfojD1uCi6t9T645vp1lpodMgHeVWrHU62C85YnjbjNyDxTr5146bzd
 5VyAKPOnwUyk3gOB5hvfDjeCQYopXOahkK6dUwO99GhEmwuqe5nvaXcFo6r4HwmjqFEO+cxZAcz
 A94rU8ruC4lGVe9vxPHhpt67CxnTHVZXhm9VI0v08aGAk9rJMGniWimnUOQ==
X-Received: by 2002:a05:600c:1991:b0:477:b48d:ba7a with SMTP id
 5b1f17b1804b1-47d84b4119amr189914045e9.32.1768229846781; 
 Mon, 12 Jan 2026 06:57:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlIIYNEMoom08idoZMhyOKCG4KhEPaG55aAntO7VvYDMN89d3ry1WvIBnxCNicNTe92cTpcQ==
X-Received: by 2002:a05:600c:1991:b0:477:b48d:ba7a with SMTP id
 5b1f17b1804b1-47d84b4119amr189913805e9.32.1768229846347; 
 Mon, 12 Jan 2026 06:57:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm130679535e9.17.2026.01.12.06.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 06:57:25 -0800 (PST)
Message-ID: <87cc30d4-53e6-4fff-8784-7fd847cc3ba8@redhat.com>
Date: Mon, 12 Jan 2026 15:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/16] backends/iommufd: Introduce
 iommufd_backend_viommu_mmap
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
 <20251210133737.78257-5-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251210133737.78257-5-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GPqccymELMVsvyZaboq-sftdlqqICwVI2iYik5PeGnc_1768229847
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 12/10/25 2:37 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add a backend helper to mmap hardware MMIO regions exposed via iommufd for
> a vIOMMU instance. This allows user space to access HW-accelerated MMIO
> pages provided by the vIOMMU.
>
> The caller is responsible for unmapping the returned region.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  backends/iommufd.c       | 24 ++++++++++++++++++++++++
>  backends/trace-events    |  1 +
>  include/system/iommufd.h |  4 ++++
>  3 files changed, 29 insertions(+)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index a644763239..015e5249d6 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -575,6 +575,30 @@ bool iommufd_backend_alloc_hw_queue(IOMMUFDBackend *be, uint32_t viommu_id,
>      return true;
>  }
>  
> +/*
> + * Helper to mmap HW MMIO regions exposed via iommufd for a vIOMMU instance.
> + * The caller is responsible for unmapping the mapped region.
> + */
> +bool iommufd_backend_viommu_mmap(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                 uint64_t size, off_t offset, void **out_ptr,
> +                                 Error **errp)
> +{
> +    g_assert(viommu_id);
> +    g_assert(out_ptr);
> +
> +    *out_ptr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, be->fd,
> +                   offset);
> +    if (*out_ptr == MAP_FAILED) {
> +        error_setg_errno(errp, errno, "failed to mmap (size=0x%" PRIx64
> +                         " offset=0x%" PRIx64 ") for viommu (id=%d)",
> +                         size, offset, viommu_id);
> +        return false;
> +    }
> +
> +    trace_iommufd_backend_viommu_mmap(be->fd, viommu_id, size, offset);
> +    return true;
> +}
> +
>  bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                             uint32_t hwpt_id, Error **errp)
>  {
> diff --git a/backends/trace-events b/backends/trace-events
> index a22ad30e55..046f453caa 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -25,3 +25,4 @@ iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32
>  iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
>  iommufd_viommu_alloc_eventq(int iommufd, uint32_t viommu_id, uint32_t type, uint32_t veventq_id, uint32_t veventq_fd, int ret) " iommufd=%d viommu_id=%u type=%u veventq_id=%u veventq_fd=%u (%d)"
>  iommufd_backend_alloc_hw_queue(int iommufd, uint32_t viommu_id, uint32_t vqueue_type, uint32_t index, uint64_t addr, uint64_t size, uint32_t vqueue_id, int ret) " iommufd=%d viommu_id=%u vqueue_type=%u index=%u addr=0x%"PRIx64" size=0x%"PRIx64" vqueue_id=%u (%d)"
> +iommufd_backend_viommu_mmap(int iommufd, uint32_t viommu_id, uint64_t size, uint64_t offset) " iommufd=%d viommu_id=%u size=0x%"PRIx64" offset=0x%"PRIx64
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index 9b8602a558..e3905c9a40 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -110,6 +110,10 @@ bool iommufd_backend_alloc_hw_queue(IOMMUFDBackend *be, uint32_t viommu_id,
>                                      uint64_t addr, uint64_t length,
>                                      uint32_t *out_hw_queue_id, Error **errp);
>  
> +bool iommufd_backend_viommu_mmap(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                 uint64_t size, off_t offset, void **out_ptr,
> +                                 Error **errp);
> +
>  bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                          bool start, Error **errp);
>  bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,


