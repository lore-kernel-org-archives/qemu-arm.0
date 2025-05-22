Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1736104njc;
        Thu, 22 May 2025 02:54:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4acf:b0:2ee:aa28:79aa with SMTP id 98e67ed59e1d1-30e830c772dmr32267054a91.6.1747907668185;
        Thu, 22 May 2025 02:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747907668; cv=none;
        d=google.com; s=arc-20240605;
        b=JVq7SjeM1zwSDt81JNpqEwOng5+w18+0YEgsyx0SbuqsxRRqK2jKudBpnUGuc/jMiU
         vLfeUju/lfccX2JO/G6yc2kVU0rxTi1QdLBK3Nv2MjOtns8e665ILLsjMFpFec8ob69v
         WpJxBEb1rihzK7tb4s++6g4wRkkFdQl4lNzXm9nxe7BHpToBONc565/1D/IDuv9TVe4n
         GloWp+1fFXMGF1TumLsQQUek92jehuJJTsg21DNSPcWFQ5xOBNixF1U7AvEgdnDbb6mo
         I2TCjEzbziTELVzQZwJQyomjFAVZmbXEdc44jXIZyLBW633fWv6Fjw/QLPa+lXFZACyd
         p33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aaFSaf23Koy2JTgytHwLuqhpvUUPb3U0eibHAUGSHAE=;
        fh=vz/Wu4DZUmj/fvUnyKW4Lbak49ERl7A7MmX3qqu4zJY=;
        b=PxWHLS9keKlJPbwuYfmfMwg6ZoodG+DVcr6VDJvjcEPTvGZCqx0X6P6xdKzVGYk7Zl
         0QmiPgl2jUOst4Pz5KjOkAGy02QXJXE2uypIgefrOOzlMKNKqrHIbp8rKars9ynlNHPX
         vr9SH/XRGS/zvXbmLVbvGkKEFiJsEAnaWkzJxthLEzFjAp7lAHD83iToV5Hi8dfD4jrG
         OKkYbuHhZJ0zpQ7hersjBVHl+9rjgtwJDeLxzmQkvo1MO64IoQ4qwkb+IV29KdKHAVuo
         UWsohouOY/z6Zcm3CAXo4D2jrP+LyqYp4JJ18F5klcJ8C+l5vJlZAkRCeDHtsgQvsXKT
         1uqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rLSydIuF;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d59803esor11157296a91.8.2025.05.22.02.54.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 May 2025 02:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rLSydIuF;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747907667; x=1748512467; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aaFSaf23Koy2JTgytHwLuqhpvUUPb3U0eibHAUGSHAE=;
        b=rLSydIuFy5CzadLPjcHKOWK40XfKRjzVig5NNCpUMH7MqKy4/CtwCo9z/arHlnk+4Q
         WJsSGoL7n4WPIsEp0MwYSmQzhgx9Fag4s3rOYkIgw5NN6eB/Jj891EiyDpnKHRHJMc15
         LIreDEOqT1uWk8YKluRXLY3SR5eqdoZAeogmZfUI+G/nqdaVTjWJVPEjijG9e3hu6fPq
         mO1CPgKppTPX4i2iaBlqGWCCWNxPrwr+zYFI0MhCdEStdzWqBFBNj//5NzQIpzt9LQhF
         5aXHo0Ucbhk4Af/RzBt0yB5lWOOpNCuF2aB+BbFwqzgAhOPueQtooPXZ2c9204lEmcEl
         I5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907667; x=1748512467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aaFSaf23Koy2JTgytHwLuqhpvUUPb3U0eibHAUGSHAE=;
        b=Ycb6+esuXw6+byLVoF2GlMiQyeO0HYg4FIlLwNO8UB7Q30JSSOIENufIahyu6le8rn
         endyK6oDF89aKTa7C3lUZvRvLH59suvyCMdPdia2HTTAqHNLxKphRf0LkwI8I23Wfd78
         eJBQzzB98oI5uyIaFAfrq1PMzaX5BLyTlBJicGhDKor6OnnsCuLDdaGn92KiaTMEijiB
         Y7AlqsVYUiqzWSz0Mpc3Jam+Oupxw50/6RQS7uu+MmY7iCEg6BPv/XvJBanRrbvMV2kl
         BA+4oKWJAzu6ekoFH8Q2io8lEtWm/1LP+m6/uF7MsObtq3Ro/YFb6JvfLeq6L27ym/N4
         /ZAA==
X-Gm-Message-State: AOJu0YwTQZVrlqwvXd0Qp+9iu989yrO8+D66bxc9TcogkSpi6RX4bTy5
	ri2OStboQs98fWNORn8pPjvud23XlnvaGRdKPcYYRUbOIjLb6YOTsofk0GK6TmMA26xsn6ioZC7
	wli8K
