Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AECCC44521
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 06:48:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlhna-0007tX-H1; Mon, 20 Jul 2026 02:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wlhnQ-0007rp-FB
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 02:48:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wlhnM-0007Lc-6D
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 02:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784530086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PO8Fm4mt0VLaoOLS1XjuTB7cdvLtsrhFUoulsYxdlGw=;
 b=eUACdewzxB3ruN+wFywgs1f/lytgu9+rnfRxg6Hf+bM1Xj93OY4ngUB7wz4tdGcyJuD54u
 WKNZhmG3QeW4ypOM4/YnaloR9hydB9ikIuuqQkoD5pFzQPX3tXbsstItxILurM71FBBnLu
 WlAJ7F1lPlx5fHFGtxmPplAmCiuBQh0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-sSM04302MXilfQ80R7jCAw-1; Mon, 20 Jul 2026 02:48:04 -0400
X-MC-Unique: sSM04302MXilfQ80R7jCAw-1
X-Mimecast-MFC-AGG-ID: sSM04302MXilfQ80R7jCAw_1784530083
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8484ba00601so7787160b3a.1
 for <qemu-arm@nongnu.org>; Sun, 19 Jul 2026 23:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784530083; x=1785134883;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PO8Fm4mt0VLaoOLS1XjuTB7cdvLtsrhFUoulsYxdlGw=;
 b=gWVUV1e8ZhHJ7pTHorrMjIZrrukzkEMYHG+2q1T76rX2YiPQe+6kGUNJ0dhQBFKsjn
 V644ORkwaJOc7xmCxc+gHBlpvl62aumaKmBG6Km34j0ZlVmWcUd4gOBIl3F2UwK+bI+H
 2aq7ZhuRkf4phgAw8HPrRs64KvLmrygci/tO6XL4ldNT8L0zJwwGRXRwU5IcT8hkeUZs
 9rrHsP0OaxmQLuyGIMF9L/y2N2NYAau3KQcdReskf3b6AW2Unhu2TcA67s8+bgozOlRA
 8a3vkXPifuAAYTjFPJMptsJL0axo9OpQeJX78mgnIs4XSYjfLy6rck6U8VfgSkVkivZy
 gpTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRH3n95Lj+C7pb1KEzunzVv3AGoIFkWg51ffF7+QC3fLTJelH8W6slvmeon9tibQv7iuiTUIB1+w==@nongnu.org
X-Gm-Message-State: AOJu0Ywo5NiNFPlrKgsdaW/dkqwVTNA5PnjmPrL6DdB3vWqUf6dJVMwu
 iSUzBSHJe9agDgGxe90uAOihTyFz+UgnkwDjeNv2zQM5FHx8iH6pZIvr3BpcYFDO+CO/txawYVR
 7ZRQL+3vjMv3OtiwilyTuwdzitKREcSueyXyrkyqO3+rfmn0SpC6sFg==
X-Gm-Gg: AfdE7cn6GC7HaAlKDe3q9Nxe/T1Upjw/CEHC53p4epmg/xBJcFFDUpKcUr+dc4HUCQE
 6hK/OZ3nWOh/a0XhMe3uVwD0tSdjE9yxZy+izMvKPL8KJU4tS/1uDxCkHt7xQCvSSQTWYRsJ9j8
 vBIXO0E3CdADaBn9yAVCHi7r87JsKxiZz9iXc1mUUg1/KU5ubR7aYTe/5jfo3hojMpxHBdl5K/A
 2EzRLXwEmBkImVeqs0vXjEJL8MKB8qpwr6mC7IPKvyCd13hzX0jEyV6INkEeIYyoPm0Ld66ABpt
 MuadgPtUnSbA3mNJXfe00ymcIWLfFbOyCbMK47ufdo5Qipwjta8AEEVHW136EHuqxAjrwGN2ICD
 ISgx84mIOfklTfYBId+LJGHxupruOVglcVJYI0bdNc9M=
X-Received: by 2002:a05:6a00:391d:b0:848:65fa:542 with SMTP id
 d2e1a72fcca58-84c29494771mr11796853b3a.53.1784530083149; 
 Sun, 19 Jul 2026 23:48:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:391d:b0:848:65fa:542 with SMTP id
 d2e1a72fcca58-84c29494771mr11796824b3a.53.1784530082638; 
 Sun, 19 Jul 2026 23:48:02 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84c2adc7adasm5227178b3a.19.2026.07.19.23.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jul 2026 23:48:01 -0700 (PDT)
Message-ID: <2ad36e97-63d7-4464-b909-2a28d496e887@redhat.com>
Date: Mon, 20 Jul 2026 16:47:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 10/25] hw/core/loader: Add a ROM loader notifier
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org, mst@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-11-mathieu.poirier@linaro.org>
 <47136344-8e15-498a-a4fb-0dbbb0c71861@redhat.com> <allIviFWgoKgDob1@p14s>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <allIviFWgoKgDob1@p14s>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: umCryuQdzVBqY22vBe3QdFka52iPDAlxI-DKpn3Ze6A_1784530083
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.133.124;
 envelope-from=gshan@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/17/26 7:10 AM, Mathieu Poirier wrote:
