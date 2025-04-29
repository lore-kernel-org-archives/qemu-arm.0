Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp469509njm;
        Tue, 29 Apr 2025 11:48:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB8dbf1eZorzX5ctrm5IQRSguJj2d1/XDAk0IYFYF34KTXCdBpnF8eFDgyXUe5COjfhyYa
X-Received: by 2002:a05:6a21:1645:b0:1fd:f4df:96ed with SMTP id adf61e73a8af0-20a89419c28mr79162637.26.1745952495475;
        Tue, 29 Apr 2025 11:48:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745952495; cv=pass;
        d=google.com; s=arc-20240605;
        b=W4gMG/6NuuWATcOOmX3m/Abhqljp5dYCPzsllE5ew74DY0MLxAyo6tGMT9sFFSqtcV
         VCTUx+VVqKkBckb/T+qjlOYzjdd5taDiD7u/m5BjSyKLfFpE1sS0onx1D9KvtKgusryw
         jWuQMBbbmdpUcUEv0Vyz3s2++onE2J7T6OxkK1PP7CvdaYczAbkRWfL7/uDuDZ2uzDdO
         Twsv5sohZ83JKoA5BDH6t+bEBdBhBQV1VFYY6cMRspg2Cj2rviYcxxGfio87SM8Y9HdS
         AeEZsyUd/iavO4sh3Q7ZzQKKwO1Fy6+h0hu2u0AQI8HuV/8L91peVmU7Ud+MrNp6pmsv
         Ye4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Yw6K7+P0IhnRvA1OE3yXKPhguHzVqRLq3CxC4f2co/4=;
        fh=IUwE2Y9QQ70EUjRhe9JguzyAtQLMfVwyEwaf1V/Bfbw=;
        b=LITIAHpVdW/EVmMD2fYSmOPu4+GOqD3H+2AswpNDQ+Z6ocXrx/I8zdb50BMPdK+fkA
         axf+BaRzB7PgdLeYFts8GFifHsdDnJvZoNCW2QAKcJrkdg+q5IYpwFZUD8a9KR9VJgG4
         3fkzPQjLL3yK1esZD47qWDWph4grXLsgacd385QVYzkfPAeIzgQm82CUygJVxn2OJv/O
         /o4fGXsJUNC7yovaFWTsvRDSRBTOcE60VOpOdAhrgN4gKUilfMsBc5dKlDMpHCU3ouZk
         5jzqKxaP+LxukScb31wCb22fyCfp775toFO7dDnBHeBB5QJRYLVxznzL66xBIB0Z+lkG
         y3Sg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=JgnKlLZP;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
Return-Path: <dmitry.osipenko@collabora.com>
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com. [136.143.188.112])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b15fb7b33fdsi15614861a12.636.2025.04.29.11.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) client-ip=136.143.188.112;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=JgnKlLZP;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1745952489; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C4MzeXacDBoJxKw9jZwxTqhh/7CNtmZvQ6Gmjr9/B2vLU7+4BzdZO+YWfBSjxLyIFlv09cxRo1kPd+3fa5ON6Md8KzJv2ewsfrcPgad8B/RTeROYXL/LSz3KH2fcPFJvAGBvzmNX+tKE2EEP7ylHcSWxBPwH+DWMbivecK5sAko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745952489; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Yw6K7+P0IhnRvA1OE3yXKPhguHzVqRLq3CxC4f2co/4=; 
	b=QLOCLHVerYQYk//gw4BnNh8ooKHEDeTX9qF4gX6YvX/wNIeXbYT1eHp3H7yXXU4byFLkiGq9k4VrI97g1QzphuLLrEnjQnT0+PygfQ/icq+mpyxIKU5h+uE7R/IU7tPI35DQjaS79xkGA14HW7LDqngvs+GYosTAF5VlXVdYscA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745952489;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Yw6K7+P0IhnRvA1OE3yXKPhguHzVqRLq3CxC4f2co/4=;
	b=JgnKlLZPsU5E5clvfPaFzYtwSqOy9DprGkhMOl6+kOOnN1XRQo+jcaaDKojNtLKM
	2LJ/eQ4anumPWKy4WXCDWt3Znr0BlX1JzBGy+rBmXQRrL6S/IFtnYMaooh6a2xkBd7/
	LPQP2T66a36NbXVGRb+TKjFm1+D1RtKRlXPzKZXc=
Received: by mx.zohomail.com with SMTPS id 1745952487984766.6216250032528;
	Tue, 29 Apr 2025 11:48:07 -0700 (PDT)
Message-ID: <8b123991-21f2-47b5-851d-6b53fbfaa691@collabora.com>
Date: Tue, 29 Apr 2025 21:48:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] virtio-gpu: fix hang under TCG when unmapping blob
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250428125918.449346-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-TUID: gIrei2/BaPyK

On 4/28/25 15:59, Alex BennÃ©e wrote:
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
>    by default, so it sets a variable cmd_suspended, increases the
>    renderer_blocked variable, deletes the blob subregion, and unparents
>    the blob subregion causing its reference count to decrement.
> 
> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>    recalculated, the free callback of the blob region
>    virtio_gpu_virgl_hostmem_region_free is called which sets the
>    region’s field finish_unmapping to true, allowing the main thread
>    context to finish replying to the command
> 
> 3. From the main context, the command is processed again, but this time
>    finish_unmapping is true, so virgl_renderer_resource_unmap can be
>    called and a response is sent to the guest.
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
>     memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
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
>  hw/display/virtio-gpu-virgl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 71a7500de9..8fbe4e70cc 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>      vmr->g = g;
>      mr = g_new0(MemoryRegion, 1);
>  
> -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>      memory_region_add_subregion(&b->hostmem, offset, mr);
>      memory_region_set_enabled(mr, true);
>  

This change makes QEMU to crash.

AFAICT, it effectively reverts code to old bugged version [1] that was
rejected in the past.

+Akihiko Odaki

[1]
https://lore.kernel.org/qemu-devel/20230915111130.24064-10-ray.huang@amd.com/


-- 
Best regards,
Dmitry
