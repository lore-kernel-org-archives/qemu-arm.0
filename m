Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7095924wrx;
        Fri, 22 Feb 2019 07:48:00 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaYr2LAYizT0765nRD7ByXl6N0pYEhBTu53NL6HxotiBwNPeBR+VA2zKUNFLsUYqMpRZz4l
X-Received: by 2002:a0d:ea4e:: with SMTP id t75mr3900041ywe.476.1550850480206;
        Fri, 22 Feb 2019 07:48:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550850480; cv=none;
        d=google.com; s=arc-20160816;
        b=J90bS9GhQcxZLixnKrsv7FoV9DxlQ/XjyeYSpsIRYrOWPzFdjeXuNdfeiACCN+4MgJ
         rez+VMMMVTMLk0xaaRHdbJjsIIhWboht8BnJ/+vDn16206+x/ylZitn9uZ2e1FKZKs5o
         1N+ujmJqsxt7jAWEE2PFkapUO+PTo8nKDxLHNzCDaAo/sbozq/DNnwcKpBak/Dd7aKg4
         qxf/h65ltN2vomumo8fJdHRMjPyFslCvSPa9+OcZV80a2edIzrmvRKi1oyIPSKR/UWAx
         khqYhsjRN72FhbyUxvlyqkwCJcP1ZyCQpGWwW9E7dq5Q9355CejOCMIYl7lM3saQccs2
         KdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=rIPWRvg1fUXAIAWpu/z6nY747+oRDsV7Yuwbgqgo88Q=;
        b=a+TtRgjLoD3QQefD0O0nBBTcn6D59zB+k7l6NioTgZq6Vk1SnmYYJkeX65R8m82GBV
         mS8D0KHKjXSxskGKXE71C+085r1zlw5JUTl9wufkDloG6cQWURY/Vv9vhetoAfZxm3Gl
         2WtvwgcUjeQxMDUoqsQaxGcf+jujeh1rRQf7B/gfzr/GC7YC/kGGPOkx6TnNudughzXy
         XNO1uuHQnesu4OTNsivdufd2kBy51sw8jcDuClPQQRZo46v6/+dM3e0zE5c60qjZZVYX
         4xpgHsxQwDxJsyMUOXLOqgt5nfItZ6hwA2gNUWZs2Alxrncq1ipsGwpgsizCHj/yUB7h
         p7ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q185si1060302ywb.369.2019.02.22.07.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 07:48:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxD3P-0001YN-Ky
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 10:47:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxCsj-0006Mz-KK
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 10:36:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxCsi-0000tb-HW
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 10:36:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxCsh-0000oP-0i; Fri, 22 Feb 2019 10:36:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F9C03688B;
	Fri, 22 Feb 2019 15:36:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46A3328541;
	Fri, 22 Feb 2019 15:36:44 +0000 (UTC)
Date: Fri, 22 Feb 2019 16:36:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222163642.51cff565@redhat.com>
In-Reply-To: <20190220224003.4420-16-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-16-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 22 Feb 2019 15:36:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 15/17] hw/arm/virt: Add
 nvdimm hot-plug infrastructure
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zkam4MNe6RyK

On Wed, 20 Feb 2019 23:40:01 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Kwangwoo Lee <kwangwoo.lee@sk.com>
> 
> Pre-plug and plug handlers are prepared for NVDIMM support.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> ---
>  default-configs/arm-softmmu.mak |  2 ++
>  hw/arm/virt-acpi-build.c        |  6 ++++++
>  hw/arm/virt.c                   | 22 ++++++++++++++++++++++
>  include/hw/arm/virt.h           |  3 +++
>  4 files changed, 33 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 0a78421f72..03dbebb197 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -165,3 +165,5 @@ CONFIG_HIGHBANK=y
>  CONFIG_MUSICPAL=y
>  CONFIG_MEM_DEVICE=y
>  CONFIG_DIMM=y
> +CONFIG_NVDIMM=y
> +CONFIG_ACPI_NVDIMM=y
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 781eafaf5e..f086adfa82 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -784,6 +784,7 @@ static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      GArray *table_offsets;
>      unsigned dsdt, xsdt;
>      GArray *tables_blob = tables->table_data;
> @@ -824,6 +825,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>          }
>      }
>  
> +    if (vms->acpi_nvdimm_state.is_enabled) {
> +        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> +                          &vms->acpi_nvdimm_state, ms->ram_slots);
> +    }
> +
>      if (its_class_name() && !vmc->no_its) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_iort(tables_blob, tables->linker, vms);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 33ad9b3f63..1896920570 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -134,6 +134,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_ACPI_IO] =            { 0x09070000, 0x00010000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -1675,6 +1676,18 @@ static void machvirt_init(MachineState *machine)
>  
>      create_platform_bus(vms, pic);
>  
> +    if (vms->acpi_nvdimm_state.is_enabled) {
> +        AcpiNVDIMMState *acpi_nvdimm_state = &vms->acpi_nvdimm_state;
> +
> +        acpi_nvdimm_state->dsm_io.space_id = AML_AS_SYSTEM_MEMORY;
> +        acpi_nvdimm_state->dsm_io.address =
> +                vms->memmap[VIRT_ACPI_IO].base + NVDIMM_ACPI_IO_BASE;
> +        acpi_nvdimm_state->dsm_io.bit_width = NVDIMM_ACPI_IO_LEN << 3;
I'd prefer following style (well at least that's direction I try to push
towards to when dealing with ACPI)

           const AcpiGenericAddress dsmio = {
               .space_id = AML_AS_SYSTEM_MEMORY,
               .address = vms->memmap[VIRT_ACPI_IO].base + NVDIMM_ACPI_IO_BASE,
               .bit_width = NVDIMM_ACPI_IO_LEN << 3
           };

           
           nvdimm_init_acpi_state(&vms->acpi_nvdimm_state, sysmem, &dsmio,
                                  vms->fw_cfg, OBJECT(vms),);

> +
> +        nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
> +                               vms->fw_cfg, OBJECT(vms));
> +    }
> +
>      vms->bootinfo.ram_size = machine->ram_size;
>      vms->bootinfo.kernel_filename = machine->kernel_filename;
>      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
> @@ -1860,10 +1873,19 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                               DeviceState *dev, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>      Error *local_err = NULL;
>  
>      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
>  
> +    if (is_nvdimm) {
> +        nvdimm_plug(&vms->acpi_nvdimm_state);
> +    }
> +
> +out:
>      error_propagate(errp, local_err);
>  }
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 7798462cb0..bd9cf68311 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -37,6 +37,7 @@
>  #include "hw/arm/arm.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
> +#include "hw/mem/nvdimm.h"
>  
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -77,6 +78,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_ACPI_IO,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> @@ -137,6 +139,7 @@ typedef struct {
>      hwaddr device_memory_base;
>      hwaddr device_memory_size;
>      bool extended_memmap;
> +    AcpiNVDIMMState acpi_nvdimm_state;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

