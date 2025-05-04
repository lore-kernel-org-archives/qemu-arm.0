Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1802201njj;
        Sun, 4 May 2025 01:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaCxi2yyzrCt9axKFgXPYLV68uKg26WAjNd+4t5gjp0nJWvHpuGO3XqQlwIW/QQ38IkdV9VmLOgfOt7A==@linaro.org
X-Received: by 2002:a17:902:ecc5:b0:220:ea90:191e with SMTP id d9443c01a7336-22e18b86242mr77256945ad.4.1746346790394;
        Sun, 04 May 2025 01:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746346790; cv=none;
        d=google.com; s=arc-20240605;
        b=NN5Eyu/Op77qB5b/OMkWJsGXQzySpYihIcpiA+55pZibrL8ZoFoUinLKJqOu6sSjRJ
         KfhiWkpkI66sFuBX9DcWRrSH0YTOdn3d46KOd96RfTdVEVUH6RXozo/dAsrvFP/x2R5H
         DHw3GhMbmGSTjtKiudI9yEMSHRtcx1ERMRFQT3MW12ccfhzWCd9GDEWDr8JEKKNvQy24
         KPcXrlySqTUQXSOx7pgOkK50KIzkAUE6EfYvRACDkkOjepnQ895LDpv1JYo1/Lj36NId
         fWkfn1J6qwthlmhSTrEyM3ah4ZUC0QVa1ZO1TqsSa88WCyUXGEyZaiEHr/35StR5/YQW
         eznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2sH+u/1CIRaF9V4K+12+8/YpUUyDQTX+3EV1uEO1nZ0=;
        fh=3qlcxBwfHpcAbuwEekufMVg1yMl0KZ9eoKZ7iNcu+k0=;
        b=iGmq81b1Kna4C0XsEZgz7BoIKPyErjz7PqAE0A1py6bXBnts0vwjrxj4eiNLvRRHvE
         z1Dgf9N5gkYaNrkaQowuyACpwsAOp+zFyRS/eghQclMaeYHsuYz0Pff0la59Z0Cq7kXT
         EI233GOVviz1mrq7bM47i5xBMTx+BmflThqrx4y5iZ3f8XFwZwuGNolHoRa3/mtYMOpP
         g7oYCZFEBTjE/NGZAGSFs1ortmssvS6TZ/HXb8mj+JyQJFZ72xhx+6xwI+SvJl5/Ou7s
         S0uocHMFOqGO8XVfeZnZ9eIMbA3emVCd+WvqOkMQfNQsJmX//gtaksoFoX/Rkn+vBIUG
         WgAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=ea7tAQQp;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7f823sor33651455ad.13.2025.05.04.01.19.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 01:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=ea7tAQQp;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746346790; x=1746951590; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2sH+u/1CIRaF9V4K+12+8/YpUUyDQTX+3EV1uEO1nZ0=;
        b=ea7tAQQp2Gb7z2ilmeLMUllfjzjSnaC79rraVJPYKrjOP3iDc7gatrJVSwq7+jAt9n
         9gTZ7gmmrTexdkCdeVZGlHeTG3Azyyf2x5DqIz5Ue6IFg3mVEYzaA9cnE0Eoo2qbFAjl
         u9AIJ3QpViMp3yM/ETCrVusufUSgD6d1E2qwH1jox09ZTBDMTzO158NBckE/fxffjjv2
         DqT5BoecVR+yRewDFjJhq5Hh0KsWYnjlAVXchjDndPNGOoE8T1KIcnxUEhPfPRhoXLSO
         OJ6oV1/ObodFEr91PfI0o81sDyfj9ChZQxwSrFyQ4z8Bi1hQbNSHoND2663HVmMA1BTj
         Ngeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746346790; x=1746951590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2sH+u/1CIRaF9V4K+12+8/YpUUyDQTX+3EV1uEO1nZ0=;
        b=G1QuEFg81gi49Sb/hNPI7V8Vs7HfqSWPrmkcDEV4Hgdh7YKwJRrO1kEM+LZvLv1mQ8
         0bpNLLmgjdGqN+t2qOrsGKlto7Wfi87a7aCqMQ3lOKFDKzIT6wHQr/Gz4aDn3Fl9Y+RW
         QwCFzTdTkCokOLJm/WGM4L7Iyk5/a4gV/cct8okJXP3nMisBsIoFdiBcdxHZtvrYN+pi
         XyVwAp6NywWucIF0CJG87SfmII1Guv0KkNCbhZ0Xh1bi4adsu+HWy71RSJbjgBwMJ9Nl
         RqqKdaf5xrkul/IjuuCNveFFG0wtE+jvVq6X1hDT5Un5dec0N5/pUebTo5rBl530Oewh
         w1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+StD8ZndptJpNnDXXsHXyjOG7PyE1qMRUgbKNXdWTQpafULs2o4xp2oY6D/CIkx3xB3p0GQy3MqWiAw==@linaro.org
X-Gm-Message-State: AOJu0YzgMe3LxHCQaqZaxdS19s9YNi8xt/KCdjzociN3YmL5QHsRiBWa
	RWkGKQXVYmfg1iawGipgr6+AjA/yddgee3pztPwKanYGs55jETsxPkCAZTjJUKM=
