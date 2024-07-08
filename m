Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2702047njb;
        Mon, 8 Jul 2024 06:49:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRN7gw8Z5p5XulGVzBOlo/wR7VfhM1NsHZdAWgeCuydX55IX9h5TRWpVdKuyBc4eKGDmEz8KFMeXuzab/G8XYGV4x4nyvC
X-Google-Smtp-Source: AGHT+IEQOjZhQ0VEfIsPopiQMAUFfSzjfbJZ8RsDI/Pk3Mtb+OazJwJcBZxrwsvFFppy2tfAiWfP
X-Received: by 2002:a05:622a:1a83:b0:447:e428:872b with SMTP id d75a77b69052e-447e4288927mr62237711cf.36.1720446563519;
        Mon, 08 Jul 2024 06:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720446563; cv=none;
        d=google.com; s=arc-20160816;
        b=gpU8N5upC4hqih0IbDTkMKRNKBk7RxHEWXpZ0zlb7vIfZ/OJMsxv2wBqRKQhEtfAMi
         qQCN7gPb2Zg/b6BrN0cfvVF1y4gL+FaFOw1TNZAjIl3ue7G2lS0DfcX6BiqCnVuKKkbJ
         u0jVnceyBbDEHv1cmOlslKQ81f35kxkyPVcHdf6IPC/NogSXZEHLkJBLFJk6BqJr454l
         iG3/DSDuuuiCAQj650DyGXPx947QEyP1wLBYNtYVasTy0mcZvJ1n4jWnw/Xjm18GsNc8
         4URLWCrihKMyGrJIM0j0niFlPW2B/07RUE5BR6PmBIul4XN7JuiDbJ/gr4B97K7K5z3N
         IsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=lnl0NTwyz0QMr2cBO8K/QyleLySUQ0WTiR71Nrv8xzc=;
        fh=9QUa6WHprJ0aSi7+hEw0Gm7Y9jL6lvNDLgFYiIzvVAc=;
        b=BpXMsQ3MdQoxQLSqC9fDwxqzcg6WfgbIWeCC1yhRTyqNXlOOhAFgbwwx7qHqRdHneD
         aMT1dtBPPiKLDy55gmtAX299ZlzprL5ci3cbRkxg0zlauqAxfKZD1H8IBf3uAgRyzoPM
         KoT96UXHO3Pc0z4A83EL/pN66yHEMRK2YvTnumocGIiN+7wVteuPYFolojWzuKIcw+jV
         dcCBBLUBWIt8b0wwKebecE4b14WYRU29w5sWGZq8ehEZ4szrv9N3X3oFCtVA3giNkgK9
         tLeeY+yP53hrV9qXyIOsPOS3NTHvJS3rWRmjElsU1CspqQ0pTbvcjHOCeTerMbFn2Ey3
         G/8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NXydy3Nk;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-447e7a70255si36312781cf.357.2024.07.08.06.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NXydy3Nk;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720446563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnl0NTwyz0QMr2cBO8K/QyleLySUQ0WTiR71Nrv8xzc=;
	b=NXydy3NkxbIlrbBJKb3HxIENiP6b/6hrHjBserMwkHqskqCZyhjzBr1PzrdDm///8v5Rsr
	bZeU4w5XqhSiPJ608WKqIULzs4HlN1lfTwEc4u9k6lkO5EP+pU5EIkpi39fGVpTmidkv1j
	EtKqkXW+vCvo/oNKJvu28xzkgpi4/mU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-VJRd1WfhMsmLbV-jQwsC-A-1; Mon, 08 Jul 2024 09:49:21 -0400
