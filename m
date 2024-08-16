Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1284926njf;
        Fri, 16 Aug 2024 09:53:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCC6LzBEAJzJUZfDVpqSzqIZhgMjdN05KykWvqxLbspphav0iMcKKui56Ky2f5Zi7bs6fLg/WaykQzX8OT0eDmkwH73qfk
X-Google-Smtp-Source: AGHT+IGVqK/WRtXzVSZ6Zl2AZY5NWf0WcTrZlF37LW7nKuzsU+4qSW77asTM0Z0dFySGD0AY9v9j
X-Received: by 2002:a05:6870:418c:b0:260:26a2:68e8 with SMTP id 586e51a60fabf-2701db20e7dmr1223988fac.4.1723827217762;
        Fri, 16 Aug 2024 09:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723827217; cv=none;
        d=google.com; s=arc-20160816;
        b=Sf4VAWFd+Y2H7lO/+0G1/WxYRdwnZ/N9roLIbBLsm3fE5naL8labiB9a8Ka7xnKxjD
         CCC523GnlMPQ6IPP/e4mizIyONJAh8S+NIKZdejR5c6G12NEaNZNP1qPpaorM5uZmm0V
         Hp9RlyxD4642cIvDtH2TE7KvXkbMUFk5I03y2lRhfeH2PZ46srfv0zECn2PKKjV0vUAN
         f025YlDLCLYy2KYmShLSHerDq3RedvehNWte7RALg8B2CqxeFaxv7BpW698E+OP+/rPF
         QUtUDsFLed9ZZIejY0c8ApKlOS01D1j9Rk4q0LnrY7dv150k4Hywvq6JDpjiWVo/GqKg
         MUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=zdp7YPAtbLhZgDK0Dc4uwOUPnUM2kURmGY6TwMzkQOk=;
        fh=X2hxAmW+prxDFqlKxtwqx/eBa1AAwc3Aj4NLmPGNjx4=;
        b=YqAxy/3jrwKjkllrDs6OIWvcxIOtQ+mOleOld4HXKr/c0/pgejZTlyCahy+Ku+mHIB
         q86nCta2x+PWqUwTbL7sb89P8GOYq5H3hPpLdKbUOExJU3VY5EIIRk4AVeWSesoexK/O
         y8YgOigq6yXZPAOilnze/kz03nt5pz2zURkmWl0fXlEothEXVKCBPSiyp/2rxhzWgD6i
         YEphxCX2KT4MLEqmB65UYieeZ2pP6wG4J2iViqLvau5BmoyK/B/wQ9qopaTyUwArIUSe
         iNjEEmkRFd4gqPutpMEyriXY2YqM6yMv8Rt6IzldX7ctknFmfJ/cwxKsJe/B90oJAO2N
         oJ8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="k/LHvJhp";
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 586e51a60fabf-2702d8f30aesi344530fac.28.2024.08.16.09.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 09:53:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="k/LHvJhp";
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6258462117;
	Fri, 16 Aug 2024 16:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDCFC32782;
	Fri, 16 Aug 2024 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723827217;
	bh=05FqKFiDp1obCU8IVAX68BZqgenFk4qV0Beo1Yu69iI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k/LHvJhpaspNwG/e3/BBfVQljbSO8JQivzWeF4Uxz45RMPAEC9E3KvFr+YNcCfmZ5
	 WryYmXyz3cN3Lp4NW/tJjAK2W45HAYHTN5ayPNkXp56F9Lgs/1CJFoxOlgupGgU8q2
	 7tL+jGtoY8p/CHy36L5B7d3FgExilUr587zCy8j2sXeAtD+3rvRXve4M+M81TiZCbp
	 lr7ZNXO6JzvYELT2B4q5HHnKocwAxiER/oo8IT/VwD+Phl5/XdnUAXI0AeuDgMxO/2
	 1gzKn2T8HN/HMU4MB/rRNbcba14q1TCcxZJ801HM6NLlYy+3N7KRMCOnS/2pMdXJrs
	 9citVOSJqzZuA==
Date: Fri, 16 Aug 2024 09:53:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
    anthony@xenproject.org, paul@xen.org, peter.maydell@linaro.org, 
    alex.bennee@linaro.org, xenia.ragiadakou@amd.com, jason.andryuk@amd.com, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    qemu-arm@nongnu.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
In-Reply-To: <CAJy5ezrUbGZCaF=HiYhyLCoXRL3d=t-QbmLeKvu7ByWksV888g@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408160949320.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-5-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop> <ZruRm34zIMtUm7oH@zapote> <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
 <ZryZwOoadeb1UWK8@zapote> <alpine.DEB.2.22.394.2408141719400.298534@ubuntu-linux-20-04-desktop> <CAJy5ezrUbGZCaF=HiYhyLCoXRL3d=t-QbmLeKvu7ByWksV888g@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1147340740-1723827217=:298534"
