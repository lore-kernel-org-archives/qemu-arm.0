Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C28CD98CC
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 15:19:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXhBv-0000rk-Bu; Thu, 11 Jun 2026 11:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wXhBm-0000nz-Up
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wXhBk-0006ev-7f
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781191163;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rpe+NriEziPHAoolxJXicOOOgNJuWQ26kgvwDG0chvU=;
 b=KegTL6tUU2wJdVAZSuRMIQPTDUQayy2H40QeHn45mfyL4kBPzTW/bsdTGNIfWHLYOY7cJa
 K6x7/z/bsY+6PnybT7UPkADpQ2TB+iku4TNdTcCEX8CUSClwxEWWn9B/42TmlTi7K4Zerg
 Oi3ylOL9Hlg5CX1ZI9fYhWWRvy9bZeI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297--hottbvQN-WhNqlI4ur4cQ-1; Thu, 11 Jun 2026 11:19:21 -0400
X-MC-Unique: -hottbvQN-WhNqlI4ur4cQ-1
X-Mimecast-MFC-AGG-ID: -hottbvQN-WhNqlI4ur4cQ_1781191160
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490abeb7298so84271145e9.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 08:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781191160; x=1781795960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rpe+NriEziPHAoolxJXicOOOgNJuWQ26kgvwDG0chvU=;
 b=m68Rz1XusLI0cOSpM/JtclmTGmd/H1niR+lOCnH37QPVgrYiSbMkelPYeeTIctCJmQ
 4OAUQVSZ/JJ6iPOBs6mZsQWxnfLh+gsR+t4Nn4i+2AL+n/F4PRMCeHox7yINaCWNo7pF
 zhiWy24FNieKCUmXeP/S9gYKdzdAet2R8O+w8SSarhLCDa7xl7/CayDD4panQAbURUd5
 Iu45sQ2Q3qBkf7rCVq4Xw8Z1R0Ean/tDL3u2xfXxa12Dz/0/tT1hcQ3BYbdJj3yrwKlF
 3pf86psOeH2AuxaLfxXclgWmwFfDc/7haslUKHqrmHollBC6nIilVYeeLPrLlVXKmBFu
 bAfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MGXIdBzU8RWd1rXhSIFU5xOONsksh2COaWTV0tTc0I15PzE31zAbU+fBNDdxNGFWaeyoKch11bQ==@nongnu.org
X-Gm-Message-State: AOJu0YyGTTBllhT7nVNDNSicqvho+A0Qp/11m7x1Z6drYuzxt0oiO1Y1
 WDtRo8bpVqw6IMwikSjGi2geCGfk/QAozg3qR4x4ds/seSZH+EqxSbn4hUNwb9dZZk4maX5WViz
 pbrzXEk1kQMYT2/gtePE4LEtkeTjx9HXaGanZ3IRFens7sfV7Fuitng==
X-Gm-Gg: Acq92OHj2WTkBYT6o8yqUWPNmgjRFF1BJ2RpYguAn3e2ciCfOrUs1Vnm117QaU2FXl4
 jog+/gNjUS5AYBtCwGZswRHxwNLd3C/QAkdYuPO3T9/8EvxIRnlvDGp7I5dpJmJLh4CS5/3VcYd
 ckhE2alpX4P0ZusaofY3V2MF3k334ZNgZZbvURfccwlpSFV2k3qOoGVIAf/WzyB5EULn6TqJRnL
 tb+tmXuT1rDJA5ge/gW1oHEIZRQje+yySBuaeJrW45buaduZqRrvCM9+0tXnDT6bSxKFmEHG497
 EZDjN/df+LYYwMZTcCK3a4GnoUcWlLDp/17yp2ArbFmmtObN7Y2i+9smavmKeN2zS0vDIqjmuiE
 jV6wa0OqdkiXoZMmJGbqOhxXIhDojzphjhG9AwU0gBGkBL/Z+KP2/EP+sy8HNueWP9n14SqYJ01
 U2aMt0
X-Received: by 2002:a05:600c:5343:b0:490:4ee0:82ff with SMTP id
 5b1f17b1804b1-490e563ef14mr36791205e9.27.1781191160140; 
 Thu, 11 Jun 2026 08:19:20 -0700 (PDT)
