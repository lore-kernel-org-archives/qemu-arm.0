Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp984022njc;
        Fri, 6 Jun 2025 08:02:41 -0700 (PDT)
X-Received: by 2002:ad4:5c6b:0:b0:6f8:c53f:48e with SMTP id 6a1803df08f44-6fb09b6d033mr44365426d6.0.1749222161403;
        Fri, 06 Jun 2025 08:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749222161; cv=none;
        d=google.com; s=arc-20240605;
        b=KsR2OYNYCZWb4HvZHFDsIUGXJScPRpWdH/zqLr3XIrRSEYtN6ZK4yXovxhMruLhOig
         86nsEuPS/KaoND9JTceWIwFX+XdkVFNQN4nblzAeUwvpSP48AnF9rO09Ytwy0dwtkscf
         HIP/jAaDU/A4Z6lPF3oRVwRfcRMHNw4WCKNEuN8laYt5rQ+k9Mg/gUfC4ZQgbRmryuc1
         j2Smim4UJ6/YqAolMkXfFOnGfNIH+y8Jl3iShFIWIQBLdj0tDsimtdE03lKZPejGGS94
         X3bUqQCwzBNkPZ/QR/DeW3HcHw1Mj1VoOF9Sv4Qpi449t6HKraiLTStb+Szt2fIh5FFl
         F5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9BAMIL9hV8jWW4Q8+lqzUQSMZs1DJJaHIjLDQyZEqT8=;
        fh=vaneRB3nTUjNCN5nSoZwjBdIxdZjUKMC3PYqB/zulkU=;
        b=k2l59Ct0r5VYpFs4ZSjWZdGdWiJAHr7WK+PhtzKbPHgYKx81jZXyqoFXevNQW6L0eY
         DQSyVR6UxuQhqCCMxu8j+nX2dt+oeIG2V9+RgMnkKH0gydMDaRs7eYaDHMWrH6MwqIxB
         YaMN2a1TM7K3SBKUuNixK8bjIk+juUzFzjb+oc7zANMrXCcDtfLt3clfW3e+e63sv1mp
         YftrQ8LeMXZqxWl6ohFUlYKFF+AUmuABk1lrRUpBt1jyqwGA3rrY2XbZyGQqE9DbwEqf
         RAlN7RBiS0M4AgHhZZLyGdExjI9JmhWrXDUwFc9QKdLzF6buVLbcWWWNqmkQxqAcojFr
         6l2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=tTJMyZg7;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6a1803df08f44-6fb09a0c1fcsor14289326d6.0.2025.06.06.08.02.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Jun 2025 08:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=tTJMyZg7;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1749222161; x=1749826961; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BAMIL9hV8jWW4Q8+lqzUQSMZs1DJJaHIjLDQyZEqT8=;
        b=tTJMyZg7Uj1r22KHkWjd2wEY4CRygBfct++tClT/N5eGeXza0L/n91TAEF3kk4lkMg
         rXA3faH4sL7NoJYqM4wRiDp2+P2hD3BH0ha8MRzczYAmWIHRXq30hcvUIxJeBzSw1YS5
         0uVaMsMlfGN3+spvHyZI6dzxfBCqx5lOU8R8f3DOOv7XE1GS7rApZ4GA1t8h8mfQ1lcA
         frq3JEWKkZejNZA+UBWihI3o2lIJtsChkVJmSmOhRaYDEUypFCaa/9pYorgX5Dp5hcx5
         boQuKBsiw80NS0qO8b4FU+NHQetFDVsv4v2hlxdJqD8aYGDlf/zF6V/NKS3IgDx1mixU
         /GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222161; x=1749826961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9BAMIL9hV8jWW4Q8+lqzUQSMZs1DJJaHIjLDQyZEqT8=;
        b=YZYisuSugPK9gZlUSra7un90g39KFM1rr4RK1qRjq5VEKQtLoX7+L3vsf59C6o86cE
         Ev1qVllowMPBOijyWOV/pq4KmlX25DN0zB7k3Zp208sT1wyAIfPLvpMuNQyhETXijgx/
         qZwKzXxyHkfNzkBcnc0G3ZVHeQW3ChG3HuegOXzAF7Rb79QG0k/P3S7aqMa+j920ULUx
         Y4ZdafdkiYnJWKgxq5tLiM5ERo9KEzELO6i0xuuWXQj+gseDGrZUHxuLv1CrqqrikhE0
         oKhBEOHJPxpjyn3GowQkNlfr3x+I7sXNfwahYfrlTUGgYUJ2AQ1y0n7vne/T8EtuZpwm
         9EYQ==
