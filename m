Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp690261njc;
        Sun, 8 Jun 2025 03:02:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4b09:b0:313:2adc:b4c4 with SMTP id 98e67ed59e1d1-31347678bbcmr14103730a91.24.1749376923972;
        Sun, 08 Jun 2025 03:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749376923; cv=none;
        d=google.com; s=arc-20240605;
        b=cyQ2Hbb73PAn9y+ljs0bo/S39hWgUQBRnK7mzNFBWmjvNnFpU1dgsNuWntKDIkb3Fl
         vEafSxEKhN5yuQZawdzd14J/fyH0/GiMNoqr0/AvANRmEIRiLVsYeYv9q4ahsUbCdZi2
         3QNyD0j5dDeiSypK4SX3rloMozuNAFa8elaDVWuQRFm6r+dBY5RvPHy2lDwTtGA8mFsV
         LbKNn4frC6NwgHuFVKotqWd7fx02JDF9XFomObppcRv+VWFCRgayhSHP5EA2qBULXjbe
         GgZ1eOMiz4XMY2S1HGHypPlU/ErxAEmmA/CVrkq4CzI0W7CQpDvHh7ANTJpQE8RwfBMB
         8MLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hZavyLoFgQnVu2C8zewgsMaHdePrvtquamgJX6i7HKc=;
        fh=vaneRB3nTUjNCN5nSoZwjBdIxdZjUKMC3PYqB/zulkU=;
        b=FhMEk9vgMAvrom09XSKVcwGmtTSsRFwVJjOlz3DCKHd8h57zo1djB7PJ7GSh9KaLSx
         OVN0cxO1Ko+ksskQoBRQ4FqYxElzofu5hlTY/a5yB9Sg6zRekZFowlmji+JrwFrZ0C8C
         l6CEUErc8ghE2CxehYyMaZ+VlMoPjouhssUNAu7xz5L4IDGoWLJZD/AQSL7zWES2ySnm
         U1ijQemAnOWqEYOWzFSJsOdPYpN3RUdQU3nO9gfQcn1KDLx7dBGkNpKgnGjnrghCBrRl
         eUGMpGrG4D/zM+Z7SzVZtld9R1u/nac5GhqU+w8m3osaimkKroAcVmRtdGsW/io8AxPs
         Oj2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=IWq0By6s;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-236030780a0sor28409405ad.3.2025.06.08.03.02.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 08 Jun 2025 03:02:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=IWq0By6s;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1749376923; x=1749981723; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZavyLoFgQnVu2C8zewgsMaHdePrvtquamgJX6i7HKc=;
        b=IWq0By6s7pZxQgvgnre4PDR6pmVQgsALmqMVU/fqT3ZOm3kZ9PT7aNAbopcRTThu+R
         AJXkrshA+NtrJ/6ATRFWvECx8takzQ33DV6AZifMccATa+IFvZB19oiZNjfeC8ziP8SQ
         0NXO+s1iJnniSlmHKgW9J+LXcsg0znfnJWb8c2EUtkwbHXpROblFMmliEwCKvJCrbJ7C
         ca+/RZXgQm7u7yhUcGS8Nrqo/cZcdLV4zAudx3oXPwM8Qwr0cMgJSeeuLC8aCagvJU2m
         T3h4EHntzIdCphud1jki77e4/f+TS65VuJo7N8sUj2JhciwFNzEVu1ptG+ZoxqqMFcFM
         PBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749376923; x=1749981723;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZavyLoFgQnVu2C8zewgsMaHdePrvtquamgJX6i7HKc=;
        b=mjWRlIsVGS7evcp2OTWK8a0JjCh3HHfHo+PNF5jsbv8fYn9SjQ83uWA8T6t9pZ0Fzk
         ywI4OyNRN3Ca9h8X7dYKvS8hnnhkHJ3E+NzR3ArNubNgM2ENFhDk/f68bmcbIf5BObo0
         15vegZlk2+V95L0b9+lIF7NRIHeoefOsZjzY702M/+I5W0kWmS/nLWBt3neVjhvD5Z9S
         gitKQlUQUVfqy+eVpJY1VIMIU/QCuCWoQWOv4cQMC1yHkJCa3zhfNPtjR5QszllksyvO
         DanXNKJxoCp868hhArVcpzC20m7pMR/qbJXYZtNIMZNi7y+sZ5l7PNeSDst7jaeDWwcV
         E0bg==
X-Gm-Message-State: AOJu0YxhPAeiy5xq8qRe6inDkTQTQl3Oywi5PTXUSHJHsIfpRvezrCkb
	J797Ngk6FsfEoiaDn5Nda2u7oAnGgeyvgCHmeiLoH9/+XeM3/H/bMlRuyVg1h44d0vCyepf4mfL
	7tHsT
