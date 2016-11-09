Received: by 10.25.150.194 with SMTP id y185csp215727lfd;
        Wed, 9 Nov 2016 04:06:27 -0800 (PST)
X-Received: by 10.55.155.146 with SMTP id d140mr2730886qke.127.1478693186975;
        Wed, 09 Nov 2016 04:06:26 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id k6si6624956qke.225.2016.11.09.04.06.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Nov 2016 04:06:26 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0987B804EB;
	Wed,  9 Nov 2016 12:06:26 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uA9C6LJP010252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 9 Nov 2016 07:06:23 -0500
Date: Wed, 9 Nov 2016 13:06:21 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v4 06/11] arm/arm64: add
 initial gicv2 support
Message-ID: <20161109120621.yqombz6gdemyhm4c@kamzik.brq.redhat.com>
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-7-git-send-email-drjones@redhat.com>
 <4d741c3b-a4b4-39e5-232e-99ba9f19dd65@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d741c3b-a4b4-39e5-232e-99ba9f19dd65@arm.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 09 Nov 2016 12:06:26 +0000 (UTC)
X-TUID: FVOos3LQ5x6h

On Wed, Nov 09, 2016 at 11:53:39AM +0000, Andre Przywara wrote:
[...]
> > diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
> > new file mode 100644
> > index 000000000000..ec92f1064dc0
> > --- /dev/null
> > +++ b/lib/arm/asm/gic.h
> > @@ -0,0 +1,44 @@
> > +/*
> > + * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
> > + *
> > + * This work is licensed under the terms of the GNU LGPL, version 2.
> > + */
> > +#ifndef _ASMARM_GIC_H_
> > +#define _ASMARM_GIC_H_
> > +
> > +#include <asm/gic-v2.h>
> > +
> > +#define GIC_CPU_CTRL			0x00
> > +#define GIC_CPU_PRIMASK			0x04
> > +
> > +#define GICC_ENABLE			0x1
> > +#define GICC_INT_PRI_THRESHOLD		0xf0
> > +
> > +#define GIC_DIST_CTRL			0x000
> > +#define GIC_DIST_CTR			0x004
> 
> I think we shouldn't copy this old name here, which stems from pre-GICv2
> times (PL390?), IIUC. Both GIC specs talk of TYPER here.
> 
> Also if we now use the same defines for both the GICv2 and GICv3
> distributor, we should really stick with the (modern) spec naming, which
> is GICD_CTRL, GICD_TYPER and so on. Same for the CPU interface (GICC_CTRL).
> In the kernel these names are used for GICv3, but we didn't bother to
> adjust the existing GICv2 names to avoid pointless churn.
> Also that would line up with the bit field defines below.
>

Yeah, I noticed the CTR vs. TYPER naming weirdness. I considered
exclusively defining the gicv3/modern/better name, but wasn't sure
I should deviate from the kernel names. Keeping the names consistent
is nice for grepping kernel sources, which needs to be done when a
test fails and we want to find the bug.

I'd personally prefer "pointless" churn in the kernel to get it
straightened out there. If it ever is, then I'd obviously update
this code too. Until then, I think maintaining easy greppability
is the better choice.

Thanks,
drew
