Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF34DCD4F3C
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 07:54:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPbkv-0001Oo-KW; Wed, 20 May 2026 03:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPbkY-0001GT-5p
 for qemu-arm@nongnu.org; Wed, 20 May 2026 03:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPbkS-0002R4-Gm
 for qemu-arm@nongnu.org; Wed, 20 May 2026 03:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779263625;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iV3Q27eyJBwhzlfVXfsz+W+Rxi15tJdWYYlkW5PlOQQ=;
 b=WXMAmIRbnHB9WNTOznhmuO/ulZmkpOy0kDCCb6xJJMrK5euFjhBsrAjskfDtGGYnehJlCo
 vW8CdUT3hK0PMZOh0dTYzMRohZbMDOJEs8Dp3LYLwp3sje3Ot1HCCAFfFeXe4OOnWNX3wA
 HNUHEm9uvKSTGLsZBsqcOUvuYLcTuRM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-xz9VkWxJMxe1Gq63vfZbMQ-1; Wed, 20 May 2026 03:53:44 -0400
X-MC-Unique: xz9VkWxJMxe1Gq63vfZbMQ-1
X-Mimecast-MFC-AGG-ID: xz9VkWxJMxe1Gq63vfZbMQ_1779263623
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48e79219704so31986455e9.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 00:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779263623; x=1779868423;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iV3Q27eyJBwhzlfVXfsz+W+Rxi15tJdWYYlkW5PlOQQ=;
 b=fOoJYQSstT0Fh2PYN1uNNKHNTrX6HJq3tGVh5T3AzQBHbLE7UGPJM0q+3amLeZi0vg
 w52shhZgTh21LJHHNS91x672bbNUF4VmIuaIpMIgqZsXsdfiYHUPVdVvBNM1ppbILQAx
 Xj2exYdfF7reGqazcqonIDi9hKP2e2He9G/dLUT4ZaU0G5dJV6NCJ7BPEC3j8pFisuZb
 oNwyFhiTGoSFq8HKAqpnUcPIdMHEnFMGPELtkKarTSffxKl+H4NiN2+3hfQSJxfI+5iT
 +vALn5jJ3cQi+isn0PxPYxPQcrzHoYZLPj2UprP7KwD3mKLH2IZ7sGz812u7uvTG34xc
 OF0A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ZkI3g06rxpeZHnryOdH35/1GLgguyoEPuzRDMgaE1JQa4ww/J/ZYpgKduBb7nktBLEZb7wnYDyw==@nongnu.org
X-Gm-Message-State: AOJu0Yz5UpgclkuXbHXZzE3Uo/UHefwBQjSZJABKZipZ2DBQsYxIPWIR
 tOC0ga5IQGXoUMDnt1FxY1i5h7nRLkW9jUcPZx1dAPTt7v+MD9hsq+Nbmt1JzO+2yZnxJDeeIgy
 ktlkwKbT/12vXpyaulKd1c1OS7die6+egGeEN0aWDr7GjeVua3aw7sA==
X-Gm-Gg: Acq92OG8LX+viHJG5tykzAjcoUPjClHpGeBW5XIzgYYNSdzHDOx5QdioKv7ZZoLvi0D
 1UM9JdIjdI9XL9oIoubUITgxsVTDlPUNzbykWdNPO/d3VMra+QGvPjWXVlrZDFTGL9v00cJV2Vf
 opeN78bvD25f2rjSOUI6iiRyljfh5ncKbCpPHQAk4WJkyCeeiqMF0ybUVIMSQY3Wh+lKwWLPA7R
 7Av+eDrc2HoIIon14lNa3xwBDj9xLIA7so3CISUhlw0Egy+cyaRRbPhE+1OOx/966QkonvHXNCj
 EOHqNCSi9OJ0y04Pf0hxvgQkS9CwzOE3fpaPWKep5OlZkFo75HAoyeXCXDuVvjZqe/Odl3AYYN0
 sJWS6+XmM5CQQ20L6t+eoB/4jrEfx8PI6ajBOyWy2BU7ZCotOeVv8kY1Vqt64LYP2ZP/qzA==
