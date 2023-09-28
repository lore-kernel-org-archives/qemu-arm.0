Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2232057ejc;
        Wed, 27 Sep 2023 18:26:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/j5QLosFac2Eugc5De4vabdJsyVdxZVGItVg8wCq9rqsc7Xc+WOzXwwemkFAMprK1P/Os
X-Received: by 2002:a0c:f00c:0:b0:65b:319b:b430 with SMTP id z12-20020a0cf00c000000b0065b319bb430mr3641964qvk.58.1695864386115;
        Wed, 27 Sep 2023 18:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695864386; cv=none;
        d=google.com; s=arc-20160816;
        b=lO/G7Ag3PtOX4IsflIoLRBre13mW5nEElutu9alEIASOxT71BXtDRaScopOJxjo3UC
         yfmUZyDxNgdT1YancR62tO6b2LEm7eOPhKREGI+5O/srFHLtEOOlYmLxOso89AXuvn8a
         ftKME44Di9IdpPkfbGZp8FIKKlSbHPHIyB3QWsqYV6epLAnEJqfk2l3Td+TTUK4uYCdW
         fIvVilolvqedeaG55wVneHDPWysLCw5IfIIE0j0vUlQK/PoRgfczOvk7NQ+YfNldHh9O
         a2fq2IMHwosxfjIcqAJLIoZoafpsWGwx9JYoSLiEV5u4IofvT1o+EBrmI6wbjMatwy2m
         X6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ofbQlFG7DfY6BCrLZ0NPamX51zA/0IQOtNdVPXeHaqE=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=hxjUtFMDyfPHtHkPBLSLV+ou96W4YXKVchCYY72qcdy1IVZhk1SYgurKxYBtiWWxwr
         YonlodBSS+Ac7HmmnWR4vGkSRQT/pJSvxjkOb3wGGOwamOqfHLawhFQK8DwO8P1+/c/V
         sn1GmX0/gR2qBd3xwtkjwjQ1UVzWacRtP8+jWZQ/u+xekpil3W/7XXCKn+qqT37vyyWW
         JNrGbkjHFU9ZaPnQklV72Q1hHai5pdxYoDPsqajCp4tiCfeBC6dvBGJ/sLrOG+KU+ImT
         LiozKQUuaJt7Xh5pozxyD/ODvgETFUxM+V+s/Xxp6+N/TKlaavGxVNUF5t0assnwVm/r
         qZMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZYPbnvm0;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id re20-20020a05620a8e1400b0076ce7cfe77csi5766088qkn.65.2023.09.27.18.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 18:26:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZYPbnvm0;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695864385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofbQlFG7DfY6BCrLZ0NPamX51zA/0IQOtNdVPXeHaqE=;
	b=ZYPbnvm0VFulBfi0KiwVdSLgDGK8hriZxECdAUPVTAqUgcEw0j+05guhBrM1jWYNe7njFM
	UfKl917fwu2YFTNerwBpainUe5y5yp+lSeuDjXwiy7bJdH1Rf1Y3xJr7wa6sW6+5gHvRzF
	R/COJkpvpt1LUTGCPctdrR05xB1Cdvk=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-hHjW9apzOxa9hQ2504fs4A-1; Wed, 27 Sep 2023 21:26:24 -0400
X-MC-Unique: hHjW9apzOxa9hQ2504fs4A-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-690f9153801so18784635b3a.1
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 18:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695864383; x=1696469183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofbQlFG7DfY6BCrLZ0NPamX51zA/0IQOtNdVPXeHaqE=;
        b=CIHWuOhQcvB5aDh9A9siGIg0Tr4nXqTQqIVkqyX6MTjr19IGNMxdWqVwZ8e2a0be3C
         TTK9Ecjs7o7iG3ppLBnpFt3G30m5JXDpgnMJDrFtoB9KBQnneLVAaojmcDVSc2gNr+0n
         CCQTIfYBXT0MoI2HjangVOIEwzfAep3IMgJtKUj3mfw5Kaa24LzLbt+acKW1as1CVXaA
         kSf9d3GtFiFAeZYeH2wPYiCcg5KNceBrXC2iXMwMuAmx/R7+C0+b+lNEsgb8CiHUqzAm
         jX6VHeTYxNG0ZNNKoyZMBm78QtTCFrC5Vfp/XOn3YbPgA6BNH/jrAPA3uyVXurEfDdgD
         CptQ==
X-Gm-Message-State: AOJu0Yxn/n+FmEwbkY/eherTLWpGo/Y0xmiGNNDXYX2hR0HcveTokRD9
	pd2KYJPALzeKhfc4LwiuHOXZ1OS5vpdeM/i2Z8raGYeHLcyhBQLKFBEOygsd0yNohGNVlIMmCCn
	20Giw1yGEJKCeVDCU
