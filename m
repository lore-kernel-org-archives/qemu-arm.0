Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3482076qtb;
        Tue, 1 Jul 2025 20:29:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNcO13nymuYS3psRTrWtIoO1sw/hjsecoaKtV/0P1CBhLDgOpDnvhiFnl1PGCXDr9un4v8Pnrvb7arXA==@linaro.org
X-Google-Smtp-Source: AGHT+IHdpFxfHVhPbwvg44udxdKyF6frPj5JdbIyuzSoxBCm8wVI8Wq60T5ZZ1DYOHtV3AjFV37I
X-Received: by 2002:a05:622a:5888:b0:4a6:f518:6b19 with SMTP id d75a77b69052e-4a9769af705mr24999031cf.28.1751426954548;
        Tue, 01 Jul 2025 20:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751426954; cv=none;
        d=google.com; s=arc-20240605;
        b=gijiYZl+WwlqnR9Hm9Cjxdu08ZCVPuszXiPN6yw1bKaAnD1EE03hDxSskcwnN5hmMh
         b6DnmFWxU+67h6ydY3raeD55vQGk00pE6bi96iS5czZQ6vyVOjzZt9+Y3v02HyiK5x5l
         DefKxvL9F1e+enZgbUvLj/P3Tr/I6bpYkaDGxCQNhJgvstXjnLZHQtWku7TT1zkph493
         rEEsQ+Syd/7yRafHHtK1Pu/6T/z/TtWVDUdggoghF6Oh7hCmyexnsdIoE7mxWGtxvuyN
         hX5qZwAj/I9b0zrJDKCVMybAHfw1gOZ3JREsemh1QXH0sDengH89hlrg1/2C1+jyydwF
         Xp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=853N4R697eBZZO041eDR7e7K85dVK+M5yMIc00G80mY=;
        fh=OiqKoGYRXdnF1j3Ez602hXuPx0wQsQGrS4/kLz8+TYo=;
        b=dx8dXW7twuO5BVOflmhgGRTKgrGu9Q0LkTVgUW/icC2SiZHVt6DFaraAJ68X1fWaCB
         RBgk6N67vu092oBsQrdLJaU+g+sRM5rhjDmzyUpW1eDdCyeu/dZI2B7BTqv4KK8VJpIV
         1fvMyKzP3/HjCh6qbl0lzkIj7tmIpro9LksMkxaTCYt6GCWcHJ86nCbFyTL21nBSQDRA
         tdRO5MVC0HC0//JfP2SKWvMI4e/HhWfLgxRISUhZfNX0mIxYsQOfEqFVulbeZGBFQx7r
         cKpNoMcSr8rzd7FqYGkqVQ6vUykRycTTX4/EIL5X9iEz4ht7VSLufIjWfra+rfDDckwO
         Cgdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BvdYh0R2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc236ee6si120222081cf.340.2025.07.01.20.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 20:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BvdYh0R2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWo96-0000No-8E; Tue, 01 Jul 2025 23:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWo93-0000MR-7I
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 23:28:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWo90-0008JE-UY
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 23:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751426899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=853N4R697eBZZO041eDR7e7K85dVK+M5yMIc00G80mY=;
 b=BvdYh0R2bzsXv5BMv+MW1HPrP1yxRdSJOJGog3DX1XOfvTeouh1IsScdyA1uhzHPRy+ntB
 czMA5qekm78dWviT8JXkGWIbO2KWs6i3w3p0OFzOzNS32vHuWYww1U8zjrPg9fzNrNmywZ
 ltt5va9lSXtYRu9PruovtHUbjvrZdW8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-RtqXtF2FMEeIMIDRRaSW9Q-1; Tue, 01 Jul 2025 23:28:17 -0400
X-MC-Unique: RtqXtF2FMEeIMIDRRaSW9Q-1
X-Mimecast-MFC-AGG-ID: RtqXtF2FMEeIMIDRRaSW9Q_1751426897
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b31c38d4063so2567772a12.3
 for <qemu-arm@nongnu.org>; Tue, 01 Jul 2025 20:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751426897; x=1752031697;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=853N4R697eBZZO041eDR7e7K85dVK+M5yMIc00G80mY=;
 b=rGc30x9b7TTnfMp6X6A1EIMMc/TsTqQDBJunuaAtf7F9xdOe1oZtczQ9U9VCjVUQNv
 EHzqtF1KHiWKGa+/iokWFqgcrC1w50jYqT66NmipzndLJjj1QoOMTjDmIOtHVnyLlZEe
 2wO9GK4kU92/e2p5cj0XofJJC/jBSF+hF9vstHfoAYYCD+G+AMgO0s/QE8o+zha/hrQm
 TdqkqhJ1YqmJTYARyYMe7mHN+kQz/MwyPmelK5yguu3lhf4x85YPC2+s55hHy8Cp/gDd
 RSHn9QeOtEUpJLlWwR1PsB5c+tUOLUDgYNTnPllVdv/qwL+V16czVSJ1Bh2UuaBUv8tH
 TXhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+OXybm8ZTiDtknuT65TcigsN3AA26b8XFxGzhn5I9b55XXP5TAJ/qbtJKGZRix9q/lAlAaMV4MQ==@nongnu.org
