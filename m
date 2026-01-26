Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D7ED13C13
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 13:49:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkMxt-0005gG-L3; Mon, 26 Jan 2026 08:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkMxn-0005Zk-QB
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 08:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkMxl-0002Fw-NQ
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 08:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769435341;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jT/1ag8r0s0FyyrEs8TQeJKhCBLySdz3qMIl4CuKhLE=;
 b=UPhWluulrmajNu00BWiDWs+jlC14sEIJb/btZAKktHRvOvoG+lX8rlT6ahVDKx1JP8oIiJ
 rhI3mqdH/fS39gAM5COdXSlAgIPlTEUBL83n40qtup0Bzjh803MrAas+O5sb2iyY99Hk7G
 o1T7T6B6jFXXDe+rBO01mkwO/lpYqHA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-OlZRopEvMaOTUUt7kT9tcw-1; Mon, 26 Jan 2026 08:48:59 -0500
X-MC-Unique: OlZRopEvMaOTUUt7kT9tcw-1
X-Mimecast-MFC-AGG-ID: OlZRopEvMaOTUUt7kT9tcw_1769435338
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47ee8808ffbso34090895e9.2
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 05:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769435338; x=1770040138;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jT/1ag8r0s0FyyrEs8TQeJKhCBLySdz3qMIl4CuKhLE=;
 b=ND6HkH/oqmjLaHdrPd91bjEvOGBLO6+TYzm5uYD04J3CyMVFnUVrVmtZ1S9GOEZVid
 u9OhxRMDrpScwRlzIRnBzVcn/TJ6YGbB6Lv6r/ZTTMV9Rvx4+6IrGrFIhOOcp17FIOFt
 z82Ck7l3kGM4fCpa+5U0j/gegDbTwpfYds8j2DHffGPMP5Ap3kXO2zzsbZfOSgCXx9fu
 3L0Ut9edG6hTyQP6DtNuCbnk9VI71Bhx1VCfD1pGH4wU93ebOhWYvDRi+qDKWa39iUT2
 NYMF9VWTPlDlbJBheOynCrDdRiZGAJrh3NaaUgvJ+gX7S4Y1rkq2lvX1gLbfXYAeao/i
 Z6OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZbRaubGeCEQpjlpeNpDDBy/XDYWAdGRcfdC3Dv3uMgO5ROBP5Yn0LZNVdIodiUTueELKzLwR81A==@nongnu.org
X-Gm-Message-State: AOJu0Yz1/btAIkAHr5ZtARekAeLPtL0sQopbZPkMMNtQddZN+3w33oUd
 2j+V650Qx2ZpNSzCoWjVSkDq+aB2ECEBbfvgSerdHAQtTreaU63gEA/rQyfLBim0g3fdajTzuIC
 vXTmM0FU420c25oTUtMXsDIe4+uiyeXC0yAwYYGR7mmmI5BMpWumv8w==
X-Gm-Gg: AZuq6aIaIw3vicA5fUHCrIZOAyIFDoe1l5TUHjPiT3JhjHhi5Z54gwlvi9jTCMuf16X
 XdvFseMthBMXu86L2pY3eDUpENyiuVTFv2s2LShIomnJl+WL4z8NVdagnzmC98bM+wSVoOvYhRU
 6TpZONAs40zCqNCj3FTBLJp5gxN0xwUYsFkTFeDd+XjEati7VX6R21xM8wTrEQk9gMqcl1dOVU0
 0FHUtFcQVvrDrE6LZEOBYrbeDd2sfDkcgLAAu7+KBfREtAKOOtxFDfzKeg/wNMS1ruSvlFV5dlm
 xYCzg1XcOBF8pfzc4xWzipQZ4HVkxAwmt9h/wvuO7pfJH6K+rxDjDPe+O2fS0yjJ2XMa1kyIhb+
 s1aEznP3wrDQhSr/dH4nGxQ6VqgxNblRGXjMDWvPjjMfEeEWZiI0dKV0kCw==
X-Received: by 2002:a05:600c:83cf:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-4805eebe79amr58506745e9.3.1769435338280; 
 Mon, 26 Jan 2026 05:48:58 -0800 (PST)
X-Received: by 2002:a05:600c:83cf:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-4805eebe79amr58506285e9.3.1769435337779; 
 Mon, 26 Jan 2026 05:48:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d627871sm104096215e9.6.2026.01.26.05.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 05:48:57 -0800 (PST)
Message-ID: <58f0ca59-b08c-44cd-b469-f152271c14f6@redhat.com>
Date: Mon, 26 Jan 2026 14:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/16] hw/arm/tegra241-cmdqv: Map VINTF Page0 into
 guest
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
 <20251210133737.78257-7-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251210133737.78257-7-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hepJfRCVmzmgiMsUijhvivm7ofJaxWh7PuYGsGvoLIY_1769435338
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

