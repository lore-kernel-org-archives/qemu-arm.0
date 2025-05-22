Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1682190njc;
        Thu, 22 May 2025 00:40:20 -0700 (PDT)
X-Received: by 2002:a17:90a:d604:b0:30e:ee6:671a with SMTP id 98e67ed59e1d1-30e7d50b022mr39502717a91.10.1747899620076;
        Thu, 22 May 2025 00:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747899620; cv=none;
        d=google.com; s=arc-20240605;
        b=MSYDYNtbwLU2u457N2ItWpm77tgF70roVEYCRbIA+5JhzpSTa3VSJyAkE0fqb1y+Vz
         Z5Mx3/VtXaVUk5wb1AYXdqWsYBOyBC5W+BqIRMw1LwZuJK9VOguuCCHxgBuZarnklqLT
         3BSBEKSiu/5Swpiw6Bxv1DBpFpBSldU7o+S40Dt8u/5CcjtvNBNJBKZ1rnuxrf8M8xzH
         DLawbOf6QFk5zoeGLGvzs8ZgR+aXIuLgypN1ugs1aWDh3s/U7DzhI5pCjujDJSTbYj7L
         0cGAlNL66nL3WvqakR0YyaaHaUIEs3UTv/C5wsKKdLBQpyF+tgdQP8XQ15HQn8JQrAOg
         t3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JEcGccdnHcYRckmT1Mk8VXQ+DqIZ40eBlOHSPojs6rE=;
        fh=SrtIhHcJjIpH9Pn3mjO4DGNUbeDvHhakQiA+ImKm/W0=;
        b=BmupH4pt9lreUcHBMFnn7Bl5jOBc2+9sBRugWhuTZmoGFuQ1OIuoz00rNmydcGEJb7
         pJgR+A+2O+I3VPxrSJx3QYXK91Lro4xuC4VuoI8N/T5CyKR4Yuephz2nj8e4UB3F1dgJ
         SSiXs1JxgDsY5PRlelTM7j9079ykl+QrwHxnt84izeK4QojedIAtnsTfdBncj6xTipTI
         VkasQDlLa0zqlM7aS8m34h1HoY+5m1gxP1NOMQ/o1FSTZ98KLkijar5BL98nlmCjCj+r
         OobFgNeEMF7d2FRr7TR2pc3pix/a/1uvGrjfOA9ksyqbHCHuoO6FWlXUT4QvMNiBdZ5O
         +dzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=vgQ32x4Y;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d58e889sor10040918a91.6.2025.05.22.00.40.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 May 2025 00:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=vgQ32x4Y;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747899619; x=1748504419; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEcGccdnHcYRckmT1Mk8VXQ+DqIZ40eBlOHSPojs6rE=;
        b=vgQ32x4YfgTXucfu7mtVlTi4DRoiJk6Alr1DbF5AQ0fer9vcJbpAD/vU6w94P5eyX0
         qUX06SUQH6aFOcCCWVKK0gJdcZwUGGnZRJAM72jbXfDFq1yCeaJmy0Ngquy0eZzvkdmD
         VZB8MpTe+kgrJdrv3GTUYCpknACvSjDNkWq719KSiQl2N9dz3UyB7aOzQwF/0Z8BNVqT
         husPsEPmIeICIoml2Xrb+oIPhR7xKLnxT8IJi7626X7juh5U3Wf18z/YOrqH1zusfcbA
         PO/maLEVadCe/YEvodnzrJBcdSRJJXgfMRJwGAr+Iq2xsMUxXKmqhxqxZwZCNhcvVhwG
         ICGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747899619; x=1748504419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEcGccdnHcYRckmT1Mk8VXQ+DqIZ40eBlOHSPojs6rE=;
        b=w2lepV/6DG62LUwqdutp7F4honJFKTEadvvCcRTJspOKZ+VuJwPQtlCzT1ZTXOH6TN
         Mh2e7x/lTQ1wh854D5GCayIMWUjmm5tycFAaPSOuLWNSL3Al8aP21QcizBwAX4gVS9GZ
         hl19ycK9YB9IiiUSXEphkqYQz8zH3+rQUIgq+e5AZa0uZnXtbkQ0Ud0dYgDEAOq2NIYR
         tL28s89IrEDmGbaB6IFb1EE+pMAfTIlYj986xi2cxs9WDlSPeQWd5PRMdYjalzdyU5gG
         ruP//+TVYavnkqylz29ktlo6gIYGy0bjNcDdMjb5KOFtePB77WPj7iraDquBPhSe1VPS
         pAbA==
