Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1789877njb;
        Sat, 6 Jul 2024 07:35:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5hHwJEzuPH7b/qDnkHGTW7zlojSwfU6P1jPq4zbbmSelae6rfQP96eNpDSo64QrSIxtUFr1PstASgG7x1BT+nvaGFoEtP
X-Google-Smtp-Source: AGHT+IHecCzchduJStWo8k9cLvV/r3QFmj5ObTcdZ1dkZMoOuuBmA4oIV+IHwE09Z+2LBUwEXhrx
X-Received: by 2002:a05:690c:d0b:b0:609:efe8:2bfc with SMTP id 00721157ae682-652d5fefa52mr80119007b3.27.1720276531411;
        Sat, 06 Jul 2024 07:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720276531; cv=none;
        d=google.com; s=arc-20160816;
        b=UTxXjvANN7Z+5zWPcgodjHqqIbKolamHry5t3MLB2ru59TwkJ9Ixcph5/U6cVTZBB9
         8DCV/yJiwylR30vNviRNqXmu3mwbK+mVA8l6mYf2ceDhpVa748oMSqI25oc1gjpNt2m2
         eLitgosKh5LLAqVivhViczoV6L46Pkz0yQUGn0H94JpETcqZZEF77HWn9WOAEAglVB8W
         /yuRqcgAWPsTqL3aqftVfxEdgnXImGlJN52bsJS4mhc0bVutTT4sDDJupA3Rj1JUlc3a
         n/LATT4feoGDZbyDSfkI7uZsKJIutW+fUzMsEN1gQYvu4mth5zwzLIWumcveX8YQSp7Q
         KCfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=H7ZDVMJB6mbHb0NzR0PiU6PX/ITdG+OKHh2qw/xAKpw=;
        fh=CLlhX29K8S5Y3pOKIUoN9YnLj9vQTJwsMmf8A5w7zGk=;
        b=mI6BwKxpnLwdRiQPCi/cB+gCYCFujBOQ4fPU54UW4nEpM5chbsvQQ4GlXt7dmUexMN
         WTh9knFXUOTnVUx7zAOERz/dgazw8YsCLJVl6jjIHVWQHDEm4kfKeRV6nTWSTJCaQo5o
         sy6jBl4v4YEceRACC7TDkAPNzxw7bZm95ogUI0EJMB1y65NDSb9IZJDbgbHwfbD05BQF
         mjL/zTM53EsZFWCwNn2yCrJU6UUhFQWoFmWjVdfdDBEq3XQE8SysfARAsJzJCCuxa1/0
         8hz5HJWVLLFu1AOUHyapyn5mdF1QmwZq8RhQsLDBQaU0X7i6Oi9kgW9K9liTlE4MNW34
         uA7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XN87bpoo;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-446780ae7fcsi140110591cf.42.2024.07.06.07.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:35:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XN87bpoo;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720276531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7ZDVMJB6mbHb0NzR0PiU6PX/ITdG+OKHh2qw/xAKpw=;
	b=XN87bpooX4IDLo7NtPL9poOsfC/H947QyrKHC39g4QPzCvM18ODIOZZ8zs6GBtaDyxvM8g
	3xtjkZWbcZ7T3gPdwSMjkEo944rIGF8ShuRBqo4xR/RyeIKPzgzNjWSK1UKcCRwpiM7MiP
	kkJ00rPJ2w9qE8iaEk997OpP4cYv288=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-yOQsbmSHMjGFu58hFAsV7Q-1; Sat, 06 Jul 2024 10:35:27 -0400
