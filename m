Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp1979332ejb;
        Sun, 12 May 2024 23:31:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuzUhUvYnYFc+IHOSB5vmMdoZOOiqcrWyY+2PtrP8n7uRDJJXIlJF43DKoGIF88LFnSIFbrkHj2wCTm8iFbHtksGWliTCL
X-Google-Smtp-Source: AGHT+IFu6yRB7/buDYCmbCpO7+yRwdvFUnydEBLCIMOowuiO9CloKpeHNZKAFbgCZyewl4P+Acaq
X-Received: by 2002:a05:620a:2702:b0:792:dbc4:23b6 with SMTP id af79cd13be357-792dbc424e7mr404385985a.22.1715581901948;
        Sun, 12 May 2024 23:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715581901; cv=none;
        d=google.com; s=arc-20160816;
        b=M+qyaHnj8oktX80UkJATIBTMZZYJtaIqpDC2Q09Va5gB17lUnSvhjuldFZLkF5sHNY
         pxvWLXKK31np57MSR1nv3dY54yEcXBHUPXp6PBZ0l8I9nLtwRYbswGH2+NArEQpiE/l3
         s+upQgYfPi//KGPiImJ+7dNYD00LcWkWMARowlF//1PXxhc2CiytdAW8UdQuccoddd5N
         Bk0LS562SZ5K9ypuvlSG8EwzsI5Y3CJ0S8lQdk6z0ZhEz/EsMFl6Dy1UUcn+Sip5Yvlf
         9v35VAjZ1skNiUFtMptTfK5rQJa+chnYYWZu7ewJpzp5W2UFMpvfFXasOVesgx560fX9
         9MZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=797dreJwwtDvwa5S8exMLXc4FHv7MqN20AnCWFX1jsY=;
        fh=FOEmvu7qu4LIJ8F3F4wZeuj3vpKfW3xCo5wUFBXhEtk=;
        b=xlqGu2COPjgQLlb72e61Cck+TErHLOWTH/b56VXgU7oGFts+BnProHZKdHtteh3T3v
         UXVBmAh5PjxWQLKhpc1nG1VLBDxIeTVCQDBeNvuWv63h0C8VV5wJMm0Rnx+IjAHRqQih
         3O3dyouGEpOfno9le7IlXzxqsdxySv81p8A8w8voIZkfaym2pUT/LU5tKD+7d/tJLzE1
         k+bwa6qRdzEvRADueziGCsHxj1alqJgvr8+Q50priEoSoqICmeutooVmYrdmHAHUHsuz
         QqbIHXhtl2kvxGLcPG4hm1Vg4IAs0ZjwAcPQrNF6tTxumosOqF1pfYbQoxLxMO66dwz/
         /t6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NKJczLLw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf364ff1si867584085a.614.2024.05.12.23.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 May 2024 23:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NKJczLLw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6PDd-0006Cn-SJ; Mon, 13 May 2024 02:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s6PDc-00068d-90
 for qemu-arm@nongnu.org; Mon, 13 May 2024 02:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s6PDM-0003pV-Qj
 for qemu-arm@nongnu.org; Mon, 13 May 2024 02:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715581870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=797dreJwwtDvwa5S8exMLXc4FHv7MqN20AnCWFX1jsY=;
 b=NKJczLLwMyB30lXVVCrAqdK150X4ekVW+KozHFcRHS2Fz9yiW794b27B7e4Imi26Xce75N
 ZXhm+v5V4GPUm6N73fJd6ddLHKbtn2BADo+JmlNaEjgscKHRSFycw2NBXKixmm5eh9ZkJg
 bp1AKe++sj0bKu5V3f7BstvqrKT7LLk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-cAJahWtAMtikLbyl3cbw4w-1; Mon, 13 May 2024 02:31:09 -0400
