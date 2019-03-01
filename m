Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp607003wrx;
        Fri, 1 Mar 2019 05:10:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQ6pmGcXNSI0rukHQZEghpS74Jp6x168MnNWCYwjZPfdmk5Hnwq8gMJE1JrbpFIpCGL8Cc
X-Received: by 2002:a0d:eb0e:: with SMTP id u14mr3486232ywe.375.1551445823957;
        Fri, 01 Mar 2019 05:10:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551445823; cv=none;
        d=google.com; s=arc-20160816;
        b=tEj/RbgU4gOdhipjdHRlkKEamW4eSPFJDyoQR8FTa5raeteaIgzh4Jr5F4LjumA+8T
         em5O8spx/pjex4Z89xVv/btN2H5HNJHll/iVij7N0kp7mLRjJABbRMdCaP060VFhGVX2
         /ZX1aHyHhH6NMZWsL2UfyQVIlZLJZsxK9kTYNIKEXXd4L7zxDYKrfdrMQQ6v75bwnLB3
         MEE4wOs9mWIOct0IQSGFun2muYjmZ4xSpRQcvsbZ2Wlt/iF56PDmc+VAatd0x1/7Dsqm
         My7ErWfbD+WOINXpxb0w/YYp+MKpwdJI7JPp3+Q7dWdwjogx5jZyj9PMuauSQE2mlAzh
         1pIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=lPS9RlWqUjmBkBJZsantGllAEFI6KGNz8wOx6GRWRc0=;
        b=OGCneuxDIz6nfpz8UZhLtKRGUfatyHvLGkYoJ9zSClCCc1j/Sbny5ctlD/PdSATj+r
         /+uiEZNSX0FGu9g4As5Rin97ymp3ObQcQvjnJL2yhCPgn4q9VLlLe9an8AmPLzVFu9qa
         ZJPL/07kmmYVfbrYg1mUfn4ZdXMersNeVP26twvhvoFGxmbJZFdIGNqd7CVNFwefwnbJ
         OnKOmJnXd9VnlX6DXEEIQ68Njf8hDviig1eWRbWRMrDu4rl7Fh4rmUNaHJU2gpSzPnxL
         Z8WbrN6QhXJMNwObxcDLA8NKQ7gBKtNdMyOes5P61/KBdNOtJi2P2zx3CBrfcoN6FbG9
         teag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i184si6607964ybb.438.2019.03.01.05.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 05:10:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzhvj-00071z-82
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 08:10:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzhvJ-0006zp-Gp
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:09:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzhvI-0004MD-6Y
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:09:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49283)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzhvF-0004K0-6D; Fri, 01 Mar 2019 08:09:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EEFA6301BE6D;
	Fri,  1 Mar 2019 13:09:51 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51531608C3;
	Fri,  1 Mar 2019 13:09:47 +0000 (UTC)
Date: Fri, 1 Mar 2019 14:09:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190301140945.238b5e80@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8392D8366@lhreml524-mbs.china.huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
	<20190301101204.361adfb6@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D81D6@lhreml524-mbs.china.huawei.com>
	<20190301112635.40200742@redhat.com>
	<20190301113352.585d54f3@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D8366@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 01 Mar 2019 13:09:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable pc-dimm
 hotplug support
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l4EGfOg+gOH6

