Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8120DE99050
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 07:57:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB6ja-0005yp-Qb; Fri, 10 Apr 2026 03:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6jZ-0005yG-Bi
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:56:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6jX-0004Tz-HU
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775807814;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1g0itLpK4atu/TRh/SFG6m5vAPx388SgzqIeaV3NV0=;
 b=KzpFCHO+JWnY5TI4RWoPWi3LIfnT+5ZoZ4S9KwB14wZaAnYTeds8T0tn6orvkLXuc9JHaS
 FSZvzhyowhhmFiG4t51u6y4U/bY/VDnqKDl13N3gmzfx4hSTu6vAayhj73aG/m7X5whAe/
 9bQCWUT67k5o9bCzRoDzzIyJ+Re6tQY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-xJQ7fXC1PHK8NPt3GeohtQ-1; Fri, 10 Apr 2026 03:56:51 -0400
X-MC-Unique: xJQ7fXC1PHK8NPt3GeohtQ-1
X-Mimecast-MFC-AGG-ID: xJQ7fXC1PHK8NPt3GeohtQ_1775807810
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-488c2a4e257so12473185e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 00:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775807810; x=1776412610;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1g0itLpK4atu/TRh/SFG6m5vAPx388SgzqIeaV3NV0=;
 b=OftrJ+DJQNBe/YQsuKH1Zyy76NzYWCRgxfbrfFjYwofeUBdyHSlVfLeSUVbEWnnp0v
 8ICP8I66WNEWcD01U9tlKgL1njGK+dBrI53U52whsSKYhbtiBlKK9mJsoOHfDHe+E+G1
 4S4fhfl/XBYMkvSjjGbbnIPRkPOLpG/nDFqh2+8QncdxJW5NH15NvesLms0HLYUrpC0h
 FuyGciiK031MvmeUDNAvAXBV0WppjgTVUNbVACIoSoTEgWXfRbj5jBx8MAMY3okgAiJE
 FQK7Q5luCIbuc9wGL3tdXwnDZV6sh6qOUzkMBjLmmfDQ0K/iHSzq+XAnDx0ZjN4aQrXf
 cRtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuwSj+crheuA+Csws7dBUDceCf7rzBx8KaRqMYutBsJ53FRed4UeNfv8dyrHbNzcxZh/EionzX8w==@nongnu.org
X-Gm-Message-State: AOJu0YzWIxyfBqAtkF0Yb4sAljTde1D0oQl2mC00+3euUDziFf2zCHZ6
 718CqXxax51L/CGfd1xac+AlKqqirG/zmIA4S19Fh/ppAxBdIMlpGc4QcZIzdc7b2Lr3jff//Yn
 2giNdJrEz9drzcar6vEJ6+ugPIPA7+YAfaf1kCoOKczW5ApROVKE1yA==
X-Gm-Gg: AeBDiesUvU3TguSFMMBRUQTb4LqYzYMVpndT0uc5WpdsKqjQnZNnhGi7lVshoisW9pm
 gT3Jdf3O/R9gyIDMtzzgqy6tHEUkgAd9ALGgDXI/h+VIH5BQrTalI3lWjIFEhUplDyquNysb8ZR
 XBsT/UhwXY0bbXR2U5+ahlVP3GzHXlQ18Sj8oMrdPjeEPMBYUKOPpLpw9gL3oMXAIUiGIxbtLZy
 kNbajtuPXrdCK8u4qFPGLC0r6rowY2E4ABPzozUuhqXz6j72MjTSBXlBzurR3d0c3CuWCb9ZLFL
 wgVvVM+QuzQhi11U1tOKrO8B9782Ornv5uzcKYG+GAeujjp8Be1p0NUH0OgXK1woJDeEmdh/K4O
 wZY5WQk2SIPy8IQLJD5gvK3zwNEhMxavAXXyAOPTwBnOJMhjDklhHQGR6y2g5BzEzobAkNg==
X-Received: by 2002:a05:600c:8907:b0:485:445a:87d1 with SMTP id
 5b1f17b1804b1-488d67d2cc5mr16436055e9.8.1775807810243; 
 Fri, 10 Apr 2026 00:56:50 -0700 (PDT)
X-Received: by 2002:a05:600c:8907:b0:485:445a:87d1 with SMTP id
 5b1f17b1804b1-488d67d2cc5mr16435775e9.8.1775807809783; 
 Fri, 10 Apr 2026 00:56:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d681ed50sm14465405e9.15.2026.04.10.00.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 00:56:49 -0700 (PDT)