X-MC-Unique: cAJahWtAMtikLbyl3cbw4w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a59c942611bso235428966b.0
 for <qemu-arm@nongnu.org>; Sun, 12 May 2024 23:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715581868; x=1716186668;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=797dreJwwtDvwa5S8exMLXc4FHv7MqN20AnCWFX1jsY=;
 b=lXQcabJVf4Vm2pq1h+lbbaCGGj4lqDcwUG/o+YvCHkcAySfYOeeh9nSB78bTqYuihj
 Kry1XS8sBKQsSUAygASjZLkHuZ3UhumnpJSC+Tavb06uo33XYI6LwVGcuxYukPJCeKsR
 fpLWAE3yv1OyvH+wIezVFEDzKjqrlvo+I+pnkijOOvPvGzqFPi1Zpw9P5/mZsm2I9UX2
 39rot6QP1LMwR12QJfLiFig9b9fVQyNJIIxE11Pw1G8ZO6jwpoJqXqhtP/8ke129xcWX
 eT33VxgTFrHIXKXhqr0m4Fhx4tkOu4Yo7zEj2VUkNvDMMLrfXcIraY9mRLu4UhD71JDq
 HTwg==
X-Gm-Message-State: AOJu0YywkcO8NNvZsAAvSuBsSXHxOHn4Lmazipj2DKhvQblMEM0VLsb1
 qmWeuJriTx+YtY3AZSt/d1tRnlt5wGtOql2VHgvHRAzUz8v23SCus8bS4g2fxed69BVphxeFWyk
 nWAOpI7stZUmXpeEPM0GNGs2r7QvBq1C7khMPha5kAx0HVmsZgQ==
X-Received: by 2002:a17:906:3183:b0:a59:b784:ced4 with SMTP id
 a640c23a62f3a-a5a2d67873fmr583205866b.75.1715581867816; 
 Sun, 12 May 2024 23:31:07 -0700 (PDT)
X-Received: by 2002:a17:906:3183:b0:a59:b784:ced4 with SMTP id
 a640c23a62f3a-a5a2d67873fmr583203966b.75.1715581867265; 
 Sun, 12 May 2024 23:31:07 -0700 (PDT)
Received: from redhat.com ([31.187.78.170]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b0173asm557451066b.179.2024.05.12.23.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 23:31:06 -0700 (PDT)
Date: Mon, 13 May 2024 02:31:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v2 2/3] hw/acpi: Upgrade ACPI SPCR table to support SPCR
 table version 4 format
Message-ID: <20240513023035-mutt-send-email-mst@kernel.org>
References: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
 <20240507052212.291137-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240507052212.291137-3-jeeheng.sia@starfivetech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BqJlTzqReman

On Mon, May 06, 2024 at 10:22:11PM -0700, Sia Jee Heng wrote:
> Update the SPCR table to accommodate the SPCR Table version 4 [1].
> The SPCR table has been modified to adhere to the version 4 format [2].
> 
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>

What does this achieve? We don't normally change unless it gets
us some useful feature.


