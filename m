Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257B6E91290
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 08:33:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnunY-0000PS-Kd; Thu, 05 Feb 2026 03:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vnunW-0000Or-SC
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 03:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vnunV-000701-3r
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 03:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770280388;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLzkHsKD6/ioepJFsTlKog+VPB2tzTPdSFf6nTBa09E=;
 b=cA7Ub92USJU2jBzYg45MmMMQTQaDYfGIYBaZRLJGxKu82hf6kH9Rod3ft4LwhxR4JwZjPm
 d5gCtGiHqaJZZbwf24SOsiVGxgJeTfOAPlFJ9Fy2SCkngUhj7aAAlL9OSFauQV47tgrykG
 xBpxZgAzT1fFQq3IWCY20c6q9u2cPcU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-3KJEB9R9Phy6TRm9B2rNsQ-1; Thu, 05 Feb 2026 03:33:05 -0500
X-MC-Unique: 3KJEB9R9Phy6TRm9B2rNsQ-1
X-Mimecast-MFC-AGG-ID: 3KJEB9R9Phy6TRm9B2rNsQ_1770280384
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4801c1056c7so3529625e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 00:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770280384; x=1770885184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tLzkHsKD6/ioepJFsTlKog+VPB2tzTPdSFf6nTBa09E=;
 b=k99ADiVcBiZ3CmsNtCfbfXKAAqETgswGdYX1KqXOwq6sfEraNr7QPFIck+Yn22MMDI
 9+KHvg6DH5In2JYS1sfTVPMeex6W5VtQnx74nhSvIUDnJ/Trixe2/utB3aHZCuxRsatk
 xJH7gCoSPXTISgeWmwx5s/BBfFMsFOeP7PSsFKaFVQyjIpjILw0rvR4aRxdvpio5ZiXr
 q16cNXvTebCP2U9kg+mbvqzgCJE3pGcEAHlgh/hrqIlCOwRifFvDTNs9+35Z0EnAVLIs
 7vOra0oaIk1X1o3icp8+BoP63o6JUVugGjiFK1rP39VCLckdrRWkbrABSbdp+0b1pZNI
 7HQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/iIxCYEa28ML3Fae7ymR5Z/4+cVFaej1No8OuP+zQACJn6IouO7R1XfL2TWa2SlrOVwra6Ta9Hg==@nongnu.org
X-Gm-Message-State: AOJu0YxKTKxImbFUSIuoCe2G6MC5x0c+fN/yzmQ1fpqMAywKmDUh08Xs
 JNg2URLGQeWw++o/ykFzcG7xh7tw0AcXly9J3Acl1SqHZx5DmRKV6d3S27t6xsHb+Y5cjbf9XAL
 E6t7BVU4EDKC4O4wvH7VOMlMRIE2Fm289Ro9zjcnNRzbcY/upn6XFeA==
X-Gm-Gg: AZuq6aKwcpAdWQOb972J8iozIPb823g2as4+UTU3YfA5O+8v7b2HlcaF7i8hg+C8RT6
 DXTT4dxe8OOcNqQnWRdIqx1xEtNgAYxu1HWckpgrwDDnHNJUyiX6QwEjm565ySjnghG57gVwbtY
 cv+G1nwC/Qn7k7Pu9+KM8MxcIQpoGZNlM0dmDy4Km5xNTw4C0u7v/sooB+ydeKnZDMuspyQdon9
 Ebgt94lMRd68VeWuMLy6HaTeuPXaLlouv2ng9rQtLOvTfuKhBzS8how7EhoJLHALQheE98Gc6pw
 VMMX4QxRLB6VK0dJIsjRlawRHYpSMd7Am/Sj728Dl/CdwKOTefhE3rerKF/QqPoVANMvQt023CB
 i4YNanwFeel2BUGSsvbQeSUPG50dN2yvIl6heiyIdDYWffaEEyHMDRY0GzQ==
