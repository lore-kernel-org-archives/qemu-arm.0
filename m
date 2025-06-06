Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp802151njc;
        Fri, 6 Jun 2025 02:40:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:312:959:dc41 with SMTP id 98e67ed59e1d1-3134768b6d2mr4418608a91.27.1749202812875;
        Fri, 06 Jun 2025 02:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749202812; cv=none;
        d=google.com; s=arc-20240605;
        b=VgqVgpbJiYs94YXN2rGQHFp/pqB7hO0IaLo9LJ3+QNr1FevA2Y3JKweSnUY5g7le21
         XgkSOy0PVhLvY8885/91tUPkNuVk5QzTAJ2xzvhvWd3CCzE8PfghKEEy1rkf953yUtAg
         LMqcwoAltF/8mKM85uA5UpiaCP2yE+UDd3CBU6m9odpjKkYMjfAUonhWfr3RThg5SKgJ
         MVqJLb8OAet/ImFExRoIB0XAjqO4zlcbgBetKDkqFPEI+Rx9Hw2TqQvcULNgi+dO/oc1
         kS7lymfFXvvo/1lhWLOUla1Qt0fZqWnnZzY2ZirI2EFQ5PQTT83hbr2P7udu7Zkc6E/v
         ncsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=esAWygc9eCcOYXnhqUzkKA5xdMdkCaGowu3g4HIGKF4=;
        fh=vaneRB3nTUjNCN5nSoZwjBdIxdZjUKMC3PYqB/zulkU=;
        b=Tfe6MsYM2rnTch/lpLl1H04QRBUBzduNvH9fW1rFeLIvBjoaMYang5bqQcb+PEzp4E
         z/wOry4rmI/yksv5qxkTtZVWlN4HJ1qQANPnlZt5YE60FO7Vbb8XfTfKsVyS4qLIdi8Y
         6hzr69wAKKg7mipPaMoiofRTa4U52djjh2w2jpn7lyey8D7wnC7enfhAYAGqvt5usCrq
         X6Byd8fjAHO+q6mkYFMk/2IlS81MS1/U9lVC4NTzm8DtmL8yA/p2T4aipqc3bUVuTEyI
         0XA/Fs+IDJ26/3721kgDjDKI25n14IXs7dSZpJ0QlVzuCjlNPYUYgdc772c/ERVWnoLF
         E35g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=qcmd6oWr;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3134b0da44bsor1126248a91.6.2025.06.06.02.40.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Jun 2025 02:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=qcmd6oWr;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1749202812; x=1749807612; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=esAWygc9eCcOYXnhqUzkKA5xdMdkCaGowu3g4HIGKF4=;
        b=qcmd6oWrw5bcPW/xrQepwooTY17A4qZRGS+4Ze0+8IjUbBWTyvfRoPnEt6xNe3M+Ww
         5wFbPJ7PBnYut8DueJzJ5YvsyoZGeGN16C5mgd7nDTpQpNYaqeoedP7+L17S1Hy4lqwN
         AXZQ+54KwYjv0LBh9zUtYWmi8UhHg1LeWKY224H9RK7BOmUZekJ11whj6OXrh0kSkuF8
         uDrDPDdaTZMiMvJZCPmIq51iVbMBAeX2Pbdjrm2XVad2kY7ae5omOZAzTVLgZWIoE+Bj
         AXxZkjrZ6qMzisdOHkGyAw0I27gTpiRhBFAqDoZATJWAlcVZYXDuZhwOcxvfBReK74pU
         EfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202812; x=1749807612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=esAWygc9eCcOYXnhqUzkKA5xdMdkCaGowu3g4HIGKF4=;
        b=qb7Pv2fBru3BYdUAQeMLJgD882uudtOcq34Of4lG3WzsayWMlvyKdnoEVk5o0voAiQ
         QUwP5tcX/ZoZu3OGoou7cGohaY3AWo45viiK5MnLvbtf9s0AbxFqgbPI0hCo2fl+h5W9
         R+hSjDJh8zdtQ/I4MgaX5hJiMys9FCu20lA63Lf3yA7bZRQyToqLttl3FFGav3X6WNww
         ikUqVlJo8XbqBfJmJu4K4tNbRd4HaW6QdP7EeOqiPrV3Txfw9exJ0e+CybzSiigBtx4T
         c8q9XxwFu5gslaWVAQJPVrJAuQjocqRcu5KunzdBGG06/blapW0eDw0fPstkzOOZXRSw
         wjzw==
X-Gm-Message-State: AOJu0YzIlS+Yrs4N3WiW4FYJZZIwV0tWuvGas/tPGwih9oUrmH62WXjI
	LJ33FunZC/OAkdbJfLqzg6zLy6AHL9dFnW3dYrVIF1Qb3WM27NZRp2t5E0wuE4djcug3Dxr8z2G
	OaCXf
X-Gm-Gg: ASbGnctwo1L+j4sO0KdY7W5j6GyvUd17Y+rZ+ZcoId8sr7B4DQ8ozZ+pPlOcsAFzgo3
	PJPjlR2OJGNhLMiL2HsQ4gG9G2ZfbI5knfEYZSdBrh/UyLmI90ypTlCKlzbaJQNDGRgEeRuZjD2
	XI0P4Z0cTV1VWY4/xDBrCwF5Nv4NVUKSrCbKmkvTNufELPfrnAfGG3O60mST7zdCWqjNmPbdcDX
	qUHJT5bMKMrhEnZSzJjVK3H6o8JYU4oUz32fBBwXHMK0NUYtOmBzk5xGPPZ57k57jecrPARZkgk
	m5Pm8aYGTL2g5HzazqIGAAOo1anoHNHUF1uJX4vKlUKNEz2sH5tM+6Bd5bYwYGcx
