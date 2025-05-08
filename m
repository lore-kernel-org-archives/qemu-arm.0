Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp356400njb;
        Thu, 8 May 2025 04:44:52 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:301:a0e9:66f with SMTP id 98e67ed59e1d1-30aac19c9c4mr12158671a91.14.1746704692423;
        Thu, 08 May 2025 04:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746704692; cv=none;
        d=google.com; s=arc-20240605;
        b=gncFy+j2krxRSr7XIPAIQC4FE33CDaXYTFKSS7ym11k2DzLJkwAb5ROiYEVAVytQny
         CKY41wBSqQ4nstg1RoUm7uMjp65A4ZwiYams7KaxcJzOrRSxw0FLJz5lhBOhI0OyBhQS
         G/CNnJrDQWTs8itNq5Jv1tOlAGxyxaxXj3dply4TiC/mFYk2kDbaYqBVbzvBRQ3G88y/
         RxUuHSeyTLu/wkYha+UdLcFIOoR1nnSv7IkQX6zMGnwnj2syoCH3xNwzvQmKZ96uvPVA
         0oG1llLF/tWXCsfzW+Nu2ipupN3GX/lNLsogmfXYW8llo3EDD9YeV4BtP+n5zAF6/Yjh
         4MVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=y4mN7lAZSTS1MUAScK+xPavY/LezpV88F45AFAl8d08=;
        fh=IMoxWHrRU+ZQ1zyKWoNdiyY5N/rZnR+cNb9sP1DyLds=;
        b=CeqZ/5EARWCk4rsntUzoc/U1rerqD2nfNGMImdm82PuOUaqWUeJX0ZSGRDoFbWywI8
         W1ecV4cKnxHYERL2h4LtcPSB0Vf7MfUwZjG6mff2TLcGi0niWtsQhVNYIm9BFhAXhbK4
         EPHGK7CCycLfsVpT7Jer2sEZElVuGGGOqybeG301qSXIW60dyKkfD2lHg1LkNHdjRjkR
         rnRrxgW148TIYX8DRdsOltDlA5IGianUHgBmAnsVarW6GmClw1XxpFAtqWap5u++HLh9
         x9HhwZf3STptM5IH1xfAZ6uZaIqqKBBjiWVcxcErKpEzqpY6MJQjNlqZ/yt93RyTQKhn
         fCwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="S/Lg3A+R";
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22f7d861d24sor10115385ad.10.2025.05.08.04.44.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 May 2025 04:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="S/Lg3A+R";
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746704692; x=1747309492; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4mN7lAZSTS1MUAScK+xPavY/LezpV88F45AFAl8d08=;
        b=S/Lg3A+RamZud+GZMpMvomm8WwJCIvc+xwWGYny/AS9Ab+LLJ7A4VEmfEteludWoHa
         LEYzkAEu3Rtx0l+oKU9FEW7wIBYK29CWUbi+LnJKH8wM6T6ax7rGqeK9U2wQgNwIfBhy
         koVgiyYO4lAVKdbSkpqOCOzULLl+bdwAnUXxh6zW7E4hJJ93D6axxURcGOjE6EtlWicX
         3carJzNlMIN5Gpp8g9CiqhQmbGagjYME7ohgMsihKZ/cryuyTKxcVdUcccy52i4Xtd1q
         ogGdpKgkyK1RTJu6jCoHwU1I70a2JM1N2QutAZvq9j03Hko3OXs0LccfEsgxJ3yWkdf/
         hKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704692; x=1747309492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4mN7lAZSTS1MUAScK+xPavY/LezpV88F45AFAl8d08=;
        b=fd0XOE61Fv0ETQYiHbYDjq/Vq4B6beEtRPet0vgX8+SwFr5FVewVUkb8m4YVEm3m9Y
         B5lupqDq+GU/ynKKiBbgJDBXGQdiwFpf7uO19l/V7qEDJXtBho1M8csVrIR0NA7AAYXF
         GiCUpT4eVvSs2z1XzBCD/I1MtC+VCQMOW+rS/JdTcbmw+TNbm3kO9LaGwQ8pSRXQp0dt
         3lwYj1cY91UNYJ+fDCTR0tPbjk7zmqegv4zJoVVtqnvRXBnCvbt6caxMX/2yqzkFkHN5
         8RowzgYkYv21HtzJYf5HjnqibejGJjFbBjCbsD/1i6xgRDeML79Hzs6pSbpTATM/86nz
         bPpA==
X-Gm-Message-State: AOJu0Yw0hbcPAjGXqzlXIHrXMInOTJ62wrYt/ObiFXszS8yGPsbPDAmo
	z26Fy+sWte7VQkynbjTtcNmuhXC6J8U0kUEBYYIAJUHY7xKUrPzwBw8Ei7tMWF/0k+eIKjUi4Uw
	h
X-Gm-Gg: ASbGncujnhoYDpOZyY62JenGR9NthvCgy8g5BQ5gs3TSnarcu0isiL+WPFgnvzDt5sA
	ab7nizECaIBcWo5eXSb/lqTtc2XpSvM3MhHy3UXjokrv7rBbbM6mrIDQPvsHAYAx/IC86pp/a9P
	T3lpV6am8LIbOHudBxw9jUdjvdpsuCxMhY2oexvXpsrDuHlN5oldGxtBWGifMDHIClYM8z1T3uW
	5MCoiARVDGvTclTXQSqBjsX4OosgFWLzIpyEEHDnI7BxqmeGIlv1bgGID7hW5lFD8Zqem/vBqA+
	Y7HGvzRXi84RxrKuwSOwQIFvZOPyo3oslclQWLQovs+D2h/SjoU=
