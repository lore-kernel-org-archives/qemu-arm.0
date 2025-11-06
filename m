Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54383CCF9F8
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 16:47:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vH387-0007Vu-Fx; Thu, 06 Nov 2025 11:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vH385-0007VR-1W
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 11:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vH382-0002Vz-Mq
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 11:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762447590;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19iq9qE1ZChXg4I/pn5kVRivi2ULDlFEcZp19p8feX4=;
 b=BTcpDW50GKWStzNpT0up8nW9PFtqIeX+FVLT9+H6jVC+NMppnpnGHM0/UmuT0crkQTFlWu
 zpo3ROSva9ReRVqHATXUo4XkGSxb2qzBwBWWvoVTUoR031IMuO7iWTo3rfWnqIPuZvOuUW
 E4vca26sVFfJEVv+sPPynabkJNPjA6o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-wMokAPYJPTKtWZX7kTSARQ-1; Thu, 06 Nov 2025 11:46:26 -0500
X-MC-Unique: wMokAPYJPTKtWZX7kTSARQ-1
X-Mimecast-MFC-AGG-ID: wMokAPYJPTKtWZX7kTSARQ_1762447584
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47111dc7c5dso8682005e9.0
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 08:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762447584; x=1763052384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19iq9qE1ZChXg4I/pn5kVRivi2ULDlFEcZp19p8feX4=;
 b=WgAfgGW3uu88YFf/xDuoTYzxgSIDpsntVY/RM+4mG8EYPdE/LiHIWnW9zEM8xgQxHQ
 1ViRj6tZ7AAabbxr4jy37y2c/qLWLqpccEhbGObSgva2Lmyqdfpxz8u+SSm2Cqz8slt/
 fMMr0sN8ZP9j/XY4OzUyHQ5IVLR0r6QQ389VKugM8TKNoSI52t5ppIKLFwk69HrjhiXb
 bg0ODg7fTInTvfaCK9z5yJLSacTz7oL+/5dT1rHGlYh+FoG/1WFVZr0Ip0zQuC192/Gf
 7SJvGCIv9fTYxDadK3AI9edWUduC5xEDl7Rq/eW+uJpQzvGBZTiqcp7PS8esyUJHOk7g
 CssQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBk1aH6U2BHxg+eJpYYeogsxBK1IVPVybDgmthBAQYJX7kV6dNv2UaOSTXNj1YRw5CwLvq5HHL2w==@nongnu.org
X-Gm-Message-State: AOJu0Yx8o5UjB4fM8xZA5r6IEonnk0eozSisRNyNvKTq+WE0EKh2WD4U
 /1d3kVcaUK77tGr+8B53KPe41Fb7ojoTyOOGdktrpMk8mnjiUg21UCFYkwB3GgZDYpsGLI0foWt
 jsu9RbwCk39xJI1wyKs+PwJ+0gtEuNJFt3Jo7DM+NnU7RSly/WLdBTg==
X-Gm-Gg: ASbGncvAE3jGoVZK324nV5Hxn2pOu4lLZAc7ThMckP1XHDHWzZIl8cfAmHjc2MfmATL
 uQeE+cG43mDVCAoFDHtqqoBkKC8p76PZWgRWepm9fd4YpRF2VavK9cejoSiXUv6l4VlHa73LqWj
 /sE9YuUnTGSeAzMGcRFJ4LcGxn6jVb+1TVEo5AgNOoPVDdB/+1l7VvF1O9u5ycfJYIzCPyf7+Io
 BG6kFkhf+uGKCK6NxkEFf0p7iL7TblCi/KAvmSUOFWveCC9NzGNLblIqNTbDgziEqzUMkhpVx0Q
 IuciSHmw7qnuV6B/dC0Gh6L4rwaUJ8NFm/busUm7AmAaWr3is70Vxv+pvVFyVH8vh0wZIj/1SZ7
 F5rTSiOGgFNJfHMfmNbICufelBimlkdWZ+BN9OXqzrcppmg==
X-Received: by 2002:a05:600c:154a:b0:477:63b4:e77f with SMTP id
 5b1f17b1804b1-4776ba0510amr3232925e9.0.1762447583577; 
 Thu, 06 Nov 2025 08:46:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZJvR3WklxVXiLVT2xk4JOMUlCh7Z8Vc4vu/1Aq5ychnWftE8UDvvzI3TnOWlSB0ujMwNl5Q==
X-Received: by 2002:a05:600c:154a:b0:477:63b4:e77f with SMTP id
 5b1f17b1804b1-4776ba0510amr3232405e9.0.1762447583057; 
 Thu, 06 Nov 2025 08:46:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47763e16db8sm19804555e9.1.2025.11.06.08.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 08:46:22 -0800 (PST)
Message-ID: <fb20b62f-c2e7-452e-8185-4e4d21c011cf@redhat.com>
Date: Thu, 6 Nov 2025 17:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/32] hw/arm/smmuv3-accel: Add support for PASID enable
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-33-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-33-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kCIKu-s55a0V6BTJ5Tpo2-DdQG8Lmon6UMztqkRrAzU_1762447584
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.271,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Hi Shameer,

