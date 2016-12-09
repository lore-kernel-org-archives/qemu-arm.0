Received: by 10.25.159.131 with SMTP id i125csp257901lfe;
        Fri, 9 Dec 2016 04:15:48 -0800 (PST)
X-Received: by 10.55.71.150 with SMTP id u144mr65883906qka.300.1481285748149;
        Fri, 09 Dec 2016 04:15:48 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e92si19878831qtb.93.2016.12.09.04.15.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Dec 2016 04:15:48 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F8CD31B320;
	Fri,  9 Dec 2016 12:15:47 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-72.brq.redhat.com [10.40.204.72])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB9CFg5Q029813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 9 Dec 2016 07:15:44 -0500
Date: Fri, 9 Dec 2016 13:15:41 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [PATCH kvm-unit-tests v8 03/10] arm/arm64: add some
 delay routines
Message-ID: <20161209121541.i3advgnpbu5gvoft@hawk.localdomain>
References: <20161208175030.12269-1-drjones@redhat.com>
 <20161208175030.12269-4-drjones@redhat.com>
 <dfb48863-82a7-3bd2-d2dc-498570325970@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfb48863-82a7-3bd2-d2dc-498570325970@arm.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 09 Dec 2016 12:15:47 +0000 (UTC)
X-TUID: x4i69frNkn7f

On Fri, Dec 09, 2016 at 11:41:06AM +0000, Andre Przywara wrote:
> Hi,
> 
> On 08/12/16 17:50, Andrew Jones wrote:
> > Allow a thread to wait some specified amount of time. Can
> > specify in cycles, usecs, and msecs.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > 
> > ---
> > v8: rewrote basing on new sysreg framework. Also decided delay
> >     functions warrant their own files (delay.[ch])
> > ---
> >  arm/Makefile.common       |  1 +
> >  lib/arm/asm/delay.h       | 14 ++++++++++++++
> >  lib/arm/asm/processor.h   | 15 +++++++++++++++
> >  lib/arm64/asm/delay.h     |  1 +
> >  lib/arm64/asm/processor.h | 12 ++++++++++++
> >  lib/arm/delay.c           | 29 +++++++++++++++++++++++++++++
> >  6 files changed, 72 insertions(+)
> >  create mode 100644 lib/arm/asm/delay.h
> >  create mode 100644 lib/arm64/asm/delay.h
> >  create mode 100644 lib/arm/delay.c
> > 
> > diff --git a/arm/Makefile.common b/arm/Makefile.common
> > index b2c0fc8a2fdc..89fe3f69eb44 100644
> > --- a/arm/Makefile.common
> > +++ b/arm/Makefile.common
> > @@ -48,6 +48,7 @@ cflatobjs += lib/arm/mmu.o
> >  cflatobjs += lib/arm/bitops.o
> >  cflatobjs += lib/arm/psci.o
> >  cflatobjs += lib/arm/smp.o
> > +cflatobjs += lib/arm/delay.o
> >  
> >  libeabi = lib/arm/libeabi.a
> >  eabiobjs = lib/arm/eabi_compat.o
> > diff --git a/lib/arm/asm/delay.h b/lib/arm/asm/delay.h
> > new file mode 100644
> > index 000000000000..2436b28c77ae
> > --- /dev/null
> > +++ b/lib/arm/asm/delay.h
> > @@ -0,0 +1,14 @@
> > +#ifndef _ASMARM_DELAY_H_
> > +#define _ASMARM_DELAY_H_
> > +/*
> > + * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
> > + *
> > + * This work is licensed under the terms of the GNU LGPL, version 2.
> > + */
> > +#include <libcflat.h>
> > +
> > +extern void delay(u64 cycles);
> 
> Nit: Shouldn't this parameter be called "ticks"? Cycles might be a bit
> misleading, especially since this prototype is the only documentation on
> this. You might just want to fix this when applying the patches.

Right or wrong the kernel uses 'cycles' for this function, named
__timer_delay for arm and __delay for arm64. I guess I prefer
consistency here.

> 
> That notwithstanding:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!

drew
