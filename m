Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp923277wrg;
        Mon, 20 May 2019 20:37:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxP/wC9JNEMDuPeAh2bmkjkJOF2B13TwX9lPz4UjUrKmQfp45caxlhfhPrxBVgekdbpCMYO
X-Received: by 2002:a50:a389:: with SMTP id s9mr78873366edb.113.1558409860859;
        Mon, 20 May 2019 20:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558409860; cv=none;
        d=google.com; s=arc-20160816;
        b=Uaph6Mb2xOAjsV/jh97nhdUQz0puL3+Jc67otcyAaDW9QEsvOE4aY1lC/hxtl3yHyB
         BeeDaAJNfbUnMMEjlBnOyHk4lqAFg/2Ey2SPTsITx9m+kC8Re9rMo7mACEv1OWL5fLXq
         bRH+KyAPH6A+29DdWor/qJdlxELFXmTSnSOPD9bbg50RMVysxa/tJ/WN9u9vJqoKy9Gi
         X14P7QDZCtOHTleKiNA1M+olqtFMolCAJ29jpl0vCITGCfaFR7QHQKPDnV54sQgLVjGc
         7tub8zkeEK12mNtvJFnp+b1/e4K3sAVBmpmU9f0eTIrXIHMeVgV+n9j62p4R6mU+2B4p
         jR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=1IumLde2tmeagVn8jBA9LSNY+nBTOjoU+EJFOg6IdIc=;
        b=BKNybeaQYMfqbvJzBD6xkVlsmpEb19X5Wr4H/GL8lboqhqVIw8IM9gSIOjP2ulqQYK
         skV1nHWMlAkpeeeEhEGIHv31FeEw0f744A/x1lnJEO52AhagKl3Ody9Z8r14bLzYYL0L
         2dMO01a4wEXXtWRtwDcfntEfR7xQsaxnyP+3M4Uo6kJ+NK0vwQuRbVEWnHZdezfIikd7
         E9BFhdof1EwUjqgm9Xc7IaRfBRmN340s4kpeEjbxur6qa2JGftL2qcrEAiiRyKS1faXn
         ulMwhP/j1QgoV81EFwNSjsr34i7WPi83wyh0J0bMkmc+rBEL+7IWoVEj0uq0mX4IeHdp
         V6zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si3708773ejj.274.2019.05.20.20.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 20:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSvat-0000FC-Th
	for alex.bennee@linaro.org; Mon, 20 May 2019 23:37:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSvai-0000F0-Io
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSvah-00064F-CW
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:37:28 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:32983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSvah-00063y-7L
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:37:27 -0400
Received: by mail-qt1-f194.google.com with SMTP id m32so18941461qtf.0
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 20:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=1IumLde2tmeagVn8jBA9LSNY+nBTOjoU+EJFOg6IdIc=;
	b=pUlVq96Taww4atpuIzQl40NMHnJDEO3XNhYMppdfUbLALPQQIbAloQmudIh+oXNlTr
	08K6vRHCTfdqMx3juKLm0pGXP0p2h5J2znO5mlcPbXgR1tF8fpcSK+9SzhrPUDTixcdO
	GQLTBSWs2PTtkFMdDt5HNlfHpVt7XxtEUqUEc5ZZGiDAdydrL9Jw7GAPvICtc5DPHAl3
	OhEs6sVt8NkmrK4aOqDis6V9SJjhGwOnQw2J4Kl2KvOdBkn2W7RR0REeobAnfvkgtoZf
	Gd/QzNEK3bu/AyCqsUvONTmWoXZAj1Y66TFMqhopGWIqyEG531d6CdJ8IUMy13Dto0yV
	41bg==
X-Gm-Message-State: APjAAAWOBIzxNd7/BNBi2ovezZoj5XISMPdNZBho1aLVRendFF8HWr6r
	SJtiHhYv5GHzqF0WV/jj1BZFoQ==
X-Received: by 2002:aed:22f2:: with SMTP id q47mr65708951qtc.161.1558409846617;
	Mon, 20 May 2019 20:37:26 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	o64sm9993726qke.61.2019.05.20.20.37.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 20:37:25 -0700 (PDT)
Date: Mon, 20 May 2019 23:37:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190520233614-mutt-send-email-mst@kernel.org>
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
X-TUID: auJGrev+QjL8

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


Please do not add two --- separators. It breaks git am.

One --- should come after the commit log. Anything after that and
until diff is ignored anyway.

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
