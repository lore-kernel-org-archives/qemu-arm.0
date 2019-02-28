Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp786287wrx;
        Thu, 28 Feb 2019 08:44:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwUmBcME4Vq114Wr/3enYXFww3jEwlG7M93QoC2BNn7MAY/wMOV4xjfMUqLenkk2bumxVPo
X-Received: by 2002:a5b:78b:: with SMTP id b11mr245727ybq.185.1551372294919;
        Thu, 28 Feb 2019 08:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551372294; cv=none;
        d=google.com; s=arc-20160816;
        b=ygdhP5PdNNuCduNYh00MeJ5/rX2YsNBEQpsU5TpdfARAO5uwMsPQdQYuLuWs/2mmD3
         IFkuy2IbbZz/r1w9gRiGqwduDS9zoAzZnP5yqQpA9iq/0xvPSJUnXRcsIWrcwyrhlXPY
         w7M84reN+dB3wSA0zfPzQ3R0URfp9wfMKkkZoW5N+V9KbzX8ocn+f4cQcP2CxJZnelsS
         sIlZqmlEF2QAMr0E8nny36839myOYc7wJvfGFVlvPMJHsAfg+mQKuMeQ+lGuQg2NJtWA
         RZxZaNfM5AMOoX4b7z11hQfZ1SdkoNEFJIVzNJX9idqJ05X0Y8f3E3Us63TUt3OphL3g
         rTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=JqCEDMIa6hmV4K+EYgGBddPhcBOAVTNgmvDbzNuRJE8=;
        b=Dr9jOjWcTZgEJBxTu6tInkJvsk4hYH9q8X3RKYx0INB5O5Jmjzf0zh91IfXVtIc5tQ
         SdOQgq9oKDj70UrxpS3rzGzuftlzKW10btQBMRszg1ez0EY3TjPe4UYWrteRuEvhP/C6
         YO1G2X02cMZyVFwxBMh4KpOVOlq1V4J8BwMLyYlYc8O/yyD5ufCNKZeHP6amfwi0OuB1
         /dAhSu4tSTwWJlS31Dos3S3b9mX5EP7IoXQQJKZ7JnaS/eNod4jQWFBXqhtZC9T0wI0P
         ATgi+wTUmMNy/W5jX2P+T4OcepmqRvLzO3wuDgnwZcwgDxDVCvFKxZDITHUtbRqby7RZ
         50yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o124si8502722yba.142.2019.02.28.08.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 08:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzOnm-0000Tp-7f
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 11:44:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzOne-0000Sv-1Y
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 11:44:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzOnb-00018Z-Oq
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 11:44:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38906)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzOnZ-00010W-K2; Thu, 28 Feb 2019 11:44:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0FCA13B251;
	Thu, 28 Feb 2019 16:44:29 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4ED55DD74;
	Thu, 28 Feb 2019 16:44:25 +0000 (UTC)
Date: Thu, 28 Feb 2019 17:44:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190228174424.1cae71b8@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8392D7AB9@lhreml524-mbs.china.huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-2-shameerali.kolothum.thodi@huawei.com>
	<b1cd0cb1-d914-3d04-8a48-c53e0c63eed2@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D7AB9@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 28 Feb 2019 16:44:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 1/4] hw:acpi: Make ACPI IO address space
 configurable
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OIHvxwW1Di64

