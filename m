Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp293588njf;
        Tue, 13 Aug 2024 15:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOUkaHrAsba1AlXH/hE4BE6FS+382swQS9aJ6rqFylaMdjMb5pidzeDR8cGwyRxsER0LnOwfKm3TkWiF1UjRQzMO2jRRBc
X-Google-Smtp-Source: AGHT+IHLcwRcc5bYR4hcN70L4SxQoZ/UqjBFobfLWFWq5crCJl/99GrXqfb4XPxlEE2a5Z4qdGTS
X-Received: by 2002:a05:6870:b61d:b0:25d:ff4c:6772 with SMTP id 586e51a60fabf-26fe59d8065mr1312662fac.3.1723589556114;
        Tue, 13 Aug 2024 15:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723589556; cv=none;
        d=google.com; s=arc-20160816;
        b=FkxeuBQBRVQ2GUvwfCE5WvyTKvcSFrlblTZyOXqW2xOjYCT+sqPKSRi5B9Qyit3j/P
         HACUjtb9qSNvPkx+Ws1eHLXouHosIoeE/a933vnAiSoYKTJtnkCpBWLMKtMMeaZtNlMh
         xJyXovWm+G/6gegvZlHf8R9+PTpco3cgUyI0Vp9fme3IXrKSCJe3qxVIa6qqVNek6onD
         hbnZnuwF1t+XQLzyHLP6h+6IhkhTO76Ym1sKdKAhTXum02tpvTgjo6yA112mHVs3tFZe
         9J+P0sbTgoy3AeuLg11BHStV/+NoGhvjGrETmeY159By3gUYsKjgd8DGNW4A8qFvPzhD
         QuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=QvxWMF+Z1QbP536s1z6xjOwxH3nyJnx6us528tu5cqA=;
        fh=TsqJ2ihdmRfiqACwE6iojRxLBze2YrSxFiivhbjdNuE=;
        b=b6MhagGJ4FVoV13Yw8j5x9SmkQ/aU3YcNG4UQqzNX5H5SCBFDx7RZvYxyvWKes04fr
         ZYLOtN7Y6x9gofE8IhZYXq//GHaBwkwf5pLO0iC8GOg5dq4/YYfJYA9MEyj1dscoYp6M
         pGTn69lK2c84bdoGrrOWxfwzWnrYQWeC0u7rLB+ZPwjiG3bsRZeZ1wygBCYbnhCbvZaX
         T/OezuoD12X11FWWeOGprxPqbMsEC4JWdulva4YyX9Kg1f+IVMwj+OrO7++7LU5fJ+j2
         6V7/BtK+T8DcV4lKk79gFxNOnCKMWYKs9o0TYA40krHsf2KaU1A1SMLYUgsMFV/7/IyI
         i4AA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=B8dh8xal;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 46e09a7af769-70c7b880289si3794581a34.201.2024.08.13.15.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 15:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=B8dh8xal;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4AFB61903;
	Tue, 13 Aug 2024 22:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19E9C32782;
	Tue, 13 Aug 2024 22:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723589555;
	bh=/9E0bV+7de54mixbbQS3JvL8Qj9PklPehoTxAy+Sxcs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B8dh8xal5x36LJnouHDGBoZOprSPE9UDE4eH0Q/ZwWwldb5GrwYDoTu3tOERwkW+Z
	 zald+nejF3aLYlmCP16dQnesfsPyW4n7lDlpBSNRwEK0QAoltX1DZKJUJGeM+/EfDQ
	 1yR9keeLxcHP6j+DHnJpN3JxuuT9o0tx4qgEnrGZ9ywn7X+w7SvT6dT3CcQYqGni/a
	 a69w5E7GxY600EBu0uRdpwZMungKU3eOAfu9iIqnSj9A5cMM+XCDeQZ+i6875UpKkZ
	 UkNPVmVjO5hAlOjmqnco2uKDtyYYxwdVBGbHhL2Ur2kwM+JP83XC0JC2jWkmncBK5H
	 hTgdDZva1rHfg==
Date: Tue, 13 Aug 2024 15:52:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
    anthony@xenproject.org, paul@xen.org, peter.maydell@linaro.org, 
    alex.bennee@linaro.org, xenia.ragiadakou@amd.com, jason.andryuk@amd.com, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    qemu-arm@nongnu.org
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
In-Reply-To: <ZruRm34zIMtUm7oH@zapote>
Message-ID: <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-5-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop> <ZruRm34zIMtUm7oH@zapote>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: dYbplU6hWhhW

On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:
> On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
> > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > 
> > > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> > > servers to handle hotplug.
> > > 
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > ---
> > >  hw/arm/xen_arm.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > > index 5f75cc3779..ef8315969c 100644
> > > --- a/hw/arm/xen_arm.c
> > > +++ b/hw/arm/xen_arm.c
> > > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
> > >  
> > >      xen_init_ram(machine);
> > >  
> > > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> > > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
> > >  
> > >      xen_create_virtio_mmio_devices(xam);
> > >  
> > > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> > >      MachineClass *mc = MACHINE_CLASS(oc);
> > >      mc->desc = "Xen PVH ARM machine";
> > >      mc->init = xen_arm_init;
> > > -    mc->max_cpus = 1;
> > > +    /* MAX number of vcpus supported by Xen.  */
> > > +    mc->max_cpus = GUEST_MAX_VCPUS;
> > 
> > Will this cause allocations of data structures with 128 elements?
> > Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
> > possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
> 
> Yes, in theory there's probably overhead with this but as you correctly
> noted below, a PVH aware xl will set the max_cpus option to a lower value.
> 
> With a non-pvh aware xl, I was a little worried about the overhead
> but I couldn't see any visible slow-down on ARM neither in boot or in network
> performance (I didn't run very sophisticated benchmarks).
 
What do you mean by "non-pvh aware xl"? All useful versions of xl
support pvh?

> > later on with the precise vCPU value which should be provided to QEMU
> > via the -smp command line option
> > (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
> 
> Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
> values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
> will set maxvcpus to the same value as vcpus.

OK good. In that case if this is just an initial value meant to be
overwritten, I think it is best to keep it as 1.
