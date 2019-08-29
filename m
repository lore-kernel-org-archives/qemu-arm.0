Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1843086wrs;
        Thu, 29 Aug 2019 01:45:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyoPRamoSLzyE22jT2LTs7EmhUSZwN7z5TjLn2JxrlQvt2Q16zNSh7tw2xEl709QbHPAIm
X-Received: by 2002:a37:395:: with SMTP id 143mr8380139qkd.317.1567068341088;
        Thu, 29 Aug 2019 01:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567068341; cv=none;
        d=google.com; s=arc-20160816;
        b=hxBzL0xgMIKjBN/hbKZ3uH7nmfnsUE5GKyuPKzYkrz8DMWTBP6ZybVMG7LbiF8tDFx
         UOOJ+lApJ69lmpweFtW+yWXCH16pXBvN7sg0JILILLPrgLCbrGfoJUOs+W8/sXWU3B1i
         Vk2m7EcaTGss41nSRgrd4DvDvzVP+H4Rt5XqNLuMF3xYHS/vhAHHh+aKkYDQjMjIf2LL
         NkcXmDZHj0GHHnWuw7RUyo92WJtHscK8iZ5F9zoDMVDatPob3sgx162WPj9cBgiU2eFY
         zjh7Hf8Chd6wBksotTv9J8Y51qOoH5yA8wZKEO3GG4BQNedkdfe/Pokqb3UeU9kwVTBn
         XWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=DrxgzUc/yzkmTG4bMx9FKq12lJRuZpEzxaf+McDTKkc=;
        b=eMCyX3/Wgktbzor+BWrJQXknoM5ZhoP+5ZodztH32TIhfmbFuKcEWC6SfR2VHkw1Vu
         bvCJy3UOtN/1WOKj+Q1ct+ogWKieiGT8ajPJ2rOPhv+nSWRmHHpcGOTCzic/Tvxxxbvs
         13iWyg9rW2EBUIBZ9VqBjlKj3nioG7cmahjUUKDU1TAVvkn1KRBZpXv4Z7ypG0Yb6Qfu
         wGhePUyekhLSG2VDkzAqmzSK97GY2AtxApn51GbiHVveJI1RuO3BoLNkJca3MKJTjVTx
         dwrkoQL6v2B80v9YkdFbDvp+wcuHE+Prhx6/SKP7ayKJL+8EFcKdHihVcFsuJhQKxv9k
         Cw/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y30si1288320qve.167.2019.08.29.01.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 01:45:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3G3o-0004zK-2i
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 04:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i3G3d-0004zE-M5
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 04:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i3G3a-0007Dg-Em
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 04:45:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43406)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i3G3a-0007CW-4t; Thu, 29 Aug 2019 04:45:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F6D181DF2;
 Thu, 29 Aug 2019 08:45:25 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95C3560872;
 Thu, 29 Aug 2019 08:45:20 +0000 (UTC)
Date: Thu, 29 Aug 2019 10:45:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190829104518.0995e7c5@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83F36E598@lhreml524-mbs.china.huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
 <20190813210539.31164-2-shameerali.kolothum.thodi@huawei.com>
 <5FC3163CFD30C246ABAA99954A238FA83F36E598@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 29 Aug 2019 08:45:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO
 address space configurable
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
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m7odQKhm00ms

