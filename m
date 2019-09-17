Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5388583wrp;
        Tue, 17 Sep 2019 08:28:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIzMZn5fK9krQP1WDsw6YOUUoyxKbpr7jMO2W+ZCUFS8ciKPGrIuCoL0GeQ1ySMOns6vO4
X-Received: by 2002:a37:8f04:: with SMTP id r4mr4522303qkd.244.1568734109382;
        Tue, 17 Sep 2019 08:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568734109; cv=none;
        d=google.com; s=arc-20160816;
        b=GsZyVyPTjzNjQa3jgyDd5k7AZb0YLxzh1DZMpUBQjzH4+cf17AfiDu/FrwMPLJDeHf
         h82TJVWtvT+na6D4ybmWS9Hv7ocjoLvn94SAwCku184gPKd1zQjnN3trVaRKFojSGeoy
         fSt1myWxhhEUZKo/qfngpC9u+taX245xFZ905G4OexYXEwnD10ZIyellX1CqTzCsPB1p
         PbzDHaijiGGVSZvOLyg6b5WNTv3FvKNtEJA+4yUDqQ/dwnaiUurXmUOoL9KDnaF9q5F7
         Y4gAttB4Q+XVOyTu/qKmaH4UrrxzL0BZbIpF6g8ghxwmSHauEH1x4lfVJBFpxL1gG/Cl
         HtOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=542IdyGwDUFuCsgjKo+C8urq/LB2530/4HBGA0utn4g=;
        b=r4RAkqFfkcw8X9dq7UNR9fwmnButyjA7BMJLsTMAG7Zv5ZJ4nTz5QwWsLgOIuJCBLd
         avx3wGyuosobdVgY5FRCG5goYTChGhY5L/uumnrsFqRwlg036zqxdHEAkmpQ3zXVoys5
         IgBaAka1GsYQ/7u6SU7xnvv/4iGqyN1s24wu/2n2Fw7HVhiT8cRhMSUGViU0de1zs5/8
         TnNyaWWVq8s+v//8ThRrSkvr5S8n05saNdWxd9fR24aBk+kZ0EBmGVLs0DSvs87UsxvZ
         5wwvY7FdZP/PgzPuccIbOvi4lEJweGx0HjXdqYceyvORhCbXFTwbL5l48tMnq0UB/Z7z
         ECEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si1748997qkm.36.2019.09.17.08.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 08:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAFP2-0000Uy-Fa
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 11:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iAFMc-0007Qm-2M
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 11:25:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iAFMY-0006Z7-WF
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 11:25:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32884)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iAFMY-0006Ym-Lg; Tue, 17 Sep 2019 11:25:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 28D2158487;
 Tue, 17 Sep 2019 15:25:53 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3520B5C28C;
 Tue, 17 Sep 2019 15:25:47 +0000 (UTC)
Date: Tue, 17 Sep 2019 17:25:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190917172545.41e1dfb9@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83F3F293A@lhreml524-mbs.china.huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-6-shameerali.kolothum.thodi@huawei.com>
 <20190911150700.7a917d14@redhat.com>
 <5FC3163CFD30C246ABAA99954A238FA83F3F293A@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 17 Sep 2019 15:25:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v10 05/11] hw/arm/virt: Enable device
 memory cold/hot plug with ACPI boot
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JcXJHS45BVHh

