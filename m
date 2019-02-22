Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7076718wrx;
        Fri, 22 Feb 2019 07:28:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbhmK39mHY16ApGmLKtTl1lyZCIrUtAYLdd7aXCNpYF+tp+uXM96cdiHSeWVjKqTTs5597x
X-Received: by 2002:a25:c43:: with SMTP id 64mr3784099ybm.457.1550849293948;
        Fri, 22 Feb 2019 07:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550849293; cv=none;
        d=google.com; s=arc-20160816;
        b=MmmTwVRQrSY7MqQJgfuCQL20bxa+Lajizu/N79FoXuXtaYG6rfXaUGIP6yNEb2oUtG
         3FEBfOAgfKfzXxk5iWkfgTmmjTPHkfSuKdutq2WySGYs2+fVuCPbsVsf4oV9iAbaOwNY
         Z3JrMlv+lvwTmSn6xjgkqdY70FoosaVgmiK8HjOy46Cbk4dxoY/SPrltZjQkZ7DXGie8
         GKEbgZfkzUkM/dHDYS2qjWE9cCdDcIz9NKs0DeBH24KCwOHMJbxSlzWl1JFDYHK4qKiZ
         YWefn/MSYLczt00NYkRhsRC1QeZgNU5EkSh/jwXFZP0ugDkv9OMvfJj7jqItf7fqoWEW
         tePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=zAO+TxZuhmdNrv4hdh1o65ucTGtS/TkPJ+SRxoEZ1zw=;
        b=UvD/xDRH2Zl2QmZi1Vpp6OSrBIDgUxBad+qfNfkAlXej2tC2AaQXu+0C5TDn8vFAFO
         zBDRlk8r6dcthi2oMwDdURjJFJguO0SUtIgU1ttkHh1oEtr8xltU0LEijencAdoHYcCN
         6SYTMS2QcnRcwBAbXRhAWDKLUGR9Qy6xF8KGhGzmzgFbdfFkuanw/VMqZ3GO2s6muU/z
         SvZvc2+stypmXjlbVpfWtKwB4YQiEGd/aeAUmE4tFaDM10O5VwqKA/LNIRPuaD9v9RTw
         aAK75G9gCgMSC81/PcNzUKwT/vuyJMp4D1as57VlIgAAub8kdBflz2ArQV/88ksMEEA2
         c1Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si974333ywg.432.2019.02.22.07.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 07:28:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxCkH-0007lf-Bf
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 10:28:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxCI0-0001XC-E0
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 09:59:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxCHy-0003qK-QQ
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 09:59:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56180)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxCHp-0003J3-J9; Fri, 22 Feb 2019 09:58:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C89B3307D980;
	Fri, 22 Feb 2019 14:58:39 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F56C60181;
	Fri, 22 Feb 2019 14:58:32 +0000 (UTC)
Date: Fri, 22 Feb 2019 15:58:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190222155831.7b534b5d@redhat.com>
In-Reply-To: <7e584e86-1099-a014-c23c-bd2feb4e50ba@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-14-eric.auger@redhat.com>
	<20190222144846.0a891948@redhat.com>
	<7e584e86-1099-a014-c23c-bd2feb4e50ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 22 Feb 2019 14:58:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 13/17] hw/arm/virt: Allocate
 device_memory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZYaow+FXkRIT

On Fri, 22 Feb 2019 15:15:36 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 2/22/19 2:48 PM, Igor Mammedov wrote:
> > On Wed, 20 Feb 2019 23:39:59 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> The device memory region is located after the initial RAM.
> >> its start/size are 1GB aligned.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> >>
> >> ---
> >> v6 -> v7:
> >> - check the device memory top does not wrap
> >> - check the device memory can fit the slots
> >>
> >> v4 -> v5:
> >> - device memory set after the initial RAM
> >>
> >> v3 -> v4:
> >> - remove bootinfo.device_memory_start/device_memory_size
> >> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
> >> ---
> >>  hw/arm/virt.c | 33 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 33 insertions(+)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 470ca0ce2d..33ad9b3f63 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -62,6 +62,7 @@
> >>  #include "target/arm/internals.h"
> >>  #include "hw/mem/pc-dimm.h"
> >>  #include "hw/mem/nvdimm.h"
> >> +#include "hw/acpi/acpi.h"
> >>  
> >>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> >>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> >> @@ -1263,6 +1264,34 @@ static void create_secure_ram(VirtMachineState *vms,
> >>      g_free(nodename);
> >>  }
> >>  
> >> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
> >> +{
> >> +    MachineState *ms = MACHINE(vms);
> >> +
> >> +    if (!vms->device_memory_size) {  
> > having vms->device_memory_size seems like duplicate, why not to reuse
> > memory_region_size(MachineState::device_memory::mr) like we do elsewhere.  
> OK so you mean allocating the ms->device_memory in virt_setmmap? In that
> case, I wonder if all that code shouldn't land in set_memmap directly?
> > 
> > Also it would be better to all device_memory allocation/initialization
> > compact and close to each other like it's done in pc/spapr.  
> I am not sure I get your point here. alloc & init are done in this
> function. Or do you mean I should rather move that into set_memmap?
I don't have a preference where to put it, could be here or in set_memmap,
what I do care is to keep all device_memory related parts together
(like calculating device_memory base and size and allocating/initializing
structure itself, it's much easier to read when one doesn't have to jump
around code and could see all related code in one place)

> 
> Thanks
> 
> Eric
> >   
> >> +        return;
> >> +    }
> >> +
> >> +    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
> >> +        error_report("unsupported number of memory slots: %"PRIu64,
> >> +                     ms->ram_slots);
> >> +        exit(EXIT_FAILURE);
> >> +    }
> >> +
> >> +    if (QEMU_ALIGN_UP(ms->maxram_size, GiB) != ms->maxram_size) {
> >> +        error_report("maximum memory size must be GiB aligned");
> >> +        exit(EXIT_FAILURE);
> >> +    }
> >> +
> >> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
> >> +    ms->device_memory->base = vms->device_memory_base;
> >> +
> >> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
> >> +                       "device-memory", vms->device_memory_size);
> >> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
> >> +                                &ms->device_memory->mr);
> >> +}
> >> +
> >>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
> >>  {
> >>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
> >> @@ -1610,6 +1639,10 @@ static void machvirt_init(MachineState *machine)
> >>                                           machine->ram_size);
> >>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
> >>  
> >> +    if (vms->extended_memmap) {
> >> +        create_device_memory(vms, sysmem);
> >> +    }
> >> +
> >>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
> >>  
> >>      create_gic(vms, pic);  
> >   
> 

