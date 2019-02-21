Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5865869wrx;
        Thu, 21 Feb 2019 07:07:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbIE7a8RtEWy6HdNYj88a6LSkuoPon5fh799Z/ok75BE4P5t/m6Wi8WMIV0bh09zwwVzMHQ
X-Received: by 2002:a25:5f49:: with SMTP id h9mr6692588ybm.232.1550761630069;
        Thu, 21 Feb 2019 07:07:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550761630; cv=none;
        d=google.com; s=arc-20160816;
        b=AeXFy07ApyG2T72lMC2ZA9eIwKcoMk478gQgxYZAb19oGCYi55I/Xer+eKNT4AdXfu
         REhfhG2L53hEbdriAe6y6sGXsqK8EaXiFi8KV1xePbYSWqOxCgWiJx8BnIgxzUHO3fH4
         W5M/eVgR9eePtMj83QkjMJCimJ0tYVoQsfdgJR77EA8Hk+TWcoqPKfaFMcHaeBF8ZxNi
         Se/wvHpgoFjvipVJewIO5BPzwiXIkP77wCXHVgIaBrhJTT8gj5cDDC0TgRijdifvIr4D
         aFJS5NbuWqJHaF7yEpqnnOxMT8Vn7sDLDYhCbWRvbf2P4s24QpGnTBdpR7B2B0IOyjoX
         60Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=K21gH5A7edwnxWks4RFVCiOSYVtVsKHds6cPU+hY9tg=;
        b=OoSMH9Kr9DUefZcwbaD2TmoFXC2xZW1baqH9Lti9meoYdGXHD7HXkY2URRGXJ7cKwU
         Oq957mEocnaMYU6L9l2NZVYd2yNivHdCtiEMyyInc65lJvWKfwxqru1DwZVQTqhK3kUk
         LChJIT95lf43VTx+XGsmAzCVdah2MJ2A67V7GSKStZ8xJBcWrtRvOzyVWRJ+dFdYAs4Z
         NwRqOFhZIqLR0L21ZzurmU+Cx6Yoec3ZDdwIpgQBD46O0xL4Y4w7cB8FvMO/8GWY5pno
         p0JMFaZdY3v4sAGPYt9HsV7AyBirxZkPiLdsKKgc2ka0Onvt8qEe9q4M244NUCcAj9N2
         gJKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 79si13122604ybl.42.2019.02.21.07.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 07:07:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwpwL-0002TD-Hi
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 10:07:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwpvH-00020i-NT
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 10:06:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwpvG-0006bM-Hf
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 10:06:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51258)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gwpvG-0006Rl-6d; Thu, 21 Feb 2019 10:06:02 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57281308FF18;
	Thu, 21 Feb 2019 15:05:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4086E6017F;
	Thu, 21 Feb 2019 15:05:35 +0000 (UTC)
Date: Thu, 21 Feb 2019 16:05:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190221160534.183636e0@redhat.com>
In-Reply-To: <20190220224003.4420-3-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 21 Feb 2019 15:05:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 02/17] hw/arm/virt: Rename highmem IO
 regions
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
X-TUID: xbNegS5FJnE9

On Wed, 20 Feb 2019 23:39:48 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> In preparation for a split of the memory map into a static
> part and a dynamic part floating after the RAM, let's rename the
> regions located after the RAM
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