X-Received: by 2002:a05:600c:c167:b0:48f:d410:6065 with SMTP id
 5b1f17b1804b1-48fe66138dfmr357106125e9.29.1779263622595; 
 Wed, 20 May 2026 00:53:42 -0700 (PDT)
X-Received: by 2002:a05:600c:c167:b0:48f:d410:6065 with SMTP id
 5b1f17b1804b1-48fe66138dfmr357105815e9.29.1779263622099; 
 Wed, 20 May 2026 00:53:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab3977sm417318395e9.9.2026.05.20.00.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 00:53:41 -0700 (PDT)
Message-ID: <73b4f204-41d5-4997-8d02-5fc9ba3d0c67@redhat.com>
Date: Wed, 20 May 2026 09:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/32] hw/arm/tegra241-cmdqv: Emulate VCMDQ register
 writes
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-17-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-17-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B49LlXqj9PfJVPqgiVN0niBSW_r6Xjsrr_nAQSQF9vs_1779263623
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

On 5/19/26 12:36 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> This is the write side counterpart of the VCMDQ read emulation. Add
> write handling for both the direct VCMDQ aperture and the VINTF
> logical aperture using the same index decoding and VINTF-to-VCMDQ
> translation logic as the read path.
>
> VINTF aperture writes are translated to their direct-aperture
> equivalent and update the same cached state. Page 1 registers
> (BASE, CONS_INDX_BASE) always update the cache. Once
> IOMMU_HW_QUEUE_ALLOC and viommu_mmap are wired up in a subsequent
> patch, Page 0 register writes will be forwarded to the hardware-
> backed mmap'd page.
>
> Ignore VCMDQ BASE writes if the VCMDQ is already enabled.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 164 +++++++++++++++++++++++++++++++++++++++-
>  hw/arm/trace-events     |   2 +
>  2 files changed, 164 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index f859126ad6..5d2d9d2e26 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -16,6 +16,16 @@
>  #include "tegra241-cmdqv.h"
>  #include "trace.h"
>  
> +/*
> + * Returns true if the per-VCMDQ CMDQ_EN_OK bit is set.
> + */
> +static bool tegra241_vcmdq_enabled(Tegra241CMDQV *cmdqv, int index)
> +{
> +    uint32_t status = cmdqv->vcmdq_status[index];
> +
> +    return status & R_VCMDQ0_STATUS_CMDQ_EN_OK_MASK;
> +}
> +
>  /*
>   * Read a VCMDQ Page 0 register (control/status) using VCMDQ0_* offsets.
>   *
> @@ -116,6 +126,108 @@ static uint64_t tegra241_cmdqv_config_vintf_read(Tegra241CMDQV *cmdqv,
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
> +                                             uint32_t value)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_CONS_INDX:
> +        cmdqv->vcmdq_cons_indx[index] = value;
> +        break;
> +    case A_VCMDQ0_PROD_INDX:
> +        cmdqv->vcmdq_prod_indx[index] = value;
so there is no cmd consumption triggered by an increment of the producer
index as opposed to std smmu emulation. This shall at least be explained
in the commit msg and maybe in the code, + the justification. It is a
bit strange to emulate the MMIO accesses while not doing anything
functional out of them.
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
> +        cmdqv->vcmdq_gerrorn[index] = value;
shouldn't it do something functional besides storing the value
on std SMMU we resume consuming cmds. interaction with interrupts,
CONS_INDX?

> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled write access at 0x%" PRIx64 "\n",
> +                      __func__, offset0);
> +    }
> +    trace_tegra241_cmdqv_write_vcmdq_page0(index, offset0, value);
> +}
> +
> +/*
> + * Write a VCMDQ Page 1 register (base / DRAM address) - 4-byte access.
> + */
> +static void tegra241_cmdqv_write_vcmdq_page1(Tegra241CMDQV *cmdqv,
> +                                             hwaddr offset0, int index,
> +                                             uint32_t value)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_BASE_L:
> +        if (tegra241_vcmdq_enabled(cmdqv, index)) {
> +            return;
> +        }
> +        cmdqv->vcmdq_base[index] =
> +            deposit64(cmdqv->vcmdq_base[index], 0, 32, value);
> +        break;
> +    case A_VCMDQ0_BASE_H:
> +        if (tegra241_vcmdq_enabled(cmdqv, index)) {
where is it documented in the spec? I don't see this restriction in the
reg doc. Then "Enabling the virtual CMDQ" paragraph describes a std
setup but does not say - afaics- that it should be ignored -
worth commenting
> +            return;
> +        }
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
> +    trace_tegra241_cmdqv_write_vcmdq_page1(index, offset0, value);
> +}
> +
> +/*
> + * Write a VCMDQ Page 1 register - 8-byte access at BASE_L or DRAM_L.
> + */
> +static void tegra241_cmdqv_write_vcmdq_page1_64(Tegra241CMDQV *cmdqv,
> +                                                hwaddr offset0, int index,
> +                                                uint64_t value)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_BASE_L:
> +        if (tegra241_vcmdq_enabled(cmdqv, index)) {
> +            return;
> +        }
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
> +    trace_tegra241_cmdqv_write_vcmdq_page1(index, offset0, value);
> +}
> +
>  static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>                                                hwaddr offset, uint64_t value)
>  {
> @@ -235,6 +347,8 @@ out:
>  static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>                                         uint32_t value)
>  {
> +    int index;
> +
>      switch (offset) {
>      case A_CONFIG:
>          cmdqv->config = value;
> @@ -253,6 +367,33 @@ static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>      case A_VINTF0_CONFIG ... A_VINTF0_LVCMDQ_ERR_MAP_3:
>          tegra241_cmdqv_config_vintf_write(cmdqv, offset, value);
>          break;
> +    case A_VI_VCMDQ0_CONS_INDX ... A_VI_VCMDQ1_GERRORN:
> +        /*
> +         * VINTF Page0 registers are hardware aliases of VCMDQ Page0 registers.
> +         * Translate the VINTF aperture offset to its VCMDQ Page0 equivalent
> +         * and fall through to the Page0 dispatch below.
> +         */
> +        offset -= CMDQV_VINTF_PAGE0_BASE - CMDQV_VCMDQ_PAGE0_BASE;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_CONS_INDX ... A_VCMDQ1_GERRORN:
> +        /*
> +         * Decode a per-VCMDQ Page 0 access. Each VCMDQ occupies a
> +         * CMDQV_VCMDQ_STRIDE-byte window; extract the index and normalize
> +         * to the VCMDQ0_* offset before calling the Page 0 helper.
> +         */
> +        index = (offset - CMDQV_VCMDQ_PAGE0_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page0(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value);
> +        break;
> +    case A_VI_VCMDQ0_BASE_L ... A_VI_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        /* Same VINTF-to-VCMDQ translation as VINTF Page0 case above. */
> +        offset -= CMDQV_VINTF_PAGE1_BASE - CMDQV_VCMDQ_PAGE1_BASE;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_BASE_L ... A_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        index = (offset - CMDQV_VCMDQ_PAGE1_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page1(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value);
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%" PRIx64 "\n",
>                        __func__, offset);
> @@ -260,14 +401,33 @@ static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
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
> +         * and fall through to the Page1 dispatch below.
> +         */
> +        offset -= CMDQV_VINTF_PAGE1_BASE - CMDQV_VCMDQ_PAGE1_BASE;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_BASE_L ... A_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        index = (offset - CMDQV_VCMDQ_PAGE1_BASE) / CMDQV_VCMDQ_STRIDE;
> +        tegra241_cmdqv_write_vcmdq_page1_64(cmdqv,
> +                offset - index * CMDQV_VCMDQ_STRIDE, index, value);
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
> index 8c34a04b24..c4262bb2be 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -77,6 +77,8 @@ tegra241_cmdqv_read_mmio(uint64_t offset, uint64_t val, unsigned size) "offset:
>  tegra241_cmdqv_write_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
>  tegra241_cmdqv_read_vcmdq_page0(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page0 offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  tegra241_cmdqv_read_vcmdq_page1(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page1 offset0: 0x%"PRIx64" val: 0x%"PRIx64
> +tegra241_cmdqv_write_vcmdq_page0(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page0 offset0: 0x%"PRIx64" val: 0x%"PRIx64
> +tegra241_cmdqv_write_vcmdq_page1(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page1 offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
Thanks

Eric


