Received: by 10.25.159.19 with SMTP id i19csp1001748lfe;
        Fri, 5 Feb 2016 04:03:14 -0800 (PST)
X-Received: by 10.55.23.9 with SMTP id i9mr16019540qkh.7.1454673793721;
        Fri, 05 Feb 2016 04:03:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si15514328qkb.86.2016.02.05.04.03.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 04:03:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRf6X-0006ej-9T
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 07:03:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aRf6U-0006cy-Ad
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 07:03:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aRf6P-0001Mm-9D
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 07:03:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aRf6P-0001Mf-1N
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 07:03:05 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 80331C0A9CC7;
	Fri,  5 Feb 2016 12:03:04 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u15C30Xs001289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 5 Feb 2016 07:03:03 -0500
Date: Fri, 5 Feb 2016 13:03:00 +0100
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <20160205120300.GD3873@hawk.localdomain>
References: <20160204183801.GF3890@hawk.localdomain> <56B39D9A.7000008@arm.com>
	<20160205092353.GA3873@hawk.localdomain> <56B47B76.3070402@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56B47B76.3070402@arm.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: andre.przywara@arm.com, qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
Subject: Re: [Qemu-arm] MPIDR Aff0 question
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QXey+fFZ5kVX

On Fri, Feb 05, 2016 at 10:37:42AM +0000, Marc Zyngier wrote:
> On 05/02/16 09:23, Andrew Jones wrote:
> > On Thu, Feb 04, 2016 at 06:51:06PM +0000, Marc Zyngier wrote:
> >> Hi Drew,
> >>
> >> On 04/02/16 18:38, Andrew Jones wrote:
> >>>
> >>> Hi Marc and Andre,
> >>>
> >>> I completely understand why reset_mpidr() limits Aff0 to 16, thanks
> >>> to Andre's nice comment about ICC_SGIxR. Now, here's my question;
> >>> it seems that the Cortex-A{53,57,72} manuals want to further limit
> >>> Aff0 to 4, going so far as to say bits 7:2 are RES0. I'm looking
> >>> at userspace dictating the MPIDR for KVM. QEMU tries to model the
> >>> A57 right now, so to be true to the manual, Aff0 should only address
> >>> four PEs, but that would generate a higher trap cost for SGI broadcasts
> >>> when using KVM. Sigh... what to do?
> >>
> >> There are two things to consider:
> >>
> >> - The GICv3 architecture is perfectly happy to address 16 CPUs at Aff0.
> >> - ARM cores are designed to be grouped in clusters of at most 4, but
> >> other implementations may have very different layouts.
> >>
> >> If you want to model something matches reality, then you have to follow
> >> what Cortex-A cores do, assuming you are exposing Cortex-A cores. But
> >> absolutely nothing forces you to (after all, we're not exposing the
> >> intricacies of L2 caches, which is the actual reason why we have
> >> clusters of 4 cores).
> > 
> > Thanks Marc. I'll take the question of whether or not deviation, in
> > the interest of optimal gicv3 use, is OK to QEMU.
> > 
> >>
> >>> Additionally I'm looking at adding support to represent more complex
> >>> topologies in the guest MPIDR (sockets/cores/threads). I see Linux
> >>> currently expects Aff2:socket, Aff1:core, Aff0:thread when threads
> >>> are in use, and Aff1:socket, Aff0:core, when they're not. Assuming
> >>> there are never more than 4 threads to a core makes the first
> >>> expectation fine, but the second one would easily blow the 2 Aff0
> >>> bits alloted, and maybe even a 4 Aff0 bit allotment.
> >>>
> >>> So my current thinking is that always using Aff2:socket, Aff1:cluster,
> >>> Aff0:core (no threads allowed) would be nice for KVM, and allowing up
> >>> to 16 cores to be addressed in Aff0. As it seems there's no standard
> >>> for MPIDR, then that could be the KVM guest "standard".
> >>>
> >>> TCG note: I suppose threads could be allowed there, using
> >>> Aff2:socket, Aff1:core, Aff0:thread (no more than 4 threads)
> >>
> >> I'm not sure why you'd want to map a given topology to a guest (other
> >> than to give the illusion of a particular system). The affinity register
> >> does not define any of this (as you noticed). And what would Aff3 be in
> >> your design? Shelve? Rack? ;-)
> > 
> > :-) Currently Aff3 would be unused, as there doesn't seem to be a need
> > for it, and as some processors don't have it, it would only complicate
> > things to use it sometimes.
> 
> Careful: on a 64bit CPU, Aff3 is always present.

A57 and A72 don't appear to define it though. They have 63:32 as RES0.

> 
> >>
> >> What would the benefit of defining a "socket"?
> > 
> > That's a good lead in for my next question. While I don't believe
> > there needs to be any relationship between socket and numa node, I
> > suspect on real machines there is, and quite possibly socket == node.
> > Shannon is adding numa support to QEMU right now. Without special
> > configuration there's no gain other than illusion, but with pinning,
> > etc. the guest numa nodes will map to host nodes, and thus passing
> > that information on to the guest's kernel is useful. Populating a
> > socket/node affinity field seems to me like a needed step. But,
> > question time, is it? Maybe not. Also, the way Linux currently
> > handles non-thread using MPIDRs (Aff1:socket, Aff0:core) throws a
> > wrench at the Aff2:socket, Aff1:"cluster", Aff0:core(max 16) plan.
> > Either the plan or Linux would need to be changed.
> 
> What I'm worried of at that stage is that we hardcode a virtual topology
> without the knowledge of the physical one. Let's take an example:

Mark's pointer to cpu-map was the piece I was missing. I didn't want to
hardcode anything, but thought we had to at least agree on the meanings
of affinity levels. I see now that the cpu-map node allows us to describe
the meanings.

> 
> I (wish I) have a physical system with 2 sockets, 16 cores per socket, 8
> threads per core. I'm about to run a VM with 16 vcpus. If we're going to
> start pinning things, then we'll have to express that pinning in the
> VM's MPIDRs, and make sure we describe the mapping between the MPIDRs
> and the topology in the firmware tables (DT or ACPI).
> 
> What I'm trying to say here is that there is you cannot really enforce a
> partitioning of MPIDR without considering the underlying HW, and
> communicating your expectations to the OS running in the VM.
> 
> Do I make any sense?

Sure does, but, just be to be sure; so it's not crazy to want to do
this; we just need to 1) pick a topology that makes sense for the
guest/host (that's the user's/libvirt's job), and 2) make sure we
not only assign MPIDR affinities appropriately, but also describe
them with cpu-map (or the ACPI equivalent).

Is that correct?

Thanks,
drew
