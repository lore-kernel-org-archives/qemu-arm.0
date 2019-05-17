Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1711451wrg;
        Fri, 17 May 2019 04:11:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXHI7RzGbahABJhpCGNKI2pDE8mnbi5mfrpEin3pzTW2GfuHXO2mzehWW7cXdAYBrM4kHQ
X-Received: by 2002:a17:906:5217:: with SMTP id g23mr39314696ejm.9.1558091483235;
        Fri, 17 May 2019 04:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558091483; cv=none;
        d=google.com; s=arc-20160816;
        b=0BtTZxQwmer5nWsAtVSXzbB6MpXog19iN99v4yBGVM4NBU4k8oVTRFNYd5JK+0dRMZ
         9qZZUjjhIRsm2EskX/s7NtTn+o/DY2AaVP7dAZc4UOyhMdWt1rLgdakUAByRiq1g+nY/
         Wdx4NPaQtihUV7NSPPbqbhzOXOajjlveEkhhxPrO/lf3PGc2+t2PcHfqNpUd4lP1FEd/
         Xtp8Vb+kCJs/wZaCPQzJRzV/GW5qqxq+mi3ODMAb37PfML29y8lBJeEysFXIiFDkHeHt
         EJ9KuVa6pmouQXCmzUmnpqCcHk9UiZHNgtYaqFOiFN+Mewre9PT6+UCPzNgaAHJRsxta
         pdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=7rQFc8Zy+BiHkOqtBdIpBfBtJvtLl/lxHJ8Co3GFn2E=;
        b=CP2QQ9R+1dlvWUTD1rmg7uf5ivJpcD7Z5yX9TC+ucZUL+wIhL8+TRbj/QxnAkUXKrX
         cR565eZV8JXy2HO/trW3zkFvp+zwTfssPgeoJ22EftcHZsYsOmWvD2/rqxZs82Zr8i6C
         2ZfS2Gso0rN0pNsk86pCZRANt1qwWnTTcu26KS8+GtbLpna7GXZZQHH0ixgonDcrUlSA
         0b6r1m3/+NZXWVkWvpVvsg/mVi4oKLUUmU59J3nbe8ZE5/pq4LUvkFk8/b5zJx78HxnC
         r/SKxLZ3GmRddPC8OXX7vXx+ByD7EFSEkTxJtl6Zd/UBshDF/laiV3Deyh/tAd8ZmjQb
         YPCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si5308249ejt.223.2019.05.17.04.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 04:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRalm-0002J1-6w
	for alex.bennee@linaro.org; Fri, 17 May 2019 07:11:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hRafq-0005Bl-JN
	for qemu-arm@nongnu.org; Fri, 17 May 2019 07:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hRafo-0007XC-Ve
	for qemu-arm@nongnu.org; Fri, 17 May 2019 07:05:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hRafo-0007UU-Nh; Fri, 17 May 2019 07:05:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D1CB30C0DDA;
	Fri, 17 May 2019 11:05:11 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.40.205.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FBEC7E5D2;
	Fri, 17 May 2019 11:05:08 +0000 (UTC)
Date: Fri, 17 May 2019 13:05:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190517130506.314aeac9@Igors-MacBook-Pro>
In-Reply-To: <20190517004324.17306-1-richardw.yang@linux.intel.com>
References: <20190517004324.17306-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 17 May 2019 11:05:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2] acpi: pci: use build_append_foo() API to
 construct MCFG
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2nSXeGafUUeP

On Fri, 17 May 2019 08:43:24 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> build_append_foo() API doesn't need explicit endianness conversions
> which eliminates a source of errors and it makes build_mcfg() look like
> declarative definition of MCFG table in ACPI spec, which makes it easy
> to review.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v2:
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

