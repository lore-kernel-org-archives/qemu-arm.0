Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp273498njb;
        Thu, 19 Sep 2024 08:34:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvadeGMDUGWouYOzuUC3VhCpXzX7DzfUbkh44ONVXn+E0nadEEzPhjKOD5JRMGlqS4SPeyMGP7QIQYNg==@linaro.org
X-Received: by 2002:a05:6808:2e96:b0:3e0:7d4f:e34d with SMTP id 5614622812f47-3e07d4fe52dmr17090857b6e.3.1726760061739;
        Thu, 19 Sep 2024 08:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726760061; cv=none;
        d=google.com; s=arc-20160816;
        b=RC5Abn+VStJtlDoPW4M28AEmqk4W+b7Cs8Rt+iibASo5iRtPKWP2VsqG9Vztlo00ZL
         oykD/x68A3B8emnuBRHz7B5vLQF6jD5TTHwJ56JGhmWwk8vonLEegzO/gyRcyb4yWGZ9
         yfqfYXEC//kxT5JqH2UK/wsZZywGYnbDu6u5ftyCyUo5bqL5IZu5zor4g29vDxxj39ou
         ttf8/UNMe21LQOCQqzL+Q9q6GQuGLAw6rYp2YTrUUDCDoRfxdvCkHR+pa4RZ+DnsFmuL
         HMh7tdgDAN3eBmAw1D51naMdbq4YVO6CJqTq9IMCrA9gC+/pXTXkE6jm8uKG9jdO1XG7
         yVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=tjDhq7+1RdYCrJ1i4TPTaRAHhdYLbWjdVx3paSErPag=;
        fh=FK3UTVBMZPhmb9P2WflVfBfyq3DSRzUSeRy2jt90olw=;
        b=es/xCFasrFIjjVZAfjcoC3dv5bUq9DjQAn83MuY50kqSIElRmCXZZ5TZvgNgFwlYkH
         4HE/hcs6en9twgcGWDCmY5laBCmfu62mDClPeJY2wJnpzr5Nqrf0woaoguyUY8vtyFXm
         K1f2boOLmwbc8sh+U60Qk45A9/ADNE9Dda565cUfseZ0v5DkMettNUBI67GsKR8Aw3hd
         9EtPW59Tpf7y5xPSvJAaaz9IaBqne116lbP1WmrYnOY+Hp8KZb167nTXLjUp3tbeb55z
         e+M4SU9+thf6qon6vLQrRogoTEZDlFXavXZnco+1wf3dKb2hY9kXz6HM4elCWi+sY2S4
         eILQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kC96LKyl;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e170658f4bsor1834882b6e.1.2024.09.19.08.34.21
        (Google Transport Security);
        Thu, 19 Sep 2024 08:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kC96LKyl;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726760061; x=1727364861; darn=linaro.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjDhq7+1RdYCrJ1i4TPTaRAHhdYLbWjdVx3paSErPag=;
        b=kC96LKylKkrJ+e1zpGw+Mw0PND032MHE3qSmrLz7O9vaSM9eLsPNz9pkt7MyNDUxjc
         ILTK51uCxhkFAj4JhfQw2AAvapUFKRjEznK5+1jw4xOMT/Y4+BdgwcZC3j3YJZ6HabGa
         Xo5XLTS3srQVlHJA2Xpsglar8LFRG7EbY4Bk4ZdAN0jhpACOqKE/M1OrpjnyGkLI2Voc
         y+PYlKl/Eq1xBLeygAewXCJayOjr5IAwAu1tVI53ZChB/JGdJQpeWWqjkpuiWpOkrGKo
         iqdMo5LCoDUvEsMQRlPENQr1hEqsFTfHi14POPU81ldj8LIK/pm5IxmrqI2mY8I1iGMh
         0T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726760061; x=1727364861;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjDhq7+1RdYCrJ1i4TPTaRAHhdYLbWjdVx3paSErPag=;
        b=i5rfq5hnRj7Q6sLKXfxuIb6ekuTyCjBpo8XHVRGVOEab3IP+sAl5RwVyHAo58uH+1K
         SFLo0oeKtE2JkOIbHMfFBZ1wi4kCfMLcxuDitKA3i6iaLMuFoA5zh3VXmk/sRKPq0IaO
         IXwDSBfvyuKkj0jFWERxO0ZnvdfIzsvLZNSf4/k0gPq9Vi2C/ye0HlblTHn84FWR1XXq
         75kIaVruf8o/NT6cr+Uc68owOQjbLOBw/lG0kWcadzUHD7mySXZYuFeaZMDTpv6ofZRV
         TeUG71kFoEclU+AJyH1ETIyf6xP3o1GRTzFbn2nxiFBpZMUUPREwxTVbnXGliokHTOaZ
         jVbA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Xvkv8piOdH1z6RtUgYcxMEjyXacjo90x8DkSdKUyHBYadjPmos+RbHot+ZT/UkAq/GCy2JdlFQSKa9wZG0a7Rq4=@linaro.org, AJvYcCVPLZGeXlhVREy3pE8jRSTIDDwmKiQLGf70TyG6/S2raPdGtICVPpg6mZMhCGOSKyBMxVjc78WgR09EyQ==@linaro.org, AJvYcCXkOZiC9ho+VrDaTfRfMPSimHkgcFzeyMpRkZav5bf2rUBboYNsCJdLRpmT49ikV3tIXjwvK4ekCobx0F1faw==@linaro.org
