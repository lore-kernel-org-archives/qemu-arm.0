Received: by 10.25.0.147 with SMTP id 141csp358424lfa;
        Thu, 2 Mar 2017 08:24:29 -0800 (PST)
X-Received: by 10.237.37.165 with SMTP id x34mr18575374qtc.0.1488471869176;
        Thu, 02 Mar 2017 08:24:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o76si6399675qki.283.2017.03.02.08.24.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:24:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTWk-0004pE-IZ
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:24:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cjTW2-0004RA-Qz
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cjTVy-0008PW-MF
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:23:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cjTVy-0008Mq-Dm; Thu, 02 Mar 2017 11:23:38 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEABD81138;
	Thu,  2 Mar 2017 16:23:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.34.248.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2041D43DC0;
	Thu,  2 Mar 2017 16:23:35 +0000 (UTC)
Date: Thu, 2 Mar 2017 17:23:33 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170302162333.d6wi5u4zff5dtvdn@kamzik.brq.redhat.com>
References: <20170227173706.15210-1-drjones@redhat.com>
	<20170227173706.15210-3-drjones@redhat.com>
	<CAFEAcA-ScxCc5-pizNjeV4S_NpNziWWmVTbP+zAs2KCY=V0wyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-ScxCc5-pizNjeV4S_NpNziWWmVTbP+zAs2KCY=V0wyg@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 02 Mar 2017 16:23:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/2] arm: kvm: set MPIDR when we can
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Igor Mammedov <imammedo@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6aujLPk9MB7o

On Thu, Mar 02, 2017 at 04:13:40PM +0000, Peter Maydell wrote:
> On 27 February 2017 at 17:37, Andrew Jones <drjones@redhat.com> wrote:
> > If KVM supports user provided MPIDRs for the vcpus, then provide
> > them. This simplifies management of vcpus as we can be sure of
> > the identity of a vcpu even before it's been instantiated.
> >
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/cpu.c   |  3 +--
> >  target/arm/kvm32.c | 22 ++++++++++++++--------
> >  target/arm/kvm64.c | 22 ++++++++++++++--------
> >  3 files changed, 29 insertions(+), 18 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index f7157dc0e59d..83cd5eefbef8 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -741,8 +741,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >          return;
> >      }
> >
> > -    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> > -     * We don't support setting cluster ID ([16..23]) (known as Aff2
> > +    /* We don't currently support setting cluster ID ([16..23]) (known as Aff2
> >       * in later ARM ARM versions), or any of the higher affinity level fields,
> >       * so these bits always RAZ.
> >       */
> > diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> > index 069da0c5fd10..5ad732498e5c 100644
> > --- a/target/arm/kvm32.c
> > +++ b/target/arm/kvm32.c
> > @@ -186,7 +186,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >  {
> >      int ret;
> >      uint64_t v;
> > -    uint32_t mpidr;
> >      struct kvm_one_reg r;
> >      ARMCPU *cpu = ARM_CPU(cs);
> >
> > @@ -223,16 +222,23 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >          return -EINVAL;
> >      }
> >
> > -    /*
> > -     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
> > -     * Currently KVM has its own idea about MPIDR assignment, so we
> > -     * override our defaults with what we get from KVM.
> > -     */
> > -    ret = kvm_get_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR), &mpidr);
> > +    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_USER_MPIDR)) {
> > +        ret = kvm_set_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR),
> > +                              &cpu->mp_affinity);
> 
> mp_affinity is only the affinity bits of the MPIDR. I would expect
> the kernel set_one_reg interface for the MPIDR to want a complete
> MPIDR value with M, U and MT bits.

Thanks, I'll fix this.

> 
> (compare the way that when we set mp_affinity from the kernel
> reg. value we mask out the bits we don't care about).
> 
> Similarly with the 64-bit version of this code.
> 
> > +    } else {
> > +        /* If we can't set the MPIDR, then KVM will generate one. We must
> > +         * update our copy to that one in order to stay synchronized.
> > +         */
> > +        uint32_t mpidr;
> > +
> > +        ret = kvm_get_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR), &mpidr);
> > +        if (!ret) {
> > +            cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
> > +        }
> > +    }
> >      if (ret) {
> >          return ret;
> >      }
> > -    cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
> >
> >      return kvm_arm_init_cpreg_list(cpu);
> 
> Otherwise this looks fine to me.
> 
> PS: I assume we are targeting 2.10 (or whatever we call it) with this.

Yeah, this is 2.10 material.

Thanks,
drew