On 12/10/25 2:37 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Tegra241 CMDQV assigns each VINTF a 128KB MMIO region split into two
> 64 KB pages:
>  - Page0: guest accessible control/status registers for all VCMDQs
>  - Page1: configuration registers (queue GPA/size) that must be trapped
>           by the VMM and translated before programming the HW queue.
>
> This patch implements the Page0 handling in QEMU. Using the vintf offset
> returned by IOMMUFD during VIOMMU allocation, QEMU maps Page0 into
> guest physical address space and exposes it via two guest MMIO windows:
>  - 0x10000 :VCMDQ register
>  - 0x30000 :VINTF register
>
> The mapping is lazily initialized on first read/write.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 60 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/tegra241-cmdqv.h |  5 ++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 899325877e..d8858322dc 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -13,14 +13,74 @@
>  #include "smmuv3-accel.h"
>  #include "tegra241-cmdqv.h"
>  
> +static bool tegra241_cmdqv_init_vcmdq_page0(Tegra241CMDQV *cmdqv, Error **errp)
> +{
> +    SMMUv3State *smmu = cmdqv->smmu;
> +    SMMUv3AccelState *s_accel = smmu->s_accel;
> +    IOMMUFDViommu *viommu;
> +    char *name;
> +
> +    if (!s_accel) {
> +        return true;
> +    }
> +
> +    viommu = &s_accel->viommu;
> +    if (!iommufd_backend_viommu_mmap(viommu->iommufd, viommu->viommu_id,
> +                                     VCMDQ_REG_PAGE_SIZE,
> +                                     cmdqv->cmdqv_data.out_vintf_mmap_offset,
> +                                     &cmdqv->vcmdq_page0, errp)) {
> +        cmdqv->vcmdq_page0 = NULL;
> +        return false;
> +    }
> +
> +    name = g_strdup_printf("%s vcmdq", memory_region_name(&cmdqv->mmio_cmdqv));
> +    memory_region_init_ram_device_ptr(&cmdqv->mmio_vcmdq_page,
> +                                      memory_region_owner(&cmdqv->mmio_cmdqv),
> +                                      name, 0x10000, cmdqv->vcmdq_page0);
> +    memory_region_add_subregion_overlap(&cmdqv->mmio_cmdqv, 0x10000,
> +                                        &cmdqv->mmio_vcmdq_page, 1);
> +    g_free(name);
> +
> +    name = g_strdup_printf("%s vintf", memory_region_name(&cmdqv->mmio_cmdqv));
> +    memory_region_init_ram_device_ptr(&cmdqv->mmio_vintf_page,
> +                                      memory_region_owner(&cmdqv->mmio_cmdqv),
> +                                      name, 0x10000, cmdqv->vcmdq_page0);
I don't get why we need/have 2 RAM devices pointing to the same @ptr
= cmdqv->vcmdq_page0. Is 0x10000 ~ VCMDQ_REG_PAGE_SIZE?

The names of the MRs are quite confusing: If my understanding is correct
we have;

cmdqv->mmio_cmdqv (0x50000 sized) which as the container for the 2 subregions.
Then within that one we have 2 subregions, one at offset 0x10000 (mmio_vcmdq_page
), one at offset 0x30000 (cmdqv->mmio_vintf_page).

I have difficulties to link that with the commit message

"Tegra241 CMDQV assigns each VINTF a 128KB MMIO region split into two
64 KB pages:
 - Page0: guest accessible control/status registers for all VCMDQs
 - Page1:configuration registers  ../.."
Those 2 pages, are they part of  mmio_vcmdq_page?

Then you talk about 0x30000 :VINTF register I guess this is the second cmdqv->mmio_vintf_page

Well I am confused at this stage of the reading.

Also without any spec, this is difficult to understand. Is there any public doc?



> +    memory_region_add_subregion_overlap(&cmdqv->mmio_cmdqv, 0x30000,
> +                                        &cmdqv->mmio_vintf_page, 1);
> +    g_free(name);
> +
> +    return true;
> +}
> +
>  static uint64_t tegra241_cmdqv_read(void *opaque, hwaddr offset, unsigned size)
>  {
> +    Tegra241CMDQV *cmdqv = (Tegra241CMDQV *)opaque;
> +    Error *local_err = NULL;
> +
> +    if (!cmdqv->vcmdq_page0) {
> +        tegra241_cmdqv_init_vcmdq_page0(cmdqv, &local_err);
> +        if (local_err) {
> +            error_report_err(local_err);
> +            local_err = NULL;
> +        }
> +    }
> +
>      return 0;
>  }
>  
>  static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>                                   unsigned size)
>  {
> +    Tegra241CMDQV *cmdqv = (Tegra241CMDQV *)opaque;
> +    Error *local_err = NULL;
> +
> +    if (!cmdqv->vcmdq_page0) {
> +        tegra241_cmdqv_init_vcmdq_page0(cmdqv, &local_err);
> +        if (local_err) {
> +            error_report_err(local_err);
> +            local_err = NULL;
> +        }
> +    }
>  }
>  
>  static const MemoryRegionOps mmio_cmdqv_ops = {
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 9bc72b24d9..ccdf0651be 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -19,8 +19,13 @@ typedef struct Tegra241CMDQV {
>      SMMUv3State *smmu;
>      MemoryRegion mmio_cmdqv;
>      qemu_irq irq;
> +    MemoryRegion mmio_vcmdq_page;
please also use _mr suffix as in the rest of the code
> +    MemoryRegion mmio_vintf_page;
> +    void *vcmdq_page0;
>  } Tegra241CMDQV;
>  
> +#define VCMDQ_REG_PAGE_SIZE 0x10000
> +
>  #ifdef CONFIG_TEGRA241_CMDQV
>  bool tegra241_cmdqv_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                                   uint32_t *out_viommu_id, Error **errp);
Thanks

Eric