X-Gm-Message-State: AOJu0Yy7sY1RcW1e7XOsIx4GO48c6dQyj/FI8uTIAlL3vcuvHyrMqb0p
	nSXGNWgnuwN46bCk8LcENVm8VuDemlXhfFuGtkSvrbcQpEWijHW94Vwn1QdE2BX/vECjVR9jldO
	BCR/u
X-Gm-Gg: ASbGncuXNPfEtR8TyGj7nbAFEpjAfTM59HIYoScNI4xRuYzXhn0rEIKPC+IENCZVpAh
	tQkxWxyj5WG6HCfffYBAD85lj9q8u9r7SFfHmbKit3U3CfUZIQVNkMYGMsnqWV3lF4nRZv/CQDw
	nyTbZQFhTr+a0kiInzQk9YYwZlPS9vfh7mv1gak8p4X1Cs2oufnrDUDveFZeCC12/AOrv9CIaX7
	QTQu8Z+whcBIcugP5cBAzh/0LIfrPIweTmOUmtRiNWx9RRWP6MJFG/opaQxLvVLS2mVi8DAylqB
	yYyRz8O5eKKF7WTn8maYxr+wTh15XrHV7Ltcf8rJZpHVPMS1IK1LzUEvwYVZiimWhkhKPBWJ0fo
	xfx1jPCyaZjEUVfK1YWz+JrOeNdQdsA==
