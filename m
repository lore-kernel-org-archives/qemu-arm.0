Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp983936njc;
        Sun, 8 Jun 2025 20:38:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXX4AuHo+3GxXYlHwLyTkFeahd/rOkQW1OzQlb6zUG9AThcJAYQnVL5YJnDW0UMYNfgVNwybANchxMFDw==@linaro.org
X-Google-Smtp-Source: AGHT+IEDrMXzhYdtscdWFOod2wR3QL3a6qHBR4tCJo4bP9dbIan1T7gKw+4Im0sjFIfHxIpNRqJ7
X-Received: by 2002:a05:622a:5a92:b0:48d:df0e:ef38 with SMTP id d75a77b69052e-4a5b9d7c6f5mr206593651cf.33.1749440314591;
        Sun, 08 Jun 2025 20:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749440314; cv=none;
        d=google.com; s=arc-20240605;
        b=Y9yUHh3i6lvKQw8xPLIQbVp28fB+fZYLv4yEyufb3oj0ewO9EEIaMYdJPhcwdkd5iN
         bbncDvExBI4u8jZ3N9tCr5Mf+3bzg1gTsKdJcmvlkdsIwvFtYmUYZHDi6ctH3MMjB0bQ
         Jpp38t7Mu/9JP+/fczjqV+TQtrfGxZ7ZmMNe6AsxJpFyjur7XYdl3VxcqdOqY8d11RuG
         AqU1csZVTZpF50uQNdQdKuX6QQ70/tEkU0Elxpp8++TTG/znIz303p59xIq0JBWrqFeR
         bV1lDJO82k0ObVrHw99YYvVzyDgkbW71ocEtEORHDlbvUIkJWTXN77HRyqAszvJO8FEd
         FuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2Rzx5NiZAd0x4mEjPq8dOiKAZARMPQ5U3iWYsJELvqk=;
        fh=1w4kxnjlbSb5LjzLbNlqvCErkYrTw4lPBcrObXnppJI=;
        b=cog4WeSaPTT/6/SS+A/dI8OuNBQJZDmlmMlYQ4vDC4AQsWnht+2Q/E6LjedJQTUYht
         UVNkdnN0SRKriHb5xqxiDeksYyCGJUEsdpn+usWCg5PzaPTiV9rbsv+g2R+cYhKhZWAU
         ULPmDCnvSLjKnYiZiGAOLVZtJiJNpeZpguklsydJ/qHbQQFebLGOYdRKbbibPtSD8OvB
         mjKZV8gnZF87fRQ1eo2lCPnyIyjxgrrC4Bk+mPgGVoE2h6O0PtxjcsQTpd8O49PtByyT
         OAxo2e9wCfxWRGagDxlimhsQFdMElz7mX/iDO4T26IgUVVh5Wy+qjw83/HrQGC9LdNRn
         ZyZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XBkCjpTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198aa40dsi72193851cf.475.2025.06.08.20.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Jun 2025 20:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XBkCjpTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOTKo-0003QT-RI; Sun, 08 Jun 2025 23:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uOTKk-0003QB-Kj
 for qemu-arm@nongnu.org; Sun, 08 Jun 2025 23:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uOTKi-00055T-No
 for qemu-arm@nongnu.org; Sun, 08 Jun 2025 23:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749440276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Rzx5NiZAd0x4mEjPq8dOiKAZARMPQ5U3iWYsJELvqk=;
 b=XBkCjpTD7A6kHDqjApZksri7YpMJKfNjRDG8hTKk+HTjFktaPOtlOEz7Tg56im3po0sU36
 Xq3UHkM5EdHPtWhI79a0qud+4B0P5mnB0ZOyOpnWy+WjFBM60fG0e9YvJOxMmcN8OxLTg9
 SBEX+2eDe23qc4RTS45cn9d0F+37z8Q=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-zgay7cmFNKmOpy1usd2f6g-1; Sun, 08 Jun 2025 23:37:55 -0400
