Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D9CCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 15:07:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFw9V-0003km-69; Mon, 03 Nov 2025 10:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFw9S-0003kS-Tq
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 10:07:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFw9N-000139-Dx
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 10:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762182433;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZl4pq003mdE3U70ooNpYMwqUBxotE9d2AJyCdQ1SrY=;
 b=g+Jl+6ZMtGMCAj5QCG8GP95frhn6bJrJWacX5AOQmJ4OB5yRGmy/H/dTlg0FQ/JI5901KN
 iHFAEnWKKOBanepeID5weMYPdPct2nA6byoJ0QltcWSxlZukgCctrWJX9NqU5ZkBSdGUh3
 MDp4abNYpztaMW1YJkhJqUT1AOdM/zI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-ZqZObeYRMZa-o_Gx_uAFjw-1; Mon, 03 Nov 2025 10:07:11 -0500
X-MC-Unique: ZqZObeYRMZa-o_Gx_uAFjw-1
X-Mimecast-MFC-AGG-ID: ZqZObeYRMZa-o_Gx_uAFjw_1762182431
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429c7b0ae36so1163603f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 07:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762182430; x=1762787230;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jZl4pq003mdE3U70ooNpYMwqUBxotE9d2AJyCdQ1SrY=;
 b=ZFLsXkhL4e6LPtC9xZUV0dhxPwvU95MZz7n85PUf0nSY0IziO7nhCjXDgrrPnTBZK+
 e+itsp+3Su0wEC+/M355C1wXw4d30/BlyQndYTtUh2ymfGadNhrfOblj1bxWkLeuPDOT
 w81EJQspf5padQ6HObgdhMCSrsQv+17rIYnpObuB8GYY3tTiIPt/kaiz3OxYBmhrRdJl
 AM+csj0cCqul3OTURfv4ML/1GVCic3nRYq9tdH27kSoXz3OJrTt4C3eqYCylWUAbj1QX
 RflYzkDEq0pnqDwHTNU4RYeIZj08ODh2vRpQamqj6sXzIvHmcj0UQgAiF8X2adNrlmJh
 w02w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzmfW9w20Ep8SzYwAdUdm9eo5XR4setlPRwcMuwzI4L1gkssa2j/MC8X2Zf7XJ21ZF4aVyhjY8sw==@nongnu.org
X-Gm-Message-State: AOJu0YzDKCS8PjKH3dy8dp/QLpk9NBuTEiY2nQJtghPUimnAMyNK1EcJ
 f5ax96227ggUKSlGRbhQijSoRzpyLxNOwUdJWQkzKGiFuKvUT1uUeFiC+pecisSY6ZElNxeUC/m
 97jqTDAqumY0fyG4xOuaFScaZzRAm9p0Pg4XvbOeAX1chE2yvgN/T+y6AtcWXHw==
X-Gm-Gg: ASbGncvv5e0Y8H76MsXjGFJGKf6bSQiWgrCDxllDnLm4YoSjx/B9mpGSLCgW1izab1h
 E7naNtZiMDWufDBsxZjkwLMvtqq1ANTX/kl1x605Wt8Lz608V93bfMosMmIlgvJUbZ3vyQi0BLK
 0kQvUBWKwMicF7osSYnA+Pbi/DgcARJSr+MF3+65bl//Ej9Khv59hb0u9tieDnfWGzmhlcKX1Ul
 Kwf2p0zqsjMjTTIosdQjYK+jzucDchYwk2J7/qhiIooEfMtpn2sfSiZV4zpRuCKGPwQj1l0e+TO
 pFSmST28Zen/gxF0gpWNQBIhXw+SyVsDtV7icOXXSPOe6PwrcJZj5tbG2ZBcH08yJVQW6UUJwDG
 yKwS5705cyj+5MlKn4i6TROy+sMfMoMsSVvhIJyvdXDK0TA==
X-Received: by 2002:a05:6000:18a3:b0:429:9272:c1be with SMTP id
 ffacd0b85a97d-429bcd04f0dmr11578767f8f.8.1762182430090; 
 Mon, 03 Nov 2025 07:07:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdzVjxgsgkiYRT7zvSg7wN6w+QNzo2pGzniOTVXSc66hBF6Z0tbjAschfrv/RrIzZprzbyxQ==
X-Received: by 2002:a05:6000:18a3:b0:429:9272:c1be with SMTP id
 ffacd0b85a97d-429bcd04f0dmr11578608f8f.8.1762182427960; 
 Mon, 03 Nov 2025 07:07:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c85ad08esm15687103f8f.19.2025.11.03.07.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 07:07:07 -0800 (PST)
Message-ID: <2e8bd9fe-2434-443e-ae4e-e15352ff112a@redhat.com>
Date: Mon, 3 Nov 2025 16:07:05 +0100
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
X-Mimecast-MFC-PROC-ID: w-1_JOcmho9iphbR1q3db-fkIuPBZ8WzGTgkXiVEzjg_1762182431
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

On 10/31/25 11:49 AM, Shameer Kolothum wrote:
> Currently QEMU SMMUv3 has RIL support by default. But if accelerated mode
> is enabled, RIL has to be compatible with host SMMUv3 support.
>
> Add a property so that the user can specify this.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>

I have not seen any reply on
https://lore.kernel.org/all/b6105534-4a17-4700-bb0b-e961babd10bb@redhat.com/

I guess you chose to restrict RIL to accel only. About AIDR consistency
check, did you have a look?

Eric


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


