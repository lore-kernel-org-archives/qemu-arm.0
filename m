Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1643984njc;
        Wed, 21 May 2025 22:59:45 -0700 (PDT)
X-Received: by 2002:a17:903:1b6d:b0:22e:3ea4:b55c with SMTP id d9443c01a7336-231d454425emr309785955ad.30.1747893584959;
        Wed, 21 May 2025 22:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747893584; cv=none;
        d=google.com; s=arc-20240605;
        b=RcNcnycekobZ4FG4I+2om7uzO3orF1ePI5uRCyHVpQACIXn79NmUOPuYyHAlMtjyhz
         Nrx6KXng+k7ang4dlzQNLodVJfqF/awpdjAEdjKAyduyhXMouQ6Y/+wEyGmYA/V6aL08
         N4JEC+RLH6ub+JBlQpiY8rJc+OX4Foz1nREcwVS6jMoPooYqKQDwFw58tij8dq2ugTcr
         V9kpahtsjvHiWx+Lo97bWGOnFG6h4h9QkNGGgDTvl0tCtVoBcQtjiNt5Jnj4zrRQ5IAP
         uy9GceIKoa3jbDO2Fzy0ESYGnyujxGPzEPELKPvqUCy2lO7gPtaCu21P6M4hfUanajLK
         w5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ll92QMKsFRvpgTuMWBg4qCrKu3QQgX5gI3lF9iL3GEo=;
        fh=POEL6Dwl8CQWgVEsofc+zJQeEwjZ5KJzO04JOE3Ynm4=;
        b=GpkRTXKUCMKfTvGUiD7/zl133LoL+EW1CvSbYKpfU9+09eF7Xs9KPMmruoSY7twtqs
         06XTrYSm6sdFfR30umNMRu1peu4ufpDzLECEIfaDEm66s3F8u+e13Zoe1GngcdAI6jk8
         0hBplDa47eg1Mx9ntk9g3a5zW7HMF9fVcZzsYyZVPUfXb7fKRKCL7AWVtcl4G45VA4DQ
         SyhMLJrT/tw0Zz1cAV0EHj/EUeleS9htstGpw4AYj5zVthPmT6ZfHBxkB03VnDNNpZCR
         StQgzUETPdXpb0aAKF5M3DIr9HrBLungboeFJaPDpJnkXv9IqwBKC30WKqwhSrO14Idc
         6V0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="ltIy1/go";
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d4ed7e0csor83314665ad.12.2025.05.21.22.59.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 22:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="ltIy1/go";
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747893584; x=1748498384; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ll92QMKsFRvpgTuMWBg4qCrKu3QQgX5gI3lF9iL3GEo=;
        b=ltIy1/gochxmMHGAqpdqs1bdoiXxybeT3Fvkj6S2aNGSefsc1k6A4L7JKcTHwoFAOG
         BwlxZSaJdsKCgtBkbYi06x4YsYjj8W8hcWtUnf1s5GP+J2ZHH4eYRcEgOsJ0R9+SKCEE
         gJXwgYqfdP90TGFHET52QR+J380E5lq/N/k01NPS+BsR7tsFQOt2Hj3DOss65Z6f6Qhd
         6HFK2oa9gldt1MVNGpNI3d23dvgAKq3bsmOfWVvQVYWMv/mfYczSYSSWBbDdG9S+1XBw
         RCeMQmotKNmqUDv5Vc8uMJ9b1LP/mOOMJbO50W94rKDKUD7cmkVEUImsS2xTaw5Fsmrb
         f7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747893584; x=1748498384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ll92QMKsFRvpgTuMWBg4qCrKu3QQgX5gI3lF9iL3GEo=;
        b=OPPYCZMKrJjfifZjm+dxkfixWIip9u/MxFvC31Qo5Nj7KW/i+zoCggf+ssA6sOmlpf
         aWs71cqPuonkrd+Fp4/FsfrXcLytefJyPu065kO9BJju4sMbJvYFdEF3feoT+2m0A7nR
         /78g59qk6Wu2vvaZmsIvFi7/RUAULnbCHmz7UzBJ7IwWk6xY9PvpVDHH2PZxl7PiTQRs
         FU2XoZtaERwxxLPoVkvlNF5yValje/GfgsIes+lzorRrOvkqNa13ou/7TczGoYSENA9+
         J77fGPAYN2mYC94Nf0r3xNeLIXb89FVApF1qW0zr3WbL5f6C5K34P1jy4g8BpodWw/19
         mCIw==
