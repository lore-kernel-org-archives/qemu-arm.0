Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp753437dye;
        Fri, 27 Jun 2025 01:31:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzknlEfw03vpVj75/Uscwx/JfNQFW0gNkEzMGDC/ImaOedXBsjxycY6iiiLfpOa3qBt8+HXGLkKtPWzg==@linaro.org
X-Google-Smtp-Source: AGHT+IF/GihYlWXIlTQRE+0wSYgn6Rs5OkjytRuSGRI7nhq8OoyEENTpvOkP4RdAxtePsV+LPbRP
X-Received: by 2002:a05:6214:20a2:b0:6ff:16da:ae22 with SMTP id 6a1803df08f44-6ffffd77c32mr44104116d6.17.1751013093900;
        Fri, 27 Jun 2025 01:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751013093; cv=none;
        d=google.com; s=arc-20240605;
        b=QfUUgDCb6sX1YRyh4bW+imeS1g/zsz2D2u1XHFylrBYnOBry6kBcn5Smv33nHTIkkZ
         n4+hXH0y0HgEZPfgJbjs0W6xC0Uj7xvCqihnoTp8CEOFdMrrwqma5fVyTvCjAPsEsmiR
         InvHTAWojPQ1pz6nKPsmWgDPopvzghM8cmrgSjaYvUy24VDffwYzBEYxiIkVDp4VjJpV
         cNYMdcwP13fXkaxUJsj9IIDCfZOOvPG/G5OrPWjNU01pgjhazBEnQ0Sc1tDmtOTHlL2L
         AufUKO0js9UFKKQVXgvgJBkj3gY2/XQ6WbGe0/pUlvTOVPm9QZUOZ4B8vZoqsytvCqg8
         GVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H9vNAbrfTapzjaXOc4keS/GfzjK59G3vSxEWRyMAHZo=;
        fh=CIGUwGPBB+BaF5yrY8sP+m6PuLte5x49sp/1/H5j5+4=;
        b=kjsaaNhh9p6nMaDWx8GM1enlFjwK5AJuaKEZcyrrs3j/DObKrPgT+soX5wJmab2aLd
         /Od+nAUlsP1pz3hiaTFj39F1M1LBiDEBFKJ0bjiz3HZ6mZDXVAexLSLOZ67RxaIAvFQB
         T6j3lbHzRqdhsbX5Uw0TRx8pRD4eCWHgObY9pphHKJLFKKCB8QcBYXjmI4Mh10oftTYz
         dziHyTR0cw2KEyk5BAvOknvPGQh+4u6DjuyUCQKnuJ+0JujQHjRftRpSDLI7JKm+lqiH
         rAPiXOqbCXrOKJ4rvFrNh9+GqJraME5rX7sAOXiIKlk4D1g3ul2y+m3Yho/7+Ov1GjJ/
         8Icw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vs/utAAq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7736b689si38083346d6.288.2025.06.27.01.31.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jun 2025 01:31:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vs/utAAq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uV4UR-0001Zn-2w; Fri, 27 Jun 2025 04:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uV4UK-0001ZQ-Bt
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 04:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uV4UD-0003CD-K5
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 04:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751013061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9vNAbrfTapzjaXOc4keS/GfzjK59G3vSxEWRyMAHZo=;
 b=Vs/utAAqGSOHVbIRi6jl8FN4A1Bgz0cPh94NhrmBqHs4EQmq8WX0D+RSQUCxBkwEGrlpme
 LIPXk1wcrKtAtW75QMERUslpr2qw/85loNbv85sJzCzLFnFgM96Fa+KH5A0yNC3glMMwpN
 BlZsSjSr+ai/zwX2KI0luTQz8TNq4Sw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-dR-3hYcHN5yujvovAIxkdw-1; Fri, 27 Jun 2025 04:31:00 -0400
