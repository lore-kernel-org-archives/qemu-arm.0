Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3991354wrv;
        Mon, 5 Aug 2019 06:31:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyimi4PQL5inLeWbcBBSJeO2oWD1j/qTgEfG1IPkyTr+4pSmqavsNVvauWpq8NImJtGwJlN
X-Received: by 2002:a50:ec0e:: with SMTP id g14mr93663405edr.210.1565011864949;
        Mon, 05 Aug 2019 06:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565011864; cv=none;
        d=google.com; s=arc-20160816;
        b=oCWYkZxfHf1I/CXxw6s0GSosDrYeq7abpkQOLRaMYZ+D1rBrD6tgKIRtfUEYsA8Fml
         3ft3HTWhtg2Fo3GJjYnLs5s4/aqMNqafaL5qtvP7hr+aqQLltQ1PBDkpaTv9WQmDZJN5
         b0wauqzVUa766W0L/AC7BBLVQWBr8fjXeznsItl+Qf9A39sSFNqlNgI60kGVRCPrrS4a
         Mne8sP74jmoQ/3JMIp8o+/gyUUGlwsgrAeCiJG0KzrOD8TzZ3UkcPpZx7szXBGqkIWGY
         EQgtmejDul/15252WQgpBEC7dSp96qIVGl4CIONihJd57GaVeYhZy5GKQdkYFj0cWG2E
         ritQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=/PtjzSnaw1in76wOqYFAqlHjNJNABefgCUjeGUJy4uE=;
        b=bXvuvAjbjN9/ju6IIiaYSAjw+FUijfacu47Fo1Gk8cpo3lC6xtRU14ny4bF9Hm6J7v
         QfMGQLa9lQ967ZdVWEFC8fhJWO5hhYzVmxfs3TJep6OZO96HClunusiPhgltN6ow9D21
         0z4as6CqtYSM6Pj8LdFRtJzUTwq3uLRtb9F4nZqmWiV4R+5Ya8H8YgIQ7iF0FHtsTlmv
         oSD/r88U3y51+NiRJ+CAuEZQccnMBWE6ZEy7NWgNpY3c2rjYU6fJGrVBF09kBi4YnM15
         Mn2um2U04PNP93rR4hTTVvg2XLd8Gs2SAC2eXbHMbko4xjO/8cLoVzX6YBlimx4DemNR
         1fdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si28752522edb.442.2019.08.05.06.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 06:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hud4q-000421-1Z
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 09:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56152)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hud4j-00041k-QA
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hud4i-0001H7-Ew
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:30:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hud4i-0001GY-6k; Mon, 05 Aug 2019 09:30:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 34691300BC7B;
 Mon,  5 Aug 2019 13:30:55 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 162D461140;
 Mon,  5 Aug 2019 13:30:46 +0000 (UTC)
Date: Mon, 5 Aug 2019 15:30:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190805153045.60db7bf5@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83F33D896@lhreml524-mbs.china.huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-4-shameerali.kolothum.thodi@huawei.com>
 <20190730172524.6cf566ed@Igors-MacBook-Pro>
 <5FC3163CFD30C246ABAA99954A238FA83F33D896@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 05 Aug 2019 13:30:55 +0000 (UTC)
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0tmFHZ7GNwcc

