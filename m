Received: by 10.25.208.211 with SMTP id h202csp174668lfg;
        Wed, 17 Feb 2016 10:01:55 -0800 (PST)
X-Received: by 10.140.180.130 with SMTP id b124mr3733409qha.77.1455732115722;
        Wed, 17 Feb 2016 10:01:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o13si546513qkl.55.2016.02.17.10.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Feb 2016 10:01:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:60246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aW6QF-0001d1-8l
	for alex.bennee@linaro.org; Wed, 17 Feb 2016 13:01:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aW6QC-0001ai-Nz
	for qemu-arm@nongnu.org; Wed, 17 Feb 2016 13:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aW6Q8-0004fI-EU
	for qemu-arm@nongnu.org; Wed, 17 Feb 2016 13:01:52 -0500
Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230]:34410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aW6Q8-0004f9-7X; Wed, 17 Feb 2016 13:01:48 -0500
Received: by mail-ob0-x230.google.com with SMTP id wb13so26755642obb.1;
	Wed, 17 Feb 2016 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=0eV8Mh5VuHuiD3Xxl7tovaxP2RYg8IxVl7DECp5lTmE=;
	b=E7Rq1fXtNbKjW6evznAQGY1wGTJr7Ureh9WFH9U3d6eMrMg8U2JbdHkJgxuTBz57p+
	xJK5xgvt2/4vXeRb3k4hpOezAWRiyJr6XE2RjWxv0Xb7JfCNNfvzppVT+e+sMj6oF4RN
	SB2pO6bgWZVHPM4EG61LMkm5f901DFpF321yFDiMw8kp0nhs2VcBx1gBFafEIwbFxxRn
	YpqaqPvRDeYAQ9NtrF/cZVa9Woner4Dtsup/PV2L06e3jqrGf6LtiTdqIItKnPkwtWKm
	u7zap5ms9JioBmP/W1y0YDFqNS/r/CD1PdQs9kjfiX8CycyqUhO/BvJcxmLMJbLRpgZl
	GxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=0eV8Mh5VuHuiD3Xxl7tovaxP2RYg8IxVl7DECp5lTmE=;
	b=h9YpbXMvnufsO/GC74yNxyjAmRxbodRNOIflnvZFpcDUZta6Ff2GMS2H1MUiYPC4jW
	DlO2WN80KKApq7r4Ag4s/OjK9Gs+NwhmpfEnnoYTtvbDG/GfqRxdgUmBEr39dBVetzNB
	WB+gImDHRS4gnqDY1yWkKGEFSqKF8EOwSbuBa1Ixk5ZxZOr+9xqgJG5dW8z5PXJe8IOx
	l9QcHpZg+U9USqsRt0UlZjTKUuckDGE4ZzJi203J6cWimiZj1nB3r/jPL1UTgz39Sr0k
	VgqJ7eSZgBSxRQgt8rqtSRVOWST4mb9Tno7zi9K/Wo45JqnBAIt6MCnGvAlbGPRHCI3y
	b1VA==
X-Gm-Message-State: AG10YOQyk7FuQWpJnqMJ+vNZZmugE+Ds64tISnsE9oyBafY1iuJ0aNbuVm0tIyCco3B7B1/HJjo8343Q6Oujeg==
X-Received: by 10.202.217.136 with SMTP id q130mr2260543oig.127.1455732107638; 
	Wed, 17 Feb 2016 10:01:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 17 Feb 2016 10:01:18 -0800 (PST)
In-Reply-To: <1455646193-13238-7-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
	<1455646193-13238-7-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 17 Feb 2016 10:01:18 -0800
X-Google-Sender-Auth: -fhjwSGqoZu8pHJxNOgJxjZV-4g
Message-ID: <CAKmqyKP_LC5CGbMqQeJTAPDKmGwLXeSQQPsdbUQ9Sn3NW4UF7w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::230
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 06/10] sdhci_sysbus: Create
 SD card device in users, not the device itself
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
X-TUID: 9M6Io4zXeU5v

