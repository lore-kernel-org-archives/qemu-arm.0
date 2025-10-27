Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B47CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 18:16:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDRl8-0004Pv-4H; Mon, 27 Oct 2025 14:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDRkx-0004LI-1c
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 14:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDRkl-0003qp-TS
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 14:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761588929;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlPU6INEkr+d8DWhH3VNveZdJMLbf5AEBQljCmivt7Y=;
 b=LULl0irbwEoG8LOXZxJK7SN0cGjdnhlZpuLouCUWeJqSDEVWvUBzyU69X82WkFhM+UJ/JW
 OY7eHWp1E2xfP/6riT6ps2hMsCibwstTV5ZWvwxv5qP+3Xyeh0n2ucdlwVtoeGSo5+madn
 lW5ylIVOwHf1B5D7KGHI/0XY902op3w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-pquNNwfUM5epZ-G5A6IE3g-1; Mon, 27 Oct 2025 14:15:27 -0400
X-MC-Unique: pquNNwfUM5epZ-G5A6IE3g-1
X-Mimecast-MFC-AGG-ID: pquNNwfUM5epZ-G5A6IE3g_1761588926
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-40cfb98eddbso3345321f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 11:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588926; x=1762193726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NlPU6INEkr+d8DWhH3VNveZdJMLbf5AEBQljCmivt7Y=;
 b=hB0z8jFfHH1I+hk1rpg/tL4PyOggY09Bdrbn1A/bNUYsplD/j0StOOzDm3diZUePJz
 HRaGkH95cTh9WajJDYJpYFsoZB+QzYwe7r5he4NBfwJtgR6Qj/0/9XDd1lpI7DycXMAw
 ariczJFUsgHdDXHgH5lospKJiN3VpRXQL/iIggN5YXyW3G6310wqDRgeGnXlHoMMS5ga
 C8hV/Fwun8URmtKWZ5Wo42bsYXA+KuDFojPHAk53bowpRQU74gHarGWJOgvN948yrDW3
 teZJQ7NDewHx/QhlYB0FEhxoOfEMpGBA+Z9LQ6/yRH1FgIn7p7lwnXyXvz2Bp0ESouPv
 cJ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc6/RZGJPFcix7NwKYOz10qcrIpLHSjxHEbiojdeToekVmrP85HmAACzyPd7fH14fiSNvaCbuyiQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz4GYcp9lFpgNTPuukVnUEe1y8rOMvDa0rrkkJCArUAGFYqjyxx
 sW5nbXAEvC2kSvxwMmRZiBL6YIdBg+emUJP/cFaK2VcxXDr6v+ftBa2Fcbrj5gU6F7pkbupTXXb
 zwhABbfPgUu1Tj4cVv+lCo/WIJVZ3LBfk8QXOu5AMgAGFsMpALuh/vQ==
X-Gm-Gg: ASbGnctRXfqEf5p1R6btOm+LeDKhtee6RZp3rbONd/rW0BoiN6waA61/X5FPFFf91hY
 x4ArMVLxWATEDekQMQ3Blyl22CfuZ/9Py4riNhLfcSfhLhyrrp2iRjWrwGM/dQqaXrxU7RRzsvz
 SBRRtoAfaX2H34YaRklGiyZiI0SPKfIi1GRixW/nMOXKQ9+E1N85ylBuJkAaaiU/DoXp7P0GPRy
 QSOHZhvYo6Q1LAXXdL3ogWd/JlGElqef05KTPS0+9Al2PprDuN26Cww5xO9509gT5VStMLI9o/z
 zH0+mktQc7MQbKIr/L2aa4r5Gwj2owhEr/LUc36rTO7mFMNXQOesJmbM6lYbthVELfzaY3mRA0t
 jY+YXQ6wxN1JRNuyGexkJxitXW7G/D6IEG81rvsSWuDrY/w==