X-Gm-Message-State: AOJu0YzTjVpzjYAOGtqrrUQ+wXA4XD+KododHx6HvD2yvFLh+ygf80z7
 B4kldtue1FsUldZ0oaFT/Y8p9RqYs2pjvj7K3CEOSkoLKMbOKRZSGdsJeaOTMykymi+EDoVKV//
 +CvpxqEfmJJrIJW4dVUipoZ3FLV5KcHQSbKtgGfgA3xBNEeXBjrPykQ==
X-Gm-Gg: ASbGncsExrfznSTV6ZGXXibyZeMUow1/In/JuaOlDHc7XvyL7dAnBA5wxYnM/vyOvZC
 ablS5nMmFYuI7akUqDnrafFPH6P9f2krLO0eM49FuGOYN5VJACze/UbIkqE4e6kYJlIV1cKq3RP
 69/mYwhui+vPGnCe0y9JNdb+ymOTJbH5aYiNXXis4lYNayltOhP38N5ITSOoQFaRSguhjgOAIKw
 C2M/4YMjEMtZiZc9iqiXviHQaQjADOtmNXJC73HrhZgnOf2TvE+6DlSiq0jnGs32NsXEZzAVVct
 IlzgKeqC1CQLIeGHj93FPpPCajk=
X-Received: by 2002:a17:902:eb8a:b0:235:be0:db4c with SMTP id
 d9443c01a7336-23c6e5c5103mr17570325ad.41.1751426896663; 
 Tue, 01 Jul 2025 20:28:16 -0700 (PDT)
X-Received: by 2002:a17:902:eb8a:b0:235:be0:db4c with SMTP id
 d9443c01a7336-23c6e5c5103mr17569935ad.41.1751426896279; 
 Tue, 01 Jul 2025 20:28:16 -0700 (PDT)
Received: from [10.72.116.105] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c5a8csm119762655ad.223.2025.07.01.20.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 20:28:15 -0700 (PDT)
Message-ID: <e7f5a70d-a052-4d37-9cec-5c9595559de7@redhat.com>
Date: Wed, 2 Jul 2025 11:28:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hw/i386: Add the ramfb romfile compatibility
From: Shaoqin Huang <shahuang@redhat.com>
To: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250701030549.2153331-1-shahuang@redhat.com>
 <20250701030549.2153331-3-shahuang@redhat.com>
 <9bbaa0bb-cf32-48f2-aff6-6484285496f0@redhat.com>
 <6347e3a2-23f5-43a3-8b74-503148f3bacf@redhat.com>
In-Reply-To: <6347e3a2-23f5-43a3-8b74-503148f3bacf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: clhefKzFc3EmQqArWTuU2ziUabphk6582tAzg9IRMhk_1751426897
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
X-TUID: 9T3GYfSLpdTn

Hi Eric,

