Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp209859ejc;
        Fri, 27 Oct 2023 06:47:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuO+ingB9/szgVCQtDq8KLibWolaBQX14QfXnswN8BOxJ4aByl/qUZcXkc0H+DMJgwwYRH
X-Received: by 2002:a5d:6c6f:0:b0:32d:9585:8680 with SMTP id r15-20020a5d6c6f000000b0032d95858680mr2727507wrz.4.1698414436660;
        Fri, 27 Oct 2023 06:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698414436; cv=none;
        d=google.com; s=arc-20160816;
        b=wFgJY4ri5duoNya5y23C72FdOtaZy0qMxLgl2ixKtmysIGEMppovRB2HeLVF4Tsz+L
         RV6HjnXMq8lZYnD/X1o0Fh9BDCHZuArxPxufhsaxg0LZ8jdF4icSEPW3XnYmUF+VoPeh
         ksAcflZqh0yTNmA/D81Q3Xt0Agc9pL4evvs8LizsNgA+tvXJwWqGJwa83c5U0y5ghHRQ
         +ARqhLYROnoDfcqPll1kDuE9E+jtvwhGUwdQUreDIZ1iW/oOK6t0G6Qz2Kwe1UPPmDh6
         pU3UwByqYdJ6Nb/QYtbOFOy8zCPGU0UrQ8ktBP7c5tScCq2IeeTcyxFqIQxHNSXrhVR+
         3T4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=C876OquHmjrhvyyVIo55u8rq3yil9m0cSguQDvHH3VQ=;
        fh=JNcKjD6cC6YcrPK4+Lb+hsCpt9QliedqPEdug4H4szg=;
        b=eaqgoSlAqrhV/Qqrg3TjD9jDhWXnV+Cp4GqMKL1v7vN2tOkGiOsBIfnnmSr9X3t7sC
         lWYkldCTO6qZhagCMFI78yDW07Qd7mQLIhMvCOwzozxqqVtgf/k50yZCChvAvG+SGO5L
         zWA5TJXujBDCXIyRp9P0TlPQEm5ztFv3x4fO5m8Vp973aHrrzYxU03YH5zP7Ly2Qaxo4
         9hdsQOMTLfjjJCly87lWlNpdzUsEtZ1Q7B7DbELkwFSqcVzsDsQHj8QuJqnUjs0uom4I
         ZyrGHCZpwoCPDC8u+QCLKr6wWZubnek0jBVIjVQ9JboqM+Ax9Am45btzpgogaBylj9Ns
         BWmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U1BYuZr1;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d3-20020adff843000000b0032d9b82d88dsi1236410wrq.622.2023.10.27.06.47.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:47:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U1BYuZr1;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698414435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C876OquHmjrhvyyVIo55u8rq3yil9m0cSguQDvHH3VQ=;
	b=U1BYuZr15e92c2/2bJWAjTskSL1bywKXlx73ugevi5ghkFtnl80LuwyI2plGKFryKsvTQY
	0vs50NxOT1vV8ZWRaBcXfOPEMPoT6jS+KRkF6rHphLPdK7rS5FqfoALbi45rhj6P4fDKBB
	q5UtddhWpzQtpIl35JSE5NsBCRR+QsI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-Y4Ms18-FMcmlVWlUHM4-7g-1; Fri, 27 Oct 2023 09:46:52 -0400
X-MC-Unique: Y4Ms18-FMcmlVWlUHM4-7g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9c778321afdso155777866b.1
        for <alex.bennee@linaro.org>; Fri, 27 Oct 2023 06:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698414411; x=1699019211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C876OquHmjrhvyyVIo55u8rq3yil9m0cSguQDvHH3VQ=;
        b=VVJCGDTDmyiqYDzkHYpF5Q1RtOOQVgK0s6DEx7ndQPu8+UgzvNNdlVvRxuWKSoiINI
         piQ91vUVkfnKpxGyYdj862fCWVczU0P8GLvfSeC42WI+D3tRK0caXbCWAW/FhGj8nxll
         bL47GAHbpNRoiQh/MrAdK2LbqA3pP3SISgxcLlVNASU8WMeU2+orGLK+GkqCK8t4tdZe
         9D6IH+QRsJVQHiL46oMeaEpNlUs7AZROOnNmoPrE7YRUue02De5eISPKWHX3Y9NXiRDj
         LPrhDdrepIPg1ltn8VwbJpZzO12iBa+uyqFu87R629l3piSIvVz85BngyXh4oOYf73W4
         69JA==
X-Gm-Message-State: AOJu0Yxb70+W0kHbTPZeT0EuFRVOklOa+PQYrRLCiyhuAPRR7C26aXRM
	eScLcP9jPEHYDj5M1llG0BL+wRkvaYGCLCUQhT56ilRnIhRnzRhaJM2UqlC/wqu7s/VH2o6H698
	zpp4FEuYxIp9rKObX
X-Received: by 2002:a17:907:9414:b0:9b2:b9ff:dc35 with SMTP id dk20-20020a170907941400b009b2b9ffdc35mr2294827ejc.70.1698414411097;
        Fri, 27 Oct 2023 06:46:51 -0700 (PDT)