X-Gm-Gg: ASbGnctB9G+LVHc5zBGMtYpGbP8A9cbSDShdPwqzwjdINmFKYLA3PB1aryfZgQargRB
	AkqPkhTVWAOB+7y3sXWXFlrKOW4Ga6dp9OUr4wpBYDmD2LffAbIWvEKf76sjxQwxkaQ4gigds6l
	Az/EQ0kbBbTzo/ixytW1cqMF1his7GThJddX0lg08fb1WRCoO711EWJM1PtePvcALZjaeGpc4tN
	DCD4jnTFlAWccCuVgrkDxtuz0fk8wuBZzz/NLMQsImhYZubn1e1c3CpbUTay7ayrhNd6qEkn/Mt
	5oMzQ6qQM+biEdGBP5aEecpfze+Q4g8chzpT4BaARaBq6DZvLDzqxrAKKp1ctWkc
X-Google-Smtp-Source: AGHT+IEJRQbQFiQatiXQNg2WxKcc3DCJ7adIOVe5bpMI/+HsWp/tHBVvJMyKX1m4TEi+HkJ95lVu+w==
X-Received: by 2002:a17:903:2f89:b0:234:f6ba:e68a with SMTP id d9443c01a7336-23601deb581mr129971635ad.45.1749376923061;
        Sun, 08 Jun 2025 03:02:03 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff216sm37364905ad.111.2025.06.08.03.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 03:02:02 -0700 (PDT)
Message-ID: <a0a03a8b-f431-4ad8-8ee5-80ca660325d3@daynix.com>
Date: Sun, 8 Jun 2025 19:01:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/17] hw/display: re-arrange memory region tracking
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-stable@nongnu.org
References: <20250603110204.838117-1-alex.bennee@linaro.org>
 <20250603110204.838117-10-alex.bennee@linaro.org>
 <1a86b86d-145a-44fc-9f87-2804767fb109@daynix.com>
 <87o6v2764e.fsf@draig.linaro.org>
 <5f91c8a2-06ce-45f8-97bd-0602a52e0d21@daynix.com>
 <87tt4t41kr.fsf@draig.linaro.org>
 <69ab9a77-0e31-4c3a-91de-d8bea9d87a0a@daynix.com>
Content-Language: en-US
In-Reply-To: <69ab9a77-0e31-4c3a-91de-d8bea9d87a0a@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: g7be/a82v9Sn

