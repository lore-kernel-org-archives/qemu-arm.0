Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp842907dye;
        Fri, 27 Jun 2025 04:53:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWc0MXQAlMDtaYrsY8gJ9pAsiAnyalKQa7NEf4V9R6LMY0g4+fQ3tpMwh/zH87hXTs6EdOFhemCB85ZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHOC9q1jJ/gGmTkoFPNu4SyK4vOJ229xsp4UwgKmKD7nA/82IqoCXY1jT+DToEN3FrrCSu3
X-Received: by 2002:a05:6214:5b83:b0:6fa:c3e4:4251 with SMTP id 6a1803df08f44-6ffffd79c3amr56579456d6.15.1751025184885;
        Fri, 27 Jun 2025 04:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751025184; cv=none;
        d=google.com; s=arc-20240605;
        b=BUMrGgUgS26qEuNBHaQJYutD3Pn0Fs17oh8kpXX6hverq24wmGs1TtGulo6aWHqSD8
         jLkfUbR8NGInrRLjICMH8pksNG4T2eFUfzbrLGArnOJ463IB/cweDOa8S2S7dRikJNZu
         RP1Nh15qM1I60y976+ivgZgh8SWi9RY3/iwDdqdRBPeHLNytr3V/uYpkLfi91X1xKS3z
         P5J+px7AtMm0+wa3QOjWHIin3jB6Ps1FGqdurH8T+w+yH8OWsx9HxTFVUDr8MmjvWRPd
         Ztb+pvoiN36lfrp7tvABqjkpUq7kwFz1PhYOByAMV7VwCp0LXPxVY24c/88ZYtm1Fi1y
         Yg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YlWygZYUVVARXUXJIwF1rWLqfCfUV0SACC/eUvzJut0=;
        fh=whQEv1N54SwyrvGk4gCRiFR8M134xDz94M3lWmrmKB4=;
        b=bJ6FYO7uotjpYN/LVVzYjbVtS19t2ttAmEYdCD8nhePodursmYL/rr6CnalFab3zK1
         XYLMDGut8JcMKcNF1dOrextEbtYGQ2qsgOgBW3Fp7mowA5WokRIfUmhy695l2TW5FwNY
         gWwGjgBAON2tsgZMA3IX2qoeVsOuByJDJdgy3kfrEnQk+/VvVbrCLCioCIKRpIvFbGwL
         kl3BhuqJ/crslToRn2eYkSO8Z9B52YhoC1R+sDBYxQ4AT8fzchRG7clptcrJxtd2c9kU
         JpUWs4mqVBELRsSFCboT0wWW8fpLkBKBovrWTlqmG1eTM8No+tU1GMZ+GI5D9GQfwy/9
         NUkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TxmrwFEh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77288cf0si41411426d6.3.2025.06.27.04.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jun 2025 04:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TxmrwFEh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uV7d3-0003a5-EF; Fri, 27 Jun 2025 07:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uV7cv-0003YA-Dm
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 07:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uV7cs-0007J2-SE
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 07:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751025132;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlWygZYUVVARXUXJIwF1rWLqfCfUV0SACC/eUvzJut0=;
 b=TxmrwFEhUOgYQznIuJ0+YWTCkqybqs03XYTJxU9n9OQ+8MBixoVhqjGBDx2f8pe2yuqgo/
 /zn0cUbPHJENDRU9A/4Xd3OnxCxVdHSW6YBKvH5jsiJx7jVcKg9qBP+4eP5evL+fceSU2Q
 wBpl9h8PUl/DQWnoiCgSu3Fy/DIY2XQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-CfZLBIaLO9eKriaPdPITrQ-1; Fri, 27 Jun 2025 07:52:11 -0400
X-MC-Unique: CfZLBIaLO9eKriaPdPITrQ-1
X-Mimecast-MFC-AGG-ID: CfZLBIaLO9eKriaPdPITrQ_1751025129
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45311704d1fso13300285e9.1
 for <qemu-arm@nongnu.org>; Fri, 27 Jun 2025 04:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751025129; x=1751629929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YlWygZYUVVARXUXJIwF1rWLqfCfUV0SACC/eUvzJut0=;
 b=DhCxmPzd5wU9xhrmawhF2MKh3hks2qssawY+EBNYWMCHrRF2MFsH1RfP3rKoD3j4K5
 MTrEiGhpkqaGoxJPiS2DUksUOsES16v9OEgAaNQLu9qRTMX/OI/sbR3ZB8/2U27DiT+h
 oIJqGTmkgaTe9dNhs0ZeRNyUMcUQ+atYt3DwEgEH91Xrm2ayv2I9xbPz7vanHuU4ZUrW
 Al/9jkOvvl78FojwtxxhbgTSNBYPaaW8iesV1ZHpr+6RilobLCapZUkmNeYg836g28WC
 0wZZwSeCUWjETR5MDKMMGcP514pZA3fx+amPJhxVABN2HNgOJxtbcHWVg/pZe3EvN+c9
 46iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVWM8vaPta5/c9OBubigBEaNz5zj9JPQPPIqAInQbjmrBxBMRLB3+sredwJfkySXMBj2DdDF5UHg==@nongnu.org
X-Gm-Message-State: AOJu0Yz3swSt1GT8xmZLeJ0j2tN/ubfrAib9LQAKxEIR1lrC3LZz3CHi
 4/RvExH4i44QENVGTWEnpEGRZkVH8oO7xwM+J4yA07v9cBNSLAwqmQoF4/LBGWfSn5+5kwAr/08
 G9tTrJ2OZRpLVoj1BYlqxlxzNh9QyVjvX51dkHXIp83KhnOOyItnu+g==
