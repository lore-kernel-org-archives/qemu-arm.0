Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp508082wrx;
        Thu, 28 Feb 2019 04:15:27 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZCfsKyQUMCKDLCHwkQ6+VMwvN38W/+UpIPJ99Lzb6vIDpaiyk7ibcT8ab/Wq19zIU9wHxG
X-Received: by 2002:a25:e0c5:: with SMTP id x188mr6098907ybg.376.1551356127566;
        Thu, 28 Feb 2019 04:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551356127; cv=none;
        d=google.com; s=arc-20160816;
        b=RugI/P8ePmZ4DDt6dEZTa33FTvWXwXaULC2V26Dh8eqP/zbkP+RHw6Jw5Ej2Cp0nGY
         mOQplNwPOO60VyFm2MjmFAVaaRL7ouLRYOSJKG9fZvjxDM5Os8S5Z/5EUx3ZrwA10kpN
         hVdb5Ri28S9zSnr2RCdpXTEDSWcsTlsb3Rkib2f26mOtvsH2sLry6oyNQGP2tTZISrv3
         rjiR7FzV1BmAwlCJhBxpbqorbmPy9Bp88OZX9Yg4zVr1drSk2Wz4xHPJYikftH6EM8Jr
         YOAWS5EZQARehMdLpTlGGMUYIqekluX0mkuzrAH7tS3bv/z6plBK1KU7ambQcNkbTV+x
         PeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=X9fRJtXLz+tvFGBIWch1GvYCsSHieMIzt5UT6KuWbYI=;
        b=WMG8TmcR4lEx9hN+g0IK4TsiNzUHdEYCiHtOUWUu1NAatyCjLWBNhY3cmrdPlWFOqi
         QTngXLsiiEJZp/KtVReO5ZpvUbRMIClVm+bs7BHTUK1So5zkZsbmIPI3aqejOOJ3u75I
         Tso/QK7tlcKqgffPeUiUjZw/CeFPdjbZn/WVcyXMBoV4gEglXeedPQp0BvCDoH3RIFbc
         1sB6m8iSl+Jnsw/xxKlkeC1W60fQh27xRqVbt9uN8nBbTy7+rgJaSiId65VKNvpfuLrK
         bpU5zo8t1jXBmhYyFMgHf+nvDjqQNnZrXrX7olXP2QGjgQ4HigK5Vq0zdscQwCGPmR98
         KKxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188si8983784ybq.256.2019.02.28.04.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 04:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:37124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzKb1-0007ig-1I
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 07:15:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gzKau-0007iV-2y
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 07:15:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gzKak-0000MM-PC
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 07:15:17 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:45352 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gzKaj-0000GQ-Oq; Thu, 28 Feb 2019 07:15:10 -0500
Received: from LHREML712-CAH.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 04D6F70226AB0F7E04ED;
	Thu, 28 Feb 2019 12:15:02 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.86]) by
	LHREML712-CAH.china.huawei.com ([10.201.108.35]) with mapi id
	14.03.0415.000; Thu, 28 Feb 2019 12:14:52 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [RFC PATCH 1/4] hw:acpi: Make ACPI IO address space configurable
Thread-Index: AQHUtvmhS7hzKtLZHEiYlaJ/YIu4IqX0BMKAgAFKAtA=
Date: Thu, 28 Feb 2019 12:14:51 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8392D7546@lhreml524-mbs.china.huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-2-shameerali.kolothum.thodi@huawei.com>
	<20190227172739.70fb0d18@redhat.com>