On 2025/06/07 0:02, Akihiko Odaki wrote:
> 
> 
> On 2025/06/06 19:16, Alex Bennée wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>
>>> On 2025/06/05 20:57, Alex Bennée wrote:
>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>
>>>>> On 2025/06/03 20:01, Alex Bennée wrote:
>>>>>> QOM objects can be embedded in other QOM objects and managed as part
>>>>>> of their lifetime but this isn't the case for
>>>>>> virtio_gpu_virgl_hostmem_region. However before we can split it 
>>>>>> out we
>>>>>> need some other way of associating the wider data structure with the
>>>>>> memory region.
>>>>>> Fortunately MemoryRegion has an opaque pointer. This is passed down
>>>>>> to
>>>>>> MemoryRegionOps for device type regions but is unused in the
>>>>>> memory_region_init_ram_ptr() case. Use the opaque to carry the
>>>>>> reference and allow the final MemoryRegion object to be reaped when
>>>>>> its reference count is cleared.
>>>>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>> Message-Id: <20250410122643.1747913-2-manos.pitsidianakis@linaro.org>
>>>>>> Cc: qemu-stable@nongnu.org
>>>>>> ---
>>>>>>     include/system/memory.h       |  1 +
>>>>>>     hw/display/virtio-gpu-virgl.c | 23 ++++++++---------------
>>>>>>     2 files changed, 9 insertions(+), 15 deletions(-)
>>>>>> diff --git a/include/system/memory.h b/include/system/memory.h
>>>>>> index fc35a0dcad..90715ff44a 100644
>>>>>> --- a/include/system/memory.h
>>>>>> +++ b/include/system/memory.h
>>>>>> @@ -784,6 +784,7 @@ struct MemoryRegion {
>>>>>>         DeviceState *dev;
>>>>>>           const MemoryRegionOps *ops;
>>>>>> +    /* opaque data, used by backends like @ops */
>>>>>>         void *opaque;
>>>>>>         MemoryRegion *container;
>>>>>>         int mapped_via_alias; /* Mapped via an alias, container 
>>>>>> might be NULL */
>>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio- 
>>>>>> gpu-virgl.c
>>>>>> index 145a0b3879..71a7500de9 100644
>>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>>> @@ -52,17 +52,11 @@ virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
>>>>>>       #if VIRGL_VERSION_MAJOR >= 1
>>>>>>     struct virtio_gpu_virgl_hostmem_region {
>>>>>> -    MemoryRegion mr;
>>>>>> +    MemoryRegion *mr;
>>>>>>         struct VirtIOGPU *g;
>>>>>>         bool finish_unmapping;
>>>>>>     };
>>>>>>     -static struct virtio_gpu_virgl_hostmem_region *
>>>>>> -to_hostmem_region(MemoryRegion *mr)
>>>>>> -{
>>>>>> -    return container_of(mr, struct 
>>>>>> virtio_gpu_virgl_hostmem_region, mr);
>>>>>> -}
>>>>>> -
>>>>>>     static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>>>>>>     {
>>>>>>         VirtIOGPU *g = opaque;
>>>>>> @@ -73,14 +67,12 @@ static void 
>>>>>> virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>>>>>>     static void virtio_gpu_virgl_hostmem_region_free(void *obj)
>>>>>>     {
>>>>>>         MemoryRegion *mr = MEMORY_REGION(obj);
>>>>>> -    struct virtio_gpu_virgl_hostmem_region *vmr;
>>>>>> +    struct virtio_gpu_virgl_hostmem_region *vmr = mr->opaque;
>>>>>>         VirtIOGPUBase *b;
>>>>>>         VirtIOGPUGL *gl;
>>>>>>     -    vmr = to_hostmem_region(mr);
>>>>>> -    vmr->finish_unmapping = true;
>>>>>> -
>>>>>>         b = VIRTIO_GPU_BASE(vmr->g);
>>>>>> +    vmr->finish_unmapping = true;
>>>>>>         b->renderer_blocked--;
>>>>>>           /*
>>>>>> @@ -118,8 +110,8 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>>>>>           vmr = g_new0(struct virtio_gpu_virgl_hostmem_region, 1);
>>>>>>         vmr->g = g;
>>>>>> +    mr = g_new0(MemoryRegion, 1);
>>>>>
>>>>> This patch does nothing more than adding a separate allocation for
>>>>> MemoryRegion. Besides there is no corresponding g_free(). This patch
>>>>> can be simply dropped.
>>>> As the patch says the MemoryRegion is now free'd when it is
>>>> de-referenced. Do you have a test case showing it leaking?
>>>
>>> "De-referenced" is confusing and sounds like pointer dereferencing.
>>>
>>> OBJECT(mr)->free, which has virtio_gpu_virgl_hostmem_region_free() as
>>> its value, will be called to free mr when the references of mr are
>>> removed. This patch however does not add a corresponding g_free() call
>>> to virtio_gpu_virgl_hostmem_region_free(), leaking mr.
>>>
>>> AddressSanitizer will catch the memory leak.
>>
>> Example invocation?
>>
>> I ran the AddressSantizier against all the virtio-gpu tests yesterday
>> and it did not complain.
> 
> The following command line triggered the memory leak. The image is a 
> clean Debian 12 installation. I booted the installation, and shut down 
> it by pressing the button on the booted GDM:
> 
> build/qemu-system-x86_64 -drive file=debian12.qcow2 -m 8G -smp 8 -device 
> virtio-vga-gl,blob=on,hostmem=1G -display egl-headless,gl=on -vnc :0 -M 
> q35,accel=kvm
> ==361968==WARNING: ASan doesn't fully support makecontext/swapcontext 
> functions and may produce false positives in some cases!
> ==361968==WARNING: ASan is ignoring requested __asan_handle_no_return: 
> stack type: default top: 0x7bf41d2b8380; bottom 0x7bf2e0f4c000; size: 
> 0x00013c36c380 (5305189248)
> False positive error reports may follow
> For details see https://github.com/google/sanitizers/issues/189
> 
> =================================================================
> ==361968==ERROR: LeakSanitizer: detected memory leaks
> 
> Direct leak of 816 byte(s) in 3 object(s) allocated from:
>      #0 0x7ff640f50a43 in calloc (/lib64/libasan.so.8+0xe6a43) (BuildId: 
> 6a82bb83b1f19d3f3a2118085acf79daa3b52371)
>      #1 0x7ff64077c901 in g_malloc0 (/lib64/libglib-2.0.so.0+0x48901) 
> (BuildId: 6827394d759bc44f207f57e7ab5f8e6b17e82c1c)
>      #2 0x557fa8080dc5 in virtio_gpu_virgl_map_resource_blob ../hw/ 
> display/virtio-gpu-virgl.c:113
>      #3 0x557fa8080dc5 in virgl_cmd_resource_map_blob ../hw/display/ 
> virtio-gpu-virgl.c:772
>      #4 0x557fa8080dc5 in virtio_gpu_virgl_process_cmd ../hw/display/ 
> virtio-gpu-virgl.c:952
> 
> SUMMARY: AddressSanitizer: 816 byte(s) leaked in 3 allocation(s).

The following command line also reproduced the issue:

LIBGL_ALWAYS_SOFTWARE=1 \
LSAN_OPTIONS=suppressions=<(echo leak:fontconfig) \
build/qemu-system-aarch64 -M virt,accel=kvm -cpu host -smp 8 -m 8G \
-device virtio-gpu-gl,blob=on,hostmem=256M -display gtk,gl=on \
-drive file=Fedora-Workstation-Live-42-1.1.aarch64.iso,format=raw \
-bios /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.raw \
-serial mon:stdio

Fedora's Live disk allows you to test without installation.

By the way, I tried TCG to reproduce the hang, but I couldn't. I'd 
appreciate if you tell:

- how to reproduce the issue
- whether the CPU usage saturates with 100 %
   (i.e., if the hang is a busy-loop or not).
- the stack traces of all the threads when the hang happens.

Hopefully they will provide more insights into the problem and your fix.

Regards,
Akihiko Odaki
