Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A87FF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:33:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvId-0006hg-7E; Mon, 04 May 2026 11:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJvIO-0006eL-Aa
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJvIM-0002r5-3i
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777908797;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XLAd5nTIsX705bo8LdHWp6/7O8o3feme8ncu8h+9m4=;
 b=aVwr0Z1s8jLvedUJMElMXrc7arZohAYBPo4XSjhi4E5VC+RTUNPWHxrekDAQ5VOgsjHBMD
 V8nt7VIcFYeKO5Q2J21xkh1voeeVmq7M+d+EKQn3EACjs9nrCOGbk94x5jRLjPZVFLCZxa
 nw+923t8FB3NpIZ3hhJTAsDjgSeH1z8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-kAHGdC0EO9KSKLcnQYxFEA-1; Mon, 04 May 2026 11:33:15 -0400
X-MC-Unique: kAHGdC0EO9KSKLcnQYxFEA-1
X-Mimecast-MFC-AGG-ID: kAHGdC0EO9KSKLcnQYxFEA_1777908794
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48d05e7b117so10857865e9.0
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777908794; x=1778513594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XLAd5nTIsX705bo8LdHWp6/7O8o3feme8ncu8h+9m4=;
 b=N0P7ikeEpIz+LzeFXXGgrKxt0GfZu2TvUysw8LVpJ8FApSb/IMx4Lm81RumBXK+T5g
 amLNsb3+bEXwgpy3Kuzu98AG2STOGCBLJ4l6UtC1an3ketw+Op64tSCZy+bWB0Yiday8
 w60QE/G00lyC4/SNj5hqiVsQmrQy9FiUCLxDyrV4npyr0sjeHOWsUleKOjhVjU8J8G4V
 eDPTZTbkyWsO3IxaKJUvsl6n585yyV+Kss3S4TlZoVZR09dS9KJeZEZdvAHZkLuqa6zs
 vbjqYVRY002prByN8Cm9Rr5DsTPAxD2jvLimLaFk3DaR0jVbn/uxnT7J+CR5KgBpA89I
 +MCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ885Ea0mqzMRju2YjvH15kpdx7keC8ZrZeqsPQP97uGSP2N17EwG/qSIaOkRGqxMqBqNUtLsdkUVw==@nongnu.org
X-Gm-Message-State: AOJu0Yw7LYUi+NLQloTePxqPBCVlOqx0dR3UDurrNRnE6GMrkIwCNTj+
 9curwv/lkPZwLSnU8yQJmJ+73CVm1SeiHTY8xMhHLl5LgDvVivGGHkWz1+pn8YoHrCsxq0dKkVT
 dMd19cZdzGKA2VGtA6/As/8VunN07T+TPvbzvib0/Re0gHrhNs0CvnA==
X-Gm-Gg: AeBDieusrEtOHjsC0x/S5X6VmZDgTkTWKx/j1XnkfUOQaULyBEM8/kF5jGPJtp16bjC
 Py4dJkDEjFaFDu2vx5oceB7ewU+uvMsvKY4YztCJPpidjSin5ZrC9QNKzAO4cOPxLnUJeE6GrJO
 GPas4Y0P/J08nzLTjNQDlRhC+FCHAAChpcW+1QabgfIaBZc8t6AHzeH0mOqpMXorL5083hymqpA
 /gPwbK79tAuG+BVsBXnSjznLDCbCjgk0BCu+NvIJEVrPFOzqt6iu/wqw1BgS1XR3Ey0MbbrCtV/
 W2YzLvibJu74zc7QP+TeDA4tSXDl8DE50rO2RzP5wJJFY7dr8vxQ83C1V21WPjIbKUd3aUvXtCS
 UMg4Kl4Cn+hbIm4lhCGnNktrr+KgMIZymnbkPVoSNK2kX1S/XmrhJW16TSIc7fQHKfXa4F6oOeI
 x9mJ0L
X-Received: by 2002:a05:600c:a117:b0:48a:58e1:6d02 with SMTP id
 5b1f17b1804b1-48a9866837bmr127274385e9.19.1777908794304; 
 Mon, 04 May 2026 08:33:14 -0700 (PDT)