In-Reply-To: <20190227172739.70fb0d18@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
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
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /89N34/yaqrd



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 27 February 2019 16:28
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: eric.auger@redhat.com; shannon.zhaosl@gmail.com;
> peter.maydell@linaro.org; qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> xuwei (O) <xuwei5@huawei.com>; Linuxarm <linuxarm@huawei.com>
> Subject: Re: [RFC PATCH 1/4] hw:acpi: Make ACPI IO address space
> configurable
>=20
> On Mon, 28 Jan 2019 11:05:43 +0000
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > This is in preparation for adding support for ARM64 platforms where it
> > doesn't use port mapped IO for ACPI IO space.
> >
> > Also add a flag to identify hw reduced ACPI platforms as they might
> > use GPIO hw for signaling ACPI platform events.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/acpi/memory_hotplug.c         | 13 ++++++++-----
> >  hw/i386/acpi-build.c             |  3 ++-
> >  include/hw/acpi/memory_hotplug.h |  6 ++++--
> >  3 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c index
> > 921cad2..05f1d45 100644
> > --- a/hw/acpi/memory_hotplug.c
> > +++ b/hw/acpi/memory_hotplug.c
> > @@ -34,7 +34,7 @@
> >  #define MEMORY_HOTPLUG_IO_LEN         24
> >  #define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
> >
> > -static uint16_t memhp_io_base;
> > +static hwaddr memhp_io_base;
> >
> >  static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus
> > *mdev)  { @@ -208,7 +208,7 @@ static const MemoryRegionOps
> > acpi_memory_hotplug_ops =3D {  };
> >
> >  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> > -                              MemHotplugState *state, uint16_t
> io_base)
> > +                              MemHotplugState *state, hwaddr
> io_base)
> >  {
> >      MachineState *machine =3D MACHINE(qdev_get_machine());
> >
> > @@ -279,7 +279,9 @@ void acpi_memory_plug_cb(HotplugHandler
> *hotplug_dev, MemHotplugState *mem_st,
> >      mdev->is_enabled =3D true;
> >      if (dev->hotplugged) {
> >          mdev->is_inserting =3D true;
> > -        acpi_send_event(DEVICE(hotplug_dev),
> ACPI_MEMORY_HOTPLUG_STATUS);
> > +        if (!mem_st->hw_reduced_acpi) {
> > +            acpi_send_event(DEVICE(hotplug_dev),
> ACPI_MEMORY_HOTPLUG_STATUS);
> > +        }
> Why do you restrict it to non hw_reduced_acpi?
>=20
> If anything else, I'd expect virt board (or hotplug controller (GED or wh=
atever)
> implement AcpiDeviceIfClass and implement arm/virt board specific call ba=
cks)

Right. Since this was based on GPIO I was keeping it simple and didn't atte=
mpt
to take the AcpiDeviceIfClass path. I will address that with GED.

> then you won't need duplicate and carry hw_reduced_acpi in generic code.
>=20
> The rest of the patch looks good.

Thanks,
Shameer

=20
> >      }
> >  }
> >
> > @@ -341,7 +343,8 @@ const VMStateDescription
> vmstate_memory_hotplug =3D
> > {
> >
> >  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
> >                                const char *res_root,
> > -                              const char *event_handler_method)
> > +                              const char *event_handler_method,
> > +                              AmlRegionSpace rs)
> >  {
> >      int i;
> >      Aml *ifctx;
> > @@ -371,7 +374,7 @@ void build_memory_hotplug_aml(Aml *table,
> uint32_t nr_mem,
> >          aml_append(mem_ctrl_dev, aml_name_decl("_CRS", crs));
> >
> >          aml_append(mem_ctrl_dev, aml_operation_region(
> > -            MEMORY_HOTPLUG_IO_REGION, AML_SYSTEM_IO,
> > +            MEMORY_HOTPLUG_IO_REGION, rs,
> >              aml_int(memhp_io_base), MEMORY_HOTPLUG_IO_LEN)
> >          );
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c index
> > 2e21a31..b62c1a3 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1852,7 +1852,8 @@ build_dsdt(GArray *table_data, BIOSLinker
> *linker,
> >          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> >                         "\\_SB.PCI0", "\\_GPE._E02");
> >      }
> > -    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> "\\_GPE._E03");
> > +    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> > +                             "\\_GPE._E03", AML_SYSTEM_IO);
> >
> >      scope =3D  aml_scope("_GPE");
> >      {
> > diff --git a/include/hw/acpi/memory_hotplug.h
> > b/include/hw/acpi/memory_hotplug.h
> > index 77c6576..ec56579 100644
> > --- a/include/hw/acpi/memory_hotplug.h
> > +++ b/include/hw/acpi/memory_hotplug.h
> > @@ -26,10 +26,11 @@ typedef struct MemHotplugState {
> >      uint32_t selector;
> >      uint32_t dev_count;
> >      MemStatus *devs;
> > +    bool hw_reduced_acpi; /*true for hw reduced acpi platform */
> >  } MemHotplugState;
> >
> >  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> > -                              MemHotplugState *state, uint16_t
> io_base);
> > +                              MemHotplugState *state, hwaddr
> > + io_base);
> >
> >  void acpi_memory_plug_cb(HotplugHandler *hotplug_dev,
> MemHotplugState *mem_st,
> >                           DeviceState *dev, Error **errp); @@ -48,5
> > +49,6 @@ void acpi_memory_ospm_status(MemHotplugState *mem_st,
> > ACPIOSTInfoList ***list);
> >
> >  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
> >                                const char *res_root,
> > -                              const char *event_handler_method);
> > +                              const char *event_handler_method,
> > +                              AmlRegionSpace rs);
> >  #endif