On Thu, 28 Feb 2019 16:09:48 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Eric,
> 
> > -----Original Message-----
> > From: Auger Eric [mailto:eric.auger@redhat.com]
> > Sent: 27 February 2019 17:53
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> > shannon.zhaosl@gmail.com; peter.maydell@linaro.org;
> > imammedo@redhat.com; qemu-devel@nongnu.org; qemu-arm@nongnu.org
> > Cc: xuwei (O) <xuwei5@huawei.com>; Linuxarm <linuxarm@huawei.com>
> > Subject: Re: [RFC PATCH 1/4] hw:acpi: Make ACPI IO address space
> > configurable
> > 
> > Hi Shameer,
> > On 1/28/19 12:05 PM, Shameer Kolothum wrote:  
> > > This is in preparation for adding support for ARM64 platforms where it
> > > doesn't use port mapped IO for ACPI IO space.
> > >
> > > Also add a flag to identify hw reduced ACPI platforms as they might
> > > use GPIO hw for signaling ACPI platform events.
> > >
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >  hw/acpi/memory_hotplug.c         | 13 ++++++++-----
> > >  hw/i386/acpi-build.c             |  3 ++-
> > >  include/hw/acpi/memory_hotplug.h |  6 ++++--
> > >  3 files changed, 14 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c index
> > > 921cad2..05f1d45 100644
> > > --- a/hw/acpi/memory_hotplug.c
> > > +++ b/hw/acpi/memory_hotplug.c
> > > @@ -34,7 +34,7 @@
> > >  #define MEMORY_HOTPLUG_IO_LEN         24
> > >  #define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
> > >
> > > -static uint16_t memhp_io_base;
> > > +static hwaddr memhp_io_base;
> > >
> > >  static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus
> > > *mdev)  { @@ -208,7 +208,7 @@ static const MemoryRegionOps
> > > acpi_memory_hotplug_ops = {  };
> > >
> > >  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> > > -                              MemHotplugState *state, uint16_t  
> > io_base)  
> > > +                              MemHotplugState *state, hwaddr  
> > io_base)  
> > >  {
> > >      MachineState *machine = MACHINE(qdev_get_machine());
> > >
> > > @@ -279,7 +279,9 @@ void acpi_memory_plug_cb(HotplugHandler  
> > *hotplug_dev, MemHotplugState *mem_st,  
> > >      mdev->is_enabled = true;
> > >      if (dev->hotplugged) {
> > >          mdev->is_inserting = true;
> > > -        acpi_send_event(DEVICE(hotplug_dev),  
> > ACPI_MEMORY_HOTPLUG_STATUS);  
> > > +        if (!mem_st->hw_reduced_acpi) {
> > > +            acpi_send_event(DEVICE(hotplug_dev),  
> > ACPI_MEMORY_HOTPLUG_STATUS);  
> > > +        }
> > >      }
> > >  }
> > >
> > > @@ -341,7 +343,8 @@ const VMStateDescription  
> > vmstate_memory_hotplug =  
> > > {
> > >
> > >  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
> > >                                const char *res_root,
> > > -                              const char *event_handler_method)
> > > +                              const char *event_handler_method,
> > > +                              AmlRegionSpace rs)
> > >  {
> > >      int i;
> > >      Aml *ifctx;
> > > @@ -371,7 +374,7 @@ void build_memory_hotplug_aml(Aml *table,  
> > uint32_t nr_mem,  
> > >          aml_append(mem_ctrl_dev, aml_name_decl("_CRS", crs));
> > >
> > >          aml_append(mem_ctrl_dev, aml_operation_region(
> > > -            MEMORY_HOTPLUG_IO_REGION, AML_SYSTEM_IO,
> > > +            MEMORY_HOTPLUG_IO_REGION, rs,
> > >              aml_int(memhp_io_base), MEMORY_HOTPLUG_IO_LEN)  
> > Given the change in the datatype (memhp_io_base) is it OK to keep the
> > aml_int() cast.  
> 
> Hmm...aml_int() has uint64_t but not sure hwaddr will cause any unwarranted effects on
> other platforms. Do you see any potential issues here?
aml_int encodes it according to the value so it should e fine

> 
> > Also we have
> > "
> >         aml_append(crs,
> >             aml_io(AML_DECODE16, memhp_io_base, memhp_io_base, 0,
> >                    MEMORY_HOTPLUG_IO_LEN)
> >         );
> > " where we have aml_io being used + AML_decode16. Shouldn't we have
> > aml_*_memory depending on rs?  
> 
> That looks like a valid point, but then I wonder how this worked. I will double check.

maybe use aml_memory32_fixed() or aml_[dq]word_memory()

  
> > I am not knowledged enough about the aml description but just in case.  
> 
> Same here :).
> 
> Thanks,
> Shameer
> 
> 
> > Thanks
> > 
> > Eric
> >   
> > >          );
> > >
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c index
> > > 2e21a31..b62c1a3 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -1852,7 +1852,8 @@ build_dsdt(GArray *table_data, BIOSLinker  
> > *linker,  
> > >          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> > >                         "\\_SB.PCI0", "\\_GPE._E02");
> > >      }
> > > -    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",  
> > "\\_GPE._E03");  
> > > +    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> > > +                             "\\_GPE._E03", AML_SYSTEM_IO);
> > >
> > >      scope =  aml_scope("_GPE");
> > >      {
> > > diff --git a/include/hw/acpi/memory_hotplug.h
> > > b/include/hw/acpi/memory_hotplug.h
> > > index 77c6576..ec56579 100644
> > > --- a/include/hw/acpi/memory_hotplug.h
> > > +++ b/include/hw/acpi/memory_hotplug.h
> > > @@ -26,10 +26,11 @@ typedef struct MemHotplugState {
> > >      uint32_t selector;
> > >      uint32_t dev_count;
> > >      MemStatus *devs;
> > > +    bool hw_reduced_acpi; /*true for hw reduced acpi platform */
> > >  } MemHotplugState;
> > >
> > >  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> > > -                              MemHotplugState *state, uint16_t  
> > io_base);  
> > > +                              MemHotplugState *state, hwaddr
> > > + io_base);
> > >
> > >  void acpi_memory_plug_cb(HotplugHandler *hotplug_dev,  
> > MemHotplugState *mem_st,  
> > >                           DeviceState *dev, Error **errp); @@ -48,5
> > > +49,6 @@ void acpi_memory_ospm_status(MemHotplugState *mem_st,
> > > ACPIOSTInfoList ***list);
> > >
> > >  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
> > >                                const char *res_root,
> > > -                              const char *event_handler_method);
> > > +                              const char *event_handler_method,
> > > +                              AmlRegionSpace rs);
> > >  #endif
> > >  

