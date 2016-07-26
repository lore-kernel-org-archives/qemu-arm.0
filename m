Received: by 10.25.21.156 with SMTP id 28csp1779112lfv;
        Tue, 26 Jul 2016 08:32:19 -0700 (PDT)
X-Received: by 10.55.77.209 with SMTP id a200mr28754540qkb.209.1469547139609;
        Tue, 26 Jul 2016 08:32:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si803393qta.6.2016.07.26.08.32.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 08:32:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS4LD-0005ae-0x
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 11:32:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bS4L5-0005YM-FY
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 11:32:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bS4L1-00057H-2T
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 11:32:11 -0400
Received: from mx6-phx2.redhat.com ([209.132.183.39]:46895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bS4L0-00056Z-Np; Tue, 26 Jul 2016 11:32:07 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx6-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u6QFVlXw031062;
	Tue, 26 Jul 2016 11:31:47 -0400
Date: Tue, 26 Jul 2016 11:31:45 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <82468299.10757116.1469547105896.JavaMail.zimbra@redhat.com>
In-Reply-To: <1469541331-86342-1-git-send-email-imammedo@redhat.com>
References: <1469541331-86342-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (zclient/8.0.6_GA_5922)
Thread-Topic: i2c: fix migration regression introduced by broadcast support
Thread-Index: ejpNO61SOJ1sriwa0faZ9svLVxrnPw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.39
Subject: Re: [Qemu-arm] [PATCH] i2c: fix migration regression introduced by
 broadcast support
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
Cc: peter maydell <peter.maydell@linaro.org>, hyun kwon <hyun.kwon@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	alistair francis <alistair.francis@xilinx.com>,
	"open list:PXA2XX" <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>, amit shah <amit.shah@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, dgilbert@redhat.com,
	fred konrad <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SbI3QBhMTCiP


----- Igor Mammedov <imammedo@redhat.com> ha scritto:
> QEMU fails migration with following error:
> 
> qemu-system-x86_64: Missing section footer for i2c_bus
> qemu-system-x86_64: load of migration failed: Invalid argument
> 
> when migrating from:
>   qemu-system-x86_64-v2.6.0 -m 256M rhel72.img -M pc-i440fx-2.6
> to
>   qemu-system-x86_64-v2.7.0-rc0 -m 256M rhel72.img -M pc-i440fx-2.6
> 
> Regression is added by commit 2293c27f (i2c: implement broadcast write)
> 
> Fix it by moving 'broadcast' VMState to an optional subsection
> enabled by default and disabled via compat properties
> for pc/q35-2.6 and older machine types.

Please instead define the needed function for the subsection
so that the default state is not transmitted. This should make the patch 
much simpler and avoid the need to touch all i2c bus implementations.

Thanks,

Paolo

> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: fred.konrad@greensocs.com
> CC: alistair.francis@xilinx.com
> CC: crosthwaite.peter@gmail.com
> CC: hyun.kwon@xilinx.com
> CC: peter.maydell@linaro.org
> ---
>  include/hw/i2c/i2c.h      |  2 +-
>  include/hw/i2c/pm_smbus.h |  1 +
>  include/hw/i386/pc.h      | 10 ++++++++++
>  hw/acpi/piix4.c           |  2 ++
>  hw/arm/pxa2xx.c           |  4 ++--
>  hw/arm/stellaris.c        |  2 +-
>  hw/i2c/aspeed_i2c.c       |  2 +-
>  hw/i2c/bitbang_i2c.c      |  2 +-
>  hw/i2c/core.c             | 32 +++++++++++++++++++++++++++++---
>  hw/i2c/exynos4210_i2c.c   |  2 +-
>  hw/i2c/imx_i2c.c          |  2 +-
>  hw/i2c/omap_i2c.c         |  2 +-
>  hw/i2c/pm_smbus.c         |  2 +-
>  hw/i2c/smbus_ich9.c       |  7 +++++++
>  hw/i2c/versatile_i2c.c    |  2 +-
>  hw/misc/auxbus.c          |  2 +-
>  16 files changed, 61 insertions(+), 15 deletions(-)
> 
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index c4085aa..488a0fa 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -50,7 +50,7 @@ struct I2CSlave
>      uint8_t address;
>  };
>  
> -I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
> +I2CBus *i2c_init_bus(DeviceState *parent, const char *name, bool broadcast);
>  void i2c_set_slave_address(I2CSlave *dev, uint8_t address);
>  int i2c_bus_busy(I2CBus *bus);
>  int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv);
> diff --git a/include/hw/i2c/pm_smbus.h b/include/hw/i2c/pm_smbus.h
> index 2a837af..b17c052 100644
> --- a/include/hw/i2c/pm_smbus.h
> +++ b/include/hw/i2c/pm_smbus.h
> @@ -3,6 +3,7 @@
>  
>  typedef struct PMSMBus {
>      I2CBus *smbus;
> +    bool smb_broadcast_enabled;
>      MemoryRegion io;
>  
>      uint8_t smb_stat;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index c87c5c1..738b8a5 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -391,6 +391,16 @@ bool e820_get_entry(int, uint32_t, uint64_t *, uint64_t *);
>          .driver   = "apic",\
>          .property = "legacy-instance-id",\
>          .value    = "on",\
> +    },\
> +    {\
> +        .driver   = "ICH9 SMB",\
> +        .property = "smbus-broadcast-enabled",\
> +        .value    = "off",\
> +    },\
> +    {\
> +        .driver   = "PIIX4_PM",\
> +        .property = "smbus-broadcast-enabled",\
> +        .value    = "off",\
>      },
>  
>  #define PC_COMPAT_2_5 \
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 2adc246..8a29179 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -669,6 +669,8 @@ static Property piix4_pm_properties[] = {
>                       use_acpi_pci_hotplug, true),
>      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>                       acpi_memory_hotplug.is_enabled, true),
> +    DEFINE_PROP_BOOL("smbus-broadcast-enabled", PIIX4PMState,
> +                     smb.smb_broadcast_enabled, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index cb55704..045ab20 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -1491,7 +1491,7 @@ PXA2xxI2CState *pxa2xx_i2c_init(hwaddr base,
>  
>      s = PXA2XX_I2C(i2c_dev);
>      /* FIXME: Should the slave device really be on a separate bus?  */
> -    i2cbus = i2c_init_bus(dev, "dummy");
> +    i2cbus = i2c_init_bus(dev, "dummy", true);
>      dev = i2c_create_slave(i2cbus, TYPE_PXA2XX_I2C_SLAVE, 0);
>      s->slave = PXA2XX_I2C_SLAVE(dev);
>      s->slave->host = s;
> @@ -1505,7 +1505,7 @@ static void pxa2xx_i2c_initfn(Object *obj)
>      PXA2xxI2CState *s = PXA2XX_I2C(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>  
> -    s->bus = i2c_init_bus(dev, "i2c");
> +    s->bus = i2c_init_bus(dev, "i2c", true);
>  
>      memory_region_init_io(&s->iomem, obj, &pxa2xx_i2c_ops, s,
>                            "pxa2xx-i2c", s->region_size);
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 794a3ad..ac38e4d 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -882,7 +882,7 @@ static void stellaris_i2c_init(Object *obj)
>      I2CBus *bus;
>  
>      sysbus_init_irq(sbd, &s->irq);
> -    bus = i2c_init_bus(dev, "i2c");
> +    bus = i2c_init_bus(dev, "i2c", true);
>      s->bus = bus;
>  
>      memory_region_init_io(&s->iomem, obj, &stellaris_i2c_ops, s,
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index ce5b1f0..af62636 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -394,7 +394,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
>          snprintf(name, sizeof(name), "aspeed.i2c.%d", i);
>          s->busses[i].controller = s;
>          s->busses[i].id = i;
> -        s->busses[i].bus = i2c_init_bus(dev, name);
> +        s->busses[i].bus = i2c_init_bus(dev, name, true);
>          memory_region_init_io(&s->busses[i].mr, OBJECT(dev),
>                                &aspeed_i2c_bus_ops, &s->busses[i], name, 0x40);
>          memory_region_add_subregion(&s->iomem, 0x40 * (i + offset),
> diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
> index d3a2989..63f922b 100644
> --- a/hw/i2c/bitbang_i2c.c
> +++ b/hw/i2c/bitbang_i2c.c
> @@ -220,7 +220,7 @@ static void gpio_i2c_init(Object *obj)
>      memory_region_init(&s->dummy_iomem, obj, "gpio_i2c", 0);
>      sysbus_init_mmio(sbd, &s->dummy_iomem);
>  
> -    bus = i2c_init_bus(dev, "i2c");
> +    bus = i2c_init_bus(dev, "i2c", true);
>      s->bitbang = bitbang_i2c_init(bus);
>  
>      qdev_init_gpio_in(dev, bitbang_i2c_gpio_set, 2);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index abb3efb..3ab1ed5 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -9,6 +9,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/i2c/i2c.h"
> +#include "qapi/error.h"
>  
>  typedef struct I2CNode I2CNode;
>  
> @@ -22,6 +23,7 @@ struct I2CBus
>      BusState qbus;
>      QLIST_HEAD(, I2CNode) current_devs;
>      uint8_t saved_address;
> +    bool broadcast_enabled;
>      bool broadcast;
>  };
>  
> @@ -45,12 +47,32 @@ static void i2c_bus_pre_save(void *opaque)
>  
>      bus->saved_address = -1;
>      if (!QLIST_EMPTY(&bus->current_devs)) {
> -        if (!bus->broadcast) {
> +        if (!bus->broadcast_enabled && !bus->broadcast) {
>              bus->saved_address = QLIST_FIRST(&bus->current_devs)->elt->address;
>          }
>      }
>  }
>  
> +static bool vmstate_test_use_broadcast(void *opaque)
> +{
> +    I2CBus *bus = opaque;
> +
> +    return bus->broadcast_enabled;
> +}
> +
> +static const VMStateDescription vmstate_broadcast_state = {
> +    .name = "i2c_bus/broadcast",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,
> +    .needed = vmstate_test_use_broadcast,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_BOOL(broadcast, I2CBus),
> +        VMSTATE_END_OF_LIST()
> +    }
> +
> +};
> +
>  static const VMStateDescription vmstate_i2c_bus = {
>      .name = "i2c_bus",
>      .version_id = 1,
> @@ -58,17 +80,21 @@ static const VMStateDescription vmstate_i2c_bus = {
>      .pre_save = i2c_bus_pre_save,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(saved_address, I2CBus),
> -        VMSTATE_BOOL(broadcast, I2CBus),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_broadcast_state,
> +        NULL
>      }
>  };
>  
>  /* Create a new I2C bus.  */
> -I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
> +I2CBus *i2c_init_bus(DeviceState *parent, const char *name, bool broadcast)
>  {
>      I2CBus *bus;
>  
>      bus = I2C_BUS(qbus_create(TYPE_I2C_BUS, parent, name));
> +    bus->broadcast_enabled = broadcast;
>      QLIST_INIT(&bus->current_devs);
>      vmstate_register(NULL, -1, &vmstate_i2c_bus, bus);
>      return bus;
> diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
> index c96fa7d..1f78399 100644
> --- a/hw/i2c/exynos4210_i2c.c
> +++ b/hw/i2c/exynos4210_i2c.c
> @@ -309,7 +309,7 @@ static void exynos4210_i2c_init(Object *obj)
>                            TYPE_EXYNOS4_I2C, EXYNOS4_I2C_MEM_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
> -    s->bus = i2c_init_bus(dev, "i2c");
> +    s->bus = i2c_init_bus(dev, "i2c", true);
>  }
>  
>  static void exynos4210_i2c_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
> index 37e5a62..aa8fb9f 100644
> --- a/hw/i2c/imx_i2c.c
> +++ b/hw/i2c/imx_i2c.c
> @@ -310,7 +310,7 @@ static void imx_i2c_realize(DeviceState *dev, Error **errp)
>                            IMX_I2C_MEM_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> -    s->bus = i2c_init_bus(DEVICE(dev), "i2c");
> +    s->bus = i2c_init_bus(DEVICE(dev), "i2c", true);
>  }
>  
>  static void imx_i2c_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
> index f7c92ea..852a61d 100644
> --- a/hw/i2c/omap_i2c.c
> +++ b/hw/i2c/omap_i2c.c
> @@ -456,7 +456,7 @@ static void omap_i2c_init(Object *obj)
>      sysbus_init_irq(sbd, &s->drq[0]);
>      sysbus_init_irq(sbd, &s->drq[1]);
>      sysbus_init_mmio(sbd, &s->iomem);
> -    s->bus = i2c_init_bus(dev, NULL);
> +    s->bus = i2c_init_bus(dev, NULL, true);
>  }
>  
>  static void omap_i2c_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
> index 6fc3923..4e91cc1 100644
> --- a/hw/i2c/pm_smbus.c
> +++ b/hw/i2c/pm_smbus.c
> @@ -222,7 +222,7 @@ static const MemoryRegionOps pm_smbus_ops = {
>  
>  void pm_smbus_init(DeviceState *parent, PMSMBus *smb)
>  {
> -    smb->smbus = i2c_init_bus(parent, "i2c");
> +    smb->smbus = i2c_init_bus(parent, "i2c", smb->smb_broadcast_enabled);
>      memory_region_init_io(&smb->io, OBJECT(parent), &pm_smbus_ops, smb,
>                            "pm-smbus", 64);
>  }
> diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
> index 48fab22..6e739e3 100644
> --- a/hw/i2c/smbus_ich9.c
> +++ b/hw/i2c/smbus_ich9.c
> @@ -86,6 +86,12 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
>                       &s->smb.io);
>  }
>  
> +static Property ich9_smbus_properties[] = {
> +    DEFINE_PROP_BOOL("smbus-broadcast-enabled", ICH9SMBState,
> +                     smb.smb_broadcast_enabled, true),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void ich9_smb_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -97,6 +103,7 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
>      k->class_id = PCI_CLASS_SERIAL_SMBUS;
>      dc->vmsd = &vmstate_ich9_smbus;
>      dc->desc = "ICH9 SMBUS Bridge";
> +    dc->props = ich9_smbus_properties;
>      k->realize = ich9_smbus_realize;
>      k->config_write = ich9_smbus_write_config;
>      /*
> diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
> index da9f298..490c93a 100644
> --- a/hw/i2c/versatile_i2c.c
> +++ b/hw/i2c/versatile_i2c.c
> @@ -86,7 +86,7 @@ static void versatile_i2c_init(Object *obj)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      I2CBus *bus;
>  
> -    bus = i2c_init_bus(dev, "i2c");
> +    bus = i2c_init_bus(dev, "i2c", true);
>      s->bitbang = bitbang_i2c_init(bus);
>      memory_region_init_io(&s->iomem, obj, &versatile_i2c_ops, s,
>                            "versatile_i2c", 0x1000);
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index e4a7ba4..47ee115 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -214,7 +214,7 @@ static void aux_bridge_init(Object *obj)
>  {
>      AUXTOI2CState *s = AUXTOI2C(obj);
>  
> -    s->i2c_bus = i2c_init_bus(DEVICE(obj), "aux-i2c");
> +    s->i2c_bus = i2c_init_bus(DEVICE(obj), "aux-i2c", true);
>  }
>  
>  static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
> -- 
> 2.7.4
> 

