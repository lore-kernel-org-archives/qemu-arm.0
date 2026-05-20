Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13207CD4F5E
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 05:27:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPZSw-0003MV-ID; Wed, 20 May 2026 01:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPZSu-0003Lk-Hs
 for qemu-arm@nongnu.org; Wed, 20 May 2026 01:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPZSs-0006Gu-9H
 for qemu-arm@nongnu.org; Wed, 20 May 2026 01:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779254848;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5XbjwV6NTsA2Gds27KSVv5cPEJU9VfwGknHFJJ65/c=;
 b=NaA/eQbbYKRUiNMQDbmQlgc/9hXrX/W79z53NEPI/jAFz4mn6ynQ5ttYMalk6oomqdTvR5
 +ouscX5kVNUH8KBjP0sJJCiOCIc8Vjl2B0m2D9ZVwgNdTUIHPh4o1zT7Ag4iGb5rS4l+8B
 opBFvesgxvdgO2WuJy5Or5PyoUA6jTI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-x9CAKBy7N4ObYqZmLlTddQ-1; Wed, 20 May 2026 01:27:26 -0400
X-MC-Unique: x9CAKBy7N4ObYqZmLlTddQ-1
X-Mimecast-MFC-AGG-ID: x9CAKBy7N4ObYqZmLlTddQ_1779254846
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45e80183514so2461038f8f.3
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 22:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779254845; x=1779859645;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5XbjwV6NTsA2Gds27KSVv5cPEJU9VfwGknHFJJ65/c=;
 b=WZMn76Ficnf6E86jcW54DmXsM3O5bkzBc0t4F7OWrYProCWDCzJ+omLtcCulNxgki3
 KzX/VfTADp5kC/VKXxHZXgJAi5BSJhr7mjgSpTR1fojsqo0UbhylJjHWAEclOlcffoHE
 A2LPvs3iCjPcP2oG1rUcq+gz7fXgQatyci+BSOx+3cAuVzcvsE/uIu6D/5259iKohnrL
 0vPQ7kIi/BFhlHVhjYILlNmaLgN0UBNwlXuR9yjLL+P9ROwrrZdrRwZ6k/g3b5O9NNVE
 saZKoFxJdYXzS0wr5hGh0840QQKGa8LbdC6Kjssx+sluAVCbLcBXSteiGlWf25EKCYyV
 QSZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8NEk5oWbL/dchmyt94TNyyCDe8n67aNZ3r/5P4gwDxqJXlLGoq2Ogf/YKuoxSAj46GgWsr6XqkKw==@nongnu.org
X-Gm-Message-State: AOJu0YzH4XFeqtJTtMuhat59sGX/h/esq/9cb+fTGL/v6UXqh9W4PdFX
 aik15rICGkyb3E0zhTdYm4YsCeZtl8Odc2oeaV1JvewLrolpcRfyLH5fao+vLrQFbPXW3Ci5lOh
 8xV8dSuiOxcQtkJ+C8x+qVh2RubOuUPeFGldkwu3m8Iu/jPuFTbVIGg==
X-Gm-Gg: Acq92OF4bTm4poYosuXKEv8qbCjuZfwTplPFRobfuLnw93Ppl7JWGOLSDigjniueiJC
 sw2c8UghODcAQCUEfLrkg4Hm5pwQBHb/wMI3aEaZLA86OfzbTt03Y0BNhaJDEbUr64bYOvqlyhl
 ry72C5F8bIufoKE0dfdT/Vws+s7jcNbvk6BrSXNhgHTpo7ohDuSRKPQlA5V+poLEHrZ74ECh1V/
 RPqt8YrUH4WPuu/g3bsRnmzSBPsQ8Ti50uWooynO/1nFJKow4t5BX25TgNd+ipbHk/+bLaEh40/
 pdy8oScK0Nf9MYiL3A/vZSpLTUVVTYGxksZwAloRXDOJkgcY+LTvnIUi2HN5+EM4mH/RkR7qYiV
 ZX2BGN0+zxiAPXCP3mIYXtqd83/az3YF3QnId3Yta8oWiaTJ9rAK5O0uqfa/UyjQPH/MuZA==