> On Tue, Jul 14, 2026 at 08:52:43PM +1000, Gavin Shan wrote:
>> On 7/8/26 8:42 AM, Mathieu Poirier wrote:
>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>
>>> Add a function to register a notifier that is invoked when ROMs get
>>> loaded into guest memory.
>>>
>>> It will be used by Arm confidential guest support, in order to register
>>> all blobs loaded into memory with KVM, so that their content is moved
>>> into Realm state and measured into the initial VM state.
>>>
>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> ---
>>>    hw/core/loader.c         | 15 +++++++++++++++
>>>    include/hw/core/loader.h | 17 +++++++++++++++++
>>>    2 files changed, 32 insertions(+)
>>>
>>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>>> index 5cbfba0a86d2..b3d769bec5cb 100644
>>> --- a/hw/core/loader.c
>>> +++ b/hw/core/loader.c
>>> @@ -74,6 +74,8 @@
>>>    #endif
>>
>> The (edk2) firmware for the realm guest can be specified by the legacy
>> '-drive if=pflash' or '-bios'. The memory region corresponding to the
>> firmware image specified by '-bios' is recorded by the newly added notifier
>> and populated to TF-RMM properly.
>>
>> I don't see how the memory region corresponding to (edk2) firmware image
>> specified by '-drive if=pflash' is recorded and populated to TF-RMM
>> accordingly in this series. So I guess '-drive if=pflash' isn't supported
>> yet?
> 
> Please give '-drive if=pflash' a try and let me know how you fare.  Edk2 is not
> part of the bootstack I'm currently testing with but I know of configurations
> where it does work.
> 
> I'll add it to my list of things to do if it doesn't work, though I may not
> address it in this patchset.  We'll see how busy things get.
> 

Ok, I don't think '-driver if=pflash' or the 'pflash0' property of the virt machine
aren't supported any more due to [RFC v1 21/25], where the 'pflash0' property has
been removed.

   [RFC v1 21/25] hw/arm/virt: Use RAM instead of flash for confidential guest firmware

- Tried to boot the realm guest with '-driver if=pflash' and I was told it's not supported.

   qemu-system-aarch64: -drive if=pflash,format=raw,unit=0,file=/mnt/edk2/Build/ArmVirtQemu-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd,readonly=on: machine type   does not support if=pflash,bus=0,unit=0

- Tried to use 'pflash0' property, and I was told it's not supported either.

   qemu-system-aarch64: Property 'virt-11.1-machine.pflash0' not found

So the only option to specify the firmware image is '-bios', which worked for me.

Thanks,
Gavin


>>
>> Note that I didn't give '-drive if=pflash' a try yet.
>>
>>>    static int roms_loaded;
>>> +static NotifierList rom_loader_notifier =
>>> +    NOTIFIER_LIST_INITIALIZER(rom_loader_notifier);
>>>    /* return the size or -1 if error */
>>>    int64_t get_image_size(const char *filename, Error **errp)
>>> @@ -1201,6 +1203,11 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
>>>        return mr;
>>>    }
>>> +void rom_add_load_notifier(Notifier *notifier)
>>> +{
>>> +    notifier_list_add(&rom_loader_notifier, notifier);
>>> +}
>>> +
>>>    /* This function is specific for elf program because we don't need to allocate
>>>     * all the rom. We just allocate the first part and the rest is just zeros. This
>>>     * is why romsize and datasize are different. Also, this function takes its own
>>> @@ -1242,6 +1249,7 @@ ssize_t rom_add_option(const char *file, int32_t bootindex)
>>>    static void rom_reset(void *unused)
>>>    {
>>>        Rom *rom;
>>> +    RomLoaderNotifyData notify;
>>>        QTAILQ_FOREACH(rom, &roms, next) {
>>>            if (rom->fw_file) {
>>> @@ -1290,6 +1298,13 @@ static void rom_reset(void *unused)
>>>            address_space_flush_icache_range(rom->as, rom->addr, rom->datasize);
>>>            trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
>>> +
>>> +        notify = (RomLoaderNotifyData) {
>>> +            .addr = rom->addr,
>>> +            .len = rom->datasize,
>>> +            .as = rom->as,
>>> +        };
>>> +        notifier_list_notify(&rom_loader_notifier, &notify);
>>>        }
>>>    }
>>> diff --git a/include/hw/core/loader.h b/include/hw/core/loader.h
>>> index d9431e8a8d12..94cf6ad2e26b 100644
>>> --- a/include/hw/core/loader.h
>>> +++ b/include/hw/core/loader.h
>>> @@ -342,6 +342,23 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
>>>    ssize_t rom_add_vga(const char *file);
>>>    ssize_t rom_add_option(const char *file, int32_t bootindex);
>>> +typedef struct RomLoaderNotifyData {
>>> +    /* Address of the blob in guest memory */
>>> +    hwaddr addr;
>>> +    /* Length of the blob */
>>> +    size_t len;
>>> +    /* Address space of the blob */
>>> +    AddressSpace *as;
>>> +} RomLoaderNotifyData;
>>> +
>>> +/**
>>> + * rom_add_load_notifier - Add a notifier for loaded images
>>> + *
>>> + * Add a notifier that will be invoked with a RomLoaderNotifyData structure for
>>> + * each blob loaded into guest memory, after the blob is loaded.
>>> + */
>>> +void rom_add_load_notifier(Notifier *notifier);
>>> +
>>>    /* This is the usual maximum in uboot, so if a uImage overflows this, it would
>>>     * overflow on real hardware too. */
>>>    #define UBOOT_MAX_DECOMPRESSED_BYTES (64 << 20)
>>
>> Thanks,
>> Gavin
>>
> 