X-MC-Unique: dR-3hYcHN5yujvovAIxkdw-1
X-Mimecast-MFC-AGG-ID: dR-3hYcHN5yujvovAIxkdw_1751013059
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso3311066a91.0
 for <qemu-arm@nongnu.org>; Fri, 27 Jun 2025 01:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751013059; x=1751617859;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9vNAbrfTapzjaXOc4keS/GfzjK59G3vSxEWRyMAHZo=;
 b=pIw9RoT3lQjK0yMtXlT68ue/me0IxeLLYT0+8kilCHxyJRNLSpidFBcnGDr18rgSA4
 VtPXYsUdS1/gIRAXTvz1ep4aN3SMg60E1/RUqHPn4/wj3M870OgL/Xn41OE2GDxbazfj
 46xQlsrQS39akTSiytOLmU7iccq3VQrkJBC9FgxfNsl1QG6iYnkQpAqOA/l41S/Zd9wk
 bOORXnE0lwPkfskmPvBqHqIM/zza1JDpeEyOqPiyA7VaesFX78IcNOGmkzq/mW+ehr5j
 28KZeHp1CMi5AXs6sfJpoAdkQzoSUSryTucSQ22lMhhD5PXh/Ti025VO7+V5pMHUuUL2
 eeIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc2pgcN22fZUdB2MogtmNyQ3RXhVhgdUlrRv+JytY9sbhw+Mj+vDSgVdQ4fnU3DWComOTXpyfT/A==@nongnu.org
X-Gm-Message-State: AOJu0YzWHTS/Dbzw14VwEcBBo43iEnp0Jkr4MYaA+czG8edrAeckLheC
 dmrBTY9U///5DbynjFPBXAvE1ecrVRt83Bw+9VgXJsUm3H33VPjfjxsH+2YLU+ULKCMQz/BFds1
 m9PUK62bh2LPqpFCUW9CLHqZyE2l8csXhePtTkLHU60JATkY/CcmL3PM1+TwCSA==
X-Gm-Gg: ASbGncvGT7F6m8VBi/FpaI3tiU1Z0ajsGEsER6wpko/3mqXFm/DxhJc/e8kom93o10/
 LBx8ITJAjqZg649b5LIZwdSPNeBJEytjjTNZs3yji5kLZVERfXAUbS9BPdCvfDkTngPNxlDuloU
 Bph+eb00803vJSfZZ1YFFHBbTgwADhuDgyS3Ksj8k4LWZ9v0gAJKr6keD72j7XgQquss2c5EroW
 GJsVEzg4LvBMOATgHCsLLHw+0Z7gN5AQAmXzWzScyvhXRTfiF32yiuYJ58rj4pPgMZQ07f6LlJz
 fd0IdcpF2Gh5AhPF7ugan5qimg==
X-Received: by 2002:a17:90b:3fce:b0:312:1d2d:18df with SMTP id
 98e67ed59e1d1-318c9264529mr2855497a91.23.1751013058773; 
 Fri, 27 Jun 2025 01:30:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3fce:b0:312:1d2d:18df with SMTP id
 98e67ed59e1d1-318c9264529mr2855466a91.23.1751013058435; 
 Fri, 27 Jun 2025 01:30:58 -0700 (PDT)
Received: from [10.72.116.80] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c14e23aesm1771080a91.31.2025.06.27.01.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 01:30:57 -0700 (PDT)
Message-ID: <3000f15b-9296-44ac-81aa-c95b7c6d3a7e@redhat.com>
Date: Fri, 27 Jun 2025 16:30:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hw/i386: Add the ramfb romfile compatatibility
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250617030521.2109305-1-shahuang@redhat.com>
 <20250617030521.2109305-3-shahuang@redhat.com>
 <aa4ef145-9e08-4ad9-a152-dd8fa2371436@redhat.com>
 <ba75ac62-db52-491e-8944-2bf27106d0a6@redhat.com>
 <8c3cce88-fab5-4bf1-bc6b-804730e9889d@redhat.com>
 <0d59875a-88a0-41f2-99d4-4e7a19de0e14@redhat.com>
 <aF5FD-mvsh5-eMcX@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <aF5FD-mvsh5-eMcX@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NIxWnOxHusK_VwoXsKZeFZu7PV2HvqJKcBSUoNgSZbI_1751013059
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wI/ZEroxbHay

Hi Daniel,

