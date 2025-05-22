Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1667445njc;
        Thu, 22 May 2025 00:03:04 -0700 (PDT)
X-Received: by 2002:a17:903:22c8:b0:233:b397:1a38 with SMTP id d9443c01a7336-233b3971a69mr86373125ad.2.1747897384610;
        Thu, 22 May 2025 00:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747897384; cv=none;
        d=google.com; s=arc-20240605;
        b=Lixm6VxiUjvgFrnGEpoSc3fNUtNqI7bM5VAQYBk3T6+//kMXBTYwXY9XzXYLV2031/
         Km22zOz0UM+nnQEImKhBxP6vD6i4V/vfhKtHTpkzNVSP6buBCQSxr7uX7443KEYej2Yt
         7MFC+LlRiXD5XHdC8khndMqTVa3rfbyb4z0mb4nH0bJwmPSe8KkiLfnNtYJBoR+q6qnj
         /M3e/q5UXYKrZKwIl2u+GCHf2EakOtBr8qvKcAiTqssfKanMNLmjTruK6u6uJPn7ANIO
         ZCWkUCI1iTn5sKMqAcrJddecZPekc4jnzJx5oKM9WFZBaW7pGIvkLUsL1J08rxlxnEft
         bA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6MbzrNe07J9PuN5nKx+v7w9BDmMOmSK5wfI+NNv8fqQ=;
        fh=nRvjpg3IZ/hgF6yNntbk0u41IeQ3/wSdUxFOCj45CpI=;
        b=Na7+4no4W5d9HmGESL6N4kQmAe44PYvs2xFsuxPlXvXcBju5Epvl2zmhsDk6xWJM01
         hYqEBeD3S2D6AO5bhuGDcndAsmNVQvX/S13/q3sHPvMTsZlMYllJhIXKRK1HWvPHwLH5
         4rzifAaEkvaYOKFE84Nwh2Lx8AXV7ickGJ3jZUdVvHJBbx3hmWDSROKUbdUv51ho6j2q
         e152I64wvb0EeGcSctZ9fUTCLqADio8GNSiwblWSQjfxO3HMVRal7P0LqK6054hHrMiV
         1VqMIYdG5+lnf6WDqLfC150H4rhIXtleCFhDgKhyVSKRuUtjDsyRO5ehQvQcO5qg/6Xe
         XFFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=C58B2Lpg;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d4ed6c32sor80518135ad.16.2025.05.22.00.03.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 May 2025 00:03:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=C58B2Lpg;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747897384; x=1748502184; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6MbzrNe07J9PuN5nKx+v7w9BDmMOmSK5wfI+NNv8fqQ=;
        b=C58B2Lpgoj8yKyL4LPCCaSC0E4kc3VKmEIJDOcIkeG1JEICkjIzNC6bzx2l/kr2ij1
         Dn/IJAWR7stktmxJWTtdi1b+THRxreOMNqZ/2xsBBaZh+/ibVl5YgmKUtpHDoXAd4wYm
         MCbvBgNFW6qMI93zwAKVjIqt8kGDzr3s6tiojGudKWGd6TN8qH98chb0cW+8oYH4FFD4
         cmBmIOhW0V93a5Es/62ZHMMcQhPLzL7kHn/SX5xXQ6YKBEQoRbZeM5AwUD1tOLvTgPo5
         VjU5SSt6anItCurdZXG2w1i+eq2Wut4+eGrbD8F3ctG4oXg/k1muQQL7Ljndd6aHxtmI
         P15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897384; x=1748502184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MbzrNe07J9PuN5nKx+v7w9BDmMOmSK5wfI+NNv8fqQ=;
        b=rwkmlcATGTZowu1Eq8OGc3gsc9u0Rmu8myq0n6bRv+F8dBg9vkc7ag7yVm1zJA/cQb
         fzA4QvGWMq1niHulhFjtVXuXy79nuILG33XLBrsWxsXmr/eAy6to7ilAKFmjiPhgK8O7
         bTl+mgHJMCOIwX7yRU25FQuBkRdsyw3PnYkkbiutr5wmHx3mfjgQ2JQ5Vesh9mp8Uo4/
         MhMRnPSyV2H3fM3dtlIxTb0l42hLHw7MZ26jA2yjql6qRAvjxyS1TfDAjq3ydlB7dFwK
         gluGH18pNt0vCkPt0vii/lYZdyYwn3ONEG6iUQTCbdNqUqLJMM36ZsJf3q8S0PpH2KVO
         eHuw==
X-Gm-Message-State: AOJu0YzOR7Pc9wCjQgV/ymtg0oxVllJg3WRyqfsshEwN25PYPkfiC4N9
	DeaVx85tIAHqWBgNXZ8U1iVACLznlXkJaGtKByGB3tJHiU4c0cskVHpo25wdXZEDF4OwbU7kOup
	1HvM2
