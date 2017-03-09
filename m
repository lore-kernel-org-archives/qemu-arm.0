Received: by 10.25.77.4 with SMTP id a4csp436541lfb;
        Thu, 9 Mar 2017 07:03:56 -0800 (PST)
X-Received: by 10.55.110.6 with SMTP id j6mr14991471qkc.92.1489071836022;
        Thu, 09 Mar 2017 07:03:56 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id g50si5836700qtc.60.2017.03.09.07.03.55;
        Thu, 09 Mar 2017 07:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C33BD40AF9;
	Thu,  9 Mar 2017 10:02:29 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2FqVo5zc009; Thu,  9 Mar 2017 10:02:27 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 75D4D40AE8;
	Thu,  9 Mar 2017 10:02:27 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id AC64F40AE8
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 10:02:25 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcYzg9RFRoEm for <kvmarm@lists.cs.columbia.edu>;
 Thu,  9 Mar 2017 10:02:24 -0500 (EST)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3A0884095A
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 10:02:23 -0500 (EST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9674913D5;
 Thu,  9 Mar 2017 07:03:48 -0800 (PST)
Received: from leverpostej (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A74A3F220;
 Thu,  9 Mar 2017 07:03:47 -0800 (PST)
Date: Thu, 9 Mar 2017 15:03:32 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [PATCH RFC 7/7] ARM64: KVM: Add user set handler for
 id_aa64mmfr0_el1
Message-ID: <20170309150331.GA10724@leverpostej>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-8-git-send-email-zhaoshenglong@huawei.com>
 <20170309125218.GD114809@lvm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170309125218.GD114809@lvm>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-TUID: xNc8mgnSUk3U

On Thu, Mar 09, 2017 at 04:52:18AM -0800, Christoffer Dall wrote:
> On Mon, Jan 16, 2017 at 05:33:34PM +0800, Shannon Zhao wrote:
> > From: Shannon Zhao <shannon.zhao@linaro.org>
> > 
> > Check if the configuration is fine.
> 
> This commit message really needs some love and attention.
> 
> > 
> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> > ---
> >  arch/arm64/kvm/sys_regs.c | 32 +++++++++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index f613e29..9763b79 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1493,6 +1493,35 @@ static bool access_id_reg(struct kvm_vcpu *vcpu,
> >  	return true;
> >  }
> >  
> > +static int set_id_aa64mmfr0_el1(struct kvm_vcpu *vcpu,
> > +				const struct sys_reg_desc *rd,
> > +				const struct kvm_one_reg *reg,
> > +				void __user *uaddr)
> > +{
> > +	u64 val, id_aa64mmfr0;
> > +
> > +	if (copy_from_user(&val, uaddr, KVM_REG_SIZE(reg->id)) != 0)
> > +		return -EFAULT;
> > +
> > +	asm volatile("mrs %0, id_aa64mmfr0_el1\n" : "=r" (id_aa64mmfr0));
> 
> Doesn't the kernel have an abstraction for this already or a cached
> value?

Certainly we shouldn't be using a raw mrs instruction. We have
read_sysreg() or read_cpuid() for that.

The cpufeature code has a cached, system-wide safe value cached for each
system register. The cpuid_feature_extract_field() helper uses that.

> > +	if ((val & GENMASK(3, 0)) > (id_aa64mmfr0 & GENMASK(3, 0)) ||
> > +	    (val & GENMASK(7, 4)) > (id_aa64mmfr0 & GENMASK(7, 4)) ||
> > +	    (val & GENMASK(11, 8)) > (id_aa64mmfr0 & GENMASK(11, 8)) ||
> > +	    (val & GENMASK(15, 12)) > (id_aa64mmfr0 & GENMASK(15, 12)) ||
> > +	    (val & GENMASK(19, 16)) > (id_aa64mmfr0 & GENMASK(19, 16)) ||
> > +	    (val & GENMASK(23, 20)) > (id_aa64mmfr0 & GENMASK(23, 20)) ||
> > +	    (val & GENMASK(27, 24)) < (id_aa64mmfr0 & GENMASK(27, 24)) ||
> > +	    (val & GENMASK(31, 28)) < (id_aa64mmfr0 & GENMASK(31, 28))) {

Please use mnemonics. For example, we have ID_AA64MMFR0_TGRAN*_SHIFT
defined in <asm/sysreg.h>.

We also have extraction helpers, see
cpuid_feature_extract_unsigned_field(), as used in
id_aa64mmfr0_mixed_endian_el0().

Thanks,
Mark.
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
