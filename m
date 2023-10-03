Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1645098ejb;
        Mon, 2 Oct 2023 17:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyiK+c9wDClV0uaA5cpewGv+XJkH4lWwhsZSHQZPGL8S+5oEd92tq1oO0M9wmqp1HxW12Y
X-Received: by 2002:a25:8545:0:b0:d89:4e0f:114c with SMTP id f5-20020a258545000000b00d894e0f114cmr11613541ybn.59.1696291766807;
        Mon, 02 Oct 2023 17:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696291766; cv=none;
        d=google.com; s=arc-20160816;
        b=EuOvVM0qnQO21n4gyn7jo/z0AVa1Y7Uzgq5tU2b1BMPzzdkPvCiIk6e9vdhggxz8BJ
         EwcFiwvMOT/YxklnNubP22s9Yvv7WhW98VS/zq+qZsEYOONdpsntvosbNU7prr2AL3Yn
         F//zScmMoErp90MLVD0z8TMJq5toGjfwd7ElAtBdeoPOLSWDog6qPJ2leqGmOEgSTNiG
         hR2dqBNuIvqLt+7rSBIsm+gV4LWdvhJKAYuCrO0lGoajV2/7Pmh8YJEI/D+YXVd4EcOY
         HodestS72otAbcn3I98J3uy33b++fAhGUmrZLFuONd6jBSdBNFn+FJYH4wlyTEkOzIBB
         DMZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qQ1f52MB4V11uTw9Tw6mw2QM2E2dQmC4sFW/qlXJ8tA=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=Tp/cDfNkXCRYVIKfizRXYAVAnI4OyBH4t3FCM/7U8jANrHe7DGNe2SN09jrid+lhVD
         M0I/CzjaLEiHKquHFqPc5kDRfrAuhIOGZE6eZNxRiQ9Lc9xHgYL3ZDvQgth2S/0CQ7+U
         UeXPbEWxaLhjqfI4+y7TMM6HLRcvxcqGFBKcHwiJhP58K3vodCzwwgIgybDr6dQd57sy
         dUQNX2+lq6pCKYCM2hZImUEhBlvTuvmmFZAzOYIYT1jxrXN1T6iEf7lyvzYzB9CZmfA7
         VX/oZUectafic3VbwZpfpxA8s0TSc0/8TySJG7ipXMZ4mkUKWcyN1j2ll7VeGqlyJ7XJ
         28rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hf14qFo8;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e78-20020a25d351000000b00d7fd6a7d57esi51059ybf.625.2023.10.02.17.09.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 17:09:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hf14qFo8;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696291766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQ1f52MB4V11uTw9Tw6mw2QM2E2dQmC4sFW/qlXJ8tA=;
	b=Hf14qFo8fwlrztFskp7gGwPq/aK897lRGS+kYKe7ASCfY4vUsy8JRlS854s1/vC1Rp37DZ
	GVRHw69rS2aEhJlZc1YlHEyPzS8VyTtCwPwP3kIBfCUUnx7LYIwzNFg41ClokDbC4j4mbZ
	CVln8cTAEdbEwum5qHFLSUK+P0+RQE4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-EnWOJNv0ML2BG0HbKBWgtw-1; Mon, 02 Oct 2023 20:09:20 -0400
X-MC-Unique: EnWOJNv0ML2BG0HbKBWgtw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-27745c2f5d0so348398a91.2
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 17:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696291759; x=1696896559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ1f52MB4V11uTw9Tw6mw2QM2E2dQmC4sFW/qlXJ8tA=;
        b=ot6niHG9n84h3vfDNdZ1oKhbujshOxCjUYNFb2NLBBFeLJo8k45I2USrUyLvsO2JaF
         k55zK5JcvcMAD3LJ1m0w4f7ywWe60Tx1bvRQkt0x6cJsk0jKOiRBvpt25TJjA3jx/LKR
         HKjSmeCxhhPNaU56Z7q1ZXXrSEI1HmBLwqPQJrX/WmXeWwQmFifxkKICOaTUj7P2g8N7
         VmETqg7+KFMFtahlZak7DYxamEPaErAcnfTrD4vgKBL9/UFkC1Uv/A7TrkKNc5IeSJGk
         Gwn790EvPuHJaegE0GeFqjPCwifmfLkhyWBjkGe848gu0y1x0BUhoxkXEXWCSIdgsHy0
         Ui2g==
X-Gm-Message-State: AOJu0YyapyUYmLPnATJWRWnbSVlBLHKcaW9FnWiRV/WTSXwm3aXrKI5f
	qznZftBHiFrgxmaa6nAhZLuwuIWhb2cCF71B4nJ/eQz9CwlPfaf1/Kv/2rOiVw2v6l9aFvvADNn
	9KD9Bt1fkpbs11drc
X-Received: by 2002:a17:90b:906:b0:26f:d6f4:9646 with SMTP id bo6-20020a17090b090600b0026fd6f49646mr10349309pjb.40.1696291759011;
        Mon, 02 Oct 2023 17:09:19 -0700 (PDT)
X-Received: by 2002:a17:90b:906:b0:26f:d6f4:9646 with SMTP id bo6-20020a17090b090600b0026fd6f49646mr10349277pjb.40.1696291758668;
        Mon, 02 Oct 2023 17:09:18 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id 24-20020a17090a19d800b002775f7dbd7esm49098pjj.49.2023.10.02.17.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 17:09:18 -0700 (PDT)
Message-ID: <5dc18701-973b-bd1c-8704-479ea67a7be8@redhat.com>
Date: Tue, 3 Oct 2023 10:09:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 05/10] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-6-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-6-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: cwfjEO4JCIg7

On 9/30/23 10:19, Salil Mehta wrote:
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
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/cpu.c         | 23 ++++++++++++++++-------
>   hw/i386/acpi-build.c  |  2 +-
>   include/hw/acpi/cpu.h |  5 +++--
>   3 files changed, 20 insertions(+), 10 deletions(-)
> 

With commit log improved to address Jonathan's comments why @event_handler_method
won't be needed on aarch64:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 45defdc0e2..66a71660ec 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -338,9 +338,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
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
> @@ -367,13 +368,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
> @@ -699,9 +706,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
> index 4d2d40bab5..611d3d044d 100644
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
