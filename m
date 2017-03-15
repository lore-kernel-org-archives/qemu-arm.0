Received: by 10.25.77.4 with SMTP id a4csp273390lfb;
        Wed, 15 Mar 2017 04:51:03 -0700 (PDT)
X-Received: by 10.237.34.125 with SMTP id o58mr2199097qtc.108.1489578663098;
        Wed, 15 Mar 2017 04:51:03 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q19si1236948qtg.125.2017.03.15.04.51.02;
        Wed, 15 Mar 2017 04:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 90D1240BD2;
	Wed, 15 Mar 2017 07:49:26 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RyLdfy892Iwh; Wed, 15 Mar 2017 07:49:25 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 85C4340B8C;
	Wed, 15 Mar 2017 07:49:25 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 236EC40B58
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 07:49:24 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Dgc1SlyIrkS for <kvmarm@lists.cs.columbia.edu>;
 Wed, 15 Mar 2017 07:49:22 -0400 (EDT)
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 064CE405DA
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 07:49:21 -0400 (EDT)
Received: by mail-wm0-f49.google.com with SMTP id n11so20851518wma.0
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AqVJHGUGmEgZ8SuBka3jQ0GwHb5g8ouJs2qcyGy/6f0=;
 b=QGFvl/mG8tQERTF12PQtghv++5n/twK5WN+hgHViAZnIaM1hvWmrpVOzE6yQfkPEfB
 BzB819FIplRoFEn5LF2n11nM8drL9At5fF/0XLXu/q7YK0t61A4G4WfbR85jiGMsFUGR
 ZlnG7K3bHBSRlUtJNh3d3p0sP3xIdizb6Yd08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AqVJHGUGmEgZ8SuBka3jQ0GwHb5g8ouJs2qcyGy/6f0=;
 b=r2w6hv2vq1bWfQZ3SoL7azJzsQDkZCkMqMi0ugFrDiVl8J7QwxuBO9tAA78BWG86z+
 N7QkBdDwMuH6Tqr67bWP99skxle24fp6KidIhxXqmhaMPeBjfFJzYeLHnYNPCgSVEANg
 epPT6jr9bgD53muj1JxbaE7mjmUE2giRniY4v7RrV4cGBd7tfSavSCT+Ku7tG9C0JEIQ
 TThYqRnfctWik3ai8Cj7dpTJxqYDrrxn1RkIk7l8uShbVoLVQ6DP8XaPBNbvgsZ2N3Vh
 vzBlOnoSGsyfpbVeqRhAB99tuXcSsXe+en8wFW8rghGkM6TdJXnlDRTCCAoQrw6H7raz
 MmZQ==
X-Gm-Message-State: AFeK/H0RudC4kgJq+N7QkGqiuuOGq1tq4kwzJga2PBw0tfagvRlY89Rknq6OMvOKN932q5VP
X-Received: by 10.28.168.130 with SMTP id r124mr18938203wme.34.1489578656318; 
 Wed, 15 Mar 2017 04:50:56 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
 by smtp.gmail.com with ESMTPSA id 63sm2047910wrh.68.2017.03.15.04.50.55
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 15 Mar 2017 04:50:55 -0700 (PDT)
Date: Wed, 15 Mar 2017 12:50:44 +0100
From: Christoffer Dall <cdall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous system
Message-ID: <20170315115044.GO1277@cbox>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
 <20170128145551.sknp447ieue56xgo@hawk.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170128145551.sknp447ieue56xgo@hawk.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-TUID: 9dDf/wOcJ6N1

Hi Drew,

[Replying here to try to capture the discussion about this patch we had
at connect].

On Sat, Jan 28, 2017 at 03:55:51PM +0100, Andrew Jones wrote:
> On Mon, Jan 16, 2017 at 05:33:33PM +0800, Shannon Zhao wrote:
> > From: Shannon Zhao <shannon.zhao@linaro.org>
> > 
> > When initializing KVM, check whether physical hardware is a
> > heterogeneous system through the MIDR values. If so, force userspace to
> > set the KVM_ARM_VCPU_CROSS feature bit. Otherwise, it should fail to
> > initialize VCPUs.
> > 
> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> > ---
> >  arch/arm/kvm/arm.c       | 26 ++++++++++++++++++++++++++
> >  include/uapi/linux/kvm.h |  1 +
> >  2 files changed, 27 insertions(+)
> > 
> > diff --git a/arch/arm/kvm/arm.c b/arch/arm/kvm/arm.c
> > index bdceb19..21ec070 100644
> > --- a/arch/arm/kvm/arm.c
> > +++ b/arch/arm/kvm/arm.c
> > @@ -46,6 +46,7 @@
> >  #include <asm/kvm_coproc.h>
> >  #include <asm/kvm_psci.h>
> >  #include <asm/sections.h>
> > +#include <asm/cputype.h>
> >  
> >  #ifdef REQUIRES_VIRT
> >  __asm__(".arch_extension	virt");
> > @@ -65,6 +66,7 @@ static unsigned int kvm_vmid_bits __read_mostly;
> >  static DEFINE_SPINLOCK(kvm_vmid_lock);
> >  
> >  static bool vgic_present;
> > +static bool heterogeneous_system;
> >  
> >  static DEFINE_PER_CPU(unsigned char, kvm_arm_hardware_enabled);
> >  
> > @@ -210,6 +212,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >  	case KVM_CAP_ARM_CROSS_VCPU:
> >  		r = 1;
> >  		break;
> > +	case KVM_CAP_ARM_HETEROGENEOUS:
> > +		r = heterogeneous_system;
> > +		break;
> 
> What's this for? When/why would usespace check it?
> 

Without a capability, how can userspace tell the difference between "I
got -EINVAL because I'm on an old kernel" or "I asked for something that
any kernel cannot emulate"?

Do we need to distinguish between these cases?

> >  	case KVM_CAP_COALESCED_MMIO:
> >  		r = KVM_COALESCED_MMIO_PAGE_OFFSET;
> >  		break;
> > @@ -812,6 +817,12 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
> >  	int phys_target = kvm_target_cpu();
> >  	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
> >  
> > +	if (heterogeneous_system && !cross_vcpu) {
> > +		kvm_err("%s:Host is a heterogeneous system, set KVM_ARM_VCPU_CROSS bit\n",
> > +			__func__);
> > +		return -EINVAL;
> > +	}
> 
> Instead of forcing userspace to set a bit, why not just confirm the
> target selected will work? E.g. if only generic works on a heterogeneous
> system then just 
> 
>  if (heterogeneous_system && init->target != GENERIC)
>     return -EINVAL
> 
> should work
> 

Yes, I think we concluded that if we advertise if we can do the
cross type emulation or not, then if we can do the emulation we should
just do it when possible, for maximum user experience.

I'm sure I missed some aspect of this discussion though.

Thanks,
-Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
