Received: by 10.25.208.194 with SMTP id h185csp503704lfg;
        Sun, 24 Apr 2016 10:10:33 -0700 (PDT)
X-Received: by 10.140.203.72 with SMTP id y69mr11080757qha.79.1461517832918;
        Sun, 24 Apr 2016 10:10:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20si8418850qki.178.2016.04.24.10.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Apr 2016 10:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auNYG-000358-Cn
	for alex.bennee@linaro.org; Sun, 24 Apr 2016 13:10:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNYD-00031R-Np
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:10:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNY8-0005HT-RG
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:10:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1auNY8-0005HP-K2; Sun, 24 Apr 2016 13:10:24 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E0C085A00;
	Sun, 24 Apr 2016 17:10:23 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-19.brq.redhat.com [10.40.204.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3OHAIjY004231
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 24 Apr 2016 13:10:21 -0400
Date: Sun, 24 Apr 2016 19:10:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160424171017.rji23w7yyyb3ly4e@hawk.localdomain>
References: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
	<1461402396-11776-6-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461402396-11776-6-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 5/5] ACPI: Virt: Generate
 SRAT table
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jkKMgFmEr4p/

On Sat, Apr 23, 2016 at 05:06:36PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> To support NUMA, it needs to generate SRAT ACPI table.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)

Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f51fe39..e0e90d4 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "hw/acpi/aml-build.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
> +#include "sysemu/numa.h"
>  
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> @@ -414,6 +415,52 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>  }
>  
>  static void
> +build_srat(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
> +{
> +    AcpiSystemResourceAffinityTable *srat;
> +    AcpiSratProcessorGiccAffinity *core;
> +    AcpiSratMemoryAffinity *numamem;
> +    int i, j, srat_start;
> +    uint64_t mem_base;
> +    uint32_t *cpu_node = g_malloc0(guest_info->smp_cpus * sizeof(uint32_t));
> +
> +    for (i = 0; i < guest_info->smp_cpus; i++) {
> +        for (j = 0; j < nb_numa_nodes; j++) {
> +            if (test_bit(i, numa_info[j].node_cpu)) {
> +                cpu_node[i] = j;
> +                break;
> +            }
> +        }
> +    }
> +
> +    srat_start = table_data->len;
> +    srat = acpi_data_push(table_data, sizeof(*srat));
> +    srat->reserved1 = cpu_to_le32(1);
> +
> +    for (i = 0; i < guest_info->smp_cpus; ++i) {
> +        core = acpi_data_push(table_data, sizeof(*core));
> +        core->type = ACPI_SRAT_PROCESSOR_GICC;
> +        core->length = sizeof(*core);
> +        core->proximity = cpu_to_le32(cpu_node[i]);
> +        core->acpi_processor_uid = cpu_to_le32(i);
> +        core->flags = cpu_to_le32(1);
> +    }
> +    g_free(cpu_node);
> +
> +    mem_base = guest_info->memmap[VIRT_MEM].base;
> +    for (i = 0; i < nb_numa_nodes; ++i) {
> +        numamem = acpi_data_push(table_data, sizeof(*numamem));
> +        acpi_build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> +                               MEM_AFFINITY_ENABLED);
> +        mem_base += numa_info[i].node_mem;
> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + srat_start), "SRAT",
> +                 table_data->len - srat_start, 3, NULL, NULL);
> +}
> +
> +static void
>  build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>  {
>      AcpiTableMcfg *mcfg;
> @@ -638,6 +685,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, guest_info);
>  
> +    if (nb_numa_nodes > 0) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_srat(tables_blob, tables->linker, guest_info);
> +    }
> +
>      /* RSDT is pointed to by RSDP */
>      rsdt = tables_blob->len;
>      build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> -- 
> 2.0.4
> 
> 
> 