X-Received: by 2002:a05:6000:1845:b0:454:86d:b4d2 with SMTP id
 ffacd0b85a97d-45e5c5b39f7mr35111221f8f.8.1779254845610; 
 Tue, 19 May 2026 22:27:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1845:b0:454:86d:b4d2 with SMTP id
 ffacd0b85a97d-45e5c5b39f7mr35111166f8f.8.1779254845094; 
 Tue, 19 May 2026 22:27:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1aeafsm53590284f8f.23.2026.05.19.22.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 22:27:24 -0700 (PDT)
Message-ID: <b1b5fcf0-bbd9-49dd-87ad-18c106708125@redhat.com>
Date: Wed, 20 May 2026 07:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/32] hw/arm/smmuv3-accel: Wire CMDQV ops into accel
 lifecycle
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-9-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-9-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 87Gy33fhMG38eBJF_EjeXexPVNFZ9tQraZTerV2tWCU_1779254846
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi SHameer,

On 5/19/26 12:36 PM, Shameer Kolothum wrote:
> Add support for selecting and initializing a CMDQV backend based on the
> cmdqv OnOffAuto property.
>
> If set to OFF, CMDQV is not used and the default IOMMUFD-backed allocation
> path is taken.
>
> If set to AUTO, QEMU attempts to probe a CMDQV backend during device setup.
> If probing succeeds, the selected ops are stored in the accelerated SMMUv3
> state and used. If probing fails, QEMU silently falls back to the default
> path.
>
> If set to ON, QEMU requires CMDQV support. Probing is performed during
> setup and failure results in an error.
>
> When a CMDQV backend is active, its callbacks are used for vIOMMU
> allocation, free, and reset handling. Otherwise, the base implementation
> is used.
>
> The current implementation wires up the Tegra241 CMDQV backend through the
> generic ops interface. Functional CMDQV behaviour is added in subsequent
> patches.
>
> No functional change.
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  include/hw/arm/smmuv3.h |  2 +
>  hw/arm/smmuv3-accel.c   | 96 ++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 91 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index fe0493c1aa..aa6a79237a 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -74,6 +74,8 @@ struct SMMUv3State {
>      OnOffAuto ats;
>      OasMode oas;
>      SsidSizeMode ssidsize;
> +    /* SMMU CMDQV extension */
> +    OnOffAuto cmdqv;
>  
>      Notifier machine_done;
>  };
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 30c498ffcf..202b1aedd9 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -19,6 +19,7 @@
>  #include "smmuv3-internal.h"
>  #include "smmuv3-accel.h"
>  #include "system/system.h"
> +#include "tegra241-cmdqv.h"
>  
>  /*
>   * The root region aliases the global system memory, and shared_as_sysmem
> @@ -570,6 +571,7 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *hiodi,
>                            Error **errp)
>  {
>      SMMUv3AccelState *accel = s->s_accel;
> +    const SMMUv3AccelCmdqvOps *cmdqv_ops = accel->cmdqv_ops;
>      struct iommu_hwpt_arm_smmuv3 bypass_data = {
>          .ste = { SMMU_STE_CFG_BYPASS | SMMU_STE_VALID, 0x0ULL },
>      };
> @@ -580,10 +582,17 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *hiodi,
>      uint32_t viommu_id, hwpt_id;
>      IOMMUFDViommu *viommu;
>  
> -    if (!iommufd_backend_alloc_viommu(hiodi->iommufd, hiodi->devid,
> -                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3, s2_hwpt_id,
> -                                      NULL, 0, &viommu_id, errp)) {
> -        return false;
> +    if (cmdqv_ops) {
> +        if (!cmdqv_ops->alloc_viommu(s, hiodi, &viommu_id, errp)) {
the doc comment in 6/32 says that alloc_iommu is mandatory if probe is
implemented. So it looks there are situations where alloc_iommu may be null.

But actually given the implementation of smmuv3_accel_probe_cmdqv below,
the ops is only non NULL if probe has succeeded. So shouldn't probe be
also mandatory?
> +            return false;
> +        }
> +    } else {
> +        if (!iommufd_backend_alloc_viommu(hiodi->iommufd, hiodi->devid,
> +                                          IOMMU_VIOMMU_TYPE_ARM_SMMUV3,
> +                                          s2_hwpt_id, NULL, 0, &viommu_id,
> +                                          errp)) {
> +            return false;
> +        }
>      }
>  
>      viommu = g_new0(IOMMUFDViommu, 1);
> @@ -629,12 +638,72 @@ free_bypass_hwpt:
>  free_abort_hwpt:
>      iommufd_backend_free_id(hiodi->iommufd, accel->abort_hwpt_id);
>  free_viommu:
> -    iommufd_backend_free_id(hiodi->iommufd, viommu->viommu_id);
> +    if (cmdqv_ops && cmdqv_ops->free_viommu) {
> +        cmdqv_ops->free_viommu(s);
> +    } else {
> +        iommufd_backend_free_id(hiodi->iommufd, viommu->viommu_id);
> +    }
>      g_free(viommu);
>      accel->viommu = NULL;
>      return false;
>  }
>  
> +static const SMMUv3AccelCmdqvOps *
> +smmuv3_accel_probe_cmdqv(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
> +                         Error **errp)
> +{
> +    const SMMUv3AccelCmdqvOps *ops = tegra241_cmdqv_get_ops();
> +
> +    if (!ops || !ops->probe) {
> +        error_setg(errp, "No CMDQV ops found");
> +        return NULL;
> +    }
> +
> +    if (!ops->probe(s, idev, errp)) {
> +        return NULL;
> +    }
> +    return ops;
> +}
> +
> +static bool
> +smmuv3_accel_select_cmdqv(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
> +                          Error **errp)
> +{
> +    const SMMUv3AccelCmdqvOps *ops = NULL;
> +
> +    if (s->s_accel->cmdqv_ops) {
> +        return true;
> +    }
> +
> +    switch (s->cmdqv) {
> +    case ON_OFF_AUTO_OFF:
> +        s->s_accel->cmdqv_ops = NULL;
> +        return true;
> +    case ON_OFF_AUTO_AUTO:
> +        ops = smmuv3_accel_probe_cmdqv(s, idev, NULL);
> +        break;
> +    case ON_OFF_AUTO_ON:
> +        ops = smmuv3_accel_probe_cmdqv(s, idev, errp);
> +        if (!ops) {
> +            error_append_hint(errp, "CMDQV requested but not supported");
> +            return false;
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    if (ops) {
> +        g_assert(ops->alloc_viommu);
I think I would move the assert at the end of 

smmuv3_accel_probe_cmdqv()

> +    }
> +
> +    if (ops && ops->init && !ops->init(s, errp)) {
> +        return false;
> +    }
> +    s->s_accel->cmdqv_ops = ops;
> +    return true;
> +}
> +
>  static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>                                            HostIOMMUDevice *hiod, Error **errp)
>  {
> @@ -669,6 +738,10 @@ static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>          goto done;
>      }
>  
> +    if (!smmuv3_accel_select_cmdqv(s, hiodi, errp)) {
> +        return false;
> +    }
> +
>      if (!smmuv3_accel_alloc_viommu(s, hiodi, errp)) {
>          error_append_hint(errp, "Unable to alloc vIOMMU: hiodi devid 0x%x: ",
>                            hiodi->devid);
> @@ -946,8 +1019,17 @@ bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp)
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
Eric



