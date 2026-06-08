Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C90CD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 09:22:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWWBQ-0001Ic-R6; Mon, 08 Jun 2026 05:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wWWBM-0001HY-KP
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:22:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wWWBK-0005no-Ul
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780910526;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PCRIJ/nkoZvJQPHHr6M0TIXThbK7yCd5/htQLuMB6k=;
 b=ImoVGsXibtd/2nfl84F3RkYj9av7v6Uec3FOUzzo6s9PkktaLvNeif3ypLgZOf/pUyGS4x
 gL9zrdgd7q+5ZYqLfDs1vO758MYvHFleJ3ektttwgDHGEmBgzbS+x2o5l1hcXqlqkAcxiK
 nZMpPSOoLmZMpWTTAGycrO2AS5tB8nk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-zKVO-Vk1P3GN2kII7OcLzw-1; Mon, 08 Jun 2026 05:22:04 -0400
X-MC-Unique: zKVO-Vk1P3GN2kII7OcLzw-1
X-Mimecast-MFC-AGG-ID: zKVO-Vk1P3GN2kII7OcLzw_1780910524
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-bec405b1c6fso238008166b.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 02:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780910524; x=1781515324;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1PCRIJ/nkoZvJQPHHr6M0TIXThbK7yCd5/htQLuMB6k=;
 b=g0KSNFbktd2ui2yJGBSeOFSJRHiItus3EdBbMh/gLpC9NrsUz1Hf16C5E3fc2crlYt
 Y6k2ASkMQGH/nFyOaFMrANBRKfeybwQmWB2hoCRtjOalN8KARgbMyU/uaia5DQlkfwbW
 2V6PbEH23MBCyOnBodtiUp1SlC8BwUPZvzFKgYTuLPpJOBwyKOFCUVjqpSwV4uUkOX2p
 p6OcZdBKcM+buxQUFk9GBfC2lW1JLPG2imj5wTSzU/p20PmuQGOdHyhjyO67Xgk8JTF9
 ZaGKISJ3Bzua8Z49TJg6lM/MJtmCTCVeQMcphDWY/Q/ow4WcadRtKHa38QB5/R2aGPR5
 QqAw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+tbfbzKN7g9wcbqfsXCMQ0pY2so8DuVPpo7pnbTUpbyyDz8h2Hgro3LPDyOTDZIXkzdESA0jKSfA==@nongnu.org
X-Gm-Message-State: AOJu0YwHGzzn4YjPACCVZ0R+8qvBzl2rLN1lIolJSWM/kOp+DF7Ofpr3
 Zk6jTx+Png3ukzbbt4sL41LlAOhQQe/MVJoslRGmR3DjaxKl1xT10pDlGvp42sLomdhbKsKKZNA
 b+xrssIDMJTaBbAOsMDBcTG/b0iF0hRyXBNX6Yrgd7NZ0oHlg0YQt/Q==
X-Gm-Gg: Acq92OGrD9f7bhynD6CqVgHpQT1JG+4efPHGx3aKc6bCuLw5qbGXGdE1WkgHUaGnZn6
 0Ov3eUXDuy0hGIKEi8RvnywV09xbA9Mc9D/Fs3IxxVpvtQJJWNs+vXsRU9c/F8QST3lfaCY8SfI
 NAKdlEeIG6E9ASTf69yT3UXopLoPkpQW2GuaGg6vq5xvJ4fRHj2hE9mskYpGIMK0cVAEa4/apoG
 5oCTorYqzXnsEbu5U1EcpQsuujwC/y6WOePr77m0wZvuZ7S4baKhubl3CdhXArKKYqhkx4bn8Nq
 wml2Qc+EBjLgcG6tqjBsqLHRnOxrk6rDPOOuXwdjJRZnaZGcaP4x+/hgsMWHlYQsXUrD2iLnPca
 iJrGJWAvoqNSfOmsDB3eJjmsVX20nqrgjx/KYxW7+S8/E28WYGafR8Ni21vUu4YHMz4L7OOKCHA
 jm2tV3
X-Received: by 2002:a05:6402:3807:b0:66f:2ea5:c269 with SMTP id
 4fb4d7f45d1cf-68fa503900cmr6856024a12.15.1780910523589; 
 Mon, 08 Jun 2026 02:22:03 -0700 (PDT)
X-Received: by 2002:a05:6402:3807:b0:66f:2ea5:c269 with SMTP id
 4fb4d7f45d1cf-68fa503900cmr6855998a12.15.1780910522925; 
 Mon, 08 Jun 2026 02:22:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6915a637180sm2871162a12.26.2026.06.08.02.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 02:22:02 -0700 (PDT)
