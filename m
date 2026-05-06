Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E13CD342C
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 12:45:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKbcj-0002Jn-De; Wed, 06 May 2026 08:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKbcf-0002EY-6b
 for qemu-arm@nongnu.org; Wed, 06 May 2026 08:45:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKbcc-0005gt-KH
 for qemu-arm@nongnu.org; Wed, 06 May 2026 08:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778071501;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2zUJRp5isIzC4I+U9uuUTm0bVtshQuzDJK0Ti/Oc0g=;
 b=Ipl6G2uZPqqXlpRlGuZnhfR739DrtTyyifRLy9QRX+gJKyYwbIsnbWumS08kImlpSIV1qU
 UNgcooWJa0W4BWU+ELADMpUxuE3Krqg2cNLQIBWU23DNbkoVWCq7bazBqkx/+Ll43X/DYq
 783IHd3p2HJfDtsAL927T+bWfNpalz4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-GWI0J6V7MTC-xmaWo_TZkA-1; Wed, 06 May 2026 08:45:00 -0400
X-MC-Unique: GWI0J6V7MTC-xmaWo_TZkA-1
X-Mimecast-MFC-AGG-ID: GWI0J6V7MTC-xmaWo_TZkA_1778071499
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-488c0fcc6deso37064315e9.2
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 05:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778071499; x=1778676299;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2zUJRp5isIzC4I+U9uuUTm0bVtshQuzDJK0Ti/Oc0g=;
 b=YPw0V7FHTF6pzB80rbBFj/l9ED81XqYyiBGatipxmVG/Rl+exy8D4FJKn7JDEfOh6G
 uNA0yEIM44HgWl2hg47ibA5gMFefnRRs1QY1FPK2sZJ6boo+SDih3WJpoIZQ+X9FC+jl
 oP0/6J5L0hTinFNan1ofjE/Ts66BSp9EBhbyXIh7DORSZZzvAEwPiuK4uoloQxb8QNrZ
 ZLSnohidyuNBMlYSwMl2VDLJqrURxi3S+NV4SCqh31NrKYG4BTCAWhKhVSBOx3XYCUny
 n8qTA0AR7nXeVJTrOGchIOL9wXHCuXp37fGdup1D7nP8Go0ZhsQtnsF9LJ+msCpc+gSt
 IJFA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/OO2S9AopVAINeKBJfXY8r7Bll5pwv3tftCjLsiBedI2ucrn5tOsw4jiOswdC7MM6eu6Ki8FGZGA==@nongnu.org
X-Gm-Message-State: AOJu0YwUj4tGjDEBIHvoS/IxWA0iT5C8+Zd1cb1/FlrIhZgNiUg2wLY/
 bk/lLqnepcEfldFa0GeWCgeDqqbqmALXbUOfGMmzVjmdAJ8n+gPtOvDxqkBqnDQoyyeF3dyQfV7
 qfbh4TYFvWEK/lfYXIVubLRnajcMILy4UU4vFg5YWsi8s2ik49zNjgA==
X-Gm-Gg: AeBDieujJB9aMjR2gUejx1Cp+cPMdxIU+jYnSUeHPQwbTznDkbZoAIURdGYwqFs0Rm7
 jeO4DjYLFsjvNGP+iqwmTSbcubun+F4aLDzQeEx6+Zu4taFPTzt5nyl3heLIsVpuw9d92Eiatsd
 526gnCjGfhRUyKUooo/92Xy2CnNwW9Ei+mjct1V4BrIM56BocOc+9mnHjVgpRK6JirGHID1RO+6
 NHsUKaRyj8IAlln2VQVcK+vNxgKQBAbu1X+EdVF6qJe47uyykgrTZRk7nBx4bSPEpbAfP8UHXhB
 C9niSnhtNW7MhkJpYV3TY1M2Ep1nJIYTTEuec9wU1XX31r9CoFa7ty+VlB14SNl7rm2aouy0L/W
 sESBAu3yGA1g0FRDmbI/KdaDlrgZnmBEnauz06yNMLEfN0PBR6nU0NfPsZqwTo0wSEroJzgJL9I
 yuVugV