X-Received: by 2002:a05:6a21:4982:b0:15d:7767:6553 with SMTP id ax2-20020a056a21498200b0015d77676553mr3411409pzc.35.1695864383282;
        Wed, 27 Sep 2023 18:26:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:4982:b0:15d:7767:6553 with SMTP id ax2-20020a056a21498200b0015d77676553mr3411385pzc.35.1695864382901;
        Wed, 27 Sep 2023 18:26:22 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id g11-20020a170902868b00b001c22292ad7esm2378560plo.232.2023.09.27.18.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 18:26:22 -0700 (PDT)
Message-ID: <26f2a18a-4315-443f-560a-c4f007434206@redhat.com>
Date: Thu, 28 Sep 2023 11:26:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 16/37] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-17-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-17-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: S7DXK8FbEkz9

On 9/26/23 20:04, Salil Mehta wrote:
> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is based on
> PCI and is IO port based and hence existing cpus AML code assumes _CRS objects
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                           . The existing AML code assumes _CRS object
> would evaluate to a system resource which describes IO Port address. But on ARM
   ^^^^^^^^^^^^^^^^^^^
   is evaluated to a
   
> arch CPUs control device(\\_SB.PRES) register interface is memory-mapped hence
> _CRS object should evaluate to system resource which describes memory-mapped
               ^^^^^^
               should be evaluated
> base address.
> 
> This cpus AML code change updates the existing inerface of the build cpus AML
> function to accept both IO/MEMORY type regions and update the _CRS object
> correspondingly.
> 
> NOTE: Beside above CPU scan shall be triggered when OSPM evaluates _EVT method
>        part of the GED framework which is covered in subsequent patch.
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/cpu.c         | 23 ++++++++++++++++-------
>   hw/i386/acpi-build.c  |  2 +-
>   include/hw/acpi/cpu.h |  5 +++--
>   3 files changed, 20 insertions(+), 10 deletions(-)
> 

I guess the commit log can be simplified to:

The CPU hotplug register block is declared as a IO region on x86, or a memory
region on arm64 in build_cpus_aml(), as part of the generic container device
(\\_SB.PCI0 or \\_SB.PRES).

Adapt build_cpus_aml() so that IO region and memory region can be handled
in the mean while.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index d5ba37b209..232720992d 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -341,9 +341,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
>   #define CPU_FW_EJECT_EVENT "CEJF"
>   
>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> -                    hwaddr io_base,
> +                    hwaddr base_addr,
>                       const char *res_root,
> -                    const char *event_handler_method)
> +                    const char *event_handler_method,
> +                    AmlRegionSpace rs)
>   {
>       Aml *ifctx;
>       Aml *field;
> @@ -370,13 +371,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
>   
>           crs = aml_resource_template();
> -        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
> +        if (rs == AML_SYSTEM_IO) {
> +            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr, 1,
>                                  ACPI_CPU_HOTPLUG_REG_LEN));
> +        } else {
> +            aml_append(crs, aml_memory32_fixed(base_addr,
> +                               ACPI_CPU_HOTPLUG_REG_LEN, AML_READ_WRITE));
> +        }
> +
>           aml_append(cpu_ctrl_dev, aml_name_decl("_CRS", crs));
>   
>           /* declare CPU hotplug MMIO region with related access fields */
>           aml_append(cpu_ctrl_dev,
> -            aml_operation_region("PRST", AML_SYSTEM_IO, aml_int(io_base),
> +            aml_operation_region("PRST", rs, aml_int(base_addr),
>                                    ACPI_CPU_HOTPLUG_REG_LEN));
>   
>           field = aml_field("PRST", AML_BYTE_ACC, AML_NOLOCK,
> @@ -702,9 +709,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>       aml_append(sb_scope, cpus_dev);
>       aml_append(table, sb_scope);
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
>       g_free(cphp_res_path);
>   }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index bb12b0ad43..560f108d38 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1550,7 +1550,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>               .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>           };
>           build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> -                       "\\_SB.PCI0", "\\_GPE._E02");
> +                       "\\_SB.PCI0", "\\_GPE._E02", AML_SYSTEM_IO);
>       }
>   
>       if (pcms->memhp_io_base && nr_mem) {
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 999caaf510..b87ebfdf4b 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -56,9 +56,10 @@ typedef struct CPUHotplugFeatures {
>   } CPUHotplugFeatures;
>   
>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> -                    hwaddr io_base,
> +                    hwaddr base_addr,
>                       const char *res_root,
> -                    const char *event_handler_method);
> +                    const char *event_handler_method,
> +                    AmlRegionSpace rs);
>   
>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
>   

Thanks,
Gavin