X-MC-Unique: zgay7cmFNKmOpy1usd2f6g-1
X-Mimecast-MFC-AGG-ID: zgay7cmFNKmOpy1usd2f6g_1749440274
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-31315427249so4814312a91.1
 for <qemu-arm@nongnu.org>; Sun, 08 Jun 2025 20:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749440274; x=1750045074;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Rzx5NiZAd0x4mEjPq8dOiKAZARMPQ5U3iWYsJELvqk=;
 b=lPoJF9T4K1cLK47blytHVOGJ7lwF8l32Zxzvt14OMJYRxN/FPBV5/61hceprEpoav4
 c/7/19Y0Z8lNZT3OszaYTtVjSlvE4zGBgpm9O43NytK8Io3NiQna8M7YkNix/mwKp0ti
 i+pUofCu51wS5IqnyqfjPHkPJvmfUvRJuH+nHI5VraCQ1jCoAiAtu2S8FEaJBlTB1LKs
 kh6bTJTho//JTZo+ZEuZIc8C8ujczEqh4ysI0eDDTNz64XeKpCi5M/WSDpGAyaw4hHK1
 KSFpCxiZ9bI8UStzWzKiRgfdJ3/dKRgMY7lefKVa482bJNZWXm6bT07ITygCokBa2GhY
 1dwQ==
X-Gm-Message-State: AOJu0YwcY/LzqkkZXIJioLQBljPe1lCyZmx/lqj17r8lXLp6wbgcF85G
 pNHy2iyOc/cpSIfpyEBThA4jDy6SFTQZ/ARLaCvNPhBTG6Z1FW2lL6k59BaH5QHpmeIDhu7wOnK
 NB59wvxx5RdPpeYuLt1Xhu3F2p92vy/Qi38AU3gpljjgSU0jE805i8w==
X-Gm-Gg: ASbGncvJDTTxLajbCPwe+7/pg/Db4IJFlbLrdUayhgNNUasLYlB+I3PozwEe80abO3k
 IwY8cK//9+S8JhR3688x8417AnO6lCBPKg0VmgcKkr9jWDZf9oAeq7NVGd04QGhql6CxLRMW1M9
 vN4LzPL757RXoQsTeosB34F5qI17FniKeBxcjaQJMqZr4rM3TdUXpE/jDogLJHFzflwx2gr2Ltt
 C6hHe2KjTBoYDg278sD5sD6biaLhIyx+NHjGLAPMQmBIwDSqgavbqjThXwifb904HHVQN9T87mj
 f+1CFO2038iEF1jA3tM4AoiduQ==
X-Received: by 2002:a17:90b:4e8d:b0:311:d258:3473 with SMTP id
 98e67ed59e1d1-313472fc4b5mr16021574a91.13.1749440273970; 
 Sun, 08 Jun 2025 20:37:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8d:b0:311:d258:3473 with SMTP id
 98e67ed59e1d1-313472fc4b5mr16021552a91.13.1749440273529; 
 Sun, 08 Jun 2025 20:37:53 -0700 (PDT)
Received: from [10.66.193.79] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3134b0903fcsm5194299a91.21.2025.06.08.20.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jun 2025 20:37:53 -0700 (PDT)
Message-ID: <3f093907-34d3-40f7-956b-828c0c58f04a@redhat.com>
Date: Mon, 9 Jun 2025 11:37:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ramfb: Add property to control if load the romfile
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250606070234.2063451-1-shahuang@redhat.com>
 <aEKeNSc8mAZ8vhGj@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <aEKeNSc8mAZ8vhGj@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ilb4HUBCc1qMugEX1IbhdEReErj0O5GaA9B-6rVbejM_1749440274
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: BJRq1QCexlQ+

Hi Daniel,

On 6/6/25 3:52 PM, Daniel P. Berrangé wrote:
> On Fri, Jun 06, 2025 at 03:02:34AM -0400, Shaoqin Huang wrote:
>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>> release package on arm64 it can't find the vgabios-ramfb.bin.
>>
>> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
>> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
>> for ramfb, so they don't need to load the romfile.
>>
>> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
>> device, because the vfio display also use the ramfb_setup() to load
>> the vgabios-ramfb.bin file.
>>
>> After have this property, the machine type can set the compatibility to
>> not load the vgabios-ramfb.bin if the arch doesn't need it.
> 
> Can you make this a series, with an additional patch that updates the
> current in-dev machine types to use this new property, so we're clear
> about the proposed usage.
> 

Ok. Thanks for notification. I will update it in the version 3.

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
>> index 7f1532fbed..4e4759c954 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -3564,6 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
>>   
>>   static const Property vfio_pci_dev_nohotplug_properties[] = {
>>       DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
>> +    DEFINE_PROP_BOOL("use_legacy_x86_rom", VFIOPCIDevice, use_legacy_x86_rom, true),
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
>> -- 
>> 2.40.1
>>
> 
> With regards,
> Daniel

-- 
Shaoqin

