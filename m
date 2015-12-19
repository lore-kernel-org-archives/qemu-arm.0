Received: by 10.182.158.201 with SMTP id ww9csp1902816obb;
        Sat, 19 Dec 2015 13:41:19 -0800 (PST)
X-Received: by 10.55.221.210 with SMTP id u79mr14559989qku.59.1450561279427;
        Sat, 19 Dec 2015 13:41:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s107si22885383qgd.47.2015.12.19.13.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAPFf-0002KR-5V
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:41:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPFb-0002Fq-QA
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 16:41:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPFa-0001jc-7B
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 16:41:15 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:36201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAPFT-0001iZ-Mi; Sat, 19 Dec 2015 16:41:07 -0500
Received: by mail-pf0-x231.google.com with SMTP id o64so67294655pfb.3;
	Sat, 19 Dec 2015 13:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=56V/yrHmj2O6EeddWFpujfnPoQffE+vKjxbc2lwMTPs=;
	b=oFwKUtUicsnX/g76Wu82qVfxuEFbObUdsNpa40/QYklr1c4FC+gymCwQ92rRnMqs6F
	rDbuxEOxXrH7O7rxbNunD4ISVyVTa8MBnkqmmUnE5Nr/XtRiGuiS5FJHIcm3bCIbYycp
	JVI5ztHp89QhVDQ8V4mKmjnxLk/uegV8+ouhpoHgPRkRTZN4l52mz6Vr4Udyz9I6AWdx
	IWqxNjC8RWbaHzMU/K13ayBY0YP0aOsONbm2vweCGlW8VfOfiZrsDIC5xzvgUSUUKqho
	qivkUnq4h0d8ppISjFn9Au8EPXKT9UZGfbRQ4eGOM5qWjRAC3fOYqX1Q6wcpqBUSLKMW
	mDiQ==
X-Received: by 10.98.8.89 with SMTP id c86mr15771470pfd.122.1450561267173;
	Sat, 19 Dec 2015 13:41:07 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155]) by smtp.gmail.com with ESMTPSA id
	o22sm25653670pfi.2.2015.12.19.13.41.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:41:06 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Sat, 19 Dec 2015 13:40:58 -0800
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20151219214058.GG4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-7-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKN-0YTai2tYbBoJsH9A022hpDcs89jwRsKOr2upgFdwXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKN-0YTai2tYbBoJsH9A022hpDcs89jwRsKOr2upgFdwXA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Patch Tracking <patches@linaro.org>, Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
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
X-TUID: UTgOiT22OSFD