X-Received: by 2002:a17:907:9414:b0:9b2:b9ff:dc35 with SMTP id dk20-20020a170907941400b009b2b9ffdc35mr2294811ejc.70.1698414410706;
        Fri, 27 Oct 2023 06:46:50 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id k13-20020a17090666cd00b009b913aa7cdasm1239469ejp.92.2023.10.27.06.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:46:50 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:46:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>, <mst@redhat.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <will@kernel.org>,
 <gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
 <linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
 <ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
 <karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
 <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
 <wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
 <jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
 <linuxarm@huawei.com>
Subject: Re: [PATCH V6 5/9] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Message-ID: <20231027154648.2ce47292@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231013105129.25648-6-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-6-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: nGilFx6kVd6r

On Fri, 13 Oct 2023 11:51:25 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is based on
> PCI and is IO port based and hence existing CPUs AML code assumes _CRS objects
                               ^^^^
being placed in PCI0 context is no the reason why resource was described as IO.
being IO is probably historical thing (as legacy hp was implemented as IO)

_CRS could have been at _SB level as motherboard resource but, in that case
we would need to carve out hole in PCI's _CRS  explicitly to exclude it.
Hence it was placed in PCI0 context as a hack that helps to avoid us that.
Perhaps it also applies to other targets.



> would evaluate to a system resource which describes IO Port address. But on ARM
> arch CPUs control device(\\_SB.PRES) register interface is memory-mapped hence
> _CRS object should evaluate to system resource which describes memory-mapped
> base address. Update build CPUs AML function to accept both IO/MEMORY region
> spaces and accordingly update the _CRS object.

Also x86 should be able to switch to and work with MMIO region
(I think QEMU wise IO and MMIO are the same)
and we can just use MMIO, likely without any compat machinery.

aka. existing/running/migrated x86 guests will use IO instructions to access region
(since CRS they have read, says it is IO), while new VMs will access region
as MMIO.

I might be wrong though,
  Michael?

> On x86, Legacy CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) event
> handler to notify OSPM about any CPU hot(un)plug events. Latest CPU Hotplug is
> based on ACPI Generic Event Device framework and uses ACPI GED device for the
> same. Not all architectures support Legacy CPU Hotplug. Hence, make AML for
> GPE.2 event handler conditional.

x86 has support for Legacy and Modern CPU hotplug (the later is enabled at runtime).
And both use GPE for event delivery, so above statement is not entirely
correct/confusing.

> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> ---
>  hw/acpi/cpu.c         | 23 ++++++++++++++++-------
>  hw/i386/acpi-build.c  |  3 ++-
>  include/hw/acpi/cpu.h |  5 +++--
>  3 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 4b24a25003..596b6d9d81 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -339,9 +339,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
>  #define CPU_FW_EJECT_EVENT "CEJF"
>  
>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> -                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
> +                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
>                      const char *res_root,
> -                    const char *event_handler_method)
> +                    const char *event_handler_method,
> +                    AmlRegionSpace rs)
>  {
>      Aml *ifctx;
>      Aml *field;
> @@ -366,13 +367,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
>  
>          crs = aml_resource_template();
> -        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
> +        if (rs == AML_SYSTEM_IO) {
> +            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr, 1,
>                                 ACPI_CPU_HOTPLUG_REG_LEN));
> +        } else {
> +            aml_append(crs, aml_memory32_fixed(base_addr,
> +                               ACPI_CPU_HOTPLUG_REG_LEN, AML_READ_WRITE));
> +        }
> +
>          aml_append(cpu_ctrl_dev, aml_name_decl("_CRS", crs));
>  
>          /* declare CPU hotplug MMIO region with related access fields */
>          aml_append(cpu_ctrl_dev,
> -            aml_operation_region("PRST", AML_SYSTEM_IO, aml_int(io_base),
> +            aml_operation_region("PRST", rs, aml_int(base_addr),
>                                   ACPI_CPU_HOTPLUG_REG_LEN));
>  
>          field = aml_field("PRST", AML_BYTE_ACC, AML_NOLOCK,
> @@ -696,9 +703,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>      aml_append(sb_scope, cpus_dev);
>      aml_append(table, sb_scope);
>  
> -    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> -    aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
> -    aml_append(table, method);
> +    if (event_handler_method) {
> +        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> +        aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
> +        aml_append(table, method);
> +    }
>  
>      g_free(cphp_res_path);
>  }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 3f2b27cf75..f9f31f9db5 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1550,7 +1550,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>          };
>          build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
> -                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02");
> +                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02",
> +                       AML_SYSTEM_IO);
>      }
>  
>      if (pcms->memhp_io_base && nr_mem) {
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index bc901660fb..b521a4e0de 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -60,9 +60,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
>                                    GArray *entry, bool force_enabled);
>  
>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> -                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
> +                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
>                      const char *res_root,
> -                    const char *event_handler_method);
> +                    const char *event_handler_method,
> +                    AmlRegionSpace rs);
>  
>  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
>  
