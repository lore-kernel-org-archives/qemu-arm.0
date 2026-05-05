Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539BEFF885A
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 13:26:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKFmX-0001Cb-3m; Tue, 05 May 2026 09:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKFmS-0001BA-OH
 for qemu-arm@nongnu.org; Tue, 05 May 2026 09:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKFmP-00076M-Rz
 for qemu-arm@nongnu.org; Tue, 05 May 2026 09:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777987541;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFpAA8iQqRwaX7FCA1Grx4wjbS35oBqySah0N3MO3XY=;
 b=IWIHks5Cq8FDflkHnQ6y1haTDeEtnSGvE2jIHxfT4ZXchXg9VV1K91Hia49kw5PzcRku74
 Ii8KkSeODEi/l/4s+Fp46qL+svae90KWJ+6uxLGbMd+qYCs/CHYsVJvT81nEnhNDNKGDtl
 r8JT4FgZrNbh+B7/N6rNkLzO/myxeLo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-kLqBB9aUOnyqUckdDz0lCA-1; Tue, 05 May 2026 09:25:37 -0400
X-MC-Unique: kLqBB9aUOnyqUckdDz0lCA-1
X-Mimecast-MFC-AGG-ID: kLqBB9aUOnyqUckdDz0lCA_1777987537
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48d127eb013so8329275e9.1
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 06:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777987537; x=1778592337;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFpAA8iQqRwaX7FCA1Grx4wjbS35oBqySah0N3MO3XY=;
 b=KzBfg1JY7jGdcZBfFNvyCRIaQug+g5G2cDHFTFwWoEcGYek5Lye7sNjiFIroqMKPvh
 6XJwNXqtAjbZsr6mx2L7+V0eOneCuRsXAR0yv1z6MBMetzKLB7gimn/ZTUlx8OD4i8kV
 jHx5me0vrxIRPBvRgHe0MdFkgKIuktKmUaoDfGOfeKxuowK7lAfLA92DH9sq398DFrRz
 M2TxP8pZVCMB2LsXqY+rFJ0mvaO4gsxhoi8hTbFWTLt3UNoN5DES0ovgjON6aFHjSUFq
 1CR0UIAdOWNLcuNb6QhiK/yX2xhYw853bPd8ToBv6UEKiybvreS/jCMFHXJwZ4lZhQ19
 ImOw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/93luoJymsaoeyjZQiywhd522/kpmJeiFuRd7J2OYZH/mDpBPkQ83Lv7eC8dHqsfdQRnVaY2gxJQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw8omMRJG/ZO1KcVq+SxdG+jY42BWMW269E0oaIgq8g+xTX0iw7
 7sBr0wyVEjrJND0B/P+/YdkwyCq5CMWRZX/6xdTt2QPLLkWwQPn9xc/sSR1MCqN7zVd07lkJRLY
 ufi9MdqHN8EL+RlMdU2YNiXUu1gX8Z77dxUxTXcgraYl2yXhSemXWOQ==
X-Gm-Gg: AeBDievgU/FAne3QCjEydGX9rf99t+GlGsmJGmshDWPv9Z52OdPFEkX4fXI/BI47IYk
 XUxD1pZ/BHE1Vw0zepUPVxt4VRrUbKUFmp6Pu+8mvyChKCrRfMJdqC+B6Yr5+I5FyrATZ33cbzt
 +KMxE6zow9l2n/B5uva4tTczr6oQ+0ZqRjFiaNiAp9u2yzx+AGLGS2V4IXBCOGEYbzm3PU7MRca
 2L3mfy1mGM/N2Y39bhPVoMk9eUGJp3jCSazDovh+UTRyNWEUyP2T1YwJiL3JoZBpYTATVCzkcSK
 D6BM3khrIeAG4PEJpFnULn8CiTGkDL2mokGgm6pK9FYkrV+TgaSScsKFJAc2R9+Pbuw1rCWfCiv
 QbH6H4KWRnOGfoiDgQDTrI+slBgpbR7I5yF5/CSpEjin8+w8uoCnEGCqaPNThjRNshn1BDmSLf1
 GsbQVs
X-Received: by 2002:a05:600c:528e:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-48a988b8396mr255899255e9.24.1777987536623; 
 Tue, 05 May 2026 06:25:36 -0700 (PDT)
X-Received: by 2002:a05:600c:528e:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-48a988b8396mr255898705e9.24.1777987536035; 
 Tue, 05 May 2026 06:25:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48d14c1ef96sm19347905e9.11.2026.05.05.06.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 06:25:35 -0700 (PDT)
