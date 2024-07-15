Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2255852nji;
        Mon, 15 Jul 2024 06:39:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXto+T0CuY3QV/OsnSFedu6a3llcQnnwXyeDPa9US+Or7eV3tE2aiGXpD7gYvIs0QdTIC8ZGjA4kn+KMQ7TLSuCDgFjREV8
X-Google-Smtp-Source: AGHT+IEGyXWa+QADEpQucpT7nUjokn76B7SnpqHnrET5vDDR8eFLNZ4BNeKDPLv1omvc0yUvVaRc
X-Received: by 2002:a05:620a:4114:b0:79f:5d5:1bc1 with SMTP id af79cd13be357-79f19bdffabmr2612652085a.58.1721050768499;
        Mon, 15 Jul 2024 06:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721050768; cv=none;
        d=google.com; s=arc-20160816;
        b=yhpCr8kBipnbIkz74nJ2ZgVFDpGNMBzYadcgAlTaw2FkWfj1h2EATwdHcrSMFtoW7c
         Q61eO1JmN9kHnAYzI/wYqiO33YkoPWJsxND1ze6Sen4T2E5Kil5MvSnH7ReK7TdPjIZB
         geIkC6oM/QznpT5vLd0D+EtIniQbS1VxHjr/jBgS1Ms1j1g24hw058SQlhrrb/lt3qt+
         wMf1hmGiJ3y8dlurQR39dCxSUzDbBAnSbwcAr8upJWbe62qwqPzWqce/SCqZ+QNAtv65
         X+nCXlaSUatCQYe8rj5dhtrdAuNsL5wKCTAH+6lYga/tTyIgkCYWFjDnWNE9jQglZuIz
         4V/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=EBtjuDMSwuw3nJB8kbux1qyAWsDSE9RGuyeX6JuknmI=;
        fh=mS5M/5XZIdnkcrWVhBXUAxPgd8VKpqZ8mIHkn185HNI=;
        b=ofvILIBEI6EEvxgDImGtmc/pbgAqIBQcbOEdjcWluoFT0zUrSiO/Ask1fako88i+6g
         Dwsni/EMNrpR5SnoW/Fi0Coy00cQxFLR10mbkSHS6+qwx4J+AF5Mr16gQnBw/z1uErDg
         NV3HAFMN46qIrnIxglLmMfHXRkHMMyTmCa+GYW8H6a2gVcyMJy77VDs4sCc4n/rlt00a
         zulEqVecZG8pBWurMg0WhSHFVWmeXjywJw0GxVWScKbpB93grgm/VgmtMJ8RlAZr3DeH
         QzePUaPXo0TlbTzWri3ItKjimFe977vzwUxI4kJ3DzEMDpXAIou8Z+mnAEz4PFv9gFI6
         TbwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c785Dx0b;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c8e882si492203385a.707.2024.07.15.06.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c785Dx0b;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721050768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBtjuDMSwuw3nJB8kbux1qyAWsDSE9RGuyeX6JuknmI=;
	b=c785Dx0bpM/mH94lbmPItLolnepZp3DK3pL7WLmE8UXfQyn6am106yOekXl2AWWmg1KwW0
	2meRehNIUzYBUrG59D0zDMuyUlzyAzKoTZpER6xUb7seNRTabeYd0X1f9/ja3C3Xpc7gDc
	f/0AN5SeeWwQUwGjJTpFrvqjPeGLN4E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-f1Gvcw_7MeeGBph0-Q6M5w-1; Mon, 15 Jul 2024 09:39:26 -0400
X-MC-Unique: f1Gvcw_7MeeGBph0-Q6M5w-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-367988464ceso3874968f8f.2
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 06:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721050766; x=1721655566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBtjuDMSwuw3nJB8kbux1qyAWsDSE9RGuyeX6JuknmI=;
        b=MQFBd5AJT+pbTf0XrxOOgbxK3PLT5wbXWCX/HdOuKj9UhTqYqGpp8sPUUtNsm4Hal/
         nocAFaIPt2D6fIBPWo/8xZ5N12fr3zjk87JI5M2TtqeMLyWdDShkbExPr8+ekS2Z3cI6
         9MuwDNjVE8s6aoFDl+RLJTDDMjKbbs7V2bSFg0Qh4ugItpX+4RFrp3hxEQe/LCvjOhDI
         aDZl+UFsA8uwBHUuk4d/+FPiLVu0bycinvEdyQD4WC7jGUEqLMq7SNSYcNbwBjSD0Hic
         1B8rsA+Nm3+JyUVFuhsCE5yCJMWrgNLZ3UAWQBTCfksqcatPDfxZKzycRYBnaDEjsSa5
         QOTA==
X-Forwarded-Encrypted: i=1; AJvYcCWIRrcc/1ne3gAU30WMBMM6PscZFl4DArVCOEjkYJR/nfS/tR8Qw/SyQsvfPAvcHgT9gUeb32NRO1d0IqOcEI4vs5o2Urdm
X-Gm-Message-State: AOJu0YyVZ+LGV0AsLh80Zou44iI8wd/wKmRSZVLWqDkIFcRSKsd71B5N
	zNSERJRPR1haMIX8+cxS8P11IR2QCt22htJb1HBS43u/kUmwjGEdG6zNrUDzVc9g+2TM3BeMcES
	kiWe3Au7Mrt5epBbZtAI26QRHe3ZG0LUsiqj+EjyDIey3f6arJ9qecQ==
X-Received: by 2002:adf:e683:0:b0:367:8fc3:a25f with SMTP id ffacd0b85a97d-367cea96453mr15464593f8f.37.1721050765830;
        Mon, 15 Jul 2024 06:39:25 -0700 (PDT)
X-Received: by 2002:adf:e683:0:b0:367:8fc3:a25f with SMTP id ffacd0b85a97d-367cea96453mr15464550f8f.37.1721050765359;
        Mon, 15 Jul 2024 06:39:25 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafb939sm6451539f8f.89.2024.07.15.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:39:24 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:39:23 +0200
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
Subject: Re: [PATCH V15 5/7] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Message-ID: <20240715153923.60f9a2f1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240713182516.1457-6-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
	<20240713182516.1457-6-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: QkBmUgWdoyOC

On Sat, 13 Jul 2024 19:25:14 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is IO port
> based and existing CPUs AML code assumes _CRS objects would evaluate to a system
> resource which describes IO Port address. But on ARM arch CPUs control
> device(\\_SB.PRES) register interface is memory-mapped hence _CRS object should
> evaluate to system resource which describes memory-mapped base address. Update
> build CPUs AML function to accept both IO/MEMORY region spaces and accordingly
> update the _CRS object.
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

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/cpu.c         | 17 +++++++++++++----
>  hw/i386/acpi-build.c  |  3 ++-
>  include/hw/acpi/cpu.h |  5 +++--
>  3 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index cf5e9183e4..5cb60ca8bc 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -338,9 +338,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
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
> @@ -364,14 +365,22 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>              aml_name_decl("_UID", aml_string("CPU Hotplug resources")));
>          aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
>  
> +        assert((rs == AML_SYSTEM_IO) || (rs == AML_SYSTEM_MEMORY));
> +
>          crs = aml_resource_template();
> -        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
> +        if (rs == AML_SYSTEM_IO) {
> +            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr, 1,
>                                 ACPI_CPU_HOTPLUG_REG_LEN));
> +        } else if (rs == AML_SYSTEM_MEMORY) {
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
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f4e366f64f..5d4bd2b710 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1536,7 +1536,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
> index df87b15997..32654dc274 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -63,9 +63,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
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
