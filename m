Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp85210dye;
        Thu, 26 Jun 2025 01:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVminicmmH5h1UuZuETyuiKqLP3zQODIRVlg4ms9xILYwUFeuftQ9iqTCj5uc/AZQjIaxuEsr4HW2BOZA==@linaro.org
X-Google-Smtp-Source: AGHT+IGGFYLK17XjYqFoqn8hef7CkiM3WUfNOXejIObXu958WSg+kS+0GIVHN6wcTUULff/DX8Se
X-Received: by 2002:a05:600c:3ac4:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-4538875c521mr26007975e9.18.1750924906528;
        Thu, 26 Jun 2025 01:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750924906; cv=none;
        d=google.com; s=arc-20240605;
        b=biz3mDzDWo1QCPRymudh1yF9mCMoxVZ9pH15W7ekWLNopmyvLQqYspNNDorCyfA/M3
         AoiAulmg7CuTxqwNMFkz2EmhOfPRvc7JRhmq56NXNrpvYz4vqiVu53q0fvIGrWAuA3OJ
         CDuqEH6SJzsuaaKI2gQsSM6ntUSVL0wlrsze1UIgX0OKX0lF/40Q7vqIxd9FfE73+SYk
         f+pHBHQfI8r09XktAzJIcYTIHL70W2jjQxe4KIxVCh3mgKwAR9z/uNW45zXuUVGQE/cp
         jDjWlLLAzq4GIq/DUoBhqpPQ33KTgJTsOjexnlcn7HnrurlzpdNyogoHCm8M5vYGAqBj
         c5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ewWo6Zakc4NuqMUKw6/WMwVuqLaBsbu3NFCk7+WCJL8=;
        fh=QDyhSQmyrtRkNCRr0Utv12C9kDwOz9ks2veEIA0+SMk=;
        b=a7J2Z/FwxjWaYdwplkemn2yqPkeom2yFlAnhXhUTcXv8BPtm2uD1/FxwaReeRtsQif
         hUeAFnk30ENnKCHgxdgdBKT2HVPjVd2nirxaMZTYAmV63p4TcUBBvvyqhhBNfwq+12SV
         BlHlxDtLhTo9/CbG6pZWburdEXPMKNy/Hi+ow8llQltAHNahxSDMu4jNsCEaql9FGgTx
         MkZGgdrYkDA7I4rBksS+2TyN3y1/CpSFMo/vUT0wpqCSorAbkhNo0BTW3Szly3m/CrcW
         QVko5xJm14evk+CHdc5M5ZVthmvCEV2Ru5IxnqE504ZkTHlVI8N3COYUMtNZFKs0WCfg
         GXMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WjHvgBBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-45382356473si28271685e9.52.2025.06.26.01.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 01:01:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WjHvgBBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUhY8-0008DE-8P; Thu, 26 Jun 2025 04:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uUhY6-0008CJ-RM
 for qemu-arm@nongnu.org; Thu, 26 Jun 2025 04:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uUhY2-0005T6-QK
 for qemu-arm@nongnu.org; Thu, 26 Jun 2025 04:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750924889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewWo6Zakc4NuqMUKw6/WMwVuqLaBsbu3NFCk7+WCJL8=;
 b=WjHvgBBC9JI1dzXFuhUuYpnu/HVDeESGSpj3wtMSDESF4Vx4jytBWGLAj1gI4cwQG0z1s4
 qA+uTWj02q7a/KfWSdXwe28doq9lyWmsx65wnAGrbxUkJB75d49SVFGkRLvsUhDlfDDYBg
 /fVtH71aIyGXabGo71ZLLfm4hKxXETo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-hkoKTXx2PYejqzMsDN554g-1; Thu, 26 Jun 2025 04:01:26 -0400
X-MC-Unique: hkoKTXx2PYejqzMsDN554g-1
X-Mimecast-MFC-AGG-ID: hkoKTXx2PYejqzMsDN554g_1750924885
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450d290d542so3575385e9.1
 for <qemu-arm@nongnu.org>; Thu, 26 Jun 2025 01:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750924885; x=1751529685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ewWo6Zakc4NuqMUKw6/WMwVuqLaBsbu3NFCk7+WCJL8=;
 b=S+jfve1vPYVgX4FFHkBtatwB8Lhp/l2CLVjNjtbCWW9XYs9rHht5INxAMX7n8iFplb
 zvDmZDNPRjbVSx+nLy5uvZYIp/Uhnraj4P/WGmZCm60NCh0m7nnYHE/AIE9Y+XH+2URH
 KqiVT4qcvwL+sRSyCsoylfq9Yn9yKbLf0oEu6I0JpYDnMl/lMpBCeKdM1lvy8hfVezeW
 i0ZgiVpmOx+AxwEc19HCQtxJUFiDYXFMt9ujctUrUgFMd6wi01EIplMsoRrQoebhjr9G
 y2O590iQVCwxozf5Gr3uy4OYUFFurq8GoscG24mQ6IEYhevF3XVY1RW1vcFyic24GC7P
 tZBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgwEy9JA9T0YeKiDiC2QKdwfWGyczIdQ8YwAtg1evcUAvOdRAx6aXxOiHv29gAkisdTRN94GSYKw==@nongnu.org
