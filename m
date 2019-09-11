Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp858319wrp;
        Wed, 11 Sep 2019 06:23:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzR8FNJcu59Pc3ggjuh9vLI6H1i4N6LVT/x75EomaK10BHezwdnyEcu779qjGn0qDcT998L
X-Received: by 2002:ae9:e00a:: with SMTP id m10mr36844512qkk.167.1568208188351;
        Wed, 11 Sep 2019 06:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568208188; cv=none;
        d=google.com; s=arc-20160816;
        b=uB1c4Kz+ZSBTFUUiBee2RJ06Lmcn43ni0vRxAAZ4SP+NWhYMfURFk6N4Gl3lJROFvf
         ObrTR+J+e7MQRxqxCZsxqRu2lXTXMy/uU1PPEIKtVtZzoCYmNc9sKGv5v3AWBPncusXr
         1kH3cbz7PEuIGdf7KAS2PlPWir0abwC+fAJh8DJe95DTkjMsOc7uLS4nmIOSA6jUG6HO
         Cg/vEe43jeYuD0Wb39JEkWikiLYcvYyG/iLYg42Acj8zHCLPp5fqcEnLQ8iSbppMzYO5
         98yBozElJnkpuc98ltD+21Wk/HyZrIQuEJMN+SAjr941O7YVuEYA/lohspdOVx2g0AGy
         lQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=FBhqq40Mg6WAQNOf0PDgeyZRsCi1s4zziph6yHq6CcI=;
        b=MbAxwi2sORvu6KN/VqHoLJxcTgOXguMs+sn4Nxwzvd5O2s1bHTENLqH7Ch/cdd8Mzo
         PBKEvwlDE1vdNmpEkkHhTy5ir9IFTwiLQbS8djDT72kv93ublDAY4JVHKkoTWyKoViQg
         fV14gNV5qJh6fIZunJFRbhc1JPysysmHf11ONTWQpBL4CEVcoL61XcJe5GOiuv11nHiK
         di46rW0/yiEL+HZXoFshN35v1WOBP6D1KtnN1YHJq0IRTHKhaSN/9U1FOdViyKnixfFC
         waSny/mcVxV3TBkHXgAX/2Cj3mEd6sOIqLhYCSrkdhP6Ea7jFZnMunkTX4EQqyJJ7Ptc
         3Gqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c42si16403798qvd.17.2019.09.11.06.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 06:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i82aR-0000Z3-DA
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 09:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i82YR-0006r6-0B
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:21:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i82YO-0006qe-W7
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:21:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41414)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i82YO-0006pv-6V; Wed, 11 Sep 2019 09:21:00 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A78720F0;
 Wed, 11 Sep 2019 13:20:58 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60EBB19C58;
 Wed, 11 Sep 2019 13:20:52 +0000 (UTC)
Date: Wed, 11 Sep 2019 15:20:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190911152051.19cbf36f@redhat.com>
In-Reply-To: <20190904085629.13872-9-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-9-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 11 Sep 2019 13:20:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v10 08/11] hw/arm: Use
 GED for system_powerdown event
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KVl/CCOlL3Aq

