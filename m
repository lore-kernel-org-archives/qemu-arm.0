Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF7FE73150
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 09:44:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmqTN-0004nE-4W; Mon, 02 Feb 2026 04:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmqTL-0004mN-Ay
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 04:43:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmqTJ-0006RA-5O
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 04:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770025430;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbU8pJIh6K7jbov+3YQufl1RUGxgFDmK4HPj+LJ5O2s=;
 b=Ly/NFISGDvQdPZbRTN0/dNrKgIVzDpSS+FhjKc58hi63fvheNUnnMCWR47xqzlWFra+pmQ
 zKtxGRZn/enEWsjYnaJ6nO091vf5HEStXGZVGgGwFjsiBVTUoCSMecxCFS/BFIwQK1ne/n
 ZUfdeOmKEPTH70L5UzY3/QDDBHf2e5k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-25DOXRmNMtyL5PxyItNmGw-1; Mon, 02 Feb 2026 04:43:49 -0500
X-MC-Unique: 25DOXRmNMtyL5PxyItNmGw-1
X-Mimecast-MFC-AGG-ID: 25DOXRmNMtyL5PxyItNmGw_1770025428
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-435add03f12so2571149f8f.3
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 01:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770025428; x=1770630228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbU8pJIh6K7jbov+3YQufl1RUGxgFDmK4HPj+LJ5O2s=;
 b=Kgx/kebI9nFEUwLjdzGnmZ1MrVx5RhAERcErCyMDQya+HODDILdHNGQxh6JSGISy3m
 CXFKk6B+CZhyDsvJCocDRt8fzINH/IBF33TvuYVZqwe0NUzMjuF414gF0girwIVo81FY
 hQ9crunCKXgt7TdU472ZjxyMpe5WNs4pyEZqyO4HMdmyvU3oPif6pn745GOULobRNkpG
 KoYQ6cd8cnJekGDGg+Ch6XV4GdCIZHpFSoEEBJbYggt7OZrEP6I85DOl49j/1jCdmlqC
 uHwa+UsUt8HDGrEAwxHYo73+HMHeFtQ4cdBrvrnauB2E0m5cwFQrmbbmKp6I3yu3GCf9
 jhOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKSKFNq98H1aau7kL6kjIBi5HtdDaxi5jCf5eMXtUm0x4FvlhJgUjMA6AtbVI8ZbLWe6lZAO3a2A==@nongnu.org
X-Gm-Message-State: AOJu0YzqdTpGkETWgm8D3sWhb3dL88RWwKYzeAvC5AJAhxguMxJS0DEm
 KiwJhLTW5bQBfESKGM/yhrkxumjNBTUaW0Mgc9jbf0C/DcvmdI8GUcdCvAJ6Q0vx6FhUtAV0uMN
 FqTTsTYpV3yN95s71cbJ6axLH0N1+ZVdZn7sG3jvUj8XtvPuHKgmzhg==
X-Gm-Gg: AZuq6aKqgiYoMUHFaQVkA7ewtOWkeoVzDT9mktpDYdjLXIfd+93yCiMcZbWsKye+5NT
 DygNGCjQkKKczD1M7okY4KLYYFU7S8aqYmDesJvm1DIGgWMffwTEmlHv8OpsG5K2RAO6wfl+r+t
 ZYVmIX/3GXwqs6VSc/zNJQRgD87pX15bGGxIiv9c3tpD+KmfukCdTALaQ+mlKJ0Jscsfg50M/bI
 kEVeGSn+0avKBEJ+u2pYp34Y9KclOdenBpKyhTGEOsVgw5DPILkDUPN6TtJEROystGrQ329AOeT
 l9VDGWZutLTReiV7djiFdRlfTonHDL1ARmWO7z88z6OOKUt0gvI0DnxeYe2quUBZonx9tRmxMkJ
 BlHI1Y9/xBRlvLfnMmkbgiYlLcHQkbj3qqwsd6E+ePzNADl8lefJ3M+yXTQ==
X-Received: by 2002:a05:6000:4013:b0:431:a50:6e97 with SMTP id
 ffacd0b85a97d-435f3aa90b8mr16141237f8f.34.1770025428105; 
 Mon, 02 Feb 2026 01:43:48 -0800 (PST)
X-Received: by 2002:a05:6000:4013:b0:431:a50:6e97 with SMTP id
 ffacd0b85a97d-435f3aa90b8mr16141196f8f.34.1770025427641; 
 Mon, 02 Feb 2026 01:43:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1322f40sm41610063f8f.34.2026.02.02.01.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 01:43:46 -0800 (PST)
Message-ID: <4e9bd6a3-4eae-473f-98a1-97adcde56d5b@redhat.com>
Date: Mon, 2 Feb 2026 10:43:45 +0100
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
X-Mimecast-MFC-PROC-ID: 3VS4ka4P52DaUs-nlPyHAcYYlyEt9tV4L81ySXMVPh8_1770025428
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
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
I would simply remove the above comment. 

You gave me the right pointer on v2:

"
6.3.26 SMMU_CMDQ_BASE

The registers must be initialized in this
order:
1. Write SMMU_CMDQ_BASE to set the queue base and size.
2. Write initial values to SMMU_CMDQ_CONS and SMMU_CMDQ_PROD.
3. Enable the queue with an Update of the respective SMMU_CR0.CMDQEN to 1.

This also applies to the initialization of Event queue and PRI queue registers.
"

Meaning we can safely assume the queue is enabled when SMMU_CR0.CMDQEN is set to 1, which is checked below.


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
I would recommend we introduce a smmuv3_accel_free_viommu() to avoid
freeing some new stuff.

With that, 
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Thanks

Eric
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


