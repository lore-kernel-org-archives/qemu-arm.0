Received: by 10.80.166.35 with SMTP id d32csp986936edc;
        Tue, 18 Oct 2016 06:18:41 -0700 (PDT)
X-Received: by 10.200.37.11 with SMTP id 11mr486703qtm.12.1476796721498;
        Tue, 18 Oct 2016 06:18:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d39si20951699qkh.195.2016.10.18.06.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 06:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwUHw-0004yB-UY
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 09:18:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwUHt-0004xc-8F
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 09:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwUHq-0007Sr-1w
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 09:18:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bwUHp-0007SN-QK; Tue, 18 Oct 2016 09:18:33 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3090F8E750;
	Tue, 18 Oct 2016 13:18:32 +0000 (UTC)
Received: from localhost (ovpn-116-159.phx2.redhat.com [10.3.116.159])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IDIUmr027071; Tue, 18 Oct 2016 09:18:31 -0400
Date: Tue, 18 Oct 2016 11:18:29 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20161018131829.GQ3275@thinpad.lan.raisama.net>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
	<20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 18 Oct 2016 13:18:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] exec: rename
 cpu_exec_init() as cpu_exec_realizefn()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o0epNHILbxGo

On Tue, Oct 18, 2016 at 03:00:07PM +0200, Andrew Jones wrote:
> On Mon, Oct 17, 2016 at 05:20:22PM -0200, Eduardo Habkost wrote:
> > On Sat, Oct 15, 2016 at 12:52:48AM +0200, Laurent Vivier wrote:
> > > Modify all CPUs to call it from XXX_cpu_realizefn() function.
> > > 
> > > Remove all the cannot_destroy_with_object_finalize_yet as
> > > unsafe references have been moved to cpu_exec_realizefn().
> > > (tested with QOM command provided by commit 4c315c27)
> > > 
> > > for arm:
> > > 
> > > Setting of cpu->mp_affinity is moved from arm_cpu_initfn()
> > > to arm_cpu_realizefn() as setting of cpu_index is now done
> > > in cpu_exec_realizefn().
> > > 
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > [...]
> > > diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> > > index 1b9540e..364a45d 100644
> > > --- a/target-arm/cpu.c
> > > +++ b/target-arm/cpu.c
> > > @@ -441,22 +441,11 @@ static void arm_cpu_initfn(Object *obj)
> > >      CPUState *cs = CPU(obj);
> > >      ARMCPU *cpu = ARM_CPU(obj);
> > >      static bool inited;
> > > -    uint32_t Aff1, Aff0;
> > >  
> > >      cs->env_ptr = &cpu->env;
> > > -    cpu_exec_init(cs, &error_abort);
> > >      cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
> > >                                           g_free, g_free);
> > >  
> > > -    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> > > -     * We don't support setting cluster ID ([16..23]) (known as Aff2
> > > -     * in later ARM ARM versions), or any of the higher affinity level fields,
> > > -     * so these bits always RAZ.
> > > -     */
> > > -    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> > > -    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> > > -    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> > > -
> > >  #ifndef CONFIG_USER_ONLY
> > >      /* Our inbound IRQ and FIQ lines */
> > >      if (kvm_enabled()) {
> > [...]
> > > @@ -631,6 +628,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> > >          set_feature(env, ARM_FEATURE_THUMB_DSP);
> > >      }
> > >  
> > > +    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> > > +     * We don't support setting cluster ID ([16..23]) (known as Aff2
> > > +     * in later ARM ARM versions), or any of the higher affinity level fields,
> > > +     * so these bits always RAZ.
> > > +     */
> > > +    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> > > +    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> > > +    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> > > +
> > 
> > This will override any value set in the "mp-affinity" property,
> > The mp-affinity property can be set by the user in the
> > command-line, and it is also set by machvirt_init() in
> > hw/arm/virt.c.
> 
> I'm glad you noticed this Eduardo. We'd indeed lose changes made to
> the MPIDRs for mach-virt and Raspberry Pi.
> 
> > 
> > Considering that each CPU is supposed to have a different value,
> > I doubt there are existing use cases for mp-affinity being set
> > directly by the user.
> 
> Probably not. It was turned into a property in order for the gicv3
> model to access it. I don't think that's necessary, so we can just
> un-property it, accessing it directly from the structure instead.
> 
> > 
> > I suggest having a "cluster-size" property, instead of
> > "mp-affinity". This way the mp_affinity field can be calculated
> > on realize, based on the configured cluster-size.
> 
> This won't work for Raspberry Pi's MPIDR adjustment.

Where's that code?

> Anyway, IMO realize should only set values when it knows
> nothing has been set.

Realize could also initialize some (private) fields using other
(public) fields as input. Instead of making machine code
calculate mp_affinity, machine code could just provide input for
realize to calculate the right values.

But maybe my cluster-size suggestion won't work anyway because of
other cases where mp_affinity is set (I didn't check all code
that sets/gets mp_affinity).

> If values have been set, it should only sanity check them. In this
> case it's safe to simply check for uniqueness and zeros;
> 
>  1) The MPIDRs are all zero. As they're not all unique that's not
>     valid. It's pretty safe to assume they just weren't set in this
>     case though, so we can set the default values without complaining.
>     If there was only one cpu, then MPIDR=0 is valid, but that's the
>     default anyway.

Implementing this check in arm_cpu_realizefn() would be
difficult, as the CPU realize method don't have access to the
other CPUs. But maybe we can use some other default value to
indicate that the field was never set? UINT64_MAX?

>  2) The MPIDRs are all unique, or there's a single cpu and its MPIDR
>     is not zero. In this case we shouldn't touch them.
>  3) The MPIDRs are not all zero and not all unique. This is a failed
>     sanity check and should abort.

A sanity check would be useful, but I don't know where exactly it
could be implemented. Is there any post-machine-init hook you
could use?

> 
> Thanks,
> drew
> 
> > 
> > >      if (cpu->reset_hivecs) {
> > >              cpu->reset_sctlr |= (1 << 13);
> > >      }
> > [...]
> > 
> > -- 
> > Eduardo
> > 

-- 
Eduardo
