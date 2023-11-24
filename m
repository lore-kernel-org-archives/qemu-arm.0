Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1369189ejj;
        Fri, 24 Nov 2023 09:04:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvkVxLqAq+HpNmkq1xFyxHfNFcJryaQDy+BOqKLqXJqLFBpuG8KHjU3Og9Mhkl8Nbp9Q7p
X-Received: by 2002:a05:620a:628d:b0:77d:7533:5c07 with SMTP id ov13-20020a05620a628d00b0077d75335c07mr4489098qkn.45.1700845494855;
        Fri, 24 Nov 2023 09:04:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700845494; cv=none;
        d=google.com; s=arc-20160816;
        b=YVLeX6Z6Asf42PiqP+GSngzavKsAI7wm6EDiuM03CFKcBwK5dqOZZnOZsQWYm+e9r7
         TnE7M238LsBKNQ0QFzjJiydK9tzHdooYV41daLD9Sd9R6MECRid5uNnbgCY3QuG+u4Y9
         mGqw3V4NgRk8eideJBYn6F2gDdJeclL2FktvJ6pVY+1htbWcXr5DCxtYJlZDFwMxy9yX
         ikUOgLv6itItT15kAwaOnt3DPDGEYBbKVOmt8oAvCaAr+nBB1gXMsMRCjTDbZnnY70WM
         rQvsAEt3z18U9WyDKxHzULpYYRplXuvvpMX+JS1f+pus/LyBFKBr9RjX30gJtVxaq4XP
         xdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=bV08Mg7zL7cwji3fZJdMQUEka/HT29wVQMTZBjTEI4s=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=GHT0hUF67G0Ncx6DRfluuCLiUftk3HNVRwAR+9K6m3LBSTNCbBp7nP0MEBfXsqFq2J
         KMNZdnNybR3+ntq9K2Op7clS46tiALly6No2Izl/fuOB1DWWs56U/OeKkeVLUB1iR/CU
         HK40y+RJj0gvkdnXZkFEgKN8j6UT8Xflkh8um3UYxTGxfteytXjxLy3QGyk8i02wgjFe
         eUrydTRXNRyvHmqac8b6xf0c5qag1O3yx34Q/+7tYhhk2m+iIm5yR+vo414GqkOj0Uvl
         2xyxAdHs+1i1poW+CRdyR3zEpyI1NirEouRCcpzHhyfxuf6GMn/MW3kSTUunh5mrU9vT
         YHIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EPo9FwP/";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x8-20020a05620a448800b007757464e7c7si3559652qkp.633.2023.11.24.09.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:04:54 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EPo9FwP/";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700845494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bV08Mg7zL7cwji3fZJdMQUEka/HT29wVQMTZBjTEI4s=;
	b=EPo9FwP/cgrncJJ8/tX4XWjFvLRtmOUTVwyl4T0DUO4Q4dyOAIrlZlwy29/ox4wI2FWq1M
	ydmYWoJmMxUTACkNeCeuchVOwqn6C/HreAfCETup0G/+Ajh5YoMs6GRXj2xbQSdroA098+
	dEN1JgT4GETNdotTEi9dK4Ogrm2RHsE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-PHizDj2AMV2HsZ2SQ0bBiA-1; Fri, 24 Nov 2023 12:04:53 -0500
X-MC-Unique: PHizDj2AMV2HsZ2SQ0bBiA-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6d7e8aa0133so1907442a34.3
        for <alex.bennee@linaro.org>; Fri, 24 Nov 2023 09:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845492; x=1701450292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV08Mg7zL7cwji3fZJdMQUEka/HT29wVQMTZBjTEI4s=;
        b=KScCB/MQmUChQBmZOmODrQhHnOILhTpw2FvjyaonJq70Kx8gylXU6tKS70Vhs7kBRl
         T3ePRzq4yeM5XeIlYVo4pP+8uBeojqRwQyeTimz+mgkyxkVOIn5uwc75BksgaLTX1crO
         fM3mNz7w/imGMa51xx0QUw02eo2Lpc7pb0C8nAhiyfmEbvt9byWls9SmLqsbFF4zontj
         s7R5zUqOal6R1vIsYZg8FMoc/tZcVhBU/E9WSZr8XsTeCaZFVdG6Zr4z9m8/3VuF6wLW
         jDDqpaTFvXrO2P/O5+7sXazq5tv/6Yd1ltPH16A5fP/9q1YOyG2GDxXzdnKKXRI5HDX5
         WgMg==
