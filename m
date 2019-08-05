Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4134632wrv;
        Mon, 5 Aug 2019 08:47:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxe9zPVRbbRACbXRJNs2CKO8JztEyhnPGvSXstb/O4qiumBc9sVxUqFCUrvMMe5SHwSEYhS
X-Received: by 2002:a0c:acab:: with SMTP id m40mr111771068qvc.52.1565020033187;
        Mon, 05 Aug 2019 08:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565020033; cv=none;
        d=google.com; s=arc-20160816;
        b=rtOAphwY+rs+AA/iHrzmtL0QfbLM2OSpSOaxcNWgJLVejbx0rqtyiEGxgOIH7T/TzV
         4JaIjWCUyzLMAkcVcz+KdSS0mcb9nPmNqju1r7vUBz4gos/AQCaM5IIllpJ5Cqj32KTP
         +bwtZ/Eg56ZLTVoa+x5VyrNxF3E+UFlt3r+hncZDvG09CEMahSss7pfDk8kVSoWnyvhb
         BwbOs9t9su7e9k2vGJOrFGpSA2N+15WaNV/uJPohL1mENp/47T20fWH4QWvEqBZla5Yp
         Tg3o6G2XdA4TgJAXjGYeyj1UOMuTFeyuLUIEFkENy9un1IX7BU3hyWGs47wZeW6bwMwk
         Aj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=F25GD2va4CsqMNCtutqTCsUW4YzbYOCFRswQQT4wlxg=;
        b=JmRP+nrb3F6RYlXIzoxHpSVWIf17XJ9c36Us9RQ3N9OcTYYgb91wEP41YwCYphfnuJ
         DJVOIidt8ONWFgcaEMcJtr2fpWIxYMeWmZWtlGWtXEXM+mGxD2pKp+RYLDUKWY6twerB
         8HskzIunGJbX3G5DFeeogZTnRu1vjed9W7levS14tO2T2KaJPLDWS14T01bi6QgRThAw
         QcBSIcwwhz7Ph0ZzwFPn832ayZsq2AOhK4il5rico+E+RCMVEYikqrUX1RjL5Z+mdX4Z
         /Tx22mPBv0fzHmgG5jpLoQ1rE/1zEt4fZZL5Qi2zFoOx5Hwh1JHfU4wzSDI/GSoa1gG0
         TVig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si45425596qkb.182.2019.08.05.08.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 08:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hufCa-0007ww-Os
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 11:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hufCU-0007wf-61
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 11:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hufCT-000479-0E
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 11:47:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37640)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hufCS-00046f-NI; Mon, 05 Aug 2019 11:47:04 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39D853090FF4;
 Mon,  5 Aug 2019 15:47:03 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8115B60A97;
 Mon,  5 Aug 2019 15:46:54 +0000 (UTC)
Date: Mon, 5 Aug 2019 17:46:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190805174652.61e9852a@redhat.com>
In-Reply-To: <CAFEAcA-+z4t75VwfWG1ezJm=4zfdWH6nz1Oe75Zs953+vKMvdQ@mail.gmail.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-4-shameerali.kolothum.thodi@huawei.com>
 <20190730172524.6cf566ed@Igors-MacBook-Pro>
 <5FC3163CFD30C246ABAA99954A238FA83F33D896@lhreml524-mbs.china.huawei.com>
 <20190805153045.60db7bf5@redhat.com>
 <CAFEAcA-+z4t75VwfWG1ezJm=4zfdWH6nz1Oe75Zs953+vKMvdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 05 Aug 2019 15:47:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v8 3/9] hw/acpi: Add
 ACPI Generic Event Device Support
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
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +1f98ju1AYXS

On Mon, 5 Aug 2019 14:42:38 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 5 Aug 2019 at 14:30, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Thu, 1 Aug 2019 08:36:33 +0000
> > Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
> >  
> > > Hi Igor,
> > >  
> > > > -----Original Message-----  
> > > > > +static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
> > > > > +{
> > > > > +    AcpiGedState *s = ACPI_GED(dev);
> > > > > +
> > > > > +    assert(s->ged_base);
> > > > > +    acpi_ged_init(get_system_memory(), dev, &s->ged_state);  
> > > >
> > > > calling get_system_memory() from device code used to be a reason for
> > > > rejecting patch,
> > > > I'm not sure what suggest though.
> > > >
> > > > Maybe Paolo could suggest something.  
> > >
> > > How about using object_property_set_link()? Something like below.  
> > I'm afraid it doesn't help much. Issue here is that we are letting
> > device to manage whole address space (which should be managed by machine)
> > So I'd just keep get_system_memory() as is for now if there aren't any
> > objections.  
> 
> What are we trying to do with this device, and what does it need
> the system memory region for?
> 
> In this case, we seem to do:
> 
> +static void acpi_ged_init(MemoryRegion *as, DeviceState *dev, GEDState *ged_st)
> +{
> +    AcpiGedState *s = ACPI_GED(dev);
> +
> +    memory_region_init_io(&ged_st->io, OBJECT(dev), &ged_ops, ged_st,
> +                          TYPE_ACPI_GED, ACPI_GED_EVT_SEL_LEN);
> +    memory_region_add_subregion(as, s->ged_base, &ged_st->io);
> +    qdev_init_gpio_out_named(DEVICE(s), &s->irq, "ged-irq", 1);
> +}
> 
> 
> This is definitely a bad idea -- devices should not add their
> own memory regions to the system memory MR. They should
> expose their MRs (by being a sysbus-device) and let the board
> code do the wiring up of the MRs into the right memory space
> at the right address.

it's not the only place in GED that is trying to add to system address
space, optionally if called acpi_memory_hotplug_init() will do the same,
then later we could add cpu hotplug memory region over there.

Perhaps we could use bus-less device plug code path,
in that case memory_region_init_io()/qdev_init_gpio_out_named()
should be moved to ged_initfn() and mapping part into specialized helper
(similar to pc_dimm_plug() ) that's called by board (from virt_machine_device_plug_cb)
callback during completing device realize stage, it would be something like:

virt.c:
   virt_machine_device_plug_cb()
      if dev == GED_TYPE
        machine_ged_plug_helper(system_memory)

generic_event_device.c:
   machine_ged_plug_helper(as, irq) // similar to sysbus_mmio_map() but ged specialized
      connect_irq()
      memory_region_add_subregion(as, ged->ged_base, &ged->io)
      if ged->memory-hotplug-support
          memory_region_add_subregion(as, ged->memhp_base , &ged->memhp_state.memhp_io)


in this case addresses could be normally hard-codded in board code if device is not optional
(as in patch 6/9: create_acpi_ged() )
or potentially they could come from CLI as -device parameters
(/me thinking about building blocks that allow to create machine from config)

sysbus device might be fine as shortcut if we are thinking about
only creating device during machine_init (although I have a reservations towards
sysbus interface (ex: caller of sysbus_mmio_map() has no clue when mapping N-th
region at some address)).


> thanks
> -- PMM

