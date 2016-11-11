Received: by 10.25.150.194 with SMTP id y185csp1348305lfd;
        Fri, 11 Nov 2016 05:54:28 -0800 (PST)
X-Received: by 10.55.18.30 with SMTP id c30mr3665266qkh.213.1478872467897;
        Fri, 11 Nov 2016 05:54:27 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y126si6824072qke.66.2016.11.11.05.54.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Nov 2016 05:54:27 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C84F819CF46;
	Fri, 11 Nov 2016 13:54:26 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-166.brq.redhat.com [10.40.204.166])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uABDsLNm024997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 11 Nov 2016 08:54:23 -0500
Date: Fri, 11 Nov 2016 14:54:21 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
        andre.przywara@arm.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
        qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v5 10/11] arm/arm64: gicv3:
 add an IPI test
Message-ID: <20161111135421.5oxdkfqynkgipgom@hawk.localdomain>
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-11-git-send-email-drjones@redhat.com>
 <874m3f8621.fsf@linaro.org>
 <20161110203713.4idzgs5u2xm7ms4o@hawk.localdomain>
 <871syi8hbg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871syi8hbg.fsf@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 11 Nov 2016 13:54:27 +0000 (UTC)
X-TUID: iG1vfewrrJCA

On Fri, Nov 11, 2016 at 10:02:59AM +0000, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > On Thu, Nov 10, 2016 at 07:53:58PM +0000, Alex Bennée wrote:
> > [...]
> >> > +struct gic gicv2 = {
> >> > +	.ipi = {
> >> > +		.enable = gicv2_enable_defaults,
> >> > +		.send_self = gicv2_ipi_send_self,
> >> > +		.send_tlist = gicv2_ipi_send_tlist,
> >> > +		.send_broadcast = gicv2_ipi_send_broadcast,
> >> > +	},
> >> > +	.read_iar = gicv2_read_iar,
> >> > +	.irqnr = gicv2_irqnr,
> >> > +	.write_eoi = gicv2_write_eoi,
> >> > +};
> >> > +
> >> > +struct gic gicv3 = {
> >> > +	.ipi = {
> >> > +		.enable = gicv3_enable_defaults,
> >> > +		.send_self = gicv3_ipi_send_self,
> >> > +		.send_tlist = gicv3_ipi_send_tlist,
> >> > +		.send_broadcast = gicv3_ipi_send_broadcast,
> >> > +	},
> >> > +	.read_iar = gicv3_read_iar,
> >> > +	.irqnr = gicv3_irqnr,
> >> > +	.write_eoi = gicv3_write_eoir,
> >> > +};
> >> > +
> >>
> >> So I was re-basing my kvm-unit-tests against your GIC rework and found
> >> myself copy and pasting a bunch of this into my tests that fire IRQs.
> >> That makes me think the abstraction should be in the library code so
> >> other tests can fiddle with sending IRQs.
> >>
> >> What do you think?
> >>
> >
> > I guess you mean moving the above two structs and their corresponding
> > functions (all which aren't already common) to lib/arm/ ? Or do you
> > just mean the one non-trivial function gicv3_ipi_send_tlist? I think
> > agree with gicv3_ipi_send_tlist getting shared, but the others are
> > mostly one-liners, so I'm not sure. I guess I'd have to see how you're
> > using them first.
> 
> So it looked like there were some functions in the common code for one
> GIC which had local test defined functions for the other. They should at
> least be consistent.

gicv3_read_iar and gicv3_write_eoir being common already is a product of
being sysreg wrappers, allowing for both arm32 and arm64 to use functions
of the same names, not because I wanted gicv3 to be inconsistent with
gicv2 (which uses MMIO and thus doesn't need wrappers)

> 
> For my use case I could do with a common:
> 
>   gic_enable

OK, I can extend gic_init() to initialize a 'struct gic_common_ops' that
includes an enable -> *_enable_defaults(void), ipi_send(int cpu),
read_iar(void), iar_irqnr(u32 iar), and write_eoi(u32 irqstat). And also
provide the wrappers gic_enable, gic_ipi_send(cpu), ...

>   gic_send_spi(cpu, irq)

I'll let you add this one to the new common ops struct :-)

>   gic_irq_ack() which returns the iar.

This one will be called read_iar.

Would that work for you, Alex?

Andre,

Would this also satisfy your needs for more common code?

Thanks,
drew

> 
> See:
> 
>   https://github.com/stsquad/kvm-unit-tests/blob/mttcg/current-tests-v6/arm/tcg-test.c#L113
> 
> >
> > Thanks,
> > drew
> 
> 
> --
> Alex Bennée
> --
> To unsubscribe from this list: send the line "unsubscribe kvm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