On Thu, 1 Aug 2019 08:36:33 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Igor,
> 
> > -----Original Message-----
> > From: Qemu-devel
> > [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=huawei.com@nongn
> > u.org] On Behalf Of Igor Mammedov
> > Sent: 30 July 2019 16:25
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
> > ard.biesheuvel@linaro.org; shannon.zhaosl@gmail.com;
> > qemu-devel@nongnu.org; xuwei (O) <xuwei5@huawei.com>; Linuxarm
> > <linuxarm@huawei.com>; eric.auger@redhat.com; qemu-arm@nongnu.org;
> > Paolo Bonzini <pbonzini@redhat.com>; sebastien.boeuf@intel.com;
> > lersek@redhat.com
> > Subject: Re: [Qemu-devel] [PATCH-for-4.2 v8 3/9] hw/acpi: Add ACPI Generic
> > Event Device Support
> > 
> > On Fri, 26 Jul 2019 11:45:13 +0100
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> > > From: Samuel Ortiz <sameo@linux.intel.com>
> > >
> > > The ACPI Generic Event Device (GED) is a hardware-reduced specific
> > > device[ACPI v6.1 Section 5.6.9] that handles all platform events,
> > > including the hotplug ones. This patch generates the AML code that
> > > defines GEDs.
> > >
> > > Platforms need to specify their own GED Event bitmap to describe
> > > what kind of events they want to support through GED.  Also this
> > > uses a a single interrupt for the  GED device, relying on IO
> > > memory region to communicate the type of device affected by the
> > > interrupt. This way, we can support up to 32 events with a unique
> > > interrupt.
> > >
> > > This supports only memory hotplug for now.
> > >  
> >   
> > > diff --git a/hw/acpi/generic_event_device.c  
> > b/hw/acpi/generic_event_device.c  
> > > new file mode 100644
> > > index 0000000000..7902e9d706
> > > --- /dev/null
> > > +++ b/hw/acpi/generic_event_device.c  
> > [...]  
> > > +void build_ged_aml(Aml *table, const char *name, HotplugHandler  
> > *hotplug_dev,  
> > > +                   uint32_t ged_irq, AmlRegionSpace rs)
> > > +{  
> > [...]  
> > > +
> > > +        if (ged_events) {
> > > +            error_report("GED: Unsupported events specified");
> > > +            exit(1);  
> > I'd use error_abort instead, since it's programing error, if you have to respin
> > series.  
> 
> Ok.
> 
> > > +        }
> > > +    }
> > > +
> > > +    /* Append _EVT method */
> > > +    aml_append(dev, evt);
> > > +
> > > +    aml_append(table, dev);
> > > +}
> > > +  
> > [...]  
> > > +static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +    AcpiGedState *s = ACPI_GED(dev);
> > > +
> > > +    assert(s->ged_base);
> > > +    acpi_ged_init(get_system_memory(), dev, &s->ged_state);  
> > 
> > calling get_system_memory() from device code used to be a reason for
> > rejecting patch,
> > I'm not sure what suggest though.
> > 
> > Maybe Paolo could suggest something.  
> 
> How about using object_property_set_link()? Something like below.
I'm afraid it doesn't help much. Issue here is that we are letting
device to manage whole address space (which should be managed by machine)
So I'd just keep get_system_memory() as is for now if there aren't any
objections.

> ------8-----
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index f00b0ab14b..eb1ed38f4a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -229,11 +229,12 @@ static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
>      AcpiGedState *s = ACPI_GED(dev);
>  
>      assert(s->ged_base);
> -    acpi_ged_init(get_system_memory(), dev, &s->ged_state);
> +    assert(s->sys_mem);
> +    acpi_ged_init(s->sys_mem, dev, &s->ged_state);
>  
>      if (s->memhp_state.is_enabled) {
>          assert(s->memhp_base);
> -        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
> +        acpi_memory_hotplug_init(s->sys_mem, OBJECT(dev),
>                                   &s->memhp_state,
>                                   s->memhp_base);
>      }
> @@ -245,6 +246,8 @@ static Property acpi_ged_properties[] = {
>       * because GED handles memory hotplug event and acpi-mem-hotplug
>       * memory region gets initialized when GED device is realized.
>       */
> +    DEFINE_PROP_LINK("memory", AcpiGedState, sys_mem, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
>      DEFINE_PROP_UINT64("memhp-base", AcpiGedState, memhp_base, 0),
>      DEFINE_PROP_BOOL("memory-hotplug-support", AcpiGedState,
>                       memhp_state.is_enabled, true),
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 73a758d9a9..0cbaf6c6e1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -529,8 +529,12 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
>      DeviceState *dev;
>      int irq = vms->irqmap[VIRT_ACPI_GED];
>      uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT | ACPI_GED_PWR_DOWN_EVT;
> +    MemoryRegion *sys_mem = get_system_memory();
>  
>      dev = DEVICE(object_new(TYPE_ACPI_GED));
> +
> +    object_property_set_link(OBJECT(dev), OBJECT(sys_mem),
> +                             "memory", &error_abort);
>      qdev_prop_set_uint64(dev, "memhp-base",
>                           vms->memmap[VIRT_PCDIMM_ACPI].base);
>      qdev_prop_set_uint64(dev, "ged-base", vms->memmap[VIRT_ACPI_GED].base);
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index 63104f1344..f1f2f337f7 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -89,6 +89,7 @@ typedef struct GEDState {
>  
>  typedef struct AcpiGedState {
>      DeviceClass parent_obj;
> +    MemoryRegion *sys_mem;
>      MemHotplugState memhp_state;
>      hwaddr memhp_base;
>      hwaddr ged_base;
> 
> ---8----
> 

