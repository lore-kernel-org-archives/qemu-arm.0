Received: by 10.80.166.35 with SMTP id d32csp919283edc;
        Tue, 18 Oct 2016 03:48:43 -0700 (PDT)
X-Received: by 10.55.33.219 with SMTP id f88mr10454qki.10.1476787723223;
        Tue, 18 Oct 2016 03:48:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p42si20570422qtp.48.2016.10.18.03.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 03:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwRwo-0002nQ-KY
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 06:48:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bwRwc-0002mL-Mu
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 06:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bwRwZ-0003HR-JT
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 06:48:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1bwRwZ-0003H7-Bb; Tue, 18 Oct 2016 06:48:27 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 379F88E75B;
	Tue, 18 Oct 2016 10:48:25 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IAmImW017510; Tue, 18 Oct 2016 06:48:18 -0400
Date: Tue, 18 Oct 2016 12:48:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20161018124816.1b88dc80@nial.brq.redhat.com>
In-Reply-To: <20161017192022.GA3275@thinpad.lan.raisama.net>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 18 Oct 2016 10:48:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 2/3] exec: rename cpu_exec_init() as
 cpu_exec_realizefn()
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
	Laurent Vivier <lvivier@redhat.com>, drjones@redhat.com,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /7+bXxbR+MS2

On Mon, 17 Oct 2016 17:20:22 -0200
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Sat, Oct 15, 2016 at 12:52:48AM +0200, Laurent Vivier wrote:
> > Modify all CPUs to call it from XXX_cpu_realizefn() function.
> > 
> > Remove all the cannot_destroy_with_object_finalize_yet as
> > unsafe references have been moved to cpu_exec_realizefn().
> > (tested with QOM command provided by commit 4c315c27)
> > 
> > for arm:
> > 
> > Setting of cpu->mp_affinity is moved from arm_cpu_initfn()
> > to arm_cpu_realizefn() as setting of cpu_index is now done
> > in cpu_exec_realizefn().
> > 
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>  
> [...]
> > diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> > index 1b9540e..364a45d 100644
> > --- a/target-arm/cpu.c
> > +++ b/target-arm/cpu.c
> > @@ -441,22 +441,11 @@ static void arm_cpu_initfn(Object *obj)
> >      CPUState *cs = CPU(obj);
> >      ARMCPU *cpu = ARM_CPU(obj);
> >      static bool inited;
> > -    uint32_t Aff1, Aff0;
> >  
> >      cs->env_ptr = &cpu->env;
> > -    cpu_exec_init(cs, &error_abort);
> >      cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
> >                                           g_free, g_free);
> >  
> > -    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> > -     * We don't support setting cluster ID ([16..23]) (known as Aff2
> > -     * in later ARM ARM versions), or any of the higher affinity level fields,
> > -     * so these bits always RAZ.
> > -     */
> > -    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> > -    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> > -    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> > -
> >  #ifndef CONFIG_USER_ONLY
> >      /* Our inbound IRQ and FIQ lines */
> >      if (kvm_enabled()) {  
> [...]
> > @@ -631,6 +628,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >          set_feature(env, ARM_FEATURE_THUMB_DSP);
> >      }
> >  
> > +    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> > +     * We don't support setting cluster ID ([16..23]) (known as Aff2
> > +     * in later ARM ARM versions), or any of the higher affinity level fields,
> > +     * so these bits always RAZ.
> > +     */
> > +    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> > +    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> > +    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> > +  
>
> This will override any value set in the "mp-affinity" property,
> The mp-affinity property can be set by the user in the
> command-line, and it is also set by machvirt_init() in
> hw/arm/virt.c.
> 
> Considering that each CPU is supposed to have a different value,
> I doubt there are existing use cases for mp-affinity being set
> directly by the user.
> 
> I suggest having a "cluster-size" property, instead of
> "mp-affinity". This way the mp_affinity field can be calculated
> on realize, based on the configured cluster-size.
CCing Drew as he knows more about MPIDR stuff more.

> 
> >      if (cpu->reset_hivecs) {
> >              cpu->reset_sctlr |= (1 << 13);
> >      }  
> [...]
> 