On Mon, 16 Sep 2019 10:30:45 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Igor,
> 
> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 11 September 2019 14:07
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org;
> > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > sebastien.boeuf@intel.com; xuwei (O) <xuwei5@huawei.com>;
> > lersek@redhat.com; ard.biesheuvel@linaro.org; Linuxarm
> > <linuxarm@huawei.com>
> > Subject: Re: [PATCH-for-4.2 v10 05/11] hw/arm/virt: Enable device memory
> > cold/hot plug with ACPI boot
> > 
> > On Wed, 4 Sep 2019 09:56:23 +0100
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > 
> > [...]  
> > > @@ -730,6 +733,19 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,  
> > VirtMachineState *vms)  
> > >                        vms->highmem, vms->highmem_ecam);
> > >      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> > >                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
> > > +    if (vms->acpi_dev) {
> > > +        build_ged_aml(scope, "\\_SB."GED_DEVICE,
> > > +                      HOTPLUG_HANDLER(vms->acpi_dev),
> > > +                      irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE,  
> > AML_SYSTEM_MEMORY,  
> > > +                      memmap[VIRT_ACPI_GED].base);
> > > +    }
> > > +
> > > +    if (vms->acpi_dev && ms->ram_slots) {
> > > +        build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB",  
> > NULL,  
> > > +                                 AML_SYSTEM_MEMORY,
> > > +  
> > memmap[VIRT_PCDIMM_ACPI].base);  
> > > +    }  
> > one more thing (though non critical), if ms->ram_slots == 0 ^^^^
> > makes IASL spew a warning
> > 
> >     External (_SB_.MHPC.MSCN, MethodObj)    // Warning: Unknown
> > method, guessing 0 arguments
> > 
> > In general non-existing references within methods are fine if they aren't ever
> > used.
> > however we can be a little bit less sloppy.
> > Below you advertise "event = ACPI_GED_MEM_HOTPLUG_EVT", and then here
> > suddenly
> > don't generate essential AML part for it here.  
> 
> Ok.
> 
> > For consistency if above is conditioned on ms->ram_slots != 0, probably
> > it would be better to move that condition where you set 'event' value and
> > check property value above instead of ms->ram_slots  
> 
> I understand the concern here, but not sure I get the suggestion to check 
> the "property" instead of ms->ram_slots correctly. 
> 
> Is this what you have in mind?
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 538b3bbefa..5c9269dca1 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -742,10 +742,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                        memmap[VIRT_ACPI_GED].base);
>      }
>  
> -    if (vms->acpi_dev && ms->ram_slots) {
> -        build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB", NULL,
> -                                 AML_SYSTEM_MEMORY,
> -                                 memmap[VIRT_PCDIMM_ACPI].base);
> +    if (vms->acpi_dev) {
> +        uint32_t event = object_property_get_uint(OBJECT(vms->acpi_dev),
> +                                                  "ged-event", NULL);
s/NULL/error_abort/

> +
> +        if (event & ACPI_GED_MEM_HOTPLUG_EVT) {
> +            build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB", NULL,
> +                                     AML_SYSTEM_MEMORY,
> +                                     memmap[VIRT_PCDIMM_ACPI].base);
> +        }
>      }
>  
>      acpi_dsdt_add_power_button(scope);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index bc152ea2b0..6b024b16df 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -534,8 +534,13 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>  static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
>  {
>      DeviceState *dev;
> +    MachineState *ms = MACHINE(vms);
>      int irq = vms->irqmap[VIRT_ACPI_GED];
> -    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
> +    uint32_t event = 0;
> +
> +    if (ms->ram_slots) {
> +        event = ACPI_GED_MEM_HOTPLUG_EVT;
> +    }
>  
>      dev = qdev_create(NULL, TYPE_ACPI_GED);
>      qdev_prop_set_uint32(dev, "ged-event", event);
> 
> ---8---
>
> Please let me know.
Looks good to me.

Thanks!


> 
> Thanks,
> Shameer
> 
>  
> > [...]  
> > > +static inline DeviceState *create_acpi_ged(VirtMachineState *vms,  
> > qemu_irq *pic)  
> > > +{
> > > +    DeviceState *dev;
> > > +    int irq = vms->irqmap[VIRT_ACPI_GED];
> > > +    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
> > > +
> > > +    dev = qdev_create(NULL, TYPE_ACPI_GED);
> > > +    qdev_prop_set_uint32(dev, "ged-event", event);
> > > +    qdev_init_nofail(dev);
> > > +
> > > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,  
> > vms->memmap[VIRT_ACPI_GED].base);  
> > > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1,  
> > vms->memmap[VIRT_PCDIMM_ACPI].base);  
> > > +
> > > +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> > > +
> > > +    return dev;
> > > +}
> > > +  
> > [...]  