On Wed, 4 Sep 2019 09:56:26 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> For machines 4.2 or higher with ACPI boot use GED for system_powerdown
> event instead of GPIO. Guest boot with DT still uses GPIO.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v9 --> v10
>  -Eric's R-by
> 
> v8 --> v9
>  -Re-arranged patches 8 & 9 from v8 based on Igor's comments.
> 
> v7 --> v8
>  -Retained gpio based system_powerdown support for machines < 4.2.
>  -Reuse of virt_powerdown_req() for ACPI GED use.
>  -Dropped Eric's R-by for now because of above.
> ---
>  hw/acpi/generic_event_device.c         |  8 ++++++++
>  hw/arm/virt-acpi-build.c               |  6 +++---
>  hw/arm/virt.c                          | 16 +++++++++++-----
>  include/hw/acpi/acpi_dev_interface.h   |  1 +
>  include/hw/acpi/generic_event_device.h |  3 +++
>  5 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index f81d966058..47e178c583 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -22,6 +22,7 @@
>  
>  static const uint32_t ged_supported_events[] = {
>      ACPI_GED_MEM_HOTPLUG_EVT,
> +    ACPI_GED_PWR_DOWN_EVT,
>  };
>  
>  /*
> @@ -104,6 +105,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                  aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
>                                               MEMORY_SLOT_SCAN_METHOD));
>                  break;
> +            case ACPI_GED_PWR_DOWN_EVT:
> +                aml_append(if_ctx,
> +                           aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> +                                      aml_int(0x80)));
> +                break;
>              default:
>                  /*
>                   * Please make sure all the events in ged_supported_events[]
> @@ -190,6 +196,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>      if (ev & ACPI_MEMORY_HOTPLUG_STATUS) {
>          sel = ACPI_GED_MEM_HOTPLUG_EVT;
> +    } else if (ev & ACPI_POWER_DOWN_STATUS) {
> +        sel = ACPI_GED_PWR_DOWN_EVT;
>      } else {
>          /* Unknown event. Return without generating interrupt. */
>          warn_report("GED: Unsupported event %d. No irq injected", ev);
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index a4872a0b00..bbf7f6fafa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -50,7 +50,6 @@
>  #include "migration/vmstate.h"
>  
>  #define ARM_SPI_BASE 32
> -#define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>  {
> @@ -740,13 +739,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
>                        vms->highmem, vms->highmem_ecam);
> -    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> -                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      if (vms->acpi_dev) {
>          build_ged_aml(scope, "\\_SB."GED_DEVICE,
>                        HOTPLUG_HANDLER(vms->acpi_dev),
>                        irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
>                        memmap[VIRT_ACPI_GED].base);
> +    } else {
> +        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> +                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      }
>  
>      if (vms->acpi_dev && ms->ram_slots) {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 89ee37d7de..32208e1058 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -532,7 +532,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
>  {
>      DeviceState *dev;
>      int irq = vms->irqmap[VIRT_ACPI_GED];
> -    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
> +    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT | ACPI_GED_PWR_DOWN_EVT;
>  
>      dev = qdev_create(NULL, TYPE_ACPI_GED);
>      qdev_prop_set_uint32(dev, "ged-event", event);
> @@ -787,8 +787,14 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
>  static DeviceState *gpio_key_dev;
>  static void virt_powerdown_req(Notifier *n, void *opaque)
>  {
> -    /* use gpio Pin 3 for power button event */
> -    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
> +    VirtMachineState *s = container_of(n, VirtMachineState, powerdown_notifier);
> +
> +    if (s->acpi_dev) {
> +        acpi_send_event(s->acpi_dev, ACPI_POWER_DOWN_STATUS);
> +    } else {
> +        /* use gpio Pin 3 for power button event */
> +        qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
> +    }
>  }
>  
>  static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
> @@ -1716,10 +1722,10 @@ static void machvirt_init(MachineState *machine)
>  
>      create_pcie(vms, pic);
>  
> -    create_gpio(vms, pic);
> -
>      if (has_ged && aarch64 && firmware_loaded && acpi_enabled) {
>          vms->acpi_dev = create_acpi_ged(vms, pic);
> +    } else {
> +        create_gpio(vms, pic);
>      }
>  
>       /* connect powerdown request */
> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> index 0ba90effd2..a2a12af9b9 100644
> --- a/include/hw/acpi/acpi_dev_interface.h
> +++ b/include/hw/acpi/acpi_dev_interface.h
> @@ -13,6 +13,7 @@ typedef enum {
>      ACPI_MEMORY_HOTPLUG_STATUS = 8,
>      ACPI_NVDIMM_HOTPLUG_STATUS = 16,
>      ACPI_VMGENID_CHANGE_STATUS = 32,
> +    ACPI_POWER_DOWN_STATUS = 64,
>  } AcpiEventStatusBits;
>  
>  #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index 2049e8d873..d157eac088 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -62,6 +62,8 @@
>  #include "hw/sysbus.h"
>  #include "hw/acpi/memory_hotplug.h"
>  
> +#define ACPI_POWER_BUTTON_DEVICE "PWRB"
> +
>  #define TYPE_ACPI_GED "acpi-ged"
>  #define ACPI_GED(obj) \
>      OBJECT_CHECK(AcpiGedState, (obj), TYPE_ACPI_GED)
> @@ -79,6 +81,7 @@
>   * through GED.
>   */
>  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
> +#define ACPI_GED_PWR_DOWN_EVT      0x2
>  
>  typedef struct GEDState {
>      MemoryRegion io;