X-Gm-Message-State: AOJu0YxFxgjgBuBbP4/OdVQKAd7ZUUBt5Xn0CIrgj2yQzm6WIA0y+KBj
	GfrVR7cBGLNMSjEyRc5aCFwnqxALrCsG+KCx2XKLVqEV0OrtqPNJekFpqiaK3Qk/QyCHoXQaruN
	2LJ976dcWOR6qQxii
X-Received: by 2002:a05:6830:411d:b0:6d8:1ec:7845 with SMTP id w29-20020a056830411d00b006d801ec7845mr1890918ott.2.1700845492574;
        Fri, 24 Nov 2023 09:04:52 -0800 (PST)
X-Received: by 2002:a05:6830:411d:b0:6d8:1ec:7845 with SMTP id w29-20020a056830411d00b006d801ec7845mr1890861ott.2.1700845492248;
        Fri, 24 Nov 2023 09:04:52 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id qh6-20020a0562144c0600b0067a16d12a20sm630548qvb.86.2023.11.24.09.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:04:51 -0800 (PST)
Date: Fri, 24 Nov 2023 18:04:43 +0100
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
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V7 5/8] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Message-ID: <20231124180443.604d5f99@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231113201236.30668-6-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
	<20231113201236.30668-6-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: N9pRHza/Eieg

On Mon, 13 Nov 2023 20:12:33 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:


wrt subj: 'cpu-(ctrl)dev change' doesn't make any sense to me, pls rephrase and be more specific.

> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is IO port
> based and existing CPUs AML code assumes _CRS objects would evaluate to a system
> resource which describes IO Port address. But on ARM arch CPUs control
> device(\\_SB.PRES) register interface is memory-mapped hence _CRS object should
> evaluate to system resource which describes memory-mapped base address. Update
> build CPUs AML function to accept both IO/MEMORY region spaces and accordingly
> update the _CRS object.


> On x86, CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) event handler to
> notify OSPM about any CPU hot(un)plug events. Latest CPU Hotplug is based on
                                                ^^^ latest supported ATM is x86
and not based on GED vvvv, suggest to drop sentence or actually whole paragraph.

> ACPI Generic Event Device framework and uses ACPI GED device for the same. Not
> all architectures support GPE based CPU Hotplug event handler. Hence, make AML
> for GPE.2 event handler conditional.

this is the 2nd different thing the patch does, pls split that into another,
for more on that see related hunk.

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
> ---
>  hw/acpi/cpu.c         | 23 ++++++++++++++++-------
>  hw/i386/acpi-build.c  |  3 ++-
>  include/hw/acpi/cpu.h |  5 +++--
>  3 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index de1f9295dc..5b0eaad1c5 100644
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

indeed, injecting a method won't work with GED (and well it's hackish to begin with).
Suggest to get rid of it and make event source initiate the call to CPU_SCAN_METHOD.
Something like (similar to what you do in 4/8): (maybe make it part of 4/8)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 011d2c6c2d..ed35f2390f 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -341,7 +341,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
                     const char *res_root,
-                    const char *event_handler_method)
+                    )
 {
     Aml *ifctx;
     Aml *field;
@@ -696,9 +696,5 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
     aml_append(sb_scope, cpus_dev);
     aml_append(table, sb_scope);
 
-    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
-    aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
-    aml_append(table, method);
-
     g_free(cphp_res_path);
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 80db183b78..e740e402bf 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1856,6 +1856,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                 aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
             }
             aml_append(scope, method);

+            if (!pcmc->legacy_cpu_hotplug) {
...
+                aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
...
             }
         }
         aml_append(dsdt, scope);
     }


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