X-Received: by 2002:a05:600c:5343:b0:490:4ee0:82ff with SMTP id
 5b1f17b1804b1-490e563ef14mr36790385e9.27.1781191159440; 
 Thu, 11 Jun 2026 08:19:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcad5sm90886242f8f.5.2026.06.11.08.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 08:19:18 -0700 (PDT)
Message-ID: <ed5712a5-bba0-415c-b0e5-c3a7f590991b@redhat.com>
Date: Thu, 11 Jun 2026 17:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 19/31] hw/arm/tegra241-cmdqv: Route allocated VCMDQ
 Page0 accesses to the mmap'd host VINTF page0
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260609112552.378999-1-skolothumtho@nvidia.com>
 <20260609112552.378999-20-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260609112552.378999-20-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9ZhFtrX49yRjm6f4wuYOlzqQT53OtpcgSkG0hi5aRD4_1781191160
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 6/9/26 1:25 PM, Shameer Kolothum wrote:
> Introduce tegra241_cmdqv_vintf_lvcmdq_ptr() to route VCMDQ Page 0
> register accesses through the mmap'd host VINTF Page 0 backing once a
> hardware queue has been allocated for the VCMDQ.
>
> The two QEMU-trapped Page 0 apertures (direct at 0x10000, VINTF at
> 0x30000) are hardware aliases of the same underlying registers. A
> subsequent patch installs the VINTF aperture as a RAM-device into
> guest MMIO; in this patch both remain QEMU-trapped.
>
> The direct VCMDQ aperture stays QEMU-trapped (rather than aliased
> to the VINTF mmap) so that writes to an unallocated VCMDQ remain
> well-defined. The CMDQV architecture allows software to program a
> VCMDQ through the direct aperture without first allocating it to a
> VINTF; aliasing to the VINTF mmap would route those writes into
> unallocated logical slots where the hardware silently drops them.
>
> A VCMDQ Page 0 access is served from one of two sources:
>
>   - Cache-backed: no hw_queue is allocated for the VCMDQ
>     (HW_QUEUE_ALLOC has not yet succeeded). Both apertures use
>     QEMU's register cache.
>
>   - HW-backed: HW_QUEUE_ALLOC has succeeded. Both apertures access
>     the registers directly through the mmap'd host VINTF Page 0.
>
> tegra241_cmdqv_sync_vcmdq() copies any cached writes (CONS_INDX,
> PROD_INDX, CONFIG, GERRORN) into the mmap'd page on the cache-to-HW
> transition so the guest's earlier register state survives. Freeing a
> VCMDQ clears the cached Page0 registers.
>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/tegra241-cmdqv.c | 89 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events     |  4 +-
>  2 files changed, 91 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 8cb39e87c4..63fe0ac681 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -16,6 +16,16 @@
>  #include "tegra241-cmdqv.h"
>  #include "trace.h"
>  
> +static void tegra241_cmdqv_reset_vcmdq_cache(Tegra241CMDQV *cmdqv, int index)
> +{
> +    cmdqv->vcmdq_cons_indx[index] = 0;
> +    cmdqv->vcmdq_prod_indx[index] = 0;
> +    cmdqv->vcmdq_config[index] = 0;
> +    cmdqv->vcmdq_status[index] = 0;
> +    cmdqv->vcmdq_gerror[index] = 0;
> +    cmdqv->vcmdq_gerrorn[index] = 0;
> +}
> +
>  static void tegra241_cmdqv_free_vcmdq(Tegra241CMDQV *cmdqv, int index)
>  {
>      IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
> @@ -27,6 +37,7 @@ static void tegra241_cmdqv_free_vcmdq(Tegra241CMDQV *cmdqv, int index)
>      iommufd_backend_free_id(viommu->iommufd, vcmdq->hw_queue_id);
>      g_free(vcmdq);
>      cmdqv->vcmdq[index] = NULL;
> +    tegra241_cmdqv_reset_vcmdq_cache(cmdqv, index);
>  }
>  
>  /*
> @@ -45,6 +56,47 @@ static bool tegra241_cmdqv_vcmdq_ready_to_alloc(Tegra241CMDQV *cmdqv, int index)
>             tegra241_cmdqv_enabled(cmdqv) && tegra241_vintf_enabled(cmdqv);
>  }
>  
> +/*
> + * Return a pointer into the mmap'd VINTF page0 for the VCMDQ Page 0
> + * register at @offset0 in VCMDQ slot @index, or NULL when the VCMDQ
> + * has no hw_queue allocated or the host VINTF page0 is not mmap'd.
> + */
> +static inline uint32_t *tegra241_cmdqv_vintf_lvcmdq_ptr(Tegra241CMDQV *cmdqv,
> +                                                 int index, hwaddr offset0)
> +{
> +    if (!cmdqv->vcmdq[index] || !cmdqv->vintf_page0) {
> +        return NULL;
> +    }
> +    return (uint32_t *)(cmdqv->vintf_page0 +
> +                        (index * CMDQV_VCMDQ_STRIDE) +
> +                        (offset0 - CMDQV_VCMDQ_PAGE0_BASE));
> +}
> +
> +/*
> + * Flush cached register writes into the mmap'd host VINTF page0 after a
> + * successful HW_QUEUE_ALLOC, so the guest's earlier writes survive
> + * the cache-to-hardware transition.
> + */
> +static void tegra241_cmdqv_sync_vcmdq(Tegra241CMDQV *cmdqv, int index)
> +{
> +    uint32_t *ptr;
> +
> +    ptr = tegra241_cmdqv_vintf_lvcmdq_ptr(cmdqv, index, A_VCMDQ0_CONS_INDX);
> +    if (!ptr) {
> +        return;
> +    }
> +    *ptr = cmdqv->vcmdq_cons_indx[index];
> +
> +    ptr = tegra241_cmdqv_vintf_lvcmdq_ptr(cmdqv, index, A_VCMDQ0_PROD_INDX);
> +    *ptr = cmdqv->vcmdq_prod_indx[index];
> +
> +    ptr = tegra241_cmdqv_vintf_lvcmdq_ptr(cmdqv, index, A_VCMDQ0_CONFIG);
> +    *ptr = cmdqv->vcmdq_config[index];
> +
> +    ptr = tegra241_cmdqv_vintf_lvcmdq_ptr(cmdqv, index, A_VCMDQ0_GERRORN);
> +    *ptr = cmdqv->vcmdq_gerrorn[index];
> +}
> +
>  /*
>   * Allocate a host HW VCMDQ from the current cached BASE / size for @index.
>   * No-op (returns true) until the VCMDQ is ready to be allocated.
> @@ -85,6 +137,9 @@ static bool tegra241_cmdqv_setup_vcmdq(Tegra241CMDQV *cmdqv, int index,
>      cmdqv->vcmdq_gerror[index] &= ~R_VCMDQ0_GERROR_CMDQ_INIT_ERR_MASK;
>      cmdqv->vcmdq_status[index] |= R_VCMDQ0_STATUS_CMDQ_EN_OK_MASK;
>  
> +    /* Push cached writes to HW; freeing resets the cache. */
> +    tegra241_cmdqv_sync_vcmdq(cmdqv, index);
> +
>      return true;
>  }
>  
> @@ -111,13 +166,23 @@ static void tegra241_cmdqv_setup_all_vcmdq(Tegra241CMDQV *cmdqv,
>   *
>   * The caller normalizes the MMIO offset such that @offset0 always refers
>   * to a VCMDQ0_* register, while @index selects the VCMDQ instance.
> + *
> + * If the VCMDQ is allocated and the host VINTF page0 is mmap'd, read
> + * directly from the host VINTF page0 backing. Otherwise, fall back to
> + * the cache.
>   */
>  static uint64_t tegra241_cmdqv_read_vcmdq_page0(Tegra241CMDQV *cmdqv,
>                                                  hwaddr offset0, int index,
>                                                  bool direct)
>  {
> +    uint32_t *ptr = tegra241_cmdqv_vintf_lvcmdq_ptr(cmdqv, index, offset0);
>      uint64_t val = 0;
>  
> +    if (ptr) {
> +        val = *ptr;
> +        goto out;
> +    }
> +
>      switch (offset0) {
>      case A_VCMDQ0_CONS_INDX:
>          val = cmdqv->vcmdq_cons_indx[index];
> @@ -142,7 +207,9 @@ static uint64_t tegra241_cmdqv_read_vcmdq_page0(Tegra241CMDQV *cmdqv,
>                        "%s unhandled read access at 0x%" PRIx64 "\n",
>                        __func__, offset0);
>      }
> +out:
>      trace_tegra241_cmdqv_read_vcmdq_page0(index, direct ? "direct" : "vi",
> +                                          ptr ? "hw" : "cache",
>                                            offset0, val);
>      return val;
>  }
> @@ -218,11 +285,31 @@ static uint64_t tegra241_cmdqv_config_vintf_read(Tegra241CMDQV *cmdqv,
>   *
>   * Page 0 registers are all 32-bit; this helper is only called for 4-byte
>   * writes.
> + *
> + * If the VCMDQ is allocated and the host VINTF page0 is mmap'd, write
> + * directly to the VINTF page0 backing. Otherwise, update the cache.
>   */
>  static void tegra241_cmdqv_write_vcmdq_page0(Tegra241CMDQV *cmdqv,
>                                               hwaddr offset0, int index,
>                                               uint32_t value, bool direct)
>  {
> +    uint32_t *ptr = tegra241_cmdqv_vintf_lvcmdq_ptr(cmdqv, index, offset0);
> +    bool hw = false;
> +
> +    if (ptr) {
> +        switch (offset0) {
> +        case A_VCMDQ0_CONS_INDX:
> +        case A_VCMDQ0_PROD_INDX:
> +        case A_VCMDQ0_CONFIG:
> +        case A_VCMDQ0_GERRORN:
> +            *ptr = value;
> +            hw = true;
> +            goto out;
> +        default:
> +            break;
> +        }
> +    }
> +
>      switch (offset0) {
>      case A_VCMDQ0_CONS_INDX:
>          cmdqv->vcmdq_cons_indx[index] = value;
> @@ -253,7 +340,9 @@ static void tegra241_cmdqv_write_vcmdq_page0(Tegra241CMDQV *cmdqv,
>                        "%s unhandled write access at 0x%" PRIx64 "\n",
>                        __func__, offset0);
>      }
> +out:
>      trace_tegra241_cmdqv_write_vcmdq_page0(index, direct ? "direct" : "vi",
> +                                           hw ? "hw" : "cache",
>                                             offset0, value);
>  }
>  
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 666967dc5e..a8dcbc82db 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -75,9 +75,9 @@ smmuv3_accel_install_ste(uint32_t vsid, const char * type, uint32_t hwpt_id) "vS
>  # tegra241-cmdqv
>  tegra241_cmdqv_read_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
>  tegra241_cmdqv_write_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
> -tegra241_cmdqv_read_vcmdq_page0(int index, const char *aperture, uint64_t offset0, uint64_t val) "vcmdq[%d] %s offset0: 0x%"PRIx64" val: 0x%"PRIx64
> +tegra241_cmdqv_read_vcmdq_page0(int index, const char *aperture, const char *backing, uint64_t offset0, uint64_t val) "vcmdq[%d] %s (%s) offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  tegra241_cmdqv_read_vcmdq_page1(int index, const char *aperture, uint64_t offset0, uint64_t val) "vcmdq[%d] %s offset0: 0x%"PRIx64" val: 0x%"PRIx64
> -tegra241_cmdqv_write_vcmdq_page0(int index, const char *aperture, uint64_t offset0, uint64_t val) "vcmdq[%d] %s offset0: 0x%"PRIx64" val: 0x%"PRIx64
> +tegra241_cmdqv_write_vcmdq_page0(int index, const char *aperture, const char *backing, uint64_t offset0, uint64_t val) "vcmdq[%d] %s (%s) offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  tegra241_cmdqv_write_vcmdq_page1(int index, const char *aperture, uint64_t offset0, uint64_t val) "vcmdq[%d] %s offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  
>  # strongarm.c