X-Gm-Message-State: AOJu0YzjnhqIVtqQbj5NfQLOzn6WTn4Dkno3YK/p4/5owJOLLhx38opM
	/QdtOwDkz7kloQkKzILsL7yC/srM5MdmD0lve/l4LCGzqP5fV1Ne1bkwCwUYoQzlrmcrX+iReD8
	XVh+j
X-Gm-Gg: ASbGnctLGg4lbTp9P7RSBE0G1RkHQowuRDEBED6PHJ3j/sRtRolCKBColf3fqE6jLa0
	q+xWGRLWyVgArTQ4aVKhYVZbuPk9L5Dmv1jNHzXwWt8D3eoxTpujH4v7trzwZ15KxYHbXMfDw6t
	3JN9GXGA0mQ+f5gt0mhZni05YN6GG1fsYt/yXL35EZS48KpcIxyLkrB9OBlx9eQ6+Zk4o69/NHv
	EtGp664m49ihIXWYAR4ZuHH/j6UHqRvEioA4gYJjlex3oQlM8h5Jzuqb/lN2XHU8SOzQzcn7750
	7//oW6aZVDM5XJCe1YJxNvynP28UpBI6uMUvDlkm5wj3oJlAkzroe+PP7VGjeA==
X-Google-Smtp-Source: AGHT+IGqHP9wyaMp3uwJkuTClRkae6ROCcsTqoUUE6+5eCLIu6eiqb3c0BDe7KQlQ/vmAS8jOcKP8Q==
X-Received: by 2002:a17:902:c948:b0:22f:c91f:d05f with SMTP id d9443c01a7336-231d45c99c7mr354621945ad.46.1747893584297;
        Wed, 21 May 2025 22:59:44 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb0f5sm101672865ad.192.2025.05.21.22.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:59:43 -0700 (PDT)
Message-ID: <4d300cca-3ac2-4072-a35c-0b6aef970b26@daynix.com>
Date: Thu, 22 May 2025 14:59:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] virtio-gpu: fix hang under TCG when unmapping
 blob
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dNJa1nvx4IMu

On 2025/05/22 1:42, Alex Bennée wrote:
> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> 
> This commit fixes an indefinite hang when using VIRTIO GPU blob objects
> under TCG in certain conditions.
> 
> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
> MemoryRegion and attaches it to an offset on a PCI BAR of the
> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmaps
> it.
> 
> Because virglrenderer commands are not thread-safe they are only
> called on the main context and QEMU performs the cleanup in three steps
> to prevent a use-after-free scenario where the guest can access the
> region after it’s unmapped:
> 
> 1. From the main context, the region’s field finish_unmapping is false
>     by default, so it sets a variable cmd_suspended, increases the
>     renderer_blocked variable, deletes the blob subregion, and unparents
>     the blob subregion causing its reference count to decrement.
> 
> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>     recalculated, the free callback of the blob region
>     virtio_gpu_virgl_hostmem_region_free is called which sets the
>     region’s field finish_unmapping to true, allowing the main thread
>     context to finish replying to the command
> 
> 3. From the main context, the command is processed again, but this time
>     finish_unmapping is true, so virgl_renderer_resource_unmap can be
>     called and a response is sent to the guest.
> 
> It happens so that under TCG, if the guest has no timers configured (and
> thus no interrupt will cause the CPU to exit), the RCU thread does not
> have enough time to grab the locks and recalculate the FlatView.
> 
> That’s not a big problem in practice since most guests will assume a
> response will happen later in time and go on to do different things,
> potentially triggering interrupts and allowing the RCU context to run.
> If the guest waits for the unmap command to complete though, it blocks
> indefinitely. Attaching to the QEMU monitor and force quitting the guest
> allows the cleanup to continue.
> 
> There's no reason why the FlatView recalculation can't occur right away
> when we delete the blob subregion, however. It does not, because when we
> create the subregion we set the object as its own parent:
> 
>      memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
> 
> The extra reference is what prevents freeing the memory region object in
> the memory transaction of deleting the subregion.
> 
> This commit changes the owner object to the device, which removes the
> extra owner reference in the memory region and causes the MR to be
> freed right away in the main context.
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>   hw/display/virtio-gpu-virgl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 71a7500de9..8fbe4e70cc 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>       vmr->g = g;
>       mr = g_new0(MemoryRegion, 1);
>   
> -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>       memory_region_add_subregion(&b->hostmem, offset, mr);
>       memory_region_set_enabled(mr, true);
>   

I suggest dropping this patch for now due to the reason I pointed out 
for the first version of this series.
