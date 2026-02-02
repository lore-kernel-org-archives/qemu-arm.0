Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A86E73157
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 10:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmrTM-00060m-3P; Mon, 02 Feb 2026 05:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmrTK-00060E-KX
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 05:47:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmrTH-0002NJ-DF
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 05:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770029273;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lrK6r24AtpzLHL+icv/GbDJkO6WUSggAxRpo++ir6E=;
 b=dwYXTDIVlh1kD8aLiZ+TdavJQrTSwlM3kReBbLIJv9ufn6vE6O69XirtI6CSOLqctQ8DZR
 hRXf6ozIHD6ESsVqc5dtQXK/4/oE4BLBuj3zNKYKDAkUG09nkbLpLYTxKDw/bmKZLLzDqP
 nNESnTdfGw/i1c8MjpeIxIvnYxp6Gyw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-5Xrv5PizO4mI5pM61KPIgQ-1; Mon, 02 Feb 2026 05:47:52 -0500
X-MC-Unique: 5Xrv5PizO4mI5pM61KPIgQ-1
X-Mimecast-MFC-AGG-ID: 5Xrv5PizO4mI5pM61KPIgQ_1770029271
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4359d70faa2so2488116f8f.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 02:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770029271; x=1770634071;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lrK6r24AtpzLHL+icv/GbDJkO6WUSggAxRpo++ir6E=;
 b=eiBabbr4tV2j+Z2p6p4K6OVn3xMpYWq9RSfoWd1c/Uw/UoYAKmFVWk5f0f0nXnDi32
 NCiaQJnvPQnddmpnltxhPZ3HCCDi2w2f8L6s9ZgEd1HsCEqzTP3D12zTdwxDTWS4LIFp
 0mharEGMVet1Rjkzn9bzbwouTLSpV9bhUy60g40I3zlFGvseInGWjaMr4uKK6AEQDwGz
 7HJNHFxhpVz4/DMpa9E5VezvLgGmt6wRi3ZKK/3X6lVcvhJTYMZ01kqU20raWXKJfE1/
 t9gs5/m6ee+CTQ5O6QCitPkON97goxHUmP4gClqgL8V/mp7NKaWcEpknbaXg6WlQ7nAU
 CyBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpzktd85mhok3sieE8BlqxJ5Da3GuKwADhnBF2oohPT+PCL/hhNgdpy3rpXXBNowdxoRBzEFxcKg==@nongnu.org
X-Gm-Message-State: AOJu0YwQ8ARcO5/I6agW8omrii9CTbA8yPQt0hpT0VoJ4/aBJwSjMesq
 d1yneSiFNb37Ai4iDQ/p4/Cb0RX1+Ms9o7AZ5XVrluiQaxJ9pfEoFJR1fHtRWq5oxs5fz1mQcBs
 3cslupLeW2YYqvna72jPvAYRR5pOUOtiFvc1J+GDdbquGIe9TwCm5Pw==
X-Gm-Gg: AZuq6aKeYRSbr4TkSxlywUqDHBPkj9RA2lg0sWK6Xs69nQW67UpD8H1uhTXvHr6t8wA
 bPpyyfgJ94oNtffKbnifiDr4HVMePG48mc4Per6lprA3EUe3Gvd39hlVbfC6g+9kPG3fqirTzuL
 MUW3YJ07K6XSPzk2Y1Z5JEZbjLq3GKfzhVO7+nfOjAqaNGEjVBzMhK0atmDeatqqYMw7lHtIBG7
 a6bzeHI7Padnz3wdveggIRceCCABWXUA0hzAay2b+WVo+iRmjo7IDCSfz+k8d19Sl48J2ny4nEX
 v0zIy+fF+C+rdXSZmHr2TFhMH0s4oit2mBzqxohn1M/mpTCXGKAAabT93G7lziJnOwBYwYFGPAg
 smhEa07ffv1u+XW0Ln5IrngjqclY6LdZ1vC1VuxvFAQJ0RmVSKW2oiFSUIw==
X-Received: by 2002:a5d:5848:0:b0:431:397:4c45 with SMTP id
 ffacd0b85a97d-435f3ab501emr13590534f8f.59.1770029270792; 
 Mon, 02 Feb 2026 02:47:50 -0800 (PST)
X-Received: by 2002:a5d:5848:0:b0:431:397:4c45 with SMTP id
 ffacd0b85a97d-435f3ab501emr13590484f8f.59.1770029270282; 
 Mon, 02 Feb 2026 02:47:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10edf62sm47231853f8f.13.2026.02.02.02.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 02:47:49 -0800 (PST)
Message-ID: <9515e511-172b-4994-b5c3-b4f7606fbc27@redhat.com>
Date: Mon, 2 Feb 2026 11:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] hw/arm/smmuv3-accel: Allocate vEVENTQ for
 accelerated SMMUv3 devices
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260127103328.255382-1-skolothumtho@nvidia.com>
 <20260127103328.255382-3-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260127103328.255382-3-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -3UU-5EzYKRJbvaBQQ7RrwibeYiCXXyxdGg8EmMXnZI_1770029271
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 1/27/26 11:33 AM, Shameer Kolothum wrote:
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
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 65 +++++++++++++++++++++++++++++++++++++++++--
>  hw/arm/smmuv3-accel.h |  6 ++++
>  hw/arm/smmuv3.c       |  4 +++
>  3 files changed, 73 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index f5cd4df336..e8028d4be5 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -390,6 +390,58 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *bs, void *cmd, SMMUDevice *sdev,
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
I guess the close(fd) should already be here, no?

Eric
> +    iommufd_backend_free_id(accel->viommu->iommufd, veventq->veventq_id);
> +    g_free(veventq);
> +    accel->veventq = NULL;
> +}
> +
> +bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
> +{
> +    SMMUv3AccelState *accel = s->s_accel;
> +    IOMMUFDVeventq *veventq;
> +    uint32_t veventq_id;
> +    uint32_t veventq_fd;
> +
> +    if (!accel->viommu) {
> +        return true;
> +    }
> +
> +    if (accel->veventq) {
> +        return true;
> +    }
> +
> +    /*
> +     * Per Arm SMMUv3 specification (IHI0070 G.b, 6.3.26), the Event Queue
> +     * is enabled only after its base and size registers are programmed.
> +     * EVENTQEN is checked before allocating the vEVENTQ.
> +     */
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
> @@ -415,6 +467,7 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>      viommu->viommu_id = viommu_id;
>      viommu->s2_hwpt_id = s2_hwpt_id;
>      viommu->iommufd = idev->iommufd;
> +    accel->viommu = viommu;
>  
>      /*
>       * Pre-allocate HWPTs for S1 bypass and abort cases. These will be attached
> @@ -434,14 +487,20 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
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
> @@ -449,6 +508,7 @@ free_abort_hwpt:
>  free_viommu:
>      iommufd_backend_free_id(idev->iommufd, viommu->viommu_id);
>      g_free(viommu);
> +    accel->viommu = NULL;
>      return false;
>  }
>  
> @@ -549,6 +609,7 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      trace_smmuv3_accel_unset_iommu_device(devfn, idev->devid);
>  
>      if (QLIST_EMPTY(&accel->device_list)) {
> +        smmuv3_accel_free_veventq(accel);
>          iommufd_backend_free_id(accel->viommu->iommufd, accel->bypass_hwpt_id);
>          iommufd_backend_free_id(accel->viommu->iommufd, accel->abort_hwpt_id);
>          iommufd_backend_free_id(accel->viommu->iommufd,
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index a8a64802ec..92048bb674 100644
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
> +bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
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


