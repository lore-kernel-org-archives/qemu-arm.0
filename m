Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B404CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 17:38:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUpXc-0007Hc-Rj; Wed, 03 Jun 2026 13:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wUpXV-0007F3-JB
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 13:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wUpXT-0004iJ-9L
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 13:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780508276;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTmWWkeh45oeFhSgljjk9+ifKjz8zWh8059zVQaYBK4=;
 b=OhplZkcgXldDPsjDPu9X7UH0eO0EltpobWTIHx8L6fS9d6kgG40BQAeySYwa5uyKjkWpcK
 1GUlw4VfEUX8clv2PRaXCaMEdgEmy659wcBSDK/FAlNnei58O60lWkY3fi7kptAwAbBouJ
 BoSauo/FY70Pj4r0krjk6AesSq8YEC8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-8a_0OgmiNW6uFzvkQW9Wjw-1; Wed, 03 Jun 2026 13:37:55 -0400
X-MC-Unique: 8a_0OgmiNW6uFzvkQW9Wjw-1
X-Mimecast-MFC-AGG-ID: 8a_0OgmiNW6uFzvkQW9Wjw_1780508274
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-45ef66cc579so2670182f8f.3
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2026 10:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780508274; x=1781113074;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTmWWkeh45oeFhSgljjk9+ifKjz8zWh8059zVQaYBK4=;
 b=eoi1SEzNQ5e+p8m0ZG/q2isM7ttjDkBB8Mdvzi5UTYjIB/mC4U+Vdp9X0kT5NjNhsk
 tvo+tTYYs1GfKSerbFWoec0IioylOxH4dQ5u2Kf2KlEHDNH/UfJyn4cywsvqdPHPjxLJ
 qmpkhmpkc30HR9M1sdXFTvOQUSwFUfgLrNcsIqgk/4anPtNJX8llZ0TKmTXAHOIUUE/t
 hT/DmHTnCF1TRc1dBuoDuQWO/YStKeszGL8uWNFfCLSNwUzcycbhCwCRmoXQ/9CIOcDT
 zVyOZRFibihl6Bczcxz7WddYID2tPoB4Ylsmarl3/nHL3h7nthgRGXk8V/dYiNLPVAH3
 cYaA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dK9ZZoHH5XL/YJTeQFbNzSeQeUyrLETkCB0ZXMRPxkozBBejggk3TDuzGcv1XhkAIfd8nHMiJUA==@nongnu.org
X-Gm-Message-State: AOJu0YwUZy2esZoqgSBN3D9dCjAvqNY6VKuR7McbBIERvqXrlfM65xCx
 I5w2PEy217aRXdb0Gm4D1o9LO0m7gCZarojGNHSiBlmQPrVgoKwDG6uRjsSGvzMDrdTU9OAGlW9
 k7uq4aScEs53jN5uoQzbikPnBwKLGW6yRlNzxDS48sq9Mx+JLjzswxg==
X-Gm-Gg: Acq92OFRgVT4dUEwmwdlTC7BqOs8KQeEbBSe4WYvwwnjWuSE9+ln2lZQhksF0oJZj2v
 KHF3Pac3GxcpUCoPcMf5Ajlh+KDH7QR4+ozEb/t+V++YF3R8NvX2pe0krTvkA+05WJMeAvGPRn/
 +pqHL9SLJhYaTfl+ThxircxKIiS8EcwIi6qpJmnAaBdoQsAwVmLUsoxyCJJ9Hw8PlGluibGpHwW
 uV2vPSWsblKz3gZ8ufGQ2qtohJlubhbYFr6YzOgqlzJce1RKpueqS0f75WCbcxEvPqDMn5ze/Qm
 g9dmSHB3Ctx3ujLCVEblr0BxHYydrbZ8umkrmLoCFmPWf4VwFDLmiISmYUMEHMuNB9F1ahwya4m
 YeIkYID6cI3SDKqeTM6pi5D0uOKe8GEgfA8/Raj/PhHz9Frja0DxfeCQmRQEmFWKXe9Gr8KmIej
 cztxTN
X-Received: by 2002:a05:6000:2a0e:b0:441:1c18:f779 with SMTP id
 ffacd0b85a97d-46021875a1dmr4698107f8f.37.1780508274232; 
 Wed, 03 Jun 2026 10:37:54 -0700 (PDT)
X-Received: by 2002:a05:6000:2a0e:b0:441:1c18:f779 with SMTP id
 ffacd0b85a97d-46021875a1dmr4698074f8f.37.1780508273771; 
 Wed, 03 Jun 2026 10:37:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcb13sm8436282f8f.2.2026.06.03.10.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 10:37:53 -0700 (PDT)
Message-ID: <f47a2f68-9bf1-4f6f-ae44-0b937f65e9ee@redhat.com>
Date: Wed, 3 Jun 2026 19:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/31] hw/arm/tegra241-cmdqv: Emulate VCMDQ register
 writes
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260601114221.457995-1-skolothumtho@nvidia.com>
 <20260601114221.457995-17-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260601114221.457995-17-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vQI7CEHRds7Slk6PlVQeBag7eOsZMH210paD1DXsL8E_1780508274
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