X-Google-Smtp-Source: AGHT+IHWyJvGJD7tHxI9Bm35mwMFBmkqDB72n+i5KCq+24/nbdhBoqk9bvjxESqCTUobnQpJF8RhHg==
X-Received: by 2002:a17:902:ccc8:b0:234:595d:a58e with SMTP id d9443c01a7336-23603a651cdmr44734015ad.25.1749222149796;
        Fri, 06 Jun 2025 08:02:29 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:b783:b00:4952:3c52:120a:27e9? ([2400:4050:b783:b00:4952:3c52:120a:27e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030926a5sm13333645ad.58.2025.06.06.08.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 08:02:29 -0700 (PDT)
Message-ID: <69ab9a77-0e31-4c3a-91de-d8bea9d87a0a@daynix.com>
Date: Sat, 7 Jun 2025 00:02:23 +0900
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
 <5f91c8a2-06ce-45f8-97bd-0602a52e0d21@daynix.com>
 <87tt4t41kr.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87tt4t41kr.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Avbk9T5+BARE



On 2025/06/06 19:16, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/06/05 20:57, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> On 2025/06/03 20:01, Alex Bennée wrote:
>>>>> QOM objects can be embedded in other QOM objects and managed as part
>>>>> of their lifetime but this isn't the case for
>>>>> virtio_gpu_virgl_hostmem_region. However before we can split it out we
>>>>> need some other way of associating the wider data structure with the
>>>>> memory region.
>>>>> Fortunately MemoryRegion has an opaque pointer. This is passed down
>>>>> to
>>>>> MemoryRegionOps for device type regions but is unused in the
>>>>> memory_region_init_ram_ptr() case. Use the opaque to carry the
>>>>> reference and allow the final MemoryRegion object to be reaped when
>>>>> its reference count is cleared.
>>>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Message-Id: <20250410122643.1747913-2-manos.pitsidianakis@linaro.org>
>>>>> Cc: qemu-stable@nongnu.org
>>>>> ---
>>>>>     include/system/memory.h       |  1 +
>>>>>     hw/display/virtio-gpu-virgl.c | 23 ++++++++---------------
>>>>>     2 files changed, 9 insertions(+), 15 deletions(-)
>>>>> diff --git a/include/system/memory.h b/include/system/memory.h
>>>>> index fc35a0dcad..90715ff44a 100644
>>>>> --- a/include/system/memory.h
>>>>> +++ b/include/system/memory.h
>>>>> @@ -784,6 +784,7 @@ struct MemoryRegion {
>>>>>         DeviceState *dev;
>>>>>           const MemoryRegionOps *ops;
>>>>> +    /* opaque data, used by backends like @ops */
>>>>>         void *opaque;
>>>>>         MemoryRegion *container;
>>>>>         int mapped_via_alias; /* Mapped via an alias, container might be NULL */
>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>>>> index 145a0b3879..71a7500de9 100644
>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>> @@ -52,17 +52,11 @@ virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
>>>>>       #if VIRGL_VERSION_MAJOR >= 1
>>>>>     struct virtio_gpu_virgl_hostmem_region {
>>>>> -    MemoryRegion mr;
>>>>> +    MemoryRegion *mr;
>>>>>         struct VirtIOGPU *g;
>>>>>         bool finish_unmapping;
>>>>>     };
>>>>>     -static struct virtio_gpu_virgl_hostmem_region *
>>>>> -to_hostmem_region(MemoryRegion *mr)
>>>>> -{
>>>>> -    return container_of(mr, struct virtio_gpu_virgl_hostmem_region, mr);
>>>>> -}
>>>>> -
>>>>>     static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>>>>>     {
>>>>>         VirtIOGPU *g = opaque;
>>>>> @@ -73,14 +67,12 @@ static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>>>>>     static void virtio_gpu_virgl_hostmem_region_free(void *obj)
>>>>>     {
>>>>>         MemoryRegion *mr = MEMORY_REGION(obj);
>>>>> -    struct virtio_gpu_virgl_hostmem_region *vmr;
>>>>> +    struct virtio_gpu_virgl_hostmem_region *vmr = mr->opaque;
>>>>>         VirtIOGPUBase *b;
>>>>>         VirtIOGPUGL *gl;
>>>>>     -    vmr = to_hostmem_region(mr);
>>>>> -    vmr->finish_unmapping = true;
>>>>> -
>>>>>         b = VIRTIO_GPU_BASE(vmr->g);
>>>>> +    vmr->finish_unmapping = true;
>>>>>         b->renderer_blocked--;
>>>>>           /*
>>>>> @@ -118,8 +110,8 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>>>>           vmr = g_new0(struct virtio_gpu_virgl_hostmem_region, 1);
>>>>>         vmr->g = g;
>>>>> +    mr = g_new0(MemoryRegion, 1);
>>>>
>>>> This patch does nothing more than adding a separate allocation for
>>>> MemoryRegion. Besides there is no corresponding g_free(). This patch
>>>> can be simply dropped.
>>> As the patch says the MemoryRegion is now free'd when it is
>>> de-referenced. Do you have a test case showing it leaking?
>>
>> "De-referenced" is confusing and sounds like pointer dereferencing.
>>
>> OBJECT(mr)->free, which has virtio_gpu_virgl_hostmem_region_free() as
>> its value, will be called to free mr when the references of mr are
>> removed. This patch however does not add a corresponding g_free() call
>> to virtio_gpu_virgl_hostmem_region_free(), leaking mr.
>>
>> AddressSanitizer will catch the memory leak.
> 
> Example invocation?
> 
> I ran the AddressSantizier against all the virtio-gpu tests yesterday
> and it did not complain.

The following command line triggered the memory leak. The image is a 
clean Debian 12 installation. I booted the installation, and shut down 
it by pressing the button on the booted GDM:

build/qemu-system-x86_64 -drive file=debian12.qcow2 -m 8G -smp 8 -device 
virtio-vga-gl,blob=on,hostmem=1G -display egl-headless,gl=on -vnc :0 -M 
q35,accel=kvm
==361968==WARNING: ASan doesn't fully support makecontext/swapcontext 
functions and may produce false positives in some cases!
==361968==WARNING: ASan is ignoring requested __asan_handle_no_return: 
stack type: default top: 0x7bf41d2b8380; bottom 0x7bf2e0f4c000; size: 
0x00013c36c380 (5305189248)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189

=================================================================
==361968==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 816 byte(s) in 3 object(s) allocated from:
     #0 0x7ff640f50a43 in calloc (/lib64/libasan.so.8+0xe6a43) (BuildId: 
6a82bb83b1f19d3f3a2118085acf79daa3b52371)
     #1 0x7ff64077c901 in g_malloc0 (/lib64/libglib-2.0.so.0+0x48901) 
(BuildId: 6827394d759bc44f207f57e7ab5f8e6b17e82c1c)
     #2 0x557fa8080dc5 in virtio_gpu_virgl_map_resource_blob 
../hw/display/virtio-gpu-virgl.c:113
     #3 0x557fa8080dc5 in virgl_cmd_resource_map_blob 
../hw/display/virtio-gpu-virgl.c:772
     #4 0x557fa8080dc5 in virtio_gpu_virgl_process_cmd 
../hw/display/virtio-gpu-virgl.c:952

SUMMARY: AddressSanitizer: 816 byte(s) leaked in 3 allocation(s).

Regards,
Akihiko Odaki