X-Gm-Message-State: AOJu0YxH/v06VeS78SXLDphvc7mkSEU8USXwy5rXY6bsfK4BUnHQJs8S
	tnFpZ+o39ogeMfX7gKyQPjeWabCv/8Ecq59Nv/bwToOA1+MoyTQS
X-Google-Smtp-Source: AGHT+IGkPtGASlsN1mWnU/lPiOwMx8LXKTp+l3V1wEIIDvN6gyZZ5xYjRG3djb2ALL6FjuDV5gqYKg==
X-Received: by 2002:a05:6808:211d:b0:3e0:451b:d029 with SMTP id 5614622812f47-3e07a107173mr14248840b6e.15.1726760061048;
        Thu, 19 Sep 2024 08:34:21 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84939994e8dsm1436459241.27.2024.09.19.08.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 08:34:19 -0700 (PDT)
Date: Thu, 19 Sep 2024 17:34:17 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
Message-ID: <ZuxEedSaR4fLKvrn@zapote>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
 <20240916150853.1216703-3-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2409161646360.1417852@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2409161646360.1417852@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-TUID: AZ0mKOTRkWis

On Mon, Sep 16, 2024 at 04:47:43PM -0700, Stefano Stabellini wrote:
> On Mon, 16 Sep 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add a way to enable/disable buffered IOREQs for PVH machines
> > and disable them for ARM. ARM does not support buffered
> > IOREQ's nor the legacy way to map IOREQ info pages.
> > 
> > See the following for more details:
> > https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2fbd7e609e1803ac5e5c26e22aa8e4b5a6cddbb1
> > https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=2e829d2e7f3760401b96fa7c930e2015fb1cf463;hb=HEAD#l138
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/arm/xen-pvh.c                | 3 +++
> >  hw/i386/xen/xen-pvh.c           | 3 +++
> >  hw/xen/xen-pvh-common.c         | 2 +-
> >  include/hw/xen/xen-pvh-common.h | 3 +++
> >  4 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> > index 04cb9855af..28af3910ea 100644
> > --- a/hw/arm/xen-pvh.c
> > +++ b/hw/arm/xen-pvh.c
> > @@ -66,6 +66,9 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> >       */
> >      mc->max_cpus = GUEST_MAX_VCPUS;
> >  
> > +    /* Xen/ARM does not use buffered IOREQs.  */
> > +    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
> > +
> >      /* List of supported features known to work on PVH ARM.  */
> >      xpc->has_tpm = true;
> >      xpc->has_virtio_mmio = true;
> > diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
> > index 45645667e9..f1f02d3311 100644
> > --- a/hw/i386/xen/xen-pvh.c
> > +++ b/hw/i386/xen/xen-pvh.c
> > @@ -89,6 +89,9 @@ static void xen_pvh_machine_class_init(ObjectClass *oc, void *data)
> >      /* We have an implementation specific init to create CPU objects.  */
> >      xpc->init = xen_pvh_init;
> >  
> > +    /* Enable buffered IOREQs.  */
> > +    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_ATOMIC;
> > +
> >      /*
> >       * PCI INTX routing.
> >       *
> > diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> > index 08641fdcec..76a9b2b945 100644
> > --- a/hw/xen/xen-pvh-common.c
> > +++ b/hw/xen/xen-pvh-common.c
> > @@ -195,7 +195,7 @@ static void xen_pvh_init(MachineState *ms)
> >  
> >      xen_pvh_init_ram(s, sysmem);
> >      xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
> > -                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> > +                       xpc->handle_bufioreq,
> >                         &xen_memory_listener);
> >  
> >      if (s->cfg.virtio_mmio_num) {
> > diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
> > index bc09eea936..62c44a1ce7 100644
> > --- a/include/hw/xen/xen-pvh-common.h
> > +++ b/include/hw/xen/xen-pvh-common.h
> > @@ -43,6 +43,9 @@ struct XenPVHMachineClass {
> >       */
> >      int (*set_pci_link_route)(uint8_t line, uint8_t irq);
> >  
> > +    /* Allow implementations to optionally enable buffered ioreqs.  */
> > +    int handle_bufioreq;
> 
> Looking at the corresponding Xen interface this field is uint8_t. I
> think it would be better to use the same type here and also as a
> parameter to xen_register_ioreq in QEMU
>

Thanks Stefano,

I chose int because the interface to the Xen libs uses int:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/include/xendevicemodel.h;h=797e0c6b2961926a68cd96b8ff5e1627067903ac;hb=HEAD#l40

But yes, the hypercall interface uses uint8_t, I'm happy to change it to
uint8_t in the next version!

Cheers,
Edgar
