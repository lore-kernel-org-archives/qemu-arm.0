Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp1953589ejb;
        Sun, 12 May 2024 22:16:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZ0lUIdwD3n/I8wOz+6OwDOv2Y3zhQZcsUqiLHJUixwOw/dfskUhYLZC9/1IF2Rx642p0btl0sy4N3zayImyAAFteZWzxe
X-Google-Smtp-Source: AGHT+IEYq2RArobv4D7qUfNNBVO+rVsr8SZ70ClheZ+vB0AftHoQ0ZPeuSheE/exBp1F7V49pHXB
X-Received: by 2002:a5b:5cc:0:b0:dbd:be40:2191 with SMTP id 3f1490d57ef6-dee4f3a9dc0mr7401564276.42.1715577414189;
        Sun, 12 May 2024 22:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715577414; cv=none;
        d=google.com; s=arc-20160816;
        b=zAwafhfP0HTjZkYI8fPPI7w/3gLhUcH6Wl5v+gNhGZjzjFZoOdcl/6azLrkZpsTN0k
         QvnXnYqZ1PyUfn+/Cu2PDWnWWy+IcTgf2jFtw3ulkbmM+neffKpJxYh5L/RjrSxWWatP
         2t4gBJ4DBPdJ3Dtv25PEgM8SNau44bdb3qaAPhH6W4Fq8HE6L6d1kv7d9dGfVupRzxLb
         RJ08GpKa58725Y2pvdDyScMWwPpb2SWgIbK9P7KmcyMYmfF+VpsfPrEVOSBRKYrBWzln
         ui69P4eL/QmDMUM0DQ76wYtwxZta0EPs/rQ+ntGqn68GsDCexkR9mhpDNrmBEBMOzTBG
         W46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=n2IOHQ65EfdwQczJm0hHK3bvEwyI09Ss5Cfek0liOFw=;
        fh=bd6JYs+zsWylHr8uUdIOK32CzPUgRjMqojZbfvqbqVY=;
        b=GbU90ojxzhHCU+dXWZxCnhgHQf+DHaVulQdZh8bjpsn8NlHigxPxncblCFZDZP4f4w
         p07wdpf9kzIPQ25LgXZLqlJZPlN1Vo3MjbrfESwL+EvOjMIR86wa05Vjpbje4R1Se60o
         yCzDX8WMM9eUKxTdYHMeULsf0T73wN45wi2dI54Abdcn2fAABKI5xliJXT4a4CnJsZGb
         yhPoNDXns77Ass9750aZrejFwN+gMic6GlKM5/6kuuePBs88QXAkJeF0c+LaNkXJp7Jw
         NtKF1x/Zj/3Xgcre7UYtR5ll1F8W2CqyVTKyaDyZzdmydZy/DSTeDjbDJf+9JQ2dUukL
         AoDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ejvKH2AU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f1d70fasi86056846d6.85.2024.05.12.22.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 May 2024 22:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ejvKH2AU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6O31-00052N-4g; Mon, 13 May 2024 01:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1s6O2z-00051q-Lu
 for qemu-arm@nongnu.org; Mon, 13 May 2024 01:16:26 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1s6O2v-0006f6-PF
 for qemu-arm@nongnu.org; Mon, 13 May 2024 01:16:25 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6f44a2d1e3dso3536543b3a.3
 for <qemu-arm@nongnu.org>; Sun, 12 May 2024 22:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1715577380; x=1716182180; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n2IOHQ65EfdwQczJm0hHK3bvEwyI09Ss5Cfek0liOFw=;
 b=ejvKH2AUzDYzK3EiWDUIzPoOFpv1G665Ieq5JYzvVjRIBqG+7bPppqdCSsYrGnqO9q
 d5gdHT59/MGU732l9dRTS6TDX0wIGFQzqODDE6O0340dRBJfsPITTdSrntBQuMtvl1JU
 Fbm1DBam/rPiwQr3PVlZlkpiwEJ2yv8XTB3x1OxeIGGtSeYe+Y/k23ipQwSME2SYmqKt
 8C5yHT0TkfEMgZ0Ew7skWOAS3X8aEruYn7zNeD3vg4gYd2jf63Kxb09OSX3seETSiyGl
 ZQmA/IFMSacdQHpz+AjpN0Z8rP7kzO82C1w+ytUyOu+mia2ej7Qwj+7PJg2hVK4EoEX2
 yPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715577380; x=1716182180;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2IOHQ65EfdwQczJm0hHK3bvEwyI09Ss5Cfek0liOFw=;
 b=c0SjknCHe9TkuB6FlJPw3rMZLd7M8IcYXwMEVibHyzOfK4sYi7PrPu+PWqgYHg6OoB
 bZ3r2Azwp8jpUiPZr9pQ37X07JUp5DTgQdQliOxYuTlvNjJEfJzZ8nzt2XA6eVvpYNXB
 R1eQ11LSXs59eMP+0wSmJAbNo4oCQ7A8/nu3ppCy2UgSKXCE7vx7fu1CCAk9Hr6g315R
 TkVcXDLJaS5wSjacfUS7lcbJYZLk3Y0ivnNlVibF7k6ZKlBOXxx+ExUYDj/H0eVujmVh
 7vEXN6mev2kidjGn8NVfKvswfzgH4bPGwNDXojW0EXdUO5AzW+p1rpcpTlT3bD4wz+ZF
 jnvQ==
X-Gm-Message-State: AOJu0YwzCi4F8wARtn6klqikUkxUvXnH0Ra2KQkOfaCjRJsIIBfDWr20
 gUR5YREriiG7XeyuxKCssuwcNfwSDZw2Rgh1mNjddnvcS7M+zXJDJ0w4y7EvXtA=
X-Received: by 2002:a05:6a20:729b:b0:1ad:9adf:febf with SMTP id
 adf61e73a8af0-1afde120efcmr9501373637.31.1715577379463; 
 Sun, 12 May 2024 22:16:19 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.31]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf31229sm70072385ad.138.2024.05.12.22.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 22:16:19 -0700 (PDT)
Date: Mon, 13 May 2024 10:46:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v2 2/3] hw/acpi: Upgrade ACPI SPCR table to support SPCR
 table version 4 format
Message-ID: <ZkGiE68wMiVwZi/E@sunil-laptop>
References: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
 <20240507052212.291137-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507052212.291137-3-jeeheng.sia@starfivetech.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: nV/yuitFs+QJ

Hi Sia Jee Heng,

On Mon, May 06, 2024 at 10:22:11PM -0700, Sia Jee Heng wrote:
> Update the SPCR table to accommodate the SPCR Table version 4 [1].
> The SPCR table has been modified to adhere to the version 4 format [2].
> 
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
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
Is it possible to check the revision here and add new fields only if the
revision supports it? ARM maintainers are better to comment but IMO, we
better keep ARM's SPCR in the same current version since I don't know
how consumers like linux (and other OSs) react to the change.

Thanks!
Sunil
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
> 
