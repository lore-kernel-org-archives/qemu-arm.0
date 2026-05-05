Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D65CD342F
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 10:43:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKDF9-0005ss-On; Tue, 05 May 2026 06:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKDF6-0005s7-8r
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:43:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKDF4-00038v-9c
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777977785;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hm9Udy8qecY32jK1J534y99qVoBQy65LoN7flgxPzIY=;
 b=Be35xvFZgpt2kCN7B1mF8d8T3KNOU+tIf1tY9Web2/mZWbjPE7JS2U57CiGG9jK8SDCOEb
 0o82qw6efqXZT/V1w/E9W2dLGXzulYWW8EgaYsz9NGMRAnhQ8b2dIxELt9CgCv/9dgJMGQ
 Pm8+QYG89kor9ovJc947UK63dMLSy2A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-2W8x480xPwq-L8ONx6M9Vw-1; Tue, 05 May 2026 06:43:04 -0400
X-MC-Unique: 2W8x480xPwq-L8ONx6M9Vw-1
X-Mimecast-MFC-AGG-ID: 2W8x480xPwq-L8ONx6M9Vw_1777977783
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-44b186b715aso2234801f8f.0
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 03:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777977783; x=1778582583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hm9Udy8qecY32jK1J534y99qVoBQy65LoN7flgxPzIY=;
 b=OfM+Y0xaSf+4Nsfe/ly+hYRRTIuUgZyey3axxUe3Kf2EwYDHAo1749cnq6tcMgkad6
 7qqBdosQrQOsPTeB2ta/sQOVLkF0xlzWi+ye2pE18DB1wTrhdIv/PsEWmWl8bL4p5sdM
 V0kAuFloV8vSL+53Qm68XNVZ8Xc/PtnCS0Gwi7ZmlcGoafjZJe9bqbr25sDdi0zQCyiD
 o13hdDprNcOWg1D9PziRsV20Dxhw4P4b8i2UcJWdM+hZIJ4J41H6+s9PEOTXQCIbC55F
 wsckeH3PDhwYaTUgRAzhBqRj+WRZb+zkfam5xK7+A/sq/dX1mqGqbDKVqRQfZ1ZisLSF
 hwGA==
X-Forwarded-Encrypted: i=1;
 AFNElJ94aTfjG3O4QpwK/SQEYbNx+nfHoX/zqBrGbjCPU14LXuNBMAMsO3iZAzV/B+7eDmRHVhgoDDkodg==@nongnu.org
X-Gm-Message-State: AOJu0YwE1NnrtMmXdqkzuUYnP5D9ZmsrN2Q2T3x+V3u0neE99MohpLMz
 wC83x9bAISCDm2BmiVApQN9a4BTxEQ5s366VBn1BcSckP1YxX9cL9QnmHNix0AB/BnFyuNgnRV1
 Rf5C1ib8HkX9ctMllxEsphRt4uvr1kaXVbY3/FriXsAkuZyYS5QBh5A==
X-Gm-Gg: AeBDiet2H9YZaKiJUVWkJ3XdtOos6clRLAtrPRC8i+DEy4EQCvEu0L9C3Mbt5XLHWMq
 6m3h1Bju/uA2d3S2ZE6PpFSp6TjO6my6+Vxfz7qHNoLjmjWrPJjF7/XWy1nTg9WHdsOK4zSDnQN
 xXmyd7Yll420hZ3MKEP2K2IB55W5DpNw6ym7l0XucRdOsutZD0h8Z7MvSpJ54lb47aAtUKi5UQq
 DyOxGq9YNLBB6eL2IEn7Q88W8NuIlI7z90chITg/8BvMn1Z8LCP/tC+f6xcwQ1fn4CVx1WFL09T
 ztOYESXNFPecUd9Rnk3kEAgTtpUPFjVbM2gPc209CNy4vQqoAcBejVcN+xnMulUggd2R4IxS8M6
 eldRBECt5CSFqTGrFHM7RAdTzxtot/8gcU1rglx6HQ/9eufoKuz84/KNWD2DV1yNbdiGtBtTvV7
 tilo6b
