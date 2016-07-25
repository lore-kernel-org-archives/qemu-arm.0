Received: by 10.25.21.156 with SMTP id 28csp1250788lfv;
        Mon, 25 Jul 2016 09:06:11 -0700 (PDT)
X-Received: by 10.237.53.125 with SMTP id b58mr28999258qte.104.1469462771592;
        Mon, 25 Jul 2016 09:06:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si18315101qki.72.2016.07.25.09.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 09:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRiOQ-0008Ly-VI
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 12:06:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiOK-0008I7-2V
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiOH-00083J-Mf
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:06:02 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33658)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiOH-000830-24
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:06:01 -0400
Received: by mail-vk0-x231.google.com with SMTP id x130so250372028vkc.0
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DqLkCn9VmIXuNmTJ55hy85hJ7Iut9O/Xxr2niohhEL8=;
	b=kD0QdpJiBy8Au8iCBYD6z6wyxhUMYeC1okZLF+1XFxftPo9ImsBFSqwacXVPdniQs5
	mIBV62MJdPitDUqUEgBJnG0gW0oveXuXfxsmbfZmUc6R0TX53X1l+l69dE7E8YDKaSGF
	grCD+8nqrc/ZGaz5z+etd4XLk+cQ7oQku0ur8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DqLkCn9VmIXuNmTJ55hy85hJ7Iut9O/Xxr2niohhEL8=;
	b=hiS/zKaMAXqBnVEFvOvX+K4vv+hmIU+7IS65SvekoCOwvIRA3QRpbShAxUkvi4LVew
	uOWkxFq2k5rAvphho81xZEF1EqLQEt/GhfCRulE21Zf60FzAPUMT2NCovdNVYEJF+hfb
	P0X0tD6xv3IwB3Y8NlFJHFaQEnAgrrH4DMGRGTGU/CqCswH251KDS6lNYnmvedVSr5/d
	hK5NTlh57HrGEYyyiaPlKRIoGjnYvR5L1ExY35RX1LJ6d/3IAxTcZaBXE81BxABK8NGW
	0sVUdIUc9wJ1BKZ6IdU+r8l06RDv54mdbzGgXLutO2k/CoKj+nbA+5j4N9rZvJIFTG9t
	Uu9w==
X-Gm-Message-State: AEkoousT0wFeGw5MjgnsyuS99eJRfdkseH2dkeAisvOIhDnXEQ+6Be/61j1McSJjrZTCf4cit8QWavM8aWfv1DZ3
X-Received: by 10.176.5.138 with SMTP id e10mr7157400uae.38.1469462760208;
	Mon, 25 Jul 2016 09:06:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 09:05:40 -0700 (PDT)
In-Reply-To: <1468975744-12587-4-git-send-email-kwangwoo.lee@sk.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-4-git-send-email-kwangwoo.lee@sk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 17:05:40 +0100
Message-ID: <CAFEAcA-_MMatknCSDDRX-V7MiM1rJzvWHYwc_Eurt1b_xyajaQ@mail.gmail.com>
To: Kwangwoo Lee <kwangwoo.lee@sk.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [RFC PATCH 3/3] hw/arm/virt: add nvdimm emulation
 support
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Woosuk Chung <woosuk.chung@sk.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Hyunchul Kim <hyunchul3.kim@sk.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T6Lsa39W5XQn

