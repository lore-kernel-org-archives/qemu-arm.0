Received: by 10.25.77.65 with SMTP id a62csp720971lfb;
        Sat, 28 Jan 2017 07:22:35 -0800 (PST)
X-Received: by 10.200.41.198 with SMTP id 6mr13264095qtt.130.1485616955598;
        Sat, 28 Jan 2017 07:22:35 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 26si5925880qtp.44.2017.01.28.07.22.35;
        Sat, 28 Jan 2017 07:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A636D40838;
	Sat, 28 Jan 2017 10:22:20 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OK7zPWGXPZs; Sat, 28 Jan 2017 10:22:19 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 9F5174096F;
	Sat, 28 Jan 2017 10:22:19 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C61A34018B
 for <kvmarm@lists.cs.columbia.edu>; Sat, 28 Jan 2017 10:22:17 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9iq5RREFyF0c for <kvmarm@lists.cs.columbia.edu>;
 Sat, 28 Jan 2017 10:22:16 -0500 (EST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id CD75A40187
 for <kvmarm@lists.cs.columbia.edu>; Sat, 28 Jan 2017 10:22:16 -0500 (EST)
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
 (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E37E73B703;
 Sat, 28 Jan 2017 15:22:30 +0000 (UTC)
Received: from hawk.localdomain (vpn1-5-52.ams2.redhat.com [10.36.5.52])
 by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 v0SFMQmE026568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 28 Jan 2017 10:22:28 -0500
Date: Sat, 28 Jan 2017 16:22:25 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [PATCH RFC 7/7] ARM64: KVM: Add user set handler for
 id_aa64mmfr0_el1
Message-ID: <20170128152225.prjujz5rdvblwsjg@hawk.localdomain>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-8-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1484559214-2248-8-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Sat, 28 Jan 2017 15:22:31 +0000 (UTC)
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
X-TUID: 5zHvesBC/mrI

On Mon, Jan 16, 2017 at 05:33:34PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Check if the configuration is fine.

I don't think we need this patch. Instead, userspace should
get_one_reg first when the target id register needs to be
sanity checked. The value it gets will be the host value at
that point, so it can sanity check itself before calling
set_one_reg.

drew

> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index f613e29..9763b79 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1493,6 +1493,35 @@ static bool access_id_reg(struct kvm_vcpu *vcpu,
>  	return true;
>  }
>  
> +static int set_id_aa64mmfr0_el1(struct kvm_vcpu *vcpu,
> +				const struct sys_reg_desc *rd,
> +				const struct kvm_one_reg *reg,
> +				void __user *uaddr)
> +{
> +	u64 val, id_aa64mmfr0;
> +
> +	if (copy_from_user(&val, uaddr, KVM_REG_SIZE(reg->id)) != 0)
> +		return -EFAULT;
> +
> +	asm volatile("mrs %0, id_aa64mmfr0_el1\n" : "=r" (id_aa64mmfr0));
> +
> +	if ((val & GENMASK(3, 0)) > (id_aa64mmfr0 & GENMASK(3, 0)) ||
> +	    (val & GENMASK(7, 4)) > (id_aa64mmfr0 & GENMASK(7, 4)) ||
> +	    (val & GENMASK(11, 8)) > (id_aa64mmfr0 & GENMASK(11, 8)) ||
> +	    (val & GENMASK(15, 12)) > (id_aa64mmfr0 & GENMASK(15, 12)) ||
> +	    (val & GENMASK(19, 16)) > (id_aa64mmfr0 & GENMASK(19, 16)) ||
> +	    (val & GENMASK(23, 20)) > (id_aa64mmfr0 & GENMASK(23, 20)) ||
> +	    (val & GENMASK(27, 24)) < (id_aa64mmfr0 & GENMASK(27, 24)) ||
> +	    (val & GENMASK(31, 28)) < (id_aa64mmfr0 & GENMASK(31, 28))) {
> +		kvm_err("Wrong memory translation granule size/Physical Address range\n");
> +		return -EINVAL;
> +	}
> +
> +	vcpu_id_sys_reg(vcpu, rd->reg) = val & GENMASK(31, 0);
> +
> +	return 0;
> +}
> +
>  static struct sys_reg_desc invariant_sys_regs[] = {
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b000),
>  	  access_id_reg, get_midr_el1, MIDR_EL1 },
> @@ -1549,7 +1578,8 @@ static struct sys_reg_desc invariant_sys_regs[] = {
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0110), Op2(0b001),
>  	  access_id_reg, get_id_aa64isar1_el1, ID_AA64ISAR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b000),
> -	  access_id_reg, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1 },
> +	  access_id_reg, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1,
> +	  0, NULL, set_id_aa64mmfr0_el1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b001),
>  	  access_id_reg, get_id_aa64mmfr1_el1, ID_AA64MMFR1_EL1 },
>  	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b001),
> -- 
> 2.0.4
> 
> 
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