X-Gm-Gg: ASbGnculzVltF27KcNH2GxLPqd0tDR6YMm7dj9NPRE4/XuuyilkoW2IxhNjWAAbBLU6
	ELJZwxQKONKZNtS4UlOoAXplqYs4DWPaJeDQBjHR0ZMl+ueBIH9bOvh7HDCGOoJMmdcETjSZVST
	5N7d31JA0FfJqWJyN2e4MK/OhVQseBT1sTX3oPhM3xdt1npcq4k8GJLo2qzmRDa/oXE94tBXXXS
	bUme//1SPYKftGDTK7MYiowDrcvyXkcmrX8A1WOx82fu8DS7bSsRajkE9La3T8IajPm0CFICByZ
	6opQ4OFjm+75Jntne0+muOycm3/N0XORQ+2AnXzsA9YsoNozLXtN0W2NpGyYuw==
X-Google-Smtp-Source: AGHT+IEjjvXahyD+ZoN6VDhT/fLVUUwGSIJiUMdvYkOUf/B37fx+ADX5fFMGVTX7TzDFaeQVU/99HQ==
X-Received: by 2002:a17:90b:3d85:b0:30e:5042:a8c8 with SMTP id 98e67ed59e1d1-30e8313d1camr44708085a91.18.1747907667355;
        Thu, 22 May 2025 02:54:27 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f84sm5559881a91.14.2025.05.22.02.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:54:26 -0700 (PDT)
Message-ID: <d5c429eb-d583-4b9d-85c1-b0636e789e9c@daynix.com>
Date: Thu, 22 May 2025 18:54:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] virtio-gpu: fix hang under TCG when unmapping
 blob
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
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
 <199e7486-7d05-459b-ad51-cb9b130f299f@daynix.com>
 <875xht805w.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <875xht805w.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fBVIjVh6EtKM

