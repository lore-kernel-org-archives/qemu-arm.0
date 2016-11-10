Received: by 10.25.150.194 with SMTP id y185csp998857lfd;
        Thu, 10 Nov 2016 12:37:21 -0800 (PST)
X-Received: by 10.37.161.131 with SMTP id a3mr7278484ybi.125.1478810241805;
        Thu, 10 Nov 2016 12:37:21 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h46si4449660qtf.130.2016.11.10.12.37.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 12:37:21 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D27E17F081;
	Thu, 10 Nov 2016 20:37:19 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-43.brq.redhat.com [10.40.204.43])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAAKbEij011310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 10 Nov 2016 15:37:16 -0500
Date: Thu, 10 Nov 2016 21:37:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
        andre.przywara@arm.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
        qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v5 10/11] arm/arm64: gicv3:
 add an IPI test
Message-ID: <20161110203713.4idzgs5u2xm7ms4o@hawk.localdomain>
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-11-git-send-email-drjones@redhat.com>
 <874m3f8621.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874m3f8621.fsf@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 10 Nov 2016 20:37:21 +0000 (UTC)
X-TUID: kvqjJjOYX8Cw

On Thu, Nov 10, 2016 at 07:53:58PM +0000, Alex Bennée wrote:
[...]
> > +struct gic gicv2 = {
> > +	.ipi = {
> > +		.enable = gicv2_enable_defaults,
> > +		.send_self = gicv2_ipi_send_self,
> > +		.send_tlist = gicv2_ipi_send_tlist,
> > +		.send_broadcast = gicv2_ipi_send_broadcast,
> > +	},
> > +	.read_iar = gicv2_read_iar,
> > +	.irqnr = gicv2_irqnr,
> > +	.write_eoi = gicv2_write_eoi,
> > +};
> > +
> > +struct gic gicv3 = {
> > +	.ipi = {
> > +		.enable = gicv3_enable_defaults,
> > +		.send_self = gicv3_ipi_send_self,
> > +		.send_tlist = gicv3_ipi_send_tlist,
> > +		.send_broadcast = gicv3_ipi_send_broadcast,
> > +	},
> > +	.read_iar = gicv3_read_iar,
> > +	.irqnr = gicv3_irqnr,
> > +	.write_eoi = gicv3_write_eoir,
> > +};
> > +
> 
> So I was re-basing my kvm-unit-tests against your GIC rework and found
> myself copy and pasting a bunch of this into my tests that fire IRQs.
> That makes me think the abstraction should be in the library code so
> other tests can fiddle with sending IRQs.
> 
> What do you think?
>

I guess you mean moving the above two structs and their corresponding
functions (all which aren't already common) to lib/arm/ ? Or do you
just mean the one non-trivial function gicv3_ipi_send_tlist? I think
agree with gicv3_ipi_send_tlist getting shared, but the others are
mostly one-liners, so I'm not sure. I guess I'd have to see how you're
using them first.

Thanks,
drew