Message-ID: <103d06a5-3203-4545-b617-517f695eb751@redhat.com>
Date: Tue, 5 May 2026 15:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/31] hw/arm/tegra241-cmdqv: Allocate HW VCMDQs on
 base register programming
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-20-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-20-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SqZl5V0uVYNZ-jZpt5acuculXIEK-1sqKDPnDW2nUpM_1777987537
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
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

Hi,

On 4/15/26 12:55 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add support for allocating IOMMUFD hardware queues when the guest
> programs the VCMDQ BASE registers.
>
> VCMDQ_EN is part of the VCMDQ_CONFIG register, which is accessed
> through the VINTF Page0 region. A subsequent patch maps this region
> directly into the guest address space, so QEMU does not trap writes
> to VCMDQ_CONFIG.
>
> Since VCMDQ_EN writes are not trapped, QEMU cannot allocate the
> hardware queue based on that bit. Instead, allocate the IOMMUFD
> hardware queue when the guest writes a VCMDQ BASE register with a
> valid RAM-backed address and when CMDQV and VINTF are enabled.
> If a hardware queue was previously allocated for the same VCMDQ,
> free it before reallocation.
the asymetric alloc/free sounds unusual. Are there other alternatives?
>
> Writes with invalid addresses are ignored.
>
> All allocated VCMDQs are freed when CMDQV or VINTF is disabled.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h | 11 +++++++
>  hw/arm/tegra241-cmdqv.c | 70 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 78 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 88572ad939..039d86374f 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -44,6 +44,7 @@ typedef struct Tegra241CMDQV {
>      MemoryRegion mmio_cmdqv;
>      qemu_irq irq;
>      IOMMUFDVeventq *veventq;
> +    IOMMUFDHWqueue *vcmdq[TEGRA241_CMDQV_MAX_CMDQ];
>      void *vintf_page0;
>  
>      /* Register Cache */
> @@ -348,6 +349,16 @@ A_VI_VCMDQi_CONS_INDX_BASE_DRAM_L(1)
>  A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(0)
>  A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(1)
>  
> +static inline bool tegra241_cmdq_enabled(Tegra241CMDQV *cmdqv)
> +{
> +    return cmdqv->status & R_STATUS_CMDQV_ENABLED_MASK;
> +}
> +
> +static inline bool tegra241_vintf_enabled(Tegra241CMDQV *cmdqv)
> +{
> +    return cmdqv->vintf_status & R_VINTF0_STATUS_ENABLE_OK_MASK;
> +}
> +
>  const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void);
>  
>  #endif /* HW_ARM_TEGRA241_CMDQV_H */
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index cdd941cec9..b5f2f74cf2 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -15,6 +15,66 @@
>  #include "tegra241-cmdqv.h"
>  #include "trace.h"
>  
> +static void tegra241_cmdqv_free_vcmdq(Tegra241CMDQV *cmdqv, int index)
> +{
> +    IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
> +    IOMMUFDHWqueue *vcmdq = cmdqv->vcmdq[index];
> +
> +    if (!vcmdq) {
> +        return;
> +    }
> +    iommufd_backend_free_id(viommu->iommufd, vcmdq->hw_queue_id);
> +    g_free(vcmdq);
> +    cmdqv->vcmdq[index] = NULL;
> +}
> +
> +static void tegra241_cmdqv_free_all_vcmdq(Tegra241CMDQV *cmdqv)
> +{
> +    /* Free in reverse order to avoid "resource busy" error */
can you provide additional details about the above problematic. Is it
documented in the spec?
> +    for (int i = (TEGRA241_CMDQV_MAX_CMDQ - 1); i >= 0; i--) {
> +        tegra241_cmdqv_free_vcmdq(cmdqv, i);
> +    }
> +}
> +
> +static bool tegra241_cmdqv_setup_vcmdq(Tegra241CMDQV *cmdqv, int index,
> +                                       Error **errp)
> +{
> +    SMMUv3AccelState *accel = cmdqv->s_accel;
> +    uint64_t base_mask = (uint64_t)R_VCMDQ0_BASE_L_ADDR_MASK |
> +                         (uint64_t)R_VCMDQ0_BASE_H_ADDR_MASK << 32;
> +    uint64_t addr = cmdqv->vcmdq_base[index] & base_mask;
> +    uint64_t log2 = cmdqv->vcmdq_base[index] & R_VCMDQ0_BASE_L_LOG2SIZE_MASK;
> +    uint64_t size = 1ULL << (log2 + 4);
> +    IOMMUFDViommu *viommu = accel->viommu;
> +    IOMMUFDHWqueue *hw_queue;
> +    uint32_t hw_queue_id;
> +
> +    /* Ignore any invalid address. This may come as part of reset etc. */
> +    if (!address_space_is_ram(&address_space_memory, addr) ||
> +        !address_space_is_ram(&address_space_memory, addr + size - 1)) {
this check looks a little bit risky, no? Don't we have a better way to
test the address has been properly set?
> +        return true;
> +    }
> +
> +    if (!tegra241_cmdq_enabled(cmdqv) || !tegra241_vintf_enabled(cmdqv)) {
> +        return true;
> +    }
> +
> +    tegra241_cmdqv_free_vcmdq(cmdqv, index);
would deserve a comment also here.
> +
> +    if (!iommufd_backend_alloc_hw_queue(viommu->iommufd, viommu->viommu_id,
> +                                        IOMMU_HW_QUEUE_TYPE_TEGRA241_CMDQV,
> +                                        index, addr, size, &hw_queue_id,
> +                                        errp)) {
> +        return false;
> +    }
> +    hw_queue = g_new(IOMMUFDHWqueue, 1);
> +    hw_queue->hw_queue_id = hw_queue_id;
> +    hw_queue->viommu = viommu;
> +    cmdqv->vcmdq[index] = hw_queue;
> +
> +    return true;
> +}
> +
>  /*
>   * Read a VCMDQ register using VCMDQ0_* offsets.
>   *
> @@ -63,7 +123,7 @@ static uint64_t tegra241_cmdqv_read_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0,
>   */
>  static void tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0,
>                                         int index, uint64_t value,
> -                                       unsigned size)
> +                                       unsigned size, Error **errp)
>  {
>      switch (offset0) {
>      case A_VCMDQ0_CONS_INDX:
> @@ -91,11 +151,13 @@ static void tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0,
>                  (cmdqv->vcmdq_base[index] & 0xffffffff00000000ULL) |
>                  (value & 0xffffffffULL);
>          }
> +        tegra241_cmdqv_setup_vcmdq(cmdqv, index, errp);
>          return;
>      case A_VCMDQ0_BASE_H:
>          cmdqv->vcmdq_base[index] =
>              (cmdqv->vcmdq_base[index] & 0xffffffffULL) |
>              ((uint64_t)value << 32);
> +        tegra241_cmdqv_setup_vcmdq(cmdqv, index, errp);
>          return;
>      case A_VCMDQ0_CONS_INDX_BASE_DRAM_L:
>          if (size == 8) {
> @@ -204,6 +266,7 @@ static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>                  cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
>              }
>          } else {
> +            tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
>          }
> @@ -329,6 +392,7 @@ static void tegra241_cmdqv_write_mmio(void *opaque, hwaddr offset,
>          if (value & R_CONFIG_CMDQV_EN_MASK) {
>              cmdqv->status |= R_STATUS_CMDQV_ENABLED_MASK;
>          } else {
> +            tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              cmdqv->status &= ~R_STATUS_CMDQV_ENABLED_MASK;
>          }
>          break;
> @@ -363,7 +427,7 @@ static void tegra241_cmdqv_write_mmio(void *opaque, hwaddr offset,
>           */
>          index = (offset - CMDQV_VCMDQ_PAGE0_BASE) / CMDQV_VCMDQ_STRIDE;
>          tegra241_cmdqv_write_vcmdq(cmdqv, offset - index * CMDQV_VCMDQ_STRIDE,
> -                                   index, value, size);
> +                                   index, value, size, &local_err);
>          break;
>      case A_VI_VCMDQ0_BASE_L ... A_VI_VCMDQ1_CONS_INDX_BASE_DRAM_H:
>          /* Same VINTF-to-VCMDQ translation as VINTF Page0 case above */
> @@ -373,7 +437,7 @@ static void tegra241_cmdqv_write_mmio(void *opaque, hwaddr offset,
>          /* Same decode logic as VCMDQ Page0 case above */
>          index = (offset - CMDQV_VCMDQ_PAGE1_BASE) / CMDQV_VCMDQ_STRIDE;
>          tegra241_cmdqv_write_vcmdq(cmdqv, offset - index * CMDQV_VCMDQ_STRIDE,
> -                                   index, value, size);
> +                                   index, value, size, &local_err);
>          break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%" PRIx64 "\n",
Eric


