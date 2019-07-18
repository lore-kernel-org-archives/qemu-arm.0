Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2243700wrv;
        Thu, 18 Jul 2019 06:03:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzFL3oY493Jumj4ywubOiImaF8Z/CIltf4DUVc7WHrhhjLjZsSf/AjmeXwbsD0LReWHtH/R
X-Received: by 2002:a17:906:959:: with SMTP id j25mr34917209ejd.94.1563455002835;
        Thu, 18 Jul 2019 06:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563455002; cv=none;
        d=google.com; s=arc-20160816;
        b=xDu02au3OvcgA1QWM7V+6QA8pSidZsL3Gpz6QPIfO7Lxpel/S8gSk6xrQv/TSSxaYj
         uFqYDtffN//8ZQZuE/ecZhaeoeF4v7gMLfrcbPAeenp49QqJPZrIRjCLXvayFuaEs6TE
         3mQ5zQgV2cO0fdVlgtxXp7+clZ9s16WyDlymUKG/LrNCQ2u5LEhdLhh1ubYRnTlWOeez
         t+X1/NPe7qVH8XZWgfyoo7zHFFHzilU+2pYXix+BSNr6r5oxzDvd4ChDXwujLlhVynQa
         OF7PcXndiLCHbQFRABr+ZzN8JVMrREKwLjGsz/mjdrtdbUE9JkLu080gaUtlvk/gfxtM
         8NWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=UqtBywollAOTujlVVqIO6yOBzAXasIczZS/MoaQ61dU=;
        b=UepDjF7gl0+/+6XKFw1llh0uTDEoDC2lUQ3sI2FU3E2ph1013yxIl7LLFCVnHKvPUT
         3shyAuZOAWp20InY+a28i8oVkOcjK78RTQuPyGl6xeKpMSk2qg/jUlSZkqB3WkA+KLLB
         cupFZ1bLc505MF5b9GcdezYQ+5YvKLaJUZ+GIo8yJ/Wo2YFKV9Lvfc7u23YgPko8UX0Z
         qonADz6vC1ISVjsDlQoCL5+2tmeRRwWMh6b1LOdeRMagxVyJYr7oFjG3FpvKlF1fjUW3
         tmPBmnR/TkICcAox92iBN9b+zGE+T7uHoJRL/eyjSWE+fDyJMUBD1QdsvHvKkvbrXf0+
         MAIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ec17si23207ejb.327.2019.07.18.06.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2019 06:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ho649-0005ja-Qo
	for alex.bennee@linaro.org; Thu, 18 Jul 2019 09:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1ho645-0005jC-86
 for qemu-arm@nongnu.org; Thu, 18 Jul 2019 09:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ho643-0001ak-R5
 for qemu-arm@nongnu.org; Thu, 18 Jul 2019 09:03:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46288)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1ho643-0001aM-IG; Thu, 18 Jul 2019 09:03:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 70A6D307D974;
 Thu, 18 Jul 2019 13:03:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8C6A60FE1;
 Thu, 18 Jul 2019 13:03:02 +0000 (UTC)
Date: Thu, 18 Jul 2019 15:03:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190718150301.45b3fb57@redhat.com>
In-Reply-To: <20190716153816.17676-10-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
 <20190716153816.17676-10-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 18 Jul 2019 13:03:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v7 09/10] hw/arm: Use GED for
 system_powerdown event
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dWP5XZtGBjnE

On Tue, 16 Jul 2019 16:38:15 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Use GED for system_powerdown event instead of GPIO for ACPI.
> Guest boot with DT still uses GPIO.
 

I'd hate to keep ACPI GPIO around but taking in account migration
wouldn't this patch break ACPI GPIO based button on 4.0 and older where
GED is not available and guest was booted as ACPI one and then rebooted on new QEMU?


> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 37 +------------------------------------
>  hw/arm/virt.c            |  6 +++---
>  2 files changed, 4 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 75657caa36..9178ca8e40 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -49,7 +49,6 @@
>  #include "kvm_arm.h"
>  
>  #define ARM_SPI_BASE 32
> -#define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>  {
> @@ -328,37 +327,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      aml_append(scope, dev);
>  }
>  
> -static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
> -                                           uint32_t gpio_irq)
> -{
> -    Aml *dev = aml_device("GPO0");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> -    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> -
> -    Aml *crs = aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(gpio_memmap->base, gpio_memmap->size,
> -                                       AML_READ_WRITE));
> -    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> -                                  AML_EXCLUSIVE, &gpio_irq, 1));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -
> -    Aml *aei = aml_resource_template();
> -    /* Pin 3 for power button */
> -    const uint32_t pin_list[1] = {3};
> -    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> -                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
> -                                 "GPO0", NULL, 0));
> -    aml_append(dev, aml_name_decl("_AEI", aei));
> -
> -    /* _E03 is handle for power button */
> -    Aml *method = aml_method("_E03", 0, AML_NOTSERIALIZED);
> -    aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> -                                  aml_int(0x80)));
> -    aml_append(dev, method);
> -    aml_append(scope, dev);
> -}
> -
>  static void acpi_dsdt_add_power_button(Aml *scope)
>  {
>      Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
> @@ -739,9 +707,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
>                        vms->highmem, vms->highmem_ecam);
> -    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> -                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      if (vms->acpi_dev) {
> +        acpi_dsdt_add_power_button(scope);
>          build_ged_aml(scope, "\\_SB."GED_DEVICE,
>                        HOTPLUG_HANDLER(vms->acpi_dev),
>                        irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY);
> @@ -752,8 +719,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                                   AML_SYSTEM_MEMORY);
>      }
>  
> -    acpi_dsdt_add_power_button(scope);
> -
>      aml_append(dsdt, scope);
>  
>      /* copy AML table into ACPI tables blob and patch header there */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ffcccc05ad..6e55c25c5f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -528,7 +528,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
>  {
>      DeviceState *dev;
>      int irq = vms->irqmap[VIRT_ACPI_GED];
> -    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
> +    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT | ACPI_GED_PWR_DOWN_EVT;
>  
>      dev = DEVICE(object_new(TYPE_ACPI_GED));
>      qdev_prop_set_uint64(dev, "memhp-base",
> @@ -1718,10 +1718,10 @@ static void machvirt_init(MachineState *machine)
>  
>      create_pcie(vms, pic);
>  
> -    create_gpio(vms, pic);
> -
>      if (!vmc->no_acpi_dev && aarch64 && firmware_loaded && acpi_enabled) {
>          vms->acpi_dev = create_acpi_ged(vms, pic);
> +    } else {
> +        create_gpio(vms, pic);
>      }
>  
>      /* Create mmio transports, so the user can create virtio backends