On 6/1/26 1:42 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> This is the write side counterpart of the VCMDQ read emulation. Add
> write handling for both the direct VCMDQ aperture and the VINTF
> logical aperture using the same index decoding and VINTF-to-VCMDQ
> translation logic as the read path.
>
> VINTF aperture writes are translated to their direct-aperture
> equivalent and update the same cached state. Page 1 registers
> (BASE, CONS_INDX_BASE) always update the cache.
>
> Per the CMDQV architecture, a VCMDQ must be allocated to a Virtual
> Interface before it is used to send commands to the SMMU. Until
> that allocation happens, MMIO writes only update cached register
> state - no command consumption, error handling, or interrupt
> activity is driven from these writes. Subsequent patches wire up
> IOMMU_HW_QUEUE_ALLOC, mmap the host VINTF Page 0, and install it
> into guest MMIO; after that, Page 0 writes from either aperture
> reach the hardware-backed mmap'd page instead of just the cache.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/tegra241-cmdqv.c | 159 +++++++++++++++++++++++++++++++++++++++-
>  hw/arm/trace-events     |   2 +
>  2 files changed, 159 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index ff150fe0f3..3cb1b45575 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -120,6 +120,104 @@ static uint64_t tegra241_cmdqv_config_vintf_read(Tegra241CMDQV *cmdqv,
>      }
>  }
>  
> +/*
> + * Write a VCMDQ Page 0 register (control/status) using VCMDQ0_* offsets.
> + *
> + * The caller normalizes the MMIO offset such that @offset0 always refers
> + * to a VCMDQ0_* register, while @index selects the VCMDQ instance.
> + *
> + * Page 0 registers are all 32-bit; this helper is only called for 4-byte
> + * writes.
> + */
> +static void tegra241_cmdqv_write_vcmdq_page0(Tegra241CMDQV *cmdqv,
> +                                             hwaddr offset0, int index,
> +                                             uint32_t value, bool direct)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_CONS_INDX:
> +        cmdqv->vcmdq_cons_indx[index] = value;
> +        break;
> +    case A_VCMDQ0_PROD_INDX:
> +        /* VCMDQ is functional only once allocated to a VINTF; cache only. */
> +        cmdqv->vcmdq_prod_indx[index] = value;
> +        break;
> +    case A_VCMDQ0_CONFIG:
> +        if (value & R_VCMDQ0_CONFIG_CMDQ_EN_MASK) {
> +            cmdqv->vcmdq_status[index] |= R_VCMDQ0_STATUS_CMDQ_EN_OK_MASK;
> +        } else {
> +            cmdqv->vcmdq_status[index] &= ~R_VCMDQ0_STATUS_CMDQ_EN_OK_MASK;
> +        }
> +        cmdqv->vcmdq_config[index] = value;
> +        break;
> +    case A_VCMDQ0_GERRORN:
> +        /* VCMDQ is functional only once allocated to a VINTF; cache only. */
> +        cmdqv->vcmdq_gerrorn[index] = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled write access at 0x%" PRIx64 "\n",
> +                      __func__, offset0);
> +    }
> +    trace_tegra241_cmdqv_write_vcmdq_page0(index, direct ? "direct" : "vi",
> +                                           offset0, value);
> +}
> +
> +/*
> + * Write a VCMDQ Page 1 register (base / DRAM address) - 4-byte access.
> + */
> +static void tegra241_cmdqv_write_vcmdq_page1(Tegra241CMDQV *cmdqv,
> +                                             hwaddr offset0, int index,
> +                                             uint32_t value, bool direct)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_BASE_L:
> +        cmdqv->vcmdq_base[index] =
> +            deposit64(cmdqv->vcmdq_base[index], 0, 32, value);
> +        break;
> +    case A_VCMDQ0_BASE_H:
> +        cmdqv->vcmdq_base[index] =
> +            deposit64(cmdqv->vcmdq_base[index], 32, 32, value);
> +        break;
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_L:
> +        cmdqv->vcmdq_cons_indx_base[index] =
> +            deposit64(cmdqv->vcmdq_cons_indx_base[index], 0, 32, value);
> +        break;
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_H:
> +        cmdqv->vcmdq_cons_indx_base[index] =
> +            deposit64(cmdqv->vcmdq_cons_indx_base[index], 32, 32, value);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled write access at 0x%" PRIx64 "\n",
> +                      __func__, offset0);
> +    }
> +    trace_tegra241_cmdqv_write_vcmdq_page1(index, direct ? "direct" : "vi",
> +                                           offset0, value);
> +}
> +
> +/*
> + * Write a VCMDQ Page 1 register - 8-byte access at BASE_L or DRAM_L.
> + */
> +static void tegra241_cmdqv_write_vcmdq_page1_64(Tegra241CMDQV *cmdqv,
> +                                                hwaddr offset0, int index,
> +                                                uint64_t value, bool direct)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_BASE_L:
> +        cmdqv->vcmdq_base[index] = value;
> +        break;
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_L:
> +        cmdqv->vcmdq_cons_indx_base[index] = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled 64-bit write at 0x%" PRIx64 "\n",
> +                      __func__, offset0);
> +    }
> +    trace_tegra241_cmdqv_write_vcmdq_page1(index, direct ? "direct" : "vi",
> +                                           offset0, value);
> +}
> +
>  static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>                                                hwaddr offset, uint64_t value)
>  {
> @@ -243,6 +341,8 @@ out:
>  static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>                                         uint32_t value)
>  {
> +    int index;
> +
>      switch (offset) {
>      case A_CONFIG:
>          cmdqv->config = value;
> @@ -261,6 +361,39 @@ static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>      case A_VINTF0_CONFIG ... A_VINTF0_LVCMDQ_ERR_MAP_3:
>          tegra241_cmdqv_config_vintf_write(cmdqv, offset, value);
>          break;
> +    case A_VI_VCMDQ0_CONS_INDX ... A_VI_VCMDQ1_GERRORN:
> +        /*
> +         * VINTF Page0 registers are hardware aliases of VCMDQ Page0 registers.
> +         * Translate the VINTF aperture offset to its VCMDQ Page0 equivalent
> +         * before dispatching to the Page 0 helper.
> +         */
> +        offset -= CMDQV_VINTF_PAGE0_BASE - CMDQV_VCMDQ_PAGE0_BASE;
> +        index = (offset - CMDQV_VCMDQ_PAGE0_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page0(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value, false);
> +        break;
> +    case A_VCMDQ0_CONS_INDX ... A_VCMDQ1_GERRORN:
> +        /*
> +         * Decode a per-VCMDQ Page 0 access. Each VCMDQ occupies a
> +         * CMDQV_VCMDQ_STRIDE-byte window; extract the index and normalize
> +         * to the VCMDQ0_* offset before calling the Page 0 helper.
> +         */
> +        index = (offset - CMDQV_VCMDQ_PAGE0_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page0(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value, true);
> +        break;
> +    case A_VI_VCMDQ0_BASE_L ... A_VI_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        /* Same VINTF-to-VCMDQ translation as VINTF Page0 case above. */
> +        offset -= CMDQV_VINTF_PAGE1_BASE - CMDQV_VCMDQ_PAGE1_BASE;
> +        index = (offset - CMDQV_VCMDQ_PAGE1_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page1(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value, false);
> +        break;
> +    case A_VCMDQ0_BASE_L ... A_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        index = (offset - CMDQV_VCMDQ_PAGE1_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page1(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value, true);
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%" PRIx64 "\n",
>                        __func__, offset);
> @@ -268,14 +401,36 @@ static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>  }
>  
>  /*
> - * 8-byte MMIO write handler.
> + * 8-byte MMIO write handler. Only Page 1 BASE / CONS_INDX_BASE_DRAM accept
> + * full 64-bit writes; other offsets are write-ignored.
>   */
>  static void tegra241_cmdqv_writell_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>                                          uint64_t value)
>  {
> -    qemu_log_mask(LOG_UNIMP,
> +    int index;
> +
> +    switch (offset) {
> +    case A_VI_VCMDQ0_BASE_L ... A_VI_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        /*
> +         * VINTF Page1 registers are hardware aliases of VCMDQ Page1 registers.
> +         * Translate the VINTF aperture offset to its VCMDQ Page1 equivalent
> +         * before dispatching to the Page 1 helper.
> +         */
> +        offset -= CMDQV_VINTF_PAGE1_BASE - CMDQV_VCMDQ_PAGE1_BASE;
> +        index = (offset - CMDQV_VCMDQ_PAGE1_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page1_64(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value, false);
> +        break;
> +    case A_VCMDQ0_BASE_L ... A_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        index = (offset - CMDQV_VCMDQ_PAGE1_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page1_64(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value, true);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
>                        "%s unhandled 64-bit write at 0x%" PRIx64 " (WI)\n",
>                        __func__, offset);
> +    }
>  }
>  
>  static void tegra241_cmdqv_write_mmio(void *opaque, hwaddr offset,
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 4392135fa2..d76f408d8a 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -77,6 +77,8 @@ tegra241_cmdqv_read_mmio(uint64_t offset, uint64_t val, unsigned size) "offset:
>  tegra241_cmdqv_write_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
>  tegra241_cmdqv_read_vcmdq_page0(int index, const char *aperture, uint64_t offset0, uint64_t val) "vcmdq[%d] %s page0 offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  tegra241_cmdqv_read_vcmdq_page1(int index, const char *aperture, uint64_t offset0, uint64_t val) "vcmdq[%d] %s page1 offset0: 0x%"PRIx64" val: 0x%"PRIx64
> +tegra241_cmdqv_write_vcmdq_page0(int index, const char *aperture, uint64_t offset0, uint64_t val) "vcmdq[%d] %s page0 offset0: 0x%"PRIx64" val: 0x%"PRIx64
> +tegra241_cmdqv_write_vcmdq_page1(int index, const char *aperture, uint64_t offset0, uint64_t val) "vcmdq[%d] %s page1 offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"