X-Received: by 2002:a05:600c:828e:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-4830e92af93mr84549215e9.7.1770280383732; 
 Thu, 05 Feb 2026 00:33:03 -0800 (PST)
X-Received: by 2002:a05:600c:828e:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-4830e92af93mr84548855e9.7.1770280383300; 
 Thu, 05 Feb 2026 00:33:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d345c2sm56322645e9.6.2026.02.05.00.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 00:33:02 -0800 (PST)
Message-ID: <c9f00721-d36e-4a76-a5c5-9f23ffa62080@redhat.com>
Date: Thu, 5 Feb 2026 09:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] hw/arm/smmuv3-accel: Allocate vEVENTQ for
 accelerated SMMUv3 devices
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260204190008.20070-1-skolothumtho@nvidia.com>
 <20260204190008.20070-4-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260204190008.20070-4-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bkr2Z89RLYw0KC-KFF4mX8zWz3YlWaJrfbJcOFZq1Vo_1770280384
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

Hi Shameer,

On 2/4/26 8:00 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> When the guest enables the Event Queue and a vIOMMU is present, allocate a
> vEVENTQ object so that host-side events related to the vIOMMU can be
> received and propagated back to the guest.
>
> For cold-plugged devices using SMMUv3 acceleration, the vIOMMU is created
> before the guest boots. In this case, the vEVENTQ is allocated when the
> guest writes to SMMU_CR0 and sets EVENTQEN = 1.
>
> If no cold-plugged device exists at boot (i.e. no vIOMMU initially), the
> vEVENTQ is allocated when a vIOMMU is created, i.e. during the first
> device hot-plug.
>
> Event read and propagation will be added in a later patch.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 61 +++++++++++++++++++++++++++++++++++++++++--
>  hw/arm/smmuv3-accel.h |  6 +++++
>  hw/arm/smmuv3.c       |  4 +++
>  3 files changed, 69 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index c19c526fca..2ca0d1deac 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -390,6 +390,19 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *bs, void *cmd, SMMUDevice *sdev,
>                     sizeof(Cmd), &entry_num, cmd, errp);
>  }
>  
> +static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
> +{
> +    IOMMUFDVeventq *veventq = accel->veventq;
> +
> +    if (!veventq) {
> +        return;
> +    }
> +    close(veventq->veventq_fd);
> +    iommufd_backend_free_id(accel->viommu->iommufd, veventq->veventq_id);
> +    g_free(veventq);
> +    accel->veventq = NULL;
> +}
> +
>  static void smmuv3_accel_free_viommu(SMMUv3AccelState *accel)
>  {
>      IOMMUFDViommu *viommu = accel->viommu;
> @@ -397,6 +410,7 @@ static void smmuv3_accel_free_viommu(SMMUv3AccelState *accel)
>      if (!viommu) {
>          return;
>      }
> +    smmuv3_accel_free_veventq(accel);
>      iommufd_backend_free_id(viommu->iommufd, accel->bypass_hwpt_id);
>      iommufd_backend_free_id(viommu->iommufd, accel->abort_hwpt_id);
>      iommufd_backend_free_id(viommu->iommufd, accel->viommu->viommu_id);
> @@ -404,6 +418,41 @@ static void smmuv3_accel_free_viommu(SMMUv3AccelState *accel)
>      accel->viommu = NULL;
>  }
>  
> +bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
> +{
> +    SMMUv3AccelState *accel = s->s_accel;
> +    IOMMUFDVeventq *veventq;
> +    uint32_t veventq_id;
> +    uint32_t veventq_fd;

you need to check !accel because in case of non accelerated SMMU it
sigsevs in smmu_writel/smmuv3_accel_alloc_veventq path

Thanks

Eric
>
> +
> +    if (!accel->viommu) {
> +        return true;
> +    }
> +
> +    if (accel->veventq) {
> +        return true;
> +    }
> +
> +    if (!smmuv3_eventq_enabled(s)) {
> +        return true;
> +    }
> +
> +    if (!iommufd_backend_alloc_veventq(accel->viommu->iommufd,
> +                                       accel->viommu->viommu_id,
> +                                       IOMMU_VEVENTQ_TYPE_ARM_SMMUV3,
> +                                       1 << s->eventq.log2size, &veventq_id,
> +                                       &veventq_fd, errp)) {
> +        return false;
> +    }
> +
> +    veventq = g_new(IOMMUFDVeventq, 1);
> +    veventq->veventq_id = veventq_id;
> +    veventq->veventq_fd = veventq_fd;
> +    veventq->viommu = accel->viommu;
> +    accel->veventq = veventq;
> +    return true;
> +}
> +
>  static bool
>  smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                            Error **errp)
> @@ -429,6 +478,7 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>      viommu->viommu_id = viommu_id;
>      viommu->s2_hwpt_id = s2_hwpt_id;
>      viommu->iommufd = idev->iommufd;
> +    accel->viommu = viommu;
>  
>      /*
>       * Pre-allocate HWPTs for S1 bypass and abort cases. These will be attached
> @@ -448,14 +498,20 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>          goto free_abort_hwpt;
>      }
>  
> +    /* Allocate a vEVENTQ if guest has enabled event queue */
> +    if (!smmuv3_accel_alloc_veventq(s, errp)) {
> +        goto free_bypass_hwpt;
> +    }
> +
>      /* Attach a HWPT based on SMMUv3 GBPA.ABORT value */
>      hwpt_id = smmuv3_accel_gbpa_hwpt(s, accel);
>      if (!host_iommu_device_iommufd_attach_hwpt(idev, hwpt_id, errp)) {
> -        goto free_bypass_hwpt;
> +        goto free_veventq;
>      }
> -    accel->viommu = viommu;
>      return true;
>  
> +free_veventq:
> +    smmuv3_accel_free_veventq(accel);
>  free_bypass_hwpt:
>      iommufd_backend_free_id(idev->iommufd, accel->bypass_hwpt_id);
>  free_abort_hwpt:
> @@ -463,6 +519,7 @@ free_abort_hwpt:
>  free_viommu:
>      iommufd_backend_free_id(idev->iommufd, viommu->viommu_id);
>      g_free(viommu);
> +    accel->viommu = NULL;
>      return false;
>  }
>  
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index a8a64802ec..dba6c71de5 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -22,6 +22,7 @@
>   */
>  typedef struct SMMUv3AccelState {
>      IOMMUFDViommu *viommu;
> +    IOMMUFDVeventq *veventq;
>      uint32_t bypass_hwpt_id;
>      uint32_t abort_hwpt_id;
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
> @@ -50,6 +51,7 @@ bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp);
>  bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>                                  Error **errp);
>  void smmuv3_accel_idr_override(SMMUv3State *s);
> +bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp);
>  void smmuv3_accel_reset(SMMUv3State *s);
>  #else
>  static inline void smmuv3_accel_init(SMMUv3State *s)
> @@ -80,6 +82,10 @@ smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>  static inline void smmuv3_accel_idr_override(SMMUv3State *s)
>  {
>  }
> +static inline bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
> +{
> +    return true;
> +}
>  static inline void smmuv3_accel_reset(SMMUv3State *s)
>  {
>  }
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index c08d58c579..210ac038fe 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1605,6 +1605,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          s->cr0ack = data & ~SMMU_CR0_RESERVED;
>          /* in case the command queue has been enabled */
>          smmuv3_cmdq_consume(s, &local_err);
> +        /* Allocate vEVENTQ if EventQ is enabled and a vIOMMU is available */
> +        if (local_err == NULL) {
> +            smmuv3_accel_alloc_veventq(s, &local_err);
> +        }
>          break;
>      case A_CR1:
>          s->cr[1] = data;


