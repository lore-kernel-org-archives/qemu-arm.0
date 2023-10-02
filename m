Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1419213ejb;
        Mon, 2 Oct 2023 09:09:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEARDvQlV0uWw/lzHq2jf1MePf0eWjIOPxMqFa4lLktYGfmF7tvFw88vQwyeKLL5IeNOAnb
X-Received: by 2002:adf:e90e:0:b0:321:cec8:e64d with SMTP id f14-20020adfe90e000000b00321cec8e64dmr10933702wrm.62.1696262997634;
        Mon, 02 Oct 2023 09:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696262997; cv=none;
        d=google.com; s=arc-20160816;
        b=h1OZEdWH1PGZt0SPobEXjiktH4xJbNYDP7eiUEkWCxBnn7IHUafTsQkqnU81yv7yDT
         m2GkPm82LI5kxa2P+NMVGs1+MxeLJ4MRMvJmSUpI4f7QIr6BjT/0vXjMWQQWLdj+dCLS
         e/Q6SWNUt1R/QKdvInx8H1kNrnRD2zKSVapi6Dx3cZPPGy6NuXInnUJYIWD1At0PgYv1
         uVlpl4Icx9s4zNOxkMsmFrRJB5bwz3SxERfEiN7TTv228sgQsDVo7A3kBhYdrZeCbbmN
         OnL6XChKsgmXF+I0zgDRESeFSHhDWL8Vfx8qyiz7s0iY4vdwwo4BO2S7z+3xcuchATK9
         1LRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=rq51wGnXNJrzEIjvXqBQSqZkMqMc/Or13JrGr95K9lI=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=sOojQkUmdtczSeab+CYcdpwkOCp5Zqpm6OcVuIeqLZzuSoPkO/3ILkjfK6mYhLoDtx
         U5mBwF58aFSeqpH5X0FCvQqyL7w+4p68RcyUS78ISzM1sq+FUY1Fj8Oxj5WySZO0w5vd
         VQUTF+66cmzMz3a+J1WM1VFhUjt9dgJM0Z9xi2Lc5CjjQWdAFH9Rjghk9QvVxGvApRlA
         n7L7vR78j3Teste2sbbcyVHbxicj2G0DfwSqwLWcaR3IWZtrs44H/0UrBLjQKBwxzMNY
         Ctm4yaFvVt0uSfO8TmgKEKo9eIEg4ivsYHigvhzThZ7kNB9Nyd+8RzPfZzlME/rcglQ4
         I4Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id z4-20020a5d6544000000b0031aec163cddsi12772811wrv.841.2023.10.02.09.09.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rzm7B1PVcz6HJZ3;
	Tue,  3 Oct 2023 00:07:18 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 17:09:55 +0100
Date: Mon, 2 Oct 2023 17:09:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
	<jean-philippe@linaro.org>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: Re: [PATCH V2 05/10] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Message-ID: <20231002170954.000016ba@Huawei.com>
In-Reply-To: <20230930001933.2660-6-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-6-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: GRCIwtf152vJ

On Sat, 30 Sep 2023 01:19:28 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is based on
> PCI and is IO port based and hence existing cpus AML code assumes _CRS objects
> would evaluate to a system resource which describes IO Port address. But on ARM
> arch CPUs control device(\\_SB.PRES) register interface is memory-mapped hence
> _CRS object should evaluate to system resource which describes memory-mapped
> base address.
> 
> This cpus AML code change updates the existing inerface of the build cpus AML
> function to accept both IO/MEMORY type regions and update the _CRS object
> correspondingly.

This also makes a change to make the event_handler_method optional.
Would be good to explain why or leave that for a future patch.

Otherwise looks fine.

> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  hw/acpi/cpu.c         | 23 ++++++++++++++++-------
>  hw/i386/acpi-build.c  |  2 +-
>  include/hw/acpi/cpu.h |  5 +++--
>  3 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 45defdc0e2..66a71660ec 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -338,9 +338,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
>  #define CPU_FW_EJECT_EVENT "CEJF"
>  
>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> -                    hwaddr io_base,
> +                    hwaddr base_addr,
>                      const char *res_root,
> -                    const char *event_handler_method)
> +                    const char *event_handler_method,
> +                    AmlRegionSpace rs)
>  {
>      Aml *ifctx;
>      Aml *field;
> @@ -367,13 +368,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
> @@ -699,9 +706,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
> index 4d2d40bab5..611d3d044d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1550,7 +1550,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>          };
>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> -                       "\\_SB.PCI0", "\\_GPE._E02");
> +                       "\\_SB.PCI0", "\\_GPE._E02", AML_SYSTEM_IO);
>      }
>  
>      if (pcms->memhp_io_base && nr_mem) {
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 999caaf510..b87ebfdf4b 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -56,9 +56,10 @@ typedef struct CPUHotplugFeatures {
>  } CPUHotplugFeatures;
>  
>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> -                    hwaddr io_base,
> +                    hwaddr base_addr,
>                      const char *res_root,
> -                    const char *event_handler_method);
> +                    const char *event_handler_method,
> +                    AmlRegionSpace rs);
>  
>  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
>  
