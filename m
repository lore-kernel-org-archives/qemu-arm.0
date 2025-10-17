Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC9CCCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 12:22:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9jTG-0002gt-Vw; Fri, 17 Oct 2025 08:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v9jTF-0002gL-Le
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:22:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v9jT5-0005y7-Rs
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760703712;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1f1Go9ZF0u3/1wsJbk01335+NkqP7+Lb6UADGNjGWw=;
 b=YIRuJv3+0WjyNYwDB8ZVuARNLlBJ0eaVL0zTOahv96WpA+sKFg4W2vsh88B9cxBFCMe96a
 J4KUo5entbFqhinT23jE5bibEXk4Rd7eu+eTLGt79HC0CHRDwIP0PRmQ3f1xjQhb4orfo3
 8EJhKLZHuZnyBwGC6tHawZ1sQX4kFQU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-PjSRdQgIOnyTH_n28OjPGw-1; Fri, 17 Oct 2025 08:21:51 -0400
X-MC-Unique: PjSRdQgIOnyTH_n28OjPGw-1
X-Mimecast-MFC-AGG-ID: PjSRdQgIOnyTH_n28OjPGw_1760703710
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-471168953bdso12114495e9.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 05:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760703710; x=1761308510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I1f1Go9ZF0u3/1wsJbk01335+NkqP7+Lb6UADGNjGWw=;
 b=n6eNg48PBDhyJilK3TyjQ+wSfumWeNwBS3tokx5vIQ6IF/nbQA3icQNOTEhQmaj1x9
 6BFVkkNbt+RSuJnccOQjKeWA27+9HVveDqO79+I4trNAryRlKA0dXJNLe0FM81Qw3tq7
 KB9pd78sq3pozAXX/oDeAuTLzpC+Sj7NZ11kYA9SQrRdE6En5jvGDHg8hPFaWgiAoSX/
 T8GZUp5FSFZxb1RwRuKJ+UcCYpwRUhte9u+lY8lJEnN7gnVX5yqNoPoLPamGW/JhAaW3
 Bf9M8i5pPBgDpVlDg2cvleb/BkLHTQ8StiYRd/CDKvT41lr/4YArGEbcQ5e41ST3SN0z
 Ze1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZtL9yGtFmx7OEzFXkvFeesmmT4uZl9tFYAXX5Vm/ZjSlH7GLIIGLxNvgaJyS2/eQWpN36qZDoxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw5TwQ6Kkl7c3+Zho3BPlAPfs7XcLR53kbUn4pjH4a3IcMZR2Ca
 Bl0j/U8Qptok2eZ0X4AaF0r+72wyrvLSLWSyHJQRn26NGcGsvOCKI/ZSEsp+ADEi83SUEj4q2kp
 KHaJVvKCHzxTGeCJrvGOirEqmNuAtyvlYqWiqKEVpfRVAzXpfdMYuQg==
X-Gm-Gg: ASbGnctZAFAIrm7bIZ5CEkB9GRmIc4W4EaL0frzuH72Ez4q1iIAVdI6cXsitOxMlwxE
 mAKIe0MCEBhs1e9NMU1up/uwka/DQPhAottRwpN5WxogRCfcAFgKia3NYcqlDXWYRkvuR0Edu+o
 LH1ro+sAU6x6XTcARcaNBjdm2Ny0NEfvn6BsRDj9cKi+acxl3WJjnYRMhLsdsu+N8fQxdDIZvUw
 MZ6g964lW8YjfAmqn2XaFjVsfu+NE66MeqJ4IGniAvuvm1a5dDhjVnqVqcHfabnl364QDX/CfSp
 3mO5MQcSGjVqTSK5qu6uDU1EvunTzAeyjWesLWAVSIF1/QvuO8SSHkz2kybYB+G9vIHU2KLLppO
 jas+9hgjJ1YKRVNK6vdJLdeyptDpTJAyEf2kHAGN9GP15lQ==
X-Received: by 2002:a05:600c:a088:b0:46f:a2ba:581f with SMTP id
 5b1f17b1804b1-47117315d8emr30430915e9.16.1760703710016; 
 Fri, 17 Oct 2025 05:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZJG2OOrkBcB2lepufImcSIW620Gsz5N0PtVw2QTLigW0pT1n8E08vq54EXqG4HeJQzh7inQ==
