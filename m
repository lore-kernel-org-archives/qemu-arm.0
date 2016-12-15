Received: by 10.103.86.15 with SMTP id k15csp760278vsb;
        Thu, 15 Dec 2016 07:05:25 -0800 (PST)
X-Received: by 10.55.135.197 with SMTP id j188mr1498141qkd.71.1481814325790;
        Thu, 15 Dec 2016 07:05:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id w62si1157478qkc.150.2016.12.15.07.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Dec 2016 07:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHXb0-0005LC-RO
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 10:05:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHXae-0004fX-8M
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 10:05:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHXaZ-0005UW-8k
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 10:05:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38952)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cHXaY-0005UC-Vu; Thu, 15 Dec 2016 10:04:55 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB8227F7D5;
	Thu, 15 Dec 2016 15:04:53 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBFF4pDE019196; Thu, 15 Dec 2016 10:04:51 -0500
Date: Thu, 15 Dec 2016 16:04:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20161215160450.45455d58@nial.brq.redhat.com>
In-Reply-To: <20161213214522.25548-9-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
	<20161213214522.25548-9-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 15 Dec 2016 15:04:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 08/11] hw/arm/virt-acpi-build: remove
 redundant members from VirtGuestInfo
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mmi0TGRdbzN4

On Tue, 13 Dec 2016 22:45:19 +0100
Andrew Jones <drjones@redhat.com> wrote:

> Now that we pass VirtMachineState, and guest-info is just part of
> that state, we can remove all the redundant members and access
> the VirtMachineState directly.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 72 +++++++++++++++++++++++++-----------------------
>  hw/arm/virt.c            |  6 ----
>  include/hw/arm/virt.h    |  6 ----
>  3 files changed, 37 insertions(+), 47 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f7ce6aeed307..7a1efd0dc538 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -384,7 +384,7 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
>  }
>  
>  static void
> -build_iort(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
> +build_iort(GArray *table_data, BIOSLinker *linker)
>  {
>      int iort_start = table_data->len;
>      AcpiIortIdMapping *idmap;
> @@ -439,11 +439,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>  }
>  
>  static void
> -build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
> +build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      AcpiSerialPortConsoleRedirection *spcr;
> -    const MemMapEntry *uart_memmap = &guest_info->memmap[VIRT_UART];
> -    int irq = guest_info->irqmap[VIRT_UART] + ARM_SPI_BASE;
> +    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
> +    int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
>  
>      spcr = acpi_data_push(table_data, sizeof(*spcr));
>  
> @@ -472,16 +472,16 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>  }
>  
>  static void
> -build_srat(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
> +build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      AcpiSystemResourceAffinityTable *srat;
>      AcpiSratProcessorGiccAffinity *core;
>      AcpiSratMemoryAffinity *numamem;
>      int i, j, srat_start;
>      uint64_t mem_base;
> -    uint32_t *cpu_node = g_malloc0(guest_info->smp_cpus * sizeof(uint32_t));
> +    uint32_t *cpu_node = g_malloc0(vms->smp_cpus * sizeof(uint32_t));
>  
> -    for (i = 0; i < guest_info->smp_cpus; i++) {
> +    for (i = 0; i < vms->smp_cpus; i++) {
>          j = numa_get_node_for_cpu(i);
>          if (j < nb_numa_nodes) {
>                  cpu_node[i] = j;
> @@ -492,7 +492,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>      srat = acpi_data_push(table_data, sizeof(*srat));
>      srat->reserved1 = cpu_to_le32(1);
>  
> -    for (i = 0; i < guest_info->smp_cpus; ++i) {
> +    for (i = 0; i < vms->smp_cpus; ++i) {
>          core = acpi_data_push(table_data, sizeof(*core));
>          core->type = ACPI_SRAT_PROCESSOR_GICC;
>          core->length = sizeof(*core);
> @@ -502,7 +502,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>      }
>      g_free(cpu_node);
>  
> -    mem_base = guest_info->memmap[VIRT_MEM].base;
> +    mem_base = vms->memmap[VIRT_MEM].base;
>      for (i = 0; i < nb_numa_nodes; ++i) {
>          numamem = acpi_data_push(table_data, sizeof(*numamem));
>          build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> @@ -515,10 +515,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>  }
>  
>  static void
> -build_mcfg(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
> +build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      AcpiTableMcfg *mcfg;
> -    const MemMapEntry *memmap = guest_info->memmap;
> +    const MemMapEntry *memmap = vms->memmap;
>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>  
>      mcfg = acpi_data_push(table_data, len);
> @@ -561,11 +561,12 @@ build_gtdt(GArray *table_data, BIOSLinker *linker)
>  
>  /* MADT */
>  static void
> -build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
> +build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      int madt_start = table_data->len;
> -    const MemMapEntry *memmap = guest_info->memmap;
> -    const int *irqmap = guest_info->irqmap;
> +    const MemMapEntry *memmap = vms->memmap;
> +    const int *irqmap = vms->irqmap;
>      AcpiMultipleApicTable *madt;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
> @@ -577,16 +578,16 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>      gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
>      gicd->length = sizeof(*gicd);
>      gicd->base_address = memmap[VIRT_GIC_DIST].base;
> -    gicd->version = guest_info->gic_version;
> +    gicd->version = vms->gic_version;
>  
> -    for (i = 0; i < guest_info->smp_cpus; i++) {
> +    for (i = 0; i < vms->smp_cpus; i++) {
>          AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
>                                                       sizeof *gicc);
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>  
>          gicc->type = ACPI_APIC_GENERIC_INTERRUPT;
>          gicc->length = sizeof(*gicc);
> -        if (guest_info->gic_version == 2) {
> +        if (vms->gic_version == 2) {
>              gicc->base_address = memmap[VIRT_GIC_CPU].base;
>          }
>          gicc->cpu_interface_number = i;
> @@ -599,7 +600,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>          }
>      }
>  
> -    if (guest_info->gic_version == 3) {
> +    if (vms->gic_version == 3) {
>          AcpiMadtGenericTranslator *gic_its;
>          AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
>                                                           sizeof *gicr);
> @@ -609,7 +610,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>          gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
>          gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
>  
> -        if (its_class_name() && !guest_info->no_its) {
> +        if (its_class_name() && !vmc->no_its) {
>              gic_its = acpi_data_push(table_data, sizeof *gic_its);
>              gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
>              gic_its->length = sizeof(*gic_its);
> @@ -658,11 +659,11 @@ build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt_tbl_offset)
>  
>  /* DSDT */
>  static void
> -build_dsdt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
> +build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      Aml *scope, *dsdt;
> -    const MemMapEntry *memmap = guest_info->memmap;
> -    const int *irqmap = guest_info->irqmap;
> +    const MemMapEntry *memmap = vms->memmap;
> +    const int *irqmap = vms->irqmap;
>  
>      dsdt = init_aml_allocator();
>      /* Reserve space for header */
> @@ -674,7 +675,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>       * the RTC ACPI device at all when using UEFI.
>       */
>      scope = aml_scope("\\_SB");
> -    acpi_dsdt_add_cpus(scope, guest_info->smp_cpus);
> +    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> @@ -682,7 +683,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
> -                      guest_info->use_highmem);
> +                      vms->highmem);
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      acpi_dsdt_add_power_button(scope);
> @@ -709,8 +710,9 @@ struct AcpiBuildState {
>  } AcpiBuildState;
>  
>  static
> -void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
> +void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      GArray *table_offsets;
>      unsigned dsdt, rsdt;
>      GArray *tables_blob = tables->table_data;
> @@ -724,32 +726,32 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>  
>      /* DSDT is pointed to by FADT */
>      dsdt = tables_blob->len;
> -    build_dsdt(tables_blob, tables->linker, guest_info);
> +    build_dsdt(tables_blob, tables->linker, vms);
>  
>      /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt(tables_blob, tables->linker, dsdt);
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_madt(tables_blob, tables->linker, guest_info);
> +    build_madt(tables_blob, tables->linker, vms);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker);
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_mcfg(tables_blob, tables->linker, guest_info);
> +    build_mcfg(tables_blob, tables->linker, vms);
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_spcr(tables_blob, tables->linker, guest_info);
> +    build_spcr(tables_blob, tables->linker, vms);
>  
>      if (nb_numa_nodes > 0) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_srat(tables_blob, tables->linker, guest_info);
> +        build_srat(tables_blob, tables->linker, vms);
>      }
>  
> -    if (its_class_name() && !guest_info->no_its) {
> +    if (its_class_name() && !vmc->no_its) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_iort(tables_blob, tables->linker, guest_info);
> +        build_iort(tables_blob, tables->linker);
>      }
>  
>      /* RSDT is pointed to by RSDP */
> @@ -788,13 +790,13 @@ static void virt_acpi_build_update(void *build_opaque)
>  
>      acpi_build_tables_init(&tables);
>  
> -    virt_acpi_build(build_state->guest_info, &tables);
> +    virt_acpi_build(container_of(build_state->guest_info,
> +                                 VirtMachineState, acpi_guest_info), &tables);
>  
>      acpi_ram_update(build_state->table_mr, tables.table_data);
>      acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
>      acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
>  
> -
>      acpi_build_tables_cleanup(&tables, true);
>  }
>  
> @@ -842,7 +844,7 @@ void virt_acpi_setup(VirtMachineState *vms)
>      build_state->guest_info = guest_info;
>  
>      acpi_build_tables_init(&tables);
> -    virt_acpi_build(build_state->guest_info, &tables);
> +    virt_acpi_build(vms, &tables);
>  
>      /* Now expose it all to Guest */
>      build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index bcf8a2954c16..2cb2e5b4f52a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1416,13 +1416,7 @@ static void machvirt_init(MachineState *machine)
>      create_fw_cfg(vms, &address_space_memory);
>      rom_set_fw(fw_cfg_find());
>  
> -    guest_info->smp_cpus = vms->smp_cpus;
>      guest_info->fw_cfg = fw_cfg_find();
> -    guest_info->memmap = vms->memmap;
> -    guest_info->irqmap = vms->irqmap;
> -    guest_info->use_highmem = vms->highmem;
> -    guest_info->gic_version = vms->gic_version;
> -    guest_info->no_its = vmc->no_its;
>      vms->machine_done.notify = virt_machine_done;
>      qemu_add_machine_init_done_notifier(&vms->machine_done);
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index cbedc682ae99..52b35478223e 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -82,13 +82,7 @@ typedef struct MemMapEntry {
>  } MemMapEntry;
>  
>  typedef struct VirtGuestInfo {
> -    int smp_cpus;
>      FWCfgState *fw_cfg;
> -    const MemMapEntry *memmap;
> -    const int *irqmap;
> -    bool use_highmem;
> -    int gic_version;
> -    bool no_its;
>  } VirtGuestInfo;
>  
>  typedef struct {

