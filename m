Received: by 10.25.77.4 with SMTP id a4csp381028lfb;
        Thu, 9 Mar 2017 04:52:27 -0800 (PST)
X-Received: by 10.55.189.130 with SMTP id n124mr13625541qkf.235.1489063947145;
        Thu, 09 Mar 2017 04:52:27 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id j63si5580103qte.41.2017.03.09.04.52.26;
        Thu, 09 Mar 2017 04:52:27 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1EB0440BC5;
	Thu,  9 Mar 2017 07:51:01 -0500 (EST)
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
	with ESMTP id QI0Hsbi7nVWa; Thu,  9 Mar 2017 07:51:00 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id F1D7540BBB;
	Thu,  9 Mar 2017 07:50:59 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3495A40AE8
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 07:50:58 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2hD2tg4b-l2 for <kvmarm@lists.cs.columbia.edu>;
 Thu,  9 Mar 2017 07:50:56 -0500 (EST)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 8D6E340A66
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 07:50:56 -0500 (EST)
Received: by mail-wr0-f175.google.com with SMTP id g10so44365964wrg.2
 for <kvmarm@lists.cs.columbia.edu>; Thu, 09 Mar 2017 04:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8PXOjlyyfn5SMijTphB3tPuYV3urlvZC+VLIrv2kEVw=;
 b=IBUFq/XPelPv/j3tLdY11X8FmazOAfMwSHi8WfY3aHafvIRMm9efWHtDAgOTrP+TJq
 a3x3UwTetJ2SH9JrkcGFAB9xRJ3VCPH5kzSL1vrAsL2SXB3SS3QVSkYuD108fWwC3Brw
 E5l2hhKby8qhGGzHqcchdXktreqVK6F9AbvhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8PXOjlyyfn5SMijTphB3tPuYV3urlvZC+VLIrv2kEVw=;
 b=QOQXYRDODx78oIuJMx+ryQJ/KtpjLe5WvfbtzmCqQXFmAjJOQjzq5PP72CZpLU2FSh
 TUafZHN+hR0DnNaA0MMi0412KSaPE7AeuvMgr+OS3ToFG3kda4V8feq2AcGZ7Jeo8Yhb
 OyL/DiEw1jJ1bL9Ufi2WfwrrrZqFZbFoYAXnFtZTMYu0hdAUAVUO//c+9b91nl5YfV/8
 O0u3+Ih+HzVmpykNqyNsk+h69iakHDbEacf051RYs7ksW0/AakMVEXak8yqKFuIvPyZl
 EC2IVF2PjQcDMgng0wH16dyf+vGrGG/0DTQhST7D5b4yWgsKqSTeF6prMEG4yKpZQPIF
 hpiA==
X-Gm-Message-State: AMke39l1RDdH/tCQ0Sv4EDRTD4PVEvhdetMnib6BD2fQ4sR4kVTtI0BEQu34EBjXj6WLeB28
X-Received: by 10.223.142.40 with SMTP id n37mr9987789wrb.137.1489063940408;
 Thu, 09 Mar 2017 04:52:20 -0800 (PST)
Received: from localhost ([109.74.48.129])
 by smtp.gmail.com with ESMTPSA id 36sm8125973wrk.57.2017.03.09.04.52.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Mar 2017 04:52:19 -0800 (PST)
Date: Thu, 9 Mar 2017 04:52:18 -0800
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [PATCH RFC 7/7] ARM64: KVM: Add user set handler for
 id_aa64mmfr0_el1
Message-ID: <20170309125218.GD114809@lvm>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-8-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1484559214-2248-8-git-send-email-zhaoshenglong@huawei.com>
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
X-TUID: IQlURkKEr4rb

On Mon, Jan 16, 2017 at 05:33:34PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Check if the configuration is fine.

This commit message really needs some love and attention.

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

Doesn't the kernel have an abstraction for this already or a cached
value?

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

This really needs some explanation as to what it's checking and what the
logic is.

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

Thanks,
-Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