X-Gm-Gg: ASbGncsHoe1yov60TVOaQFMtjTRzBmhAcdGD433baT5yKubxzIaUzqzIbHUADt4xNce
 0uJwqysYRUgM9AuzxEntc5cDT06TXC9z7wAat1m3gxU41bi0KjpxedCM07qdGC1MsQgyaogDL+C
 WWyNVhHIP1pL/CDKcnLJC8xMwag6/355PWPKZj4gjcuGdhlKc48nE/uUSK3lU1ca2HSV4KcCDy0
 3KEWXvc/pLHOUoRMQO0Rr9lvdo6z8wMwY84EKURqMNeI2W93lJkFkt9lN7pCMjsRwJLwZBa8Xjo
 hAPAvovRrg/oIAIwi4JPg6o08wAbDPBkm3laJNCkzLXvt9H6QSFy4X0x81+ABM0ItmtICA==
X-Received: by 2002:a05:600c:5307:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-4538fadee1fmr24724535e9.7.1751025128691; 
 Fri, 27 Jun 2025 04:52:08 -0700 (PDT)
X-Received: by 2002:a05:600c:5307:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-4538fadee1fmr24724145e9.7.1751025128162; 
 Fri, 27 Jun 2025 04:52:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c4acsm76947895e9.1.2025.06.27.04.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 04:52:07 -0700 (PDT)
Message-ID: <ce1d4b22-d613-4143-9b50-bd3e8047bff8@redhat.com>
Date: Fri, 27 Jun 2025 13:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 gustavo.romero@linaro.org, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-2-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623094230.76084-2-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -BUhYNz-hkI_x1kD0OPBUsYwtktHhbcL_TsR7iEo5yM_1751025129
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vxpAoEXuad/v

Hi Shameer,

On 6/23/25 11:42 AM, Shameer Kolothum wrote:
> We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
> root complexes to be associated with SMMU.
>
> Although this change does not affect functionality at present, it is
> required when we add support for user-creatable SMMUv3 devices in
> future patches.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmu-common.c                | 29 ++++++++++++++++++++++++++---
>  hw/pci-bridge/pci_expander_bridge.c |  1 -
>  include/hw/pci/pci_bridge.h         |  1 +
>  3 files changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index f39b99e526..b15e7fd0e4 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -20,6 +20,7 @@
>  #include "trace.h"
>  #include "exec/target_page.h"
>  #include "hw/core/cpu.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/jhash.h"
> @@ -925,6 +926,7 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>  {
>      SMMUState *s = ARM_SMMU(dev);
>      SMMUBaseClass *sbc = ARM_SMMU_GET_CLASS(dev);
> +    PCIBus *pci_bus = s->primary_bus;
>      Error *local_err = NULL;
>  
>      sbc->parent_realize(dev, &local_err);
> @@ -937,11 +939,32 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>                                       g_free, g_free);
>      s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
>  
> -    if (s->primary_bus) {
> -        pci_setup_iommu(s->primary_bus, &smmu_ops, s);
> -    } else {
> +    if (!pci_bus) {
>          error_setg(errp, "SMMU is not attached to any PCI bus!");
> +        return;
> +    }
> +
> +    /*
> +     * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
> +     * root complexes to be associated with SMMU.
> +     */
> +    if (pci_bus_is_express(pci_bus) && pci_bus_is_root(pci_bus) &&
> +        object_dynamic_cast(OBJECT(pci_bus)->parent, TYPE_PCI_HOST_BRIDGE)) {
> +        /*
> +         * For pxb-pcie, parent_dev will be set. Make sure it is
> +         * pxb-pcie indeed.
> +         */
> +        if (pci_bus->parent_dev) {
> +            if (!object_dynamic_cast(OBJECT(pci_bus), TYPE_PXB_PCIE_BUS)) {
> +                goto out_err;
> +            }
I still wonder whether the above check was mandated as it works for what
it is meant:

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> +        }
> +        pci_setup_iommu(pci_bus, &smmu_ops, s);
> +        return;
>      }
> +out_err:
> +    error_setg(errp, "SMMU should be attached to a default PCIe root complex"
> +               "(pcie.0) or a pxb-pcie based root complex");
>  }
>  
>  /*
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index 3a29dfefc2..1bcceddbc4 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -34,7 +34,6 @@ typedef struct PXBBus PXBBus;
>  DECLARE_INSTANCE_CHECKER(PXBBus, PXB_BUS,
>                           TYPE_PXB_BUS)
>  
> -#define TYPE_PXB_PCIE_BUS "pxb-pcie-bus"
>  DECLARE_INSTANCE_CHECKER(PXBBus, PXB_PCIE_BUS,
>                           TYPE_PXB_PCIE_BUS)
>  
> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index b0f5204d80..de0eba55b7 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -104,6 +104,7 @@ typedef struct PXBPCIEDev {
>      PXBDev parent_obj;
>  } PXBPCIEDev;
>  
> +#define TYPE_PXB_PCIE_BUS "pxb-pcie-bus"
>  #define TYPE_PXB_CXL_BUS "pxb-cxl-bus"
>  #define TYPE_PXB_DEV "pxb"
>  OBJECT_DECLARE_SIMPLE_TYPE(PXBDev, PXB_DEV)

