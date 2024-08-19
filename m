Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1945586njf;
        Sun, 18 Aug 2024 21:10:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrLG2ZZ7pH7XwH+Y4xscah0nyKhB5B/g9P//XGnQTputP/p5+Pbd3Hb1HIwInzo7BVaVF6MHq0dnfVhqWZglYA2YrnmUPN
X-Google-Smtp-Source: AGHT+IGyO9CfZ5SkCkmG192VHD/V5C7KQQcskATSnbdcI2VGQlXjZKnmRiEzEgPacY/9HNKoyUYg
X-Received: by 2002:a05:622a:2605:b0:44f:f83d:46a3 with SMTP id d75a77b69052e-453743ad15amr110950011cf.40.1724040635751;
        Sun, 18 Aug 2024 21:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724040635; cv=none;
        d=google.com; s=arc-20160816;
        b=vbIegZNA/O1BxhKE+9SMAxx5xZM2pz8Q7ClcjG5An7HU3W7PZq/GmSvrDEuvXQLnqR
         vEuvKc8iMzP2mbJAVET/IVTQsJzJl2CA36Q5/rJacgliMTLW1XeUY7GNEiFhmb5b2eTr
         69/bn5dauT2n8wYvEYf9E0yD4b3Js2bpiV37k/Ev5gPX8UfoaeClqNKUUGaSreXr3rKi
         0WhxfCEi3xDmFJHXktZsFwsT0j/NFCdox7TykkUSBAdtioBBlbeJT7zG39ZD6ZjnKH9j
         Yd/wdDpI4NqhtNXMguTefNCJB/zh1h04i9VmdFKj7DljdeoeX1XbJKg33S5bigWtl7u+
         TnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=v2qdX8mWUNXZJiWfJcpgF+TJTRmV7VWVMGYVoqqgQAw=;
        fh=bd6JYs+zsWylHr8uUdIOK32CzPUgRjMqojZbfvqbqVY=;
        b=ZNH26jnoM6htBF7zHZHrBivRntLsbtCKH8zDyMYtVhen22iNBqdIzdGmnV2AlcFW00
         kd4yOpdygH3ipkpkaZDwf6jZBEAW2PmcW008bOfs/mulPnxK9X3CiM4mu1dYKjEa/5Vi
         LXLlfApekiXG3x04lwueMck0apPYSDtLifbIgz5C/xUE6Dr004opX9FCy5q2oF5/3/k9
         M3xnpMKkI5LRxQtSPSFnFp+WMaZcGtMMLtzAzkn1yXWpNYFf2nT+2ifQXh3/D5h+PUVu
         1dZfmjL/fqUrdvhI8iVhP1tPvueyMQqznglCiq9iuVAeLtlIz5e6lFp8CrzOnY+QGJTx
         uXfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jF5AGaKp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45369fe6280si96030541cf.92.2024.08.18.21.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Aug 2024 21:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jF5AGaKp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sftiq-00053A-Rd; Mon, 19 Aug 2024 00:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sftiZ-0004zs-Ie
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 00:10:07 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sftiX-0002qr-I6
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 00:10:07 -0400
Received: by mail-oi1-x244.google.com with SMTP id
 5614622812f47-3db18c4927bso2277213b6e.1
 for <qemu-arm@nongnu.org>; Sun, 18 Aug 2024 21:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1724040603; x=1724645403; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v2qdX8mWUNXZJiWfJcpgF+TJTRmV7VWVMGYVoqqgQAw=;
 b=jF5AGaKpa7UUwxV9nUhDigztzUJay2boAm40nHIxUxgc3Jcjyy5EHAaAJplmZJEl/m
 j0yp91cQOdX2KoK4lvzRDqF1vYpdLeMjLowZODyQ8dT1R9yyuXSmnGxhb9IYv2wQzXv+
 Wyr7Vwq+Utn6BnEai3RArusOL1HLd06jjvyG7436kOIq+u+xSJGhX7F4+NPs/k6+Zids
 vakpX5RaufBWc0BjcWVyKmbyShSIrzqwS3iiutIj8x1qi3bMJr1q0NEs6xnfXDNFl2kd
 T092EaIye1K0DwALVE+JPsDQOIGZJxw+1OCCIhRT6R1Itz5yw0S2xJXwU6HEaB38Dpin
 aqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724040603; x=1724645403;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2qdX8mWUNXZJiWfJcpgF+TJTRmV7VWVMGYVoqqgQAw=;
 b=txCUZ6YvfEbHRRkESRMqYALQFFQNRv0AD629+bJE5hk2YzktwoYqBib23jvdLFPJlT
 n185IzfaMrtNErfPJVLEMkPHj2pH22y35co4xsB5S1UxLbIggT6l+9uxO/u4IHYK6ovD
 rVlXm//kmwBk3tUbGhppVHydqyQ/iocR1OBLRKPiXUF0xCMMQu3BuYk2ty4Md1FhpBCs
 34sewODpJJ2ZVOaKlYYwNDPgfkr98yNYyPgKwH+v5zB/MHJHY8Vnc5dcbCJ+QnyFFOKv
 E7iH4WQdgBLBiLbBfXpO1PSC1LtzICQq1FXNnPzUNzcwR0wrjBrENZJCD7buzZhUlUZF
 fYbQ==
X-Gm-Message-State: AOJu0YyNmv/D14ykEeY/nsMz/GyWEjjzskVhdocJ/HQcU3A7B8aUzRN3
 J0N0olgR+KQU+HqKjL/syAn+RN8pE0VI7Rvv4r524Nxey6vS8iBkMP4cxFtjGr8=
X-Received: by 2002:a05:6808:3187:b0:3dd:37ab:34bc with SMTP id
 5614622812f47-3dd3ad37097mr11487728b6e.21.1724040603507; 
 Sun, 18 Aug 2024 21:10:03 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3dd33d3fea9sm2072923b6e.1.2024.08.18.21.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 21:10:03 -0700 (PDT)
Date: Mon, 19 Aug 2024 09:39:53 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v3 2/3] hw/acpi: Upgrade ACPI SPCR table to support SPCR
 table version 4 format
Message-ID: <ZsLFkbZxvOLpf8bZ@sunil-laptop>
References: <20240813052223.1033420-1-jeeheng.sia@starfivetech.com>
 <20240813052223.1033420-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813052223.1033420-3-jeeheng.sia@starfivetech.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: q5tVpzbQQByG

Hi Jee Heng,

On Mon, Aug 12, 2024 at 10:22:22PM -0700, Sia Jee Heng wrote:
> Update the SPCR table to accommodate the SPCR Table version 4 [1].
> The SPCR table has been modified to adhere to the version 4 format [2].
> 
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
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
> index e10cad86dd..ae075dc9fd 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -435,11 +435,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
> @@ -463,9 +464,14 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
I request the same which I had asked earlier. Please keep SPCR for other
architectures like ARM intact. The latest revision is primarily required
for RISC-V. So, restrict the series only for RISC-V. The common
build_spcr() should create SPCR based on the revision parameter.

Thanks,
Sunil
