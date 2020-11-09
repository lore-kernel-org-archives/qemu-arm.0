Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3508093lfb;
        Mon, 9 Nov 2020 02:45:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqjjKMjrLK9hNKa6Ni885KJFFOAWpo3NDr5q54+64ShVsn1O2XU09XbjFlo5SuEj8k3WJA
X-Received: by 2002:a25:a43:: with SMTP id 64mr17132952ybk.499.1604918759211;
        Mon, 09 Nov 2020 02:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604918759; cv=none;
        d=google.com; s=arc-20160816;
        b=Dxp/0X2IZoR8gVwhRlY5HAt8xoj6w34/I9se+K+SCu/Bg0sZ1+myRH8ogxCYpA0GHi
         0/AH56VgdhDNTNRPvhJLUZUe3wPuNhCR3yJx1orCvDkbXgI6TrNyASNW9pd8zFF1G37u
         gHG11zEBk/3Arc1O1R0SzNzKlRfu1wk1Uf6Sb2zjDLjKEpQ5Tda23Hr3chIROgMaANc3
         Agp/XF4HeuotVRIf4W54wLIw0xfR7qUVhVZOiR6E8fJfPFw7BH/S6fo5Sta7O4nJjzs7
         rc2fiiKkPaU8VBs31FhYyPSA5Edwr2VH/kISdp1wuB/qJWno/g5wCIqRw5jFTSDhCLDX
         +D+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=mdEZbE7sEZR6RqKBjFJ/nv0UXfJ8Rm+eGe9JB1rrIiA=;
        b=VtsS4jZXezwMcSD8H88Pt/yTbf7XjPpo25e70usFrG7a3eaAwSKaU9xGzUy9iPpv18
         d6zcDbsooor7rW1J/GjB2wjeSDLV+P84sNPovnOLpqc4hwzNfpI4D5lXjR8lUhV+wUzp
         X1O9bJiOY/Z9/HFlxmAJf7ojT5Ecd/G/cJqddHuMM930w+8JfOwvVsOfcBdnchC30/T5
         pfRafJrNw4QEjbXOLw20w6awxnyTWRf67rSgFUZvv8CQs7+v50bL8zwVyw1x/sw29AEU
         JhWv9AYHAr1gQjdABmiDwUZXpIshA3dFBvVNHAecx8SsEf9CdPwqx1X0Z9mTGMtcgrhw
         CEAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p81si8522873ybc.93.2020.11.09.02.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 02:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc4gQ-0004Hi-Fe
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 05:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1kc4gE-0004Fz-Oe; Mon, 09 Nov 2020 05:45:46 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1kc4gB-0007Fs-3I; Mon, 09 Nov 2020 05:45:46 -0500
Received: from dggeme707-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CV71c36d9z4xqQ;
 Mon,  9 Nov 2020 18:45:24 +0800 (CST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggeme707-chm.china.huawei.com (10.1.199.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 9 Nov 2020 18:45:30 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Mon, 9 Nov 2020 10:45:28 +0000
From: Salil Mehta <salil.mehta@huawei.com>
To: fangying <fangying1@huawei.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: RE: [RFC PATCH v3 01/13] hw/arm/virt: Spell out smp.cpus and
 smp.max_cpus
Thread-Topic: [RFC PATCH v3 01/13] hw/arm/virt: Spell out smp.cpus and
 smp.max_cpus
Thread-Index: AQHWtkUom9ARu8+XyESGbhKe1N4zo6m/nR8A
Date: Mon, 9 Nov 2020 10:45:28 +0000
Message-ID: <1ed3b150fb3d4a96ab15638e89422f3c@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
 <20201109030452.2197-2-fangying1@huawei.com>
In-Reply-To: <20201109030452.2197-2-fangying1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.28.252]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=salil.mehta@huawei.com; helo=szxga02-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 05:45:32
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "drjones@redhat.com" <drjones@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PWJYbN2t6qgH

Hi Fangying,
A trivial thing. This patch looks bit of a noise in this patch-set. Better
to send it as a separate patch-set and get it accepted.

Thanks

> From: fangying
> Sent: Monday, November 9, 2020 3:05 AM
> To: peter.maydell@linaro.org
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; drjones@redhat.com;
> imammedo@redhat.com; shannon.zhaosl@gmail.com; alistair.francis@wdc.com;
> Zhanghailiang <zhang.zhanghailiang@huawei.com>; Salil Mehta
> <salil.mehta@huawei.com>
> Subject: [RFC PATCH v3 01/13] hw/arm/virt: Spell out smp.cpus and smp.max=
_cpus
>=20
> From: Andrew Jones <drjones@redhat.com>
>=20
> Prefer to spell out the smp.cpus and smp.max_cpus machine state
> variables in order to make grepping easier and to avoid any
> confusion as to what cpu count is being used where.
>=20
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c |  8 +++----
>  hw/arm/virt.c            | 51 +++++++++++++++++++---------------------
>  include/hw/arm/virt.h    |  2 +-
>  3 files changed, 29 insertions(+), 32 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9747a6458f..a222981737 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -57,11 +57,11 @@
>=20
>  #define ARM_SPI_BASE 32
>=20
> -static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> +static void acpi_dsdt_add_cpus(Aml *scope, int cpus)
>  {
>      uint16_t i;
>=20
> -    for (i =3D 0; i < smp_cpus; i++) {
> +    for (i =3D 0; i < cpus; i++) {
>          Aml *dev =3D aml_device("C%.03X", i);
>          aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> @@ -480,7 +480,7 @@ build_madt(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
>      gicd->base_address =3D cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>      gicd->version =3D vms->gic_version;
>=20
> -    for (i =3D 0; i < vms->smp_cpus; i++) {
> +    for (i =3D 0; i < MACHINE(vms)->smp.cpus; i++) {
>          AcpiMadtGenericCpuInterface *gicc =3D acpi_data_push(table_data,
>                                                             sizeof(*gicc)=
);
>          ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(i));
> @@ -599,7 +599,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
>       * the RTC ACPI device at all when using UEFI.
>       */
>      scope =3D aml_scope("\\_SB");
> -    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> +    acpi_dsdt_add_cpus(scope, ms->smp.cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>      if (vmc->acpi_expose_flash) {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index e465a988d6..0069fa1298 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -322,7 +322,7 @@ static void fdt_add_timer_nodes(const VirtMachineStat=
e *vms)
>      if (vms->gic_version =3D=3D VIRT_GIC_VERSION_2) {
>          irqflags =3D deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                               GIC_FDT_IRQ_PPI_CPU_WIDTH,
> -                             (1 << vms->smp_cpus) - 1);
> +                             (1 << MACHINE(vms)->smp.cpus) - 1);
>      }
>=20
>      qemu_fdt_add_subnode(vms->fdt, "/timer");
> @@ -363,7 +363,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState =
*vms)
>       *  The simplest way to go is to examine affinity IDs of all our CPU=
s. If
>       *  at least one of them has Aff3 populated, we set #address-cells t=
o 2.
>       */
> -    for (cpu =3D 0; cpu < vms->smp_cpus; cpu++) {
> +    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
>          ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(cpu));
>=20
>          if (armcpu->mp_affinity & ARM_AFF3_MASK) {
> @@ -376,7 +376,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState =
*vms)
>      qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cell=
s);
>      qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
>=20
> -    for (cpu =3D vms->smp_cpus - 1; cpu >=3D 0; cpu--) {
> +    for (cpu =3D ms->smp.cpus - 1; cpu >=3D 0; cpu--) {
>          char *nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
>          ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(cpu));
>          CPUState *cs =3D CPU(armcpu);
> @@ -387,7 +387,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState =
*vms)
>                                      armcpu->dtb_compatible);
>=20
>          if (vms->psci_conduit !=3D QEMU_PSCI_CONDUIT_DISABLED
> -            && vms->smp_cpus > 1) {
> +            && ms->smp.cpus > 1) {
>              qemu_fdt_setprop_string(vms->fdt, nodename,
>                                          "enable-method", "psci");
>          }
> @@ -533,7 +533,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState =
*vms)
>      if (vms->gic_version =3D=3D VIRT_GIC_VERSION_2) {
>          irqflags =3D deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                               GIC_FDT_IRQ_PPI_CPU_WIDTH,
> -                             (1 << vms->smp_cpus) - 1);
> +                             (1 << MACHINE(vms)->smp.cpus) - 1);
>      }
>=20
>      qemu_fdt_add_subnode(vms->fdt, "/pmu");
> @@ -622,14 +622,13 @@ static void create_gic(VirtMachineState *vms)
>      SysBusDevice *gicbusdev;
>      const char *gictype;
>      int type =3D vms->gic_version, i;
> -    unsigned int smp_cpus =3D ms->smp.cpus;
>      uint32_t nb_redist_regions =3D 0;
>=20
>      gictype =3D (type =3D=3D 3) ? gicv3_class_name() : gic_class_name();
>=20
>      vms->gic =3D qdev_new(gictype);
>      qdev_prop_set_uint32(vms->gic, "revision", type);
> -    qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
> +    qdev_prop_set_uint32(vms->gic, "num-cpu", ms->smp.cpus);
>      /* Note that the num-irq property counts both internal and external
>       * interrupts; there are always 32 of the former (mandated by GIC sp=
ec).
>       */
> @@ -641,7 +640,7 @@ static void create_gic(VirtMachineState *vms)
>      if (type =3D=3D 3) {
>          uint32_t redist0_capacity =3D
>                      vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZ=
E;
> -        uint32_t redist0_count =3D MIN(smp_cpus, redist0_capacity);
> +        uint32_t redist0_count =3D MIN(ms->smp.cpus, redist0_capacity);
>=20
>          nb_redist_regions =3D virt_gicv3_redist_region_count(vms);
>=20
> @@ -654,7 +653,7 @@ static void create_gic(VirtMachineState *vms)
>                      vms->memmap[VIRT_HIGH_GIC_REDIST2].size /
> GICV3_REDIST_SIZE;
>=20
>              qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
> -                MIN(smp_cpus - redist0_count, redist1_capacity));
> +                MIN(ms->smp.cpus - redist0_count, redist1_capacity));
>          }
>      } else {
>          if (!kvm_irqchip_in_kernel()) {
> @@ -683,7 +682,7 @@ static void create_gic(VirtMachineState *vms)
>       * maintenance interrupt signal to the appropriate GIC PPI inputs,
>       * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's in=
puts.
>       */
> -    for (i =3D 0; i < smp_cpus; i++) {
> +    for (i =3D 0; i < ms->smp.cpus; i++) {
>          DeviceState *cpudev =3D DEVICE(qemu_get_cpu(i));
>          int ppibase =3D NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
>          int irq;
> @@ -711,7 +710,7 @@ static void create_gic(VirtMachineState *vms)
>          } else if (vms->virt) {
>              qemu_irq irq =3D qdev_get_gpio_in(vms->gic,
>                                              ppibase + ARCH_GIC_MAINT_IRQ=
);
> -            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
> +            sysbus_connect_irq(gicbusdev, i + 4 * ms->smp.cpus, irq);
>          }
>=20
>          qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> @@ -719,11 +718,11 @@ static void create_gic(VirtMachineState *vms)
>                                                       + VIRTUAL_PMU_IRQ))=
;
>=20
>          sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev,
> ARM_CPU_IRQ));
> -        sysbus_connect_irq(gicbusdev, i + smp_cpus,
> +        sysbus_connect_irq(gicbusdev, i + ms->smp.cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> -        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
> +        sysbus_connect_irq(gicbusdev, i + 2 * ms->smp.cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> -        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
> +        sysbus_connect_irq(gicbusdev, i + 3 * ms->smp.cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
>      }
>=20
> @@ -1572,7 +1571,7 @@ static void virt_set_memmap(VirtMachineState *vms)
>   */
>  static void finalize_gic_version(VirtMachineState *vms)
>  {
> -    unsigned int max_cpus =3D MACHINE(vms)->smp.max_cpus;
> +    MachineState *ms =3D MACHINE(vms);
>=20
>      if (kvm_enabled()) {
>          int probe_bitmap;
> @@ -1613,7 +1612,8 @@ static void finalize_gic_version(VirtMachineState *=
vms)
>              }
>              return;
>          case VIRT_GIC_VERSION_NOSEL:
> -            if ((probe_bitmap & KVM_ARM_VGIC_V2) && max_cpus <=3D GIC_NC=
PU) {
> +            if ((probe_bitmap & KVM_ARM_VGIC_V2) &&
> +                ms->smp.max_cpus <=3D GIC_NCPU) {
>                  vms->gic_version =3D VIRT_GIC_VERSION_2;
>              } else if (probe_bitmap & KVM_ARM_VGIC_V3) {
>                  /*
> @@ -1622,7 +1622,7 @@ static void finalize_gic_version(VirtMachineState *=
vms)
>                   * to v3. In any case defaulting to v2 would be broken.
>                   */
>                  vms->gic_version =3D VIRT_GIC_VERSION_3;
> -            } else if (max_cpus > GIC_NCPU) {
> +            } else if (ms->smp.max_cpus > GIC_NCPU) {
>                  error_report("host only supports in-kernel GICv2 emulati=
on "
>                               "but more than 8 vcpus are requested");
>                  exit(1);
> @@ -1743,8 +1743,6 @@ static void machvirt_init(MachineState *machine)
>      bool firmware_loaded;
>      bool aarch64 =3D true;
>      bool has_ged =3D !vmc->no_ged;
> -    unsigned int smp_cpus =3D machine->smp.cpus;
> -    unsigned int max_cpus =3D machine->smp.max_cpus;
>=20
>      /*
>       * In accelerated mode, the memory map is computed earlier in kvm_ty=
pe()
> @@ -1815,10 +1813,10 @@ static void machvirt_init(MachineState *machine)
>          virt_max_cpus =3D GIC_NCPU;
>      }
>=20
> -    if (max_cpus > virt_max_cpus) {
> +    if (machine->smp.max_cpus > virt_max_cpus) {
>          error_report("Number of SMP CPUs requested (%d) exceeds max CPUs=
 "
>                       "supported by machine 'mach-virt' (%d)",
> -                     max_cpus, virt_max_cpus);
> +                     machine->smp.max_cpus, virt_max_cpus);
>          exit(1);
>      }
>=20
> @@ -1843,7 +1841,7 @@ static void machvirt_init(MachineState *machine)
>          Object *cpuobj;
>          CPUState *cs;
>=20
> -        if (n >=3D smp_cpus) {
> +        if (n >=3D machine->smp.cpus) {
>              break;
>          }
>=20
> @@ -2015,7 +2013,7 @@ static void machvirt_init(MachineState *machine)
>      }
>=20
>      vms->bootinfo.ram_size =3D machine->ram_size;
> -    vms->bootinfo.nb_cpus =3D smp_cpus;
> +    vms->bootinfo.nb_cpus =3D machine->smp.cpus;
>      vms->bootinfo.board_id =3D -1;
>      vms->bootinfo.loader_start =3D vms->memmap[VIRT_MEM].base;
>      vms->bootinfo.get_dtb =3D machvirt_dtb;
> @@ -2208,17 +2206,16 @@ static int64_t virt_get_default_cpu_node_id(const
> MachineState *ms, int idx)
>  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>  {
>      int n;
> -    unsigned int max_cpus =3D ms->smp.max_cpus;
>      VirtMachineState *vms =3D VIRT_MACHINE(ms);
>=20
>      if (ms->possible_cpus) {
> -        assert(ms->possible_cpus->len =3D=3D max_cpus);
> +        assert(ms->possible_cpus->len =3D=3D ms->smp.max_cpus);
>          return ms->possible_cpus;
>      }
>=20
>      ms->possible_cpus =3D g_malloc0(sizeof(CPUArchIdList) +
> -                                  sizeof(CPUArchId) * max_cpus);
> -    ms->possible_cpus->len =3D max_cpus;
> +                                  sizeof(CPUArchId) * ms->smp.max_cpus);
> +    ms->possible_cpus->len =3D ms->smp.max_cpus;
>      for (n =3D 0; n < ms->possible_cpus->len; n++) {
>          ms->possible_cpus->cpus[n].type =3D ms->cpu_type;
>          ms->possible_cpus->cpus[n].arch_id =3D
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index aad6d69841..953d94acc0 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -181,7 +181,7 @@ static inline int
> virt_gicv3_redist_region_count(VirtMachineState *vms)
>=20
>      assert(vms->gic_version =3D=3D VIRT_GIC_VERSION_3);
>=20
> -    return vms->smp_cpus > redist0_capacity ? 2 : 1;
> +    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
>  }
>=20
>  #endif /* QEMU_ARM_VIRT_H */
> --
> 2.23.0

