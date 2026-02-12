Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1055EEE36AE
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 17:38:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqadi-0006iJ-U6; Thu, 12 Feb 2026 12:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqade-0006h2-GY
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 12:38:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqadb-0000qI-FF
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 12:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770917877;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14XJ4PawqPeQcZyHiAcCxoTlphXk9DItdZb30C4HsPE=;
 b=SeNhGkEWuzYPaDNLobaEJlXWoZ5RsvbkyQu04PHSP3dmFozeB+0vfYRb8qwoztNGGfsCrR
 ECk2+KsbMaefGXX7tfUDdD/wG3HXwoov6jX0gc/PfsYNkMHZithv/lGtig9C3xCvSurMxV
 BtHTi+154ab+2wtaHhI6ic/T672UNnY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-PAgbT95UPqK9zr-14s8NVA-1; Thu, 12 Feb 2026 12:37:56 -0500
X-MC-Unique: PAgbT95UPqK9zr-14s8NVA-1
X-Mimecast-MFC-AGG-ID: PAgbT95UPqK9zr-14s8NVA_1770917875
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b8863e43fefso2109666b.0
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 09:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770917875; x=1771522675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14XJ4PawqPeQcZyHiAcCxoTlphXk9DItdZb30C4HsPE=;
 b=BDfha5iEFgN7OiAKTerwFNa6Ba2nEDhxu7BTgf+OqesTt01d4lYvOfHGIQ3/TDEy3k
 5g2gdTyDdpW2Ohyw8QOEcIMkW/i5g893A0cURKZGNMB52xW6XTJKXEZHCieABE/n1g0l
 lTcILCg9Y/rVGexsDDRilFxSt6AJCY1tvipP8bJQCWZI5cuQ3yX2nN2zuQuJ8iPKswM3
 1NDvwFBEYn4dr0ypSSxkGGPosTagso+zzPr/XMlpOWQRly+lzlgm6hgHATUIOAhLfe58
 F1Fvd3rYpbgtwZ9KfbpxOKdn+FgyxQZZ/qa95iT3JUA7I75fpeRoyfTd0+IptiUpVbJI
 29oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM9ijHPiuOG4z5RbEs7PnXCwTzX7eGOlPh6RtEex7FaxwGKHpKdYe0ZylfIgb/K8ClvoZfD+BH+A==@nongnu.org
X-Gm-Message-State: AOJu0YzdO+N46pAaJ7OMr2JPGpYNg244P3sS0StX8MjDVWFBfBi29TfJ
 wTi2BOZ5RCZdISlVoAfdP+HtJsEnH1yv3y+3zo1Cx6i9bSI8iddgu9KfDoEqLtiiXqVs3vt8H3E
 8QnVanzHa/6Aypv+PNnTbaEPMVmIilsG6MPknylEDBcCKEobP8WZilw==
X-Gm-Gg: AZuq6aK4DGhI6aqaO+18rTNhXH8QEMl9Z7YGWR+hab15m72R2/FG6QOJua0JH3/8uyE
 k8jOwXJAfz1MABmTDfD94Ks//RjDe9X8LUxWQ3zLJASzIpUWOZKRXWXRn0iajAuZSa1R122NSu7
 UZ0ku5B5juFZ4sZ54mnA6iQnoQugcUw3uag2SVpC6NGQV2+F41GhqfHRS5QslP/YkkJje4goe4v
 Xzm0XNTAqPdqEaofutXJn+AcvnUKjnYKa5sVYttlzwRQYy3saEtIdLGKBtfRn29LUpE/OCyzk+O
 pBTC+6eHFHVk31ciKSwzSWxj2Cv6u8Y3W2UKoYFHkLRJb/rRA0vj8ASy1Z3e+mwxvm6rf92iT2t
 P4E3oJU/CqoLUaPCpefuMYxhjphmMfJyn08lvZgAdcaeIswjwjFiapf0723HkMBZ1hx1A3Q==
X-Received: by 2002:a17:906:fe08:b0:b73:7b97:5bfb with SMTP id
 a640c23a62f3a-b8faa4208f0mr6671866b.33.1770917874677; 
 Thu, 12 Feb 2026 09:37:54 -0800 (PST)
