Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECFBCD6E57
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 10:07:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wV4yI-0004PH-OJ; Thu, 04 Jun 2026 06:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wV4yH-0004Oi-Gx
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 06:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wV4yF-0000qF-Bn
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 06:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780567597;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3zH3TjmLzMxUJqyBdnhBWUE1GArYhlyaLnRetGQ/sQ=;
 b=cTDXsuTbNia754Z9UAc+GoC8DGAtDII5mdfTEsVM1XFCDAM6PQLOKMNisAwcLeXUyHT1Uv
 GX0ajVAFYQNJXRNpdQBs4V722G7MWf9NRWesZVelpCEdT3RPRIylr/I3Rpd/peFy3onju4
 4NoC/C+3NGPtDna2pfEoumROi1DT6dM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-z3L962QoOSK4SP0jVW4m4w-1; Thu, 04 Jun 2026 06:06:36 -0400
X-MC-Unique: z3L962QoOSK4SP0jVW4m4w-1
X-Mimecast-MFC-AGG-ID: z3L962QoOSK4SP0jVW4m4w_1780567595
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4601102c30dso325974f8f.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 03:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780567595; x=1781172395;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3zH3TjmLzMxUJqyBdnhBWUE1GArYhlyaLnRetGQ/sQ=;
 b=NMgZKDkCaYieQhURfqHrNSVQPFh/6G46HwHjkNfq5pH/b2EAPmEvDTA9z+z/MUW3CD
 jt5q0OcgwpDshCFXZGq6XizNv62UFP/jSleMcxgIIeBYh1SZ/CsuzdhbN8oXTh9ykyK+
 gS+3URlY4wRlPLFtUddTGl9g9tSV3VFk2Xj1/VrqvVsUVj694lJV1kJ2djnKNvC4GsYa
 vPaUCvE6mXN5IB8i4gwklzgStBHr3B8fumL+9E0jTpmlISiSE6NutmDiO2bZ+SgaVQ2x
 HCymnBKjYvxlr20SNCv6etTzkn+0PFMWg8zN3IBCvPxAgsHRtkKwewV7sfbS0/fSNIrm
 7TRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JsnFivb4i/VkDdTl/B16lVeg7myWQLeWC1k6OLmb4vsPS7xPSx96rIf1JIPjrI1DDPXwxXYrzog==@nongnu.org
X-Gm-Message-State: AOJu0YwVcKODkttkHHrSZE0IN9ExcGlcOQ8c29e8kd2d/ceSjDyvH9xg
 CeSE9SBWy/9QTO9ToyBXwxFV0F72IIswDQ+3fZ436X/ak0NCfqXAUr5ZNe2pHe8BY9Mijq7oSI8
 InSq06U0lRU5MuXt5u8x9y25EWkHYb2yisb2xzATFftMi5SDBEHQq2g==
X-Gm-Gg: Acq92OFXMMgu8uyp56qi4YrzL06bGIHDkTmTDkWWIwAURrnb7x1XjveVFX/tcAPklyE
 C8ffkV1JMrKTTvuRSarReUvsJ5PoGrkBB75xncrv15RPyQPd226Y4ERU6rm2xCzKxXHFg1idD3f
 qFkt7RFKTsf8J7aqbUaMWA/9lyf/NjrXZr4LoAZDxqV2rRAfAEIcVQL1/ywfumCoip+DUbANMaP
 meAAYdix2ThSYqdiT5vj89MrYz3liaWdGhJTUB2THfQsGbtauVoPH4AZ4ZdMWLCR3VO11vOFu0C
 gK8b4UOqh4OIDwfYuQ5iVp2P4imjtQO7I1VyzdkIbwOQomO0IC8TE56UI7nyGvuaaQvkk9D97WW
 1fFqMpq6/i/7SPbchVlrVT/6SDuZFRn5WyLzfRWsO7gvE2ePjM0K3WnsxsEC8OZfyrrwnvQLEJO
 rotma1
X-Received: by 2002:a05:6000:180a:b0:45e:d6b2:e6a5 with SMTP id
 ffacd0b85a97d-460218654afmr8464606f8f.34.1780567594734; 
 Thu, 04 Jun 2026 03:06:34 -0700 (PDT)
X-Received: by 2002:a05:6000:180a:b0:45e:d6b2:e6a5 with SMTP id
 ffacd0b85a97d-460218654afmr8464572f8f.34.1780567594356; 
 Thu, 04 Jun 2026 03:06:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm24939717f8f.27.2026.06.04.03.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 03:06:33 -0700 (PDT)