On 2025/05/22 18:28, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/05/22 16:31, Manos Pitsidianakis wrote:
>>> On Thu, May 22, 2025 at 10:03 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/05/22 15:45, Alex Bennée wrote:
>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>
>>>>>> On 2025/05/22 1:42, Alex Bennée wrote:
>>>>>>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>>>> This commit fixes an indefinite hang when using VIRTIO GPU blob
>>>>>>> objects
>>>>>>> under TCG in certain conditions.
>>>>>>> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
>>>>>>> MemoryRegion and attaches it to an offset on a PCI BAR of the
>>>>>>> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmaps
>>>>>>> it.
>>>>>>> Because virglrenderer commands are not thread-safe they are only
>>>>>>> called on the main context and QEMU performs the cleanup in three steps
>>>>>>> to prevent a use-after-free scenario where the guest can access the
>>>>>>> region after it’s unmapped:
>>>>>>> 1. From the main context, the region’s field finish_unmapping is
>>>>>>> false
>>>>>>>        by default, so it sets a variable cmd_suspended, increases the
>>>>>>>        renderer_blocked variable, deletes the blob subregion, and unparents
>>>>>>>        the blob subregion causing its reference count to decrement.
>>>>>>> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>>>>>>>        recalculated, the free callback of the blob region
>>>>>>>        virtio_gpu_virgl_hostmem_region_free is called which sets the
>>>>>>>        region’s field finish_unmapping to true, allowing the main thread
>>>>>>>        context to finish replying to the command
>>>>>>> 3. From the main context, the command is processed again, but this
>>>>>>> time
>>>>>>>        finish_unmapping is true, so virgl_renderer_resource_unmap can be
>>>>>>>        called and a response is sent to the guest.
>>>>>>> It happens so that under TCG, if the guest has no timers configured
>>>>>>> (and
>>>>>>> thus no interrupt will cause the CPU to exit), the RCU thread does not
>>>>>>> have enough time to grab the locks and recalculate the FlatView.
>>>>>>> That’s not a big problem in practice since most guests will assume a
>>>>>>> response will happen later in time and go on to do different things,
>>>>>>> potentially triggering interrupts and allowing the RCU context to run.
>>>>>>> If the guest waits for the unmap command to complete though, it blocks
>>>>>>> indefinitely. Attaching to the QEMU monitor and force quitting the guest
>>>>>>> allows the cleanup to continue.
>>>>>>> There's no reason why the FlatView recalculation can't occur right
>>>>>>> away
>>>>>>> when we delete the blob subregion, however. It does not, because when we
>>>>>>> create the subregion we set the object as its own parent:
>>>>>>>         memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>>>>>>> The extra reference is what prevents freeing the memory region
>>>>>>> object in
>>>>>>> the memory transaction of deleting the subregion.
>>>>>>> This commit changes the owner object to the device, which removes
>>>>>>> the
>>>>>>> extra owner reference in the memory region and causes the MR to be
>>>>>>> freed right away in the main context.
>>>>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
>>>>>>> Cc: qemu-stable@nongnu.org
>>>>>>> ---
>>>>>>>      hw/display/virtio-gpu-virgl.c | 2 +-
>>>>>>>      1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>> diff --git a/hw/display/virtio-gpu-virgl.c
>>>>>>> b/hw/display/virtio-gpu-virgl.c
>>>>>>> index 71a7500de9..8fbe4e70cc 100644
>>>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>>>> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>>>>>>          vmr->g = g;
>>>>>>>          mr = g_new0(MemoryRegion, 1);
>>>>>>>      -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size,
>>>>>>> data);
>>>>>>> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>>>>>>>          memory_region_add_subregion(&b->hostmem, offset, mr);
>>>>>>>          memory_region_set_enabled(mr, true);
>>>>>>>
>>>>>>
>>>>>> I suggest dropping this patch for now due to the reason I pointed out
>>>>>> for the first version of this series.
>>>>>
>>>>> This fixes an actual bug - without it we get a hang.
>>>>>
>>>>
>>>> I understand that but it also introduces a regression; "[PATCH v3 14/20]
>>>> ui/gtk-gl-area: Remove extra draw call in refresh" is also a similar case.
>>>>
>>>> Ideally such a bug should be fixed without regression, but I understand
>>>> it is sometimes difficult to do that and postponing the bug resolution
>>>> until figuring out the correct way does not make sense.
>>>>
>>>> In such a case, a bug should be fixed minimizing the regression and the
>>>> documentation of the regression should be left in the code.
>>>>
>>>> In particular, this patch can cause use-after-free whether TCG is used
>>>> or not. Instead, I suggest to avoid freeing memory regions at all on
>>>> TCG. It will surely leak memory, but won't result in use-after-free at
>>>> least and the other accelerators will be unaffected.
>>>>
>>>> Regards,
>>>> Akihiko Odaki
>>> We tested this fix with ASAN and didn't see anything. Do you have a
>>> test case in mind that can reproduce this use-after-free? It'd help
>>> make a certain decision on whether to drop this patch or not. I'm not
>>> doubting that this can cause a use-after-free by the way, it's just
>>> that it is hypothetical only. If it causes a use-after-free for sure
>>> we should definitely drop it.
>>
>> No, I don't have a test case and it should rarely occur. More
>> concretely, a UAF occurs if the guest accesses the memory region while
>> trying to unmap it. It is just a theory indeed, but the theory says
>> the UAF is possible.
> 
> I have a test case this fixes which I think trumps a theoretical UAF
> without a test case.
> 
> Why would the guest attempt to access after triggering the free itself?
> Wouldn't it be correct to fault the guest for violating its own memory
> safety rules?

docs/devel/secure-coding-practices.rst says "Unexpected accesses must 
not cause memory corruption or leaks in QEMU".

I'm not completely sure whether it is safe without concurrent accesses 
either. In particular, KVM does not immediately update the guest memory 
mapping, so it may result in a time window where the guest memory is 
mapped to an unmapped host memory region, and I suspect that could cause 
a problem. That also motivates limiting the scope of the change to TCG.

> 
>>>> Instead, I suggest to avoid freeing memory regions at all on
>>>> TCG. It will surely leak memory, but won't result in use-after-free at
>>>> least and the other accelerators will be unaffected.
>>> Leaking memory for blob objects is also not ideal, since they are
>>> frequently allocated. It's memory-safe but the leak can accumulate
>>> over time.
>>>
>>
>> Memory safety and leak free cannot be compatible unless RCU is fixed.
>> We need to choose either of them.
> 
> How can the guest access something that is now unmapped? The RCU should
> only run after the flatview has been updated.

This patch bypasses RCU. That's why it solves the hang even though the 
RCU itself is not fixed.

Let me summarize the theory and the actual behavior below:

The theory is that RCU satisfies the common requirement of concurrent 
algorithms. More concretely:
1) It is race-free; for RCU, it means it prevents use-after-free.
2) It does not prevent forward progress.

The patch message suggests 2) is not satisfied. A proper fix would be to 
change RCU to satisfy 2).

However, this patch workarounds the problem by circumventing RCU, which 
solves 2) but it regresses 1).

My suggestion is to document and to limit the impact of 1) by:
a) Limiting the scope of the change to TCG.
b) Not freeing memory regions, which will prevent use-after-free while 
leaking memory.

Manos said b) can be problematic because mappings are frequently 
created. Whether b) makes sense or not depends on the probability and 
impact of UAF and memory leak.

Regards,
Akihiko Odaki