On Thu, 15 Aug 2019 08:42:48 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Linuxarm [mailto:linuxarm-bounces@huawei.com] On Behalf Of Shameer
> > Kolothum
> > Sent: 13 August 2019 22:05
> > To: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; imammedo@redhat.com
> > Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
> > ard.biesheuvel@linaro.org; Linuxarm <linuxarm@huawei.com>;
> > shannon.zhaosl@gmail.com; sebastien.boeuf@intel.com; lersek@redhat.com
> > Subject: [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO address space
> > configurable
> > 
> > This is in preparation for adding support for ARM64 platforms
> > where it doesn't use port mapped IO for ACPI IO space. We are
> > making changes so that MMIO region can be accommodated
> > and board can pass the base address into the aml build function.  
> 
> Looks like, this now breaks the "make check" on x86_64 and needs
> updating bios-tables-test-allowed-diff.h with DSDT entries. But I am 
> not sure what changed now compared to v8(and older ones) that makes
> it to complain now!. 

you could see diff of what's changed but running test manually with
V=1 env var if you have 'iasl' installed

V=1 QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 tests/bios-tables-test


> Patchew URL: https://patchew.org/QEMU/20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com/
> 
> ERROR:/tmp/qemu-test/src/tests/bios-tables-test.c:447:test_acpi_asl: assertion failed: (all_tables_match)
> 
> Thanks,
> Shameer
> 
> > Also move few MEMORY_* definitions to header so that other memory
> > hotplug event signalling mechanisms (eg. Generic Event Device on
> > HW-reduced acpi platforms) can use the same from their respective
> > event handler code.
> > 
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> > v8 --> v9
> >   -base address is an input into build_memory_hotplug_aml()
> >   -Removed R-by tags from Igor and Eric for now.
> > ---
> >  hw/acpi/memory_hotplug.c         | 29 ++++++++++++++---------------
> >  hw/i386/acpi-build.c             |  4 +++-
> >  hw/i386/pc.c                     |  3 +++
> >  include/hw/acpi/memory_hotplug.h |  9 +++++++--
> >  include/hw/i386/pc.h             |  3 +++
> >  5 files changed, 30 insertions(+), 18 deletions(-)
> > 
> > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> > index 297812d5f7..1734d4b44f 100644
> > --- a/hw/acpi/memory_hotplug.c
> > +++ b/hw/acpi/memory_hotplug.c
> > @@ -29,12 +29,7 @@
> >  #define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
> >  #define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
> >  #define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
> > -#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
> >  #define MEMORY_HOTPLUG_DEVICE        "MHPD"
> > -#define MEMORY_HOTPLUG_IO_LEN         24
> > -#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
> > -
> > -static uint16_t memhp_io_base;
> > 
> >  static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
> >  {
> > @@ -209,7 +204,7 @@ static const MemoryRegionOps
> > acpi_memory_hotplug_ops = {
> >  };
> > 
> >  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> > -                              MemHotplugState *state, uint16_t
> > io_base)
> > +                              MemHotplugState *state, hwaddr
> > io_base)
> >  {
> >      MachineState *machine = MACHINE(qdev_get_machine());
> > 
> > @@ -218,12 +213,10 @@ void acpi_memory_hotplug_init(MemoryRegion *as,
> > Object *owner,
> >          return;
> >      }
> > 
> > -    assert(!memhp_io_base);
> > -    memhp_io_base = io_base;
> >      state->devs = g_malloc0(sizeof(*state->devs) * state->dev_count);
> >      memory_region_init_io(&state->io, owner, &acpi_memory_hotplug_ops,
> > state,
> >                            "acpi-mem-hotplug",
> > MEMORY_HOTPLUG_IO_LEN);
> > -    memory_region_add_subregion(as, memhp_io_base, &state->io);
> > +    memory_region_add_subregion(as, io_base, &state->io);
> >  }
> > 
> >  /**
> > @@ -342,7 +335,8 @@ const VMStateDescription vmstate_memory_hotplug
> > = {
> > 
> >  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
> >                                const char *res_root,
> > -                              const char *event_handler_method)
> > +                              const char *event_handler_method,
> > +                              AmlRegionSpace rs, hwaddr
> > memhp_io_base)
> >  {
> >      int i;
> >      Aml *ifctx;
> > @@ -365,14 +359,19 @@ void build_memory_hotplug_aml(Aml *table,
> > uint32_t nr_mem,
> >              aml_name_decl("_UID", aml_string("Memory hotplug
> > resources")));
> > 
> >          crs = aml_resource_template();
> > -        aml_append(crs,
> > -            aml_io(AML_DECODE16, memhp_io_base, memhp_io_base, 0,
> > -                   MEMORY_HOTPLUG_IO_LEN)
> > -        );
> > +        if (rs == AML_SYSTEM_IO) {
> > +            aml_append(crs,
> > +                aml_io(AML_DECODE16, memhp_io_base,
> > memhp_io_base, 0,
> > +                       MEMORY_HOTPLUG_IO_LEN)
> > +            );
> > +        } else {
> > +            aml_append(crs, aml_memory32_fixed(memhp_io_base,
> > +                            MEMORY_HOTPLUG_IO_LEN,
> > AML_READ_WRITE));
> > +        }
> >          aml_append(mem_ctrl_dev, aml_name_decl("_CRS", crs));
> > 
> >          aml_append(mem_ctrl_dev, aml_operation_region(
> > -            MEMORY_HOTPLUG_IO_REGION, AML_SYSTEM_IO,
> > +            MEMORY_HOTPLUG_IO_REGION, rs,
> >              aml_int(memhp_io_base), MEMORY_HOTPLUG_IO_LEN)
> >          );
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index f3fdfefcd5..e76d6631ea 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1871,7 +1871,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> >                         "\\_SB.PCI0", "\\_GPE._E02");
> >      }
> > -    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> > "\\_GPE._E03");
> > +    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> > +                             "\\_GPE._E03", AML_SYSTEM_IO,
> > +                             pcms->memhp_io_base);
> > 
> >      scope =  aml_scope("_GPE");
> >      {
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 549c437050..be973cea99 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -1936,6 +1936,9 @@ void pc_memory_init(PCMachineState *pcms,
> > 
> >      /* Init default IOAPIC address space */
> >      pcms->ioapic_as = &address_space_memory;
> > +
> > +    /* Init ACPI memory hotplug IO base address */
> > +    pcms->memhp_io_base = ACPI_MEMORY_HOTPLUG_BASE;
> >  }
> > 
> >  /*
> > diff --git a/include/hw/acpi/memory_hotplug.h
> > b/include/hw/acpi/memory_hotplug.h
> > index 77c65765d6..dfe9cf3fde 100644
> > --- a/include/hw/acpi/memory_hotplug.h
> > +++ b/include/hw/acpi/memory_hotplug.h
> > @@ -5,6 +5,10 @@
> >  #include "hw/acpi/acpi.h"
> >  #include "hw/acpi/aml-build.h"
> > 
> > +#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
> > +#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
> > +#define MEMORY_HOTPLUG_IO_LEN         24
> > +
> >  /**
> >   * MemStatus:
> >   * @is_removing: the memory device in slot has been requested to be
> > ejected.
> > @@ -29,7 +33,7 @@ typedef struct MemHotplugState {
> >  } MemHotplugState;
> > 
> >  void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> > -                              MemHotplugState *state, uint16_t
> > io_base);
> > +                              MemHotplugState *state, hwaddr
> > io_base);
> > 
> >  void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState
> > *mem_st,
> >                           DeviceState *dev, Error **errp);
> > @@ -48,5 +52,6 @@ void acpi_memory_ospm_status(MemHotplugState
> > *mem_st, ACPIOSTInfoList ***list);
> > 
> >  void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
> >                                const char *res_root,
> > -                              const char *event_handler_method);
> > +                              const char *event_handler_method,
> > +                              AmlRegionSpace rs, hwaddr
> > memhp_io_base);
> >  #endif
> > diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > index 859b64c51d..49b47535cf 100644
> > --- a/include/hw/i386/pc.h
> > +++ b/include/hw/i386/pc.h
> > @@ -69,6 +69,9 @@ struct PCMachineState {
> >      /* Address space used by IOAPIC device. All IOAPIC interrupts
> >       * will be translated to MSI messages in the address space. */
> >      AddressSpace *ioapic_as;
> > +
> > +    /* ACPI Memory hotplug IO base address */
> > +    hwaddr memhp_io_base;
> >  };
> > 
> >  #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
> > --
> > 2.17.1
> > 
> > 
> > _______________________________________________
> > Linuxarm mailing list
> > Linuxarm@huawei.com
> > http://hulk.huawei.com/mailman/listinfo/linuxarm  