X-Received: by 2002:a05:6000:4026:b0:429:8b01:c0a1 with SMTP id
 ffacd0b85a97d-429a83e5042mr356152f8f.28.1761588926152; 
 Mon, 27 Oct 2025 11:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsba+lI3QJ7uNt6CK7w6dX8AJirT51qqgUAN+AH0jdAWRSsJevtWPgbWHgci2Ivc+FZibmQQ==
X-Received: by 2002:a05:6000:4026:b0:429:8b01:c0a1 with SMTP id
 ffacd0b85a97d-429a83e5042mr356112f8f.28.1761588925718; 
 Mon, 27 Oct 2025 11:15:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb55asm15551916f8f.17.2025.10.27.11.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 11:15:25 -0700 (PDT)
Message-ID: <e4eef901-174a-4dad-bd0a-860d705673e1@redhat.com>
Date: Mon, 27 Oct 2025 19:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 27/27] hw.arm/smmuv3: Add support for PASID enable
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-28-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-28-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U9abxh4HMPWCDioo8130j0hda0E7euDxCx7fsR6ew2k_1761588926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> QEMU SMMUv3 currently forces SSID (Substream ID) to zero. One key use case
> for accelerated mode is Shared Virtual Addressing (SVA), which requires
> SSID support so the guest can maintain multiple context descriptors per
> substream ID.
>
> Provide an option for user to enable PASID support. A SSIDSIZE of 16
> is currently used as default.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c    | 24 +++++++++++++++++++++++-
>  hw/arm/smmuv3-internal.h |  1 +
>  hw/arm/smmuv3.c          |  8 +++++++-
>  include/hw/arm/smmuv3.h  |  1 +
>  4 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 283d36e6cd..0de9598dcb 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -79,6 +79,13 @@ smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>          return false;
>      }
>  
> +    /* If user enables PASID support(pasid=on), QEMU sets SSIDSIZE to 16 */
> +    val = FIELD_EX32(info->idr[1], IDR1, SSIDSIZE);
> +    if (val < FIELD_EX32(s->idr[1], IDR1, SSIDSIZE)) {
> +        error_setg(errp, "Host SUMMUv3 SSIDSIZE not compatible");
> +        return false;
> +    }
> +
>      /* User can override QEMU SMMUv3 Range Invalidation support */
>      val = FIELD_EX32(info->idr[3], IDR3, RIL);
>      if (val != FIELD_EX32(s->idr[3], IDR3, RIL)) {
> @@ -635,7 +642,14 @@ static uint64_t smmuv3_accel_get_viommu_flags(void *opaque)
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
> @@ -664,6 +678,14 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
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
>  /*
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 910a34e05b..38e9da245b 100644
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
> index 7c391ab711..f7a1635ec7 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -604,7 +604,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          }
>      }
>  
> -    if (STE_S1CDMAX(ste) != 0) {
> +    /* If pasid enabled, we report SSIDSIZE = 16 */
why do we chose 16 and not a bigger value to avoid incompatibility?
worth a comment
> +    if (!FIELD_EX32(s->idr[1], IDR1, SSIDSIZE) && STE_S1CDMAX(ste) != 0) {
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 does not support multiple context descriptors yet\n");
>          goto bad_ste;
> @@ -1962,6 +1963,10 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>          error_setg(errp, "oas can only be set to 44 bits if accel=off");
>          return false;
>      }
> +    if (s->pasid) {
> +        error_setg(errp, "pasid can only be enabled if accel=on");
> +        return false;
> +    }
>      return true;
>  }
Just skimming though the SMMU spec, I don't see any handling for
STE.S1DSS anywhere
Also I would expect some C_BAD_SUBSTREAMID likely to be emitted?

Thanks

Eric
>  
> @@ -2088,6 +2093,7 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>      DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
>      DEFINE_PROP_UINT8("oas", SMMUv3State, oas, 44),
> +    DEFINE_PROP_BOOL("pasid", SMMUv3State, pasid, false),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index d3788b2d85..3781b79fc8 100644
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


