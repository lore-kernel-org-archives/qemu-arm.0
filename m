Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp446360njf;
        Wed, 14 Aug 2024 04:49:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvAraLmvff/9HAsw94DCcja6Oa71HTR2clF6xSQr0o5OR7nmD9gIRkpSo+hcYJ0icOkfwbrGXxQiBKkg==@linaro.org
X-Received: by 2002:ac2:4c45:0:b0:530:dfab:9315 with SMTP id 2adb3069b0e04-532eda67385mr1987585e87.10.1723636163255;
        Wed, 14 Aug 2024 04:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723636163; cv=none;
        d=google.com; s=arc-20160816;
        b=ViA5WDTvLIvKhuuNjfFcLrmZGywFtaJ82iObmlLfJX27Doq21yWPqOQvmeR31yl7uB
         lydAqdmP/T0wk+AVvRVnq8xddTIWb3K285ijoIL/iX3Q9sK85QKPgjO2oR/LnaqGXhE9
         i0XePAdNhmB3/S0uw4P7Mgvs0CZc3+Pmtak7n6n1TPhKhvy1Ru9/jCIlKEaE3gvAf2YX
         sicjEinpxtZP6EPxhV8d/rS0JDMrULWrA09wd2Ebh18CrVhVrASWvt4BXSJF4W+y1cW5
         HRTeBMElr/5n/HgDwKDI5ZweN+ii9af4jlc6MNY93JVNW39WGspnECWIeC0UEVWLAmP6
         E45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=dp0L+GamiTI78LaNXUI0L+8bA2ZqatuVzlZrQCRiNiI=;
        fh=MfVV9HC/rRFF14DXoEP4ui+pQIH1PmtPrEEvy0/t26w=;
        b=UbJAXaoHaU1uTL4RmUcwUcEvua8cTto4e7pGgeL03d1PeFcle4eSPrx5bnEETP3U1m
         bipYluhKmLOexB6cbQxCzW67ZTYPAZLj74axeZLvEL9V2h985qic0n3gFcbg98F8C5cJ
         IImaD/fnVJm2NV0ZAJEZl0JiarNsvxat89csVMxDNLomYJqSDc7KlODYBlfjzj4tRPq7
         cHD2y7DmLbG1rhnA4lWHRqNtBQ+bZ1qa99MpJD4OLCYENlwaw1LWEBNoT3RxWVb/6jCS
         VtAtSMV29P8cm4SP1tAlnPA/HidsEG7wllq1v73zQfAwPFaUmrMKXX6QXFczqUn1GPLE
         uH9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1VQMcMN;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53200eb3be6sor3418392e87.1.2024.08.14.04.49.23
        (Google Transport Security);
        Wed, 14 Aug 2024 04:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1VQMcMN;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723636163; x=1724240963; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dp0L+GamiTI78LaNXUI0L+8bA2ZqatuVzlZrQCRiNiI=;
        b=b1VQMcMN/3wddBk+1Swh7A+as1dmoDvl/G2A4Afoc9b40pPBVL8kvV2l16bjzUEvZA
         8JMky+ifsK72pjECaxjP14c4E0W0D8y+rxsJsd2sPVPVokRKiO/c+U8nvVhDDWbyVA3x
         H0qLyyPpciOCLlkm0YICoButSkDgRLXqcWhV/QlTJrKQ5R9qJEocjk222bh4+iKBBDrV
         KE2m5X81xHUHRIGmJR1k1uBGrrp6XLzJvsmH3saXtLovEs6Fw1wcGYe+he2Mcmj1oGuV
         AK4lppak6RE0jjZOjFXL1o6Av2Sv7DcQ8oUWl1Kb6JTFYTlFRHFVG62QQk8X4TgqGq0H
         V8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636163; x=1724240963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp0L+GamiTI78LaNXUI0L+8bA2ZqatuVzlZrQCRiNiI=;
        b=b/IWSis7zF/KjkMsGI2PYur25ssdNkOKuyWi6qKdVJbz1Vb3dxydi6OKH4ZVMio9rE
         OccAVGGm2s373w2bn7p+FbaLJJZMW7cRmYS6LTbMH9CH+1oRzCaEkfAaVJZRyIjXYzVU
         ONL07Illfa1jgOwk0k88dJyFtQMqfCrWqch5UVhVk1EKVQ7Qozy1/KjnBvJI/DHUP8Zt
         a9RXDZsotqzJKDU8Q8zif5uq6a0qs7IFYztOtEY+BrNZ2e5QOkI4VSdNOE7mlL8C+Uuf
         bKvZCNFPcVzdh/IBoFx41D3p8l8BflZCYaa3O3X/gwF/0tKoMqX3u4LRrOPzIRcnjg8I
         4E7g==