On Tue, Feb 16, 2016 at 10:09 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> Move the creation of the SD card device from the sdhci_sysbus
> device itself into the boards that create these devices.
> This allows us to remove the cannot_instantiate_with_device_add
> notation because we no longer call drive_get_next in the device
> model.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 17 ++++++++++++++++-
>  hw/arm/xlnx-ep108.c  | 21 +++++++++++++++++++++
>  hw/arm/xlnx-zynqmp.c |  8 ++++++++
>  hw/sd/sdhci.c        | 25 -------------------------
>  4 files changed, 45 insertions(+), 26 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 66e7f27..a35983a 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -28,6 +28,7 @@
>  #include "hw/misc/zynq-xadc.h"
>  #include "hw/ssi/ssi.h"
>  #include "qemu/error-report.h"
> +#include "hw/sd/sd.h"
>
>  #define NUM_SPI_FLASHES 4
>  #define NUM_QSPI_FLASHES 2
> @@ -154,8 +155,10 @@ static void zynq_init(MachineState *machine)
>      MemoryRegion *address_space_mem = get_system_memory();
>      MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
>      MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
> -    DeviceState *dev;
> +    DeviceState *dev, *carddev;
>      SysBusDevice *busdev;
> +    DriveInfo *di;
> +    BlockBackend *blk;
>      qemu_irq pic[64];
>      int n;
>
> @@ -245,11 +248,23 @@ static void zynq_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
>
> +    di = drive_get_next(IF_SD);
> +    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
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
> +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
> +    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
> +
>      dev = qdev_create(NULL, TYPE_ZYNQ_XADC);
>      qdev_init_nofail(dev);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
> diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
> index 0de132a..a1bd283 100644
> --- a/hw/arm/xlnx-ep108.c
> +++ b/hw/arm/xlnx-ep108.c
> @@ -59,6 +59,27 @@ static void xlnx_ep108_init(MachineState *machine)
>
>      object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
>
> +    /* Create and plug in the SD cards */
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> +        BusState *bus;
> +        DriveInfo *di = drive_get_next(IF_SD);
> +        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +        DeviceState *carddev;
> +        char *bus_name;
> +
> +        bus_name = g_strdup_printf("sd-bus%d", i);
> +        bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
> +        g_free(bus_name);
> +        if (!bus) {
> +            error_report("No SD bus found for SD card %d", i);
> +            exit(1);
> +        }
> +        carddev = qdev_create(bus, TYPE_SD_CARD);
> +        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> +        object_property_set_bool(OBJECT(carddev), true, "realized",
> +                                 &error_fatal);
> +    }
> +
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
>          SSIBus *spi_bus;
>          DeviceState *flash_dev;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 1508d08..4fbb635 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -327,6 +327,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> +        char *bus_name;
> +
>          object_property_set_bool(OBJECT(&s->sdhci[i]), true,
>                                   "realized", &err);
>          if (err) {
> @@ -337,6 +339,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>                          sdhci_addr[i]);
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
>                             gic_spi[sdhci_intr[i]]);
> +        /* Alias controller SD bus to the SoC itself */
> +        bus_name = g_strdup_printf("sd-bus%d", i);
> +        object_property_add_alias(OBJECT(s), bus_name,
> +                                  OBJECT(&s->sdhci[i]), "sd-bus",
> +                                  &error_abort);
> +        g_free(bus_name);
>      }
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 396dd10..73e7c87 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1296,29 +1296,6 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>  {
>      SDHCIState *s = SYSBUS_SDHCI(dev);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> -    DriveInfo *di;
> -    BlockBackend *blk;
> -    DeviceState *carddev;
> -    Error *err = NULL;
> -
> -    /* Create and plug in the sd card.
> -     * FIXME: this should be done by the users of this device so we
> -     * do not use drive_get_next() here.
> -     */
> -    di = drive_get_next(IF_SD);
> -    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> -
> -    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
> -    qdev_prop_set_drive(carddev, "drive", blk, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> -    }
> -    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> -    }
>
>      s->buf_maxsz = sdhci_get_fifolen(s);
>      s->fifo_buffer = g_malloc0(s->buf_maxsz);
> @@ -1335,8 +1312,6 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
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