On 20 July 2016 at 01:49, Kwangwoo Lee <kwangwoo.lee@sk.com> wrote:
> This patch enables evaluating NVDIMM on aarch64 virt platform. The
> option - nvdimm - passed after machine type is disabled by default.
>
> The command below has been used to test the feature:
>
> ./aarch64-softmmu/qemu-system-aarch64                          \
>     -machine type=virt,nvdimm=on                               \
>     -cpu cortex-a57 -smp 1                                     \
>     -bios ~/oss/edk2/Build/ArmVirtQemu-AARCH64/DEBUG_GCC49/FV/QEMU_EFI.fd \
>     -m 512,maxmem=2G,slots=2                                   \
>     -object memory-backend-file,id=mem1,share,mem-path=./nvdimm1,size=1G \
>     -device nvdimm,memdev=mem1,id=nv1                          \
>     -fsdev local,id=r,path=/media/sf_Share,security_model=none \
>     -device virtio-9p-device,fsdev=r,mount_tag=r               \
>     -kernel ../linux/arch/arm64/boot/Image                     \
>     --append "console=ttyAMA0 acpi=force"                      \
>     -nographic
>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> ---
>  default-configs/aarch64-softmmu.mak |  2 ++
>  hw/arm/virt-acpi-build.c            |  5 +++++
>  hw/arm/virt.c                       | 34 ++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt-acpi-build.h    |  1 +
>  include/hw/arm/virt.h               |  4 ++++
>  5 files changed, 46 insertions(+)
>
> diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
> index 5790cd2..295816b 100644
> --- a/default-configs/aarch64-softmmu.mak
> +++ b/default-configs/aarch64-softmmu.mak
> @@ -8,3 +8,5 @@ CONFIG_DDC=y
>  CONFIG_DPCD=y
>  CONFIG_XLNX_ZYNQMP=y
>  CONFIG_MEM_HOTPLUG=y
> +CONFIG_NVDIMM=y
> +CONFIG_ACPI_NVDIMM=y
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 28fc59c..c3caaa9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -648,6 +648,7 @@ struct AcpiBuildState {
>  static
>  void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>  {
> +    AcpiNVDIMMState *acpi_nvdimm = guest_info->acpi_nvdimm;
>      GArray *table_offsets;
>      unsigned dsdt, rsdt;
>      GArray *tables_blob = tables->table_data;
> @@ -695,6 +696,10 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>          build_srat(tables_blob, tables->linker, guest_info);
>      }
>
> +    if (acpi_nvdimm->is_enabled) {
> +        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> +                          acpi_nvdimm);
> +    }
>      /* RSDT is pointed to by RSDP */
>      rsdt = tables_blob->len;
>      build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f7ff411..f9db19c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -94,6 +94,7 @@ typedef struct {
>      bool highmem;
>      int32_t gic_version;
>      MemoryHotplugState hotplug_memory;
> +    AcpiNVDIMMState acpi_nvdimm;
>  } VirtMachineState;
>
>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> @@ -180,6 +181,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> +    [VIRT_ACPI_IO] =            { 0x09050000, 0x00001000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -1376,6 +1378,7 @@ static void machvirt_init(MachineState *machine)
>      guest_info->irqmap = vbi->irqmap;
>      guest_info->use_highmem = vms->highmem;
>      guest_info->gic_version = gic_version;
> +    guest_info->acpi_nvdimm = &vms->acpi_nvdimm;
>      guest_info_state->machine_done.notify = virt_guest_info_machine_done;
>      qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
>
> @@ -1413,6 +1416,18 @@ static void machvirt_init(MachineState *machine)
>                                      &vms->hotplug_memory.mr);
>      }
>
> +    if (vms->acpi_nvdimm.is_enabled) {
> +        AcpiNVDIMMState *acpi_nvdimm = &vms->acpi_nvdimm;
> +
> +        acpi_nvdimm->dsm_io.type = NVDIMM_ACPI_IO_MEMORY;
> +        acpi_nvdimm->dsm_io.base =
> +                vbi->memmap[VIRT_ACPI_IO].base + NVDIMM_ACPI_IO_BASE;
> +        acpi_nvdimm->dsm_io.size = NVDIMM_ACPI_IO_LEN;
> +
> +        nvdimm_init_acpi_state(acpi_nvdimm, sysmem,
> +                               guest_info->fw_cfg, OBJECT(vms));
> +    }

This seems to be missing code to write the device tree
information about whatever this device is?

> +
>      vbi->bootinfo.ram_size = machine->ram_size;
>      vbi->bootinfo.kernel_filename = machine->kernel_filename;
>      vbi->bootinfo.kernel_cmdline = machine->kernel_cmdline;
> @@ -1550,6 +1565,20 @@ static HotplugHandler *virt_get_hotplug_handler(MachineState *machine,
>      return NULL;
>  }
>
> +static bool virt_get_nvdimm(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->acpi_nvdimm.is_enabled;
> +}
> +
> +static void virt_set_nvdimm(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->acpi_nvdimm.is_enabled = value;
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1620,6 +1649,11 @@ static void virt_2_7_instance_init(Object *obj)
>      object_property_set_description(obj, "gic-version",
>                                      "Set GIC version. "
>                                      "Valid values are 2, 3 and host", NULL);
> +
> +    /* nvdimm is disabled on default. */
> +    vms->acpi_nvdimm.is_enabled = false;
> +    object_property_add_bool(obj, ARCH_VIRT_NVDIMM, virt_get_nvdimm,
> +                             virt_set_nvdimm, &error_abort);
>  }
>
>  static void virt_machine_2_7_options(MachineClass *mc)
> diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
> index e43330a..167bbb4 100644
> --- a/include/hw/arm/virt-acpi-build.h
> +++ b/include/hw/arm/virt-acpi-build.h
> @@ -33,6 +33,7 @@ typedef struct VirtGuestInfo {
>      const int *irqmap;
>      bool use_highmem;
>      int gic_version;
> +    AcpiNVDIMMState *acpi_nvdimm;
>  } VirtGuestInfo;
>
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 35aa3cc..c5cf7e3 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -32,6 +32,7 @@
>
>  #include "qemu-common.h"
>  #include "exec/hwaddr.h"
> +#include "hw/mem/nvdimm.h"
>
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -48,6 +49,8 @@
>  /* 1GB alignment for hotplug memory region */
>  #define ARCH_VIRT_HOTPLUG_MEM_ALIGN (1ULL << 30)
>
> +#define ARCH_VIRT_NVDIMM      "nvdimm"

Why the #define ?

> +
>  enum {
>      VIRT_FLASH,
>      VIRT_MEM,
> @@ -70,6 +73,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_ACPI_IO,
>  };
>
>  typedef struct MemMapEntry {
> --
> 2.5.0

thanks
-- PMM