with indent and checkpatch warnings fixed

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v7: added Peter's R-b
> v6: creation
> ---
>  hw/arm/virt-acpi-build.c |  8 ++++----
>  hw/arm/virt.c            | 21 +++++++++++----------
>  include/hw/arm/virt.h    |  8 ++++----
>  3 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 04b62c714d..829d2f0035 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -229,8 +229,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>                       size_pio));
>  
>      if (use_highmem) {
> -        hwaddr base_mmio_high = memmap[VIRT_PCIE_MMIO_HIGH].base;
> -        hwaddr size_mmio_high = memmap[VIRT_PCIE_MMIO_HIGH].size;
> +        hwaddr base_mmio_high = memmap[VIRT_HIGH_PCIE_MMIO].base;
> +        hwaddr size_mmio_high = memmap[VIRT_HIGH_PCIE_MMIO].size;
>  
>          aml_append(rbuf,
>              aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
> @@ -663,8 +663,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              gicr = acpi_data_push(table_data, sizeof(*gicr));
>              gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
>              gicr->length = sizeof(*gicr);
> -            gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST2].base);
> -            gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST2].size);
> +            gicr->base_address = cpu_to_le64(memmap[VIRT_HIGH_GIC_REDIST2].base);
> +            gicr->range_length = cpu_to_le32(memmap[VIRT_HIGH_GIC_REDIST2].size);
>          }
>  
>          if (its_class_name() && !vmc->no_its) {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 99c2b6e60d..a1955e7764 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -150,10 +150,10 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
> -    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000 },
> -    [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
> +    [VIRT_HIGH_GIC_REDIST2] =   { 0x4000000000ULL, 0x4000000 },
> +    [VIRT_HIGH_PCIE_ECAM] =     { 0x4010000000ULL, 0x10000000 },
>      /* Second PCIe window, 512GB wide at the 512GB boundary */
> -    [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
> +    [VIRT_HIGH_PCIE_MMIO] =     { 0x8000000000ULL, 0x8000000000ULL },
>  };
>  
>  static const int a15irqmap[] = {
> @@ -435,8 +435,8 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>                                           2, vms->memmap[VIRT_GIC_DIST].size,
>                                           2, vms->memmap[VIRT_GIC_REDIST].base,
>                                           2, vms->memmap[VIRT_GIC_REDIST].size,
> -                                         2, vms->memmap[VIRT_GIC_REDIST2].base,
> -                                         2, vms->memmap[VIRT_GIC_REDIST2].size);
> +                                         2, vms->memmap[VIRT_HIGH_GIC_REDIST2].base,
> +                                         2, vms->memmap[VIRT_HIGH_GIC_REDIST2].size);
>          }
>  
>          if (vms->virt) {
> @@ -584,7 +584,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>  
>          if (nb_redist_regions == 2) {
>              uint32_t redist1_capacity =
> -                        vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE;
> +                    vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
is indent correct here (it didn't look correct to begin with).

Strangle checkpatch didn't complain about it, but since I've run it
does complain about a bunch of "line over 80 characters" on this patch

>  
>              qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
>                  MIN(smp_cpus - redist0_count, redist1_capacity));
> @@ -601,7 +601,8 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>      if (type == 3) {
>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
>          if (nb_redist_regions == 2) {
> -            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_REDIST2].base);
> +            sysbus_mmio_map(gicbusdev, 2,
> +                            vms->memmap[VIRT_HIGH_GIC_REDIST2].base);
>          }
>      } else {
>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
> @@ -1088,8 +1089,8 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
>  {
>      hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
>      hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
> -    hwaddr base_mmio_high = vms->memmap[VIRT_PCIE_MMIO_HIGH].base;
> -    hwaddr size_mmio_high = vms->memmap[VIRT_PCIE_MMIO_HIGH].size;
> +    hwaddr base_mmio_high = vms->memmap[VIRT_HIGH_PCIE_MMIO].base;
> +    hwaddr size_mmio_high = vms->memmap[VIRT_HIGH_PCIE_MMIO].size;
>      hwaddr base_pio = vms->memmap[VIRT_PCIE_PIO].base;
>      hwaddr size_pio = vms->memmap[VIRT_PCIE_PIO].size;
>      hwaddr base_ecam, size_ecam;
> @@ -1418,7 +1419,7 @@ static void machvirt_init(MachineState *machine)
>       */
>      if (vms->gic_version == 3) {
>          virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
> -        virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE;
> +        virt_max_cpus += vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
>      } else {
>          virt_max_cpus = GIC_NCPU;
>      }
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4cc57a7ef6..a27086d524 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -64,7 +64,7 @@ enum {
>      VIRT_GIC_VCPU,
>      VIRT_GIC_ITS,
>      VIRT_GIC_REDIST,
> -    VIRT_GIC_REDIST2,
> +    VIRT_HIGH_GIC_REDIST2,
>      VIRT_SMMU,
>      VIRT_UART,
>      VIRT_MMIO,
> @@ -74,9 +74,9 @@ enum {
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
>      VIRT_PCIE_ECAM,
> -    VIRT_PCIE_ECAM_HIGH,
> +    VIRT_HIGH_PCIE_ECAM,
>      VIRT_PLATFORM_BUS,
> -    VIRT_PCIE_MMIO_HIGH,
> +    VIRT_HIGH_PCIE_MMIO,
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> @@ -128,7 +128,7 @@ typedef struct {
>      int psci_conduit;
>  } VirtMachineState;
>  
> -#define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
> +#define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
>  
>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
>  #define VIRT_MACHINE(obj) \

