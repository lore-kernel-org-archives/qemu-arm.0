Received: by 10.25.77.65 with SMTP id a62csp688400lfb;
        Sat, 28 Jan 2017 05:49:27 -0800 (PST)
X-Received: by 10.237.33.67 with SMTP id 61mr12314486qtc.37.1485611367544;
        Sat, 28 Jan 2017 05:49:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si5765228qki.259.2017.01.28.05.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 28 Jan 2017 05:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cXTNd-0003Ji-7Q
	for alex.bennee@linaro.org; Sat, 28 Jan 2017 08:49:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cXTNY-0003JR-Kf
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 08:49:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cXTNU-0000MB-O6
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 08:49:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38860)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>) id 1cXTNU-0000Lw-F3
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 08:49:16 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56F8885541;
	Sat, 28 Jan 2017 13:49:16 +0000 (UTC)
Received: from hawk.localdomain (vpn1-5-52.ams2.redhat.com [10.36.5.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 335031D1E2;
	Sat, 28 Jan 2017 13:49:13 +0000 (UTC)
Date: Sat, 28 Jan 2017 14:49:10 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20170128134910.puefhy54b3tmdco3@hawk.localdomain>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
	<1484559214-2248-5-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484559214-2248-5-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 28 Jan 2017 13:49:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 4/7] ARM64: KVM: emulate accessing ID
 registers
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
Cc: peter.maydell@linaro.org, marc.zyngier@arm.com, qemu-arm@nongnu.org,
	wu.wubin@huawei.com, kvmarm@lists.cs.columbia.edu,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ttkD9Fqeg7VX

On Mon, Jan 16, 2017 at 05:33:31PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 83 ++++++++++++++++++++++++++++-------------------
>  1 file changed, 50 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 7c5fa03..f613e29 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1480,71 +1480,84 @@ FUNCTION_INVARIANT(id_aa64mmfr1_el1)
>  FUNCTION_INVARIANT(clidr_el1)
>  FUNCTION_INVARIANT(aidr_el1)
>  
> +static bool access_id_reg(struct kvm_vcpu *vcpu,
> +			  struct sys_reg_params *p,
> +			  const struct sys_reg_desc *r)
> +{
> +	if (p->is_write) {
> +		vcpu_id_sys_reg(vcpu, r->reg) = p->regval;

Hmm, most/all id registers are write-ignore, right? If there
are some that are not, then they should get their own handler.

> +	} else {
> +		p->regval = vcpu_id_sys_reg(vcpu, r->reg);
> +	}
> +
> +	return true;
> +}
> +
>  static struct sys_reg_desc invariant_sys_regs[] = {
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b000),
> -	  NULL, get_midr_el1, MIDR_EL1 },
> +	  access_id_reg, get_midr_el1, MIDR_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b110),
> -	  NULL, get_revidr_el1, REVIDR_EL1 },
> +	  access_id_reg, get_revidr_el1, REVIDR_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b000),
> -	  NULL, get_id_pfr0_el1, ID_PFR0_EL1 },
> +	  access_id_reg, get_id_pfr0_el1, ID_PFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b001),
> -	  NULL, get_id_pfr1_el1, ID_PFR1_EL1 },
> +	  access_id_reg, get_id_pfr1_el1, ID_PFR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b010),
> -	  NULL, get_id_dfr0_el1, ID_DFR0_EL1 },
> +	  access_id_reg, get_id_dfr0_el1, ID_DFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b011),
> -	  NULL, get_id_afr0_el1, ID_AFR0_EL1 },
> +	  access_id_reg, get_id_afr0_el1, ID_AFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b100),
> -	  NULL, get_id_mmfr0_el1, ID_MMFR0_EL1 },
> +	  access_id_reg, get_id_mmfr0_el1, ID_MMFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b101),
> -	  NULL, get_id_mmfr1_el1, ID_MMFR1_EL1 },
> +	  access_id_reg, get_id_mmfr1_el1, ID_MMFR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b110),
> -	  NULL, get_id_mmfr2_el1, ID_MMFR2_EL1 },
> +	  access_id_reg, get_id_mmfr2_el1, ID_MMFR2_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b111),
> -	  NULL, get_id_mmfr3_el1, ID_MMFR3_EL1 },
> +	  access_id_reg, get_id_mmfr3_el1, ID_MMFR3_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b000),
> -	  NULL, get_id_isar0_el1, ID_ISAR0_EL1 },
> +	  access_id_reg, get_id_isar0_el1, ID_ISAR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b001),
> -	  NULL, get_id_isar1_el1, ID_ISAR1_EL1 },
> +	  access_id_reg, get_id_isar1_el1, ID_ISAR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b010),
> -	  NULL, get_id_isar2_el1, ID_ISAR2_EL1 },
> +	  access_id_reg, get_id_isar2_el1, ID_ISAR2_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b011),
> -	  NULL, get_id_isar3_el1, ID_ISAR3_EL1 },
> +	  access_id_reg, get_id_isar3_el1, ID_ISAR3_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b100),
> -	  NULL, get_id_isar4_el1, ID_ISAR4_EL1 },
> +	  access_id_reg, get_id_isar4_el1, ID_ISAR4_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b101),
> -	  NULL, get_id_isar5_el1, ID_ISAR5_EL1 },
> +	  access_id_reg, get_id_isar5_el1, ID_ISAR5_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b000),
> -	  NULL, get_mvfr0_el1, MVFR0_EL1 },
> +	  access_id_reg, get_mvfr0_el1, MVFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b001),
> -	  NULL, get_mvfr1_el1, MVFR1_EL1 },
> +	  access_id_reg, get_mvfr1_el1, MVFR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b010),
> -	  NULL, get_mvfr2_el1, MVFR2_EL1 },
> +	  access_id_reg, get_mvfr2_el1, MVFR2_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0100), Op2(0b000),
> -	  NULL, get_id_aa64pfr0_el1, ID_AA64PFR0_EL1 },
> +	  access_id_reg, get_id_aa64pfr0_el1, ID_AA64PFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0100), Op2(0b001),
> -	  NULL, get_id_aa64pfr1_el1, ID_AA64PFR1_EL1 },
> +	  access_id_reg, get_id_aa64pfr1_el1, ID_AA64PFR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b000),
> -	  NULL, get_id_aa64dfr0_el1, ID_AA64DFR0_EL1 },
> +	  access_id_reg, get_id_aa64dfr0_el1, ID_AA64DFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b001),
> -	  NULL, get_id_aa64dfr1_el1, ID_AA64DFR1_EL1 },
> +	  access_id_reg, get_id_aa64dfr1_el1, ID_AA64DFR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b100),
> -	  NULL, get_id_aa64afr0_el1, ID_AA64AFR0_EL1 },
> +	  access_id_reg, get_id_aa64afr0_el1, ID_AA64AFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b101),
> -	  NULL, get_id_aa64afr1_el1, ID_AA64AFR1_EL1 },
> +	  access_id_reg, get_id_aa64afr1_el1, ID_AA64AFR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0110), Op2(0b000),
> -	  NULL, get_id_aa64isar0_el1, ID_AA64ISAR0_EL1 },
> +	  access_id_reg, get_id_aa64isar0_el1, ID_AA64ISAR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0110), Op2(0b001),
> -	  NULL, get_id_aa64isar1_el1, ID_AA64ISAR1_EL1 },
> +	  access_id_reg, get_id_aa64isar1_el1, ID_AA64ISAR1_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b000),
> -	  NULL, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1 },
> +	  access_id_reg, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1 },
>  	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b001),
> -	  NULL, get_id_aa64mmfr1_el1, ID_AA64MMFR1_EL1 },
> +	  access_id_reg, get_id_aa64mmfr1_el1, ID_AA64MMFR1_EL1 },
>  	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b001),
> -	  NULL, get_clidr_el1, CLIDR_EL1 },
> +	  access_id_reg, get_clidr_el1, CLIDR_EL1 },
>  	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b111),
> -	  NULL, get_aidr_el1, AIDR_EL1 },
> +	  access_id_reg, get_aidr_el1, AIDR_EL1 },
>  	{ Op0(0b11), Op1(0b011), CRn(0b0000), CRm(0b0000), Op2(0b001),
> -	  NULL, get_ctr_el0, CTR_EL0 },
> +	  access_id_reg, get_ctr_el0, CTR_EL0 },
>  };
>  
>  /* Target specific emulation tables */
> @@ -1809,8 +1822,12 @@ static int emulate_sys_reg(struct kvm_vcpu *vcpu,
>  
>  	/* Search target-specific then generic table. */
>  	r = find_reg(params, table, num);
> -	if (!r)
> +	if (!r) {
>  		r = find_reg(params, sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
> +		if (!r)
> +			r = find_reg(params, invariant_sys_regs,
> +				     ARRAY_SIZE(invariant_sys_regs));
> +	}
>  
>  	if (likely(r)) {
>  		/*
> -- 
> 2.0.4
> 
> 
