Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp465753wrx;
        Fri, 1 Mar 2019 02:34:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqypXWYesexs+WIXLQOosl3i7p8e4c+LNUksJyDbUAG/I27VPMn2/d6CEsJkKR3vqv1IBJby
X-Received: by 2002:a25:401:: with SMTP id 1mr3490381ybe.502.1551436454481;
        Fri, 01 Mar 2019 02:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551436454; cv=none;
        d=google.com; s=arc-20160816;
        b=WKklFQYDzJohgxw/u5wGLsxpKh0s9YgWA5xlHKmWtO9X5Rn4fjG0/hz7+1i4l7Dnzl
         abqywNda2cU9Oh+AL4ncKEuaQSDXH66DjZxLPauZKSOmvtS9ilA8JKJB0nPNaDDrdqkx
         aR6LTByIS08ne2XQuPOlC/x5L0lGOSUsZuMny85MITOJ6vmqGjP+GA6EieWuCfLVLRaj
         IhQk3b6w0t38maoPZA7eaGgXD7KQUHhUGiqz2PcMOM55J+Mtz5NZ0yISZCnLpuikhrdR
         znNU4EFBlGKvT5rcyVSBQj74VMjlKeVz5VTzyNiIUMF+IypFpveU9yrnlmUnb9rRidMS
         qBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=cJJzIoaNuQi3uMSy3o8ifqZm/HOOwPrvWbRSyOYHo9U=;
        b=yMoWFBA5mcFNSWI+B5URzuvcn3CL1rB9hq8+Q7TV4FVcBIFj3gUnal7F8clrduhe2O
         xGtTp4ycHkJfRhi5F5sSi5hmZ5aEMgs8Zq2FMmFrBx/YeZ7MrDD1ylEACbVXr7tUH3uW
         REKRYWiyFXrRtkqvPX7TWOHVJH2R4aHz83n7J14etZiTkl43RCUoQ1G1f9m53oatIVsB
         PNtygcTTvw7Jv5r4eik6nFkBAcNy6AFegZnbQBt/o7nerSl2i5WLaZZUJ0zPeTN2f2r/
         3uvT3ncHJJT5zIBEEQdGbLh8GqixEoivdim8p1JetRh74nO9ylk7AfjF5Sa3KxfsSCaw
         2QnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si11632100ybk.219.2019.03.01.02.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 02:34:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzfUb-0003EW-UE
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 05:34:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzfUO-0003D6-Ev
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:34:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzfUN-0002R7-JE
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:34:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzfUN-0002Qq-9S; Fri, 01 Mar 2019 05:33:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C6D811B76C;
	Fri,  1 Mar 2019 10:33:58 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 293045F9BC;
	Fri,  1 Mar 2019 10:33:53 +0000 (UTC)
Date: Fri, 1 Mar 2019 11:33:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190301113352.585d54f3@redhat.com>
In-Reply-To: <20190301112635.40200742@redhat.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
	<20190301101204.361adfb6@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D81D6@lhreml524-mbs.china.huawei.com>
	<20190301112635.40200742@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 01 Mar 2019 10:33:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable
 pc-dimm hotplug support
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
X-TUID: e13cP99PieNn

On Fri, 1 Mar 2019 11:26:35 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 1 Mar 2019 09:23:11 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
> 
> > > -----Original Message-----
> > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > Sent: 01 March 2019 09:12
> > > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > > Cc: eric.auger@redhat.com; shannon.zhaosl@gmail.com;
> > > peter.maydell@linaro.org; qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > > Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>
> > > Subject: Re: [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable pc-dimm
> > > hotplug support
> > > 
> > > On Mon, 28 Jan 2019 11:05:45 +0000
> > > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > >     
> > > > pc-dimm memory hotplug is enabled using GPIO(Pin 2) based ACPI
> > > > event. Hot removal functionality is not yet supported.
> > > >
> > > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > > ---
> > > >  hw/arm/virt.c | 57    
> > > +++++++++++++++++++++++++++++++++++++++++++++++++++++++--    
> > > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > > index 884960d..cf64554 100644
> > > > --- a/hw/arm/virt.c
> > > > +++ b/hw/arm/virt.c
> > > > @@ -62,6 +62,7 @@
> > > >  #include "hw/mem/pc-dimm.h"
> > > >  #include "hw/mem/nvdimm.h"
> > > >  #include "hw/acpi/acpi.h"
> > > > +#include "hw/acpi/pc-hotplug.h"    
> > > it looks like x86 specific file, what is this here for?    
> > 
> > Yes. That is for ACPI_MEMORY_HOTPLUG_BASE which is only used by x86
> > at the moment. I guess, it can be moved to hw/acpi/memory_hotplug.h ?  
> it's GPA and pc/q35 impl. specific so you should use it,
s/should/should not/

> this address will always be board specific one.
> Makeup a virt specific one
> 
> >   
> > > >
> > > >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> > > >      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> > > > @@ -1651,7 +1652,14 @@ static void machvirt_init(MachineState    
> > > *machine)    
> > > >          nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
> > > >                                 vms->fw_cfg, OBJECT(vms));
> > > >      }
> > > > +    if (vms->acpi_memhp_state.is_enabled) {
> > > > +        MemHotplugState *state =  &vms->acpi_memhp_state;
> > > > +        hwaddr base;
> > > >
> > > > +        state->hw_reduced_acpi = true;
> > > > +        base = vms->memmap[VIRT_ACPI_IO].base +    
> > > ACPI_MEMORY_HOTPLUG_BASE;    
> well, this is confusing, why adding 2 base addresses?
> If vms->memmap[VIRT_ACPI_IO].base is already set than why not use it
> as is without adding an offset?
> 
> 
> > > > +        acpi_memory_hotplug_init(sysmem, OBJECT(vms), state, base);
> > > > +    }
> > > >      vms->bootinfo.ram_size = machine->ram_size;
> > > >      vms->bootinfo.kernel_filename = machine->kernel_filename;
> > > >      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;    
> > > [...]    
> 
> 

