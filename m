Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A86D41D58
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 15:23:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTiVu-0004gU-G0; Thu, 11 Dec 2025 10:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vTiVt-0004gC-2M
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 10:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vTiVr-0004lV-7B
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 10:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765466605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xEV2ET08lTfu5PFUdVrGZ8CTgU7mZ4vZr0FD1nufhXU=;
 b=Z0Q5KcCXwUNCF7+qiGmRAgMh5epPiAQo/XSNLj67fLtgFC16/cdVI20XZ6jBJ6ovdwGuW3
 GSercFq5lC1fJmCCEgm1gUdV4LFFTfqVSZuwY6ysrmVzkmXXCTdarklm3Bo+flK7ozmha/
 mhN2txb9a1zsUSoe4gQ7svTtY2Ag+W0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-M2USLv5WMmegvW6cpt8UHQ-1; Thu, 11 Dec 2025 10:23:24 -0500
X-MC-Unique: M2USLv5WMmegvW6cpt8UHQ-1
X-Mimecast-MFC-AGG-ID: M2USLv5WMmegvW6cpt8UHQ_1765466603
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47797caba11so1042905e9.3
 for <qemu-arm@nongnu.org>; Thu, 11 Dec 2025 07:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765466603; x=1766071403;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEV2ET08lTfu5PFUdVrGZ8CTgU7mZ4vZr0FD1nufhXU=;
 b=en+4qd8Dc5atZr4dPzo5kMQ5ibwi3mmU8qbeT+juTQw0YerGUn9adxkANCp2GQnTAf
 p9Ge3C2RJA/lX5WIzh8yoj3/toTEXpiHDqpULrGvxhuMZIcj+dEoIxti0DKnM/P/t333
 8RftYMobWwdXmYxIlt/kWbfzWQoa7caxUlhiBw/Inedi1jLGRckftq4j8nZo/BtTvwVf
 9g1Ob2efQf2brngkBTSAg1Ssx16bO72Zn8wjeA9gusxIfiBzu8osKZSTdaOCCgEt86x2
 AUvM415bb5IhCIKDa1KCUSSW8o/dsCSRuhwVG4ipTr8Jfx6yBjw/QBWgBd5C2Ra2hMYA
 yYjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc7rvmT/0yhZO2KRr1ImGQXasol9G72KBe8WGcKD59ntT+nTYNbJU1QLYbrxr2fsag0tcmSWo6bQ==@nongnu.org
X-Gm-Message-State: AOJu0YzCc/kYfp/5jUK0gmVQbYbTYJVZLBUb+S5VovjjlU0BlQJt41c0
 4brl6OdOTJFevS6iFkvbOuuWPIv5JwaR+BNBCDXWn1rWH2NKKdFT2wTClWREuWNl14rIPZhFdss
 +nW475/DT5lNub/kM/lqjpK2zTalQOM7e+tRiXAqeAZpKilhHAdEeIQ==
X-Gm-Gg: AY/fxX6IFhjrNZ2+DMk4bQrVyhTtaBBOwl04XPR9MfaEFOGycX4If9anUHhhhAxCn5j
 q1IqTi5uH/llQR/N0cVwxHK3O83LXg6964KdgZItunrWdliHpaoTiAHXSSoh+l4w7GG3T49Ih9F
 QvbQcZfoy/Wk6dIRNJQ8cM39J02VXWfMLFahhha6VAghEqPNJKhHMz2noIe/T5toSWTzFBLtnSh
 Usj1lIuTXtBao1RHeQz/8fA1WaQk2Qt1Luho8g+8kn5D+ps5UAtujPuhiW/IpRNNlIa63eiYZZu
 8Aer1z5TIuAmWutG11XhyN+BE2QSDJkfd+YOuKvEgv4WYdQSojVBovHL0WX0k6UcSmmqWgPO5s1
 kXbwNxZ5KojEM9tadncId+ZwsDmxBqxKQ7dBRq//QxOCSbEVv
X-Received: by 2002:a05:600c:46d2:b0:477:429b:3b93 with SMTP id
 5b1f17b1804b1-47a83843246mr69479085e9.18.1765466603157; 
 Thu, 11 Dec 2025 07:23:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhMmROcczFH91R9Q/StnP+e6u1ticPAaAx2HuR5It8OFjRJ8WibM0Tx05fTblJkzBlGIUNZg==
X-Received: by 2002:a05:600c:46d2:b0:477:429b:3b93 with SMTP id
 5b1f17b1804b1-47a83843246mr69478695e9.18.1765466602687; 
 Thu, 11 Dec 2025 07:23:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89f35ae6sm38827635e9.6.2025.12.11.07.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:23:22 -0800 (PST)