X-Gm-Message-State: AOJu0YxIYiVYHUTni4nWJfZVFKgpxoRf1L9JbMOblDNMaM4ARLVZ7o/T
	Us6soFsnXEc5vDj1q0F6YNo2WG39XNhq3YJsT7vqaWB1j+ON5fHMMZfuvx+dALyo9JI=
X-Gm-Gg: ASbGncu83PX1i9LHakEG7wUEIL2WXFMkU9YyJBfZI5fSuqXP0WUSreO7zYMsY7kdBpb
	hi6K1f5PYKcQX9irg382sA8O0BekOKPqwO7v69lDc2MCqvZiPcP3KhSNfXjCr21ewAuT2hw8L2X
	hZxus9zJFPVFXQBuo0k8QRJnRVla/7f5WY51WdmwABoRIyMOoaHC7umBR1hmfgPDQhTBl3u0Jb5
	r1uW4W/98FgmLSTRpc4gKC5sEvRYaucV8QdBkrz4Yfk7rD8Jj4wJ2vdQwqmB9xrl1FXy5jbQosU
	OSAzZaayk8bT7fwJuQSm0Yho5Vn3a2so1XYLCLrbdQudwFegB0h+Gz5D3iU8KQ==
X-Google-Smtp-Source: AGHT+IHKVz9BAmIbe3UyeYJT62whNh3N71DDQ+/3k55HSKvplD4U+oNev/8be9BUEcYySbXKmJjwnw==
X-Received: by 2002:a17:90b:570b:b0:305:5f32:d9f0 with SMTP id 98e67ed59e1d1-30e7d540033mr35484206a91.19.1747899619484;
        Thu, 22 May 2025 00:40:19 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f3650006esm4936820a91.35.2025.05.22.00.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:40:19 -0700 (PDT)
Message-ID: <199e7486-7d05-459b-ad51-cb9b130f299f@daynix.com>
Date: Thu, 22 May 2025 16:40:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] virtio-gpu: fix hang under TCG when unmapping
 blob
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-13-alex.bennee@linaro.org>
 <4d300cca-3ac2-4072-a35c-0b6aef970b26@daynix.com>
 <87bjrl87p5.fsf@draig.linaro.org>
 <83945c43-bfb2-4469-90bd-e3a7c2ca5d89@daynix.com>
 <CAAjaMXZ8acKBSGHvcQOcOnzBDCjFU1SOjse7pHtHWxNeREc2gg@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAAjaMXZ8acKBSGHvcQOcOnzBDCjFU1SOjse7pHtHWxNeREc2gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LO8lCu9ujrtQ

