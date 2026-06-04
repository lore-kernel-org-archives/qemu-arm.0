Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14DACD6E4A
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 09:01:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wV3wx-0004vv-BA; Thu, 04 Jun 2026 05:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wV3ww-0004vR-3S
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 05:01:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wV3wu-0004lH-Dn
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 05:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780563671;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VjNJBT6UnsFK45Y4KkBxOwq7GcYMKnNPXWNz8FGwag=;
 b=IdZnKdukwBfi23/zT2Fe1UXgg+Uo8ceN+tBbk3tmve+iA5vgczLVUykudPiZJfo3SJ0txA
 Y+85qF6FXLjEiJ3PDbdL1E+pSMRn4US93zHlIl4nw4QS59bQM7dNG0S77cpF9P2dsjtSNp
 5V3B9Birv6Fp29QoTF2Za67BJQ0M+/w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-hRXa4l9bP9Gqho3rug1PmQ-1; Thu, 04 Jun 2026 05:01:08 -0400
X-MC-Unique: hRXa4l9bP9Gqho3rug1PmQ-1
X-Mimecast-MFC-AGG-ID: hRXa4l9bP9Gqho3rug1PmQ_1780563667
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-68c4453b623so448754a12.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 02:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780563667; x=1781168467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VjNJBT6UnsFK45Y4KkBxOwq7GcYMKnNPXWNz8FGwag=;
 b=sNAWwNUE+ZNKHDos1DXRYqdm4X5+7wxkbpvxVDJ+Oq0xmzfBSDmT0MoYJ8SfngSOK6
 xk9C1Ef8SXGydTw92/tV1u/44MhL3VWwlEOdjbUrVescKfJ4bFQuMUhw1gnJsINSXan6
 yiMhQ58cwqUwm2Nki+4f2ibZxDYI0snSJKmDM/uu3Gki86d73fyEdwjNzDrt7yO7n1kV
 W50Rjq5NYOvOZ4mCjskYT+kl+zis0nisaOn+nYhXVta0pa3QfX/aO3Ks0dxNy4mtMDGL
 onjYDELpX3e1znyqGZ2L7oQUlsVDDfiEEMRSXmPJSURUJ9va3PVzDQkZ0sLFT6x+okvz
 W/0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+WpId1KpOfwxqbNoAR/gh1oZgxE7h7HRn9EGzmUr/yDP0kCiR+TtrS7i+/amoyh4m+tgeodrnnCg==@nongnu.org
X-Gm-Message-State: AOJu0YwNLTx7r/LcamqJ+Mada5FSbiOEotP5EZMNS/kSl6ee5TQ7WoVB
 TrZ1zlRVLpE91togcq0T7qctDW6OztngH8MdXg40kVdhzBde/MQK3qjAkK0EgkBGhASXkXf5QS8
 IwxHqdW/8ZhKAdtaBpTUBNBeX7H+vI4+CeAOSYb7PGYqgXedgPIDkhA==
X-Gm-Gg: Acq92OGW/0vsVxdDhBYreDyKccfBOfJchUWGJ6vpjA6Ltm8OenW3DBUKMHXGu/5RrZ/
 phhFIVOgfceCD5gMFZlXgK70dWx8q3TGun/wWHq/CnHIL8kCg9AFoIPCU4Olu7Q9o75jwyt/LCi
 cyamwyN59UAGrMiXc0LTxzHvja+4MnhZVM6Dq8nOscdqmhm+8b6BqxJVKhjzingLU+1qKNy9J+/
 N96KuGXB/hvQSR5vDE1RooFlpcd4Ef76ev9On9nfJL6R/SJnwbPWgWpfwR4LMlNHdwU1Fk6ZzsH
 vUHVg0qNPmOKu+SraQOSyrDyHzhDwMxdwesxmUeqD9PzM3o4tqbCfjjCKDmTLNXHDuTRpylFchd
 TAB1W1yv/w+xblMeSikrxf3DUw98BHNXQfyLKGnJQhtmMp0sEF2ZRQNOEk4Z9pOWeCHuNPgHEVZ
 g1sYcV
X-Received: by 2002:a17:907:9627:b0:bed:afd7:185 with SMTP id
 a640c23a62f3a-bf0af409847mr404282566b.43.1780563667001; 
 Thu, 04 Jun 2026 02:01:07 -0700 (PDT)
X-Received: by 2002:a17:907:9627:b0:bed:afd7:185 with SMTP id
 a640c23a62f3a-bf0af409847mr404277166b.43.1780563666343; 
 Thu, 04 Jun 2026 02:01:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055500875sm264886966b.53.2026.06.04.02.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 02:01:05 -0700 (PDT)
