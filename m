Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp689721dye;
        Thu, 26 Jun 2025 22:38:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+Wv0NOrQBalNZqau+5p9wj0BZ8Rt66M4Y4+AA326zDHq9zqwFitRwKDyuJuWb83ek5ulpGXn8KgfahQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE2+r+x9+BPqI49RF2s/7sVuQ/FAfPXQWzGR4g/jNrQRhLbutvplSLTrfYaCjd6zLRrTPuq
X-Received: by 2002:a05:6214:1d2a:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-70002917afdmr31988146d6.16.1751002721918;
        Thu, 26 Jun 2025 22:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751002721; cv=none;
        d=google.com; s=arc-20240605;
        b=aoHaSRYoVLcIA4h7aTsf1GLyIZH9SiVnlIk3g/nz82vE4Js/9FrA5W0PkHa0u0QBey
         UnUR2Y3WNRYiaGZxVh8ALffSoBgXj6uIsvX2wVvPEu43cc4oK/gKuwbzpY0rZIwf8vyN
         U76Xv4AAR7rAYbYioWLItxF/QPtUQO2txNHMRclMuUtkLXqXSkqpbi1TrGrp7yD1Qbip
         SWqG1moI0rV4FtxSdEI16i5UBz+q509L+28RkwLwK+xVhVbqdVmzrSxkvPPbGHN81fY4
         KQJuHEbMuEN6o+k+pdBNDMOfHUNFHarPy5uDA57Pw+NGtep5yCjHx+wG8n9jH6wu8N4I
         Hivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cu4usQ2gQdBazm6/4Ep90beuN7im2paUHjG6ZOfKXEA=;
        fh=v1u57GJAKxCSwbhIWLumSyMKuSrB4ssxGkQV1/uR6NQ=;
        b=hxCvuABJu03+K89++V8w9ajQl4q0/v1E7H6i3HI0mhEx+xHvF8FkWlTi4229ZnxMFC
         8FqAfgpvVwOh5nmcWlpuqaFbqibLNhDiGyE9uWNXSNaZMi0zd0vL7Gm8sYjcL7jV/AcB
         RKEUWOYDB1Rvlti9KUXkwCUMNRuGpfdpjqvHlezvuPNWMorpp2RSrc7RRVeqwreyvSXc
         2WCmXiIa+7V9lHJTSYLYQREYnu3mUg94sNqX612euaATRDv1LbC3kLfrOWxFM5pdZ51M
         afqkeZLKNr1tjkVgj7S123iBzzSLH19Dbl/C/gbhnmKJmBBR5nAdtCisM6PATqkk8eZO
         4aig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kh6+Ly8o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7735487dsi34689686d6.153.2025.06.26.22.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 22:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kh6+Ly8o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uV1mz-0004nC-Bt; Fri, 27 Jun 2025 01:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uV1mx-0004ma-CX
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 01:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uV1mv-0000tY-Cx
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 01:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751002686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cu4usQ2gQdBazm6/4Ep90beuN7im2paUHjG6ZOfKXEA=;
 b=Kh6+Ly8o1Ca3km7J/2sdW8b6nHA9PNKIlN3ommCWiemnvG5PeIbeGxNGlQiSayuEhVsmMv
 5WeV3wU/YTgrECWj8EbYNHKsMiZYiwUDx3XPep2x/BNct8rfeNESfcceUrxpk0V0zKRI6W
 ckdSSQfABE4cqFya3Lf5FbD3xWFNKaw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-SBkRj4LBP6efvMNiCEi-Hw-1; Fri, 27 Jun 2025 01:38:04 -0400
