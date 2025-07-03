Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp373509dyc;
        Thu, 3 Jul 2025 01:02:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWadvRFGYODY0nEmjUyXYQuSvTNTmdqOoBs66EoOPn2JtqvgH1GkPv1WTt2d8/WHafQaZVeN+nFfPtNGA==@linaro.org
X-Google-Smtp-Source: AGHT+IHTFlVa39tp1RV4Eo0h5RFRPGDTSrsibHsHXej8kO2+idNlDQj0DxwikhQXzQAPng0BlL9A
X-Received: by 2002:a05:622a:487:b0:4a9:72ed:6c48 with SMTP id d75a77b69052e-4a98799538dmr39297381cf.14.1751529725544;
        Thu, 03 Jul 2025 01:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751529725; cv=none;
        d=google.com; s=arc-20240605;
        b=hTNVytQLueLebvwJn05AEoWXqYcQYYcYew01Ffi9MxSQz+lUgaGRmgvYHBVtgiL1Hy
         fkOSUBJXF1uP8WBMwSxt5h5xm/Yww+704k004OfCDqNj1jI76a4BIN2NR0/kpBPhjbyC
         M5w701OCoJwqY87Cozh+NlYB8y7QaJ4lorA7YS4Z45l2T/SpxKGKV747cPw2bz42Hs/A
         L3TnADibgfOYz0y8yqUjNiVfm5CWVQT/zTZ5jyLP5rTzuY54LaQznYwA8pBbuEAac2v4
         xlqW7xo4QZLngoSk5+e9CsyA3MCHoQEdRTGJRBasLAIfKepoXdglnhmpU/AU2pPw2OMc
         adsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3c3DKauhdLkdsks44u+qLiNGjcmkNrdblfu+4EWIQ+w=;
        fh=UtzWrwUScRPkPRs10OzZprZ6IjlNheZm1wrONN0J0fg=;
        b=fD12yzb+1bR+CJpL67FYYbe5hQJgmcAYmgNiMXysmfU2uywKEsTbBpknbVr7sYMFVs
         S6r6kMt8XSIwtayYHZHUTVDGZuq+ZBJlpXPBcwnkanAlI9wsrlXu284oi2/5tYYc9DSD
         hPMeooV8Cfcvsbb7Z+YCn/yaARgasyutdcU1bjl0nJwk38j5bvK0O5wCPuSPUTMDroqE
         BmNZX56nyQWubViT5jOjOhf+Pfcy0nQB56PaR8OeNpZ4P4RGd/1SCpCN0EgAFo1KhTiW
         cuWJ11HQ+Qd+SdmbpgTvbtDPOpHH2K8ljjC4T6WgO5laiVRUNMlh424F3/6mnGrpCoff
         9tfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QsmPI6kM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc5538e5si134446701cf.500.2025.07.03.01.02.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 01:02:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QsmPI6kM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXEt6-0007Im-Ke; Thu, 03 Jul 2025 04:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uXEsx-0007HQ-5e
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 04:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uXEst-0000YG-6w
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 04:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751529687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3c3DKauhdLkdsks44u+qLiNGjcmkNrdblfu+4EWIQ+w=;
 b=QsmPI6kMCV1wFmSt1jAOQ818gXkSU348vpdFSxPe9GbyVJ0p09LhfpVmiJenHk1yPm5X6G
 KTAgAJuRV4+/sXF1Jiyj/WWxqdcyrdAgEYlpJ42UPE54hNMm82nScyEggkF1ysCxL1vCN2
 7KdoJJVNE97wO4/toeaLYOOEdYttbjI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-FvHdMcBUOnidfWEeutq1gQ-1; Thu, 03 Jul 2025 04:01:26 -0400
X-MC-Unique: FvHdMcBUOnidfWEeutq1gQ-1
X-Mimecast-MFC-AGG-ID: FvHdMcBUOnidfWEeutq1gQ_1751529685
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-313f8835f29so6938364a91.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 01:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751529685; x=1752134485;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3c3DKauhdLkdsks44u+qLiNGjcmkNrdblfu+4EWIQ+w=;
 b=dmQQgihwE840+epheY4I6zN+OlyXyN+KNQOD5hv2l53iRVc6oHO9FD4zk89T33Zgt+
 YcdTqr227RWhuJdEPWkEPnhE2zgS1lcTtFGOwybzxd0/OBv5NzZRcVV1P8W7ox7pAmkR
 St+JrdUG4me14GFrDukXYRUSpWGQDIrD48toeIGSTJ0n46xEA8TByUQV659KNz0IqhHQ
 bga1Einjlg4115Ofr/cGdJIAzqNeUhMkSMCrBVVutXuz7Ki+waeu1HYI5He5X/iZVmvy
 gmS/pQh5cWgYcXPiBZPbkgiumlYyiHX79TWlZqFXFYF2sCk5/N34ZiJ4mel0d4IIMyU2
 2uZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZDAmQFkcLcENSXqzbR+ApFBRxfSUolX0P1Kz7gyBZXomKUnv8nN4NwpP6xXqEvtlAO2E2xDa5Q==@nongnu.org
