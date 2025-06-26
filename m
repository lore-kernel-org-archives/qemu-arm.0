Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp1246861dyb;
        Wed, 25 Jun 2025 18:56:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsJgoP2S1L0NgW+15zGlOC2ZMaBBN/RIOgGOaP05ofwnNJ+NVhCJgxPZSzxptPGY3QvrsCCWy6etGMyA==@linaro.org
X-Google-Smtp-Source: AGHT+IHEltGq6Ol9jFr5m8uizvoyAVK8pOVwBzrq7pr/ykzI+sRtEc2zKkPmA1RzO+H00MX/VHao
X-Received: by 2002:a05:620a:278e:b0:7d0:9e4a:e42f with SMTP id af79cd13be357-7d43bb5ee36mr277390185a.43.1750902967119;
        Wed, 25 Jun 2025 18:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750902967; cv=none;
        d=google.com; s=arc-20240605;
        b=PJODD2pfPQSDypKn7A6dz4cVmfxCRNebk/4xsTHZaqBiYdKc3pPVcKTKZ3U1wTCkZN
         tm4KdmmH/iLBiwVBFwFnljDWEsP9OWQEVF1j96AFQnJn4XHcCLaNrkumyA/k1eIDQ09N
         VdaGHJpPA7rIUq0W0ckoriCQKvMiEpg9KIxiYQDRNf9fjAcL5p4aCVogtJTXUzjAM/OJ
         VYHlzqpN5Bua14zdMglLJAIB7vtCvfGIkYIg0FcOwYEwavWOn+ZVish4+VJRZrttPDMD
         +3ox1hq5OslWaFMN3vkohMbf/A85L5geEnH7i3XtJhCAF0dHCN/CDQD6QkFUT21ImaTJ
         /H+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=olB+v+aEdQZVypCDUMnDbe8D4vsPLXJDiRReSjccnd4=;
        fh=DDqFWS4MbbwoJqw7pUDJ10hB51Ab0vA6SAbvyVbyMMU=;
        b=NlwnwSVSUE1/lN+dh09jeN0GY6XIlGV3KxrPmqqlSrhe3NugqSISeYa81XmD/d7a/B
         i+rzYeZrd4jVLQEMBHE0IsL4O3zcReQDMzZXE6VstgREfE+mrJO1kWqza7YIwyLA+fTt
         rug4O0XmWnCp8bwudjBTDtC06YhNDkj2pNZvifokP28Swz9sG77uhn2G632EyNiq4xgn
         WQs3zZky4LN1+y4nI2yyUtLmjE5LJgTcCNqTKM8SgbJwHkPPYF5TO0imMegpVo/X7Rbg
         ATFwxmdZlVdZqpjyK9XEcmJG2Z38pkBicflZkBDakq2+JQW0jcwJStSeFpqikMHjll9Q
         gObA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PzxPlJYT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d429b03247si289649385a.132.2025.06.25.18.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jun 2025 18:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PzxPlJYT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUbq9-0000MZ-K6; Wed, 25 Jun 2025 21:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uUbq8-0000M2-2X
 for qemu-arm@nongnu.org; Wed, 25 Jun 2025 21:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uUbq5-0005cK-Tg
 for qemu-arm@nongnu.org; Wed, 25 Jun 2025 21:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750902943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=olB+v+aEdQZVypCDUMnDbe8D4vsPLXJDiRReSjccnd4=;
 b=PzxPlJYTBqR8w7lQyZJaDClkJbFxmcAQhouRr9Se4Y3y9UZNgvpUz95kwIFQPTlsWvWGax
 vSd5/I0HV0Ffz1WVVl92gGu3Oz6I7pj2uXWb7VBWNUXjJutCvqJV4vKoZZa22U5+dsp7vB
 YlXoP4snqiWeGcxfkZ2Hmpc5h9i9CoY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-ZH7WmDAcNBWs_Hr566k8Tw-1; Wed, 25 Jun 2025 21:55:41 -0400
X-MC-Unique: ZH7WmDAcNBWs_Hr566k8Tw-1
X-Mimecast-MFC-AGG-ID: ZH7WmDAcNBWs_Hr566k8Tw_1750902941
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235e1d66fa6so5312245ad.0
 for <qemu-arm@nongnu.org>; Wed, 25 Jun 2025 18:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750902941; x=1751507741;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=olB+v+aEdQZVypCDUMnDbe8D4vsPLXJDiRReSjccnd4=;
 b=qBZguFvJUMGw0TqVcNczkJkzGLU4nfpTvh6PDFTSYeSMISgUy8h9e45TFUcm6KGOxn
 Xso0Gzwssj0QxijzQVR12KdmFJBSfKxKY98v6v4gfLqcLKoUjA3u7QPv9VyMsIbAVtiq
 pGb25hbmb0iAj12pWF41G3fhccn2uo3HtMGbudTjq5KHzQ1dItwV/RnVFJM/EiI5TzhH
 TvpTE5qV4La7dL1T139ySEGoBJd0/Zz8+JRC+pdbZw8mgXmhMmR7/00D59Zk2kJ/DSsc
 EnLqqttNywIHUAE7dC6WIk53XadhoYiuTegg/d9o/YFkLtCVnIixrOZUTCCK/84dgGsW
 uSpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHSlg59N5bsvB60mJ8ppxZQdFY+PV0eLT1RcpvrVR962ramUFh5aD2Vh2hOn+brCoxh/Yq3/aUmg==@nongnu.org
