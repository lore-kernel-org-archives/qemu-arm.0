Received: by 10.25.27.66 with SMTP id b63csp405253lfb;
        Thu, 9 Jun 2016 09:20:03 -0700 (PDT)
X-Received: by 10.140.134.134 with SMTP id 128mr11150817qhg.63.1465489203678;
        Thu, 09 Jun 2016 09:20:03 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 11si3772159qko.272.2016.06.09.09.20.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2016 09:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3FF48F4F9;
	Thu,  9 Jun 2016 16:20:02 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u59GJxiS010816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 9 Jun 2016 12:20:01 -0400
Date: Thu, 9 Jun 2016 18:19:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, wei@redhat.com,
        peter.maydell@linaro.org
Subject: Re: [Qemu-devel] [PATCH 5/5] hw/arm/virt: create the 2.7 machine type
Message-ID: <20160609161958.bqtgzrrwborhbccy@hawk.localdomain>
References: <1465410291-2971-6-git-send-email-drjones@redhat.com>
 <8737omgxd8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8737omgxd8.fsf@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 09 Jun 2016 16:20:02 +0000 (UTC)
X-TUID: Mitiw15B88rN

On Thu, Jun 09, 2016 at 05:06:43PM +0100, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> 
> I'm confused. These steps have introduced a bunch of boiler plate to set
> the default virt machine type so we can introduce 2.7 which is an alias
> of the existing 2.6? Wouldn't this be better of waiting until there is a
> concrete difference or have I missed something subtle here?

The concrete difference is the minor number; 7 != 6.

Take a look at how hw/i386/pc and hw/ppc/spapr do this.
I basically just stole from them.

Now, on differences (besides the version); I'm trying to decide
what warrants versioning. There's the obvious migrateable state,
but what about changes to DT/ACPI? We've added NUMA info to the
hardware description for 2.7, but there's no easy way to version
that with the way we currently do it (like this series). Thoughts
on that?

Thanks,
drew

> 
> > ---
> >  hw/arm/virt.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 017c244a46f41..323ffd4689641 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -42,6 +42,7 @@
> >  #include "sysemu/sysemu.h"
> >  #include "sysemu/kvm.h"
> >  #include "hw/boards.h"
> > +#include "hw/compat.h"
> >  #include "hw/loader.h"
> >  #include "exec/address-spaces.h"
> >  #include "qemu/bitops.h"
> > @@ -1423,7 +1424,7 @@ static void machvirt_machine_init(void)
> >  }
> >  type_init(machvirt_machine_init);
> >
> > -static void virt_2_6_instance_init(Object *obj)
> > +static void virt_2_7_instance_init(Object *obj)
> >  {
> >      VirtMachineState *vms = VIRT_MACHINE(obj);
> >
> > @@ -1456,7 +1457,22 @@ static void virt_2_6_instance_init(Object *obj)
> >                                      "Valid values are 2, 3 and host", NULL);
> >  }
> >
> > +static void virt_machine_2_7_options(MachineClass *mc)
> > +{
> > +}
> > +DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
> > +
> > +#define VIRT_COMPAT_2_6 \
> > +    HW_COMPAT_2_6
> > +
> > +static void virt_2_6_instance_init(Object *obj)
> > +{
> > +    virt_2_7_instance_init(obj);
> > +}
> > +
> >  static void virt_machine_2_6_options(MachineClass *mc)
> >  {
> > +    virt_machine_2_7_options(mc);
> > +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
> >  }
> > -DEFINE_VIRT_MACHINE_AS_LATEST(2, 6)
> > +DEFINE_VIRT_MACHINE(2, 6)
> 
> 
> --
> Alex Bennée