X-Received: by 2002:a17:906:fe08:b0:b73:7b97:5bfb with SMTP id
 a640c23a62f3a-b8faa4208f0mr6669466b.33.1770917874055; 
 Thu, 12 Feb 2026 09:37:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6e99af3bsm178251666b.18.2026.02.12.09.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 09:37:53 -0800 (PST)
Message-ID: <407ed2cd-aac3-4738-ac5d-8069ec42a611@redhat.com>
Date: Thu, 12 Feb 2026 18:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/24] hw/arm/smmuv3-accel: Wire CMDQV ops into accel
 lifecycle
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-8-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-8-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mpl2oUk8F5GtYgnm5tIbOWIyjsaC_Yn5B6R9o5lp83Q_1770917875
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> Integrate CMDQV ops support into the accelerated SMMUv3 path. When CMDQV
> is enabled, the backend ops are used to initialize CMDQV state and to
> allocate the vIOMMU instance. The current implementation connects the
> Tegra241 CMDQV backend, but does not enable functional support yet.
>
> No functional changes intended.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c   | 65 ++++++++++++++++++++++++++++++++++++-----
>  hw/arm/smmuv3-accel.h   |  5 ++++
>  hw/arm/smmuv3.c         |  1 +
>  include/hw/arm/smmuv3.h |  2 ++
>  4 files changed, 66 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 9036b14601..b1a8ab79b5 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -18,6 +18,7 @@
>  
>  #include "smmuv3-internal.h"
>  #include "smmuv3-accel.h"
> +#include "tegra241-cmdqv.h"
>  
>  /*
>   * The root region aliases the global system memory, and shared_as_sysmem
> @@ -520,6 +521,7 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                            Error **errp)
>  {
>      SMMUv3AccelState *accel = s->s_accel;
> +    const SMMUv3AccelCmdqvOps *cmdqv_ops = accel->cmdqv_ops;
>      struct iommu_hwpt_arm_smmuv3 bypass_data = {
>          .ste = { SMMU_STE_CFG_BYPASS | SMMU_STE_VALID, 0x0ULL },
>      };
> @@ -530,12 +532,24 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>      uint32_t viommu_id, hwpt_id;
>      IOMMUFDViommu *viommu;
>  
> -    if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> -                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3, s2_hwpt_id,
> -                                      NULL, 0, &viommu_id, errp)) {
> +    if (cmdqv_ops && (!cmdqv_ops->alloc_viommu || !cmdqv_ops->alloc_veventq)) {
> +        error_setg(errp, "CMDQV vIOMMU allocation not supported");
>          return false;
>      }
>  
> +    if (cmdqv_ops) {
> +        if (!cmdqv_ops->alloc_viommu(s, idev, &viommu_id, errp)) {
> +            return false;
> +        }
> +    } else {
> +        if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> +                                          IOMMU_VIOMMU_TYPE_ARM_SMMUV3,
> +                                          s2_hwpt_id, NULL, 0, &viommu_id,
> +                                          errp)) {
this is not add-on code but rather a switch. Depending on the cmdq type, 

sizeof(cmdqv->cmdqv_data) varies. Wondering if ops does not makes sense here either.

> +            return false;
> +        }
> +    }
> +
>      viommu = g_new0(IOMMUFDViommu, 1);
>      viommu->viommu_id = viommu_id;
>      viommu->s2_hwpt_id = s2_hwpt_id;
> @@ -565,13 +579,21 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>          goto free_bypass_hwpt;
>      }
>  
> +    if (cmdqv_ops && !cmdqv_ops->alloc_veventq(s, errp)) {
> +        goto free_veventq;
> +    }
> +
>      /* Attach a HWPT based on SMMUv3 GBPA.ABORT value */
>      hwpt_id = smmuv3_accel_gbpa_hwpt(s, accel);
>      if (!host_iommu_device_iommufd_attach_hwpt(idev, hwpt_id, errp)) {
> -        goto free_veventq;
> +        goto free_cmdqv_veventq;
>      }
>      return true;
>  
> +free_cmdqv_veventq:
> +    if (cmdqv_ops && cmdqv_ops->free_veventq) {
> +        cmdqv_ops->free_veventq(s);
> +    }
>  free_veventq:
>      smmuv3_accel_free_veventq(accel);
>  free_bypass_hwpt:
> @@ -579,7 +601,11 @@ free_bypass_hwpt:
>  free_abort_hwpt:
>      iommufd_backend_free_id(idev->iommufd, accel->abort_hwpt_id);
>  free_viommu:
> -    iommufd_backend_free_id(idev->iommufd, viommu->viommu_id);
> +    if (cmdqv_ops && cmdqv_ops->free_viommu) {
> +        cmdqv_ops->free_viommu(s);
> +    } else {
> +        iommufd_backend_free_id(idev->iommufd, viommu->viommu_id);
> +    }
>      g_free(viommu);
>      accel->viommu = NULL;
>      return false;
> @@ -865,8 +891,17 @@ bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp)
>  
>  void smmuv3_accel_reset(SMMUv3State *s)
>  {
> -     /* Attach a HWPT based on GBPA reset value */
> -     smmuv3_accel_attach_gbpa_hwpt(s, NULL);
> +    SMMUv3AccelState *accel = s->s_accel;
> +
> +    if (!accel) {
> +        return;
> +    }
> +    /* Attach a HWPT based on GBPA reset value */
> +    smmuv3_accel_attach_gbpa_hwpt(s, NULL);
> +
> +    if (accel->cmdqv_ops && accel->cmdqv_ops->reset) {
> +        accel->cmdqv_ops->reset(s);
> +    }
>  }
>  
>  static void smmuv3_accel_as_init(SMMUv3State *s)
> @@ -886,6 +921,22 @@ static void smmuv3_accel_as_init(SMMUv3State *s)
>      address_space_init(shared_as_sysmem, &root, "smmuv3-accel-as-sysmem");
>  }
>  
> +bool smmuv3_accel_cmdqv_init(SMMUv3State *s, Error **errp)
> +{
> +    SMMUv3AccelState *accel = s->s_accel;
> +
> +    if (!accel || !s->tegra241_cmdqv) {
isn't tegra241_cmdqv also only accelerated. Why do we need to have both
checks?
> +        return true;
> +    }
> +
> +    accel->cmdqv_ops = tegra241_cmdqv_ops();
> +    if (!accel->cmdqv_ops || !accel->cmdqv_ops->init) {
> +        error_setg(errp, "CMDQV support not available");
> +        return false;
> +    }
> +    return accel->cmdqv_ops->init(s, errp);
> +}
> +
>  void smmuv3_accel_init(SMMUv3State *s)
>  {
>      SMMUState *bs = ARM_SMMU(s);
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index ca087240e5..33da37bfc1 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -74,6 +74,7 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>  void smmuv3_accel_idr_override(SMMUv3State *s);
>  bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp);
>  void smmuv3_accel_reset(SMMUv3State *s);
> +bool smmuv3_accel_cmdqv_init(SMMUv3State *s, Error **errp);
>  #else
>  static inline void smmuv3_accel_init(SMMUv3State *s)
>  {
> @@ -110,6 +111,10 @@ static inline bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
>  static inline void smmuv3_accel_reset(SMMUv3State *s)
>  {
>  }
> +static bool smmuv3_accel_cmdqv_init(SMMUv3State *s, Error **errp)
> +{
> +    return true;
> +}
>  #endif
>  
>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 148af80efd..7858bf2c33 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2034,6 +2034,7 @@ static void smmu_realize(DeviceState *d, Error **errp)
>  
>      smmu_init_irq(s, dev);
>      smmuv3_init_id_regs(s);
> +    smmuv3_accel_cmdqv_init(s, errp);
>  }
>  
>  static const VMStateDescription vmstate_smmuv3_queue = {
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 26b2fc42fd..87926f8cb3 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -73,6 +73,8 @@ struct SMMUv3State {
>      bool ats;
>      uint8_t oas;
>      uint8_t ssidsize;
> +    /* Support for NVIDIA Tegra241 SMMU CMDQV extension */
> +    bool tegra241_cmdqv;
so I really advocate for auto detection and I think in that context I
still think a selection of ops depending on the type of the cmdqv may be
more future proof.
Also to me this should be within struct SMMUv3AccelState if cmdqv only
works with accel. Or does emulation of cmdqv make sense?

Thanks

Eric
>  };
>  
>  typedef enum {