X-Gm-Message-State: AOJu0YzAyMvts2O2NtMrtf80kFC2GThkmSDY33B1irCwkAHW6xvK0hos
 N5Ailgj2mWcJwPo69PGwCfsC/qXZqrfWQko25J+iMGo5uVykAAUWM/gedxLLIhMA9gQgRJs1DRO
 LmhvJcnEGohrs0W17n89mD+n8oXd1O7mHi0xcwLOV1c4oT0NjuGNrrw==
X-Gm-Gg: ASbGncuMfiq+qB+kYU/Klu7pMEwqI/JC4+gpc90rqZ8WDQUc60I2XnAX64ztXM+k+c8
 jzUD3sQTlBDKyqSJc+M/4RSsi2dJqtIZyF8rKU+/Yj5vlEgBXnpOoCGrFSCLYn4JE5gfQbxi6T0
 uAu2w8rztRGRInMfdEMK88ar3SsjN+huC9HvACd2zRULUmW3Cf/SY27kJOgYIN3H4gCQCXBLf2x
 4hgGnGIG5mV+5HH/hL7Tggy6u1JwaxCNHIlQ+bZBSoFt8k93YAmf6VlORJ5ECk5OMoRBtKp016n
 /lCNfc9uIwtcrTxYvX96FATj7IM=
X-Received: by 2002:a17:903:2bce:b0:234:1163:ff99 with SMTP id
 d9443c01a7336-238e9de5175mr24103045ad.43.1750902940690; 
 Wed, 25 Jun 2025 18:55:40 -0700 (PDT)
X-Received: by 2002:a17:903:2bce:b0:234:1163:ff99 with SMTP id
 d9443c01a7336-238e9de5175mr24102855ad.43.1750902940312; 
 Wed, 25 Jun 2025 18:55:40 -0700 (PDT)
Received: from [10.72.116.141] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f54412c6sm2814742a91.43.2025.06.25.18.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 18:55:39 -0700 (PDT)
Message-ID: <f964e9e0-f641-47d8-89d4-c70b6c81f52b@redhat.com>
Date: Thu, 26 Jun 2025 09:55:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ramfb: Add property to control if load the romfile
To: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250617030521.2109305-1-shahuang@redhat.com>
 <20250617030521.2109305-2-shahuang@redhat.com>
 <8c1870b3-d13d-4918-b0f6-6f41659a807d@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <8c1870b3-d13d-4918-b0f6-6f41659a807d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ce2BmOGWW64j1xjAdahV-sN3wuPkhHICGYkR-czC0Ic_1750902941
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
X-TUID: TQSsk66hR+rw

Hi Eric,

On 6/23/25 5:20 PM, Eric Auger wrote:
> Hi Shaoqin,
> On 6/17/25 5:05 AM, Shaoqin Huang wrote:
>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
> Currently the ramfb device loads ...

Ok, will change it.

>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>> release package on arm64 it can't find the vgabios-ramfb.bin.
>>
>> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
>> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
>> for ramfb, so they don't need to load the romfile.
>>
>> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
> was renamed with - instead of _

Ok, will fix it.

>> device, because the vfio display also use the ramfb_setup() to load
>> the vgabios-ramfb.bin file.
>>
>> After have this property, the machine type can set the compatibility to
>> not load the vgabios-ramfb.bin if the arch doesn't need it.
> 
> Please add in the commit message that for now the default value is true
> but it will be turned off by default in subsequent patch when compats
> get properly handled.

Got it.

Thanks.