X-Gm-Message-State: AOJu0YxzdrvrR0FAcKPbt+NtsEQxOUvct097EvAk4mL+c3sC18gK+uFK
 FKAJkG4Fur5LQylczCIaGG14J0DBiYKcP4vPbUasmEiFXAE4FBi3ZFgn3iuqZCId7Vjmde2uARb
 8zUm9lDWN+bIP5OnnWBmSlLBoXBN8Vij1gEKkK2jMBkAKZBxBVtBPnA==
X-Gm-Gg: ASbGnctHjV9ouog+NnN7oC5ErOuNrk70JVETxv4HdgD2kO21R50eAkGRl8k/Pu5SnjH
 luikPCatjYIzdx6685dqixWNvJMG8ZplaRr7hsUEwW7GcCxR9BzdJTq47dJAvMAy747yMzLNZ2b
 UwFi8EnWoF2T4v5QC3xuGBq45ZDe791l2huTYHk4K+ClJxJ4nFoN90641YEqGfhkAxCWGEFsO7N
 CbpWN4lAykEm5xKx9JHFopJRYf4UnXg7QU+AFMCLk3UApfQHmwQogzbZoPKbzwW3JbeqzTpPE42
 6ZPKVd7/TaoRKHCIC3n5uoTrsEkZOu6mg98kaLiQbN424B+qY2t8h4SU5wwVPBRO
X-Received: by 2002:a05:600c:35c9:b0:450:d00d:cc with SMTP id
 5b1f17b1804b1-453886d53d9mr27473855e9.2.1750924884498; 
 Thu, 26 Jun 2025 01:01:24 -0700 (PDT)
X-Received: by 2002:a05:600c:35c9:b0:450:d00d:cc with SMTP id
 5b1f17b1804b1-453886d53d9mr27473105e9.2.1750924883811; 
 Thu, 26 Jun 2025 01:01:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823b6e9esm42310265e9.28.2025.06.26.01.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 01:01:22 -0700 (PDT)
Message-ID: <8c3cce88-fab5-4bf1-bc6b-804730e9889d@redhat.com>
Date: Thu, 26 Jun 2025 10:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hw/i386: Add the ramfb romfile compatatibility
To: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org
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
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <ba75ac62-db52-491e-8944-2bf27106d0a6@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hU1tXsNhIREYpeLPJGZ6ELOLaaHsHC-pn38-fCN8haU_1750924885
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
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
X-TUID: nIzh+0N2EJgn



On 6/26/25 4:05 AM, Shaoqin Huang wrote:
> Hi Eric,
> 
> On 6/23/25 5:20 PM, Eric Auger wrote:
>>
>>
>> On 6/17/25 5:05 AM, Shaoqin Huang wrote:
>>> Set the "use-legacy-x86-rom" property to false by default, and only set
>>> it to true on x86 since only x86 will need it.
>> s/compatatibility/compatibility in the title
> 
> Ok. Will fix it.
> 
>>>
>>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
>>> ---
>>>   hw/display/ramfb-standalone.c | 2 +-
>>>   hw/i386/pc_q35.c              | 3 +++
>>>   hw/vfio/pci.c                 | 2 +-
>>>   3 files changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-
>>> standalone.c
>>> index af1175bf96..ddbf42f181 100644
>>> --- a/hw/display/ramfb-standalone.c
>>> +++ b/hw/display/ramfb-standalone.c
>>> @@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>>>     static const Property ramfb_properties[] = {
>>>       DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate, 
>>> true),
>>> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
>>> use_legacy_x86_rom, true),
>>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
>>> use_legacy_x86_rom, false),
>>>   };
>>>     static void ramfb_class_initfn(ObjectClass *klass, void *data)
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
>>>     static GlobalProperty pc_q35_compat_defaults[] = {
>>>       { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
>>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>> this will only keep the legacy behavior along with q35 machine type but
>> not on other machines being used for x86. what about pc-i440fx? Doesn't
>> it apply to it as well? Are there other machine types also impacted.
> 
> Ok I will also add it with pc-i440fx. I think only q35 and i440fx are
> impacted.
> 
>>
>> Also what about Daniel's comment in v3:
>> https://lore.kernel.org/all/aEak8utPPkHepVfR@redhat.com/
>> "For non-x86, historical versioned machine types will need
>> likely it set to true, in order to avoid the memory layout
>> being changed IIUC."
>>
>> Is it actually needed?
> 
> If those machine types need to set it to true. I think they can set it
> after they have this property.
nope it does not work like that. In case we really need to take care of
this, this must be handled by compats.

Thanks

Eric
> 
> Thanks,
> Shaoqin
> 
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
>>>     static const Property vfio_pci_dev_nohotplug_properties[] = {
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