X-MC-Unique: yOQsbmSHMjGFu58hFAsV7Q-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3679aa0ee0aso1627884f8f.2
        for <alex.bennee@linaro.org>; Sat, 06 Jul 2024 07:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720276526; x=1720881326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7ZDVMJB6mbHb0NzR0PiU6PX/ITdG+OKHh2qw/xAKpw=;
        b=kXg2J3fM+2Hs0MfCby5sEtOc7PQ9dTE/qSC0n+ag+ABNErcnY8hFOCwLom6HLDRS1V
         QVAsWxuzexaneFDk22cf/ymBXxBCBjVBNarg/yI7we9vES7osYvf/0Lw5JxMncoplT/Q
         xo+zvxDH6Al1qFPkJJv/JOWAnCiqzBSS3VbNCEz+76HzdwFwxgOeJqQDcGus9lvwa1Od
         zokvPkrc8FkA9qCCpQ6vzZzX9S0qsmHWwntvYeb3+Ef9Mn7sMOsyaYWMniFjXQOvURYu
         TbBn5Cf5vHIP92Gxf/j2EXMR1LBNT0BJq96xsyXYDubCTgKAgbp+GnzvOrlt/jNUhtQH
         /7SA==
X-Forwarded-Encrypted: i=1; AJvYcCX0Z3t93z++APiyXoFRpHaWUQBPF1wq2E5OWJxemghzW9lz6EFuAfr+wRuE45aU5tqHRc6JdpTS31XQB1SuIq1dHyz6s2At
X-Gm-Message-State: AOJu0YwkSmvP8D9BepERxOGzSzXdq0eIZv17NJXtHSdvU+hLrbaFefUH
	S7cy6LVO0iaD2nZcjddM9lU4+XVy6mcx7sXOiV6nH4bhEbYZgVpp5PCPsAjPywuHFhxfTkvU+gI
	6+npIHzuNaCZaWrqSKlUtvcZoBvTyshsVmluLPUYJXFuWi+iMRq3A4w==
X-Received: by 2002:a05:6000:c0b:b0:367:997b:21ed with SMTP id ffacd0b85a97d-3679dd329e5mr4238900f8f.42.1720276526519;
        Sat, 06 Jul 2024 07:35:26 -0700 (PDT)
X-Received: by 2002:a05:6000:c0b:b0:367:997b:21ed with SMTP id ffacd0b85a97d-3679dd329e5mr4238866f8f.42.1720276526131;
        Sat, 06 Jul 2024 07:35:26 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36796351169sm8414124f8f.95.2024.07.06.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:35:25 -0700 (PDT)
Date: Sat, 6 Jul 2024 16:35:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 5/8] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Message-ID: <20240706163524.012b6caf@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240607115649.214622-6-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-6-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: ZbCaXU3IePb5

On Fri, 7 Jun 2024 12:56:46 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is IO port
> based and existing CPUs AML code assumes _CRS objects would evaluate to a system
> resource which describes IO Port address. But on ARM arch CPUs control
> device(\\_SB.PRES) register interface is memory-mapped hence _CRS object should
> evaluate to system resource which describes memory-mapped base address. Update
> build CPUs AML function to accept both IO/MEMORY region spaces and accordingly
> update the _CRS object.
ack for above change


but below part is one too many different changes withing 1 patch.
anyways, GPE part probably won't be needed if you follow suggestion made
on previous patch.
 
> On x86, CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) event handler to
> notify OSPM about any CPU hot(un)plug events. Latest CPU Hotplug is based on
> ACPI Generic Event Device framework and uses ACPI GED device for the same. Not
> all architectures support GPE based CPU Hotplug event handler. Hence, make AML
> for GPE.2 event handler conditional.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/acpi/cpu.c         | 23 ++++++++++++++++-------
>  hw/i386/acpi-build.c  |  3 ++-
>  include/hw/acpi/cpu.h |  5 +++--
>  3 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index af2b6655d2..4c63514b16 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -343,9 +343,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
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
> @@ -370,13 +371,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
>  
>          crs = aml_resource_template();
> -        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
> +        if (rs == AML_SYSTEM_IO) {
> +            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr, 1,
>                                 ACPI_CPU_HOTPLUG_REG_LEN));
> +        } else {

else
 if (rs == yours type)
> +            aml_append(crs, aml_memory32_fixed(base_addr,
> +                               ACPI_CPU_HOTPLUG_REG_LEN, AML_READ_WRITE));
> +        }
else assert on not supported input

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
> @@ -700,9 +707,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
> index 53f804ac16..b73b136605 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1537,7 +1537,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
> index e6e1a9ef59..48cded697c 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -61,9 +61,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
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
