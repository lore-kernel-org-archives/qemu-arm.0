Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107B0CD4F54
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 12:56:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPgRD-0002a6-8b; Wed, 20 May 2026 08:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPgRB-0002Nq-Up
 for qemu-arm@nongnu.org; Wed, 20 May 2026 08:54:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPgR8-0004PZ-S6
 for qemu-arm@nongnu.org; Wed, 20 May 2026 08:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779281647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bm6WjGzPm13wlV15/WmuhvYi6iyVGxxABeiaagMs3mk=;
 b=J3eoK3Dfngsdtn56L3rJlf3dTvC3LJBouJs+qcNN9jk1TOoGaXxGNwZyDX4BGIslOMJl04
 WWF9y+yd14pXRXZTVSp57yH3PtNNEfDzu/CtROSKRPinFHhkbqeUkHbJxtVTkeXwQc1NOz
 JUZCSjJewfLxWzAPGq45UH13MbciKQQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-IUKYday3MKCiTocj-4KcIg-1; Wed, 20 May 2026 08:54:06 -0400
X-MC-Unique: IUKYday3MKCiTocj-4KcIg-1
X-Mimecast-MFC-AGG-ID: IUKYday3MKCiTocj-4KcIg_1779281645
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48fd3449e6dso29132945e9.3
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 05:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779281645; x=1779886445;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bm6WjGzPm13wlV15/WmuhvYi6iyVGxxABeiaagMs3mk=;
 b=jXWL5qpp2tAm3v13rwA0CkKn3AgsI+uux2JV2p+3swjW2q3ywAtfV1YixEDv7lgL2+
 e7kVWyVHmXHy8v6tvH70jF+WvWULs2yj5s1eS/bV8Z/1u6YY6muJRKoyrF7wLq7/zxcj
 iEqPsLWPgMLCRNQcuHzI31n78lqIGx40lr91uTH3U9MgwVLouRanBjbjBj2q8eaPHOyu
 950kq94WkOBjGo3+YODGwHRNfGdkFH1P31It2d/3c/XTMBUGH9UkiyvHPDAhLtBHqxSA
 k8e55hO/DyRTUnhW3xK/b0vScOXEBBgx3tVnTVv8RaMdKtC6vmy5U8xcdeVvWCyQ/KpE
 3m5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qhCzToVJKvIus5II1s7WXNWmP1vYHyBaYCgFMYu4C82D9D9IZF+gLWc+W+qxeh30u9bZ7FR8F5A==@nongnu.org
X-Gm-Message-State: AOJu0Yzfl3EczeWYcgZXnfXrmUu3HJG5zFE+eyP+bazXmcrpCfoONGvs
 W1I7bo3LeS+h7PoVdR8ziJH7+VRkP3vgtSr56uk7hWyopSChUDa0H2b63J+YqrP2zbaZQzUSfNd
 9m0Uxl/EcOV5XXgTOVvjzitJ51AfJc//0d02QgvbVOSCouYKDoYsxtA==
X-Gm-Gg: Acq92OGYDjttdy9M60x0P16hpAL9tLPsdsm3mNcCE+jMEwh+GTDz8a8MAo83Aj1j+7p
 sbc+ZGmQtJ4sEZZoujiAR68Ku2ltPBIjv1v9ji257zHKDRU4k0wCUW5gagRRdpDRsA1w+7kOR93
 0jreLnvvigTF6ZFSN94oNafekZ44NNVeNl1a/dwkLDcdVLlmNMkDxXWhHIRiS2xy9Y8qspvaOav
 NEx38J32elYOj2WZlyJdxDhE0PiHMBRJueKMaU9jX18DuhsyCWg4B9z5xoWsjSCzc3hVu1N2XLF
 6/s9DMBYQeFh1z7THDDCVIeA+hDKmK0FuvnEtBaxfgL5AdWiVbrMPVCSiC9gCqyjHet6c0R2E2z
 JOaZs4Dl1xyNH3TroMSKROuT5aNcbDeSNQPFxOKsXc2JJK/9V3M815H53ui5DsL7JwRXL9w==
X-Received: by 2002:a05:600c:8184:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-48fe60ee4admr363173385e9.14.1779281644881; 
 Wed, 20 May 2026 05:54:04 -0700 (PDT)