Message-ID: <aa1ce930-5ce9-48b5-9ece-6569b3d61f19@redhat.com>
Date: Thu, 4 Jun 2026 12:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/31] hw/arm/tegra241-cmdqv: Map VINTF page0 into
 guest MMIO space
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260601114221.457995-1-skolothumtho@nvidia.com>
 <20260601114221.457995-22-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260601114221.457995-22-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JHVw5YdfbQPRgU57_HQDj8gBy6hBYy1UUFAhHhC5QvY_1780567595
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

Hi Shammer,

On 6/1/26 1:42 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
I would disambiguate the title a little bit:
Use mmap'd host VINTF page0 for virtual VINTF page0

Also in previous patch titles you could emphase the mmap'd page is the
host one in a similar way.
>
> Install the mmap'd vintf_page0 region as a RAM-device MemoryRegion at
> guest MMIO offset 0x30000 (the VINTF Page 0 aperture) when VINTF is
> enabled, and remove it on VINTF disable. This eliminates QEMU
> trapping for hot-path CONS/PROD index updates via the VINTF aperture.
>
> After this patch, the two VCMDQ Page 0 apertures use different
> access paths: the direct aperture (0x10000) remains QEMU-trapped,
> while the VINTF aperture (0x30000) is a guest-direct RAM mapping.
>
> The direct aperture is intentionally kept trapped (not aliased to
> the VINTF mmap) so that writes to an unallocated VCMDQ remain
> well-defined. The CMDQV architecture allows software to program a
> VCMDQ through the direct aperture without first allocating it to a
> VINTF; aliasing would route those writes to unallocated logical
> slots in the VINTF page, where the hardware silently drops them.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h |  1 +
>  hw/arm/tegra241-cmdqv.c | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 84499b840d..01cd6af97d 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -49,6 +49,7 @@ typedef struct Tegra241CMDQV {
>      IOMMUFDVeventq *veventq;
>      IOMMUFDHWqueue *vcmdq[TEGRA241_CMDQV_MAX_CMDQ];
>      void *vintf_page0;
> +    MemoryRegion *mr_vintf_page0;
>  
>      /* CMDQ-V Config page register cache */
>      uint32_t config;
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index dce7089697..cdd4fa4f1a 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -18,6 +18,40 @@
>  #include "tegra241-cmdqv.h"
>  #include "trace.h"
>  
> +static void tegra241_cmdqv_guest_unmap_vintf_page0(Tegra241CMDQV *cmdqv)
> +{
> +    if (!cmdqv->mr_vintf_page0) {
> +        return;
> +    }
> +
> +    memory_region_del_subregion(&cmdqv->mmio_cmdqv, cmdqv->mr_vintf_page0);
> +    object_unparent(OBJECT(cmdqv->mr_vintf_page0));
> +    g_free(cmdqv->mr_vintf_page0);
> +    cmdqv->mr_vintf_page0 = NULL;
> +}
> +
> +static void tegra241_cmdqv_guest_map_vintf_page0(Tegra241CMDQV *cmdqv)
> +{
> +    char *name;
> +
> +    if (cmdqv->mr_vintf_page0) {
> +        return;
> +    }
> +
> +    name = g_strdup_printf("%s vintf-page0",
> +                           memory_region_name(&cmdqv->mmio_cmdqv));
> +    cmdqv->mr_vintf_page0 = g_malloc0(sizeof(*cmdqv->mr_vintf_page0));
> +    memory_region_init_ram_device_ptr(cmdqv->mr_vintf_page0,
> +                                      memory_region_owner(&cmdqv->mmio_cmdqv),
> +                                      name, VINTF_PAGE_SIZE,
> +                                      cmdqv->vintf_page0);
> +    memory_region_set_skip_iommu_map(cmdqv->mr_vintf_page0, true);
> +    memory_region_add_subregion_overlap(&cmdqv->mmio_cmdqv,
> +                                        CMDQV_VINTF_PAGE0_BASE,
> +                                        cmdqv->mr_vintf_page0, 1);
> +    g_free(name);
> +}
> +
>  static void tegra241_cmdqv_free_vcmdq(Tegra241CMDQV *cmdqv, int index)
>  {
>      IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
> @@ -445,6 +479,7 @@ static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>          if (value & R_VINTF0_CONFIG_ENABLE_MASK) {
>              if (tegra241_cmdqv_mmap_vintf_page0(cmdqv, errp)) {
>                  cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
> +                tegra241_cmdqv_guest_map_vintf_page0(cmdqv);
don't you want to do that only after the tegra241_cmdqv_setup_all_vcmdq()?
>                  /*
>                   * VCMDQs whose BASE was programmed before VINTF was
>                   * enabled need their hw_queue allocated now.
> @@ -452,6 +487,7 @@ static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>                  tegra241_cmdqv_setup_all_vcmdq(cmdqv, errp);
>              }
>          } else {
> +            tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>              tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
Thanks

Eric