On Fri, 1 Mar 2019 10:51:45 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Qemu-devel
> > [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=huawei.com@nongn
> > u.org] On Behalf Of Igor Mammedov
> > Sent: 01 March 2019 10:34
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> > qemu-devel@nongnu.org; Linuxarm <linuxarm@huawei.com>;
> > eric.auger@redhat.com; qemu-arm@nongnu.org; xuwei (O)
> > <xuwei5@huawei.com>
> > Subject: Re: [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable pc-dimm
> > hotplug support
> > 
> > On Fri, 1 Mar 2019 11:26:35 +0100
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >   
> > > On Fri, 1 Mar 2019 09:23:11 +0000
> > > Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>  
> > wrote:  
> > >  
> > > > > -----Original Message-----
> > > > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > > > Sent: 01 March 2019 09:12
> > > > > To: Shameerali Kolothum Thodi  
> > <shameerali.kolothum.thodi@huawei.com>  
> > > > > Cc: eric.auger@redhat.com; shannon.zhaosl@gmail.com;
> > > > > peter.maydell@linaro.org; qemu-devel@nongnu.org;  
> > qemu-arm@nongnu.org;  
> > > > > Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>
> > > > > Subject: Re: [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable pc-dimm
> > > > > hotplug support
> > > > >
> > > > > On Mon, 28 Jan 2019 11:05:45 +0000
> > > > > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > > > >  
> > > > > > pc-dimm memory hotplug is enabled using GPIO(Pin 2) based ACPI
> > > > > > event. Hot removal functionality is not yet supported.
> > > > > >
> > > > > > Signed-off-by: Shameer Kolothum  
> > <shameerali.kolothum.thodi@huawei.com>  
> > > > > > ---
> > > > > >  hw/arm/virt.c | 57  
> > > > > +++++++++++++++++++++++++++++++++++++++++++++++++++++++--  
> > > > > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > > > > index 884960d..cf64554 100644
> > > > > > --- a/hw/arm/virt.c
> > > > > > +++ b/hw/arm/virt.c
> > > > > > @@ -62,6 +62,7 @@
> > > > > >  #include "hw/mem/pc-dimm.h"
> > > > > >  #include "hw/mem/nvdimm.h"
> > > > > >  #include "hw/acpi/acpi.h"
> > > > > > +#include "hw/acpi/pc-hotplug.h"  
> > > > > it looks like x86 specific file, what is this here for?  
> > > >
> > > > Yes. That is for ACPI_MEMORY_HOTPLUG_BASE which is only used by x86
> > > > at the moment. I guess, it can be moved to hw/acpi/memory_hotplug.h ?  
> > > it's GPA and pc/q35 impl. specific so you should use it,  
> > s/should/should not/
> >   
> > > this address will always be board specific one.
> > > Makeup a virt specific one  
> 
> Ok. I was under the impression that the offsets can be reused as it is defined
> here docs/specs/acpi_mem_hotplug.txt(though that is GPE and pc/q35 acpi dev 
> specific). But agree, it doesn't make sense to make it generic.
Offsets defined by docs/specs/acpi_mem_hotplug.txt are meant to be reused
but IO port address (0xa00) where interface's address space starts is board specific.


> > > >  
> > > > > >
> > > > > >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> > > > > >      static void virt_##major##_##minor##_class_init(ObjectClass *oc,  
> > \  
> > > > > > @@ -1651,7 +1652,14 @@ static void machvirt_init(MachineState  
> > > > > *machine)  
> > > > > >          nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
> > > > > >                                 vms->fw_cfg, OBJECT(vms));
> > > > > >      }
> > > > > > +    if (vms->acpi_memhp_state.is_enabled) {
> > > > > > +        MemHotplugState *state =  &vms->acpi_memhp_state;
> > > > > > +        hwaddr base;
> > > > > >
> > > > > > +        state->hw_reduced_acpi = true;
> > > > > > +        base = vms->memmap[VIRT_ACPI_IO].base +  
> > > > > ACPI_MEMORY_HOTPLUG_BASE;  
> > > well, this is confusing, why adding 2 base addresses?
> > > If vms->memmap[VIRT_ACPI_IO].base is already set than why not use it
> > > as is without adding an offset?  
> 
> Well, Eric's work on which this was based had one NVDIMM_ACPI_IO_BASE offset
> from what appears to be a generic VIRT_ACPI_IO region. Now I see that, it is
> renamed to VIRT_NVDIMM_ACPI_IO. Do we really need two separate regions?
I'm afraid we can't reuse MMIO regions as ther might be used at the same time
and do different things (we would have done this for x86 if it was possible)

As for naming try to find some consensus/coordinate it with Eric


> Thanks,
> Shameer
> 
> > >  
> > > > > > +        acpi_memory_hotplug_init(sysmem, OBJECT(vms), state,  
> > base);  
> > > > > > +    }
> > > > > >      vms->bootinfo.ram_size = machine->ram_size;
> > > > > >      vms->bootinfo.kernel_filename = machine->kernel_filename;
> > > > > >      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;  
> > > > > [...]  
> > >
> > >  
> >   
> 

