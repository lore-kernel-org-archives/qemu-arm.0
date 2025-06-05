Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp90406njc;
        Thu, 5 Jun 2025 01:34:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d10:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-7480cf3af9emr6249032b3a.10.1749112449631;
        Thu, 05 Jun 2025 01:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749112449; cv=none;
        d=google.com; s=arc-20240605;
        b=OgYB3cIYWRMSJdqM6+AgGPsy4kyZohcQiQ8K8af1oKvazXxRxUGX8FVhQn378x76pK
         S+0eBAkWMY4G1r12Rumc4XJ1H7y7vdyaYgdXhmWiwE+KQqXwZeRjWm3UPHE83KMtfJXJ
         BBxWFSMXc4E9YzutEnmm5FSfRn134Awq3MCM+MahAh8QO8VXsdfUVPlodX7gyNMliy4F
         rJIETZQCOGCVOLgRx6otQfp1WlIIm7Q2pRRzHS1EDMQVTZk9WHd18sohdjeBgDfc3sfk
         fuf6Hgwg5TL7IRG/L/6c9bBARKSdn3VzUyN1WcNV8dS2xoYu/gry24P8YOoSsA2D6f4n
         EWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tMOHrZzVrUi2/6e4m1AAupXpv/NaqEkKjQB9KOeRi1A=;
        fh=f8+9SBMIS5nlfk/aBISynqOLVKqzmF/Xjd0hECl1/y8=;
        b=g3qFmPkjuLu3toXakpXhDE77v1fB+7P/U6tipS3lJJ8h4dX/nGSnVRbo1W1OkCwvoV
         OcMe+KUDtMDtwrInHQI2QPwJqpb2o89SG7ohLQd9Ze28474DvaAqBy+Uo2qya/TioQd6
         kfsRFyG0OknUvzlRMivlzNsmIlZX/DLcEV0CV9+5WBjVv0pqQeXqOP2APz0VwP5xRuZB
         IsIhd+VKHbD3ix3Rq+DZCgF6m0LIKbf2U6gwOINNQQOKLdHqDDw0gfPTh4tQBJSoyO3a
         bkFpNR3Tmgmobxq9s1mRhLQZ6Jfv0luzuX80biPmvcyTSnbHA+hDxtB/DtoCbMhLhSxU
         1Uuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=hcisjSS2;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b2ecebbcbb3sor8498657a12.7.2025.06.05.01.34.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jun 2025 01:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=hcisjSS2;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1749112449; x=1749717249; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMOHrZzVrUi2/6e4m1AAupXpv/NaqEkKjQB9KOeRi1A=;
        b=hcisjSS2YVyI2iJOKkKES1iFDb0ypVpdu6vHuikQaHLJjZgXLzYSd86Qz8AFkO/LSZ
         lwwHe90RMx3VSex6uy/H7Av9Sd/rpmTfAhObgeqW4E19iezSvOwTBOWbS2YDKzdI3VcE
         iQSHmOm+9v5YI1qjRFiPY4g0B6EItYDpyMehi1IrHMaYMYSETunIq2fFCySa17mRk3QF
         alLnw+n1PrFDAy6zpQ4lJMH9T3C7vUAfBn472fs+59E6hfuzdPWjSUZwNjff8QXejvKo
         QyO2jl++gAUMifgwzLKz0lGX3A52sQB4ztYt0IezSyzt/tP5echVfEojei4BeGbT+yUJ
         wzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112449; x=1749717249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tMOHrZzVrUi2/6e4m1AAupXpv/NaqEkKjQB9KOeRi1A=;
        b=BIoKDZpcP8UehIx7RffBIOFNjzFwMA+r2Tx0B3YDeDTHsT/wQ1BGwQIrkRc0dtH38D
         qfInk880xU2d8BVWJhIVUXLlVjsuLQJcfzhVQjanhmiB+vinM58NGCf5e4c3XyJUjg6r
         OUjMQJ1vCjoth4ERRa3YPbtc21XAOfbpQ8Erz7bS46ZCQlVnNfl8/KHyaF8Ctc+DPlSn
         1N8Q5O0jGhVKjs/bwoeA11OC7bKp5GfiEbbABIl+Fehef/ihGz1r53p9IHxyj2YedNFy
         QlVbr8WaMgY0RM8gjriMZsqjmf3196xdIzRp0tP8u0rUvvK76Y21IC9yDqtqvOitK6o/
         nbyQ==
X-Gm-Message-State: AOJu0YyTY5xmmIpeHaPD9OaaiYTjK2txtOay8dboAzSaSgkZNbbBLzo0
	9KnCOcb8gbc44nxZQ+KvLpG5pCFyt5NlcStSUyPVPeVL576mDDDL9OSj0d6nVWFDg3sNtL9hHX3
	HiZ06
X-Gm-Gg: ASbGncu0mHaPggWo/FM/rT0p1msVUGTjTw2Pt3FgrP4FPl6NAxDn7Xw6eof5KNdGl1U
	jrGrNY1t20gA/smHimzQJhSgrGD2DQIUCe0x4tm5M94IVyGAZNyHQybzrIPHwiRW9ysGtEKkeqM
	/Q+0DZvNEmQ7mLiPNGUUmt2OvFmqAXOMYb3hCW7HkjdA7HlPixnHOaaSqDXPNSKbWgmSkT3XLyM
	j1Of7YPNKrHPKaB+And7G4aGQ+rjhjTb7p8EVQw7qaMRgWqL3i/T3AcgROH4pjMQ9q/44hSfAk0
	vjHz4ThOvkOXtBBSLbFnG1ccXmCJ/B7dUumCnnhY8N2vPL3F7aHvnYni+bBxWw4mnxQoMhn59Hn
	/TnOfRtBRUA==