Message-ID: <1a9b7bf7-cb1f-4826-a225-3346ba0debcb@redhat.com>
Date: Thu, 4 Jun 2026 11:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/31] hw/arm/tegra241-cmdqv: mmap VINTF Page0 for CMDQV
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260601114221.457995-1-skolothumtho@nvidia.com>
 <20260601114221.457995-18-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260601114221.457995-18-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LAgOVmXdUDFiiMDF4Kl1K0NO0erm0dxM1HU1-mTTLAM_1780563667
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 6/1/26 1:42 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> The kernel currently exposes a single VINTF per emulated SMMUv3
> instance. IOMMU_VIOMMU_ALLOC returns an mmap offset for the host
> VINTF Page0 allocated for this SMMU. However, VCMDQs only become
> bound to that VINTF after IOMMU_HW_QUEUE_ALLOC, so until then the
> mapped Page0 does not back any real VCMDQ state.
>
> When VINTF is enabled, mmap the kernel-provided Page0 region and set
> STATUS.ENABLE_OK only if the mmap succeeds; unmap it when VINTF is
> disabled. This prepares the VINTF mapping in advance of subsequent
> patches that add VCMDQ allocation and the guest MMIO install.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h |  3 +++
>  hw/arm/tegra241-cmdqv.c | 50 ++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 50 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index ad7fb8725f..c4d327a9a5 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -37,6 +37,8 @@
>  #define CMDQV_VINTF_PAGE1_BASE  0x40000
>  #define CMDQV_VCMDQ_STRIDE      0x80
>  
> +#define VINTF_PAGE_SIZE 0x10000
> +
>  struct iommu_viommu_tegra241_cmdqv;
>  
>  typedef struct Tegra241CMDQV {
> @@ -45,6 +47,7 @@ typedef struct Tegra241CMDQV {
>      MemoryRegion mmio_cmdqv;
>      qemu_irq irq;
>      IOMMUFDVeventq *veventq;
> +    void *vintf_page0;
>  
>      /* CMDQ-V Config page register cache */
>      uint32_t config;
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 3cb1b45575..a52e153501 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -9,6 +9,8 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
>  
>  #include "hw/arm/smmuv3.h"
>  #include "hw/arm/smmuv3-common.h"
> @@ -218,8 +220,42 @@ static void tegra241_cmdqv_write_vcmdq_page1_64(Tegra241CMDQV *cmdqv,
>                                             offset0, value);
>  }
>  
> +static bool
> +tegra241_cmdqv_munmap_vintf_page0(Tegra241CMDQV *cmdqv, Error **errp)
> +{
> +    if (!cmdqv->vintf_page0) {
> +        return true;
> +    }
> +
> +    if (munmap(cmdqv->vintf_page0, VINTF_PAGE_SIZE) < 0) {
> +        error_setg_errno(errp, errno, "Failed to unmap VINTF page0");
> +        return false;
> +    }
> +    cmdqv->vintf_page0 = NULL;
> +    return true;
> +}
> +
> +static bool tegra241_cmdqv_mmap_vintf_page0(Tegra241CMDQV *cmdqv, Error **errp)
> +{
> +    IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
> +
> +    if (cmdqv->vintf_page0) {
> +        return true;
> +    }
> +
> +    if (!iommufd_backend_viommu_mmap(viommu->iommufd, viommu->viommu_id,
> +                                     VINTF_PAGE_SIZE,
> +                                     cmdqv->cmdqv_data->out_vintf_mmap_offset,
> +                                     &cmdqv->vintf_page0, errp)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
> -                                              hwaddr offset, uint64_t value)
> +                                              hwaddr offset, uint64_t value,
> +                                              Error **errp)
>  {
>      int i;
>  
> @@ -234,8 +270,11 @@ static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>  
>          cmdqv->vintf_config = value;
>          if (value & R_VINTF0_CONFIG_ENABLE_MASK) {
> -            cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
> +            if (tegra241_cmdqv_mmap_vintf_page0(cmdqv, errp)) {
> +                cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
> +            }
>          } else {
> +            tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
the munmap is only done upon guest action in this patch. Later on, it is
also done on reset (in smmuv3_accel_reset called on smmu_reset_exit
called in exit phase). So I think we are good overall but it is a bit
annoying to leave it done only upon guest action in this patch. What do
you think?

Thanks

Eric 
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
>          }
>          break;
> @@ -341,6 +380,7 @@ out:
>  static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>                                         uint32_t value)
>  {
> +    Error *local_err = NULL;
>      int index;
>  
>      switch (offset) {
> @@ -359,7 +399,7 @@ static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>          cmdqv->cmdq_alloc_map[(offset - A_CMDQ_ALLOC_MAP_0) / 4] = value;
>          break;
>      case A_VINTF0_CONFIG ... A_VINTF0_LVCMDQ_ERR_MAP_3:
> -        tegra241_cmdqv_config_vintf_write(cmdqv, offset, value);
> +        tegra241_cmdqv_config_vintf_write(cmdqv, offset, value, &local_err);
>          break;
>      case A_VI_VCMDQ0_CONS_INDX ... A_VI_VCMDQ1_GERRORN:
>          /*
> @@ -398,6 +438,10 @@ static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%" PRIx64 "\n",
>                        __func__, offset);
>      }
> +
> +    if (local_err) {
> +        error_report_err(local_err);
> +    }
>  }
>  
>  /*