X-TUID: h4E2hmtzBn2o

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1147340740-1723827217=:298534
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 16 Aug 2024, Edgar E. Iglesias wrote:
> On Thu, Aug 15, 2024 at 2:30 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       On Wed, 14 Aug 2024, Edgar E. Iglesias wrote:
>       > On Tue, Aug 13, 2024 at 03:52:32PM -0700, Stefano Stabellini wrote:
>       > > On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:
>       > > > On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
>       > > > > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
>       > > > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>       > > > > >
>       > > > > > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
>       > > > > > servers to handle hotplug.
>       > > > > >
>       > > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>       > > > > > ---
>       > > > > >  hw/arm/xen_arm.c | 5 +++--
>       > > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
>       > > > > >
>       > > > > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>       > > > > > index 5f75cc3779..ef8315969c 100644
>       > > > > > --- a/hw/arm/xen_arm.c
>       > > > > > +++ b/hw/arm/xen_arm.c
>       > > > > > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
>       > > > > > 
>       > > > > >      xen_init_ram(machine);
>       > > > > > 
>       > > > > > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
>       > > > > > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
>       > > > > > 
>       > > > > >      xen_create_virtio_mmio_devices(xam);
>       > > > > > 
>       > > > > > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>       > > > > >      MachineClass *mc = MACHINE_CLASS(oc);
>       > > > > >      mc->desc = "Xen PVH ARM machine";
>       > > > > >      mc->init = xen_arm_init;
>       > > > > > -    mc->max_cpus = 1;
>       > > > > > +    /* MAX number of vcpus supported by Xen.  */
>       > > > > > +    mc->max_cpus = GUEST_MAX_VCPUS;
>       > > > >
>       > > > > Will this cause allocations of data structures with 128 elements?
>       > > > > Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
>       > > > > possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
>       > > >
>       > > > Yes, in theory there's probably overhead with this but as you correctly
>       > > > noted below, a PVH aware xl will set the max_cpus option to a lower value.
>       > > >
>       > > > With a non-pvh aware xl, I was a little worried about the overhead
>       > > > but I couldn't see any visible slow-down on ARM neither in boot or in network
>       > > > performance (I didn't run very sophisticated benchmarks).
>       > > 
>       > > What do you mean by "non-pvh aware xl"? All useful versions of xl
>       > > support pvh?
>       >
>       >
>       > I mean an xl without our PVH patches merged.
>       > xl in upstream doesn't know much about PVH yet.
>       > Even for ARM, we're still carrying significant patches in our tree.
> 
>       Oh I see. In that case, I don't think we need to support "non-pvh aware xl".
> 
> 
>       > > > > later on with the precise vCPU value which should be provided to QEMU
>       > > > > via the -smp command line option
>       > > > > (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
>       > > >
>       > > > Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
>       > > > values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
>       > > > will set maxvcpus to the same value as vcpus.
>       > >
>       > > OK good. In that case if this is just an initial value meant to be
>       > > overwritten, I think it is best to keep it as 1.
>       >
>       > Sorry but that won't work. I think the confusion here may be that
>       > it's easy to mix up mc->max_cpus and machine->smp.max_cpus, these are
>       > not the same. They have different purposes.
>       >
>       > I'll try to clarify the 3 values in play.
>       >
>       > machine-smp.cpus:
>       > Number of guest vcpus active at boot.
>       > Passed to QEMU via the -smp command-line option.
>       > We don't use this value in QEMU's ARM PVH machines.
>       >
>       > machine->smp.max_cpus:
>       > Max number of vcpus that the guest can use (equal or larger than machine-smp.cpus).
>       > Will be set by xl via the "-smp X,maxcpus=Y" command-line option to QEMU.
>       > Taken from maxvcpus from xl.cfg, same as XEN_DMOP_nr_vcpus.
>       > This is what we use for xen_register_ioreq().
>       >
>       > mc->max_cpus:
>       > Absolute MAX in QEMU used to cap the -smp command-line options.
>       > If xl tries to set -smp (machine->smp.max_cpus) larger than this, QEMU will bail out.
>       > Used to setup xen_register_ioreq() ONLY if -smp maxcpus was NOT set (i.e by a non PVH aware xl).
>       > Cannot be 1 because that would limit QEMU to MAX 1 vcpu.
>       >
>       > I guess we could set mc->max_cpus to what XEN_DMOP_nr_vcpus returns but I'll
>       > have to check if we can even issue that hypercall this early in QEMU since
>       > mc->max_cpus is setup before we even parse the machine options. We may
>       > not yet know what domid we're attaching to yet.
> 
>       If mc->max_cpus is the absolute max and it will not be used if -smp is
>       passed to QEMU, then I think it is OK to use GUEST_MAX_VCPUS
> 
> Looking at this a little more. If users (xl) don't pass an -smp option we actually default to smp.max_cpus=1.
> So, another option is to simply remove the upper limit in QEMU (e.g we can set mc->max_cpus to something very large like UINT32_MAX).
> That would avoid early hypercalls, avoid using GUEST_MAX_VCPUS and always let xl dictate the max_cpus value using the -smp cmdline option. 

As the expectation is that there will be always a smp.max_cpus option
passed to QEMU, I would avoid an extra early hypercall.

For the initial value, I would use something static and large, but not
unreasonably large as UINT32_MAX to be more resilient in (erroneous)
cases where smp.max_cpus is not passed.

So I would initialize it to GUEST_MAX_VCPUS, or if we don't want to use
GUEST_MAX_VCPUS, something equivalent in the 64-256 range.

Alternative we can have a runtime check and exit with a warning if
smp.max_cpus is not set.
--8323329-1147340740-1723827217=:298534--