X-Google-Smtp-Source: AGHT+IGqeYx3+8JeKcdJXqGq7bE+FRenx1qtz0UucT0C/Q7fc5XqK5vOMmMJ6CCApw3GTNNxFQzQeQ==
X-Received: by 2002:a17:90b:1e07:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-31310fff2d3mr7436095a91.8.1749112448977;
        Thu, 05 Jun 2025 01:34:08 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313318e68f6sm762612a91.2.2025.06.05.01.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 01:34:08 -0700 (PDT)
Message-ID: <1a86b86d-145a-44fc-9f87-2804767fb109@daynix.com>
Date: Thu, 5 Jun 2025 17:34:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/17] hw/display: re-arrange memory region tracking
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250603110204.838117-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SjG+XImjPe/i

On 2025/06/03 20:01, Alex Bennée wrote:
> QOM objects can be embedded in other QOM objects and managed as part
> of their lifetime but this isn't the case for
> virtio_gpu_virgl_hostmem_region. However before we can split it out we
> need some other way of associating the wider data structure with the
> memory region.
> 
> Fortunately MemoryRegion has an opaque pointer. This is passed down to
> MemoryRegionOps for device type regions but is unused in the
> memory_region_init_ram_ptr() case. Use the opaque to carry the
> reference and allow the final MemoryRegion object to be reaped when
> its reference count is cleared.
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250410122643.1747913-2-manos.pitsidianakis@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>   include/system/memory.h       |  1 +
>   hw/display/virtio-gpu-virgl.c | 23 ++++++++---------------
>   2 files changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/include/system/memory.h b/include/system/memory.h
> index fc35a0dcad..90715ff44a 100644
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -784,6 +784,7 @@ struct MemoryRegion {
>       DeviceState *dev;
>   
>       const MemoryRegionOps *ops;
> +    /* opaque data, used by backends like @ops */
>       void *opaque;
>       MemoryRegion *container;
>       int mapped_via_alias; /* Mapped via an alias, container might be NULL */
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 145a0b3879..71a7500de9 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -52,17 +52,11 @@ virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
>   
>   #if VIRGL_VERSION_MAJOR >= 1
>   struct virtio_gpu_virgl_hostmem_region {
> -    MemoryRegion mr;
> +    MemoryRegion *mr;
>       struct VirtIOGPU *g;
>       bool finish_unmapping;
>   };
>   
> -static struct virtio_gpu_virgl_hostmem_region *
> -to_hostmem_region(MemoryRegion *mr)
> -{
> -    return container_of(mr, struct virtio_gpu_virgl_hostmem_region, mr);
> -}
> -
>   static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>   {
>       VirtIOGPU *g = opaque;
> @@ -73,14 +67,12 @@ static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>   static void virtio_gpu_virgl_hostmem_region_free(void *obj)
>   {
>       MemoryRegion *mr = MEMORY_REGION(obj);
> -    struct virtio_gpu_virgl_hostmem_region *vmr;
> +    struct virtio_gpu_virgl_hostmem_region *vmr = mr->opaque;
>       VirtIOGPUBase *b;
>       VirtIOGPUGL *gl;
>   
> -    vmr = to_hostmem_region(mr);
> -    vmr->finish_unmapping = true;
> -
>       b = VIRTIO_GPU_BASE(vmr->g);
> +    vmr->finish_unmapping = true;
>       b->renderer_blocked--;
>   
>       /*
> @@ -118,8 +110,8 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>   
>       vmr = g_new0(struct virtio_gpu_virgl_hostmem_region, 1);
>       vmr->g = g;
> +    mr = g_new0(MemoryRegion, 1);

This patch does nothing more than adding a separate allocation for 
MemoryRegion. Besides there is no corresponding g_free(). This patch can 
be simply dropped.

Regards,
Akihiko Odaki

>   
> -    mr = &vmr->mr;
>       memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>       memory_region_add_subregion(&b->hostmem, offset, mr);
>       memory_region_set_enabled(mr, true);
> @@ -131,7 +123,9 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>        * command processing until MR is fully unreferenced and freed.
>        */
>       OBJECT(mr)->free = virtio_gpu_virgl_hostmem_region_free;
> +    mr->opaque = vmr;
>   
> +    vmr->mr = mr;
>       res->mr = mr;
>   
>       return 0;
> @@ -142,16 +136,15 @@ virtio_gpu_virgl_unmap_resource_blob(VirtIOGPU *g,
>                                        struct virtio_gpu_virgl_resource *res,
>                                        bool *cmd_suspended)
>   {
> -    struct virtio_gpu_virgl_hostmem_region *vmr;
>       VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
>       MemoryRegion *mr = res->mr;
> +    struct virtio_gpu_virgl_hostmem_region *vmr;
>       int ret;
>   
>       if (!mr) {
>           return 0;
>       }
> -
> -    vmr = to_hostmem_region(res->mr);
> +    vmr = mr->opaque;
>   
>       /*
>        * Perform async unmapping in 3 steps:
