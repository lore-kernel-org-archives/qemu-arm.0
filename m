Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp927492wrg;
        Mon, 20 May 2019 20:44:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/jUXxmKzQuqq8/NmI0IQLVAVeDgPohmnSAyBaQ7Y8zIBCjqtYqe4LNKU8Fa2gcKx9JxMo
X-Received: by 2002:a17:906:7b58:: with SMTP id n24mr62501949ejo.224.1558410287155;
        Mon, 20 May 2019 20:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558410287; cv=none;
        d=google.com; s=arc-20160816;
        b=NZUUtb/ywrr3YzKdu5nn5sTgJrV7Sy56C3NNpS610X+o0BJZuGMcXVJ6Qbyh509b95
         VlVqSWaWLU/i3FRwgVyZz92xq60AaQ1e443eAd+/Sl//c8Qido+4scInEv3wDOYPSiR0
         HFSYNVieaH/M0f+c6IS0WYkpZX2l+6VMx6mG63ZanyZUdrzANob76Fy1HS7/Gc2fK4ez
         LuJzCBKxRorVFlEFCJUaeFhOEAyNvFfRYb+EuhlubFOd/x70j3IAImh14a7X1hJ5Eyot
         lUgt8Uki1PsCWGmRGSufjTcoMFai7z/lgFsfLFNCt59t+ZvNw9epnvkPYT7SPfpUPRTa
         wmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=DZVYioWw98UXUc29bUL+2l331EhUGaozKZ3YRr3ZzbI=;
        b=k8hYy+0s7fRWw/CYffS/hUnYbT5VtlD8+M7TVM2wJMvP4xAIsR5i1YAGSL1N7k+Gb7
         pwx1DD8ozwyvIS/cPoeFh9fP4vSOPUaocp9J70S+EQC04MLqhyz6frhRuXft/cPUEZ4J
         JwOG9nK0GgDPRxINh6V8M4vigNENwaZg0ZUKKHijr6VbvhIeYkr8Ug1TEJA2QTLJXxy4
         hZF+9/dLXy9ALvKgbTrH8+wJqFzFrBYTc++II60eRKWyEhifI8b6/wbbT9/o/lXtMCZ2
         SCizZhjLpwRTCaj38Csv8rLHh+37SPnRtystUOvJodk9CCfeqpOI6k6CXCd9FhATyg4+
         H3aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si26098ejq.246.2019.05.20.20.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 20:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSvhm-0002HG-8p
	for alex.bennee@linaro.org; Mon, 20 May 2019 23:44:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSvhb-0002Gn-06
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSvhZ-0000Ch-6f
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:44:34 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSvhZ-0000Bt-2A
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:44:33 -0400
Received: by mail-qt1-f194.google.com with SMTP id m32so18952865qtf.0
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 20:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=DZVYioWw98UXUc29bUL+2l331EhUGaozKZ3YRr3ZzbI=;
	b=RYb6vrboBA3ImfD3xZZoa+Kz94GgDCfmaHB/5nM1BO6DTqlz6UY81AljgeCpk9S9Ap
	nepiERiY3RDyCtHEupVSnuzRvocZuHZTvKl46JpY7+1loEs3M+SxJjsYjPCGgaJN5YxQ
	H+BVA9jPTNwH933NUlNsvB5NcpnV5KlOfqVreE4IbMIUJO+IB+4j+PBf9IIsfe0jtWh8
	ljHXFTviQLHpop8Wuot/MJg1/M2Qjt8US2enO3wH8zurkSFN+OTaHdIZBtzUr/AS0fm1
	KExMWxr3fY4e4wNLzd1c3zy5sN4r7vSVXciQJeygHQAw4K+Y/0fOf+AreQ3fTu3Vy3fa
	+G7w==
X-Gm-Message-State: APjAAAVq0iTcxdQspkfjK8hgoH6NMQIGZzd3a/GbTsBpescbl9dYkc0X
	OJQdB/ZnYN+MCFdzitLL6XMDNw==
X-Received: by 2002:ac8:228e:: with SMTP id f14mr32860415qta.79.1558410271447; 
	Mon, 20 May 2019 20:44:31 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	d85sm10057983qkc.64.2019.05.20.20.44.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 20:44:30 -0700 (PDT)
Date: Mon, 20 May 2019 23:44:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190520234407-mutt-send-email-mst@kernel.org>
References: <20190521033249.1960-1-richardw.yang@linux.intel.com>
	<20190521033249.1960-3-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521033249.1960-3-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.194
Subject: Re: [Qemu-arm] [PATCH v5 2/2] acpi: pci: use build_append_foo() API
 to construct MCFG
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
	imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8M/DzDVyp/QD

On Tue, May 21, 2019 at 11:32:49AM +0800, Wei Yang wrote:
> build_append_foo() API doesn't need explicit endianness conversions
> which eliminates a source of errors and it makes build_mcfg() look like
> declarative definition of MCFG table in ACPI spec, which makes it easy
> to review.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> v5:
>    * miss the reserved[8] of MCFG in last version, add it back
>    * drop SOBs and make sure bios-tables-test all OK
> ---
>  hw/acpi/pci.c               | 35 +++++++++++++++++++++++------------
>  include/hw/acpi/acpi-defs.h | 18 ------------------
>  2 files changed, 23 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index fa0fa30bb9..49df7b7d54 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -30,17 +30,28 @@
>  
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>  {
> -    AcpiTableMcfg *mcfg;
> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> -
> -    mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(info->base);
> -
> -    /* Only a single allocation so no need to play with segments */
> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> -    mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> -
> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> +    int mcfg_start = table_data->len;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    /*
> +     * PCI Firmware Specification, Revision 3.0
> +     * 4.1.2 MCFG Table Description.
> +     */
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8);

below is in fact
	Memory Mapped Enhanced Configuration Space Base Address Allocation Structure

maybe document this?

> +    /* Base address, processor-relative */
> +    build_append_int_noprefix(table_data, info->base, 8);
> +    /* PCI segment group number */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* Starting PCI Bus number */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Final PCI Bus number */
> +    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 4);
> +
> +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> +                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
>  }
>  
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index f9aa4bd398..57a3f58b0c 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
>  
>  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
>  
> -/* PCI fw r3.0 MCFG table. */
> -/* Subtable */
> -struct AcpiMcfgAllocation {
> -    uint64_t address;                /* Base address, processor-relative */
> -    uint16_t pci_segment;            /* PCI segment group number */
> -    uint8_t start_bus_number;       /* Starting PCI Bus number */
> -    uint8_t end_bus_number;         /* Final PCI Bus number */
> -    uint32_t reserved;
> -} QEMU_PACKED;
> -typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
> -
> -struct AcpiTableMcfg {
> -    ACPI_TABLE_HEADER_DEF;
> -    uint8_t reserved[8];
> -    AcpiMcfgAllocation allocation[0];
> -} QEMU_PACKED;
> -typedef struct AcpiTableMcfg AcpiTableMcfg;
> -
>  /*
>   * TCPA Description Table
>   *
> -- 
> 2.19.1