Message-ID: <24339c4e-0654-445e-8ed4-bbe192c83523@redhat.com>
Date: Fri, 10 Apr 2026 09:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] hw/arm/smmuv3-accel: Implement "auto" value for
 "ssidsize"
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20260401010231.4166776-1-nathanc@nvidia.com>
 <20260401010231.4166776-8-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260401010231.4166776-8-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r--PdgZgS_tAOBXIlAPM-6GGnJC39U4Spv47gct9eUw_1775807810
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 4/1/26 3:02 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Allow accelerated SMMUv3 SSID size property to be derived from host
> IOMMU capabilities. Derive host values using IOMMU_GET_HW_INFO,
> retrieving SSID size from IDR1. When the auto SSID size is resolved
> to a non-zero value, PASID capability is advertised to the vIOMMU
> and accelerated use cases such as Shared Virtual Addressing (SVA)
> are supported.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 14 ++++++++++++--
>  hw/arm/smmuv3.c       | 11 +++++------
>  2 files changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 9e7ec6a930..03393fd7ba 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -56,6 +56,13 @@ static void smmuv3_accel_auto_finalise(SMMUv3State *s,
>                                 FIELD_EX32(info->idr[3], IDR3, RIL));
>      }
>  
> +    /* Update SSIDSIZE if auto from info */
> +    if (s->ssidsize == SSID_SIZE_MODE_AUTO) {
> +        /* Store for get_viommu_flags() to determine PASID support */
> +        s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SSIDSIZE,
> +                               FIELD_EX32(info->idr[1], IDR1, SSIDSIZE));
> +    }
> +
>      accel->auto_finalised = true;
>  }
>  
> @@ -828,7 +835,9 @@ static uint64_t smmuv3_accel_get_viommu_flags(void *opaque)
>      SMMUState *bs = opaque;
>      SMMUv3State *s = ARM_SMMUV3(bs);
>  
> -    if (s->ssidsize > SSID_SIZE_MODE_0) {
> +    if (s->ssidsize > SSID_SIZE_MODE_0 ||
> +        (s->ssidsize == SSID_SIZE_MODE_AUTO &&
maybe worth adding a short static inline helper pasid_is_supported(s)?

Eric
> +         FIELD_EX32(s->idr[1], IDR1, SSIDSIZE))) {
>          flags |= VIOMMU_FLAG_PASID_SUPPORTED;
>      }
>      return flags;
> @@ -952,7 +961,8 @@ void smmuv3_accel_init(SMMUv3State *s)
>      smmuv3_accel_as_init(s);
>  
>      if (s->ats == ON_OFF_AUTO_AUTO ||
> -        s->ril == ON_OFF_AUTO_AUTO) {
> +        s->ril == ON_OFF_AUTO_AUTO ||
> +        s->ssidsize == SSID_SIZE_MODE_AUTO) {
>          s->s_accel->auto_mode = true;
>      }
>  }
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 74cc81ae32..67c499d22b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -627,7 +627,10 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>      }
>  
>      /* Multiple context descriptors require SubstreamID support */
> -    if (s->ssidsize == SSID_SIZE_MODE_0 && STE_S1CDMAX(ste) != 0) {
> +    if ((s->ssidsize == SSID_SIZE_MODE_0 ||
> +         (s->ssidsize == SSID_SIZE_MODE_AUTO &&
> +          !FIELD_EX32(s->idr[1], IDR1, SSIDSIZE))) &&
> +        STE_S1CDMAX(ste) != 0) {
>          qemu_log_mask(LOG_UNIMP,
>                  "SMMUv3: multiple S1 context descriptors require SubstreamID support. "
>                  "Configure ssidsize > 0 (requires accel=on)\n");
> @@ -1973,10 +1976,6 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>      }
>  #endif
>  
> -    if (s->ssidsize == SSID_SIZE_MODE_AUTO) {
> -        error_setg(errp, "ssidsize auto mode is not supported");
> -        return false;
> -    }
>      if (s->oas != OAS_MODE_44 && s->oas != OAS_MODE_48) {
>          error_setg(errp, "QEMU SMMUv3 model only implements 44 and 48 bit"
>                     "OAS; other OasMode values are not supported");
> @@ -2197,7 +2196,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "A value of N allows SSIDs in the range [0 .. 2^N - 1]. "
>          "Valid range is 0-20, where 0 disables SubstreamID support. "
>          "Defaults to 0. A value greater than 0 is required to enable "
> -        "PASID support. ssidsize=auto is not supported.");
> +        "PASID support.");
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,


