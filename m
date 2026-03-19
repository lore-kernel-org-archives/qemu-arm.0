Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA28F107528B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 09:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w39zq-0004Gd-8i; Thu, 19 Mar 2026 05:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w39zp-0004GN-4U
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 05:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w39zm-00016p-2X
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 05:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773913729;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvRD7qX3wQuJguX+Hjh1sKCt4jCJ/X8G5U+c2IIo/DU=;
 b=DDi4efkjB/AJhEDAvgXNbb20UIHX4t94b4slYosvJKhANLrtfWfaVa6R9D2P6YjbGQ10WG
 bCfmUcAlfLYqj3BQrOCSRAkHW3F7BOS4+GgIB8rmIgqC6VrFzV+R4GEkelvhxitl6Sd1tT
 DphVfJXb4Ufm66bC8cp5LNT1fmyh6Ug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-doqrspmXN-u0WQxdY9W_8g-1; Thu, 19 Mar 2026 05:48:47 -0400
X-MC-Unique: doqrspmXN-u0WQxdY9W_8g-1
X-Mimecast-MFC-AGG-ID: doqrspmXN-u0WQxdY9W_8g_1773913726
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43b53023d60so397464f8f.2
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 02:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773913726; x=1774518526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvRD7qX3wQuJguX+Hjh1sKCt4jCJ/X8G5U+c2IIo/DU=;
 b=H34a9g4fPwmB+mxPOwRqpb02FD0uaEo+CYs1pN/5hmuYuWmca7cYyesQk1xvJYuj2D
 Db6h+qS+uqzgbqdZFxxiOIJvzTeLCtjOKnkZlNzYQc3sAeSSEE/JLADOerufNAztTz/f
 gr2jrcfla9c4WhB248K9vqVOo+c5ccjexsFAn2//bEpNa9zYKMbhEZ7HJX+gAiZfWApR
 GdmPMjKlP6EFTdyyOKon5HCG6WvjhtyF5ZxsUO30FDMJhuOaVmpg+QzeAq1Eo8j1ycZ3
 Rqt6B1GkrNCaoMGYlgbDG3zw//9o2JOgY5EM/v96C9A2+DWQKcqFgXbXBQd51NiSqulX
 MTUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq0Xw/pUiLRJCbVPYxvbY5KJJoSlVbK4L7hcKmccrpcwfeztUq4X2lV7YID9ksreXuVtOhqZ1Z/g==@nongnu.org
X-Gm-Message-State: AOJu0Yyb8ieDt0C9T/qASfoRZAxq5CPMwCKVcdOllgpUEbUtmRFVtFTM
 ZXoeyustAH/uErzd5H1NFADusabQumWWp/8FD4Re6HjpMat1UXzX7gMqMZpjBJHmg2Ak/GBExXt
 lO04vYBWuhYn+Ky5D7L1bR4SKzpxoxoBOK8GTzKViCjtlQOFw1AuxBA==
X-Gm-Gg: ATEYQzzYjrVEg/AhhUQhE+YwSIvfFaMkBS6mZ21NQlNrN7IBkWII+wgkXbPRY71sVS6
 1GN/SxsRphkb4q1AeLcD8iZySX4Bba9GFSH/knvzGfPL0aFe/H4g7GxN8s5F0LubulFp/kExfDy
 lBCT/oVS8PnOycTls5cs4DEo/WvYdUNw4HKyRrhWzibVgQPmOhSE2NnlhQWciHT5K1nTAoh94WF
 M2FFdcNzmqZB9GlZD/FRjqDekZdxM2+JhcqczDMXq8tsZlovnkt0UyOUZGdPcJB0GV4+7NSflT8
 RBZMc97IhoWfXeNR9JnuV0/BddQ0wnFNp06qcGwwUNwcdVgma+71Gie9yuO4oy3KnK2DkLreV9U
 OOP/T1/VYBo9Y9Cw00Nn2vH9aCMKHq77140WheWyRObTS56n8VjF4ptoEZ8Uqhc+vj3Lmow==
