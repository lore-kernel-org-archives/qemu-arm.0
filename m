Received: by 10.25.208.194 with SMTP id h185csp829826lfg;
        Mon, 25 Apr 2016 03:45:08 -0700 (PDT)
X-Received: by 10.140.142.144 with SMTP id 138mr35557413qho.84.1461581108302;
        Mon, 25 Apr 2016 03:45:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 46si10371999qgm.95.2016.04.25.03.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 03:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aue0o-0008Ds-OW
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 06:45:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aue0l-00089z-FG
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 06:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aue0i-0000Ct-3j
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 06:45:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aue0h-0000Cn-S1; Mon, 25 Apr 2016 06:45:00 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5478F6369;
	Mon, 25 Apr 2016 10:44:59 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3PAiv29003978; Mon, 25 Apr 2016 06:44:57 -0400
Date: Mon, 25 Apr 2016 12:44:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160425124455.43eee760@nial.brq.redhat.com>
In-Reply-To: <20160422132605.gjyuda3magcoktyf@hawk.localdomain>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-6-git-send-email-zhaoshenglong@huawei.com>
	<20160422132605.gjyuda3magcoktyf@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 25 Apr 2016 10:44:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 5/5] hw/arm/virt-acpi-build:
 Generate SRAT table
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
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yIWERlw8FiLi

On Fri, 22 Apr 2016 15:26:05 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Thu, Apr 21, 2016 at 02:23:54PM +0800, Shannon Zhao wrote:
> > From: Shannon Zhao <shannon.zhao@linaro.org>
> > 
> > To support NUMA, it needs to generate SRAT ACPI table.
> > 
> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> > ---
> >  hw/arm/virt-acpi-build.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> > 
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index f51fe39..a618210 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -43,6 +43,7 @@
> >  #include "hw/acpi/aml-build.h"
> >  #include "hw/pci/pcie_host.h"
> >  #include "hw/pci/pci.h"
> > +#include "sysemu/numa.h"
> >  
> >  #define ARM_SPI_BASE 32
> >  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> > @@ -414,6 +415,58 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
> >  }
> >  
> >  static void
> > +build_srat(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
> > +{
> > +    AcpiSystemResourceAffinityTable *srat;
> > +    AcpiSratProcessorGiccAffinity *core;
> > +    AcpiSratMemoryAffinity *numamem;
> > +    int i, j, srat_start;
> > +    uint64_t mem_len, mem_base;
> > +    uint32_t *cpu_node = g_malloc0(guest_info->smp_cpus * sizeof *cpu_node);  
> 
> nit1: the majority of qemu code uses () with sizeof
> nit2: sizeof(uint32_t) might be nicer than the cyclic reference
> 
> > +
> > +    for (i = 0; i < guest_info->smp_cpus; i++) {
> > +        for (j = 0; j < nb_numa_nodes; j++) {
> > +            if (test_bit(i, numa_info[j].node_cpu)) {
> > +                cpu_node[i] = j;
> > +                break;
> > +            }
> > +        }
> > +    }
> > +
> > +    srat_start = table_data->len;
> > +    srat = acpi_data_push(table_data, sizeof *srat);
> > +    srat->reserved1 = cpu_to_le32(1);
> > +
> > +    for (i = 0; i < guest_info->smp_cpus; ++i) {
> > +        core = acpi_data_push(table_data, sizeof *core);
> > +        core->type = ACPI_SRAT_PROCESSOR_GICC;
> > +        core->length = sizeof(*core);
> > +        core->proximity = cpu_node[i];
> > +        core->acpi_processor_uid = i;  
> 
> We'll want to use get_arch_id() here (after I implement it as part of
> the cpu topology work I keep promising).
> 
> > +        core->flags = cpu_to_le32(1);
> > +    }
> > +    g_free(cpu_node);
> > +
> > +    mem_base = guest_info->memmap[VIRT_MEM].base;
> > +    for (i = 0; i < nb_numa_nodes; ++i) {
> > +        mem_len = numa_info[i].node_mem;
> > +        numamem = acpi_data_push(table_data, sizeof *numamem);
> > +        numamem->type = ACPI_SRAT_MEMORY;
> > +        numamem->length = sizeof(*numamem);
> > +        memset(numamem->proximity, 0, 4);
> > +        numamem->proximity[0] = i;  
> 
> This is weird (but I see x86 does it too). The spec says proximity is
> "Integer that represents the proximity domain to which the processor
>  belongs", and its 4 bytes. So why doesn't the structure define it as
> a uint32_t and then we'd just do
> 
>   numamem->proximity = cpu_to_le32(i);
It's probably just some legacy code and should be fixed as you're suggesting.


> 
> (adding Igor)
> 
> > +        numamem->flags = cpu_to_le32(1);
> > +        numamem->base_addr = cpu_to_le64(mem_base);
> > +        numamem->range_length = cpu_to_le64(mem_len);  
> 
> How about moving acpi_build_srat_memory from hw/i386/acpi-build.c to
> somewhere in hw/acpi and reusing it?
> 
> > +        mem_base += mem_len;
> > +    }
> > +
> > +    build_header(linker, table_data,
> > +                 (void *)(table_data->data + srat_start), "SRAT",
> > +                 table_data->len - srat_start, 3, NULL, NULL);
> > +}
> > +
> > +static void
> >  build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
> >  {
> >      AcpiTableMcfg *mcfg;
> > @@ -638,6 +691,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
> >      acpi_add_table(table_offsets, tables_blob);
> >      build_spcr(tables_blob, tables->linker, guest_info);
> >  
> > +    if (nb_numa_nodes > 0) {
> > +        acpi_add_table(table_offsets, tables_blob);
> > +        build_srat(tables_blob, tables->linker, guest_info);
> > +    }
> > +
> >      /* RSDT is pointed to by RSDP */
> >      rsdt = tables_blob->len;
> >      build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> > -- 
> > 2.0.4
> > 
> >  
> 
> Thanks,
> drew 
> 