On 6/27/25 3:15 PM, Daniel P. Berrangé wrote:
> On Fri, Jun 27, 2025 at 01:37:55PM +0800, Shaoqin Huang wrote:
>> Hi Eric,
>>
>> On 6/26/25 4:01 PM, Eric Auger wrote:
>>>
>>>
>>> On 6/26/25 4:05 AM, Shaoqin Huang wrote:
>>>> Hi Eric,
>>>>
>>>> On 6/23/25 5:20 PM, Eric Auger wrote:
>>>>>
>>>>>
>>>>> On 6/17/25 5:05 AM, Shaoqin Huang wrote:
>>>>>> Set the "use-legacy-x86-rom" property to false by default, and only set
>>>>>> it to true on x86 since only x86 will need it.
>>>>> s/compatatibility/compatibility in the title
>>>>
>>>> Ok. Will fix it.
>>>>
>>>>>>
>>>>>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
>>>>>> ---
>>>>>>     hw/display/ramfb-standalone.c | 2 +-
>>>>>>     hw/i386/pc_q35.c              | 3 +++
>>>>>>     hw/vfio/pci.c                 | 2 +-
>>>>>>     3 files changed, 5 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-
>>>>>> standalone.c
>>>>>> index af1175bf96..ddbf42f181 100644
>>>>>> --- a/hw/display/ramfb-standalone.c
>>>>>> +++ b/hw/display/ramfb-standalone.c
>>>>>> @@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>>>>>>       static const Property ramfb_properties[] = {
>>>>>>         DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,
>>>>>> true),
>>>>>> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
>>>>>> use_legacy_x86_rom, true),
>>>>>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
>>>>>> use_legacy_x86_rom, false),
>>>>>>     };
>>>>>>       static void ramfb_class_initfn(ObjectClass *klass, void *data)
>>>>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>>>>> index fd96d0345c..f6d89578d0 100644
>>>>>> --- a/hw/i386/pc_q35.c
>>>>>> +++ b/hw/i386/pc_q35.c
>>>>>> @@ -45,6 +45,7 @@
>>>>>>     #include "hw/i386/pc.h"
>>>>>>     #include "hw/i386/amd_iommu.h"
>>>>>>     #include "hw/i386/intel_iommu.h"
>>>>>> +#include "hw/vfio/pci.h"
>>>>>>     #include "hw/virtio/virtio-iommu.h"
>>>>>>     #include "hw/display/ramfb.h"
>>>>>>     #include "hw/ide/pci.h"
>>>>>> @@ -67,6 +68,8 @@
>>>>>>       static GlobalProperty pc_q35_compat_defaults[] = {
>>>>>>         { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
>>>>>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>>>>>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>>>>> this will only keep the legacy behavior along with q35 machine type but
>>>>> not on other machines being used for x86. what about pc-i440fx? Doesn't
>>>>> it apply to it as well? Are there other machine types also impacted.
>>>>
>>>> Ok I will also add it with pc-i440fx. I think only q35 and i440fx are
>>>> impacted.
>>>>
>>>>>
>>>>> Also what about Daniel's comment in v3:
>>>>> https://lore.kernel.org/all/aEak8utPPkHepVfR@redhat.com/
>>>>> "For non-x86, historical versioned machine types will need
>>>>> likely it set to true, in order to avoid the memory layout
>>>>> being changed IIUC."
>>>>>
>>>>> Is it actually needed?
>>>>
>>>> If those machine types need to set it to true. I think they can set it
>>>> after they have this property.
>>> nope it does not work like that. In case we really need to take care of
>>> this, this must be handled by compats.
>>
>> If so. Why don't we still keep the "use-legacy-x86-rom" default to true, and
>> only set it to false to those arch which doesn't need it just like my
>> original implementation.
>>
>> Because I don't really know how other arch's memoery layout was impacted by
>> this property set to false. I think keep their original behavior and only
>> change it on arm64 is a good idea.
>>
>> How do you think about it?
> 
> No, the default value of the property shoudl reflect the long
> term desired behaviour - in this case 'use-legacy-x86-rom = false'.

Ok I understand your thoughts.

> 
> We must then reverse this default to 'true' for ALL historical versioned
> machine types on ALL architectures, where this device is built, or any
> specific machines where we want to keep the historical behaviour going
> forward.

But how do we implement that?

Maybe set the 'use-legacy-x86-rom = true' in hw_compat_9_2 ?

I'm not sure about that, could you give some hints about how to reverse 
the default to 'true' for ALL historical versioned machine types?

Thanks a lot.

> 
> 
> With regards,
> Daniel

-- 
Shaoqin

