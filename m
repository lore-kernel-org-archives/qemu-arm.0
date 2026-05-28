Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B417CD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 08:43:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSWKA-0005v3-7a; Thu, 28 May 2026 04:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSWK9-0005tZ-3W
 for qemu-arm@nongnu.org; Thu, 28 May 2026 04:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSWK6-00070k-VJ
 for qemu-arm@nongnu.org; Thu, 28 May 2026 04:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779957758;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HV8/bNOx0u+eqWzR4k6B1Lnh7yn9bwlRGpeAYgvObmg=;
 b=RyX3UJX/HWFxw5epC78X0bckwpvWvba8Xn7Z+Vws2V6v4X2He93c3VkA+GiaUhfLgY9XMJ
 oWX13yZn3V5mxFYhLk0lESsR6MRxAIBg+pphYLaG643Tb+Epb1WPU8ulj3iWqjjyZxwSok
 MXEDc1uAyIWlCIbDIJ4uk1Ad01OK/uo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-_JBr9ZwcNyOkQ-W8Ffgnmg-1; Thu, 28 May 2026 04:42:36 -0400
X-MC-Unique: _JBr9ZwcNyOkQ-W8Ffgnmg-1
X-Mimecast-MFC-AGG-ID: _JBr9ZwcNyOkQ-W8Ffgnmg_1779957755
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49058e91639so36395945e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 01:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779957755; x=1780562555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HV8/bNOx0u+eqWzR4k6B1Lnh7yn9bwlRGpeAYgvObmg=;
 b=QTcPOlPa8kDwRBa0V+nNGGaeUnKUDtQQyGlKIN4W4F6erlnta4CHUyEZkLUYX1ojIf
 ENAJmFvFwBcMj7XHsTqSbyD7nVp3/fCN61nXu61J2hfotgElajt05VSmKpq/X2VYtGFn
 aYtmtIglKxiouEnyBU4MnweONnv9LpDH3/UctAaCE3U6GJucHfFg38n2NVUkVZbKXeiH
 KGAuPaQwV57vJ7z5pn48vHjURdkwpEYY67xenMtvaKs6S7nflxTV+LEQuZ5g4UprXWXp
 HIj5DrhXc5XbibOS7ceNFQvXyDbnVtcHAgnDMqCjRoyjhO+kHGvpP41Qy/keqgIfGzy0
 lVNg==
X-Forwarded-Encrypted: i=1;
 AFNElJ92A5Ya1cMcVAhKqbeUE+CGrC4xIc16GMvb/gPYvbwlKftRLh9oyZZ1aCOgTyX2TU4liu9cMA9kJw==@nongnu.org
X-Gm-Message-State: AOJu0YyNtuBCsVv7nbAI2PE59pGyTtSUuaG1b5uEPrk2U31MAthgvt9/
 URu4QXpNrRt62Iyf2ZYLa0o9KoQe5X0C9Sg2nbxtkAjMv6qZn/WnUmbS/loO8b0rxNMPZLbuwnB
 Xh761DbnZVLo7BVvN2xfmsq9iHrUPu0tOzH+Qopx/C/hQ8CLVh9TBJA==
X-Gm-Gg: Acq92OGmpBY8WSsD4cOptMzE+fwmiSRtdfzJ3+JYPP/qT2pBJBJwbGnl6UUbgvGyD14
 kcOpDGRzYL0NjvlzQS4UZlA4WSzCvKdgDfB6nhs5oraGr5pLKhkDRTBzRaY2a3MnzdDDX4AaY18
 mtQaLevbzhDSeYFt55LUaucieIvCkl3T4naqleoZqj3fany8pEqSy9pJAAqpiVOkosEnvnt2+4r
 ZpvNNtegG8L9iSUql9ht/oBtzhOmZ6jGqhmfNuvQOmAoQ1zxraX0Ia+D0YXVTV/GGARHhv2ItVS
 rv47eUiV4+EoPnC4o0oM61JNYHXBfnIhzP4jTmSGj4UxB9h+ekLwGeWzABx2QmST/u1xPExOsL6
 WjgMgiQGxM0lC7z3k/a+coWTEb7Hzomya2TviTjLmY7TrBrBhsgbbEmgvrAJ/1QWS9z7/BoU106
 yhnb8l
X-Received: by 2002:a05:600c:1f87:b0:48a:8905:a500 with SMTP id
 5b1f17b1804b1-490424ad9abmr425606105e9.12.1779957755341; 
 Thu, 28 May 2026 01:42:35 -0700 (PDT)
X-Received: by 2002:a05:600c:1f87:b0:48a:8905:a500 with SMTP id
 5b1f17b1804b1-490424ad9abmr425605735e9.12.1779957754984; 
 Thu, 28 May 2026 01:42:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909298d41bsm25597885e9.11.2026.05.28.01.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 01:42:34 -0700 (PDT)
Message-ID: <37caa2b8-b9bf-4006-8fa4-b417e8881fbd@redhat.com>
Date: Thu, 28 May 2026 10:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] hw/arm/smmuv3: Set default ats, ril, ssidsize, oas
 to auto
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
References: <20260527221631.612026-1-nathanc@nvidia.com>
 <20260527221631.612026-9-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260527221631.612026-9-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CmL2XXt81V2t3vNRmxP3f4BALxrysZZkaTbkHxjzwts_1779957755
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



On 5/28/26 12:16 AM, Nathan Chen wrote:
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
> ---
>  hw/arm/smmuv3.c   | 23 +++++++++++++++--------
>  hw/core/machine.c |  5 +++++
>  2 files changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 97ac893d86..4e630b6403 100644
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
>          "device assignment before enabling.");
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
also I think the set value sould be <= host range, to make it consistent
with the rest, no?

Eric
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


