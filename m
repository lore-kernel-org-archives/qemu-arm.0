Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605C2CCFA00
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Nov 2025 09:38:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGDUc-0001H8-Of; Tue, 04 Nov 2025 04:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGDUb-0001GS-4M
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 04:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGDUX-0001Rk-8p
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 04:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762249095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kfc0KsmDvBI4U4YHDrVEWJAlouGouheCqTARyXSJ6o=;
 b=c2XiWoduvn1a37TQDzvdrT7tdllp7HQBAF1zmynIW/HoQITOGZkdORGnoYV+BrEb8ImelE
 yvFCLUHqwkH5X1RxVSeJicxZzbssp+LDYwEKsgF8U2mGpF/NqbCj/zFuq8x3D33WBX1MXw
 JfNKnt8jDCpmd1vU9D+4P9NGFr73yk4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-BxePC6VYOJue0z13N6-kIg-1; Tue, 04 Nov 2025 04:38:12 -0500
X-MC-Unique: BxePC6VYOJue0z13N6-kIg-1
X-Mimecast-MFC-AGG-ID: BxePC6VYOJue0z13N6-kIg_1762249091
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-40cfb98eddbso3026786f8f.0
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 01:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762249091; x=1762853891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9kfc0KsmDvBI4U4YHDrVEWJAlouGouheCqTARyXSJ6o=;
 b=kZCKpo5oqMRAqUN7wcyYKhE9G3Wi+HhbIB65aFSBNM6rbpAp8Ukmald/XrnFPfnlyN
 YKiEgPpssqOOx1r28vuN9jDMgpssJ2vvep6dn5I4vYpY9SSUV3po62u14ZiTqahpf4LH
 nmFQ1dXqUsUMdiYhjUuQkQgowrqjis0+yvIx1XOQ34fksvLpg5n6TqqYZsD52rXZOj0C
 uFdm/46I345WDL9ch0fECRjkvxua3g5CT2yrC4ZTNooWOxuGy7JXJxUd4xN3uHUCwf8Q
 kyH7PZ+RBRt6s1ZnwVpAast9vqQ95H/JfCrgaLteOtHTneuKPxTbhlSMLU1jQ6aOtD9j
 duRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyf3n0pmTEct3t8REKBKg6fw/u06g08FlveJ+cWkrDP0ufJsFpnYZTA4LnOrTPfYUZ5nrQr8f2xQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz/M2Y3GhPfsPNm3xuL5COwWC6HuUYaFWNFKKgWXslEVyhw+HjN
 o+Tv1VAxSxGZmJ8MDQ2yu32kWOPpNh2bU7lxh45QqK05QmtCWN9xAHV1GYEu92FRZOSwbgqoD9J
 yj23WtjICi8zWHlDYCIQ3IRmfu23Mz9/N1c4sxVwQmmxE7DdMFyzHrw==
X-Gm-Gg: ASbGncsV4GcAYsQgFAJ+mnz7D8WztKb722bwceRyu0yfmuASdDFwXNWL8uUegthwgxC
 wSzmk8NeLekze48Iady7rtVxPyY/2k7BZv7gdrV4nWKM5p4WgZELVzLSIh3HlS50fWFzAHnthN0
 turVsGwD9iMYcdWiuTeKf92VyvHuJrAG/zN0QnAp8Eb4IHky8OFNP8tjDAYtgh7JYa7btGugb9k
 aDPWOoNSjgJLUk7RzOESIRf5cZd+oEeptSlrk37/0Zu8KwYVV1RU0ulJOvYSb83Cc/+WiIih9/J
 2a5nwotjlyA8rNBEQuYPTDAX2nOrwpRH1OvqoalIZN1JADOHxyn+FDizBKeOLvdJfilwPMWNjnJ
 P0N7pm9f1S9sTXNTyMnOcUBMi8LQzTuiya1EDFzaovDEJ/w==
X-Received: by 2002:a05:6000:228a:b0:407:d776:4434 with SMTP id
 ffacd0b85a97d-429dbd4e125mr2302610f8f.30.1762249090856; 
 Tue, 04 Nov 2025 01:38:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf7cgWmLtC8WZL/M0SY2jKiXrda/pKvydwhYAK6asNzP4K9EaIdATnDQ1Y5bqYf9nB93BXsA==
X-Received: by 2002:a05:6000:228a:b0:407:d776:4434 with SMTP id
 ffacd0b85a97d-429dbd4e125mr2302573f8f.30.1762249090439; 
 Tue, 04 Nov 2025 01:38:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1f5b93sm3425443f8f.27.2025.11.04.01.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 01:38:10 -0800 (PST)
Message-ID: <ff415e1f-08ef-4498-92bf-81caae4bfe14@redhat.com>
Date: Tue, 4 Nov 2025 10:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/32] hw/arm/smmuv3-accel: Add a property to specify
 RIL support
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-27-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-27-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TV5NGEwsRqjgCrgtsJNrx5nM4kz0pRG95jhLRGaUTSM_1762249091
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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



On 10/31/25 11:49 AM, Shameer Kolothum wrote:
> Currently QEMU SMMUv3 has RIL support by default. But if accelerated mode
> is enabled, RIL has to be compatible with host SMMUv3 support.
>
> Add a property so that the user can specify this.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c   | 15 +++++++++++++--
>  hw/arm/smmuv3-accel.h   |  4 ++++
>  hw/arm/smmuv3.c         | 12 ++++++++++++
>  include/hw/arm/smmuv3.h |  1 +
>  4 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 8b9f88dd8e..35298350cb 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -63,10 +63,10 @@ smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>          return false;
>      }
>  
> -    /* QEMU SMMUv3 supports Range Invalidation by default */
> +    /* User can disable QEMU SMMUv3 Range Invalidation support */
>      if (FIELD_EX32(info->idr[3], IDR3, RIL) !=
>                  FIELD_EX32(s->idr[3], IDR3, RIL)) {
> -        error_setg(errp, "Host SMMUv3 doesn't support Range Invalidation");
> +        error_setg(errp, "Host SMMUv3 differs in Range Invalidation support");
>          return false;
>      }
>  
> @@ -635,6 +635,17 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_msi_address_space = smmuv3_accel_get_msi_as,
>  };
>  
> +void smmuv3_accel_idr_override(SMMUv3State *s)
> +{
> +    if (!s->accel) {
> +        return;
> +    }
> +
> +    /* By default QEMU SMMUv3 has RIL. Update IDR3 if user has disabled it */
> +    if (!s->ril) {
> +        s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 0);
Can't you directly set

s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, s->rid);

Eric

> +    }
> +}
>  
>  /* Based on SMUUv3 GBPA configuration, attach a corresponding HWPT */
>  void smmuv3_accel_gbpa_update(SMMUv3State *s)
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index ee79548370..4f5b672712 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -55,6 +55,7 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>                                  Error **errp);
>  void smmuv3_accel_gbpa_update(SMMUv3State *s);
>  void smmuv3_accel_reset(SMMUv3State *s);
> +void smmuv3_accel_idr_override(SMMUv3State *s);
>  #else
>  static inline void smmuv3_accel_init(SMMUv3State *s)
>  {
> @@ -83,6 +84,9 @@ static inline void smmuv3_accel_gbpa_update(SMMUv3State *s)
>  static inline void smmuv3_accel_reset(SMMUv3State *s)
>  {
>  }
> +static inline void smmuv3_accel_idr_override(SMMUv3State *s)
> +{
> +}
>  #endif
>  
>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f040e6b91e..b9d96f5762 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -305,6 +305,7 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>      s->aidr = 0x1;
> +    smmuv3_accel_idr_override(s);
>  }
>  
>  static void smmuv3_reset(SMMUv3State *s)
> @@ -1936,6 +1937,13 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>          return false;
>      }
>  #endif
> +    if (!s->accel) {
> +        if (!s->ril) {
> +            error_setg(errp, "ril can only be disabled if accel=on");
> +            return false;
> +        }
> +        return false;
this one is wrong. It should return true because it is a valid and
default config.

Eric
> +    }
>      return true;
>  }
>  
> @@ -2057,6 +2065,8 @@ static const Property smmuv3_properties[] = {
>       */
>      DEFINE_PROP_STRING("stage", SMMUv3State, stage),
>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
> +    /* RIL can be turned off for accel cases */
> +    DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2084,6 +2094,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>                                            "Enable SMMUv3 accelerator support."
>                                            "Allows host SMMUv3 to be configured "
>                                            "in nested mode for vfio-pci dev assignment");
> +    object_class_property_set_description(klass, "ril",
> +        "Disable range invalidation support (for accel=on)");
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 6b9c27a9c4..95202c2757 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -68,6 +68,7 @@ struct SMMUv3State {
>      bool accel;
>      struct SMMUv3AccelState *s_accel;
>      Error *migration_blocker;
> +    bool ril;
>  };
>  
>  typedef enum {


