Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85619FD0651
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 14:34:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0KdR-0001S5-Iu; Wed, 11 Mar 2026 10:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0KdQ-0001RR-5j
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 10:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0KdN-0003ZD-3Z
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 10:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773239639;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMoVsjfragvcibm90ZAXE/hbDllDDsfEH4Kia3Kbd2o=;
 b=O9S/wQafT5vAJaAEjwcR1EzSRGf1JpP8ZiApBWWTarq32AbaYQFUCZid3vF0AAZmO7R3Pq
 6fz42YYBknvREyb2vjXY35qsgN0+g25cX2mQKeloSezz/SG0gdyCJ/QhL4y7lFbw1QNzwI
 sJb/ar7xULyxMzXjX+mL1Myoymv0dNQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-_iboeE_IOF2x8ZFOHXKMBA-1; Wed, 11 Mar 2026 10:33:58 -0400
X-MC-Unique: _iboeE_IOF2x8ZFOHXKMBA-1
X-Mimecast-MFC-AGG-ID: _iboeE_IOF2x8ZFOHXKMBA_1773239636
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439c12269f3so5527439f8f.3
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 07:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773239636; x=1773844436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMoVsjfragvcibm90ZAXE/hbDllDDsfEH4Kia3Kbd2o=;
 b=DNYw8Kuk3eWAUzKi4qk87EQhTp7dSM5VnxsD2/NVOTbQIVlpdwK80MCk2D2bXRdPld
 R30kxlHxokoeap2Abz2KID7WLkJC/hnKdU2omTd3X1DAgQq5eOD+5lVapyaN60yz0f4V
 ptSGPN5jnTzEk+U5UapgREGF8CglwLNfvW/mZOQX4s9aby5JW0UgnAI34PMJe4XSIjrc
 L0cDSvoSQHXUANf6eWrpg46OZjL8lOlHhvnKw2HKww4gj/V69QkeGnns22X2QqpLC/0o
 UgwqY8jhMyY0jJuScG38S4aSeHGvXLW0yNHk6JEyG1kWKQGb56Vxpekuy7uHAfpk2LTI
 QYPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7+WVE//J4+Bibyn2OR0zQXw+gTMf/09ey+ZHmV8Gz4Bzr1ETjTo1MovMSgvGooJNhBDiy7y3aLA==@nongnu.org
X-Gm-Message-State: AOJu0YyWjsKWnKH4TL0EDy9fnSSwzH99EX+NTAUNB30olg/cYXYlyKjn
 rV4DRZoRrU4hiuCWaFbVmmhCKHHRMZRrJFHY7y+zpt+JIPKJtK+wDA5Cm8EWKa6Vfi0SN5SgR3d
 vJ0S3+9ulGnyg8SKBog6cl5kXdOIO3mPYLZaspeeIfyYCuN/LFgDP4g==
X-Gm-Gg: ATEYQzz6Oj5vYSQaqcYPAnWkhZBlVXFRhu7o6KyRsgROojXlFTDTKsxsQqZguElakgd
 GTuSgEsVrJV5eos9s6CzOTp18ijPx9nBiysL76jR4YNxuf2PXGFws0EW6AxfawklDZw/C3RuOZp
 8CDa8fa/BZCTv+4k6SQ7z137mqvedriKoqgA7j7l+QAuJmaI0lg2qPPT2BYMm71jXa8i8f0Eboj
 wCKvucu1ncddaqSSyxXp6BY9V+8/Ku0bTcRoqUxIPBpurOS/TBFp9DBK0q7uP+GtcsDHwp2KKW3
 UPTqdIcP9LkrYweFo8yoD9hX25kdge35KY4Iicg3xrBNV7Q41K27mNM1GEfKEYoKPejDf4K8oBX
 WQMTu77lyot/UI6ZKO4VV3L29qW8qM1nSTS/YQNnL1zRFIARcFDuDrrRYsy3N9N5S72xU4Q==
X-Received: by 2002:a05:6000:40c9:b0:439:d923:c20a with SMTP id
 ffacd0b85a97d-439f8223390mr5662503f8f.49.1773239635998; 
 Wed, 11 Mar 2026 07:33:55 -0700 (PDT)
X-Received: by 2002:a05:6000:40c9:b0:439:d923:c20a with SMTP id
 ffacd0b85a97d-439f8223390mr5662418f8f.49.1773239635431; 
 Wed, 11 Mar 2026 07:33:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f215bsm8161273f8f.18.2026.03.11.07.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 07:33:54 -0700 (PDT)