On Thu, Dec 17, 2015 at 04:18:19PM -0800, Alistair Francis wrote:
> On Fri, Dec 11, 2015 at 8:37 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Move the creation of the SD card device from the sdhci_sysbus
> > device itself into the boards that create these devices.
> > This allows us to remove the cannot_instantiate_with_device_add
> > notation because we no longer call drive_get_next in the device
> > model.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/xilinx_zynq.c | 17 ++++++++++++++++-
> >  hw/arm/xlnx-ep108.c  | 19 +++++++++++++++++++
> >  hw/sd/sdhci.c        | 22 ----------------------
> >  3 files changed, 35 insertions(+), 23 deletions(-)
> >
> > diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> > index 1c1a445..3195055 100644
> > --- a/hw/arm/xilinx_zynq.c
> > +++ b/hw/arm/xilinx_zynq.c
> > @@ -27,6 +27,7 @@
> >  #include "hw/misc/zynq-xadc.h"
> >  #include "hw/ssi.h"
> >  #include "qemu/error-report.h"
> > +#include "hw/sd/sd.h"
> >
> >  #define NUM_SPI_FLASHES 4
> >  #define NUM_QSPI_FLASHES 2
> > @@ -153,8 +154,10 @@ static void zynq_init(MachineState *machine)
> >      MemoryRegion *address_space_mem = get_system_memory();
> >      MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
> >      MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
> > -    DeviceState *dev;
> > +    DeviceState *dev, *carddev;
> >      SysBusDevice *busdev;
> > +    DriveInfo *di;
> > +    BlockBackend *blk;
> >      qemu_irq pic[64];
> >      Error *err = NULL;
> >      int n;
> > @@ -260,11 +263,23 @@ static void zynq_init(MachineState *machine)
> >      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
> >      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
> >
> > +    di = drive_get_next(IF_SD);
> > +    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> > +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
> > +    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> > +    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
> > +
> >      dev = qdev_create(NULL, "generic-sdhci");
> >      qdev_init_nofail(dev);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
> >      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
> >
> > +    di = drive_get_next(IF_SD);
> > +    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> > +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
> > +    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> > +    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
> > +
> >      dev = qdev_create(NULL, TYPE_ZYNQ_XADC);
> >      qdev_init_nofail(dev);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
> > diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
> > index 85b978f..cb95d32 100644
> > --- a/hw/arm/xlnx-ep108.c
> > +++ b/hw/arm/xlnx-ep108.c
> > @@ -34,6 +34,7 @@ static void xlnx_ep108_init(MachineState *machine)
> >  {
> >      XlnxEP108 *s = g_new0(XlnxEP108, 1);
> >      Error *err = NULL;
> > +    int i;
> >
> >      object_initialize(&s->soc, sizeof(s->soc), TYPE_XLNX_ZYNQMP);
> >      object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> > @@ -45,6 +46,24 @@ static void xlnx_ep108_init(MachineState *machine)
> >          exit(1);
> >      }
> >
> > +    /* Create and plug in the SD cards */
> > +    for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> > +        BusState *bus;
> > +        DriveInfo *di = drive_get_next(IF_SD);
> > +        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
> > +        DeviceState *carddev;
> > +
> > +        bus = qdev_get_child_bus(DEVICE(&s->soc.sdhci[i]), "sd-bus");
> 
> This looks like the same thing I was trying to avoid with my SPI
> patches. We were trying to avoid the machine reaching into the SoC
> when getting the child busses. Instead expose the bus to the SoC so
> the board can just get it straight from there.
> 

I have an alternate QOM fix that should enable this. Will comment the SPI
discussion.

Regards,
Peter

> > +        if (!bus) {
> > +            error_report("No SD bus found for SD card %d", i);
> > +            exit(1);
> > +        }
> > +        carddev = qdev_create(bus, TYPE_SD);
> > +        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> > +        object_property_set_bool(OBJECT(carddev), true, "realized",
> > +                                 &error_fatal);
> > +    }
> > +
> 
> I also think this should go after the other memory creation, not before.
> 
> Thanks,
> 
> Alistair
> 
> >      if (machine->ram_size > EP108_MAX_RAM_SIZE) {
> >          error_report("WARNING: RAM size " RAM_ADDR_FMT " above max supported, "
> >                       "reduced to %llx", machine->ram_size, EP108_MAX_RAM_SIZE);
> > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > index 17e08a2..c8e3865 100644
> > --- a/hw/sd/sdhci.c
> > +++ b/hw/sd/sdhci.c
> > @@ -1296,26 +1296,6 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
> >  {
> >      SDHCIState *s = SYSBUS_SDHCI(dev);
> >      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> > -    DriveInfo *di;
> > -    BlockBackend *blk;
> > -    DeviceState *carddev;
> > -
> > -    /* Create and plug in the sd card.
> > -     * FIXME: this should be done by the users of this device so we
> > -     * do not use drive_get_next() here.
> > -     */
> > -    di = drive_get_next(IF_SD);
> > -    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> > -
> > -    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
> > -    qdev_prop_set_drive(carddev, "drive", blk, errp);
> > -    if (*errp) {
> > -        return;
> > -    }
> > -    object_property_set_bool(OBJECT(carddev), true, "realized", errp);
> > -    if (*errp) {
> > -        return;
> > -    }
> >
> >      s->buf_maxsz = sdhci_get_fifolen(s);
> >      s->fifo_buffer = g_malloc0(s->buf_maxsz);
> > @@ -1333,8 +1313,6 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
> >      dc->vmsd = &sdhci_vmstate;
> >      dc->props = sdhci_sysbus_properties;
> >      dc->realize = sdhci_sysbus_realize;
> > -    /* Reason: instance_init() method uses drive_get_next() */
> > -    dc->cannot_instantiate_with_device_add_yet = true;
> >  }
> >
> >  static const TypeInfo sdhci_sysbus_info = {
> > --
> > 1.9.1
> >
> >
