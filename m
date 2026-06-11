Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92E4CD98CE
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 15:21:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXhDL-0001rV-3Q; Thu, 11 Jun 2026 11:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wXhDJ-0001qu-RJ
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wXhDI-0000ck-5l
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781191259;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Fz4ngEemTfRX43QTNklXVbKpAIdwdzZW3sogLDWlgw=;
 b=BquFQGHOSRNVLllKXQNZYC+of4fM2tYxKrrA9gSgKy6YHgXnbmir3xgdlJiE/EvyHLTQqH
 d9SkPXUxUD7IedNZAasxc6KZNBX97qV5OjDEU9OXeN5v37f3bcKvBmOuwxNKdWxzsQE9nA
 qDfsZ7cB4sl2ofu6PcsnsZtMCEOji+s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-JNEJILQXNzirtZos1GidrQ-1; Thu, 11 Jun 2026 11:20:57 -0400
X-MC-Unique: JNEJILQXNzirtZos1GidrQ-1
X-Mimecast-MFC-AGG-ID: JNEJILQXNzirtZos1GidrQ_1781191256
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490a767c7dcso65179885e9.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 08:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781191256; x=1781796056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Fz4ngEemTfRX43QTNklXVbKpAIdwdzZW3sogLDWlgw=;
 b=ZKdf0hsdn1UIs91X1DaP6JMKZopk9oeByOLoU2G+p7ASzgeJk0OwROAnPA7X3g3W/0
 aQlak7Icvj+yVOdpqkbgT8PeSriXp7qDQnWOoLUJVIYsNoK/X1gvN+xyvp8UxkskGubJ
 3HJVJeviEpzyjQW8NFtsLplfue8A7bJxYBroCumuuVR5C5p7demoiAwZLMDh0ZIwRW9S
 GIo7LCthQJaJkZ5BXD1Aj7LgG3COjwa2krI+nmP6dn+pM3oCiXN51YCYye8xFF+h1/o5
 e25bmax2AN+EkB8YYucW+Wd19gxD4AVCdiNNKllBa7B+B4j0kpbTfV+Pd80+HpjiJuQ5
 uPJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zUPTeniCsWdGrGoANW0OUDOlfih7S6imSqn/JQcvF2c9r8hclFCllT1STI0Mq/oPAQYKcqJD+Zw==@nongnu.org
X-Gm-Message-State: AOJu0YyqeWe/gcgqRVzPtNXtDRHgSlcSiPjH76xzE7bBKHK2AxuRIryY
 u83VPb6hzVagOhlNahEAmBXLljrUG3CgwMDsv3UVNTwmaZpRsqAHi3q8gZymA+R9MWSX3J3iaeZ
 BvJz6SUdUXog4dXJ3JI1Bb1u09NujQmzbHuotrP8/on/a12X86uumXA==
X-Gm-Gg: Acq92OGZjWmpsXRGJxFMJfh6CmCbjNxEESHa1qb6aGfj4sLM/V9Aph3qm+EFaM9zsRP
 k8AEmBo8TPBIGJJvnFhkK9WLw7wXeiHe6LTi/H7PH0G1eZwKamm9xIKA+b7woalZnqR+0WD9Thc
 9XPUEuwQ0RKwYhHgyw+8BiKtRiQfWDleq1CY7fYTnFHyOl6oaI4dfRoh8ga+3MXGHPTfJ/31RSr
 u0VVEmi+YtVmo4bEdl6I17VIZrUwzCv0tGGndDx7mZrTxv3vfTPMMfKvyOQ9/nA6baA+ivnhOe2
 rm+Z/19SYWfoFbiiqKnQdJEyWjyoc1/XSKp7S7l8Hg/6T3/1snO/z/+83Jk2Vsn8f8a98gsW6uZ
 el9nnL0M7nW7lT0JPtR2hZucjGat3JfzlwUKsR6l9fXqC7vfFogB1DAEjmDzPF+KpPtuM5tpgYx
 lF5064
X-Received: by 2002:a05:600c:a386:b0:490:b591:b5a3 with SMTP id
 5b1f17b1804b1-490e5619b45mr27877135e9.32.1781191255702; 
 Thu, 11 Jun 2026 08:20:55 -0700 (PDT)
X-Received: by 2002:a05:600c:a386:b0:490:b591:b5a3 with SMTP id
 5b1f17b1804b1-490e5619b45mr27876705e9.32.1781191255281; 
 Thu, 11 Jun 2026 08:20:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2ca21f4sm72817225e9.7.2026.06.11.08.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 08:20:54 -0700 (PDT)
Message-ID: <69634184-c265-4cba-9e0e-49e383df7d71@redhat.com>
Date: Thu, 11 Jun 2026 17:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 21/31] hw/arm/tegra241-cmdqv: Use mmap'd host VINTF
 page0 for virtual VINTF page0
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260609112552.378999-1-skolothumtho@nvidia.com>
 <20260609112552.378999-22-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260609112552.378999-22-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2WcPPvuGF0ghaxGqu91lmCT4OoXJ18FIldeBeh_2WZE_1781191256
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



On 6/9/26 1:25 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Install the mmap'd host VINTF page0 as a RAM-device MemoryRegion
> backing the guest's virtual VINTF Page 0 aperture (guest MMIO offset
> 0x30000) when VINTF is enabled, and remove it on VINTF disable or
> reset. This eliminates QEMU trapping for hot-path CONS/PROD index
> updates via that aperture.
>
> After this patch, the two VCMDQ Page 0 apertures use different
> access paths: the direct aperture (0x10000) remains QEMU-trapped,
> while the VINTF aperture (0x30000) is a guest-direct RAM mapping.
>
> The direct aperture is intentionally kept trapped (not aliased to
> the host VINTF mmap) so that writes to an unallocated VCMDQ remain
> well-defined. The CMDQV architecture allows software to program a
> VCMDQ through the direct aperture without first allocating it to a
> VINTF; aliasing would route those writes to unallocated logical
> slots in the VINTF page, where the hardware silently drops them.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/tegra241-cmdqv.h |  1 +
>  hw/arm/tegra241-cmdqv.c | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
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
> index 63fe0ac681..7264b4bfa9 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -26,6 +26,40 @@ static void tegra241_cmdqv_reset_vcmdq_cache(Tegra241CMDQV *cmdqv, int index)
>      cmdqv->vcmdq_gerrorn[index] = 0;
>  }
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
> @@ -430,7 +464,9 @@ static void tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>               * enabled need their hw_queue allocated now.
>               */
>              tegra241_cmdqv_setup_all_vcmdq(cmdqv, errp);
> +            tegra241_cmdqv_guest_map_vintf_page0(cmdqv);
>          } else {
> +            tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>              tegra241_cmdqv_free_all_vcmdq(cmdqv);
>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
>          }
> @@ -772,6 +808,7 @@ static void tegra241_cmdqv_reset(SMMUv3State *s)
>          return;
>      }
>  
> +    tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>      tegra241_cmdqv_free_all_vcmdq(cmdqv);
>  }
>  