X-MC-Unique: VJRd1WfhMsmLbV-jQwsC-A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36793373454so2897461f8f.1
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 06:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720446560; x=1721051360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnl0NTwyz0QMr2cBO8K/QyleLySUQ0WTiR71Nrv8xzc=;
        b=RU9qLXxhnwnDZPXwZ73GS5rVwjK1pD8Eqt8NKYuhNsNnClql5bCxIfmdss7v26Bfla
         +p0z4HE+f7GtC2zgVIGfFaQ9exXOBwMk1gV3/KyYV8CO8ze5rsHM4AmadUsR5KAISmjb
         mwUxNWwkBNrJ8esoYyXev3FcF9IuC8q9yYXM/p4n9QWw4zM5Ld1M4aoPBmpOQ3e65Kwz
         x1U+7Jq7se+Nv9ai0T0W2bVY7B7+9JALUlJ3iDPjbS7oDEDsM+yQ1Nh8d19oODj238Dl
         CNSm6Af+9qIRO+y/RAb8H9ePPksxvvcqUDKHcLB9rJuj1SCnXjrtrbPOyxwkc9kbcSHN
         TWFg==
X-Forwarded-Encrypted: i=1; AJvYcCU1dEAbMgVQ2qhGQC1r8u3AKYaTpTJJjd1kgGwu6fyAqbtC3J8Szz9wEmuK9Sg9nVHDgIftw+gVJT6qPrSfcD4ieu/J4EmR
X-Gm-Message-State: AOJu0Yzu0g1ngmVFh3rRiRrDgIJyN5/QiWkV/2I1PuO0w458iT3kUFvn
	dZfCkNRyk/9pqFbBMa2C8u1h7XSh2XngmQR9/3gyCMp5d6HGQim7lnGz6axfda3b/IOymTS6E1/
	uM1ek+BI/+KUK56kOO5rgQeBNC9CIj2nGhwYdRUZ+SZHB1R0hyu0NDg==
X-Received: by 2002:adf:e892:0:b0:367:993e:874f with SMTP id ffacd0b85a97d-3679dd35745mr9627609f8f.34.1720446560433;
        Mon, 08 Jul 2024 06:49:20 -0700 (PDT)
X-Received: by 2002:adf:e892:0:b0:367:993e:874f with SMTP id ffacd0b85a97d-3679dd35745mr9627586f8f.34.1720446559967;
        Mon, 08 Jul 2024 06:49:19 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36789a02631sm16271187f8f.1.2024.07.08.06.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:49:19 -0700 (PDT)
Date: Mon, 8 Jul 2024 15:49:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@opnsrc.net>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 5/8] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Message-ID: <20240708154916.7ff9bdf3@imammedo.users.ipa.redhat.com>
In-Reply-To: <020c731c-8bfc-4524-9750-879dd44b6cfe@opnsrc.net>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-6-salil.mehta@huawei.com>
	<20240706163524.012b6caf@imammedo.users.ipa.redhat.com>
	<020c731c-8bfc-4524-9750-879dd44b6cfe@opnsrc.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: pdm17qtPF+IK

On Mon, 8 Jul 2024 05:26:00 +0000
Salil Mehta <salil.mehta@opnsrc.net> wrote:

> On 06/07/2024 14:35, Igor Mammedov wrote:
> > On Fri, 7 Jun 2024 12:56:46 +0100
> > Salil Mehta <salil.mehta@huawei.com> wrote:
> >  
> >> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is IO port
> >> based and existing CPUs AML code assumes _CRS objects would evaluate to a system
> >> resource which describes IO Port address. But on ARM arch CPUs control
> >> device(\\_SB.PRES) register interface is memory-mapped hence _CRS object should
> >> evaluate to system resource which describes memory-mapped base address. Update
> >> build CPUs AML function to accept both IO/MEMORY region spaces and accordingly
> >> update the _CRS object.  
> > ack for above change  
> Thanks
> >
> >
> > but below part is one too many different changes withing 1 patch.
> > anyways, GPE part probably won't be needed if you follow suggestion made
> > on previous patch.  
> 
> The change mentioned in the earlier patches might end up creating
> 
> noise for this patch-set as one will have to touch the Memory Hotplug
> 
> part as well. I'm willing to do that change but I think it is a noise for
> 
> this patch-set, really.

you don't have to touch memory hotplug,
but fixing it up (as a separate patch of cause) to be consistent
with cpu hotplug would be nice.

