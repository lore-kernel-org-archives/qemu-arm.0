Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp1250692dyb;
        Wed, 25 Jun 2025 19:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWTlp5Z7LIk78nlArXFKA0KzlMUSHIhf307rjoBJE19FanSN8k0DIANCvAr1Il4imn6imRWwn/WL8qEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEfibXhzPX7oUdxHeRAtN3PMD552Z3z3+TDXDSOCv0UPNBX+NZ3LaEO62AecoKQ6wm84SLv
X-Received: by 2002:a05:6214:6210:b0:6fd:997a:bb47 with SMTP id 6a1803df08f44-6fd997abc97mr7921036d6.14.1750903556908;
        Wed, 25 Jun 2025 19:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750903556; cv=none;
        d=google.com; s=arc-20240605;
        b=We6JjXWu1aC++DyGvxmf9MrhwgmRAFbzD3RhrEhOSSbPTWI+N7nor3uH5osskn/uL+
         QzygRr4F+lXxIgWnNL6AnIAfPBwkZwblViu+gltCwBknZcS0KmEw+WTrhAIg7kNb7FjV
         lRcr/i1/FkyjbFZD/7Ier76poa/9rn/6WZhVv2LQ8uN//EFgoqfcjuXfEQuOCX1iUf3A
         1PeomFHnUVCl9FDauBi5p1A0FOXcwFTlu/Q9yq/yLA14Urn+9cBUK/XNe23m328wUYyi
         nrAabMTp83UjYHNLyJpFCqQkkzybaqNq6Rrc2xhvco7RwXjMXGkcC1XSQ4QJe/tbk9rj
         FTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CsVwtbTXgN1sTCzxD8a29D3ttCsgaT/KYDol/Mtl0o8=;
        fh=Kze5udhMgmDKQkYTZkbD7wwGMCQ1h0ctFEy7IRqNBRc=;
        b=jzRg1NuoRwcdvQTySnSga8M26ZTIR2Zuqe7DWx2Byhdm1u+PYFvGOU25ZDyU2Y7bys
         HjHLgN36L223jfEce7phzF5abifukc1cmK3M/3hPDgAPZe3Ew7/aZL+uGO9m0uidvZVg
         4RYPpaVTE+o8GFdMyl0M4OvCvRjCglWQ0eK31szwIw0FKg4j3bSIMcibXKme9tS9IPZI
         arvXaL4dzt7slZTjCYYrdH50Hc6DfYtL0Sov/nrlM/QkZFkRTh1Zl4PK5qfEYSwMgb6o
         6m2TEsImNSvAQM+ex0ylTu8ChbJQZPFDnHxUiIwaOSP0ZSDaHElHFrh5x7dMS2N5mKtX
         JfVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pbjksrl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773aba80si5040986d6.463.2025.06.25.19.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jun 2025 19:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pbjksrl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUbzK-0002Ia-1C; Wed, 25 Jun 2025 22:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uUbzH-0002I8-CC
 for qemu-arm@nongnu.org; Wed, 25 Jun 2025 22:05:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uUbzF-00009I-Ap
 for qemu-arm@nongnu.org; Wed, 25 Jun 2025 22:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750903511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CsVwtbTXgN1sTCzxD8a29D3ttCsgaT/KYDol/Mtl0o8=;
 b=Pbjksrl2L7TZ6YAZCLtQRHKWsocCvF8pCrPdZe5f8pCtZBzsRMNeoZk9dM159/CPORbTK1
 EjzOdJQGPTZ3h1vIsDOwkMvNKbYZ08cD0/gSQUe8mw0CS1bX9NvBaP1zOvrqPesxlGIKzL
 h7+uOV2m0ypHHbOcBC5oPcXNQGISF1w=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-IsaDaZ0MOwWDagvo2A7h_A-1; Wed, 25 Jun 2025 22:05:09 -0400