X-Gm-Message-State: AOJu0YyJHAH4ZOPoxWoJmyj6SxjTfguATCv2e35LZwgnDEkAB1/llIL8
 eFKUb4kSf3DAs96G/4jfx7z6FF/TofX679jAsHttraicpc4690hIjU8ZX6Gl6MMIptR4KWwU7Jf
 /AUzsj34iwRcjVjmmwH7rQLZHpX4rvcJY/aOvcBQ9PpbToMEUKd/ZuA==
X-Gm-Gg: ASbGncvMM1cKplVWSR2oGQCGyq1f/R044w6NpN44qhEppVOCe3FF0DuyrkwoWtfGk/v
 Qc69+TAlJo46jK+AP4OjOz5LAnAbJWpw/Wc+BgJpGUWK9RJpR8LvfZzcGfsBZpj0vJD1xcawD0C
 GzY40RMdIadg/YDAGg3HKsBCkIsvTtdXbdpFWf2DqNl+nvI6WtyfzKoi/zLWgC5IiHBcmVB/1iq
 R+mw2KRG4GJ+b5lFsRZcsT3ZQS9CeWDxdWHk29tAuHl3586Hd4udzb3nnFm5bc5Fiu0XZR9xbIn
 qJ8oHkU5bnOd/m+M01IxUX2koQ==
X-Received: by 2002:a17:90b:3b8c:b0:311:ab20:159a with SMTP id
 98e67ed59e1d1-31a9d6998d2mr2989905a91.29.1751529685266; 
 Thu, 03 Jul 2025 01:01:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8c:b0:311:ab20:159a with SMTP id
 98e67ed59e1d1-31a9d6998d2mr2989840a91.29.1751529684756; 
 Thu, 03 Jul 2025 01:01:24 -0700 (PDT)
Received: from [10.72.116.69] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e1b28sm156294035ad.33.2025.07.03.01.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 01:01:24 -0700 (PDT)
Message-ID: <bd2ae425-a144-4655-9b9e-f74fd3d82edd@redhat.com>
Date: Thu, 3 Jul 2025 16:01:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] hw/i386: Add the ramfb romfile compatibility
To: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250703012836.2177297-1-shahuang@redhat.com>
 <20250703012836.2177297-3-shahuang@redhat.com>
 <f47d2860-ed26-47c7-9ec0-9fb77d7b7694@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <f47d2860-ed26-47c7-9ec0-9fb77d7b7694@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XXF_Xd-ptZlAc0cDLtnhb9tAUBLAiOriTemufEe2kbI_1751529685
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: Akov6GRWvww5

Hi Eric,

Thanks for your review.

On 7/3/25 12:54 PM, Eric Auger wrote:
> Hi Shaoqin,
> 
> On 7/3/25 3:28 AM, Shaoqin Huang wrote:
>> Set the "use-legacy-x86-rom" property to false by default, and only set
>> it to true on x86 since only x86 will need it.
>>
>> At the same time, set the "use-legacy-x86-rom" property to true on those
>> historical versioned machine types in order to avoid the memory layout
>> being changed.
> 
> I would improve the commit message by adding Gerd's inputs:
> 
> "
> ramfb is a sysbus device so it can only used for machine types where it
> is explicitly enabled:
> 
>    # git grep machine_class_allow_dynamic_sysbus_dev.*TYPE_RAMFB_DEVICE
>    hw/arm/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> TYPE_RAMFB_DEVICE);
>    hw/i386/microvm.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> TYPE_RAMFB_DEVICE);
>    hw/i386/pc_piix.c:    machine_class_allow_dynamic_sysbus_dev(m,
> TYPE_RAMFB_DEVICE);
>    hw/i386/pc_q35.c:    machine_class_allow_dynamic_sysbus_dev(m,
> TYPE_RAMFB_DEVICE);
>    hw/loongarch/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> TYPE_RAMFB_DEVICE);
>    hw/riscv/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> TYPE_RAMFB_DEVICE);
> 
> So these six are the only machine types we have to worry about.
> 
> The three x86 machine types (pc, q35, microvm) will actually use the rom
> (when booting with seabios).
> 
> For arm/riscv/loongarch virt we want to disable the rom.
> 
> "
> 
> This patch sets ramfb romfile option to false by default, except for x86
> machines types (pc, q35, microvm) which need the rom file when booting
> with seabios and machine types <= 10.0 (handling the case of arm virt,
> for compat reasons).
> 

