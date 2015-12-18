Received: by 10.182.158.201 with SMTP id ww9csp733205obb;
        Thu, 17 Dec 2015 16:18:56 -0800 (PST)
X-Received: by 10.140.235.212 with SMTP id g203mr1028476qhc.11.1450397936107;
        Thu, 17 Dec 2015 16:18:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m87si13792558qkl.12.2015.12.17.16.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 16:18:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:57770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9il5-0007W8-NT
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 19:18:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9il3-0007T9-DO
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 19:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9il1-0001Ko-W2
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 19:18:53 -0500
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:36248)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1a9ikz-0001KS-27; Thu, 17 Dec 2015 19:18:49 -0500
Received: by mail-oi0-x22f.google.com with SMTP id o62so47045587oif.3;
	Thu, 17 Dec 2015 16:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Eh2CpPysolEhoFb9PglK7qgQ/Pol19eM+bTQtt1vM0c=;
	b=ANEOO/5o89Ku3wJdIrQQG5gMZWLh2fIsk+DWrR5KrEmRBpI6tnkG+lPw5C7hk2+XyE
	IfYhywBl6An8rwifslq57JwFPO5FMwrcV6pI9cbmclwaCIqAQIDoSqrZ/pY5b9Bu/82z
	HDYu1KQB3PD0EUbHd+hN9j+ah/PuDiZLsLSERuKnD1/Y7hgDR9PLN5D9CdPD1U5qVqLk
	k4DWVg3ztcH02/gX5mCOgpYthA0js4GIn38ZJvoS+5p3W2HIMywzbt8gzOAkRCE/lJ33
	T00K6SGqlpgcf4OQhxxTOOgAeQebyN/adu1qg7ovOO7nRpcsC73m+qIK1kLig4s6R3a3
	rE+A==
X-Received: by 10.202.83.139 with SMTP id h133mr277858oib.127.1450397928446;
	Thu, 17 Dec 2015 16:18:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Thu, 17 Dec 2015 16:18:19 -0800 (PST)
In-Reply-To: <1449851831-4966-7-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-7-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 17 Dec 2015 16:18:19 -0800
X-Google-Sender-Auth: AWVPH89ElPjU-vhRpjC_68rAxAg
Message-ID: <CAKmqyKN-0YTai2tYbBoJsH9A022hpDcs89jwRsKOr2upgFdwXA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22f
Cc: Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/10] sdhci_sysbus: Create SD
 card device in users, not the device itself
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r8v9ODkzXj3O

On Fri, Dec 11, 2015 at 8:37 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Move the creation of the SD card device from the sdhci_sysbus
> device itself into the boards that create these devices.
> This allows us to remove the cannot_instantiate_with_device_add
> notation because we no longer call drive_get_next in the device
> model.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/xilinx_zynq.c | 17 ++++++++++++++++-
>  hw/arm/xlnx-ep108.c  | 19 +++++++++++++++++++
>  hw/sd/sdhci.c        | 22 ----------------------
>  3 files changed, 35 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 1c1a445..3195055 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -27,6 +27,7 @@
>  #include "hw/misc/zynq-xadc.h"
>  #include "hw/ssi.h"
>  #include "qemu/error-report.h"
> +#include "hw/sd/sd.h"
>
>  #define NUM_SPI_FLASHES 4
>  #define NUM_QSPI_FLASHES 2
> @@ -153,8 +154,10 @@ static void zynq_init(MachineState *machine)
>      MemoryRegion *address_space_mem = get_system_memory();
>      MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
>      MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
> -    DeviceState *dev;
> +    DeviceState *dev, *carddev;
>      SysBusDevice *busdev;
> +    DriveInfo *di;
> +    BlockBackend *blk;
>      qemu_irq pic[64];
>      Error *err = NULL;
>      int n;
> @@ -260,11 +263,23 @@ static void zynq_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
>
> +    di = drive_get_next(IF_SD);
> +    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
> +    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
> +
>      dev = qdev_create(NULL, "generic-sdhci");
>      qdev_init_nofail(dev);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
>
> +    di = drive_get_next(IF_SD);
> +    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
> +    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
> +
>      dev = qdev_create(NULL, TYPE_ZYNQ_XADC);
>      qdev_init_nofail(dev);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
> diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
> index 85b978f..cb95d32 100644
> --- a/hw/arm/xlnx-ep108.c
> +++ b/hw/arm/xlnx-ep108.c
> @@ -34,6 +34,7 @@ static void xlnx_ep108_init(MachineState *machine)
>  {
>      XlnxEP108 *s = g_new0(XlnxEP108, 1);
>      Error *err = NULL;
> +    int i;
>
>      object_initialize(&s->soc, sizeof(s->soc), TYPE_XLNX_ZYNQMP);
>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> @@ -45,6 +46,24 @@ static void xlnx_ep108_init(MachineState *machine)
>          exit(1);
>      }
>
> +    /* Create and plug in the SD cards */
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> +        BusState *bus;
> +        DriveInfo *di = drive_get_next(IF_SD);
> +        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +        DeviceState *carddev;
> +
> +        bus = qdev_get_child_bus(DEVICE(&s->soc.sdhci[i]), "sd-bus");

This looks like the same thing I was trying to avoid with my SPI
patches. We were trying to avoid the machine reaching into the SoC
when getting the child busses. Instead expose the bus to the SoC so
the board can just get it straight from there.

> +        if (!bus) {
> +            error_report("No SD bus found for SD card %d", i);
> +            exit(1);
> +        }
> +        carddev = qdev_create(bus, TYPE_SD);
> +        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> +        object_property_set_bool(OBJECT(carddev), true, "realized",
> +                                 &error_fatal);
> +    }
> +

I also think this should go after the other memory creation, not before.

Thanks,

Alistair

>      if (machine->ram_size > EP108_MAX_RAM_SIZE) {
>          error_report("WARNING: RAM size " RAM_ADDR_FMT " above max supported, "
>                       "reduced to %llx", machine->ram_size, EP108_MAX_RAM_SIZE);
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 17e08a2..c8e3865 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1296,26 +1296,6 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>  {
>      SDHCIState *s = SYSBUS_SDHCI(dev);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> -    DriveInfo *di;
> -    BlockBackend *blk;
> -    DeviceState *carddev;
> -
> -    /* Create and plug in the sd card.
> -     * FIXME: this should be done by the users of this device so we
> -     * do not use drive_get_next() here.
> -     */
> -    di = drive_get_next(IF_SD);
> -    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> -
> -    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
> -    qdev_prop_set_drive(carddev, "drive", blk, errp);
> -    if (*errp) {
> -        return;
> -    }
> -    object_property_set_bool(OBJECT(carddev), true, "realized", errp);
> -    if (*errp) {
> -        return;
> -    }
>
>      s->buf_maxsz = sdhci_get_fifolen(s);
>      s->fifo_buffer = g_malloc0(s->buf_maxsz);
> @@ -1333,8 +1313,6 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &sdhci_vmstate;
>      dc->props = sdhci_sysbus_properties;
>      dc->realize = sdhci_sysbus_realize;
> -    /* Reason: instance_init() method uses drive_get_next() */
> -    dc->cannot_instantiate_with_device_add_yet = true;
>  }
>
>  static const TypeInfo sdhci_sysbus_info = {
> --
> 1.9.1
>
>