X-Received: by 2002:a05:600c:8184:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-48fe60ee4admr363172865e9.14.1779281644402; 
 Wed, 20 May 2026 05:54:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab52a6sm395725345e9.10.2026.05.20.05.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 05:54:03 -0700 (PDT)
Message-ID: <c0dd92b2-4ea9-45a2-afbf-b61910f71fe6@redhat.com>
Date: Wed, 20 May 2026 14:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/32] hw/arm/tegra241-cmdqv: mmap VINTF Page0 for CMDQV
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-18-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-18-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nUcaEuFJ8BeKWnRFZEquqO9XD1Aavw5HDvcRhZTnPB8_1779281645
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 5/19/26 12:36 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> The CMDQ-V CMDQ pages provide a VM wide view of all VCMDQs, while the
s/CMDQ pages/VCMDQ pages - yeah that's all very confusing ;-) -
> VINTF pages expose a logical view local to a given VINTF. Although real
> hardware may support multiple VINTFs, the kernel currently exposes a
> single VINTF per VM.
>
> The kernel provides an mmap offset for the VINTF Page0 region during
for the host VINTF page0 allocated for the VM

Actually is the whole host passthrough principle is not really explained
anywhere. At least that's my feeling. It would be nice to have a summary
for it, in the coverletter and in individual patch. Or maybe we can link
to another doc. Reading the kernel uapi does not really provide the full
picture, at least that's my own feeling.

when a VM allocates a VIOMMU for the CMDQV, the kernel allocates this
and this resource that is then given for exclusive usage of the VM ...
How does it guarantee security between VMs, etc...

Furthermore, what is not straightforward in this description is the
sequence that will be executed
- viommu_alloc done on which trap event?
- hw_queue_alloc on which trap event?
- mmap on guest VINT enable
> vIOMMU allocation. However, the logical-to-physical association between
> VCMDQs and a VINTF is only established after HW_QUEUE allocation. Prior
> to that, the mapped Page0 does not back any real VCMDQ state.
>
> When VINTF is enabled, mmap the kernel provided Page0 region and set
> ENABLE_OK only if the mmap succeeds. Unmap it when VINTF is disabled.
> This prepares the VINTF mapping in advance of subsequent patches that
> add VCMDQ allocation support.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Thanks

Eric


> ---
>  hw/arm/tegra241-cmdqv.h |  3 +++
>  hw/arm/tegra241-cmdqv.c | 50 ++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 50 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 6b21a407af..f0b031b4dc 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -37,12 +37,15 @@
>  #define CMDQV_VINTF_PAGE1_BASE  0x40000
>  #define CMDQV_VCMDQ_STRIDE      0x80
>  
> +#define VINTF_PAGE_SIZE 0x10000
> +
>  typedef struct Tegra241CMDQV {
>      struct iommu_viommu_tegra241_cmdqv cmdqv_data;
>      SMMUv3AccelState *s_accel;
>      MemoryRegion mmio_cmdqv;
>      qemu_irq irq;
>      IOMMUFDVeventq *veventq;
> +    void *vintf_page0;
>  
>      /* CMDQ-V Config page register cache */
>      uint32_t config;
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 5d2d9d2e26..4d9f094b2a 100644
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
> @@ -228,8 +230,42 @@ static void tegra241_cmdqv_write_vcmdq_page1_64(Tegra241CMDQV *cmdqv,
>      trace_tegra241_cmdqv_write_vcmdq_page1(index, offset0, value);
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
> +                                     cmdqv->cmdqv_data.out_vintf_mmap_offset,
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
> @@ -244,8 +280,11 @@ static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>  
>          cmdqv->vintf_config = value;
>          if (value & R_VINTF0_CONFIG_ENABLE_MASK) {
> -            cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
> +            if (tegra241_cmdqv_mmap_vintf_page0(cmdqv, errp)) {
> +                cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
> +            }
>          } else {
> +            tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
>          }
>          break;
> @@ -347,6 +386,7 @@ out:
>  static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>                                         uint32_t value)
>  {
> +    Error *local_err = NULL;
>      int index;
>  
>      switch (offset) {
> @@ -365,7 +405,7 @@ static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
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