> ---
>  hw/acpi/aml-build.c         | 14 +++++++++++---
>  hw/arm/virt-acpi-build.c    | 10 ++++++++--
>  hw/riscv/virt-acpi-build.c  | 12 +++++++++---
>  include/hw/acpi/acpi-defs.h |  7 +++++--
>  include/hw/acpi/aml-build.h |  2 +-
>  5 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 6d4517cfbe..7c43573eef 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1996,7 +1996,7 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>  
>  void build_spcr(GArray *table_data, BIOSLinker *linker,
>                  const AcpiSpcrData *f, const uint8_t rev,
> -                const char *oem_id, const char *oem_table_id)
> +                const char *oem_id, const char *oem_table_id, const char *name)
>  {
>      AcpiTable table = { .sig = "SPCR", .rev = rev, .oem_id = oem_id,
>                          .oem_table_id = oem_table_id };
> @@ -2042,8 +2042,16 @@ void build_spcr(GArray *table_data, BIOSLinker *linker,
>      build_append_int_noprefix(table_data, f->pci_flags, 4);
>      /* PCI Segment */
>      build_append_int_noprefix(table_data, f->pci_segment, 1);
> -    /* Reserved */
> -    build_append_int_noprefix(table_data, 0, 4);
> +    /* UartClkFreq */
> +    build_append_int_noprefix(table_data, f->uart_clk_freq, 4);
> +    /* PreciseBaudrate */
> +    build_append_int_noprefix(table_data, f->precise_baudrate, 4);
> +    /* NameSpaceStringLength */
> +    build_append_int_noprefix(table_data, f->namespace_string_length, 2);
> +    /* NameSpaceStringOffset */
> +    build_append_int_noprefix(table_data, f->namespace_string_offset, 2);
> +    /* NamespaceString[] */
> +    g_array_append_vals(table_data, name, f->namespace_string_length);
>  
>      acpi_table_end(linker, &table);
>  }
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6a1bde61ce..cb345e8659 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -428,11 +428,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>  /*
>   * Serial Port Console Redirection Table (SPCR)
> - * Rev: 1.07
> + * Rev: 1.10
>   */
>  static void
>  spcr_setup(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> +    const char name[] = ".";
>      AcpiSpcrData serial = {
>          .interface_type = 3,       /* ARM PL011 UART */
>          .base_addr.id = AML_AS_SYSTEM_MEMORY,
> @@ -456,9 +457,14 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          .pci_function = 0,
>          .pci_flags = 0,
>          .pci_segment = 0,
> +        .uart_clk_freq = 0,
> +        .precise_baudrate = 0,
> +        .namespace_string_length = sizeof(name),
> +        .namespace_string_offset = 88,
>      };
>  
> -    build_spcr(table_data, linker, &serial, 2, vms->oem_id, vms->oem_table_id);
> +    build_spcr(table_data, linker, &serial, 4, vms->oem_id, vms->oem_table_id,
> +               name);
>  }
>  
>  /*
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 0925528160..5fa3942491 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -176,14 +176,15 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>  
>  /*
>   * Serial Port Console Redirection Table (SPCR)
> - * Rev: 1.07
> + * Rev: 1.10
>   */
>  
>  static void
>  spcr_setup(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
>  {
> +    const char name[] = ".";
>      AcpiSpcrData serial = {
> -        .interface_type = 0,       /* 16550 compatible */
> +        .interface_type = 0x12,       /* 16550 compatible */
>          .base_addr.id = AML_AS_SYSTEM_MEMORY,
>          .base_addr.width = 32,
>          .base_addr.offset = 0,
> @@ -205,9 +206,14 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
>          .pci_function = 0,
>          .pci_flags = 0,
>          .pci_segment = 0,
> +        .uart_clk_freq = 0,
> +        .precise_baudrate = 0,
> +        .namespace_string_length = sizeof(name),
> +        .namespace_string_offset = 88,
>      };
>  
> -    build_spcr(table_data, linker, &serial, 2, s->oem_id, s->oem_table_id);
> +    build_spcr(table_data, linker, &serial, 4, s->oem_id, s->oem_table_id,
> +               name);
>  }
>  
>  /* RHCT Node[N] starts at offset 56 */
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 0e6e82b339..2e6e341998 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -112,7 +112,6 @@ typedef struct AcpiSpcrData {
>      uint8_t flow_control;
>      uint8_t terminal_type;
>      uint8_t language;
> -    uint8_t reserved1;
>      uint16_t pci_device_id;    /* Must be 0xffff if not PCI device */
>      uint16_t pci_vendor_id;    /* Must be 0xffff if not PCI device */
>      uint8_t pci_bus;
> @@ -120,7 +119,11 @@ typedef struct AcpiSpcrData {
>      uint8_t pci_function;
>      uint32_t pci_flags;
>      uint8_t pci_segment;
> -    uint32_t reserved2;
> +    uint32_t uart_clk_freq;
> +    uint32_t precise_baudrate;
> +    uint32_t namespace_string_length;
> +    uint32_t namespace_string_offset;
> +    char namespace_string[];
>  } AcpiSpcrData;
>  
>  #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index a3784155cb..68c0f2dbee 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -500,5 +500,5 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>  
>  void build_spcr(GArray *table_data, BIOSLinker *linker,
>                  const AcpiSpcrData *f, const uint8_t rev,
> -                const char *oem_id, const char *oem_table_id);
> +                const char *oem_id, const char *oem_table_id, const char *name);
>  #endif
> -- 
> 2.34.1