On 7/2/25 10:24 AM, Shaoqin Huang wrote:
> Hi Eric,
> 
> Thanks for your review.
> 
> On 7/1/25 1:17 PM, Eric Auger wrote:
>> Hi,
>>
>> On 7/1/25 5:05 AM, Shaoqin Huang wrote:
>>> Set the "use-legacy-x86-rom" property to false by default, and only set
>>> it to true on x86 since only x86 will need it.
>>>
>>> At the same time, set the "use-legacy-x86-rom" property to true on those
>>> historical versioned machine types in order to avoid the memory layout
>>> being changed.
>>>
>>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
>>> ---
>>>   hw/core/machine.c             |  2 ++
>>>   hw/display/ramfb-standalone.c |  2 +-
>>>   hw/i386/pc_piix.c             | 10 ++++++++++
>>>   hw/i386/pc_q35.c              |  3 +++
>>>   hw/vfio/pci.c                 |  2 +-
>>>   5 files changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index 63c6ef93d2..349aec1e0d 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -46,6 +46,8 @@ GlobalProperty hw_compat_9_2[] = {
>>>       { "migration", "multifd-clean-tls-termination", "false" },
>>>       { "migration", "send-switchover-start", "off"},
>>>       { "vfio-pci", "x-migration-multifd-transfer", "off" },
>>> +    { "ramfb", "use-legacy-x86-rom", "true"},
>>> +    { "vfio-pci", "use-legacy-x86-rom", "true" },
>> why 9.2? The 10.0 machine type should also apply the previous "true"
>> default setting. To me the new default shall only affect the latest 10.1
>> machine type.
> 
> It seems what I understand is wrong, I thought the 9.2 is the historical 
> machine type.
> 
> 10.0 machine type is the current machine type, it also should be 
> included into the historical machine type when we add the property.
> 
> ok I will update it again with add those property into 10.0 machine type.
> 
> Thanks

One more question, now the qemu doesn't have the hw_compat_10_1, should 
I first add another patch to add it just like the commit:
0a7c438a42 hw: add compat machines for 10.0

I think it should have the hw_compat_10_1 first, then I can add the 
property into it.

Thanks,
Shaoqin

> 
>>>   };
>>>   const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
>>> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb- 
>>> standalone.c
>>> index af1175bf96..ddbf42f181 100644
>>> --- a/hw/display/ramfb-standalone.c
>>> +++ b/hw/display/ramfb-standalone.c
>>> @@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>>>   static const Property ramfb_properties[] = {
>>>       DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  
>>> true),
>>> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, 
>>> use_legacy_x86_rom, true),
>>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, 
>>> use_legacy_x86_rom, false),
>>>   };
>>>   static void ramfb_class_initfn(ObjectClass *klass, void *data)
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 6c91e2d292..4a8bbc0e28 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -49,6 +49,7 @@
>>>   #include "hw/i2c/smbus_eeprom.h"
>>>   #include "exec/memory.h"
>>>   #include "hw/acpi/acpi.h"
>>> +#include "hw/vfio/pci.h"
>>>   #include "qapi/error.h"
>>>   #include "qemu/error-report.h"
>>>   #include "system/xen.h"
>>> @@ -77,6 +78,13 @@ static const int ide_iobase2[MAX_IDE_BUS] = 
>>> { 0x3f6, 0x376 };
>>>   static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
>>>   #endif
>>> +static GlobalProperty pc_piix_compat_defaults[] = {
>>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>>> +};
>>> +static const size_t pc_piix_compat_defaults_len =
>>> +    G_N_ELEMENTS(pc_piix_compat_defaults);
>>> +
>>>   /*
>>>    * Return the global irq number corresponding to a given device irq
>>>    * pin. We could also use the bus number to have a more precise 
>>> mapping.
>>> @@ -477,6 +485,8 @@ static void 
>>> pc_i440fx_machine_options(MachineClass *m)
>>>                                      pc_set_south_bridge);
>>>       object_class_property_set_description(oc, "x-south-bridge",
>>>                                        "Use a different south bridge 
>>> than PIIX3");
>>> +    compat_props_add(m->compat_props,
>>> +                     pc_piix_compat_defaults, 
>>> pc_piix_compat_defaults_len);
>>>   }
>>>   static void pc_i440fx_machine_10_0_options(MachineClass *m)
>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>> index fd96d0345c..f6d89578d0 100644
>>> --- a/hw/i386/pc_q35.c
>>> +++ b/hw/i386/pc_q35.c
>>> @@ -45,6 +45,7 @@
>>>   #include "hw/i386/pc.h"
>>>   #include "hw/i386/amd_iommu.h"
>>>   #include "hw/i386/intel_iommu.h"
>>> +#include "hw/vfio/pci.h"
>>>   #include "hw/virtio/virtio-iommu.h"
>>>   #include "hw/display/ramfb.h"
>>>   #include "hw/ide/pci.h"
>>> @@ -67,6 +68,8 @@
>>>   static GlobalProperty pc_q35_compat_defaults[] = {
>>>       { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
>>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>> I hope we do not omit any other machine that would actually need ramfb
>> rom. At the moment we take care of q35 and  piix. Anyone aware of any
>> other user?
>>
>> Thanks
>>
>> Eric
>>>   };
>>>   static const size_t pc_q35_compat_defaults_len =
>>>       G_N_ELEMENTS(pc_q35_compat_defaults);
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index ff0d93fae0..a529500b70 100644
>>> --- a/hw/vfio/pci.c
>>> +++ b/hw/vfio/pci.c
>>> @@ -3564,7 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
>>>   static const Property vfio_pci_dev_nohotplug_properties[] = {
>>>       DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
>>> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, 
>>> use_legacy_x86_rom, true),
>>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, 
>>> use_legacy_x86_rom, false),
>>>       DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, 
>>> ramfb_migrate,
>>>                               ON_OFF_AUTO_AUTO),
>>>   };
>>
> 

-- 
Shaoqin