X-Received: by 2002:a05:600c:8b0c:b0:48a:7a10:4f47 with SMTP id
 5b1f17b1804b1-48e51e0a620mr60627865e9.3.1778071499000; 
 Wed, 06 May 2026 05:44:59 -0700 (PDT)
X-Received: by 2002:a05:600c:8b0c:b0:48a:7a10:4f47 with SMTP id
 5b1f17b1804b1-48e51e0a620mr60627415e9.3.1778071498627; 
 Wed, 06 May 2026 05:44:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538fad5fsm50164865e9.10.2026.05.06.05.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 05:44:58 -0700 (PDT)
Message-ID: <4918654a-7c79-474b-9ede-5418460a5a76@redhat.com>
Date: Wed, 6 May 2026 14:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/31] hw/arm/tegra241-cmdqv: Map VINTF page0 into
 guest MMIO space
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-23-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-23-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mb51A4TjxqAr0B6LFu19p50r74ejb4PtCJFIoGwfhHY_1778071499
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

On 4/15/26 12:55 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Once a VCMDQ is allocated, map the mmap'd vintf_page0 region directly
> into the guest-visible MMIO space at offset 0x30000 as a RAM-backed
> MemoryRegion. This eliminates QEMU trapping for hot-path CONS/PROD
> index updates.
>
> After this patch, the two VCMDQ apertures use different access paths:
> the direct aperture (0x10000) remains QEMU-trapped and writes via
> vintf_ptr, while the VI aperture (0x30000) is a direct guest RAM
> mapping. Both paths write to the same underlying vintf_page0 memory,
> so no synchronisation between the apertures is needed.

I fail to understand when the previous trapped path using ptr in
tegra241_cmdqv_read/write_vcmdq gets used versus that path. Is it
eventually used?
>
> The mapping is installed lazily on first successful VCMDQ hardware
> queue allocation and removed when CMDQV or VINTF is disabled.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h |  1 +
>  hw/arm/tegra241-cmdqv.c | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 039d86374f..2befa6205e 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -46,6 +46,7 @@ typedef struct Tegra241CMDQV {
>      IOMMUFDVeventq *veventq;
>      IOMMUFDHWqueue *vcmdq[TEGRA241_CMDQV_MAX_CMDQ];
>      void *vintf_page0;
> +    MemoryRegion *mr_vintf_page0;
>  
>      /* Register Cache */
>      uint32_t config;
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index eb619e1134..bf989dd51f 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -15,6 +15,40 @@
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
> +    cmdqv->mr_vintf_page0->ram_device_skip_iommu_map = true;
I guess you need a setter, here to.
> +    memory_region_add_subregion_overlap(&cmdqv->mmio_cmdqv,
> +                                        CMDQV_VINTF_PAGE0_BASE,
> +                                        cmdqv->mr_vintf_page0, 1);
> +    g_free(name);
> +}
> +
>  static void tegra241_cmdqv_free_vcmdq(Tegra241CMDQV *cmdqv, int index)
>  {
>      IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
> @@ -72,6 +106,7 @@ static bool tegra241_cmdqv_setup_vcmdq(Tegra241CMDQV *cmdqv, int index,
>      hw_queue->viommu = viommu;
>      cmdqv->vcmdq[index] = hw_queue;
>  
> +    tegra241_cmdqv_guest_map_vintf_page0(cmdqv);
>      return true;
>  }
>  
> @@ -312,6 +347,7 @@ static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>                  cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
>              }
>          } else {
> +            tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>              tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
> @@ -438,6 +474,7 @@ static void tegra241_cmdqv_write_mmio(void *opaque, hwaddr offset,
>          if (value & R_CONFIG_CMDQV_EN_MASK) {
>              cmdqv->status |= R_STATUS_CMDQV_ENABLED_MASK;
>          } else {
> +            tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>              tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              cmdqv->status &= ~R_STATUS_CMDQV_ENABLED_MASK;
>          }
Thanks

Eric


