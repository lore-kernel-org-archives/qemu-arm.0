Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1111542wro;
        Thu, 1 Nov 2018 10:52:54 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d/6Kbc0qZLBF479Re0vae4V1mx1e578xzmDZ/fWR9E0RyycEOOT0t2rHDHXkR0V0mFqq9F
X-Received: by 2002:ac8:2eeb:: with SMTP id i40mr6438997qta.300.1541094774039;
        Thu, 01 Nov 2018 10:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541094774; cv=none;
        d=google.com; s=arc-20160816;
        b=W5uqre6gBRZ6RNJ4RJ++kpTVWN9AC8ZiP7TZl7hRtgvfPF6XoUWgE1j22FF5RaCqjp
         8ZxAReJF6jKluN8+o3RqQ4v+t8ULx7XWm7AqilFAihS/fIetvMmuu6Rb+cTHiNTyDso6
         2YC8fHciO9bXaSUjPEr83p5u1EB0xfnZaW4imWqQy294CKP6hGwf1LGI8TC37SW/RY6z
         YL9gQMYaLLsGx9Wmp/w8ZDoBMNri99Dn1DjxoyNXUsNaYBK3Yf9LbuOJOT3464s4bkIm
         tcsEj8ey5NWtMKVHG1jDUjX1t2vHM/Ex9wSttdXO/FF5JZL32WB1mlGDsLF6oyyn+5OL
         GJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=eI1VSLWTb0rPrqmZIDWdCZq/krPREtgO1422RpHyvFo=;
        b=BbM0rJK84vgcxdGdIi2RtHtzi7glb6rgEAPCQrAY4LTK911pIk7lo0PHZuaQ1mQIta
         TKE9P5rvcgFuvdSgontj/X1I+MxbbFlXZ8UI0ylFB9HVR7fiAg76F+SNIKW0EtMJp+LR
         nepCNSj3sTw+ujb6NfLxcjh1yVZGlv2yN4i4Ac1Z03/ohrGVAt5YhzBopMotaRHkJbKM
         z0mM8/AphBrI7AljMCfKiDd9eR1aW8AV3oTu/XstFAEWEIKd3AU5aZRORI+/5U1Cto38
         pN040aeWeLm/7xDxOChCbPF2rdJ+LybEk1yJ3LEscQhOVW5MXkDcx/cFKRbu0wjQcwm0
         kC4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c35si1233362qtd.358.2018.11.01.10.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 10:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIH9J-0003Yo-CR
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 13:52:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gIH7J-0002Dk-EX
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gIH7F-0003r5-Bi
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:50:49 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gIH7F-0003qU-5j
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:50:45 -0400
Received: by mail-wm1-f65.google.com with SMTP id q12-v6so2029793wmq.0
	for <qemu-arm@nongnu.org>; Thu, 01 Nov 2018 10:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eI1VSLWTb0rPrqmZIDWdCZq/krPREtgO1422RpHyvFo=;
	b=pZY3y91xfdpB4RTQZRvxt6QQi81Z01lABv6At1hZxY0MiklY9sp6Vo3K5ZsrTHuXOn
	00ygZVftelekY4sLYdLYuSynx3OJvKR5vD39kst4JOOBiauRYSSQRTDl8cK/o/kTTMft
	M4NZZLBaF7VjGwAoRyf35UB0RwR2zZOBfksORLP4c5R1Y6RUel1scXkcmgQedXVwMrhN
	m1hDtm6Nxfk4wnC9e15MaCt+0Ox17GD9RvScPolPjNUZHa4bTYzy8iRIjcHkGgMZxQtG
	3AFnVxldnX5JLVxMXox42+R/g6TRka4+6KCCfyNknbj3l5aAbjD/ZvIL3SNPZJyfXnfr
	/IkA==
X-Gm-Message-State: AGRZ1gKZXo2z1BaMPizWoai7oPNBWSAbJ3Rs65MGeqeb0Si8rP59CmU2
	IBngu7QpoPaZAzDJ9dJV8V+OJg==
X-Received: by 2002:a1c:5890:: with SMTP id
	m138-v6mr6262209wmb.107.1541094643824; 
	Thu, 01 Nov 2018 10:50:43 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.31.199])
	by smtp.gmail.com with ESMTPSA id
	p7-v6sm2716988wrs.23.2018.11.01.10.50.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 10:50:43 -0700 (PDT)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-4-sameo@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1f8b7079-111a-4aee-cd18-fde69a49f359@redhat.com>
