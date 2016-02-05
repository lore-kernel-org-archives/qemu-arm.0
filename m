Received: by 10.25.159.19 with SMTP id i19csp936165lfe;
        Fri, 5 Feb 2016 01:24:04 -0800 (PST)
X-Received: by 10.140.101.201 with SMTP id u67mr15145290qge.33.1454664244069;
        Fri, 05 Feb 2016 01:24:04 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id p47si15033597qge.79.2016.02.05.01.24.03;
        Fri, 05 Feb 2016 01:24:04 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6FE604970A;
	Fri,  5 Feb 2016 04:18:31 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLXdBIl4Mcpd; Fri,  5 Feb 2016 04:18:29 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7D85E49692;
	Fri,  5 Feb 2016 04:18:29 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6852749692
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 Feb 2016 04:18:28 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YA4C40-kthTM for <kvmarm@lists.cs.columbia.edu>;
 Fri,  5 Feb 2016 04:18:27 -0500 (EST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 09A484965E
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 Feb 2016 04:18:26 -0500 (EST)
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
 (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
 by mx1.redhat.com (Postfix) with ESMTPS id D82998D3B5;
 Fri,  5 Feb 2016 09:23:57 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
 by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 u159NsrA023885
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 5 Feb 2016 04:23:56 -0500
Date: Fri, 5 Feb 2016 10:23:53 +0100
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: MPIDR Aff0 question
Message-ID: <20160205092353.GA3873@hawk.localdomain>
References: <20160204183801.GF3890@hawk.localdomain> <56B39D9A.7000008@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56B39D9A.7000008@arm.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Cc: andre.przywara@arm.com, qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: kMfhMZDDFSwn

On Thu, Feb 04, 2016 at 06:51:06PM +0000, Marc Zyngier wrote:
> Hi Drew,
> 
> On 04/02/16 18:38, Andrew Jones wrote:
> > 
> > Hi Marc and Andre,
> > 
> > I completely understand why reset_mpidr() limits Aff0 to 16, thanks
> > to Andre's nice comment about ICC_SGIxR. Now, here's my question;
> > it seems that the Cortex-A{53,57,72} manuals want to further limit
> > Aff0 to 4, going so far as to say bits 7:2 are RES0. I'm looking
> > at userspace dictating the MPIDR for KVM. QEMU tries to model the
> > A57 right now, so to be true to the manual, Aff0 should only address
> > four PEs, but that would generate a higher trap cost for SGI broadcasts
> > when using KVM. Sigh... what to do?
> 
> There are two things to consider:
> 
> - The GICv3 architecture is perfectly happy to address 16 CPUs at Aff0.
> - ARM cores are designed to be grouped in clusters of at most 4, but
> other implementations may have very different layouts.
> 
> If you want to model something matches reality, then you have to follow
> what Cortex-A cores do, assuming you are exposing Cortex-A cores. But
> absolutely nothing forces you to (after all, we're not exposing the
> intricacies of L2 caches, which is the actual reason why we have
> clusters of 4 cores).

Thanks Marc. I'll take the question of whether or not deviation, in
the interest of optimal gicv3 use, is OK to QEMU.

> 
> > Additionally I'm looking at adding support to represent more complex
> > topologies in the guest MPIDR (sockets/cores/threads). I see Linux
> > currently expects Aff2:socket, Aff1:core, Aff0:thread when threads
> > are in use, and Aff1:socket, Aff0:core, when they're not. Assuming
> > there are never more than 4 threads to a core makes the first
> > expectation fine, but the second one would easily blow the 2 Aff0
> > bits alloted, and maybe even a 4 Aff0 bit allotment.
> > 
> > So my current thinking is that always using Aff2:socket, Aff1:cluster,
> > Aff0:core (no threads allowed) would be nice for KVM, and allowing up
> > to 16 cores to be addressed in Aff0. As it seems there's no standard
> > for MPIDR, then that could be the KVM guest "standard".
> > 
> > TCG note: I suppose threads could be allowed there, using
> > Aff2:socket, Aff1:core, Aff0:thread (no more than 4 threads)
> 
> I'm not sure why you'd want to map a given topology to a guest (other
> than to give the illusion of a particular system). The affinity register
> does not define any of this (as you noticed). And what would Aff3 be in
> your design? Shelve? Rack? ;-)

:-) Currently Aff3 would be unused, as there doesn't seem to be a need
for it, and as some processors don't have it, it would only complicate
things to use it sometimes.

> 
> What would the benefit of defining a "socket"?

That's a good lead in for my next question. While I don't believe
there needs to be any relationship between socket and numa node, I
suspect on real machines there is, and quite possibly socket == node.
Shannon is adding numa support to QEMU right now. Without special
configuration there's no gain other than illusion, but with pinning,
etc. the guest numa nodes will map to host nodes, and thus passing
that information on to the guest's kernel is useful. Populating a
socket/node affinity field seems to me like a needed step. But,
question time, is it? Maybe not. Also, the way Linux currently
handles non-thread using MPIDRs (Aff1:socket, Aff0:core) throws a
wrench at the Aff2:socket, Aff1:"cluster", Aff0:core(max 16) plan.
Either the plan or Linux would need to be changed.

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
