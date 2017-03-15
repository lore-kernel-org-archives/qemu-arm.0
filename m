Received: by 10.25.77.4 with SMTP id a4csp298120lfb;
        Wed, 15 Mar 2017 05:51:24 -0700 (PDT)
X-Received: by 10.55.149.197 with SMTP id x188mr2799504qkd.70.1489582284438;
        Wed, 15 Mar 2017 05:51:24 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id v15si1334698qtb.224.2017.03.15.05.51.23;
        Wed, 15 Mar 2017 05:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2E21D40BDA;
	Wed, 15 Mar 2017 08:49:47 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7TXrcfclqWy; Wed, 15 Mar 2017 08:49:45 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E972640430;
	Wed, 15 Mar 2017 08:49:45 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id F304640430
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 08:49:43 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7gD+WCybgLw for <kvmarm@lists.cs.columbia.edu>;
 Wed, 15 Mar 2017 08:49:42 -0400 (EDT)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id A5C0940064
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 08:49:42 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
 [10.5.11.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 98CF93D941;
 Wed, 15 Mar 2017 12:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 98CF93D941
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
 dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
 spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 98CF93D941
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72E8F2D5C4;
 Wed, 15 Mar 2017 12:51:16 +0000 (UTC)
Date: Wed, 15 Mar 2017 13:51:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Christoffer Dall <cdall@linaro.org>
Subject: Re: [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous system
Message-ID: <20170315125113.erfl2gk6fwmbccsn@kamzik.brq.redhat.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
 <20170128145551.sknp447ieue56xgo@hawk.localdomain>
 <20170315115044.GO1277@cbox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170315115044.GO1277@cbox>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 15 Mar 2017 12:51:18 +0000 (UTC)
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, wu.wubin@huawei.com,
 kvmarm@lists.cs.columbia.edu
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
X-TUID: KyYdIp6jbZNR

On Wed, Mar 15, 2017 at 12:50:44PM +0100, Christoffer Dall wrote:
> Hi Drew,
> 
> [Replying here to try to capture the discussion about this patch we had
> at connect].
> 
> On Sat, Jan 28, 2017 at 03:55:51PM +0100, Andrew Jones wrote:
> > On Mon, Jan 16, 2017 at 05:33:33PM +0800, Shannon Zhao wrote:
> > > From: Shannon Zhao <shannon.zhao@linaro.org>
> > > 
> > > When initializing KVM, check whether physical hardware is a
> > > heterogeneous system through the MIDR values. If so, force userspace to
> > > set the KVM_ARM_VCPU_CROSS feature bit. Otherwise, it should fail to
> > > initialize VCPUs.
> > > 
> > > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> > > ---
> > >  arch/arm/kvm/arm.c       | 26 ++++++++++++++++++++++++++
> > >  include/uapi/linux/kvm.h |  1 +
> > >  2 files changed, 27 insertions(+)
> > > 
> > > diff --git a/arch/arm/kvm/arm.c b/arch/arm/kvm/arm.c
> > > index bdceb19..21ec070 100644
> > > --- a/arch/arm/kvm/arm.c
> > > +++ b/arch/arm/kvm/arm.c
> > > @@ -46,6 +46,7 @@
> > >  #include <asm/kvm_coproc.h>
> > >  #include <asm/kvm_psci.h>
> > >  #include <asm/sections.h>
> > > +#include <asm/cputype.h>
> > >  
> > >  #ifdef REQUIRES_VIRT
> > >  __asm__(".arch_extension	virt");
> > > @@ -65,6 +66,7 @@ static unsigned int kvm_vmid_bits __read_mostly;
> > >  static DEFINE_SPINLOCK(kvm_vmid_lock);
> > >  
> > >  static bool vgic_present;
> > > +static bool heterogeneous_system;
> > >  
> > >  static DEFINE_PER_CPU(unsigned char, kvm_arm_hardware_enabled);
> > >  
> > > @@ -210,6 +212,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> > >  	case KVM_CAP_ARM_CROSS_VCPU:
> > >  		r = 1;
> > >  		break;
> > > +	case KVM_CAP_ARM_HETEROGENEOUS:
> > > +		r = heterogeneous_system;
> > > +		break;
> > 
> > What's this for? When/why would usespace check it?
> > 
> 
> Without a capability, how can userspace tell the difference between "I
> got -EINVAL because I'm on an old kernel" or "I asked for something that
> any kernel cannot emulate"?
> 
> Do we need to distinguish between these cases?

Yup, I'm in full agreement that we need a capability for the
cross-vcpu support. Above this heterogeneous one there's the
CROSS_VCPU one though. Do we need both? If QEMU wants to know
whether or not the host it's running on is heterogeneous, then
it can just query sysfs, rather than ask KVM.

> 
> > >  	case KVM_CAP_COALESCED_MMIO:
> > >  		r = KVM_COALESCED_MMIO_PAGE_OFFSET;
> > >  		break;
> > > @@ -812,6 +817,12 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
> > >  	int phys_target = kvm_target_cpu();
> > >  	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
> > >  
> > > +	if (heterogeneous_system && !cross_vcpu) {
> > > +		kvm_err("%s:Host is a heterogeneous system, set KVM_ARM_VCPU_CROSS bit\n",
> > > +			__func__);
> > > +		return -EINVAL;
> > > +	}
> > 
> > Instead of forcing userspace to set a bit, why not just confirm the
> > target selected will work? E.g. if only generic works on a heterogeneous
> > system then just 
> > 
> >  if (heterogeneous_system && init->target != GENERIC)
> >     return -EINVAL
> > 
> > should work
> > 
> 
> Yes, I think we concluded that if we advertise if we can do the
> cross type emulation or not, then if we can do the emulation we should
> just do it when possible, for maximum user experience.

Your agreement here implies to me that we only need the one capability.

> 
> I'm sure I missed some aspect of this discussion though.

Me too. As we discussed, it's probably time to try and hash out a fresh
design doc. It'd be good to get a clear design agreed upon before
returning to the patches.

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