Date: Thu, 1 Nov 2018 18:50:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181101102303.16439-4-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 03/23] hw: acpi: Export the
 RSDP build API
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9W73AHOoMaG8

Hey Samuel,

On 1/11/18 11:22, Samuel Ortiz wrote:
> The hardware-reduced API will need to build RSDP as well, so we should
> export this routine. While doing so, we also slightly change the
> function prototype. Since no caller needs it, and to make it more
> consistent with the rest of the AML build API, the function no longer
> returns its RSDP table.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>   hw/acpi/aml-build.c         | 24 ++++++++++++++++++++++++
>   hw/arm/virt-acpi-build.c    |  2 +-

When you modify files from architectures you are not custom to use, you 
should verify your changes don't break them ;)

>   hw/i386/acpi-build.c        | 26 --------------------------
>   include/hw/acpi/aml-build.h |  3 +++
>   4 files changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 51b608432f..2d6f538f9d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1651,6 +1651,30 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>                    (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
>   }
>   
> +void
> +build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
> +{
> +    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> +    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
> +    unsigned rsdt_pa_offset =
> +        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
> +
> +    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> +                             true /* fseg memory */);
> +
> +    memcpy(&rsdp->signature, "RSD PTR ", 8);
> +    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> +    /* Address to be filled by Guest linker */
> +    bios_linker_loader_add_pointer(linker,
> +        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
> +        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
> +
> +    /* Checksum to be filled by Guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> +        (char *)&rsdp->checksum - rsdp_table->data);
> +}
> +
>   void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>                          uint64_t len, int node, MemoryAffinityFlags flags)
>   {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f28a2faa53..0ed132b79b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -367,7 +367,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>   }
>   
>   /* RSDP */
> -static GArray *
> +static void
>   build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>   {

Since this function doesn't return anything now, you can simply remove 
the last line to avoid:

hw/arm/virt-acpi-build.c: In function ‘build_rsdp’:
hw/arm/virt-acpi-build.c:396:12: error: ‘return’ with a value, in 
function returning void [-Werror]
      return rsdp_table;
             ^~~~~~~~~~

(I used 'make subdir-aarch64-softmmu' to build).

Also since you declare the prototype in "hw/acpi/aml-build.h", you have 
to remove the 'static' keyword:

hw/arm/virt-acpi-build.c:371:1: error: static declaration of 
‘build_rsdp’ follows non-static declaration
  build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned 
xsdt_tbl_offset)
  ^~~~~~~~~~
hw/arm/virt-acpi-build.c:42:
include/hw/acpi/aml-build.h:393:1: note: previous declaration of 
‘build_rsdp’ was here
  build_rsdp(GArray *table_data,
  ^~~~~~~~~~

Maybe I was not clear enough in my previous review, I suggest doing this 
in 3 steps:

1: both functions return void (still static)
2: expose the prototype declaration in "hw/acpi/aml-build.h" (remove 
static keyword)
3: unify codebase moving build_rsdp() to hw/acpi/aml-build.c

steps 1+2 could be merged, but IMHO 3 steps are cleaner.

>       AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 81d98fa34f..d7b47e05b5 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2513,32 +2513,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
>                    "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
>   }
>   
> -static GArray *
> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
> -{
> -    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> -    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
> -    unsigned rsdt_pa_offset =
> -        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
> -
> -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> -                             true /* fseg memory */);
> -
> -    memcpy(&rsdp->signature, "RSD PTR ", 8);
> -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> -    /* Address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
> -        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
> -
> -    /* Checksum to be filled by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> -        (char *)&rsdp->checksum - rsdp_table->data);
> -
> -    return rsdp_table;
> -}
> -
>   static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>   {
>       Object *pci_host;
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 73fc6659f2..c9bcb32d81 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -390,6 +390,9 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
>   void acpi_build_tables_init(AcpiBuildTables *tables);
>   void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
>   void
> +build_rsdp(GArray *table_data,
> +           BIOSLinker *linker, unsigned rsdt_tbl_offset);
> +void
>   build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>              const char *oem_id, const char *oem_table_id);
>   void
> 