> 
> >     
> >> On x86, CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) event handler to
> >> notify OSPM about any CPU hot(un)plug events. Latest CPU Hotplug is based on
> >> ACPI Generic Event Device framework and uses ACPI GED device for the same. Not
> >> all architectures support GPE based CPU Hotplug event handler. Hence, make AML
> >> for GPE.2 event handler conditional.
> >>
> >> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> >> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> >> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> >> Reviewed-by: Gavin Shan <gshan@redhat.com>
> >> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> >> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> >> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> >> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> >> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> >> ---
> >>   hw/acpi/cpu.c         | 23 ++++++++++++++++-------
> >>   hw/i386/acpi-build.c  |  3 ++-
> >>   include/hw/acpi/cpu.h |  5 +++--
> >>   3 files changed, 21 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> >> index af2b6655d2..4c63514b16 100644
> >> --- a/hw/acpi/cpu.c
> >> +++ b/hw/acpi/cpu.c
> >> @@ -343,9 +343,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
> >>   #define CPU_FW_EJECT_EVENT "CEJF"
> >>   
> >>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >> -                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
> >> +                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
> >>                       const char *res_root,
> >> -                    const char *event_handler_method)
> >> +                    const char *event_handler_method,
> >> +                    AmlRegionSpace rs)
> >>   {
> >>       Aml *ifctx;
> >>       Aml *field;
> >> @@ -370,13 +371,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >>           aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
> >>   
> >>           crs = aml_resource_template();
> >> -        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
> >> +        if (rs == AML_SYSTEM_IO) {
> >> +            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr, 1,
> >>                                  ACPI_CPU_HOTPLUG_REG_LEN));
> >> +        } else {  
> > else
> >   if (rs == yours type)  
> >> +            aml_append(crs, aml_memory32_fixed(base_addr,
> >> +                               ACPI_CPU_HOTPLUG_REG_LEN, AML_READ_WRITE));
> >> +        }  
> > else assert on not supported input  
> 
> Sure, no problem. I can incorporate the change.
> 
> Thanks, Salil.
> 
> >  
> >> +
> >>           aml_append(cpu_ctrl_dev, aml_name_decl("_CRS", crs));
> >>   
> >>           /* declare CPU hotplug MMIO region with related access fields */
> >>           aml_append(cpu_ctrl_dev,
> >> -            aml_operation_region("PRST", AML_SYSTEM_IO, aml_int(io_base),
> >> +            aml_operation_region("PRST", rs, aml_int(base_addr),
> >>                                    ACPI_CPU_HOTPLUG_REG_LEN));
> >>   
> >>           field = aml_field("PRST", AML_BYTE_ACC, AML_NOLOCK,
> >> @@ -700,9 +707,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >>       aml_append(sb_scope, cpus_dev);
> >>       aml_append(table, sb_scope);
> >>   
> >> -    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> >> -    aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
> >> -    aml_append(table, method);
> >> +    if (event_handler_method) {
> >> +        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> >> +        aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
> >> +        aml_append(table, method);
> >> +    }
> >>   
> >>       g_free(cphp_res_path);
> >>   }
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 53f804ac16..b73b136605 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -1537,7 +1537,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>               .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
> >>           };
> >>           build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
> >> -                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02");
> >> +                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02",
> >> +                       AML_SYSTEM_IO);
> >>       }
> >>   
> >>       if (pcms->memhp_io_base && nr_mem) {
> >> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> >> index e6e1a9ef59..48cded697c 100644
> >> --- a/include/hw/acpi/cpu.h
> >> +++ b/include/hw/acpi/cpu.h
> >> @@ -61,9 +61,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
> >>                                     GArray *entry, bool force_enabled);
> >>   
> >>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >> -                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
> >> +                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
> >>                       const char *res_root,
> >> -                    const char *event_handler_method);
> >> +                    const char *event_handler_method,
> >> +                    AmlRegionSpace rs);
> >>   
> >>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
> >>     
> 
