Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F12CCFA0C
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Nov 2025 14:36:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGI8W-0008ID-UP; Tue, 04 Nov 2025 09:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGI8W-0008Hv-5a
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 09:35:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGI8T-0002Td-La
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 09:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762266947;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2TwGClYH1z/88OuUCUvYGwOwfOueYyRNR6EbU4rtnk=;
 b=BwXAxql9mKR8ILErhAZhbVcC8zYusgtjoOoM8015VXDP1+o1TEh6XYXukL7Smqy+WOd9Fp
 BFFFZ/Duiq+V5+uSnKyslNC5MElciAKwNHuptpFGRxoQjY4imzdRJorhP3o4CBTdgBd628
 Jfm3uAiH4sS45PH7hJzta88WNLMRJHQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-kOQviEhpMzO6ixM_D-lUyQ-1; Tue, 04 Nov 2025 09:35:46 -0500
X-MC-Unique: kOQviEhpMzO6ixM_D-lUyQ-1
X-Mimecast-MFC-AGG-ID: kOQviEhpMzO6ixM_D-lUyQ_1762266945
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-429c8d07874so1827784f8f.3
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 06:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762266945; x=1762871745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L2TwGClYH1z/88OuUCUvYGwOwfOueYyRNR6EbU4rtnk=;
 b=PO08+TamfXicL7BqhRkVlkGO0JGNpQOcymMbXZ4ogXqEIKwLbW3Kfi1l400XJ3pWKC
 sjD6DTGueNFvPz5XiB1jH0gOFjOP4dS9+SI87EkVWiWAKR2CEv9RyXbCDq2UJbhfQGhX
 s+arLK0W6YVTchBKkK4Vf1tkcxpFvxmN/Ip7G3/8g+i1o+0x/eA2K850zm+UwgMaIK7V
 SwtTPfqLPjhVsiuJ/Plcg0gkYPnh9NxsHgeaOiGj/dE+KtXvDflu/z+LOqy9GhzG/j71
 tNl9KxzjaMFmAi8PvyZrCb92LmRV+IBLVY+wrer2Bj9necR1oJPpVCt8o1kbwaJu19+N
 SijA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx8iSWg+8gmShW6Yc99ngxsx6AcpIbxbf+TawXMIk89cqEt+ifo/chGULXEygT9s8tBeU8v7R6Jg==@nongnu.org
X-Gm-Message-State: AOJu0YzXYkxcNjX0vaYC+s54ez5MculuEc8qcFzp30H1AH1789t3nxBH
 m3ukgUhTGhp50VoXLKG3e/d4UldlN+ysa8JfkYnH+yRs68xusEVu6DmEeYSrzxw+6XQFXHn2XDf
 NlHtxR9HeBtgveJmdcwz4FKZL8pEQ33z7Uaes3jvbXMJAL0VkdbYzH8aQV+wUpA==
X-Gm-Gg: ASbGncvaSLugVbLluN93tDuT7Ozwa6iMDUeX31motxmmTK6WB0INw4YsfFoo5W5v1MR
 MD1YkuqWm6P/nU6L1hURNS0HLb+QQRa/XBUGFby30wRpqiAv5fYH4m3LdAUF22eaKtaOzY6Mb/W
 QdZt/rVagLN4l4NO4yKMqR3C2K6JTMjTKZY17iXIxdMhOkpa0JaBIxoxUeBCyhwKZqaMBqxo+Ji
 c+lejMTXif7xANhsez/B1p6p9yW//1/w+gukWYayMFjJWFmdEDSjQrvfjRBrhjCJPcTiJCEJNQX
 PsmSJiOqWQ16Mftwb+KzTAnx8J+8KRTW2YwCWa0VTK0CmETkzgT8CwxqbFVme/DYuKLsCP8351R
 /fb1QDUCYd/GM8XHBk6EpzzQ+VmWrH/jU8jiygg3wDy29lw==
X-Received: by 2002:a05:600c:828f:b0:475:df91:ddf2 with SMTP id
 5b1f17b1804b1-4773c7862cbmr107238675e9.17.1762266944749; 
 Tue, 04 Nov 2025 06:35:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0/036CHcIdYhlOpaPjZJOrbUzYILvDSG2nXp/dAat3Z6PP4YBEoQaNW84lHpINSYSZpRsnQ==
X-Received: by 2002:a05:600c:828f:b0:475:df91:ddf2 with SMTP id
 5b1f17b1804b1-4773c7862cbmr107238375e9.17.1762266944325; 
 Tue, 04 Nov 2025 06:35:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47755f92274sm39470015e9.9.2025.11.04.06.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 06:35:43 -0800 (PST)
Message-ID: <49215c9d-feb1-4f72-bfe0-799572ecfac2@redhat.com>
Date: Tue, 4 Nov 2025 15:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 28/32] hw/arm/smmuv3-accel: Add property to specify OAS
 bits
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-29-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-29-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OPvBhou1UXQRrYuhEaohA7kfif9dFIc-yEF0k6D5Ys0_1762266945
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.788,
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