X-Received: by 2002:a5d:584b:0:b0:43b:4077:c187 with SMTP id
 ffacd0b85a97d-43b527c567emr11194916f8f.38.1773913726054; 
 Thu, 19 Mar 2026 02:48:46 -0700 (PDT)
X-Received: by 2002:a5d:584b:0:b0:43b:4077:c187 with SMTP id
 ffacd0b85a97d-43b527c567emr11194856f8f.38.1773913725562; 
 Thu, 19 Mar 2026 02:48:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b518495aasm15023810f8f.3.2026.03.19.02.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 02:48:45 -0700 (PDT)
Message-ID: <76884b63-3129-4414-8c0a-5a96c2d8ebc7@redhat.com>
Date: Thu, 19 Mar 2026 10:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] hw/arm/smmuv3-accel: Change SSIDSIZE property to
 SsidSizeMode
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260318184907.4060030-1-nathanc@nvidia.com>
 <20260318184907.4060030-6-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260318184907.4060030-6-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MoPdw6rgYg1Dj-gg8sosxXMGVb2mRpvtBS0bwHb_djo_1773913726
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 3/18/26 7:49 PM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Change accel SMMUv3 SSIDSIZE property from uint8_t to SsidSizeMode.
> The 'auto' value is not implemented, as this commit is meant to set the
> property to the correct type and avoid breaking JSON/QMP when the auto
> mode is introduced. A future patch will implement resolution of 'auto'
> value to match the host SMMUv3 SSIDSIZE value.
>
> Fixes: b8c6f8a69d27 ("hw/arm/smmuv3-accel: Make SubstreamID support configurable")
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-accel.c          | 23 +++++++++++++++++++++--
>  hw/arm/smmuv3.c                | 19 ++++++++++---------
>  include/hw/arm/smmuv3-common.h |  1 -
>  include/hw/arm/smmuv3.h        |  3 ++-
>  4 files changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index c31b64295e..bc6cbfebc2 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -802,7 +802,7 @@ static uint64_t smmuv3_accel_get_viommu_flags(void *opaque)
>      SMMUState *bs = opaque;
>      SMMUv3State *s = ARM_SMMUV3(bs);
>  
> -    if (s->ssidsize) {
> +    if (s->ssidsize > SSID_SIZE_MODE_0) {
>          flags |= VIOMMU_FLAG_PASID_SUPPORTED;
>      }
>      return flags;
> @@ -817,6 +817,22 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_msi_direct_gpa = smmuv3_accel_get_msi_gpa,
>  };
>  
> +/*
> + * This returns the value of a SsidSizeMode value offset by 1 to
> + * account for the enum values offset by 1 from actual values.
> + *
> + * SSID_SIZE_MODE_0 = 1, SSID_SIZE_MODE_1 = 2, etc. so return 0
> + * if SSID_SIZE_MODE_0 is passed as input, return 1 if
> + * SSID_SIZE_MODE_1 is passed as input, etc.
> + */
> +static uint8_t ssidsize_mode_to_value(SsidSizeMode mode)
> +{
> +    if (mode == SSID_SIZE_MODE_AUTO) {
> +        return 0;
> +    }
> +    return mode - 1;
> +}
> +
>  void smmuv3_accel_idr_override(SMMUv3State *s)
>  {
>      if (!s->accel) {
> @@ -842,7 +858,10 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>       * By default QEMU SMMUv3 has no SubstreamID support. Update IDR1 if user
>       * has enabled it.
>       */
> -    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SSIDSIZE, s->ssidsize);
> +    if (s->ssidsize > SSID_SIZE_MODE_0) {
> +        s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SSIDSIZE,
> +                               ssidsize_mode_to_value(s->ssidsize));
> +    }
>  }
>  
>  /* Based on SMUUv3 GPBA.ABORT configuration, attach a corresponding HWPT */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ea285bdf64..79018f8d66 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -20,6 +20,7 @@
>  #include "qemu/bitops.h"
>  #include "hw/core/irq.h"
>  #include "hw/core/sysbus.h"
> +#include "hw/core/qdev-properties-system.h"
>  #include "migration/blocker.h"
>  #include "migration/vmstate.h"
>  #include "hw/core/qdev-properties.h"
> @@ -625,7 +626,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>      }
>  
>      /* Multiple context descriptors require SubstreamID support */
> -    if (!s->ssidsize && STE_S1CDMAX(ste) != 0) {
> +    if (s->ssidsize == SSID_SIZE_MODE_0 && STE_S1CDMAX(ste) != 0) {
>          qemu_log_mask(LOG_UNIMP,
>                  "SMMUv3: multiple S1 context descriptors require SubstreamID support. "
>                  "Configure ssidsize > 0 (requires accel=on)\n");
> @@ -1979,6 +1980,10 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>          error_setg(errp, "ril auto mode is not supported");
>          return false;
>      }
> +    if (s->ssidsize == SSID_SIZE_MODE_AUTO) {
> +        error_setg(errp, "ssidsize auto mode is not supported");
> +        return false;
> +    }
>  
>      if (!s->accel) {
>          if (s->ril == ON_OFF_AUTO_OFF) {
> @@ -1993,7 +1998,7 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>              error_setg(errp, "OAS must be 44 bits when accel=off");
>              return false;
>          }
> -        if (s->ssidsize) {
> +        if (s->ssidsize > SSID_SIZE_MODE_0) {
>              error_setg(errp, "ssidsize can only be set if accel=on");
>              return false;
>          }
> @@ -2011,11 +2016,6 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>          error_setg(errp, "OAS can only be set to 44 or 48 bits");
>          return false;
>      }
> -    if (s->ssidsize > SMMU_SSID_MAX_BITS) {
> -        error_setg(errp, "ssidsize must be in the range 0 to %d",
> -                   SMMU_SSID_MAX_BITS);
> -        return false;
> -    }
>  
>      return true;
>  }
> @@ -2144,7 +2144,8 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_ON_OFF_AUTO("ril", SMMUv3State, ril, ON_OFF_AUTO_ON),
>      DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_OFF),
>      DEFINE_PROP_UINT8("oas", SMMUv3State, oas, 44),
> -    DEFINE_PROP_UINT8("ssidsize", SMMUv3State, ssidsize, 0),
> +    DEFINE_PROP_SSIDSIZE_MODE("ssidsize", SMMUv3State, ssidsize,
> +                              SSID_SIZE_MODE_0),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2185,7 +2186,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "A value of N allows SSIDs in the range [0 .. 2^N - 1]. "
>          "Valid range is 0-20, where 0 disables SubstreamID support. "
>          "Defaults to 0. A value greater than 0 is required to enable "
> -        "PASID support.");
> +        "PASID support. ssidsize=auto is not supported.");
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
> index 9f78bbe89e..7f0f992dfd 100644
> --- a/include/hw/arm/smmuv3-common.h
> +++ b/include/hw/arm/smmuv3-common.h
> @@ -311,7 +311,6 @@ REG32(IDR1,                0x4)
>      FIELD(IDR1, TABLES_PRESET, 30, 1)
>      FIELD(IDR1, ECMDQ,        31, 1)
>  
> -#define SMMU_SSID_MAX_BITS 20
>  #define SMMU_IDR1_SIDSIZE 16
>  #define SMMU_CMDQS   19
>  #define SMMU_EVENTQS 19
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index c35e599bbc..ddf472493d 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -21,6 +21,7 @@
>  
>  #include "hw/arm/smmu-common.h"
>  #include "qom/object.h"
> +#include "qapi/qapi-types-misc-arm.h"
>  
>  #define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-memory-region"
>  
> @@ -72,7 +73,7 @@ struct SMMUv3State {
>      OnOffAuto ril;
>      OnOffAuto ats;
>      uint8_t oas;
> -    uint8_t ssidsize;
> +    SsidSizeMode ssidsize;
>  };
>  
>  typedef enum {