Message-ID: <72dc05a6-3401-469b-8dd1-7dcabf79bb5a@redhat.com>
Date: Wed, 11 Mar 2026 15:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/32] hw/arm/tegra241-cmdqv: Allocate HW VCMDQs on
 base register programming
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-20-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-20-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YedOBe62aF9kf6UR89VAf5YxQ0XjFNg846aLqvAzSd4_1773239636
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 2/26/26 11:50 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add support for allocating IOMMUFD hardware queues when the guest
> programs the VCMDQ BASE registers.
>
> VCMDQ_EN is part of the VCMDQ_CONFIG register, which is accessed
> through the VINTF Page0 region. This region is mapped directly into
> the guest address space (introduced in a subsequent patch), so QEMU
> does not trap writes to VCMDQ_CONFIG.
>
> Since VCMDQ_EN writes are not trapped, QEMU cannot allocate the
> hardware queue based on that bit. Instead, allocate the IOMMUFD
> hardware queue when the guest writes a VCMDQ BASE register with a
> valid RAM-backed address and when CMDQV and VINTF are enabled.
>
> If a hardware queue was previously allocated for the same VCMDQ,
> free it before reallocation.
>
> Writes with invalid addresses are ignored.
>
> All allocated VCMDQs are freed when CMDQV or VINTF is disabled.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h | 11 +++++++
>  hw/arm/tegra241-cmdqv.c | 71 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 79 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 3ce9f539ae..139e14b61b 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -36,6 +36,7 @@ typedef struct Tegra241CMDQV {
>      SMMUv3AccelState *s_accel;
>      MemoryRegion mmio_cmdqv;
>      qemu_irq irq;
> +    IOMMUFDHWqueue *vcmdq[TEGRA241_CMDQV_MAX_CMDQ];
>      void *vintf_page0;
>  
>      /* Register Cache */
> @@ -322,6 +323,16 @@ A_VI_VCMDQi_CONS_INDX_BASE_DRAM_L(1)
>  A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(0)
>  A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(1)
>  
> +static inline bool tegra241_cmdq_enabled(Tegra241CMDQV *cmdq)
> +{
> +    return cmdq->status & R_STATUS_CMDQV_ENABLED_MASK;
> +}
> +
> +static inline bool tegra241_vintf_enabled(Tegra241CMDQV *cmdq)
> +{
> +    return cmdq->vintf_status & R_VINTF0_STATUS_ENABLE_OK_MASK;
> +}
> +
>  const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void);
>  
>  #endif /* HW_ARM_TEGRA241_CMDQV_H */
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index a3767a85a3..002dde50fc 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -151,6 +151,67 @@ static uint64_t tegra241_cmdqv_read(void *opaque, hwaddr offset, unsigned size)
>      }
>  }
>  
> +static void tegra241_cmdqv_free_vcmdq(Tegra241CMDQV *cmdqv, int index)
> +{
> +    SMMUv3AccelState *accel = cmdqv->s_accel;
> +    IOMMUFDViommu *viommu = accel->viommu;
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
> +    /* Free in the reverse order to avoid "resource busy" error */
> +    for (int i = (TEGRA241_CMDQV_MAX_CMDQ - 1); i >= 0; i--) {
Is it future proof to restrict the number of queues to 2? Shouldn't it
be configurable?

Eric
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
> +    /* Ignore any invalid address. This may come as part of reset etc */
> +    if (!address_space_is_ram(&address_space_memory, addr) ||
> +        !address_space_is_ram(&address_space_memory, addr + size - 1)) {
> +        return true;
> +    }
> +
> +    if (!tegra241_cmdq_enabled(cmdqv) || !tegra241_vintf_enabled(cmdqv)) {
> +        return true;
> +    }
> +
> +    tegra241_cmdqv_free_vcmdq(cmdqv, index);
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
>  static bool
>  tegra241_cmdqv_munmap_vintf_page0(Tegra241CMDQV *cmdqv, Error **errp)
>  {
> @@ -192,7 +253,7 @@ static bool tegra241_cmdqv_mmap_vintf_page0(Tegra241CMDQV *cmdqv, Error **errp)
>   */
>  static void
>  tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0, int index,
> -                           uint64_t value, unsigned size)
> +                           uint64_t value, unsigned size, Error **errp)
>  {
>      switch (offset0) {
>      case A_VCMDQ0_CONS_INDX:
> @@ -220,11 +281,13 @@ tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0, int index,
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
> @@ -263,6 +326,7 @@ static void tegra241_cmdqv_write_vintf(Tegra241CMDQV *cmdqv, hwaddr offset,
>              tegra241_cmdqv_mmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
>          } else {
> +            tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
>          }
> @@ -302,6 +366,7 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>          if (value & R_CONFIG_CMDQV_EN_MASK) {
>              cmdqv->status |= R_STATUS_CMDQV_ENABLED_MASK;
>          } else {
> +            tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              cmdqv->status &= ~R_STATUS_CMDQV_ENABLED_MASK;
>          }
>          break;
> @@ -321,7 +386,7 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>      case A_VCMDQ0_CONS_INDX ... A_VCMDQ1_GERRORN:
>          index = (offset - 0x10000) / 0x80;
>          tegra241_cmdqv_write_vcmdq(cmdqv, offset - 0x80 * index, index, value,
> -                                   size);
> +                                   size, &local_err);
>          break;
>      case A_VI_VCMDQ0_BASE_L ... A_VI_VCMDQ1_CONS_INDX_BASE_DRAM_H:
>          /* Same decoding as read() case: See comments above */
> @@ -330,7 +395,7 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>      case A_VCMDQ0_BASE_L ... A_VCMDQ1_CONS_INDX_BASE_DRAM_H:
>          index = (offset - 0x20000) / 0x80;
>          tegra241_cmdqv_write_vcmdq(cmdqv, offset - 0x80 * index, index, value,
> -                                   size);
> +                                   size, &local_err);
>          break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%" PRIx64 "\n",