X-Received: by 2002:a05:600c:a088:b0:46f:a2ba:581f with SMTP id
 5b1f17b1804b1-47117315d8emr30430685e9.16.1760703709595; 
 Fri, 17 Oct 2025 05:21:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711c487dfesm42391865e9.17.2025.10.17.05.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 05:21:49 -0700 (PDT)
Message-ID: <47578bc5-d12e-4208-9744-2929a17d8789@redhat.com>
Date: Fri, 17 Oct 2025 14:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/27] backends/iommufd: Introduce
 iommufd_backend_alloc_viommu
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-2-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-2-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ulRudE-kLLDfbs0-VDMloBpAuD38sUYJXF94RPqS7eI_1760703710
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add a helper to allocate a viommu object.
>
> Also introduce a struct IOMMUFDViommu that can be used later by vendor
> IOMMU implementations.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  backends/iommufd.c       | 26 ++++++++++++++++++++++++++
>  backends/trace-events    |  1 +
>  include/system/iommufd.h | 14 ++++++++++++++
>  3 files changed, 41 insertions(+)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 2a33c7ab0b..7b2e5ace2d 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -446,6 +446,32 @@ bool iommufd_backend_invalidate_cache(IOMMUFDBackend *be, uint32_t id,
>      return !ret;
>  }
>  
> +bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
> +                                  uint32_t viommu_type, uint32_t hwpt_id,
> +                                  uint32_t *out_viommu_id, Error **errp)
> +{
> +    int ret;
> +    struct iommu_viommu_alloc alloc_viommu = {
> +        .size = sizeof(alloc_viommu),
> +        .type = viommu_type,
> +        .dev_id = dev_id,
> +        .hwpt_id = hwpt_id,
> +    };
> +
> +    ret = ioctl(be->fd, IOMMU_VIOMMU_ALLOC, &alloc_viommu);
> +
> +    trace_iommufd_backend_alloc_viommu(be->fd, dev_id, viommu_type, hwpt_id,
> +                                       alloc_viommu.out_viommu_id, ret);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "IOMMU_VIOMMU_ALLOC failed");
> +        return false;
> +    }
> +
> +    g_assert(out_viommu_id);
> +    *out_viommu_id = alloc_viommu.out_viommu_id;
> +    return true;
> +}
> +
>  bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                             uint32_t hwpt_id, Error **errp)
>  {
> diff --git a/backends/trace-events b/backends/trace-events
> index 56132d3fd2..01c2d9bde9 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -21,3 +21,4 @@ iommufd_backend_free_id(int iommufd, uint32_t id, int ret) " iommufd=%d id=%d (%
>  iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) " iommufd=%d hwpt=%u enable=%d (%d)"
>  iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
>  iommufd_backend_invalidate_cache(int iommufd, uint32_t id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
> +iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index c9c72ffc45..dfe1dc2850 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -38,6 +38,16 @@ struct IOMMUFDBackend {
>      /*< public >*/
>  };
>  
> +/*
> + * Virtual IOMMU object that respresents physical IOMMU's virtualization
represents

Eric
> + * support
> + */
> +typedef struct IOMMUFDViommu {
> +    IOMMUFDBackend *iommufd;
> +    uint32_t s2_hwpt_id; /* Id of stage 2 HWPT */
> +    uint32_t viommu_id;  /* virtual IOMMU ID of allocated object */
> +} IOMMUFDViommu;
> +
>  bool iommufd_backend_connect(IOMMUFDBackend *be, Error **errp);
>  void iommufd_backend_disconnect(IOMMUFDBackend *be);
>  
> @@ -59,6 +69,10 @@ bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
>                                  uint32_t data_type, uint32_t data_len,
>                                  void *data_ptr, uint32_t *out_hwpt,
>                                  Error **errp);
> +bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
> +                                  uint32_t viommu_type, uint32_t hwpt_id,
> +                                  uint32_t *out_hwpt, Error **errp);
> +
>  bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                          bool start, Error **errp);
>  bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,