On 2025/05/22 16:31, Manos Pitsidianakis wrote:
> On Thu, May 22, 2025 at 10:03 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/05/22 15:45, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> On 2025/05/22 1:42, Alex Bennée wrote:
>>>>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>> This commit fixes an indefinite hang when using VIRTIO GPU blob
>>>>> objects
>>>>> under TCG in certain conditions.
>>>>> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
>>>>> MemoryRegion and attaches it to an offset on a PCI BAR of the
>>>>> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmaps
>>>>> it.
>>>>> Because virglrenderer commands are not thread-safe they are only
>>>>> called on the main context and QEMU performs the cleanup in three steps
>>>>> to prevent a use-after-free scenario where the guest can access the
>>>>> region after it’s unmapped:
>>>>> 1. From the main context, the region’s field finish_unmapping is
>>>>> false
>>>>>       by default, so it sets a variable cmd_suspended, increases the
>>>>>       renderer_blocked variable, deletes the blob subregion, and unparents
>>>>>       the blob subregion causing its reference count to decrement.
>>>>> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>>>>>       recalculated, the free callback of the blob region
>>>>>       virtio_gpu_virgl_hostmem_region_free is called which sets the
>>>>>       region’s field finish_unmapping to true, allowing the main thread
>>>>>       context to finish replying to the command
>>>>> 3. From the main context, the command is processed again, but this
>>>>> time
>>>>>       finish_unmapping is true, so virgl_renderer_resource_unmap can be
>>>>>       called and a response is sent to the guest.
>>>>> It happens so that under TCG, if the guest has no timers configured
>>>>> (and
>>>>> thus no interrupt will cause the CPU to exit), the RCU thread does not
>>>>> have enough time to grab the locks and recalculate the FlatView.
>>>>> That’s not a big problem in practice since most guests will assume a
>>>>> response will happen later in time and go on to do different things,
>>>>> potentially triggering interrupts and allowing the RCU context to run.
>>>>> If the guest waits for the unmap command to complete though, it blocks
>>>>> indefinitely. Attaching to the QEMU monitor and force quitting the guest
>>>>> allows the cleanup to continue.
>>>>> There's no reason why the FlatView recalculation can't occur right
>>>>> away
>>>>> when we delete the blob subregion, however. It does not, because when we
>>>>> create the subregion we set the object as its own parent:
>>>>>        memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>>>>> The extra reference is what prevents freeing the memory region
>>>>> object in
>>>>> the memory transaction of deleting the subregion.
>>>>> This commit changes the owner object to the device, which removes
>>>>> the
>>>>> extra owner reference in the memory region and causes the MR to be
>>>>> freed right away in the main context.
>>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
>>>>> Cc: qemu-stable@nongnu.org
>>>>> ---
>>>>>     hw/display/virtio-gpu-virgl.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> diff --git a/hw/display/virtio-gpu-virgl.c
>>>>> b/hw/display/virtio-gpu-virgl.c
>>>>> index 71a7500de9..8fbe4e70cc 100644
>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>>>>         vmr->g = g;
>>>>>         mr = g_new0(MemoryRegion, 1);
>>>>>     -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size,
>>>>> data);
>>>>> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>>>>>         memory_region_add_subregion(&b->hostmem, offset, mr);
>>>>>         memory_region_set_enabled(mr, true);
>>>>>
>>>>
>>>> I suggest dropping this patch for now due to the reason I pointed out
>>>> for the first version of this series.
>>>
>>> This fixes an actual bug - without it we get a hang.
>>>
>>
>> I understand that but it also introduces a regression; "[PATCH v3 14/20]
>> ui/gtk-gl-area: Remove extra draw call in refresh" is also a similar case.
>>
>> Ideally such a bug should be fixed without regression, but I understand
>> it is sometimes difficult to do that and postponing the bug resolution
>> until figuring out the correct way does not make sense.
>>
>> In such a case, a bug should be fixed minimizing the regression and the
>> documentation of the regression should be left in the code.
>>
>> In particular, this patch can cause use-after-free whether TCG is used
>> or not. Instead, I suggest to avoid freeing memory regions at all on
>> TCG. It will surely leak memory, but won't result in use-after-free at
>> least and the other accelerators will be unaffected.
>>
>> Regards,
>> Akihiko Odaki
> 
> We tested this fix with ASAN and didn't see anything. Do you have a
> test case in mind that can reproduce this use-after-free? It'd help
> make a certain decision on whether to drop this patch or not. I'm not
> doubting that this can cause a use-after-free by the way, it's just
> that it is hypothetical only. If it causes a use-after-free for sure
> we should definitely drop it.

No, I don't have a test case and it should rarely occur. More 
concretely, a UAF occurs if the guest accesses the memory region while 
trying to unmap it. It is just a theory indeed, but the theory says the 
UAF is possible.

> 
>> Instead, I suggest to avoid freeing memory regions at all on
>> TCG. It will surely leak memory, but won't result in use-after-free at
>> least and the other accelerators will be unaffected.
> 
> Leaking memory for blob objects is also not ideal, since they are
> frequently allocated. It's memory-safe but the leak can accumulate
> over time.
 >

Memory safety and leak free cannot be compatible unless RCU is fixed. We 
need to choose either of them.

Regards,
Akihiko Odaki
