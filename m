Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFA9CD3436
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 11:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLJnu-0005LI-Ec; Fri, 08 May 2026 07:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLJnm-0005Jk-Vx
 for qemu-arm@nongnu.org; Fri, 08 May 2026 07:55:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLJnl-0004fp-B6
 for qemu-arm@nongnu.org; Fri, 08 May 2026 07:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778241328;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WsxtBHLSHqKqyisDPYE5u0LkoD80jxKDWGsBFVoBR38=;
 b=MXZfVNcZNYzIItAn5bVnjCa4HOGMimRffhbbXqai4TDRLxrq7nG7a8cx/v4khTiDxFG911
 +Jgf7llPIJY0T+mfWoWPOBtan0EOM8CLV5eApY7NzacLPI5JMsofMnD+ksW6z/gofS1uP9
 IqIpR72IieCxHM2x0pUWWzjBxTR19MM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-t1ALECesNeuekXyW82N8VQ-1; Fri, 08 May 2026 07:55:27 -0400
X-MC-Unique: t1ALECesNeuekXyW82N8VQ-1
X-Mimecast-MFC-AGG-ID: t1ALECesNeuekXyW82N8VQ_1778241326
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-488d3eec9bcso13257465e9.3
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 04:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778241326; x=1778846126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WsxtBHLSHqKqyisDPYE5u0LkoD80jxKDWGsBFVoBR38=;
 b=FRsKJGQ/7LXhc8nxeD3MYMobEKNA2sRrSnihI8mQBi4Wewi3md+hrvb9ldqAhGCOfY
 Xlsc8q6Cc4ofh5WQFjUPaXj9nRBI1CCLXrSaFJx4P3cVJqWn7zLJlLGKRgvEyPMSi2d8
 zZDZc8ShoxGbCQRct/vgMXv4h3zygQ+RAjq5B1GH179j/h4NRGaYRKa3FGT1p/j92fxh
 IPWyZ1jl1HimkbIu5eHfPIeG4tq6Uu+1D2X/IeZvz9/yI0+8130xl4IXC1RKDb1EnXAF
 /Cxrp8IUwEvWcv2gzlWHu57F9FERWUtRldsZycHeQPrXp0xgSoMfLQRi91HTNP/u40Tc
 D6Dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ82yK7jkW3E3Yz8ombNKC1lnB48RitLRjuUTOB3527JnziW5/hLZ7p7AF3K3jSUWPi1+kfV4u/YYw==@nongnu.org
X-Gm-Message-State: AOJu0YxZWw8Sr1dHa5dfTSfs0pHxz2HoAisy2SnmzhfX8PrMJYRDeQfO
 vvRpNZ7Egb6qnVO+NFJNpTDkpGL4jY8iBBvgUK8G6wskd84Pcp+WwJeShCi2yq/2ZbWz5/YZqvA
 Jz0wJLIwqWmMjTi4lw63exjM8AYulDTDYcF27AZa+QvwWhNBxG+ITxg==
X-Gm-Gg: AeBDiesj0oohpXYUjYbL33F5pICsVMrFxMDuBWRIAsLB/v/d7n5c693TObL5mZSM6vg
 gg+VLt6c+k9lYVXF6xAJjT4Pxl9L6I486eOteAiSWZrRIPoIdbrTMpuANEUf3zYd9Ae5HDNegMt
 aS12iGCqhhZZRnA9VpcppR6JFjfCCxR2dKJN6HytnGOKkUQ/aoltCmf1kJEZzlYvvcH8NBo40fo
 moE1fCLoBeYYcS2xMAGWFU5o2gyb0WQ8P8g98O9rr30Yk8okgHT6Mvz+X6av+xMJ36acvLXpbB5
 OkUlne263C9ehCTxHrMG6EKo0RV0TIsFznBBWoeXSjTncigdq2NPJvI5q3lSpf+IdtWkAL2wzHS
 fCpMRhLbDPiEuHbWNPjOTFK9O6EP6/pS5ep1d57SayLcdSs53fpwCeQJUkzfU9EZrPKEybA==
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id
 5b1f17b1804b1-48e52bd5035mr219722305e9.14.1778241325940; 
 Fri, 08 May 2026 04:55:25 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id
 5b1f17b1804b1-48e52bd5035mr219721695e9.14.1778241325445; 
 Fri, 08 May 2026 04:55:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e68eb85d7sm32743005e9.7.2026.05.08.04.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 04:55:24 -0700 (PDT)
