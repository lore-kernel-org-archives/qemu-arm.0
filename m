Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12352D13C11
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 13:58:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkN6q-0004pi-Az; Mon, 26 Jan 2026 08:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkN6o-0004p8-SY
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 08:58:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkN6m-0005Gm-9T
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 08:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769435903;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lP/MhcyBPFKND59IMN7fIUJ8EBi1OyFqDX8dUmTlKY=;
 b=XZLUdchWdLEi8ZZCAnL0XmsJHS+7TfqLfp7aC4cr+CO3Lc0aC28JtVJOi2u42e8pGPrY93
 VlmcDpCgtvvBp2fBhUXCzT9OSihynhc/GW9Y7SZ+psVJcgqKKkkzcanm2hnPzDR4OfMZ7z
 8gyhADvxhBJZM58NHfpR+wLpOaP4woY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-RZRoZu9xNp2fCHt0-PC07w-1; Mon, 26 Jan 2026 08:58:22 -0500
X-MC-Unique: RZRoZu9xNp2fCHt0-PC07w-1
X-Mimecast-MFC-AGG-ID: RZRoZu9xNp2fCHt0-PC07w_1769435901
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-435add03f12so2144607f8f.3
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 05:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769435901; x=1770040701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lP/MhcyBPFKND59IMN7fIUJ8EBi1OyFqDX8dUmTlKY=;
 b=mQIMKpYbSYFGqkZpcxGkXIyOcn6w/9NGGhD9IIm9sORKe0AMLZRaiZgCyCfEqwyAos
 KAFbYEjKap7eFkKDnhCHjL6Lo8YG9cJwM9hgAo/UiwIcx9bi/4fqTZ+qm/Izrq6Ckegw
 785lHs0FKnJp69YEg43LMxDQCjdNvorCWLcmC/095QJbEbCyCM5Ld5Bpbal7RZPxEHYv
 avNfhvNBZfSp4HjS99041NzE2MFKJUWYaiOQtI1dQmSbORLA+NsZyiuYccSC22bPVcdw
 /qvf4TCP8a4ognStQI2Sfb8HW2DgeJcBvUsZStayRwIMqqITdfMrJrJheuHN6BDdkbl6
 qrUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZdh5eYD7IphA9VcOhaBqvhFKCz6MMDpWBbgQOy1or6aGeIGNAEGHI9HVc2n2rsI7SZPdi8DU3/Q==@nongnu.org
X-Gm-Message-State: AOJu0YxmeqHcug6GO5R8h3drrqPxQR+RkC0AenKJLyphNAH1E1+5lDa9
 YcLKKCO+vMMxQukIGMcfOSvIsN0iPCtkv7bgjjR1Vqu3yCAEo6A1wpcRb3PSdoZFtH+pTWjIuG5
 u89qOyk1Udie9HP+c5wt8S67fY9sVA7VHg0flXEmHhleRwV8xIdi68g==
X-Gm-Gg: AZuq6aJKULZnYn4K2afBHLb9kWE9oMf1aMClNaDLmBKV7Zy6/vRMpkOPlKHH1Zc2WRq
 cASa2KwKUsUJein5ma63tlXoq6mHoZl/KPIOVjAmA/1lQ8pS91f4nCqhfpHSMw/k00zmiMZnRfE
 Hoj0y+jW7p3up7NdeSlknETgZT43xRXJfJI1x858OBorF97lSv3yN24ZnBkisSiD8fVSmReJ5/Y
 KRsB2WhvepWaYwRm0dOqst2xFNCt4oWvRQ+65125CyDzowkcSZ0fvC6ewjuA5IgWtENBI+g5Brz
 sO4qLssHQVwynngnpaklShHqf2thecsfKfGMWmBzveAugLbcLLfzH7QxZ3z96NYLurGdHagQ+78
 o+0DN/Kz1eqvmcpib22ym3D3OEOLXiKrTnpQAVZCDb9Gud9BxdQMiLDUOxA==
X-Received: by 2002:a05:6000:22c9:b0:432:5bf9:cf15 with SMTP id
 ffacd0b85a97d-435ca0d1430mr8796120f8f.5.1769435900631; 
 Mon, 26 Jan 2026 05:58:20 -0800 (PST)
X-Received: by 2002:a05:6000:22c9:b0:432:5bf9:cf15 with SMTP id
 ffacd0b85a97d-435ca0d1430mr8796065f8f.5.1769435900118; 
 Mon, 26 Jan 2026 05:58:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c02cf6sm31618155f8f.7.2026.01.26.05.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 05:58:19 -0800 (PST)
Message-ID: <8ebfb47a-4c21-4c8b-ae4d-d9d77aefe867@redhat.com>
Date: Mon, 26 Jan 2026 14:58:16 +0100
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
X-Mimecast-MFC-PROC-ID: umz8MBcIyip2ISUUxLqI_JERfmgIiEnRnTzmLwBr4go_1769435901
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

I would recommend to have a drawing showing the mr container, the
subregions, their offsets, and content/nature of each region

Eric
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
> +    MemoryRegion mmio_vintf_page;
> +    void *vcmdq_page0;
>  } Tegra241CMDQV;
>  
> +#define VCMDQ_REG_PAGE_SIZE 0x10000
> +
>  #ifdef CONFIG_TEGRA241_CMDQV
>  bool tegra241_cmdqv_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                                   uint32_t *out_viommu_id, Error **errp);