Message-ID: <8a6dec90-aba6-49cc-98c9-9d8205d83ac5@redhat.com>
Date: Thu, 11 Dec 2025 16:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/33] hw/arm/smmuv3-accel: Add property to specify OAS
 bits
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-30-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20251120132213.56581-30-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pdFu30wVMlCPf97T85qLhLZKtyfXeVPbWwh_dkafQKs_1765466603
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/20/25 14:22, Shameer Kolothum wrote:
> QEMU SMMUv3 currently sets the output address size (OAS) to 44 bits.
> With accelerator mode enabled, a device may use SVA, where CPU page tables
> are shared with the SMMU, requiring an OAS at least as large as the
> CPU’s output address size. A user option is added to configure this.
> 
> However, the OAS value advertised by the virtual SMMU must remain
> compatible with the capabilities of the host SMMUv3. In accelerated
> mode, the host SMMU performs stage-2 translation and must be able to
> consume the intermediate physical addresses (IPA) produced by stage-1.
> 
> The OAS exposed by the virtual SMMU defines the maximum IPA width that
> stage-1 translations may generate. For AArch64 implementations, the
> maximum usable IPA size on the host SMMU is determined by its own OAS.
> Check that the configured OAS does not exceed what the host SMMU
> can safely support.
> 
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   hw/arm/smmuv3-accel.c    | 20 ++++++++++++++++++++
>   hw/arm/smmuv3-internal.h |  3 ++-
>   hw/arm/smmuv3.c          | 16 +++++++++++++++-
>   include/hw/arm/smmuv3.h  |  1 +
>   4 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 73c7ce586a..35a94c720a 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -27,6 +27,12 @@
>   static MemoryRegion root, sysmem;
>   static AddressSpace *shared_as_sysmem;
>   
> +static int smmuv3_oas_bits(uint32_t oas)
> +{
> +    static const int map[] = { 32, 36, 40, 42, 44, 48, 52, 56 };
> +    return (oas < ARRAY_SIZE(map)) ? map[oas] : -EINVAL;
> +}
> +
>   static bool
>   smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>                                    struct iommu_hw_info_arm_smmuv3 *info,
> @@ -68,6 +74,15 @@ smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>           error_setg(errp, "Host SMMUv3 doesn't support Range Invalidation");
>           return false;
>       }
> +    /* Check OAS value opted is compatible with Host SMMUv3 IPA */
> +    if (FIELD_EX32(info->idr[5], IDR5, OAS) <
> +                FIELD_EX32(s->idr[5], IDR5, OAS)) {
> +        error_setg(errp, "Host SMMUv3 supports only %d-bit IPA, but the vSMMU "
> +                   "OAS implies %d-bit IPA",
> +                   smmuv3_oas_bits(FIELD_EX32(info->idr[5], IDR5, OAS)),
> +                   smmuv3_oas_bits(FIELD_EX32(info->idr[5], IDR5, OAS)));
> +        return false;
> +    }
>   
>       /* QEMU SMMUv3 supports GRAN4K/GRAN16K/GRAN64K translation granules */
>       if (FIELD_EX32(info->idr[5], IDR5, GRAN4K) !=
> @@ -650,6 +665,11 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>   
>       /* QEMU SMMUv3 has no ATS. Advertise ATS if opt-on by property */
>       s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, s->ats);
> +
> +    /* Advertise 48-bit OAS in IDR5 when requested (default is 44 bits). */
> +    if (s->oas == 48) {

Intel has defines for AS width :

  VTD_HOST_AW_48BIT
  VTD_HOST_AW_39BIT

I suggest doing the same for SMMUv3 to avoid using directly
numerical values like here and below.

Thanks,

C.


> +        s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS_48);
> +    }
>   }
>   
>   /* Based on SMUUv3 GPBA.ABORT configuration, attach a corresponding HWPT */
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index a76e4e2484..0f44a4e1d3 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -111,7 +111,8 @@ REG32(IDR5,                0x14)
>        FIELD(IDR5, VAX,        10, 2);
>        FIELD(IDR5, STALL_MAX,  16, 16);
>   
> -#define SMMU_IDR5_OAS 4
> +#define SMMU_IDR5_OAS_44 4
> +#define SMMU_IDR5_OAS_48 5
>   
>   REG32(IIDR,                0x18)
>   REG32(AIDR,                0x1c)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ad476146f6..a7bd4eeb77 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -299,7 +299,8 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>       s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>       s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
>   
> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> +    /* OAS: 44 bits */
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS_44);
>       /* 4K, 16K and 64K granule support */
>       s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>       s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
> @@ -1945,8 +1946,17 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>               error_setg(errp, "ats can only be enabled if accel=on");
>               return false;
>           }
> +        if (s->oas != 44) {
> +            error_setg(errp, "OAS can only be set to 44 bits if accel=off");
> +            return false;
> +        }
>           return true;
>       }
> +
> +    if (s->oas != 44 && s->oas != 48) {
> +        error_setg(errp, "OAS can only be set to 44 or 48 bits");
> +        return false;
> +    }
>       return true;
>   }
>   
> @@ -2073,6 +2083,7 @@ static const Property smmuv3_properties[] = {
>       /* RIL can be turned off for accel cases */
>       DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>       DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
> +    DEFINE_PROP_UINT8("oas", SMMUv3State, oas, 44),
>   };
>   
>   static void smmuv3_instance_init(Object *obj)
> @@ -2103,6 +2114,9 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>       object_class_property_set_description(klass, "ats",
>           "Enable/disable ATS support (for accel=on). Please ensure host "
>           "platform has ATS support before enabling this");
> +    object_class_property_set_description(klass, "oas",
> +        "Specify Output Address Size (for accel =on). Supported values "
> +        "are 44 or 48 bits. Defaults to 44 bits");
>   }
>   
>   static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 242d6429ed..d488a39cd0 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -71,6 +71,7 @@ struct SMMUv3State {
>       Error *migration_blocker;
>       bool ril;
>       bool ats;
> +    uint8_t oas;
>   };
>   
>   typedef enum {


