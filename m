Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp3120953njb;
        Tue, 24 Sep 2024 15:52:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWm2k9OMYLPlgcmfj8om/0F2TosweR5A1X2P02EAUHQBwm9o4ep/xLJa1qZyc+ffFEoHr3iawDXwtzE3A==@linaro.org
X-Google-Smtp-Source: AGHT+IE9c7uXyBoceCMJk9+nKQdUGs8WbFmcwGqLQLbGn/BhONzUTbobobaCxLErhUsNO7xhkojQ
X-Received: by 2002:a05:6214:5548:b0:6c5:1a21:b8b9 with SMTP id 6a1803df08f44-6cb1dd3fd26mr12055786d6.13.1727218341449;
        Tue, 24 Sep 2024 15:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727218341; cv=none;
        d=google.com; s=arc-20240605;
        b=emZE9tFkfqoiakX+vDAVJfo6X63K3g5KyLqJs/rZdkEl2NDSdeff/NRF/aH8rshvYE
         5pc3rz2ickoFJu3SnoKwqD1bPuE51OgOqOudlSvIedXZFzZ38OLKzr8sR9VSHd48+qFP
         Gj46kQ1J1moFfkG7aBVHDfWWq0XWzZyuNq6rYNAY86JRWIHHh/O8hnQmMyYEevtd5oX7
         DJ04WVAKuInpacmGehVvMrWP0yl3HHsRqLFWllfVJTCkuuh03sSJ7VQnVmxoTJsr2+80
         OBe1i/zQAauDqJKe7Qv03ePL2R1hNSaUt4Jj4o4y60hNBy1gbWVi7Mg9U7oE121XSgAM
         8PPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=uRszaI3J1Uh6xYRGVoJ/FJWz6dA3DEx0XMjQMPWXlA8=;
        fh=6E91H1f/HSjXN6NOCLTCAemHbKcR0A7HGKnjSWzqycA=;
        b=fZpYAwlfg54ikhqHNO7ZeVPYNuEgbQyueNs3/I+cjmEyhbHH5SC7AyNH8snbdMvlu+
         ssj7/2BP2TNMlYYQka637CtfM2rsFYpUhBSCMxnSSsjAy4QtYOr80JzWRU+vZZaR6Ex6
         r9ZYdtz+jgPXA3ERdWHP4n+fO9YOpaw6DLTuPF4u/z1uP6JV07B865CWmq3dQ0bQhC/d
         3GoIjeB41/7NPJmTEUFdPLxmR9TOYplhJwLYl8Gk4otD4W8gB3wuJkAnv47gsQ1SCOGY
         tuC+lzoRRGGkcwojCRF6R0Za0MABw/3eEHYRsCQhFFZOG5JXE4tNPDsZKzXut6g8j1rZ
         Wkjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=G3UVntH7;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from nyc.source.kernel.org (nyc.source.kernel.org. [147.75.193.91])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb0f7d9b3asi26383346d6.588.2024.09.24.15.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 15:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 147.75.193.91 as permitted sender) client-ip=147.75.193.91;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=G3UVntH7;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8B51A436CB;
	Tue, 24 Sep 2024 22:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5956C4CEC4;
	Tue, 24 Sep 2024 22:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727218340;
	bh=xQpOvywgOWN6qJxEerQMGxk4joNwzFDiRM0Ga93qiVk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G3UVntH7Rgdg6YtAsss+/ZpocJDYDDP8IdxeAkQeNKerGwggQDASv7CP6q5iMBpLp
	 oTIYQ5YKmMQVAD8/81V/K551BBYIZBi2axQDo6kcVVBuUiOnKpD9AoG99gRObEooQ5
	 wg5jyDOWB/3BnbVlaAAWZqC5F0o7j/F0FleQouvGaJp1HYdpJ0CDJV/601t3SH+9ed
	 OFOY6jcn0bklrUK8lp9HHMTIbtUrc0yV6M1BXVZKpKNJ+LXzS4WEof1eBNnNOLKEoG
	 yQ+3x4HZDmFhxz3ubr6wrTycPj2meqsjpWGX1K9NWrf5jFUPpFev/YGmfg1IeUyyc9
	 DMl6qOzxzLkmw==
Date: Tue, 24 Sep 2024 15:52:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
In-Reply-To: <20240923145520.1323504-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409241552100.1417852@ubuntu-linux-20-04-desktop>
References: <20240923145520.1323504-1-edgar.iglesias@gmail.com> <20240923145520.1323504-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: eDZCh2hiHE0F

On Mon, 23 Sep 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a way to enable/disable buffered IOREQs for PVH machines
> and disable them for ARM. ARM does not support buffered
> IOREQ's nor the legacy way to map IOREQ info pages.
> 
> See the following for more details:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2fbd7e609e1803ac5e5c26e22aa8e4b5a6cddbb1
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=2e829d2e7f3760401b96fa7c930e2015fb1cf463;hb=HEAD#l138
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen-pvh.c                | 3 +++
>  hw/i386/xen/xen-pvh.c           | 3 +++
>  hw/xen/xen-pvh-common.c         | 2 +-
>  include/hw/xen/xen-pvh-common.h | 3 +++
>  4 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 04cb9855af..28af3910ea 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -66,6 +66,9 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>       */
>      mc->max_cpus = GUEST_MAX_VCPUS;
>  
> +    /* Xen/ARM does not use buffered IOREQs.  */
> +    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
> +
>      /* List of supported features known to work on PVH ARM.  */
>      xpc->has_tpm = true;
>      xpc->has_virtio_mmio = true;
> diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
> index 45645667e9..f1f02d3311 100644
> --- a/hw/i386/xen/xen-pvh.c
> +++ b/hw/i386/xen/xen-pvh.c
> @@ -89,6 +89,9 @@ static void xen_pvh_machine_class_init(ObjectClass *oc, void *data)
>      /* We have an implementation specific init to create CPU objects.  */
>      xpc->init = xen_pvh_init;
>  
> +    /* Enable buffered IOREQs.  */
> +    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_ATOMIC;
> +
>      /*
>       * PCI INTX routing.
>       *
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index 08641fdcec..76a9b2b945 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -195,7 +195,7 @@ static void xen_pvh_init(MachineState *ms)
>  
>      xen_pvh_init_ram(s, sysmem);
>      xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
> -                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> +                       xpc->handle_bufioreq,
>                         &xen_memory_listener);
>  
>      if (s->cfg.virtio_mmio_num) {
> diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
> index bc09eea936..5cdd23c2f4 100644
> --- a/include/hw/xen/xen-pvh-common.h
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -43,6 +43,9 @@ struct XenPVHMachineClass {
>       */
>      int (*set_pci_link_route)(uint8_t line, uint8_t irq);
>  
> +    /* Allow implementations to optionally enable buffered ioreqs.  */
> +    uint8_t handle_bufioreq;
> +
>      /*
>       * Each implementation can optionally enable features that it
>       * supports and are known to work.
> -- 
> 2.43.0
> 