Message-ID: <c258d8b4-6086-4292-9d66-e34e0a060bee@redhat.com>
Date: Fri, 8 May 2026 13:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] hw/arm/smmuv3: Set default ats, ril, ssidsize, oas
 to auto
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260422204335.23116-1-nathanc@nvidia.com>
 <20260422204335.23116-7-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260422204335.23116-7-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NaAEGpZLfMes1rJqOzjRTTeejivA5ZttqjHSTRN564M_1778241326
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Nathan,

On 4/22/26 10:43 PM, Nathan Chen wrote:
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
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3.c   | 14 +++++++-------
>  hw/core/machine.c |  8 ++++++++
>  2 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 39a6f72938..e8ca6be34a 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2135,11 +2135,11 @@ static const Property smmuv3_properties[] = {
>      /* GPA of MSI doorbell, for SMMUv3 accel use. */
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>      /* RIL can be turned off for accel cases */
> -    DEFINE_PROP_ON_OFF_AUTO("ril", SMMUv3State, ril, ON_OFF_AUTO_ON),
> -    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_OFF),
> -    DEFINE_PROP_OAS_MODE("oas", SMMUv3State, oas, OAS_MODE_44),
> +    DEFINE_PROP_ON_OFF_AUTO("ril", SMMUv3State, ril, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_OAS_MODE("oas", SMMUv3State, oas, OAS_MODE_AUTO),
The previous suggestions I gave wrt AUTO mode only held for accel mode.
So maybe we should put the consolidated info in qemu-options.hx and not in 

object_class_property_set_description. In this latter we shall only list valid value default.

Here I would add a comment reemphasizing that AUTO values for non accel
is ON/OFF/44/0

Thanks

Eric
>      DEFINE_PROP_SSIDSIZE_MODE("ssidsize", SMMUv3State, ssidsize,
> -                              SSID_SIZE_MODE_0),
> +                              SSID_SIZE_MODE_AUTO),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2167,7 +2167,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "configured in nested mode for vfio-pci dev assignment");
>      object_class_property_set_description(klass, "ril",
>          "Enable/disable range invalidation support (for accel=on). "
> -        "Valid values are on, off, and auto. Defaults to on. "
> +        "Valid values are on, off, and auto. Defaults to auto. "
>          "Please enable if host platform supports RIL, and disable if "
>          "host platform does not support RIL.");
>      object_class_property_set_description(klass, "ats",
> @@ -2176,10 +2176,10 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "Please ensure host platform supports ATS before enabling.");
>      object_class_property_set_description(klass, "oas",
>          "Set Output Address Size in bits (for accel=on). "
> -        "Valid values are 44, 48, and auto. Defaults to 44 bits.");
> +        "Valid values are 44, 48, and auto. Defaults to auto.");
>      object_class_property_set_description(klass, "ssidsize",
>          "Set number of bits used to represent SubstreamIDs (SSIDs). "
> -        "Valid values are 0-20 and auto. Defaults to 0. "
> +        "Valid values are 0-20 and auto. Defaults to auto. "
>          "A value of N allows SSIDs in the range [0 .. 2^N - 1]. "
>          "A value of 0 disables SubstreamID support. A value greater "
>          "than 0 is required to enable PASID support.");
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 0aa77a57e9..a668bb2ec3 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,14 @@
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "qemu/audio.h"
> +#include "hw/arm/smmuv3.h"
> +
> +GlobalProperty hw_compat_11_0[] = {
> +    { TYPE_ARM_SMMUV3, "ats", "off" },
> +    { TYPE_ARM_SMMUV3, "ril", "on" },
> +    { TYPE_ARM_SMMUV3, "ssidsize", "0" },
> +    { TYPE_ARM_SMMUV3, "oas", "44" },
> +};
>  
>  GlobalProperty hw_compat_10_2[] = {
>      { "scsi-block", "migrate-pr", "off" },