X-MC-Unique: IsaDaZ0MOwWDagvo2A7h_A-1
X-Mimecast-MFC-AGG-ID: IsaDaZ0MOwWDagvo2A7h_A_1750903508
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-234f1acc707so4238745ad.3
 for <qemu-arm@nongnu.org>; Wed, 25 Jun 2025 19:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750903508; x=1751508308;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CsVwtbTXgN1sTCzxD8a29D3ttCsgaT/KYDol/Mtl0o8=;
 b=mVNMmE6e02ffPya5aWMjwtNpogZwQkyYT0wIHHL0Rgpn4DEeVPAvmPtKs5KOezkOYP
 WlZ6GPUrv/iifKkLx0YfLRm68GArPozcmUK1rUQTWtgiexdhyuInSNCgSmU0PJtWRTu8
 S9YVB7VVvfEIFSZ6KtqPoIUo52thlFwE9at2Rs7nMxGo0UjEGWECv0yzs0L4KpF+kjD8
 WzyzIBmT3p7PR1UNa7fk1CNcxDpc/ylwrvUJycx0TB5DjaP81jQYnTae2tPzDs15GHgy
 l0Tm/BVGOlXPy9WDxGddIC7lS14PR66T+Dl1TQBcH9NBZxb/KGenKTa/6gx72pB+emNY
 BC5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGxOaw6ebdR/9LJZWuCulXvjUtQgG6laVpUtfjR9N/qPmZnclAYxxYcBNO00I41nkdirApfblN+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yyh7yZ5vw66LQWmYODWwSzikTgqlsYanHN2wnG9+EFcbR35FWa0
 gkka10L0Ptb7W3QsW8HLbXbX8LXpUFT2QzznoxYJ2kfI99pRpNg1s1LEhOAyWfJ+64u0pW4CIHd
 9AeZsi440DHlsruoMDi7BTnKA5CMvMIQP2syDO2vaALs1qjXtksFz7A==
X-Gm-Gg: ASbGncsJYyNyoOr5Hmgz2FfLmQB/O9o5NSo6hm0un9QjjqyBbfn/d+SMj+G6mpFRHsR
 poekiJ/E0jrL1RS+06wHi0NUkzrrwz967rP+4IjqoNQYXzmwdNfFuGWhFVfIaPXTBb6mZIwlixW
 FQVLi5nG0ue15iQ2pmQ3no2F9lRVQhaUqEsDcoaGOqqfKFb6aoz6wrmyWH6wK+QEZpqR35uF2j0
 Y1/4uBJHWwJeXlAun2b5hNoDcTPKPepYjs7ExMfPmcYJS9vsehetzat08ERka7NvP+TS1Y8TQyZ
 K77u+8R14t4OUXEqJ7ehoq/njJc=
X-Received: by 2002:a17:903:1664:b0:234:e655:a618 with SMTP id
 d9443c01a7336-2382403e012mr72256845ad.25.1750903508151; 
 Wed, 25 Jun 2025 19:05:08 -0700 (PDT)
X-Received: by 2002:a17:903:1664:b0:234:e655:a618 with SMTP id
 d9443c01a7336-2382403e012mr72256515ad.25.1750903507787; 
 Wed, 25 Jun 2025 19:05:07 -0700 (PDT)
Received: from [10.72.116.141] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d839389esm145484855ad.41.2025.06.25.19.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 19:05:07 -0700 (PDT)
Message-ID: <ba75ac62-db52-491e-8944-2bf27106d0a6@redhat.com>
Date: Thu, 26 Jun 2025 10:05:01 +0800
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
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <aa4ef145-9e08-4ad9-a152-dd8fa2371436@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pjH3SN4O0l03aCF5ERVUASi_-PA8mN7nWrj6wkDjLhg_1750903508
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
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
X-TUID: 7RUz09EydZ0Y

Hi Eric,

On 6/23/25 5:20 PM, Eric Auger wrote:
> 
> 
> On 6/17/25 5:05 AM, Shaoqin Huang wrote:
>> Set the "use-legacy-x86-rom" property to false by default, and only set
>> it to true on x86 since only x86 will need it.
> s/compatatibility/compatibility in the title

Ok. Will fix it.

>>
>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
>> ---
>>   hw/display/ramfb-standalone.c | 2 +-
>>   hw/i386/pc_q35.c              | 3 +++
>>   hw/vfio/pci.c                 | 2 +-
>>   3 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
>> index af1175bf96..ddbf42f181 100644
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
>>   static void ramfb_class_initfn(ObjectClass *klass, void *data)
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index fd96d0345c..f6d89578d0 100644
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
> this will only keep the legacy behavior along with q35 machine type but
> not on other machines being used for x86. what about pc-i440fx? Doesn't
> it apply to it as well? Are there other machine types also impacted.

Ok I will also add it with pc-i440fx. I think only q35 and i440fx are 
impacted.

> 
> Also what about Daniel's comment in v3:
> https://lore.kernel.org/all/aEak8utPPkHepVfR@redhat.com/
> "For non-x86, historical versioned machine types will need
> likely it set to true, in order to avoid the memory layout
> being changed IIUC."
> 
> Is it actually needed?

If those machine types need to set it to true. I think they can set it 
after they have this property.

Thanks,
Shaoqin

> 
> Thanks
> 
> Eric
>>   };
>>   static const size_t pc_q35_compat_defaults_len =
>>       G_N_ELEMENTS(pc_q35_compat_defaults);
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index ff0d93fae0..a529500b70 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -3564,7 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
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

