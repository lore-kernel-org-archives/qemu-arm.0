Received: by 10.25.159.131 with SMTP id i125csp400864lfe;
        Fri, 9 Dec 2016 09:28:34 -0800 (PST)
X-Received: by 10.200.39.230 with SMTP id x35mr70124837qtx.259.1481304514882;
        Fri, 09 Dec 2016 09:28:34 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e92si20567209qtb.93.2016.12.09.09.28.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Dec 2016 09:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC8C2C04B31F;
	Fri,  9 Dec 2016 17:28:33 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-72.brq.redhat.com [10.40.204.72])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB9HSSr6019878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 9 Dec 2016 12:28:30 -0500
Date: Fri, 9 Dec 2016 18:28:27 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: Re: [PATCH kvm-unit-tests v8 09/10] arm/arm64: gicv3: add an IPI test
Message-ID: <20161209172827.xmzcxxc7xxvlheia@hawk.localdomain>
References: <20161208175030.12269-1-drjones@redhat.com>
 <20161208175030.12269-10-drjones@redhat.com>
 <2fc872dd-ee19-f2fb-7444-cf701871fbeb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fc872dd-ee19-f2fb-7444-cf701871fbeb@arm.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 09 Dec 2016 17:28:34 +0000 (UTC)
X-TUID: K3rIM3QiN16U

On Fri, Dec 09, 2016 at 04:08:00PM +0000, Andre Przywara wrote:
> On 08/12/16 17:50, Andrew Jones wrote:
> > +u32 gicv3_iar_irqnr(u32 iar)
> > +{
> > +	return iar;
> 
> I am probably a bit paranoid here, but the spec says that the interrupt
> ID is in bits[23:0] only (at most).

Indeed, I'll add '& ((1 << 24) - 1' here.

> 
> > +}
> > +
> > +void gicv3_ipi_send_mask(int irq, const cpumask_t *dest)
> > +{
> > +	u16 tlist;
> > +	int cpu;
> > +
> > +	assert(irq < 16);
> > +
> > +	/*
> > +	 * For each cpu in the mask collect its peers, which are also in
> > +	 * the mask, in order to form target lists.
> > +	 */
> > +	for_each_cpu(cpu, dest) {
> > +		u64 mpidr = cpus[cpu], sgi1r;
> > +		u64 cluster_id;
> > +
> > +		/*
> > +		 * GICv3 can send IPIs to up 16 peer cpus with a single
> > +		 * write to ICC_SGI1R_EL1 (using the target list). Peers
> > +		 * are cpus that have nearly identical MPIDRs, the only
> > +		 * difference being Aff0. The matching upper affinity
> > +		 * levels form the cluster ID.
> > +		 */
> > +		cluster_id = mpidr & ~0xffUL;
> > +		tlist = 0;
> > +
> > +		/*
> > +		 * Sort of open code for_each_cpu in order to have a
> > +		 * nested for_each_cpu loop.
> > +		 */
> > +		while (cpu < nr_cpus) {
> > +			if ((mpidr & 0xff) >= 16) {
> > +				printf("cpu%d MPIDR:aff0 is %d (>= 16)!\n",
> > +					cpu, (int)(mpidr & 0xff));
> > +				break;
> > +			}
> > +
> > +			tlist |= 1 << (mpidr & 0xf);
> > +
> > +			cpu = cpumask_next(cpu, dest);
> > +			if (cpu >= nr_cpus)
> > +				break;
> > +
> > +			mpidr = cpus[cpu];
> > +
> > +			if (cluster_id != (mpidr & ~0xffUL)) {
> > +				/*
> > +				 * The next cpu isn't in our cluster. Roll
> > +				 * back the cpu index allowing the outer
> > +				 * for_each_cpu to find it again with
> > +				 * cpumask_next
> > +				 */
> > +				--cpu;
> > +				break;
> > +			}
> > +		}
> > +
> > +		/* Send the IPIs for the target list of this cluster */
> > +		sgi1r = (MPIDR_TO_SGI_AFFINITY(cluster_id, 3)	|
> > +			 MPIDR_TO_SGI_AFFINITY(cluster_id, 2)	|
> > +			 irq << 24				|
> > +			 MPIDR_TO_SGI_AFFINITY(cluster_id, 1)	|
> > +			 tlist);
> > +
> > +		gicv3_write_sgi1r(sgi1r);
> > +	}
> > +
> > +	/* Force the above writes to ICC_SGI1R_EL1 to be executed */
> > +	isb();
> > +}
> 
> Wow, this is really heavy stuff, especially for a Friday afternoon ;-)
> But I convinced myself that it's correct. The only issue is that it's
> sub-optimal if the MPIDRs of the VCPUs are not in order, say: 0x000,
> 0x100, 0x001.
> In this case we do three register writes instead of the minimal two.
> But it's still correct, so it's actually a minor nit just to prove that
> I checked the algorithm ;-)
> 
> So apart from the minor comment above:
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
drew