X-Gm-Gg: ASbGncvvSCdnVBSYFHoR+vzKOR0gQTGIFPrdQS1ZKJ/AgjOy1SxcMiiaE0AbQGb0RTm
	r14iOhQECTxrXVJbICt9YFKFBtdyU2H0cGxc8sOabd5X6pekqA9xPvRCWfab0+PufZdftzKnOPf
	pi8ohdzpho6UronXICFSiFhoQ188i+DQ1OP/nTqB1MnO/IouLK7dz9dxKSNYn/+6puGPR67VhK5
	0IwDwhDIa0GVsdLxg+K1kbwYMvM1mxFJQMt9rcV0XDzgI/P88C78tS1DTrEHH202kJsOQH8UFlP
	QTbEr9vd+AEYAhShJkxFbyjKbFjjbPQ9ybhn5aW54hpF3wj7N+t8zQ==
X-Google-Smtp-Source: AGHT+IHgjuHYcuY2eP2f5H9fZ+ZVJ5xi73FkohOKua/xEfl4tDoaoNZVe17n1ansSUN8IzJM+zNuGg==
X-Received: by 2002:a17:903:4403:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-22e18bcac92mr63603795ad.18.1746346789885;
        Sun, 04 May 2025 01:19:49 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152204desm34348145ad.140.2025.05.04.01.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 01:19:49 -0700 (PDT)
Message-ID: <8994da6c-a369-40c7-b1c6-433519ba90a5@daynix.com>
Date: Sun, 4 May 2025 17:19:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] virtio-gpu: fix hang under TCG when unmapping blob
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <8b123991-21f2-47b5-851d-6b53fbfaa691@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TdSU0yIl7Id+

On 2025/04/30 3:48, Dmitry Osipenko wrote:
> On 4/28/25 15:59, Alex BennÃ©e wrote:
>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>
>> This commit fixes an indefinite hang when using VIRTIO GPU blob objects
>> under TCG in certain conditions.
>>
>> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
>> MemoryRegion and attaches it to an offset on a PCI BAR of the
>> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmaps
>> it.
>>
>> Because virglrenderer commands are not thread-safe they are only
>> called on the main context and QEMU performs the cleanup in three steps
>> to prevent a use-after-free scenario where the guest can access the
>> region after it’s unmapped:
>>
>> 1. From the main context, the region’s field finish_unmapping is false
>>     by default, so it sets a variable cmd_suspended, increases the
>>     renderer_blocked variable, deletes the blob subregion, and unparents
>>     the blob subregion causing its reference count to decrement.
>>
>> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>>     recalculated, the free callback of the blob region
>>     virtio_gpu_virgl_hostmem_region_free is called which sets the
>>     region’s field finish_unmapping to true, allowing the main thread
>>     context to finish replying to the command
>>
>> 3. From the main context, the command is processed again, but this time
>>     finish_unmapping is true, so virgl_renderer_resource_unmap can be
>>     called and a response is sent to the guest.
>>
>> It happens so that under TCG, if the guest has no timers configured (and
>> thus no interrupt will cause the CPU to exit), the RCU thread does not
>> have enough time to grab the locks and recalculate the FlatView.
>>
>> That’s not a big problem in practice since most guests will assume a
>> response will happen later in time and go on to do different things,
>> potentially triggering interrupts and allowing the RCU context to run.
>> If the guest waits for the unmap command to complete though, it blocks
>> indefinitely. Attaching to the QEMU monitor and force quitting the guest
>> allows the cleanup to continue.

The RCU thread should be free to kick in if the guest is waiting and 
idle. That may be a problem that should be analyzed and fixed.

>>
>> There's no reason why the FlatView recalculation can't occur right away
>> when we delete the blob subregion, however. It does not, because when we
>> create the subregion we set the object as its own parent:
>>
>>      memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>>
>> The extra reference is what prevents freeing the memory region object in
>> the memory transaction of deleting the subregion.
>>
>> This commit changes the owner object to the device, which removes the
>> extra owner reference in the memory region and causes the MR to be
>> freed right away in the main context.
>>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
>> Cc: qemu-stable@nongnu.org
>> ---
>>   hw/display/virtio-gpu-virgl.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>> index 71a7500de9..8fbe4e70cc 100644
>> --- a/hw/display/virtio-gpu-virgl.c
>> +++ b/hw/display/virtio-gpu-virgl.c
>> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>       vmr->g = g;
>>       mr = g_new0(MemoryRegion, 1);
>>   
>> -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>>       memory_region_add_subregion(&b->hostmem, offset, mr);
>>       memory_region_set_enabled(mr, true);
>>   
> 
> This change makes QEMU to crash.
> 
> AFAICT, it effectively reverts code to old bugged version [1] that was
> rejected in the past.
> 
> +Akihiko Odaki
> 
> [1]
> https://lore.kernel.org/qemu-devel/20230915111130.24064-10-ray.huang@amd.com/

I think you are right.

Changing the owner indeed makes the MR to be freed right away, but this 
is because it makes a reference by the FlatView to the MR dangling and 
can lead to use-after-free.

Setting the owner to the device implies that the device keeps the 
storage of the MR and. The references to the MR must be counted by the 
device to keep the storage available in such a case.

The MR itself doesn't count the references. It is fine as long as the MR 
is kept alive by being parented by the device, but 
virtio_gpu_virgl_unmap_resource_blob() unparents the MR and breaks the 
assumption. That's why the device shouldn't be the the owner of the MR.

Regards,
Akihiko Odaki
