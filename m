Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422EFCD5BB4
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:54:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3pW-0005fK-Q8; Thu, 21 May 2026 09:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wQ3pO-0005Bc-4k
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wQ3pL-0006fe-Tp
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779371563;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7ul/ogmZIh7TnpXpCqXxFeP5s/7MMeW5pcW9MA+YzU=;
 b=ThPXU/BTl0wlOnDu1AehkzNWyjZlF8GOR1/hkeee3dSf7QePqPD5reLoF/jlijw9jawqzp
 uUzZqTBF4SpmR20TvPOcsyVvuVLVRBYXv8vraUTE/zd0TO4vA1xAjAMInLofMUbsQeEYmm
 5OiIOuUBU9/YY+IbxnaIDya5n6ti1bA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-72dnkWCSNbqwWEmqQXccyw-1; Thu, 21 May 2026 09:52:35 -0400
X-MC-Unique: 72dnkWCSNbqwWEmqQXccyw-1
X-Mimecast-MFC-AGG-ID: 72dnkWCSNbqwWEmqQXccyw_1779371554
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48feb8b9acfso36970725e9.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779371554; x=1779976354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7ul/ogmZIh7TnpXpCqXxFeP5s/7MMeW5pcW9MA+YzU=;
 b=iFvnpLcoGB0aNtXIBt2GTzOy8BmSRv8FUO3yqe03Y1oRhWV1o2E+wJWLDQIRTXWHzV
 6jZ6gXg/5HjyV91iZkyn5tbgC6yuL3ZPL10Ne0VsWHOyCoLfjLZ7JuNbFPbfGvOZXfPZ
 LXBbRpDwUjQ0M5wxd7ibruKG0t+rJL05muFHRFCvogHrmdxRe5NxP2Wmwf+NzAC1gLT+
 dv+VkeJMAV4xfGRZX4iqk7BOVMbGYq1id2D2unu0vUL6mMwmCKwfSkuzYc7BD9NRJr5T
 9cQwlylr6H4spZ3vnl5nDGLL1bTToeIAmWOSwH/S0G5en/Zlkdjn1Rl2dOX6jy2gvavw
 PFAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9vZMMlbGKMdbWkKv4vFgEywolWyLH12V7g5KPKEIArb0zcNpkSsjeunV+VEeuGSto5h0/RUWNnbg==@nongnu.org
X-Gm-Message-State: AOJu0YwU1OEnysbjSD7FldFvguSmOKCmD45a7ejxoOLL/QKKhOLTymoK
 +jWMYIl6+xQX570BZxEneF9UhJadMZE8YXVqW9kxralsEJfjueb9k+DjQwBCb1zI+vDtfs2QZj6
 A3OLMfN0D3zH9Q4pWDhyF3xuXNnc1Kp6g4c7VnCTOQQQ6HU8UB+6QMw==
X-Gm-Gg: Acq92OGZ1rMI0YGoaZEPry2zq+E7633p8csOALwUBODuzQ4gukSdGdv3RdznFzAtZhE
 8H2CF8UqRAt2dwA9LKHk9DIL4Ee3tKlNZ2yPLguOvcLVlQ87QYO8tJON0rCqk6f7mFvCBxQe2lS
 QvPVMTF3xVHcbnZfZm2M0iYKf1syu2zpcA7tcIGOU8R6LgIvd6xM96i1JH4p08fJZJ5r3wIu7FO
 CLa/Arrl0spa43mhs88fr1//+3tTy9aVbD1SG+yuAjTKJvelrZNuNABSK4yyAP6WuyemBGG92FT
 oztKFjfMi3nukCV0uXXWDMV9TW2ykpPRpO6xK6p+2ThBPeVGUDJhzt/0ltsmAbhpvjd06dj6enk
 X5bxGGPN/0scmSVzobUKqJO9nmlIpZ3kVkKXmInpN1I+hihKrN0hg5UmbUQhuZ/F/UAd8VQ==
X-Received: by 2002:a05:600c:848d:b0:48e:60a3:220a with SMTP id
 5b1f17b1804b1-49035fbac92mr43316515e9.0.1779371554445; 
 Thu, 21 May 2026 06:52:34 -0700 (PDT)
X-Received: by 2002:a05:600c:848d:b0:48e:60a3:220a with SMTP id
 5b1f17b1804b1-49035fbac92mr43316125e9.0.1779371554032; 
 Thu, 21 May 2026 06:52:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903cadc119sm22835675e9.11.2026.05.21.06.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 06:52:33 -0700 (PDT)
Message-ID: <2cfef4ff-6eca-4915-8d41-8d43139cea31@redhat.com>
Date: Thu, 21 May 2026 15:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/32] hw/arm/tegra241-cmdqv: Map VINTF page0 into
 guest MMIO space
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-23-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-23-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eYGjbATgpC6yQyYdW_23lMF3p7zlwbpo0bWRj8iOJls_1779371554
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
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



On 5/19/26 12:37 PM, Shameer Kolothum wrote:
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

Please further explain the rationale of having 2 separate paths

Eric
>
> The mapping is installed lazily on first successful VCMDQ hardware
> queue allocation and removed when CMDQV or VINTF is disabled.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h |  1 +
>  hw/arm/tegra241-cmdqv.c | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 7a8cb2ebc7..e9e1933a19 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -47,6 +47,7 @@ typedef struct Tegra241CMDQV {
>      IOMMUFDVeventq *veventq;
>      IOMMUFDHWqueue *vcmdq[TEGRA241_CMDQV_MAX_CMDQ];
>      void *vintf_page0;
> +    MemoryRegion *mr_vintf_page0;
>  
>      /* CMDQ-V Config page register cache */
>      uint32_t config;
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index a7e89905df..853c548e58 100644
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
> @@ -130,6 +164,9 @@ static bool tegra241_cmdqv_setup_vcmdq(Tegra241CMDQV *cmdqv, int index,
>      /* Pre-alloc cached writes survive the cache-to-hardware transition. */
>      tegra241_cmdqv_sync_vcmdq(cmdqv, index);
>  
> +    /* Map the mmap'd VINTF page0 into guest MMIO space. */
> +    tegra241_cmdqv_guest_map_vintf_page0(cmdqv);
> +
>      return true;
>  }
>  
> @@ -449,6 +486,7 @@ static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>                  tegra241_cmdqv_setup_all_vcmdq(cmdqv, errp);

I would rather put the     tegra241_cmdqv_guest_map_vintf_page0(cmdqv) here 
to have symetric map/unmap
>              }
>          } else {
> +            tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>              tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
> @@ -566,6 +604,7 @@ static void tegra241_cmdqv_writel_mmio(Tegra241CMDQV *cmdqv, hwaddr offset,
>               */
>              tegra241_cmdqv_setup_all_vcmdq(cmdqv, &local_err);
same
>          } else {
> +            tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>              tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              cmdqv->status &= ~R_STATUS_CMDQV_ENABLED_MASK;
>          }
Thanks

Eric