X-Received: by 2002:a05:600d:8451:b0:488:a723:ea53 with SMTP id
 5b1f17b1804b1-48d187d95e0mr29233015e9.7.1777977782906; 
 Tue, 05 May 2026 03:43:02 -0700 (PDT)
X-Received: by 2002:a05:600d:8451:b0:488:a723:ea53 with SMTP id
 5b1f17b1804b1-48d187d95e0mr29232745e9.7.1777977782459; 
 Tue, 05 May 2026 03:43:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48d149ebdebsm22736025e9.4.2026.05.05.03.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 03:43:01 -0700 (PDT)
Message-ID: <abd9298d-1c3c-4f0c-8aab-ca03edb6b230@redhat.com>
Date: Tue, 5 May 2026 12:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/31] hw/arm/tegra241-cmdqv: Emulate VCMDQ register
 writes
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-17-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-17-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nHRmmOMhrqlAGdagTSJYyMxdf-WRfKbSRp7rwrXacm4_1777977783
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> This is the write side counterpart of the VCMDQ read emulation. Add write
> handling for both CMDQV_CMDQ_BASE and CMDQV_VI_CMDQ_BASE apertures using
> the same index decoding and VINTF-to-VCMDQ translation logic as the read
> path.
>
> VINTF aperture writes are translated to their CMDQV_CMDQ_BASE equivalent
> and update the same cached state. Page1 registers (BASE, CONS_INDX_BASE)
> always update the cache. Once IOMMU_HW_QUEUE_ALLOC and viommu_mmap are
> wired up in a subsequent patch, Page0 register writes will be forwarded
> to the hardware-backed mmap'd page.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 99 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 35e6f0bbd6..d4ba2ada92 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -55,6 +55,70 @@ static uint64_t tegra241_cmdqv_read_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0,
>      }
>  }
>  
> +/*
> + * Write a VCMDQ register using VCMDQ0_* offsets.
> + *
> + * The caller normalizes the MMIO offset such that @offset0 always refers
> + * to a VCMDQ0_* register, while @index selects the VCMDQ instance.
> + */
> +static void tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0,
> +                                       int index, uint64_t value,
> +                                       unsigned size)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_CONS_INDX:
> +        cmdqv->vcmdq_cons_indx[index] = (uint32_t)value;
> +        return;
> +    case A_VCMDQ0_PROD_INDX:
> +        cmdqv->vcmdq_prod_indx[index] = (uint32_t)value;
> +        return;
> +    case A_VCMDQ0_CONFIG:
> +        if (value & R_VCMDQ0_CONFIG_CMDQ_EN_MASK) {
> +            cmdqv->vcmdq_status[index] |= R_VCMDQ0_STATUS_CMDQ_EN_OK_MASK;
> +        } else {
> +            cmdqv->vcmdq_status[index] &= ~R_VCMDQ0_STATUS_CMDQ_EN_OK_MASK;
> +        }
> +        cmdqv->vcmdq_config[index] = (uint32_t)value;
> +        return;
> +    case A_VCMDQ0_GERRORN:
> +        cmdqv->vcmdq_gerrorn[index] = (uint32_t)value;
> +        return;
> +    case A_VCMDQ0_BASE_L:
> +        if (size == 8) {
> +            cmdqv->vcmdq_base[index] = value;
> +        } else {
> +            cmdqv->vcmdq_base[index] =
> +                (cmdqv->vcmdq_base[index] & 0xffffffff00000000ULL) |
> +                (value & 0xffffffffULL);
can you explain the access pattern?
this does not look like A_STRTAB_BASE smmuv3 writes/read

> +        }
> +        return;
> +    case A_VCMDQ0_BASE_H:
> +        cmdqv->vcmdq_base[index] =
> +            (cmdqv->vcmdq_base[index] & 0xffffffffULL) |
> +            ((uint64_t)value << 32);
> +        return;
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_L:
> +        if (size == 8) {
> +            cmdqv->vcmdq_cons_indx_base[index] = value;
> +        } else {
> +            cmdqv->vcmdq_cons_indx_base[index] =
> +                (cmdqv->vcmdq_cons_indx_base[index] & 0xffffffff00000000ULL) |
> +                (value & 0xffffffffULL);
> +        }
> +        return;
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_H:
> +        cmdqv->vcmdq_cons_indx_base[index] =
> +            (cmdqv->vcmdq_cons_indx_base[index] & 0xffffffffULL) |
> +            ((uint64_t)value << 32);
> +        return;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled write access at 0x%" PRIx64 "\n",
> +                      __func__, offset0);
> +        return;
> +    }
> +}
> +
>  static uint64_t tegra241_cmdqv_config_vintf_read(Tegra241CMDQV *cmdqv,
>                                                   hwaddr offset)
>  {
> @@ -212,6 +276,7 @@ static void tegra241_cmdqv_write_mmio(void *opaque, hwaddr offset,
>                                        uint64_t value, unsigned size)
>  {
>      Tegra241CMDQV *cmdqv = (Tegra241CMDQV *)opaque;
> +    int index;
>  
>      if (offset >= TEGRA241_CMDQV_IO_LEN) {
>          qemu_log_mask(LOG_UNIMP,
> @@ -238,6 +303,40 @@ static void tegra241_cmdqv_write_mmio(void *opaque, hwaddr offset,
>      case A_VINTF0_CONFIG ... A_VINTF0_LVCMDQ_ERR_MAP_3:
>          tegra241_cmdqv_config_vintf_write(cmdqv, offset, value);
>          break;
> +    case A_VI_VCMDQ0_CONS_INDX ... A_VI_VCMDQ1_GERRORN:
> +        /*
> +         * VINTF Page0 registers have the same per-VCMDQ layout as the
> +         * VCMDQ Page0 registers. Translate the VINTF aperture offset to the
> +         * equivalent VCMDQ aperture offset, then fall through to reuse the
> +         * common VCMDQ decoding logic below.
> +         */
> +        offset -= CMDQV_VINTF_PAGE0_BASE - CMDQV_VCMDQ_PAGE0_BASE;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_CONS_INDX ... A_VCMDQ1_GERRORN:
> +        /*
> +         * Decode a per-VCMDQ register access.
> +         *
> +         * The hardware supports up to 128 identical VCMDQ instances; we
> +         * currently expose TEGRA241_CMDQV_MAX_CMDQ (= 2). Each VCMDQ
> +         * occupies a CMDQV_VCMDQ_STRIDE-byte window within the page.
> +         *
> +         * Extract the VCMDQ index and normalize to the VCMDQ0_* register
> +         * offset. A single helper services all instances via @index.
> +         */
> +        index = (offset - CMDQV_VCMDQ_PAGE0_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq(cmdqv, offset - index * CMDQV_VCMDQ_STRIDE,
> +                                   index, value, size);
> +        break;
> +    case A_VI_VCMDQ0_BASE_L ... A_VI_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        /* Same VINTF-to-VCMDQ translation as VINTF Page0 case above */
> +        offset -= CMDQV_VINTF_PAGE1_BASE - CMDQV_VCMDQ_PAGE1_BASE;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_BASE_L ... A_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        /* Same decode logic as VCMDQ Page0 case above */
> +        index = (offset - CMDQV_VCMDQ_PAGE1_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq(cmdqv, offset - index * CMDQV_VCMDQ_STRIDE,
> +                                   index, value, size);
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%" PRIx64 "\n",
>                        __func__, offset);
Thanks

Eric