X-MC-Unique: SBkRj4LBP6efvMNiCEi-Hw-1
X-Mimecast-MFC-AGG-ID: SBkRj4LBP6efvMNiCEi-Hw_1751002683
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-234b133b428so13750995ad.3
 for <qemu-arm@nongnu.org>; Thu, 26 Jun 2025 22:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751002683; x=1751607483;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cu4usQ2gQdBazm6/4Ep90beuN7im2paUHjG6ZOfKXEA=;
 b=QydOUHRUHdPpCTnqrkoYP72qhV2sniDEbcCC4iKd1I1KWurSJ2wqfh519QUq/0bsJU
 qEJBez9aNlLWBKqYNG6GVV5V4u8W3eHD1dbXyCaR/cwskQQzteZeBrd1YvvRvYKA35Zr
 /I018qIvxsULFdO5qJi3zlGebk1X9+T25VHcSm51hmCrMavFFxqlfqyFEtQix39ZCYqK
 nlC3uelleeCeYuNXMkc0zED4xAS/m/xPlefvMoXsUOdR1rAnBJ1vxRqHk10W7iqe+XdE
 krJQPc6XRa8Qj+OeQxHtKJ6NPsrJL2vBFlD+I2LNsrB2aQcJjJ4RJlnQ8w6BIBiruWnq
 mqMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCQJP2PIGJjSUOkX9Q6sNJrYRXon2aHhtg7c+sBkFZxaS2NsrBtGZ1q6XBlbXndB1kpkJ3oxh3Gg==@nongnu.org
X-Gm-Message-State: AOJu0YzV2ZTo56FD/S21CTTSXHEm4jf6Qoa0Ok16MbgBmRKQVqOEX/3x
 VMlEQ+cwnmEnRvd6+DuOhT6oht75YX/wmVL9YE/WjSsrUl7ZFdb5Q3HUC0gstqdwwOOpTagGsZ7
 UAMeKb7qAMCSFWDpjaGzhJIUQ2DFhQQKvhXHh8chonDO65zYJhnUDsA==
X-Gm-Gg: ASbGncvp6jpr6uUzpIwlJ/gl7tZHkNfcH6l6ODzpz+V4o4lSnf+/bdzdFsdrzrwRk4Q
 nVaRr2WTQ9b/b5FDInD0U5zHszWRL6yoLQHQ7PrNMjk7paWTBWxWQ7QcuiKLE6/trj36YiFwMMd
 rRTfu0a3a/ZgCsNju1tMYIgoaxqdAX8NXZaisvgMUzfYAdfHy8CfN62PPC++4CHneDWgsb8HxuD
 e/f9yflbnYR5Oc/kXOK7ixyNAL0mYVwgtGmqG0LpTiaAF10SwoS1BW+v3gtV6ZKBgZe8sQyI6z3
 Au9oNyE/K0Ur2hZnxDyKWtstCw==
X-Received: by 2002:a17:902:e54b:b0:234:a66d:ccf5 with SMTP id
 d9443c01a7336-23ac463faeamr30548235ad.49.1751002682756; 
 Thu, 26 Jun 2025 22:38:02 -0700 (PDT)
X-Received: by 2002:a17:902:e54b:b0:234:a66d:ccf5 with SMTP id
 d9443c01a7336-23ac463faeamr30547915ad.49.1751002682397; 
 Thu, 26 Jun 2025 22:38:02 -0700 (PDT)
Received: from [10.72.116.80] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c49casm7126755ad.215.2025.06.26.22.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 22:38:01 -0700 (PDT)
Message-ID: <0d59875a-88a0-41f2-99d4-4e7a19de0e14@redhat.com>
Date: Fri, 27 Jun 2025 13:37:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hw/i386: Add the ramfb romfile compatatibility
To: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
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
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <8c3cce88-fab5-4bf1-bc6b-804730e9889d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XeRgMKEnSOZZpSXdPC-7Dj7YExMp0pOKol5F48sNurI_1751002683
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 42xnUE4u+igN

Hi Eric,