X-Google-Smtp-Source: AGHT+IGBVyPvGf5uZ80vgYoPctKkqm2xqLaepitaeEtfhQ91NtA0+dzX4v/O0NMhXHhTORsu5UDgng==
X-Received: by 2002:a17:90b:3fcb:b0:312:959:dc41 with SMTP id 98e67ed59e1d1-3134768b6d2mr4418558a91.27.1749202812203;
        Fri, 06 Jun 2025 02:40:12 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f17bc7sm979252a91.7.2025.06.06.02.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 02:40:11 -0700 (PDT)
Message-ID: <5f91c8a2-06ce-45f8-97bd-0602a52e0d21@daynix.com>
Date: Fri, 6 Jun 2025 18:40:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/17] hw/display: re-arrange memory region tracking
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87o6v2764e.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Hm5EayWBMwb6

On 2025/06/05 20:57, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/06/03 20:01, Alex Bennée wrote:
>>> QOM objects can be embedded in other QOM objects and managed as part
>>> of their lifetime but this isn't the case for
>>> virtio_gpu_virgl_hostmem_region. However before we can split it out we
>>> need some other way of associating the wider data structure with the
>>> memory region.
>>> Fortunately MemoryRegion has an opaque pointer. This is passed down
>>> to
>>> MemoryRegionOps for device type regions but is unused in the
>>> memory_region_init_ram_ptr() case. Use the opaque to carry the
>>> reference and allow the final MemoryRegion object to be reaped when
>>> its reference count is cleared.
>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20250410122643.1747913-2-manos.pitsidianakis@linaro.org>
>>> Cc: qemu-stable@nongnu.org
>>> ---
>>>    include/system/memory.h       |  1 +
>>>    hw/display/virtio-gpu-virgl.c | 23 ++++++++---------------
>>>    2 files changed, 9 insertions(+), 15 deletions(-)
>>> diff --git a/include/system/memory.h b/include/system/memory.h
>>> index fc35a0dcad..90715ff44a 100644
>>> --- a/include/system/memory.h
>>> +++ b/include/system/memory.h
>>> @@ -784,6 +784,7 @@ struct MemoryRegion {
>>>        DeviceState *dev;
>>>          const MemoryRegionOps *ops;
>>> +    /* opaque data, used by backends like @ops */
>>>        void *opaque;
>>>        MemoryRegion *container;
>>>        int mapped_via_alias; /* Mapped via an alias, container might be NULL */
>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>> index 145a0b3879..71a7500de9 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -52,17 +52,11 @@ virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
>>>      #if VIRGL_VERSION_MAJOR >= 1
>>>    struct virtio_gpu_virgl_hostmem_region {
>>> -    MemoryRegion mr;
>>> +    MemoryRegion *mr;
>>>        struct VirtIOGPU *g;
>>>        bool finish_unmapping;
>>>    };
>>>    -static struct virtio_gpu_virgl_hostmem_region *
>>> -to_hostmem_region(MemoryRegion *mr)
>>> -{
>>> -    return container_of(mr, struct virtio_gpu_virgl_hostmem_region, mr);
>>> -}
>>> -
>>>    static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>>>    {
>>>        VirtIOGPU *g = opaque;
>>> @@ -73,14 +67,12 @@ static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>>>    static void virtio_gpu_virgl_hostmem_region_free(void *obj)
>>>    {
>>>        MemoryRegion *mr = MEMORY_REGION(obj);
>>> -    struct virtio_gpu_virgl_hostmem_region *vmr;
>>> +    struct virtio_gpu_virgl_hostmem_region *vmr = mr->opaque;
>>>        VirtIOGPUBase *b;
>>>        VirtIOGPUGL *gl;
>>>    -    vmr = to_hostmem_region(mr);
>>> -    vmr->finish_unmapping = true;
>>> -
>>>        b = VIRTIO_GPU_BASE(vmr->g);
>>> +    vmr->finish_unmapping = true;
>>>        b->renderer_blocked--;
>>>          /*
>>> @@ -118,8 +110,8 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>>          vmr = g_new0(struct virtio_gpu_virgl_hostmem_region, 1);
>>>        vmr->g = g;
>>> +    mr = g_new0(MemoryRegion, 1);
>>
>> This patch does nothing more than adding a separate allocation for
>> MemoryRegion. Besides there is no corresponding g_free(). This patch
>> can be simply dropped.
> 
> As the patch says the MemoryRegion is now free'd when it is
> de-referenced. Do you have a test case showing it leaking?

"De-referenced" is confusing and sounds like pointer dereferencing.

OBJECT(mr)->free, which has virtio_gpu_virgl_hostmem_region_free() as 
its value, will be called to free mr when the references of mr are 
removed. This patch however does not add a corresponding g_free() call 
to virtio_gpu_virgl_hostmem_region_free(), leaking mr.

AddressSanitizer will catch the memory leak.

Regards,
Akihiko Odaki