X-Received: by 2002:a05:600c:a117:b0:48a:58e1:6d02 with SMTP id
 5b1f17b1804b1-48a9866837bmr127273875e9.19.1777908793846; 
 Mon, 04 May 2026 08:33:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed6bafsm593723325e9.2.2026.05.04.08.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:33:13 -0700 (PDT)
Message-ID: <47b7ba85-b080-4074-8550-3c1f06c18648@redhat.com>
Date: Mon, 4 May 2026 17:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/31] hw/arm/smmuv3-accel: Wire CMDQV ops into accel
 lifecycle
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-9-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-9-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ExrU2TJRiJ1op2iRXqIhJgD65PYRIjNWJ_K_L3R15Fg_1777908794
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
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



On 4/15/26 12:55 PM, Shameer Kolothum wrote:
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
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  include/hw/arm/smmuv3.h |  2 +
>  hw/arm/smmuv3-accel.c   | 93 +++++++++++++++++++++++++++++++++++++----
>  2 files changed, 88 insertions(+), 7 deletions(-)
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
> index f65e654adf..9068e65e2b 100644
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
> @@ -566,6 +567,7 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                            Error **errp)
>  {
>      SMMUv3AccelState *accel = s->s_accel;
> +    const SMMUv3AccelCmdqvOps *cmdqv_ops = accel->cmdqv_ops;
>      struct iommu_hwpt_arm_smmuv3 bypass_data = {
>          .ste = { SMMU_STE_CFG_BYPASS | SMMU_STE_VALID, 0x0ULL },
>      };
> @@ -576,10 +578,17 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>      uint32_t viommu_id, hwpt_id;
>      IOMMUFDViommu *viommu;
>  
> -    if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> -                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3, s2_hwpt_id,
> -                                      NULL, 0, &viommu_id, errp)) {
> -        return false;
> +    if (cmdqv_ops) {
> +        if (!cmdqv_ops->alloc_viommu(s, idev, &viommu_id, errp)) {
> +            return false;
> +        }
> +    } else {
> +        if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> +                                          IOMMU_VIOMMU_TYPE_ARM_SMMUV3,
> +                                          s2_hwpt_id, NULL, 0, &viommu_id,
> +                                          errp)) {
> +            return false;
> +        }
>      }
>  
>      viommu = g_new0(IOMMUFDViommu, 1);
> @@ -625,12 +634,69 @@ free_bypass_hwpt:
>  free_abort_hwpt:
>      iommufd_backend_free_id(idev->iommufd, accel->abort_hwpt_id);
>  free_viommu:
> -    iommufd_backend_free_id(idev->iommufd, viommu->viommu_id);
> +    if (cmdqv_ops && cmdqv_ops->free_viommu) {
> +        cmdqv_ops->free_viommu(s);
hum actually we do free the iommu id below in case the free_viommu is
not implemented. So forget my previously comment. Besides this means
free_viommu shall be documented as not mandatory.
> +    } else {
> +        iommufd_backend_free_id(idev->iommufd, viommu->viommu_id);
> +    }
>      g_free(viommu);
>      accel->viommu = NULL;
>      return false;
>  }
>  
> +static const SMMUv3AccelCmdqvOps *
> +smmuv3_accel_probe_cmdqv(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
> +                          Error **errp)
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
> +        s->s_accel->cmdqv_ops = ops;
Shouldn't you remove the above setting as you do it again below in case
init succeeds?
> +        break;
> +    default:
> +        g_assert_not_reached();
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
> @@ -665,6 +731,10 @@ static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>          goto done;
>      }
>  
> +    if (!smmuv3_accel_select_cmdqv(s, idev, errp)) {
> +        return false;
> +    }
> +
>      if (!smmuv3_accel_alloc_viommu(s, idev, errp)) {
>          error_append_hint(errp, "Unable to alloc vIOMMU: idev devid 0x%x: ",
>                            idev->devid);
> @@ -936,8 +1006,17 @@ bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp)
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
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric


