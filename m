Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92BDCCF9E5
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 14:44:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDOSb-0007N3-Bu; Mon, 27 Oct 2025 10:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDOSX-0007Ma-TY
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDOSO-0008F2-D9
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761576260;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSnyMK2PnnR0lH6BZTdCQi2hL4wj4fDfNX0GX7+hhVw=;
 b=VnEp7Yh527+69zGioqqBA3sK8H2cSjVYJkcRJBOMG9IKb83s76kI5yW/QwP+oFe9F88gMz
 VKlXIZo3D4/jkSEvkeQ/rp1EqFeW+MEK+6ZBi4iD2psVxKNzy6VauxSRJXm7mXGX03SsL2
 roHc4xtPk0BrNU69rD+Oth02j+m2H3g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-gGfW6-FRMNCn2Bi24J4Pxw-1; Mon, 27 Oct 2025 10:44:19 -0400
X-MC-Unique: gGfW6-FRMNCn2Bi24J4Pxw-1
X-Mimecast-MFC-AGG-ID: gGfW6-FRMNCn2Bi24J4Pxw_1761576258
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-475dc22db7eso21535265e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761576258; x=1762181058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fSnyMK2PnnR0lH6BZTdCQi2hL4wj4fDfNX0GX7+hhVw=;
 b=mXZ/ak98cP45ExQ4jO05q32WIOtG9r5t/eKFqG4pEcQZc9TKz9opMSpPKXbzc/7aMM
 6XZnQQHNGlgwDYtGKtenDVvmQWsmoBa92B1MxLsBljbmPxM8VPhqY60f8xlWNWGbRufD
 f5sutLuGiJqBNHHHX/hcYnTfsoY8NHxFlYRIGEHHNJSJhVYiBkYmTaJsg/+WNTBVfseq
 ZPVRYvpisw7eETknoc2HmEzixElPV63e6Q0KE4vpMn8nYlikslIveHLJ/YPVxNU18v6/
 yfkjSHOGgQOn3z8BUEkOMMCOaaJDVh8ReVygCMhYuzGhlrVZgY03/6naaRbgzudRaK3X
 O88A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdefzl1JMQfyAA3SO7nZ9QZfJKMbILzk9Y/XG0yVJZpCa57rOmdSZIT90THiENlC7RrEpjzndyYQ==@nongnu.org
X-Gm-Message-State: AOJu0YyTOtlEdKoeC0lgqXD/LA6s5zqYerQ0JSZoxZHgOLJ9YmIg0SnU
 qfUXvbPE2U/HAk5hf5W+gEU5ymX53e97yEEH6TqJLDxKxSGh8Lor7OoHmboXVa7PrXKdmrvoddG
 7VeQC5zaGVqMgwEva1400/mndJy4FdICOZYRZjoa6dBV5HYT0ooCozQ==
X-Gm-Gg: ASbGnctBgdDja1saOgOgT6jfyddEYwPkkdspr5/TaChO6JqZysGLA6HXsYHwaNGqafP
 abfwXfKekm/eoLSkc5yNEMb+Geseh2+y4AQ5TAKa2OM4q9xrzXmv5BBLpQ0lXFs3JRXwnJ6JA5t
 AV+JiDAlSmlm7IL4tZyy8Hq7CdhRgvBLNfo4G4qJKxpWiM+ADLiXwk1DYSp+WN5FEYf5Hi6FTwV
 KWAZobE9NLEGYRcgzTF3/bvcoC9imsSV+CngUTjugqCVauDNqaMofNyBs8xjipwVVNN25Uf6Oej
 jEO8zeAlKQdB96PSehhZbF37ZsaUYZdR/4nLN4P5JBWelSM0qUG5rljAefC1VVtNcCHtFhKHfZj
 s5AzpNMyWlEzG7KhApETRh1LjUZVylsugq3HNUvvbC54mfw==
X-Received: by 2002:a05:6000:4809:b0:428:55c3:cea7 with SMTP id
 ffacd0b85a97d-42855c3d2demr16142167f8f.36.1761576257978; 
 Mon, 27 Oct 2025 07:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaj9MukrRhut2DRd7W9Jf4I5u1nOyNm8my6egdB8PcStJOnZkxyw4CR46IfJUk0u4ZAw8AgA==
X-Received: by 2002:a05:6000:4809:b0:428:55c3:cea7 with SMTP id
 ffacd0b85a97d-42855c3d2demr16142134f8f.36.1761576257531; 
 Mon, 27 Oct 2025 07:44:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df5c9sm14626724f8f.41.2025.10.27.07.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:44:17 -0700 (PDT)
Message-ID: <b6105534-4a17-4700-bb0b-e961babd10bb@redhat.com>
Date: Mon, 27 Oct 2025 15:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/27] hw/arm/smmuv3-accel: Add a property to specify
 RIL support
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-22-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-22-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ulco8SF7IBuAqafbXncWavsGl-3hFXTq-l2OfOLxoCY_1761576258
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Shameer,

On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> Currently QEMU SMMUv3 has RIL support by default. But if accelerated mode
> is enabled, RIL has to be compatible with host SMMUv3 support.

We may have extended this prop to emulation code too.

While checking I noticed AIDR is set to 3.1 in vIOMMU. Not related to
this patch but should we test the host IOMMU has a compatible
architecture too?
>
> Add a property so that the user can specify this.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c   | 16 ++++++++++++++--
>  hw/arm/smmuv3-accel.h   |  4 ++++
>  hw/arm/smmuv3.c         | 13 +++++++++++++
>  include/hw/arm/smmuv3.h |  1 +
>  4 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 8396053a6c..e8607b253e 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -79,10 +79,10 @@ smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>          return false;
>      }
>  
> -    /* QEMU SMMUv3 supports Range Invalidation by default */
> +    /* User can override QEMU SMMUv3 Range Invalidation support */
>      val = FIELD_EX32(info->idr[3], IDR3, RIL);
>      if (val != FIELD_EX32(s->idr[3], IDR3, RIL)) {
> -        error_setg(errp, "Host SUMMUv3 deosn't support Range Invalidation");
> +        error_setg(errp, "Host SUMMUv3 differs in Range Invalidation support");
>          return false;
>      }
>  
> @@ -634,6 +634,18 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_msi_address_space = smmuv3_accel_find_msi_as,
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
> +    }
> +}
> +
>  /*
>   * If the guest reboots and devices are configured for S1+S2, Stage1 must
>   * be switched to bypass. Otherwise, QEMU/UEFI may fail when accessing a
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 75f858e34a..357d8352c5 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -49,6 +49,7 @@ bool smmuv3_accel_install_nested_ste_range(SMMUv3State *s, SMMUSIDRange *range,
>  bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>                                  Error **errp);
>  void smmuv3_accel_attach_bypass_hwpt(SMMUv3State *s);
> +void smmuv3_accel_idr_override(SMMUv3State *s);
>  #else
>  static inline void smmuv3_accel_init(SMMUv3State *s)
>  {
> @@ -74,6 +75,9 @@ smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>  static inline void smmuv3_accel_attach_bypass_hwpt(SMMUv3State *s)
>  {
>  }
> +static inline void smmuv3_accel_idr_override(SMMUv3State *s)
> +{
> +}
>  #endif
>  
>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index a0f704fc35..0f3a61646a 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -300,6 +300,8 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>  
> +    smmuv3_accel_idr_override(s);
> +
>      s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
>      s->cmdq.prod = 0;
>      s->cmdq.cons = 0;
> @@ -1925,6 +1927,13 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>          return false;
>      }
>  #endif
> +    if (s->accel) {
> +        return true;
> +    }
> +    if (!s->ril) {
> +        error_setg(errp, "ril can only be disabled if accel=on");
> +        return false;
> +    }
>      return true;
>  }
>  
> @@ -2047,6 +2056,8 @@ static const Property smmuv3_properties[] = {
>       */
>      DEFINE_PROP_STRING("stage", SMMUv3State, stage),
>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
> +    /* RIL can be turned off for accel cases */
> +    DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2074,6 +2085,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>                                            "Enable SMMUv3 accelerator support."
>                                            "Allows host SMMUv3 to be configured "
>                                            "in nested mode for vfio-pci dev assignment");
> +    object_class_property_set_description(klass, "ril",
> +        "Enable/disable range invalidation support");
if we decide to enable the prop only along with accel, might be worth to
document it here.
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 874cbaaf32..c555ea684e 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -68,6 +68,7 @@ struct SMMUv3State {
>      bool accel;
>      struct SMMUv3AccelState  *s_accel;
>      Error  *migration_blocker;
> +    bool ril;
>  };
>  
>  typedef enum {
Thanks

Eric


