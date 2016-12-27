Received: by 10.25.205.13 with SMTP id d13csp5960903lfg;
        Tue, 27 Dec 2016 08:27:50 -0800 (PST)
X-Received: by 10.55.105.129 with SMTP id e123mr33919357qkc.173.1482856070580;
        Tue, 27 Dec 2016 08:27:50 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u3si18557677qkc.216.2016.12.27.08.27.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Dec 2016 08:27:50 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BE8D8E220;
	Tue, 27 Dec 2016 16:27:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uBRGRi8R027927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 27 Dec 2016 11:27:46 -0500
Date: Tue, 27 Dec 2016 17:27:44 +0100
From: Andrew Jones <drjones@redhat.com>
To: Christopher Covington <cov@codeaurora.org>
Cc: Andre Przywara <andre.przywara@arm.com>, peter.maydell@linaro.org,
        kvm@vger.kernel.org, marc.zyngier@arm.com, qemu-devel@nongnu.org,
        eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
        alex.bennee@linaro.org, kvmarm@lists.cs.columbia.edu,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [PATCH kvm-unit-tests v8 03/10] arm/arm64: add some
 delay routines
Message-ID: <20161227162744.2ih6vmijri3slax5@kamzik.brq.redhat.com>
References: <20161208175030.12269-1-drjones@redhat.com>
 <20161208175030.12269-4-drjones@redhat.com>
 <dfb48863-82a7-3bd2-d2dc-498570325970@arm.com>
 <20161209121541.i3advgnpbu5gvoft@hawk.localdomain>
 <cd3f8a17-f080-5ac8-9398-cddee4d23521@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd3f8a17-f080-5ac8-9398-cddee4d23521@codeaurora.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 27 Dec 2016 16:27:49 +0000 (UTC)
X-TUID: rL330tmZ5D52

On Tue, Dec 27, 2016 at 10:27:25AM -0500, Christopher Covington wrote:
> On 12/09/2016 07:15 AM, Andrew Jones wrote:
> > On Fri, Dec 09, 2016 at 11:41:06AM +0000, Andre Przywara wrote:
> >> Hi,
> >>
> >> On 08/12/16 17:50, Andrew Jones wrote:
> >>> Allow a thread to wait some specified amount of time. Can
> >>> specify in cycles, usecs, and msecs.
> 
> >>> +++ b/lib/arm/asm/delay.h
> >>> @@ -0,0 +1,14 @@
> >>> +#ifndef _ASMARM_DELAY_H_
> >>> +#define _ASMARM_DELAY_H_
> >>> +/*
> >>> + * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
> >>> + *
> >>> + * This work is licensed under the terms of the GNU LGPL, version 2.
> >>> + */
> >>> +#include <libcflat.h>
> >>> +
> >>> +extern void delay(u64 cycles);
> >>
> >> Nit: Shouldn't this parameter be called "ticks"? Cycles might be a bit
> >> misleading, especially since this prototype is the only documentation on
> >> this. You might just want to fix this when applying the patches.
> > 
> > Right or wrong the kernel uses 'cycles' for this function, named
> > __timer_delay for arm and __delay for arm64. I guess I prefer
> > consistency here.
> 
> I too expect timers to tick and CPUs to cycle. The benefit of
> parameter-name-precise consistency with the Linux source is not
> obvious to me.
>

I just didn't have a strong enough opinion on it to change it. It appears
I'm in a minority though. As this is in master already, patches welcome :)

Thanks,
drew