On 10/31/25 11:50 AM, Shameer Kolothum wrote:
> QEMU SMMUv3 currently sets the output address size (OAS) to 44 bits. With
> accelerator mode enabled, a guest device may use SVA where CPU page tables
> are shared with SMMUv3, requiring OAS at least equal to the CPU OAS. Add
> a user option to set this.
>
> Note: Linux kernel docs currently state the OAS field in the IDR register
> is not meaningful for users. But looks like we need this information.
I would explain why this is actually needed instead of quoting the linux
kernel docs. I guess in practice the vSMMU can't advertise an OAS
greater than the one support by the host SMMU otherwise the guest might
fail to use the range exposed by the vSMMU.
>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c    | 22 ++++++++++++++++++++++
>  hw/arm/smmuv3-internal.h |  3 ++-
>  hw/arm/smmuv3.c          | 16 +++++++++++++++-
>  include/hw/arm/smmuv3.h  |  1 +
>  4 files changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 5b0ef3804a..c46510150e 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -28,6 +28,12 @@ MemoryRegion root;
>  MemoryRegion sysmem;
>  static AddressSpace *shared_as_sysmem;
>  
> +static int smmuv3_oas_bits(uint32_t oas)
> +{
> +    static const int map[] = { 32, 36, 40, 42, 44, 48, 52, 56 };
> +    return (oas < ARRAY_SIZE(map)) ? map[oas] : -EINVAL;
> +}
> +
>  static bool
>  smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>                                   struct iommu_hw_info_arm_smmuv3 *info,
> @@ -70,6 +76,18 @@ smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>          return false;
>      }
>  
> +    /*
> +     * TODO: OAS is not something Linux kernel doc says meaningful for user.
> +     * But looks like OAS needs to be compatible for accelerator support. Please
> +     * check.
would remove that comment. Either it is requested or not.
> +     */
> +    if (FIELD_EX32(info->idr[5], IDR5, OAS) <
> +                FIELD_EX32(s->idr[5], IDR5, OAS)) {
> +        error_setg(errp, "Host SMMUv3 OAS(%d) bits not compatible",
> +                   smmuv3_oas_bits(FIELD_EX32(info->idr[5], IDR5, OAS)));
let's be more explicit then and say

Host SMMUv3 OAS (%d bits) is less that OAS bits advertised by SMMU (%d)



> +        return false;
> +    }
> +
>      /* QEMU SMMUv3 supports GRAN4K/GRAN16K/GRAN64K translation granules */
>      if (FIELD_EX32(info->idr[5], IDR5, GRAN4K) !=
>                  FIELD_EX32(s->idr[5], IDR5, GRAN4K)) {
> @@ -649,6 +667,10 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>      if (s->ats) {
>          s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, 1); /* ATS */
>      }
> +    /* QEMU SMMUv3 has OAS set 44. Update IDR5 if user has it set to 48 bits*/
vSMMUv3 advertises by default a 44 bit wide OAS
> +    if (s->oas == 48) {
> +        s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS_48);
> +    }
>  }
>  
>  /* Based on SMUUv3 GBPA configuration, attach a corresponding HWPT */
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 5fd88b4257..cfc5897569 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -111,7 +111,8 @@ REG32(IDR5,                0x14)
>       FIELD(IDR5, VAX,        10, 2);
>       FIELD(IDR5, STALL_MAX,  16, 16);
>  
> -#define SMMU_IDR5_OAS 4
> +#define SMMU_IDR5_OAS_44 4
> +#define SMMU_IDR5_OAS_48 5
>  
>  REG32(IIDR,                0x18)
>  REG32(AIDR,                0x1c)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index d95279a733..c4d28a3786 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -299,7 +299,8 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
>  
> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> +    /* OAS: 44 bits */
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS_44);
>      /* 4K, 16K and 64K granule support */
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
> @@ -1961,6 +1962,15 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>              error_setg(errp, "ats can only be enabled if accel=on");
>              return false;
>          }
> +        if (s->oas != 44) {
> +            error_setg(errp, "OAS can only be set to 44 bits if accel=off");
> +            return false;
> +        }
> +        return false;
> +    }
> +
> +    if (s->oas != 44 && s->oas != 48) {
> +        error_setg(errp, "OAS can only be set to 44 or 48 bits");
>          return false;
>      }
>      return true;
> @@ -2087,6 +2097,7 @@ static const Property smmuv3_properties[] = {
>      /* RIL can be turned off for accel cases */
>      DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>      DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
> +    DEFINE_PROP_UINT8("oas", SMMUv3State, oas, 44),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2119,6 +2130,9 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>      object_class_property_set_description(klass, "ats",
>          "Enable/disable ATS support (for accel=on). Please ensure host "
>          "platform has ATS support before enabling this");
> +    object_class_property_set_description(klass, "oas",
> +        "Specify Output Address Size (for accel =on). Supported values "
> +        "are 44 or 48 bits. Defaults to 44 bits");
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 5fd5ec7b49..e4226b66f3 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -70,6 +70,7 @@ struct SMMUv3State {
>      Error *migration_blocker;
>      bool ril;
>      bool ats;
> +    uint8_t oas;
>  };
>  
>  typedef enum {


