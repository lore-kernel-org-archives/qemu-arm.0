Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp202160njf;
        Tue, 13 Aug 2024 10:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6BeY+EyFfH9N3l3GesB3pia1ZUpDkM6gNbmGrnVMzGHzna+L0LSjtu8Wot9kahqw4CFfyVdVf6CiGNWLMVuemXA6lFFws
X-Received: by 2002:a05:651c:516:b0:2ef:24e8:fd83 with SMTP id 38308e7fff4ca-2f3aa1f9630mr127461fa.38.1723568542617;
        Tue, 13 Aug 2024 10:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723568542; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8Vl3sCLOdAUYLYUfXDsjk8hDV1/Ou3MQmbxic1koYkEZrOUq3luXYmD9/2Sty4xw/
         QEWZU/GKH+vaPnJdUl5lgQ+KdvfLYqLnYYVoGJk2ieR2F9lOnYiRrccb9r2/ii+nBjPc
         jB7d53PVarSRlPJnvkWbfoobmOiZgBZQBPpH9DR2hmLqaVcKBbCxmEqLS8Uv+/UnkcsZ
         4A+cQEV5c+whAxg9583t7mNDOVczU0wCWxwWg8U2+tGep6WQm5wpIMDKkiY6i1PPvkuX
         MT8/OW5T8c/JhWjP5/WeNcDGJ2PwgQeptWKMGyuh7uYbDh2KZRNLmYhkvYpfuP9xAM+X
         aQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=JGJpkmzwhAHPEBfWQMTLg/zF6IPgm68M3yUmp2d77TM=;
        fh=hKFy/FuE9M/JvNjDdzNwZQGSxiNSJU/O8hYopUmkgEQ=;
        b=uJJlDbN9h62p4z9pK84dS8rLjQSIETARg3PcinbOLsWqT2UXZ0hRdPL3dyCdUAkdpo
         8dT5NRCNx+10VHkgkZ6dJ3DP4spHSKv5z7qVJOfHkimcQKsQptXrnMvdM9jJjxvjux5/
         OmcxdwbE2qJJkt+IJUys7Fdh1BGWPe43O9N86sWRg+cOrjzhrSN3I/9olX31yPs/VWSC
         QRVQc9GYuk1tBYiYUiw3NKRScE6DCb086NwhGddTDkHaTKwsBbWN7z0bpVLGHJ7ipMfS
         hlYPQF/sYndPStHs7Gcpq+DToWdw3InwyiozYG8thKpyjWbwi4qXYYFQ+RU6GyVCZF3h
         AYPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqyqIPoF;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f291c5f6e0sor15684471fa.0.2024.08.13.10.02.22
        (Google Transport Security);
        Tue, 13 Aug 2024 10:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqyqIPoF;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723568542; x=1724173342; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGJpkmzwhAHPEBfWQMTLg/zF6IPgm68M3yUmp2d77TM=;
        b=iqyqIPoFvGDVQXCoqrrFd8W3Uu1OfZn3vmpjmNYHIzO8iSV8fZfebP3fXSDVC59yS6
         bqk8ULD2LAvgMNypKHgEbYB63SFV2jY1ErW8l/xASW69UZ2qyyfF26bnNIAtwSFDanwa
         FlUIJugDjJpRLMgVAwiePw5BbNBbIHCRo0gnaZHKCRhzZdABUDaPogKei13cpnbFbRCy
         H/tN73Znfr56y4QwD0EzAdVxLv/GpqbuUprmFu9bffiUqZKJCuhKSNNW98D7gFdnU/7I
         sm/XdgGRyisEm11nYGcXTYQTwV0sHjxUx8TUI9DreXLYx20Fyld4vOOi28z/qBxOALYa
         tY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723568542; x=1724173342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGJpkmzwhAHPEBfWQMTLg/zF6IPgm68M3yUmp2d77TM=;
        b=GIkDVgtvrFX+8bQqRigKywm17slTtuvdLFVFC4Tpn8cQdvMPWjDMi2uTEt68qqOySa
         +uMF8ZPnfPOT123/D44GhYvg68q4nIGZZ4m/JUEKyzO7NvGwOYE2lxEYQVeTdmbVmb3v
         PCGBV4phubpDdthzDeLDZoQDVyd5LDocCjSKm0mL+x+qQw0WTLZRnahN8i6auxW04fGP
         klVHY5iQctt8iOLZm/w05KDHp7N8B4aTutkeeayckgn1tykDDfYpszDP9o0quTzxEX+N
         ZDnWDMERmUTyZW6l/t36dYTwp7ErebS+o8F/Td8U/QN8rv4qBvuUepUBpqCwBcrq4nC/
         Rxdg==
X-Forwarded-Encrypted: i=1; AJvYcCXqjYZuKrPZJaZj914c+geakgXVXF2K11ZY+vMl7+4Nwgc2upPzexj6fjibWfyAj0bKDLVSkJpDnbcwti3Jh3PesuQVxnGtTdIML2f3AN8FgBFemDnzmlPKI7UHrAcbpwg=
X-Gm-Message-State: AOJu0YyXcS3ySlxlwVeWbiiKFdNQlw0m1uGkBTusI2EDTHLCRGIwwc0u
	Cj/JKDacv7xEPUM2wJ3U8YXrkHsrTRPPBrHkFbR7zQ9PXi3BjNvz1IRoaj36
X-Google-Smtp-Source: AGHT+IHZuurj1sUG8YFtdeInfXPdWplweffYruWCp+QQjqA/XiC02As6mGM3q9lJSfLX6jrUtjaRPw==
X-Received: by 2002:a2e:90cd:0:b0:2f1:585b:f326 with SMTP id 38308e7fff4ca-2f3aa1fe856mr50841fa.45.1723568541128;
        Tue, 13 Aug 2024 10:02:21 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f29203d817sm11755511fa.99.2024.08.13.10.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 10:02:20 -0700 (PDT)
Date: Tue, 13 Aug 2024 19:02:19 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com, jason.andryuk@amd.com,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
Message-ID: <ZruRm34zIMtUm7oH@zapote>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-5-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
X-TUID: zmMSlPbSDSkM

On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
> On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> > servers to handle hotplug.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/arm/xen_arm.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > index 5f75cc3779..ef8315969c 100644
> > --- a/hw/arm/xen_arm.c
> > +++ b/hw/arm/xen_arm.c
> > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
> >  
> >      xen_init_ram(machine);
> >  
> > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
> >  
> >      xen_create_virtio_mmio_devices(xam);
> >  
> > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> >      MachineClass *mc = MACHINE_CLASS(oc);
> >      mc->desc = "Xen PVH ARM machine";
> >      mc->init = xen_arm_init;
> > -    mc->max_cpus = 1;
> > +    /* MAX number of vcpus supported by Xen.  */
> > +    mc->max_cpus = GUEST_MAX_VCPUS;
> 
> Will this cause allocations of data structures with 128 elements?
> Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
> possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called

Yes, in theory there's probably overhead with this but as you correctly
noted below, a PVH aware xl will set the max_cpus option to a lower value.

With a non-pvh aware xl, I was a little worried about the overhead
but I couldn't see any visible slow-down on ARM neither in boot or in network
performance (I didn't run very sophisticated benchmarks).


> later on with the precise vCPU value which should be provided to QEMU
> via the -smp command line option
> (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?

Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
will set maxvcpus to the same value as vcpus.

Best regards,
Edgar
