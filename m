Received: by 10.25.21.96 with SMTP id l93csp1127643lfi;
        Fri, 24 Jun 2016 09:17:59 -0700 (PDT)
X-Received: by 10.55.186.193 with SMTP id k184mr6008972qkf.184.1466785079368;
        Fri, 24 Jun 2016 09:17:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t82si1637801qkl.33.2016.06.24.09.17.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 09:17:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGTnq-0007sK-Lp
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 12:17:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bGTlN-0006D7-84
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 12:15:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bGTlL-0003cN-Vs
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 12:15:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bGTlF-0003aa-5t; Fri, 24 Jun 2016 12:15:17 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AC55C04B311;
	Fri, 24 Jun 2016 16:15:16 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5OGFDV8022877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 24 Jun 2016 12:15:15 -0400
Date: Fri, 24 Jun 2016 18:15:13 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160624161513.zgqxspxhdre3d67c@hawk.localdomain>
References: <1466535515-18092-1-git-send-email-drjones@redhat.com>
	<CAFEAcA-56LUe_jYK=V-H890WVL12YuDeRSZn9FK3yReiJ4p2Hw@mail.gmail.com>
	<20160624160321.nvn5run4kmywk7kc@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160624160321.nvn5run4kmywk7kc@hawk.localdomain>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 24 Jun 2016 16:15:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: gicv3: use all target-list
 bits
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 790XsmP/EyF1

On Fri, Jun 24, 2016 at 06:03:21PM +0200, Andrew Jones wrote:
> On Thu, Jun 23, 2016 at 12:15:59PM +0100, Peter Maydell wrote:
> > On 21 June 2016 at 19:58, Andrew Jones <drjones@redhat.com> wrote:
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > 
> > I think this commit message could be improved...it's both
> > very short and a bit off the mark.
> > 
> > > ---
> > >  hw/arm/virt.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index c5c125e9204a0..53f545921003c 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -1271,6 +1271,16 @@ static void machvirt_init(MachineState *machine)
> > >          }
> > >          cpuobj = object_new(object_class_get_name(oc));
> > >
> > > +        /* Adjust MPIDR per the GIC's target-list size. */
> > > +        if (gic_version == 3) {
> > > +            CPUState *cs = CPU(cpuobj);
> > > +            uint8_t Aff1 = cs->cpu_index / 16;
> > > +            uint8_t Aff0 = cs->cpu_index % 16;
> > > +
> > > +            object_property_set_int(cpuobj, (Aff1 << ARM_AFF1_SHIFT) | Aff0,
> > > +                                    "mp-affinity", NULL);
> > > +        }
> > 
> > We still don't have support in KVM for telling the CPU what
> > affinity to use, so these may get overridden later if KVM's
> > idea of affinity and ours differ. I guess that's no different
> > to what we have today, though.
> > 
> > I think it would be better to:
> >  * use the loop index 'n' rather than fishing the cpu_index
> >    out of the CPUState.
> >  * do this regardless of GIC version (if it's GICv2 we only
> >    have 8 CPUs max anyway)
> >  * comment it as "Create our CPUs in clusters of 16; this suits
> >    the GICv3's target list limitations, and matches how KVM
> >    assigns them"
> >  * for 32-bit, set the mp-affinity in the same arrangement the
> >    kernel does for KVM, which is clusters of 4 CPUs
> 
> Actually this depends on the host. KVM will use all 8 tlist bits
> with ARM guests, when running on an AArch64 host. As a guest doesn't
> really have to worry about clusters for shared cache, then ignoring
> the 4 per cluster requirement is likely fine (is that a hard
> requirement anyway?), but it could confuse a guest.
> 
> So we can either
> a) play it safe and always use clusters of 4 for ARM guests, and
>    KVM will get "fixed" when we start managing the guest's MPIDR
>    from userspace, or
> b) use 8 here, as TCG always has, and KVM does for AArch32 guests.
>    This might be less safe, but also improves SGI efficiency.

Actually AArch32 guests would even use all 16 tlist bits on gicv3, if
there was a KVM host available to try it. So the (b) option shouldn't
be "use 8" it should be "don't treat 32-bit guests differently"

Thanks,
drew



> 
> Thanks,
> drew
> 
> 
> >  * note also in the comment that for KVM these will be overridden
> >    by the hard-coded topology in the kernel when the CPU is
> >    realized
> > 
> > [is changing mp-affinity a migration compat break?]
> > 
> > thanks
> > -- PMM
> > 
