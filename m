Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3B2E7314A
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 09:04:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmprU-0005KX-W4; Mon, 02 Feb 2026 04:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmprS-0005KH-U3
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 04:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmprQ-0008OM-OF
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 04:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770023083;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMMn6BNiifcPZLRMZ9JlUn0akaryK3EOB5AFPwwG3IQ=;
 b=jGm6zZBc5ClwpS1hxv9ztVpWOx+hcWGyCq4dBAzlLJvVjERqNpEzW2WQlK2G/EGlV4xb0e
 8tmZYBM7nCBR0B2ujcM8GgSRH6jKWIpp9CCN4HGoS3IjnPHs+ERXPLiTl9VeGooRPMEWeD
 5IibfuCJdSkq2YPBmnAkBSaNcjRwUUQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-K-iaRbSHN7CUVjE2jesc8A-1; Mon, 02 Feb 2026 04:04:40 -0500
X-MC-Unique: K-iaRbSHN7CUVjE2jesc8A-1
X-Mimecast-MFC-AGG-ID: K-iaRbSHN7CUVjE2jesc8A_1770023079
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47d4029340aso73908685e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 01:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770023079; x=1770627879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMMn6BNiifcPZLRMZ9JlUn0akaryK3EOB5AFPwwG3IQ=;
 b=fbhdjc2l3yuHAlrd+r8eLXUP3LdGANZa84VzRQfBr3+vx/vWdizACofV5Dt2vbHvyl
 ePObeyukcmtPQBxoASYtZ5/Bko5vjBzax7j1SGUvlnlJoB5w/0l44z65dDWJ44yDRvi4
 U33DrwXbtiHT0mX68C6rk/pdyT7uqlYILEDtWp4AS/RJMLtN+NgfOMPIuN9wAv7qAWAh
 uIrVeM0BfOkLDoF1UOZ6eFPKZQk7kCtQhsq8ZaigOnm1nffEIEtH/aUl9fzEH7cLvWNc
 Te5jo9TQtGax0Tgz/cocvzCus5e5TjADZLLJ/gG6/U/E3p5d7vv9Xjqz6AFRO0w6TKVC
 00+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8wV7L0SPcJ8SFMITjlLisa6GVZuO9H61sB+05PlWKAIt05YpvnibGvLk3D4/22uhsXYz9OFc6og==@nongnu.org
X-Gm-Message-State: AOJu0YwprC5H7yqwEVG8HbevpyQFaGB3rlyjRF7fjJNMk1/G0oXkkaI9
 Ap6UB15aBHAzA+woLsXRjiJCTJgHumRqeDIRf5pRy+wW0wRfIp4V9dywOX7KYLaecXcccsnHltA
 Gwyv/H7z0ys/onGMU9eUAC7cBS/tj2u3tJUR/mpbnPKPMWKxM/hDRfg==
X-Gm-Gg: AZuq6aJmSLDGUHh+QLQWOPEwPimnoa4/5OzZ67uHqusUEqXfzPAPTaIVmiGFMt0kjNG
 SWTBx4ACq6qH2aYCmN+/cc9MWKKdVuZZobqvoGWQh0f5Nyr1oEbXf++WY65U57LiTGIrc5sm4LD
 bh+RigSuhbtNnRBKVcS3ThX74TQsXS6aPDAX50Sj8v1d2K3KNStmjLfRa+Sl2vsKbgimaB09x1c
 6bObwo1SIn1Dlo+wVQcfC/OLVE1kNi4pkrKze90SSSiTprf1wVdNH+sUudxvJFMWp4hl/izm5Rl
 M6IFNh2xHNaC6Yb8+zxQCCEyCvdq32MOg91YLTm28sdZp1GOB3CaUk7sr8i0GnBWD/mwpMRD+X4
 O3BVaWdbQ5x6Xd8lV3sfyclOm6XRm7YS2hxQ5uJJR5TN/OYjIQJHcOacAjA==
X-Received: by 2002:a05:600c:6214:b0:480:1c53:208b with SMTP id
 5b1f17b1804b1-482db49da0bmr130309345e9.36.1770023078807; 
 Mon, 02 Feb 2026 01:04:38 -0800 (PST)
X-Received: by 2002:a05:600c:6214:b0:480:1c53:208b with SMTP id
 5b1f17b1804b1-482db49da0bmr130308785e9.36.1770023078322; 
 Mon, 02 Feb 2026 01:04:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c428basm471067955e9.12.2026.02.02.01.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 01:04:37 -0800 (PST)
