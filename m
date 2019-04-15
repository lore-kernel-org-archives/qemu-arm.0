Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2646234wrx;
        Mon, 15 Apr 2019 05:59:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJb8X/08yzyqBJKsNA3WfrBCTzz9XpImTA0uupEumuG0427fHQgeHvLgAg4+mb+ZUQVngP
X-Received: by 2002:adf:f64d:: with SMTP id x13mr49144919wrp.298.1555333175861;
        Mon, 15 Apr 2019 05:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555333175; cv=none;
        d=google.com; s=arc-20160816;
        b=TQI2ccJ83HfKuSGc8UbAoavvouKGJadwWDCCeY34Ed1r3ZE0A3PIHKc/v/tf+EkvTz
         Dpj/qslGnQUTVeJet5sG6o2FR1C0Pr427TZvT7WtvRrd24OXigwAoapAS9QW52v5qQbM
         G53R2843j4XAX7DvK2vLkwo6yqv8EKf5k1Mcn57klt0x833eLfuewB+FmzqiewaWwUfE
         /BPiALf8Kihen58kaSeKJAogS682JDdnJKXjjKC+7j0M92QhhGgpmHK4rY3yI6m5+7UQ
         OJ2LDAj3v/oESDCjLPnjNToVy6CNFdAvu206uN/WMIKhaBBz+ZlfEP6niR7zZWe1343A
         PfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=TvqKysfgqYvj/2kNAAz58ayIMQ8iP/1kqM/nwKA5vPs=;
        b=MYJG3IB8r21JXIqbhu+G0ctdGjKcVOekRst/SoF4FAf+Z2wFUjh8ot5BCzvTMa76iK
         +Pvm/hotrbrAvijVeday1zAEVZcw4TMtbW1SiM7Ffjno5HLQUjVj4dcIeuHyjHXpvKm9
         mM8yzC5TpetLS3bSaCvtKW8evRQUB1B4wAS0Vr82FhcdUvRiV7lul7p2H0PWuOQlbzJX
         LSDCSN2OdQu8hBL06Wq9d42GdvmPfVsPr9i8rYYqp9781iaF365MspcJEp5gtSwBU3UM
         rvmonArZ899JA1FlKdcM0cfNXsc9YeqbsEXi38781i0ycElBGEjcr6y4hc1gXdYLErVs
         c/TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si32347057wrx.104.2019.04.15.05.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 05:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hG1Cx-0002k4-0v
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 08:59:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hG1Ch-0002iV-S5
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 08:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hG1Cg-0002Bz-M4
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 08:59:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hG1Cg-0002Ah-Dy
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 08:59:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id y13so21871974wrd.3
	for <qemu-arm@nongnu.org>; Mon, 15 Apr 2019 05:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TvqKysfgqYvj/2kNAAz58ayIMQ8iP/1kqM/nwKA5vPs=;
	b=HT10cYDYPeFal6gDGqesI7Oqkd2CoiYBDzkbXCLlimdEPvYNulshiJ5tikxPEvA1Ll
	KMpdidZ1fem4pZdRs/Y+KoiaI4j/gFZam9IJVr4h4WrCReDWi9jUqyaGs4Ke/5ebUygN
	sIJzLwCTzA4LXBTm06ES4epiVFvFSl46Zz7n6NyzCUHzMSbng7uRTs+CH5FbFNVMVNQP
	tdcMHyRL6lWVlpweaxqI9h8qgfnYrSIiZhvTyts9ot2y3EI2IGNe8bPCJyWYPiqW/ffV
	0tUNOaa1ZHoUX4cdVdw6ON1LgXh4ArbSBnG507q9f9AXJwmSn2pu3sxILWnmF9MD9WfN
	IlKQ==
X-Gm-Message-State: APjAAAW8Ic1NoA+joS+X7+NfH05zKzMGWA0FR83kkD6rHqIUjq37n/Z/
	etnmHf1YIyZlkIUPyiYnU3+PCw==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr22336675wrm.300.1555333157496; 
	Mon, 15 Apr 2019 05:59:17 -0700 (PDT)
Received: from [10.1.5.6] (206.red-80-28-210.staticip.rima-tde.net.
	[80.28.210.206]) by smtp.gmail.com with ESMTPSA id
	z23sm17091187wma.0.2019.04.15.05.59.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 05:59:16 -0700 (PDT)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
	<20190415070307.13668-4-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <97d23905-4c51-070b-f58a-b627cb13ba11@redhat.com>
Date: Mon, 15 Apr 2019 14:59:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415070307.13668-4-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/4] hw/arm/virt-acpi-build:
 pass AcpiMcfgInfo to build_mcfg()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, imammedo@redhat.com,
	shannon.zhaosl@gmail.com, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yN8kq5bfJ59i

On 4/15/19 9:03 AM, Wei Yang wrote:
> To build MCFG, two information is necessary:
> 
>     * bus number
>     * base address
> 
> Abstract these two information to AcpiMcfgInfo so that build_mcfg and
> build_mcfg_q35 will have the same declaration.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> 
> ---
> v2:
>   * for arm platform, construct a AcpiMcfgInfo directly
> ---
>  hw/arm/virt-acpi-build.c    | 17 ++++++++++-------
>  hw/i386/acpi-build.c        |  5 -----
>  include/hw/acpi/aml-build.h |  5 +++++
>  3 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e09e7eff8d..7350f207b5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -546,21 +546,18 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  }
>  
>  static void
> -build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>  {
>      AcpiTableMcfg *mcfg;
> -    const MemMapEntry *memmap = vms->memmap;
> -    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>  
>      mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
> +    mcfg->allocation[0].address = cpu_to_le64(info->base);
>  
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number =
> -        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
>  
>      build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>  }
> @@ -801,7 +798,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_gtdt(tables_blob, tables->linker, vms);
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_mcfg(tables_blob, tables->linker, vms);
> +    {
> +        AcpiMcfgInfo mcfg = {
> +           .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
> +           .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
> +        };
> +        build_mcfg(tables_blob, tables->linker, &mcfg);
> +    }
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f0d27bffd6..7613b245cf 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -86,11 +86,6 @@
>  /* Default IOAPIC ID */
>  #define ACPI_BUILD_IOAPIC_ID 0x0
>  
> -typedef struct AcpiMcfgInfo {
> -    uint64_t base;
> -    uint32_t size;
> -} AcpiMcfgInfo;
> -
>  typedef struct AcpiPmInfo {
>      bool s3_disabled;
>      bool s4_disabled;
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1a563ad756..22dd593068 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -223,6 +223,11 @@ struct AcpiBuildTables {
>      BIOSLinker *linker;
>  } AcpiBuildTables;
>  
> +typedef struct AcpiMcfgInfo {
> +    uint64_t base;
> +    uint32_t size;
> +} AcpiMcfgInfo;
> +
>  /**
>   * init_aml_allocator:
>   *
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