Message-ID: <01c228d2-96ca-4b71-9546-4944ed6e8910@redhat.com>
Date: Mon, 8 Jun 2026 11:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] hw/arm/smmuv3: Set default ats, ril, ssidsize, oas
 to auto
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
References: <20260605001712.1823737-1-nathanc@nvidia.com>
 <20260605001712.1823737-9-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260605001712.1823737-9-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R3FP2Z86yGBIz3OwJat3FTHj40fcwH5P7gD8j_4jwMo_1780910524
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



On 6/5/26 2:17 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Set the default value of ATS, RIL, SSIDSIZE, and OAS to auto, in order
> to match the host IOMMU properties when accel=on.
>
> If accel=off and these property values are set to auto, the default
> property values defined in smmuv3_init_id_regs() for OAS and RIL will
> remain unchanged, while SSIDSIZE and ATS values will remain initialized
> at 0.
>
> Introduce a new compat for the changed defaults.
>
> Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>  hw/arm/smmuv3.c   | 23 +++++++++++++++--------
>  hw/core/machine.c |  5 +++++
>  2 files changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 89289ab6d2..83fa6468fd 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2129,12 +2129,19 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
>      /* GPA of MSI doorbell, for SMMUv3 accel use. */
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
> +    /*
> +     * AUTO values for accel=off will resolve to:
> +     * ril: on
> +     * ats: off
> +     * oas: 44
> +     * ssidsize: 0
> +     */
>      /* RIL can be turned off for accel cases */
> -    DEFINE_PROP_ON_OFF_AUTO("ril", SMMUv3State, ril, ON_OFF_AUTO_ON),
> -    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_OFF),
> -    DEFINE_PROP_OAS_MODE("oas", SMMUv3State, oas, OAS_MODE_44),
> +    DEFINE_PROP_ON_OFF_AUTO("ril", SMMUv3State, ril, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_OAS_MODE("oas", SMMUv3State, oas, OAS_MODE_AUTO),
>      DEFINE_PROP_SSIDSIZE_MODE("ssidsize", SMMUv3State, ssidsize,
> -                              SSID_SIZE_MODE_0),
> +                              SSID_SIZE_MODE_AUTO),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2164,22 +2171,22 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "enabling.");
>      object_class_property_set_description(klass, "ril",
>          "Enable/disable range invalidation support (for accel=on). "
> -        "Valid values are on, off, and auto. Defaults to on. "
> +        "Valid values are on, off, and auto. Defaults to auto. "
>          "Any attempt to turn it 'on' while the host does not support "
>          "it would fail.");
>      object_class_property_set_description(klass, "ats",
>          "Enable/disable ATS support (for accel=on). "
> -        "Valid values are on, off, and auto. Defaults to off. "
> +        "Valid values are on, off, and auto. Defaults to auto. "
>          "Please ensure host platform supports ATS before setting it "
>          "to on.");
>      object_class_property_set_description(klass, "oas",
>          "Set Output Address Size in bits (for accel=on). "
> -        "Valid values are 44, 48, and auto. Defaults to 44 bits."
> +        "Valid values are 44, 48, and auto. Defaults to auto."
>          "Please ensure the value does not exceed the maximum "
>          "Output Address Size supported by the host platform.");
>      object_class_property_set_description(klass, "ssidsize",
>          "Set number of bits used to represent SubstreamIDs (SSIDs). "
> -        "Valid values are 0-20 and auto. Defaults to 0. "
> +        "Valid values are 0-20 and auto. Defaults to auto. "
>          "A value of N allows SSIDs in the range [0 .. 2^N - 1]. "
>          "A value of 0 disables SubstreamID support. A value greater "
>          "than 0 is required to enable PASID support."
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 63baff859f..3339da99ee 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -38,9 +38,14 @@
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "qemu/audio.h"
> +#include "hw/arm/smmuv3.h"
>  
>  GlobalProperty hw_compat_11_0[] = {
>      { "chardev-vc", "encoding", "cp437" },
> +    { TYPE_ARM_SMMUV3, "ats", "off" },
> +    { TYPE_ARM_SMMUV3, "ril", "on" },
> +    { TYPE_ARM_SMMUV3, "ssidsize", "0" },
> +    { TYPE_ARM_SMMUV3, "oas", "44" },
>  };
>  const size_t hw_compat_11_0_len = G_N_ELEMENTS(hw_compat_11_0);
>  


