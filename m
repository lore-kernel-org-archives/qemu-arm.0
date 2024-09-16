Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1364763njl;
        Mon, 16 Sep 2024 16:47:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6RIUzBAPZ5p47EIwcrUsxsIUnglfmYism5aYJowffAzaK1vt8zCxnqdx88hNRx2TMaMWGcBgmmxZs5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH1CW+auWh7eV4Vr8hZPhdyOpgkQFFDRmjJ7wwSQZvJXOX8SPwYn74y4f8ErL0K689qqamw
X-Received: by 2002:a05:622a:30a:b0:44f:f14c:6a63 with SMTP id d75a77b69052e-458602bb66emr248020261cf.11.1726530468436;
        Mon, 16 Sep 2024 16:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726530468; cv=none;
        d=google.com; s=arc-20240605;
        b=dehaYeyNI2XxmcKeVbZNQdpxFRpgTKOC7BVkkZV8lMqcxeE112K+Q3k395b3FG7rvg
         P5k+VoaNdov3PWz32dobUFqjRYLzBzsB4CDIByAW87iPTlySfsKr36poOO9p+Gk3lEfV
         dJGhp/qRH1K13mEIfcv6lSby0s1bk05ru43dawucLTwKqKK0edoRegAtcG9g06Jrv1Pj
         n2isynguMRjhxaLqHR/j1Anv1Nbkk3KJSiwXn4dVRBPBjCRfdwKoZeaByelh5qB+v8yo
         0JWxW8zVoZKzjexvvUp1iwclzLDB0g2h3l8GOmTjQ2UenDe8nWBRAm5UnKV0hqSyoV9j
         5HpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=jqbGddgHlC2qvUIpO8AAXBLOSmr3fXhqo3x1KhGak5M=;
        fh=6E91H1f/HSjXN6NOCLTCAemHbKcR0A7HGKnjSWzqycA=;
        b=Bhb4X7mHKozhQZ4UAKqLHKRVtBL6kV5yGAr//Z6ZVZRih2H7bjttW86q1FpnGTBvaf
         T8M+ko9j9d1OXkYZ8krMTR+HpxvV9jNsApXVEojS3g6M5pQFgZqAdeKj7WG3H+xdPiXI
         Ol4pfoutCcb/fNdfzfix2yEX59DpyacpP52FRcA2FJ35GGv9lCX+mcQVJgKHGcBUeNg7
         dpFE1QSZL5a4PD4DPM7tywVd82bF/L9t0SQQpcIOvVqj2Mj/9fgiYqn2zDIbthOjL7yr
         isFsnFhLu6AKK+Ll1JoIhAXHZOfVhlG9p2LknLLO9ASEJ/8Irfuc22H2fxwN1pL4YRtE
         H0Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=PuhnKKNA;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from nyc.source.kernel.org (nyc.source.kernel.org. [2604:1380:45d1:ec00::3])
        by mx.google.com with ESMTPS id d75a77b69052e-459aaf339d8si73793651cf.583.2024.09.16.16.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 16:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) client-ip=2604:1380:45d1:ec00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=PuhnKKNA;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16077A426A2;
	Mon, 16 Sep 2024 23:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F43C4CEC4;
	Mon, 16 Sep 2024 23:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726530467;
	bh=bDRJfxN59zHNn0MVplLYT1m2IcfF93b7RFm9gAS5NN4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PuhnKKNAfIBJl2P4TpBcw9uwEmh1ElcVRDqk9YM7l429KrapyGQWAH9YBWNER1fRA
	 +11q1wmJ8lO+d28O6ReJxwgwPheCv6zp1ZHbv7W1UzCUg05gyVff/bYxGXr3XpRTym
	 FOJDvPI6zqz5jck6lz7zOhk0ITNvwEnRxbicoKYwWolhC4APVlfuu7zjMZZ0Da3u6e
	 snt0iey/e6diAsSS9LP2g7in5Dz7Ml7kDe1FqBOl2QjQ23RvWQgkqTtP5HFpo5AvKm
	 fprIowIYfLUY4+Q31Z0vtBR54+hfJJEsdyx9BE2Lo4kf6GYG5aUUucmJ1Wrx6zztB3
	 uKMxKDKitPvDg==
Date: Mon, 16 Sep 2024 16:47:43 -0700 (PDT)
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
Subject: Re: [PATCH v1 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
In-Reply-To: <20240916150853.1216703-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409161646360.1417852@ubuntu-linux-20-04-desktop>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com> <20240916150853.1216703-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: KL3InQ/DynuV

On Mon, 16 Sep 2024, Edgar E. Iglesias wrote:
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
> index bc09eea936..62c44a1ce7 100644
> --- a/include/hw/xen/xen-pvh-common.h
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -43,6 +43,9 @@ struct XenPVHMachineClass {
>       */
>      int (*set_pci_link_route)(uint8_t line, uint8_t irq);
>  
> +    /* Allow implementations to optionally enable buffered ioreqs.  */
> +    int handle_bufioreq;

Looking at the corresponding Xen interface this field is uint8_t. I
think it would be better to use the same type here and also as a
parameter to xen_register_ioreq in QEMU



>      /*
>       * Each implementation can optionally enable features that it
>       * supports and are known to work.
> -- 
> 2.43.0
> 
