Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp460001wrx;
        Fri, 1 Mar 2019 02:26:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfdULxBs+LRZjqpWq6Z6M9y/gMuimPgqaDI51RNIPBWlpCyAI+Qrl4gLM4px7KC5MVIgVI
X-Received: by 2002:a81:52d3:: with SMTP id g202mr2858629ywb.244.1551436016036;
        Fri, 01 Mar 2019 02:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551436016; cv=none;
        d=google.com; s=arc-20160816;
        b=tKLh34nXwj/NoIb6R/jYNXd7Sn7jAWDvj22XkulpkuWP4e/p+bleQ6I6mxw2nyjWoJ
         JGptgs+qJEa2RraL3IPqgMY0Zl7YChSyrJLU2zCYKmENfIq6EurkMSk8YevnARviXRX2
         VO9M9/Kkj3RExtV/NDzFcTfnFYbUH0zlmNqjsPGK30kVLsk0kHvdQTYuar2igL9VErAn
         Ms0FBOn9BPHmleRd9xh5ryobrclQ2GFv4aqJo8BS+nzp1T1nYiFcAmd0LVL5wtqZIi3h
         mzZBkEEtovAy2FnaxHY111Esa0HNtTAEoeVPlCqdqyDqjA0A9+WHfIu8DhkArJE241WS
         YNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=QoIPJuWBB2g+ia7m4ZtuY0sEkUFQZ1644Dp19ZS8gdM=;
        b=gIi8piUa+uGMzbOHE7nvg/m2VLMmyCZFNnzBovU02dox+Xr6l5388GVvzT/sX47mmX
         rC7LbOTR37o1Q+n7aps4rJt5/jku4XNy8z39VcQqiNytdv16XFbq+T1o+M7fzzs2xZzY
         ZlDXhnCv89S7k/ecV2IuY8DKEzA/67G3ck00ncN5Gkgnyef/bDF3uZiSysEE0cJIMuLY
         uD60Ci2ZQlVowIefreug5bZ4IdvZh1WwDerkGbVCs9+MM9r4prBr3GzZcC2EmeaRwWry
         SXs9fbd8CB1/4CpBOnSPP/E/Ig3XAJfm//jRrqxFasRwfLIdXkQqE2TW7DvtiFxhlq3n
         SvZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v38si12191565ywh.347.2019.03.01.02.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 02:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzfNX-0007Df-Eo
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 05:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzfNK-0007Bd-Fc
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:26:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzfNJ-00062f-NL
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:26:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46692)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzfNJ-000623-Ck; Fri, 01 Mar 2019 05:26:41 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96CF23078DA2;
	Fri,  1 Mar 2019 10:26:40 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7682219C58;
	Fri,  1 Mar 2019 10:26:36 +0000 (UTC)
Date: Fri, 1 Mar 2019 11:26:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190301112635.40200742@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8392D81D6@lhreml524-mbs.china.huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
	<20190301101204.361adfb6@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D81D6@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 01 Mar 2019 10:26:40 +0000 (UTC)
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
	Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y0ZyhAlnMT+r

On Fri, 1 Mar 2019 09:23:11 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 01 March 2019 09:12
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: eric.auger@redhat.com; shannon.zhaosl@gmail.com;
> > peter.maydell@linaro.org; qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>
> > Subject: Re: [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable pc-dimm
> > hotplug support
> > 
> > On Mon, 28 Jan 2019 11:05:45 +0000
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> > > pc-dimm memory hotplug is enabled using GPIO(Pin 2) based ACPI
> > > event. Hot removal functionality is not yet supported.
> > >
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >  hw/arm/virt.c | 57  
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++--  
> > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 884960d..cf64554 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -62,6 +62,7 @@
> > >  #include "hw/mem/pc-dimm.h"
> > >  #include "hw/mem/nvdimm.h"
> > >  #include "hw/acpi/acpi.h"
> > > +#include "hw/acpi/pc-hotplug.h"  
> > it looks like x86 specific file, what is this here for?  
> 
> Yes. That is for ACPI_MEMORY_HOTPLUG_BASE which is only used by x86
> at the moment. I guess, it can be moved to hw/acpi/memory_hotplug.h ?
it's GPA and pc/q35 impl. specific so you should use it,
this address will always be board specific one.
Makeup a virt specific one

> 
> > >
> > >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> > >      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> > > @@ -1651,7 +1652,14 @@ static void machvirt_init(MachineState  
> > *machine)  
> > >          nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
> > >                                 vms->fw_cfg, OBJECT(vms));
> > >      }
> > > +    if (vms->acpi_memhp_state.is_enabled) {
> > > +        MemHotplugState *state =  &vms->acpi_memhp_state;
> > > +        hwaddr base;
> > >
> > > +        state->hw_reduced_acpi = true;
> > > +        base = vms->memmap[VIRT_ACPI_IO].base +  
> > ACPI_MEMORY_HOTPLUG_BASE;  
well, this is confusing, why adding 2 base addresses?
If vms->memmap[VIRT_ACPI_IO].base is already set than why not use it
as is without adding an offset?


> > > +        acpi_memory_hotplug_init(sysmem, OBJECT(vms), state, base);
> > > +    }
> > >      vms->bootinfo.ram_size = machine->ram_size;
> > >      vms->bootinfo.kernel_filename = machine->kernel_filename;
> > >      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;  
> > [...]  

