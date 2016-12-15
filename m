Received: by 10.103.86.15 with SMTP id k15csp756764vsb;
        Thu, 15 Dec 2016 06:59:53 -0800 (PST)
X-Received: by 10.55.107.71 with SMTP id g68mr1409442qkc.259.1481813993208;
        Thu, 15 Dec 2016 06:59:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y17si1137341qka.287.2016.12.15.06.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Dec 2016 06:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHXVe-0000Ks-CT
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 09:59:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHXVW-0000Cp-7A
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 09:59:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHXVT-0002eE-5b
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 09:59:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cHXVS-0002dn-UA; Thu, 15 Dec 2016 09:59:39 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED12B21726;
	Thu, 15 Dec 2016 14:59:37 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBFExZm8011581; Thu, 15 Dec 2016 09:59:36 -0500
Date: Thu, 15 Dec 2016 15:59:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20161215155935.17a7c7b6@nial.brq.redhat.com>
In-Reply-To: <20161213214522.25548-11-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
	<20161213214522.25548-11-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 15 Dec 2016 14:59:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 10/11] hw/arm/virt: remove VirtGuestInfo
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
X-TUID: nx4CagWKUi/f

On Tue, 13 Dec 2016 22:45:21 +0100
Andrew Jones <drjones@redhat.com> wrote:

> by moving VirtGuestInfo.fw_cfg to VirtMachineState. This is the
> mach-virt equivalent of "pc: Move PcGuestInfo.fw_cfg to
> PCMachineState" and "pc: Eliminate PcGuestInfo struct" combined.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c |  7 +++----
>  hw/arm/virt.c            | 18 +++++++-----------
>  include/hw/arm/virt.h    |  6 +-----
>  3 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 137781646bec..0e6caf5f1083 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -826,11 +826,10 @@ static const VMStateDescription vmstate_virt_acpi_build = {
>  
>  void virt_acpi_setup(VirtMachineState *vms)
>  {
> -    VirtGuestInfo *guest_info = &vms->acpi_guest_info;
>      AcpiBuildTables tables;
>      AcpiBuildState *build_state;
>  
> -    if (!guest_info->fw_cfg) {
> +    if (!vms->fw_cfg) {
>          trace_virt_acpi_setup();
>          return;
>      }
> @@ -855,8 +854,8 @@ void virt_acpi_setup(VirtMachineState *vms)
>          acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
>                            "etc/table-loader", 0);
>  
> -    fw_cfg_add_file(guest_info->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
> -                    tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> +    fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
> +                    acpi_data_len(tables.tcpalog));
>  
>      build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>                                                ACPI_BUILD_RSDP_FILE, 0);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2cb2e5b4f52a..348e23ff663c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -914,15 +914,14 @@ static void create_flash(const VirtMachineState *vms,
>      }
>  }
>  
> -static void create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
> +static void create_fw_cfg(VirtMachineState *vms, AddressSpace *as)
>  {
>      hwaddr base = vms->memmap[VIRT_FW_CFG].base;
>      hwaddr size = vms->memmap[VIRT_FW_CFG].size;
> -    FWCfgState *fw_cfg;
>      char *nodename;
>  
> -    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)vms->smp_cpus);
> +    vms->fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
> +    fw_cfg_add_i16(vms->fw_cfg, FW_CFG_NB_CPUS, (uint16_t)vms->smp_cpus);
>  
>      nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
>      qemu_fdt_add_subnode(vms->fdt, nodename);
> @@ -1158,12 +1157,11 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  
>  static void virt_build_smbios(VirtMachineState *vms)
>  {
> -    FWCfgState *fw_cfg = vms->acpi_guest_info.fw_cfg;
>      uint8_t *smbios_tables, *smbios_anchor;
>      size_t smbios_tables_len, smbios_anchor_len;
>      const char *product = "QEMU Virtual Machine";
>  
> -    if (!fw_cfg) {
> +    if (!vms->fw_cfg) {
>          return;
>      }
>  
> @@ -1178,9 +1176,9 @@ static void virt_build_smbios(VirtMachineState *vms)
>                        &smbios_anchor, &smbios_anchor_len);
>  
>      if (smbios_anchor) {
> -        fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-tables",
> +        fw_cfg_add_file(vms->fw_cfg, "etc/smbios/smbios-tables",
>                          smbios_tables, smbios_tables_len);
> -        fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-anchor",
> +        fw_cfg_add_file(vms->fw_cfg, "etc/smbios/smbios-anchor",
>                          smbios_anchor, smbios_anchor_len);
>      }
>  }
> @@ -1205,7 +1203,6 @@ static void machvirt_init(MachineState *machine)
>      int n, virt_max_cpus;
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      const char *cpu_model = machine->cpu_model;
> -    VirtGuestInfo *guest_info = &vms->acpi_guest_info;
>      char **cpustr;
>      ObjectClass *oc;
>      const char *typename;
> @@ -1414,9 +1411,8 @@ static void machvirt_init(MachineState *machine)
>      create_virtio_devices(vms, pic);
>  
>      create_fw_cfg(vms, &address_space_memory);

above would look clearer as:
vms->fw_cfg = create_fw_cfg(vms, &address_space_memory);

> -    rom_set_fw(fw_cfg_find());
> +    rom_set_fw(vms->fw_cfg);
>  
> -    guest_info->fw_cfg = fw_cfg_find();
>      vms->machine_done.notify = virt_machine_done;
>      qemu_add_machine_init_done_notifier(&vms->machine_done);
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 52b35478223e..ece3260bfeb5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -81,10 +81,6 @@ typedef struct MemMapEntry {
>      hwaddr size;
>  } MemMapEntry;
>  
> -typedef struct VirtGuestInfo {
> -    FWCfgState *fw_cfg;
> -} VirtGuestInfo;
> -
>  typedef struct {
>      MachineClass parent;
>      bool disallow_affinity_adjustment;
> @@ -95,8 +91,8 @@ typedef struct {
>  
>  typedef struct {
>      MachineState parent;
> -    VirtGuestInfo acpi_guest_info;
>      Notifier machine_done;
> +    FWCfgState *fw_cfg;
>      bool secure;
>      bool highmem;
>      bool virt;

