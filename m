Received: by 10.25.77.4 with SMTP id a4csp339055lfb;
        Thu, 9 Mar 2017 03:04:25 -0800 (PST)
X-Received: by 10.200.56.86 with SMTP id r22mr13431112qtb.190.1489057465438;
        Thu, 09 Mar 2017 03:04:25 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id v51si5399871qta.181.2017.03.09.03.04.25;
        Thu, 09 Mar 2017 03:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id B062440A54;
	Thu,  9 Mar 2017 06:02:59 -0500 (EST)
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
	with ESMTP id FGG8vD1HjHgU; Thu,  9 Mar 2017 06:02:58 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 909BD40A6A;
	Thu,  9 Mar 2017 06:02:58 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id CA62140A14
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 06:02:57 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeYrMo3UhGov for <kvmarm@lists.cs.columbia.edu>;
 Thu,  9 Mar 2017 06:02:56 -0500 (EST)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 3D24740625
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 06:02:55 -0500 (EST)
Received: by mail-wm0-f41.google.com with SMTP id n11so53078307wma.0
 for <kvmarm@lists.cs.columbia.edu>; Thu, 09 Mar 2017 03:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bsAKH83uYdZ9DczC7vq2U5Mr+WEK2kARQltXMFvJldY=;
 b=T+/cI3s32Y4wgZGCYzGlocVY2+s8VVxIR67Qv34w7yBs4fgsv6EO0apblkspZNzDq1
 Fy/+lrwBKcLb0+MgPcE7R7eV3be9foT5xpcvKmsymD+xSrK8wSUmYdY/I9d0g95detLJ
 OSIWhVtecagzD0gPrwAOB8RfLlZjl3eeVVvJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bsAKH83uYdZ9DczC7vq2U5Mr+WEK2kARQltXMFvJldY=;
 b=cJDjybswoN/f3bpdv/1o2UzFjgXceqk5pn2tgW1PKJA+i1hAlqaoAdVkb7JRFDRBf2
 4DCWEvLgrncK1Lm9d9BjSalaZS9o0PPwumt71+Jw7Y/R0bguejp04/xEm2WXArKcf2PB
 YatSbIbuDGg5arbAKApVSEjqgXJiQudu+++s3cfwXhp30HSIu5fV63wSUhByG8s3UeFo
 EFMy4XJAz3m5jWw51HZ8lXE27LOFdIGGgdC5169uMrPhhAtHK59n4vhqMO7Zg5mv3l2S
 qvLjfnWelVIx199+QBisFE8OwYE0PB2AkrwZcaTzMnCMNt718WDTBZSZ/EaJW+6N2UUk
 9FQQ==
X-Gm-Message-State: AMke39kRY1fKKUjZMyZVD8dsq+QFqd9cC0X7r5feyZKwhfgecZhx1120EAJtA1bG9It6IU1D
X-Received: by 10.28.92.212 with SMTP id q203mr9674378wmb.73.1489057460044;
 Thu, 09 Mar 2017 03:04:20 -0800 (PST)
Received: from localhost ([109.74.48.129])
 by smtp.gmail.com with ESMTPSA id c58sm7809009wrc.9.2017.03.09.03.04.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Mar 2017 03:04:19 -0800 (PST)
Date: Thu, 9 Mar 2017 02:56:52 -0800
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH RFC 5/7] ARM64: KVM: Support cross type vCPU
Message-ID: <20170309105652.GC114809@lvm>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-6-git-send-email-zhaoshenglong@huawei.com>
 <20170128144754.cl7pikdwxbw7ovwz@hawk.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170128144754.cl7pikdwxbw7ovwz@hawk.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
 wu.wubin@huawei.com
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
X-TUID: 8ucZqEFmOqqP

On Sat, Jan 28, 2017 at 03:47:54PM +0100, Andrew Jones wrote:
> On Mon, Jan 16, 2017 at 05:33:32PM +0800, Shannon Zhao wrote:
> > From: Shannon Zhao <shannon.zhao@linaro.org>
> > 
> > Add a capability to tell userspace that KVM supports cross type vCPU.
> > Add a cpu feature for userspace to set when it doesn't use host type
> > vCPU and kvm_vcpu_preferred_target return the host MIDR register value
> > so that userspace can check whether its requested vCPU type macthes the
> > one of physical CPU and if so, KVM will not trap ID registers even
> > though userspace doesn't specify -cpu host.
> > Guest accesses MIDR through VPIDR_EL2 so we save/restore it no matter
> > it's a cross type vCPU.
> > 
> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> > ---
> >  arch/arm/kvm/arm.c                   | 10 ++++++++--
> >  arch/arm64/include/asm/kvm_emulate.h |  3 +++
> >  arch/arm64/include/asm/kvm_host.h    |  3 ++-
> >  arch/arm64/include/uapi/asm/kvm.h    |  1 +
> >  arch/arm64/kvm/guest.c               | 17 ++++++++++++++++-
> >  arch/arm64/kvm/hyp/sysreg-sr.c       |  2 ++
> >  include/uapi/linux/kvm.h             |  1 +
> >  7 files changed, 33 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm/kvm/arm.c b/arch/arm/kvm/arm.c
> > index 1167678..bdceb19 100644
> > --- a/arch/arm/kvm/arm.c
> > +++ b/arch/arm/kvm/arm.c
> > @@ -207,6 +207,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >  	case KVM_CAP_ARM_PSCI_0_2:
> >  	case KVM_CAP_READONLY_MEM:
> >  	case KVM_CAP_MP_STATE:
> > +	case KVM_CAP_ARM_CROSS_VCPU:
> >  		r = 1;
> >  		break;
> >  	case KVM_CAP_COALESCED_MMIO:
> > @@ -809,8 +810,9 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
> >  {
> >  	unsigned int i;
> >  	int phys_target = kvm_target_cpu();
> > +	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
> >  
> > -	if (init->target != phys_target)
> > +	if (!cross_vcpu && init->target != phys_target)
> >  		return -EINVAL;
> 
> I'm not sure we need the vcpu feature bit. I think qemu should be
> allowed to try any target (if using -cpu host it will try the
> kvm preferred target). kvm should check that the input target is
> a known target and that it is compatible with the phys_target,
> otherwise -EINVAL.
> 

I agree. I think we just need to advertise the capability to user space
instead.

Thanks,
-Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