Message-ID: <209ad0a7-8348-4892-b10b-c6e3ae04af6c@redhat.com>
Date: Mon, 2 Feb 2026 10:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] backends/iommufd: Introduce
 iommufd_backend_alloc_veventq
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260127103328.255382-1-skolothumtho@nvidia.com>
 <20260127103328.255382-2-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260127103328.255382-2-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mWegDBfRAXo6QXNiw551JZ0XTMl7FXsCcn_x5eyRsEU_1770023079
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 1/27/26 11:33 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add a new helper for IOMMU_VEVENTQ_ALLOC ioctl to allocate a virtual event
> queue (vEVENTQ) for a vIOMMU object.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric
> ---
>  backends/iommufd.c       | 31 +++++++++++++++++++++++++++++++
>  backends/trace-events    |  1 +
>  include/system/iommufd.h | 12 ++++++++++++
>  3 files changed, 44 insertions(+)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 13822df82f..acfab907c0 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -504,6 +504,37 @@ bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
>      return true;
>  }
>  
> +bool iommufd_backend_alloc_veventq(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                   uint32_t type, uint32_t depth,
> +                                   uint32_t *out_veventq_id,
> +                                   uint32_t *out_veventq_fd, Error **errp)
> +{
> +    int ret;
> +    struct iommu_veventq_alloc alloc_veventq = {
> +        .size = sizeof(alloc_veventq),
> +        .flags = 0,
> +        .type = type,
> +        .veventq_depth = depth,
> +        .viommu_id = viommu_id,
> +    };
> +
> +    ret = ioctl(be->fd, IOMMU_VEVENTQ_ALLOC, &alloc_veventq);
> +
> +    trace_iommufd_viommu_alloc_eventq(be->fd, viommu_id, type,
> +                                      alloc_veventq.out_veventq_id,
> +                                      alloc_veventq.out_veventq_fd, ret);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "IOMMU_VEVENTQ_ALLOC failed");
> +        return false;
> +    }
> +
> +    g_assert(out_veventq_id);
> +    g_assert(out_veventq_fd);
> +    *out_veventq_id = alloc_veventq.out_veventq_id;
> +    *out_veventq_fd = alloc_veventq.out_veventq_fd;
> +    return true;
> +}
> +
>  bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
>                                             uint32_t hwpt_id, Error **errp)
>  {
> diff --git a/backends/trace-events b/backends/trace-events
> index 14a7ecf5aa..5cb7d4d62d 100644
> --- a/backends/trace-events
> +++ b/backends/trace-events
> @@ -23,3 +23,4 @@ iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, u
>  iommufd_backend_invalidate_cache(int iommufd, uint32_t id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
>  iommufd_backend_alloc_viommu(int iommufd, uint32_t dev_id, uint32_t type, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
>  iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
> +iommufd_viommu_alloc_eventq(int iommufd, uint32_t viommu_id, uint32_t type, uint32_t veventq_id, uint32_t veventq_fd, int ret) " iommufd=%d viommu_id=%u type=%u veventq_id=%u veventq_fd=%u (%d)"
> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
> index 80d72469a9..e4ca16da70 100644
> --- a/include/system/iommufd.h
> +++ b/include/system/iommufd.h
> @@ -56,6 +56,13 @@ typedef struct IOMMUFDVdev {
>      uint32_t virt_id;  /* virtual device ID */
>  } IOMMUFDVdev;
>  
> +/* Virtual event queue interface for a vIOMMU */
> +typedef struct IOMMUFDVeventq {
> +    IOMMUFDViommu *viommu;
> +    uint32_t veventq_id;
> +    uint32_t veventq_fd;
> +} IOMMUFDVeventq;
> +
>  bool iommufd_backend_connect(IOMMUFDBackend *be, Error **errp);
>  void iommufd_backend_disconnect(IOMMUFDBackend *be);
>  
> @@ -86,6 +93,11 @@ bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
>                                  uint32_t viommu_id, uint64_t virt_id,
>                                  uint32_t *out_vdev_id, Error **errp);
>  
> +bool iommufd_backend_alloc_veventq(IOMMUFDBackend *be, uint32_t viommu_id,
> +                                   uint32_t type, uint32_t depth,
> +                                   uint32_t *out_veventq_id,
> +                                   uint32_t *out_veventq_fd, Error **errp);
> +
>  bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
>                                          bool start, Error **errp);
>  bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,


