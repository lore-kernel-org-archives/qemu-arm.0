Received: by 10.80.166.35 with SMTP id d32csp1025394edc;
        Tue, 18 Oct 2016 07:34:08 -0700 (PDT)
X-Received: by 10.31.63.85 with SMTP id m82mr703558vka.146.1476801248702;
        Tue, 18 Oct 2016 07:34:08 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j197si17898037vkc.82.2016.10.18.07.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 07:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwVSy-0002F9-1z
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 10:34:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bwVIN-0001u8-BB
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 10:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bwVIL-0000np-Tu
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 10:23:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bwVID-0000kR-UJ; Tue, 18 Oct 2016 10:23:02 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2926EC057FA6;
	Tue, 18 Oct 2016 14:23:00 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IEMloA018056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 18 Oct 2016 10:22:49 -0400
Date: Tue, 18 Oct 2016 16:22:47 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
	<20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161018131829.GQ3275@thinpad.lan.raisama.net>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 18 Oct 2016 14:23:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 2/3] exec: rename cpu_exec_init() as
 cpu_exec_realizefn()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZTEe+zgsB/NU

On Tue, Oct 18, 2016 at 11:18:29AM -0200, Eduardo Habkost wrote:
> On Tue, Oct 18, 2016 at 03:00:07PM +0200, Andrew Jones wrote:
> > On Mon, Oct 17, 2016 at 05:20:22PM -0200, Eduardo Habkost wrote:
> > > On Sat, Oct 15, 2016 at 12:52:48AM +0200, Laurent Vivier wrote:
> > > > Modify all CPUs to call it from XXX_cpu_realizefn() function.
> > > > 
> > > > Remove all the cannot_destroy_with_object_finalize_yet as
> > > > unsafe references have been moved to cpu_exec_realizefn().
> > > > (tested with QOM command provided by commit 4c315c27)
> > > > 
> > > > for arm:
> > > > 
> > > > Setting of cpu->mp_affinity is moved from arm_cpu_initfn()
> > > > to arm_cpu_realizefn() as setting of cpu_index is now done
> > > > in cpu_exec_realizefn().
> > > > 
> > > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > > [...]
> > > > diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> > > > index 1b9540e..364a45d 100644
> > > > --- a/target-arm/cpu.c
> > > > +++ b/target-arm/cpu.c
> > > > @@ -441,22 +441,11 @@ static void arm_cpu_initfn(Object *obj)
> > > >      CPUState *cs = CPU(obj);
> > > >      ARMCPU *cpu = ARM_CPU(obj);
> > > >      static bool inited;
> > > > -    uint32_t Aff1, Aff0;
> > > >  
> > > >      cs->env_ptr = &cpu->env;
> > > > -    cpu_exec_init(cs, &error_abort);
> > > >      cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
> > > >                                           g_free, g_free);
> > > >  
> > > > -    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> > > > -     * We don't support setting cluster ID ([16..23]) (known as Aff2
> > > > -     * in later ARM ARM versions), or any of the higher affinity level fields,
> > > > -     * so these bits always RAZ.
> > > > -     */
> > > > -    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> > > > -    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> > > > -    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> > > > -
> > > >  #ifndef CONFIG_USER_ONLY
> > > >      /* Our inbound IRQ and FIQ lines */
> > > >      if (kvm_enabled()) {
> > > [...]
> > > > @@ -631,6 +628,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> > > >          set_feature(env, ARM_FEATURE_THUMB_DSP);
> > > >      }
> > > >  
> > > > +    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> > > > +     * We don't support setting cluster ID ([16..23]) (known as Aff2
> > > > +     * in later ARM ARM versions), or any of the higher affinity level fields,
> > > > +     * so these bits always RAZ.
> > > > +     */
> > > > +    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> > > > +    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> > > > +    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> > > > +
> > > 
> > > This will override any value set in the "mp-affinity" property,
> > > The mp-affinity property can be set by the user in the
> > > command-line, and it is also set by machvirt_init() in
> > > hw/arm/virt.c.
> > 
> > I'm glad you noticed this Eduardo. We'd indeed lose changes made to
> > the MPIDRs for mach-virt and Raspberry Pi.
> > 
> > > 
> > > Considering that each CPU is supposed to have a different value,
> > > I doubt there are existing use cases for mp-affinity being set
> > > directly by the user.
> > 
> > Probably not. It was turned into a property in order for the gicv3
> > model to access it. I don't think that's necessary, so we can just
> > un-property it, accessing it directly from the structure instead.
> > 
> > > 
> > > I suggest having a "cluster-size" property, instead of
> > > "mp-affinity". This way the mp_affinity field can be calculated
> > > on realize, based on the configured cluster-size.
> > 
> > This won't work for Raspberry Pi's MPIDR adjustment.
> 
> Where's that code?

hw/arm/bcm2836.c:109

> 
> > Anyway, IMO realize should only set values when it knows
> > nothing has been set.
> 
> Realize could also initialize some (private) fields using other
> (public) fields as input. Instead of making machine code
> calculate mp_affinity, machine code could just provide input for
> realize to calculate the right values.
> 
> But maybe my cluster-size suggestion won't work anyway because of
> other cases where mp_affinity is set (I didn't check all code
> that sets/gets mp_affinity).

Anyway, cluster-size is machine state, not cpu state.

> 
> > If values have been set, it should only sanity check them. In this
> > case it's safe to simply check for uniqueness and zeros;
> > 
> >  1) The MPIDRs are all zero. As they're not all unique that's not
> >     valid. It's pretty safe to assume they just weren't set in this
> >     case though, so we can set the default values without complaining.
> >     If there was only one cpu, then MPIDR=0 is valid, but that's the
> >     default anyway.
> 
> Implementing this check in arm_cpu_realizefn() would be
> difficult, as the CPU realize method don't have access to the
> other CPUs. But maybe we can use some other default value to
> indicate that the field was never set? UINT64_MAX?

I considered that, but if we un-property ARMCPU->mp_affinity, then where
can it be initialized to "MP_AFFINITY_INVALID", which would be ff000000?

> 
> >  2) The MPIDRs are all unique, or there's a single cpu and its MPIDR
> >     is not zero. In this case we shouldn't touch them.
> >  3) The MPIDRs are not all zero and not all unique. This is a failed
> >     sanity check and should abort.
> 
> A sanity check would be useful, but I don't know where exactly it
> could be implemented. Is there any post-machine-init hook you could use?

We do have virt_guest_info_machine_done for mach-virt, but it'd be
sort of ugly to put it there...

This is one of those things where it's true that the set of all cpu
MPIDRs is machine state, and thus should be checked by the machine for
uniqueness. But, the purpose of checking is to ensure each CPU instance
is sane, a CPU internal motivation. Doing the check at the machine level
is ugly. Doing the check at the CPU level is either not possible or
breaks the object model. Sigh... maybe we should just forget it.


OK, to proceed with this patch, since mp-affinity *is* currently a
property, we can just change its default value to ff000000. Then,
when moving the calculation to realize we just need to ensure the
current value is ff000000 before overwriting it.

Another comment on this patch; please rename the definition
ARM_CPUS_PER_CLUSTER to ARM_DEFAULT_CPUS_PER_CLUSTER, and move it
down to just above arm_cpu_realizefn.

Thanks,
drew