X-Forwarded-Encrypted: i=1; AJvYcCWWpU3i39HVlBtML9WUwWQavh0Zmkj2Yd8HX9P7M0eGKWhMTn93fmlZlUEOENJqYwDf/GDXuAKEEHD51g==@linaro.org, AJvYcCXXOzViAjg+TxiEzfMZ5/LNXa9+YSUErh7i0bLng8HCspvGCj42lEnXUF4gDqjVAQWttQ05bJRjOg/VjlP7eA==@linaro.org
X-Gm-Message-State: AOJu0YzQKsAMIaRhR0dS8dbvot8iWZKYuIDoU2AKK/P2Oxx+e1CjKilm
	MREQTL9Fl8WSQTR5hGmm8+x/rbBo/EzVtNqET+4kpbFpXB+LLkn8
X-Google-Smtp-Source: AGHT+IFMKxXSID3krkFoZ71TRri2uuaWjn55H1yF6EWyj543s/obDY84Jsw9e73Y36BCyYIts5LDiQ==
X-Received: by 2002:a05:651c:1079:b0:2ef:26f2:d3ec with SMTP id 38308e7fff4ca-2f3aa1df0e5mr17466981fa.12.1723636161891;
        Wed, 14 Aug 2024 04:49:21 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f291ddbaedsm14068641fa.18.2024.08.14.04.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:49:21 -0700 (PDT)
Date: Wed, 14 Aug 2024 13:49:20 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com, jason.andryuk@amd.com,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
Message-ID: <ZryZwOoadeb1UWK8@zapote>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-5-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
 <ZruRm34zIMtUm7oH@zapote>
 <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
X-TUID: UQR7LV32CJHJ

On Tue, Aug 13, 2024 at 03:52:32PM -0700, Stefano Stabellini wrote:
> On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:
> > On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
> > > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > > 
> > > > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> > > > servers to handle hotplug.
> > > > 
> > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > ---
> > > >  hw/arm/xen_arm.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > > > index 5f75cc3779..ef8315969c 100644
> > > > --- a/hw/arm/xen_arm.c
> > > > +++ b/hw/arm/xen_arm.c
> > > > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
> > > >  
> > > >      xen_init_ram(machine);
> > > >  
> > > > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> > > > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
> > > >  
> > > >      xen_create_virtio_mmio_devices(xam);
> > > >  
> > > > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> > > >      MachineClass *mc = MACHINE_CLASS(oc);
> > > >      mc->desc = "Xen PVH ARM machine";
> > > >      mc->init = xen_arm_init;
> > > > -    mc->max_cpus = 1;
> > > > +    /* MAX number of vcpus supported by Xen.  */
> > > > +    mc->max_cpus = GUEST_MAX_VCPUS;
> > > 
> > > Will this cause allocations of data structures with 128 elements?
> > > Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
> > > possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
> > 
> > Yes, in theory there's probably overhead with this but as you correctly
> > noted below, a PVH aware xl will set the max_cpus option to a lower value.
> > 
> > With a non-pvh aware xl, I was a little worried about the overhead
> > but I couldn't see any visible slow-down on ARM neither in boot or in network
> > performance (I didn't run very sophisticated benchmarks).
>  
> What do you mean by "non-pvh aware xl"? All useful versions of xl
> support pvh?


I mean an xl without our PVH patches merged.
xl in upstream doesn't know much about PVH yet.
Even for ARM, we're still carrying significant patches in our tree.


> > > later on with the precise vCPU value which should be provided to QEMU
> > > via the -smp command line option
> > > (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
> > 
> > Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
> > values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
> > will set maxvcpus to the same value as vcpus.
> 
> OK good. In that case if this is just an initial value meant to be
> overwritten, I think it is best to keep it as 1.

Sorry but that won't work. I think the confusion here may be that
it's easy to mix up mc->max_cpus and machine->smp.max_cpus, these are
not the same. They have different purposes.

I'll try to clarify the 3 values in play.

machine-smp.cpus:
Number of guest vcpus active at boot.
Passed to QEMU via the -smp command-line option.
We don't use this value in QEMU's ARM PVH machines.

machine->smp.max_cpus:
Max number of vcpus that the guest can use (equal or larger than machine-smp.cpus).
Will be set by xl via the "-smp X,maxcpus=Y" command-line option to QEMU.
Taken from maxvcpus from xl.cfg, same as XEN_DMOP_nr_vcpus.
This is what we use for xen_register_ioreq().

mc->max_cpus:
Absolute MAX in QEMU used to cap the -smp command-line options.
If xl tries to set -smp (machine->smp.max_cpus) larger than this, QEMU will bail out.
Used to setup xen_register_ioreq() ONLY if -smp maxcpus was NOT set (i.e by a non PVH aware xl).
Cannot be 1 because that would limit QEMU to MAX 1 vcpu.

I guess we could set mc->max_cpus to what XEN_DMOP_nr_vcpus returns but I'll
have to check if we can even issue that hypercall this early in QEMU since
mc->max_cpus is setup before we even parse the machine options. We may
not yet know what domid we're attaching to yet.

Cheers,
Edgar