X-Gm-Gg: ASbGncsK8jmN3b5jH24/da3DKyHwakllC3In8YSM4LiGd1I6qliN8g8LxCizZqJKfu8
	aaFUgAnXd+aPVlV7sy/oA3k0/Op9/LLlGp5ANfJFi+kC9RoNi6p4xQuN15SSuBH6Rpy4IG9jC/U
	OJZlW2QVLH0n8xaP+sVLChkMnkXCtZNUz5CXI22h2iOzttGLL+uKb9NHIWA5IpRM8IxllKynzH9
	QS/IhaeAvjxJj13TD75Xy/ZRwnkW2qq15PKnwfNjMpby2MgzbRCyTMwP2RYlV7Gd9uoAeziWqke
	NusrhmkYzkvDGR6qhMgBUnWyZV1FSr55ar8d0IS0lJjalzhkA6B9NFGOvJm13A==
X-Google-Smtp-Source: AGHT+IFga+LZR3j3IBXBtJnxkI06qGIkBsNmyDUOxUKlGqFVAfaDlB+1RoySglh4RC2lJ/oeuOb71A==
X-Received: by 2002:a17:903:2ece:b0:21f:988d:5758 with SMTP id d9443c01a7336-231d4596fe8mr386551995ad.35.1747897383856;
        Thu, 22 May 2025 00:03:03 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm103115525ad.53.2025.05.22.00.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:03:03 -0700 (PDT)
Message-ID: <83945c43-bfb2-4469-90bd-e3a7c2ca5d89@daynix.com>
Date: Thu, 22 May 2025 16:02:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] virtio-gpu: fix hang under TCG when unmapping
 blob
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-stable@nongnu.org
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-13-alex.bennee@linaro.org>
 <4d300cca-3ac2-4072-a35c-0b6aef970b26@daynix.com>
 <87bjrl87p5.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87bjrl87p5.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9t9iYL9bkUdE

On 2025/05/22 15:45, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/05/22 1:42, Alex Bennée wrote:
>>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>> This commit fixes an indefinite hang when using VIRTIO GPU blob
>>> objects
>>> under TCG in certain conditions.
>>> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
>>> MemoryRegion and attaches it to an offset on a PCI BAR of the
>>> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmaps
>>> it.
>>> Because virglrenderer commands are not thread-safe they are only
>>> called on the main context and QEMU performs the cleanup in three steps
>>> to prevent a use-after-free scenario where the guest can access the
>>> region after it’s unmapped:
>>> 1. From the main context, the region’s field finish_unmapping is
>>> false
>>>      by default, so it sets a variable cmd_suspended, increases the
>>>      renderer_blocked variable, deletes the blob subregion, and unparents
>>>      the blob subregion causing its reference count to decrement.
>>> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>>>      recalculated, the free callback of the blob region
>>>      virtio_gpu_virgl_hostmem_region_free is called which sets the
>>>      region’s field finish_unmapping to true, allowing the main thread
>>>      context to finish replying to the command
>>> 3. From the main context, the command is processed again, but this
>>> time
>>>      finish_unmapping is true, so virgl_renderer_resource_unmap can be
>>>      called and a response is sent to the guest.
>>> It happens so that under TCG, if the guest has no timers configured
>>> (and
>>> thus no interrupt will cause the CPU to exit), the RCU thread does not
>>> have enough time to grab the locks and recalculate the FlatView.
>>> That’s not a big problem in practice since most guests will assume a
>>> response will happen later in time and go on to do different things,
>>> potentially triggering interrupts and allowing the RCU context to run.
>>> If the guest waits for the unmap command to complete though, it blocks
>>> indefinitely. Attaching to the QEMU monitor and force quitting the guest
>>> allows the cleanup to continue.
>>> There's no reason why the FlatView recalculation can't occur right
>>> away
>>> when we delete the blob subregion, however. It does not, because when we
>>> create the subregion we set the object as its own parent:
>>>       memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>>> The extra reference is what prevents freeing the memory region
>>> object in
>>> the memory transaction of deleting the subregion.
>>> This commit changes the owner object to the device, which removes
>>> the
>>> extra owner reference in the memory region and causes the MR to be
>>> freed right away in the main context.
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
>>> Cc: qemu-stable@nongnu.org
>>> ---
>>>    hw/display/virtio-gpu-virgl.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/hw/display/virtio-gpu-virgl.c
>>> b/hw/display/virtio-gpu-virgl.c
>>> index 71a7500de9..8fbe4e70cc 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>>        vmr->g = g;
>>>        mr = g_new0(MemoryRegion, 1);
>>>    -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size,
>>> data);
>>> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>>>        memory_region_add_subregion(&b->hostmem, offset, mr);
>>>        memory_region_set_enabled(mr, true);
>>>    
>>
>> I suggest dropping this patch for now due to the reason I pointed out
>> for the first version of this series.
> 
> This fixes an actual bug - without it we get a hang.
> 

I understand that but it also introduces a regression; "[PATCH v3 14/20] 
ui/gtk-gl-area: Remove extra draw call in refresh" is also a similar case.

Ideally such a bug should be fixed without regression, but I understand 
it is sometimes difficult to do that and postponing the bug resolution 
until figuring out the correct way does not make sense.

In such a case, a bug should be fixed minimizing the regression and the 
documentation of the regression should be left in the code.

In particular, this patch can cause use-after-free whether TCG is used 
or not. Instead, I suggest to avoid freeing memory regions at all on 
TCG. It will surely leak memory, but won't result in use-after-free at 
least and the other accelerators will be unaffected.

Regards,
Akihiko Odaki