On 10/31/25 11:50 AM, Shameer Kolothum wrote:
> QEMU SMMUv3 currently forces SSID (Substream ID) to zero. One key use case
> for accelerated mode is Shared Virtual Addressing (SVA), which requires
> SSID support so the guest can maintain multiple context descriptors per
> substream ID.
>
> Provide an option for user to enable PASID support. A SSIDSIZE of 16
> is currently used as default.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c    | 23 ++++++++++++++++++++++-
>  hw/arm/smmuv3-internal.h |  1 +
>  hw/arm/smmuv3.c          | 10 +++++++++-
>  include/hw/arm/smmuv3.h  |  1 +
>  4 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index caa4a1d82d..1f206be8e4 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -68,6 +68,12 @@ smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>          error_setg(errp, "Host SMMUv3 SIDSIZE not compatible");
>          return false;
>      }
> +    /* If user enables PASID support(pasid=on), QEMU sets SSIDSIZE to 16 */
> +    if (FIELD_EX32(info->idr[1], IDR1, SSIDSIZE) <
> +                FIELD_EX32(s->idr[1], IDR1, SSIDSIZE)) {
> +        error_setg(errp, "Host SMMUv3 SSIDSIZE not compatible");
> +        return false;
> +    }
>  
>      /* User can disable QEMU SMMUv3 Range Invalidation support */
>      if (FIELD_EX32(info->idr[3], IDR3, RIL) !=
> @@ -642,7 +648,14 @@ static uint64_t smmuv3_accel_get_viommu_flags(void *opaque)
>       * The real HW nested support should be reported from host SMMUv3 and if
>       * it doesn't, the nesting parent allocation will fail anyway in VFIO core.
>       */
> -    return VIOMMU_FLAG_WANT_NESTING_PARENT;
> +    uint64_t flags = VIOMMU_FLAG_WANT_NESTING_PARENT;
> +    SMMUState *bs = opaque;
> +    SMMUv3State *s = ARM_SMMUV3(bs);
> +
> +    if (s->pasid) {
> +        flags |= VIOMMU_FLAG_PASID_SUPPORTED;
> +    }
> +    return flags;
>  }
>  
>  static const PCIIOMMUOps smmuv3_accel_ops = {
> @@ -672,6 +685,14 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>      if (s->oas == 48) {
>          s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS_48);
>      }
> +
> +    /*
> +     * By default QEMU SMMUv3 has no PASID(SSID) support. Update IDR1 if user
> +     * has enabled it.
> +     */
> +    if (s->pasid) {
> +        s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SSIDSIZE, SMMU_IDR1_SSIDSIZE);
> +    }
>  }
>  
>  /* Based on SMUUv3 GBPA configuration, attach a corresponding HWPT */
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index cfc5897569..2e0d8d538b 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -81,6 +81,7 @@ REG32(IDR1,                0x4)
>      FIELD(IDR1, ECMDQ,        31, 1)
>  
>  #define SMMU_IDR1_SIDSIZE 16
> +#define SMMU_IDR1_SSIDSIZE 16
>  #define SMMU_CMDQS   19
>  #define SMMU_EVENTQS 19
>  
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index c4d28a3786..e1140fe087 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -611,7 +611,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          }
>      }
>  
> -    if (STE_S1CDMAX(ste) != 0) {
> +    /* If pasid enabled, we report SSIDSIZE = 16 */
> +    if (!FIELD_EX32(s->idr[1], IDR1, SSIDSIZE) && STE_S1CDMAX(ste) != 0) {
can't you directly check s->pasid instead of decoding the IDR1?
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 does not support multiple context descriptors yet\n");
you may suggest to add pasid= option then.
>          goto bad_ste;
> @@ -1966,6 +1967,10 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>              error_setg(errp, "OAS can only be set to 44 bits if accel=off");
>              return false;
>          }
> +        if (s->pasid) {
> +            error_setg(errp, "pasid can only be enabled if accel=on");
> +            return false;
> +        }
>          return false;
>      }
>  
> @@ -2098,6 +2103,7 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>      DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
>      DEFINE_PROP_UINT8("oas", SMMUv3State, oas, 44),
> +    DEFINE_PROP_BOOL("pasid", SMMUv3State, pasid, false),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2133,6 +2139,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>      object_class_property_set_description(klass, "oas",
>          "Specify Output Address Size (for accel =on). Supported values "
>          "are 44 or 48 bits. Defaults to 44 bits");
> +    object_class_property_set_description(klass, "pasid",
> +        "Enable/disable PASID support (for accel=on)");
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index e4226b66f3..ee0b5ed74f 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -71,6 +71,7 @@ struct SMMUv3State {
>      bool ril;
>      bool ats;
>      uint8_t oas;
> +    bool pasid;
>  };
>  
>  typedef enum {
Otherwise looks good to me
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