X-Google-Smtp-Source: AGHT+IFnw/m9PRjlh4N4SXn3THy7SpJiEbWIMiOoRDJTVi5CQcdIexmcz36u0NBm6QxcbpgvSSFZbQ==
X-Received: by 2002:a17:903:fa4:b0:22d:e57a:2795 with SMTP id d9443c01a7336-22e5edea81bmr106096045ad.47.1746704691787;
        Thu, 08 May 2025 04:44:51 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e188285f8sm100724905ad.46.2025.05.08.04.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:44:51 -0700 (PDT)
Message-ID: <00c07484-4882-4ad2-97cb-b0ec250f8b5b@daynix.com>
Date: Thu, 8 May 2025 20:44:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] virtio-gpu: fix hang under TCG when unmapping blob
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-stable@nongnu.org
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-9-alex.bennee@linaro.org>
 <8b123991-21f2-47b5-851d-6b53fbfaa691@collabora.com>
 <8994da6c-a369-40c7-b1c6-433519ba90a5@daynix.com>
 <874ixyoxnx.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <874ixyoxnx.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: J/PvmqV9XLn0

On 2025/05/06 19:12, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/04/30 3:48, Dmitry Osipenko wrote:
>>> On 4/28/25 15:59, Alex BennÃ©e wrote:
>>>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>
>>>> This commit fixes an indefinite hang when using VIRTIO GPU blob objects
>>>> under TCG in certain conditions.
>>>>
>>>> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
>>>> MemoryRegion and attaches it to an offset on a PCI BAR of the
>>>> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmaps
>>>> it.
>>>>
>>>> Because virglrenderer commands are not thread-safe they are only
>>>> called on the main context and QEMU performs the cleanup in three steps
>>>> to prevent a use-after-free scenario where the guest can access the
>>>> region after it’s unmapped:
>>>>
>>>> 1. From the main context, the region’s field finish_unmapping is false
>>>>      by default, so it sets a variable cmd_suspended, increases the
>>>>      renderer_blocked variable, deletes the blob subregion, and unparents
>>>>      the blob subregion causing its reference count to decrement.
>>>>
>>>> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>>>>      recalculated, the free callback of the blob region
>>>>      virtio_gpu_virgl_hostmem_region_free is called which sets the
>>>>      region’s field finish_unmapping to true, allowing the main thread
>>>>      context to finish replying to the command
>>>>
>>>> 3. From the main context, the command is processed again, but this time
>>>>      finish_unmapping is true, so virgl_renderer_resource_unmap can be
>>>>      called and a response is sent to the guest.
>>>>
>>>> It happens so that under TCG, if the guest has no timers configured (and
>>>> thus no interrupt will cause the CPU to exit), the RCU thread does not
>>>> have enough time to grab the locks and recalculate the FlatView.
>>>>
>>>> That’s not a big problem in practice since most guests will assume a
>>>> response will happen later in time and go on to do different things,
>>>> potentially triggering interrupts and allowing the RCU context to run.
>>>> If the guest waits for the unmap command to complete though, it blocks
>>>> indefinitely. Attaching to the QEMU monitor and force quitting the guest
>>>> allows the cleanup to continue.
>>
>> The RCU thread should be free to kick in if the guest is waiting and
>> idle. That may be a problem that should be analyzed and fixed.
>>
>>>>
>>>> There's no reason why the FlatView recalculation can't occur right away
>>>> when we delete the blob subregion, however. It does not, because when we
>>>> create the subregion we set the object as its own parent:
>>>>
>>>>       memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>>>>
>>>> The extra reference is what prevents freeing the memory region object in
>>>> the memory transaction of deleting the subregion.
>>>>
>>>> This commit changes the owner object to the device, which removes the
>>>> extra owner reference in the memory region and causes the MR to be
>>>> freed right away in the main context.
>>>>
>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
>>>> Cc: qemu-stable@nongnu.org
>>>> ---
>>>>    hw/display/virtio-gpu-virgl.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>>> index 71a7500de9..8fbe4e70cc 100644
>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>>>        vmr->g = g;
>>>>        mr = g_new0(MemoryRegion, 1);
>>>>    -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size,
>>>> data);
>>>> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>>>>        memory_region_add_subregion(&b->hostmem, offset, mr);
>>>>        memory_region_set_enabled(mr, true);
>>>>    
>>> This change makes QEMU to crash.
>>> AFAICT, it effectively reverts code to old bugged version [1] that
>>> was
>>> rejected in the past.
>>> +Akihiko Odaki
>>> [1]
>>> https://lore.kernel.org/qemu-devel/20230915111130.24064-10-ray.huang@amd.com/
>>
>> I think you are right.
>>
>> Changing the owner indeed makes the MR to be freed right away, but
>> this is because it makes a reference by the FlatView to the MR
>> dangling and can lead to use-after-free.
>>
>> Setting the owner to the device implies that the device keeps the
>> storage of the MR and. The references to the MR must be counted by the
>> device to keep the storage available in such a case.
> 
> Well the lifetime of the region is effectively controlled by the virgl
> resource manager. There is a disconnect between when we can finally free
> the MR and when the virglrenderer is done with it.
> 
>> The MR itself doesn't count the references. It is fine as long as the
>> MR is kept alive by being parented by the device, but
>> virtio_gpu_virgl_unmap_resource_blob() unparents the MR and breaks the
>> assumption. That's why the device shouldn't be the the owner of the
>> MR.
> 
> Then who should? Ultimately some object needs to "own" the MR until we
> know it can be freed (so no longer mapped into the guest and no longer
> referenced by virglrenderer). The normal MR refcounting isn't enough
> because the lifetime extends beyond when it is "visible" in the FlatView.

The current code makes the MR "own" itself. This works because the 
references are kept counted by the MR's own reference counter just like 
a normal Object.

Regards,
Akihiko Odaki