Ok I will improve the commit message with those content.

>>
>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> Besides I think it now does what it is supposed to. With the commit
> description improvement:
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks,
Shaoqin

> 
> Eric
>> ---
>>   hw/core/machine.c             |  2 ++
>>   hw/display/ramfb-standalone.c |  2 +-
>>   hw/i386/microvm.c             |  3 +++
>>   hw/i386/pc_piix.c             | 10 ++++++++++
>>   hw/i386/pc_q35.c              |  3 +++
>>   hw/vfio/pci.c                 |  2 +-
>>   6 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index e869821b22..a7043e2a34 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -39,6 +39,8 @@
>>   
>>   GlobalProperty hw_compat_10_0[] = {
>>       { "scsi-hd", "dpofua", "off" },
>> +    { "ramfb", "use-legacy-x86-rom", "true"},
>> +    { "vfio-pci", "use-legacy-x86-rom", "true" },
>>   };
>>   const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
>>   
>> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
>> index 725aef9896..b20a7c57b3 100644
>> --- a/hw/display/ramfb-standalone.c
>> +++ b/hw/display/ramfb-standalone.c
>> @@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>>   
>>   static const Property ramfb_properties[] = {
>>       DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
>> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),
>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, false),
>>   };
>>   
>>   static void ramfb_class_initfn(ObjectClass *klass, const void *data)
>> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
>> index e0daf0d4fc..6666db9e4f 100644
>> --- a/hw/i386/microvm.c
>> +++ b/hw/i386/microvm.c
>> @@ -49,6 +49,7 @@
>>   #include "hw/acpi/generic_event_device.h"
>>   #include "hw/pci-host/gpex.h"
>>   #include "hw/usb/xhci.h"
>> +#include "hw/vfio/pci.h"
>>   
>>   #include "elf.h"
>>   #include "kvm/kvm_i386.h"
>> @@ -633,6 +634,8 @@ GlobalProperty microvm_properties[] = {
>>        * so reserving io space is not going to work.  Turn it off.
>>        */
>>       { "pcie-root-port", "io-reserve", "0" },
>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>>   };
>>   
>>   static void microvm_class_init(ObjectClass *oc, const void *data)
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index ea7572e783..8ec8d8ae6d 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -49,6 +49,7 @@
>>   #include "hw/i2c/smbus_eeprom.h"
>>   #include "system/memory.h"
>>   #include "hw/acpi/acpi.h"
>> +#include "hw/vfio/pci.h"
>>   #include "qapi/error.h"
>>   #include "qemu/error-report.h"
>>   #include "system/xen.h"
>> @@ -77,6 +78,13 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
>>   static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
>>   #endif
>>   
>> +static GlobalProperty pc_piix_compat_defaults[] = {
>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>> +};
>> +static const size_t pc_piix_compat_defaults_len =
>> +    G_N_ELEMENTS(pc_piix_compat_defaults);
>> +
>>   /*
>>    * Return the global irq number corresponding to a given device irq
>>    * pin. We could also use the bus number to have a more precise mapping.
>> @@ -482,6 +490,8 @@ static void pc_i440fx_machine_options(MachineClass *m)
>>                                      pc_set_south_bridge);
>>       object_class_property_set_description(oc, "x-south-bridge",
>>                                        "Use a different south bridge than PIIX3");
>> +    compat_props_add(m->compat_props,
>> +                     pc_piix_compat_defaults, pc_piix_compat_defaults_len);
>>   }
>>   
>>   static void pc_i440fx_machine_10_1_options(MachineClass *m)
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 33211b1876..0096eef6f4 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -45,6 +45,7 @@
>>   #include "hw/i386/pc.h"
>>   #include "hw/i386/amd_iommu.h"
>>   #include "hw/i386/intel_iommu.h"
>> +#include "hw/vfio/pci.h"
>>   #include "hw/virtio/virtio-iommu.h"
>>   #include "hw/display/ramfb.h"
>>   #include "hw/ide/pci.h"
>> @@ -67,6 +68,8 @@
>>   
>>   static GlobalProperty pc_q35_compat_defaults[] = {
>>       { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>>   };
>>   static const size_t pc_q35_compat_defaults_len =
>>       G_N_ELEMENTS(pc_q35_compat_defaults);
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index f4fa8a5610..604b337389 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -3710,7 +3710,7 @@ static const TypeInfo vfio_pci_dev_info = {
>>   
>>   static const Property vfio_pci_dev_nohotplug_properties[] = {
>>       DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
>> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, false),
>>       DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
>>                               ON_OFF_AUTO_AUTO),
>>   };
> 

-- 
Shaoqin