On 6/26/25 4:01 PM, Eric Auger wrote:
> 
> 
> On 6/26/25 4:05 AM, Shaoqin Huang wrote:
>> Hi Eric,
>>
>> On 6/23/25 5:20 PM, Eric Auger wrote:
>>>
>>>
>>> On 6/17/25 5:05 AM, Shaoqin Huang wrote:
>>>> Set the "use-legacy-x86-rom" property to false by default, and only set
>>>> it to true on x86 since only x86 will need it.
>>> s/compatatibility/compatibility in the title
>>
>> Ok. Will fix it.
>>
>>>>
>>>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
>>>> ---
>>>>    hw/display/ramfb-standalone.c | 2 +-
>>>>    hw/i386/pc_q35.c              | 3 +++
>>>>    hw/vfio/pci.c                 | 2 +-
>>>>    3 files changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-
>>>> standalone.c
>>>> index af1175bf96..ddbf42f181 100644
>>>> --- a/hw/display/ramfb-standalone.c
>>>> +++ b/hw/display/ramfb-standalone.c
>>>> @@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>>>>      static const Property ramfb_properties[] = {
>>>>        DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,
>>>> true),
>>>> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
>>>> use_legacy_x86_rom, true),
>>>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
>>>> use_legacy_x86_rom, false),
>>>>    };
>>>>      static void ramfb_class_initfn(ObjectClass *klass, void *data)
>>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>>> index fd96d0345c..f6d89578d0 100644
>>>> --- a/hw/i386/pc_q35.c
>>>> +++ b/hw/i386/pc_q35.c
>>>> @@ -45,6 +45,7 @@
>>>>    #include "hw/i386/pc.h"
>>>>    #include "hw/i386/amd_iommu.h"
>>>>    #include "hw/i386/intel_iommu.h"
>>>> +#include "hw/vfio/pci.h"
>>>>    #include "hw/virtio/virtio-iommu.h"
>>>>    #include "hw/display/ramfb.h"
>>>>    #include "hw/ide/pci.h"
>>>> @@ -67,6 +68,8 @@
>>>>      static GlobalProperty pc_q35_compat_defaults[] = {
>>>>        { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
>>>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>>>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>>> this will only keep the legacy behavior along with q35 machine type but
>>> not on other machines being used for x86. what about pc-i440fx? Doesn't
>>> it apply to it as well? Are there other machine types also impacted.
>>
>> Ok I will also add it with pc-i440fx. I think only q35 and i440fx are
>> impacted.
>>
>>>
>>> Also what about Daniel's comment in v3:
>>> https://lore.kernel.org/all/aEak8utPPkHepVfR@redhat.com/
>>> "For non-x86, historical versioned machine types will need
>>> likely it set to true, in order to avoid the memory layout
>>> being changed IIUC."
>>>
>>> Is it actually needed?
>>
>> If those machine types need to set it to true. I think they can set it
>> after they have this property.
> nope it does not work like that. In case we really need to take care of
> this, this must be handled by compats.

If so. Why don't we still keep the "use-legacy-x86-rom" default to true, 
and only set it to false to those arch which doesn't need it just like 
my original implementation.

Because I don't really know how other arch's memoery layout was impacted 
by this property set to false. I think keep their original behavior and 
only change it on arm64 is a good idea.

How do you think about it?

Thanks,
Shaoqin

> 
> Thanks
> 
> Eric
>>
>> Thanks,
>> Shaoqin
>>
>>>
>>> Thanks
>>>
>>> Eric
>>>>    };
>>>>    static const size_t pc_q35_compat_defaults_len =
>>>>        G_N_ELEMENTS(pc_q35_compat_defaults);
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index ff0d93fae0..a529500b70 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c
>>>> @@ -3564,7 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
>>>>      static const Property vfio_pci_dev_nohotplug_properties[] = {
>>>>        DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
>>>> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice,
>>>> use_legacy_x86_rom, true),
>>>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice,
>>>> use_legacy_x86_rom, false),
>>>>        DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice,
>>>> ramfb_migrate,
>>>>                                ON_OFF_AUTO_AUTO),
>>>>    };
>>>
>>
> 

-- 
Shaoqin