>>
>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
>> ---
>>   hw/display/ramfb-standalone.c | 4 +++-
>>   hw/display/ramfb-stubs.c      | 2 +-
>>   hw/display/ramfb.c            | 6 ++++--
>>   hw/vfio/display.c             | 4 ++--
>>   hw/vfio/pci.c                 | 1 +
>>   hw/vfio/pci.h                 | 1 +
>>   include/hw/display/ramfb.h    | 2 +-
>>   7 files changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
>> index 1be106b57f..af1175bf96 100644
>> --- a/hw/display/ramfb-standalone.c
>> +++ b/hw/display/ramfb-standalone.c
>> @@ -17,6 +17,7 @@ struct RAMFBStandaloneState {
>>       QemuConsole *con;
>>       RAMFBState *state;
>>       bool migrate;
>> +    bool use_legacy_x86_rom;
>>   };
>>   
>>   static void display_update_wrapper(void *dev)
>> @@ -39,7 +40,7 @@ static void ramfb_realizefn(DeviceState *dev, Error **errp)
>>       RAMFBStandaloneState *ramfb = RAMFB(dev);
>>   
>>       ramfb->con = graphic_console_init(dev, 0, &wrapper_ops, dev);
>> -    ramfb->state = ramfb_setup(errp);
>> +    ramfb->state = ramfb_setup(ramfb->use_legacy_x86_rom, errp);
>>   }
>>   
>>   static bool migrate_needed(void *opaque)
>> @@ -62,6 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>>   
>>   static const Property ramfb_properties[] = {
>>       DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),
>>   };
>>   
>>   static void ramfb_class_initfn(ObjectClass *klass, void *data)
>> diff --git a/hw/display/ramfb-stubs.c b/hw/display/ramfb-stubs.c
>> index cf64733b10..b83551357b 100644
>> --- a/hw/display/ramfb-stubs.c
>> +++ b/hw/display/ramfb-stubs.c
>> @@ -8,7 +8,7 @@ void ramfb_display_update(QemuConsole *con, RAMFBState *s)
>>   {
>>   }
>>   
>> -RAMFBState *ramfb_setup(Error **errp)
>> +RAMFBState *ramfb_setup(bool romfile, Error **errp)
>>   {
>>       error_setg(errp, "ramfb support not available");
>>       return NULL;
>> diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
>> index 8c0f907673..9a17d97d07 100644
>> --- a/hw/display/ramfb.c
>> +++ b/hw/display/ramfb.c
>> @@ -135,7 +135,7 @@ const VMStateDescription ramfb_vmstate = {
>>       }
>>   };
>>   
>> -RAMFBState *ramfb_setup(Error **errp)
>> +RAMFBState *ramfb_setup(bool romfile, Error **errp)
>>   {
>>       FWCfgState *fw_cfg = fw_cfg_find();
>>       RAMFBState *s;
>> @@ -147,7 +147,9 @@ RAMFBState *ramfb_setup(Error **errp)
>>   
>>       s = g_new0(RAMFBState, 1);
>>   
>> -    rom_add_vga("vgabios-ramfb.bin");
>> +    if (romfile) {
>> +        rom_add_vga("vgabios-ramfb.bin");
>> +    }
>>       fw_cfg_add_file_callback(fw_cfg, "etc/ramfb",
>>                                NULL, ramfb_fw_cfg_write, s,
>>                                &s->cfg, sizeof(s->cfg), false);
>> diff --git a/hw/vfio/display.c b/hw/vfio/display.c
>> index ea87830fe0..8bfd8eb1e3 100644
>> --- a/hw/vfio/display.c
>> +++ b/hw/vfio/display.c
>> @@ -365,7 +365,7 @@ static bool vfio_display_dmabuf_init(VFIOPCIDevice *vdev, Error **errp)
>>                                             &vfio_display_dmabuf_ops,
>>                                             vdev);
>>       if (vdev->enable_ramfb) {
>> -        vdev->dpy->ramfb = ramfb_setup(errp);
>> +        vdev->dpy->ramfb = ramfb_setup(vdev->use_legacy_x86_rom, errp);
>>           if (!vdev->dpy->ramfb) {
>>               return false;
>>           }
>> @@ -494,7 +494,7 @@ static bool vfio_display_region_init(VFIOPCIDevice *vdev, Error **errp)
>>                                             &vfio_display_region_ops,
>>                                             vdev);
>>       if (vdev->enable_ramfb) {
>> -        vdev->dpy->ramfb = ramfb_setup(errp);
>> +        vdev->dpy->ramfb = ramfb_setup(vdev->use_legacy_x86_rom, errp);
>>           if (!vdev->dpy->ramfb) {
>>               return false;
>>           }
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 7f1532fbed..ff0d93fae0 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -3564,6 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
>>   
>>   static const Property vfio_pci_dev_nohotplug_properties[] = {
>>       DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
>> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
>>       DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
>>                               ON_OFF_AUTO_AUTO),
>>   };
>> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
>> index d94ecaba68..713956157e 100644
>> --- a/hw/vfio/pci.h
>> +++ b/hw/vfio/pci.h
>> @@ -177,6 +177,7 @@ struct VFIOPCIDevice {
>>       bool no_kvm_ioeventfd;
>>       bool no_vfio_ioeventfd;
>>       bool enable_ramfb;
>> +    bool use_legacy_x86_rom;
>>       OnOffAuto ramfb_migrate;
>>       bool defer_kvm_irq_routing;
>>       bool clear_parent_atomics_on_exit;
>> diff --git a/include/hw/display/ramfb.h b/include/hw/display/ramfb.h
>> index a7e0019144..172aa6dc89 100644
>> --- a/include/hw/display/ramfb.h
>> +++ b/include/hw/display/ramfb.h
>> @@ -6,7 +6,7 @@
>>   /* ramfb.c */
>>   typedef struct RAMFBState RAMFBState;
>>   void ramfb_display_update(QemuConsole *con, RAMFBState *s);
>> -RAMFBState *ramfb_setup(Error **errp);
>> +RAMFBState *ramfb_setup(bool romfile, Error **errp);
>>   
>>   extern const VMStateDescription ramfb_vmstate;
>>   
> Thanks
> 
> Eric
> 

-- 
Shaoqin

