Received: by 10.25.77.4 with SMTP id a4csp325597lfb;
        Thu, 9 Mar 2017 02:19:30 -0800 (PST)
X-Received: by 10.55.11.141 with SMTP id 135mr12451251qkl.260.1489054770772;
        Thu, 09 Mar 2017 02:19:30 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m67si5319544qkl.180.2017.03.09.02.19.30;
        Thu, 09 Mar 2017 02:19:30 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id CC90840A14;
	Thu,  9 Mar 2017 05:18:04 -0500 (EST)
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
	with ESMTP id eZw8NLOIGsY5; Thu,  9 Mar 2017 05:18:03 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 72DC540A54;
	Thu,  9 Mar 2017 05:18:03 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id EEEAC40A14
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 05:18:02 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSwNNccxshdZ for <kvmarm@lists.cs.columbia.edu>;
 Thu,  9 Mar 2017 05:18:01 -0500 (EST)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id F231D40625
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 05:18:00 -0500 (EST)
Received: by mail-wm0-f44.google.com with SMTP id n11so52156434wma.0
 for <kvmarm@lists.cs.columbia.edu>; Thu, 09 Mar 2017 02:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=J8+CNtfJuuc0rHv0J780WJi9khvlXXByp41yRQSUdAc=;
 b=QZ7Mt8EFDsrmJwVlGUiVZJLHLJ1lSapKjNgUVkUEqYuO/hDmWaNjbqgcnM0TsBCBN2
 IUnbdPAd0Nxhx5ACxubDUw7fmowmD/FqSWoaYNrYW3v3xdklautIEBDiae8a+9SKqnTY
 Uu0SNCocdcI/8azUdhpMHtufjEaAgA4qKBZIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J8+CNtfJuuc0rHv0J780WJi9khvlXXByp41yRQSUdAc=;
 b=cN0cVglQMoxtwcCjmtsO5/QCfqfwwLV51sdn7Txvm7DAfih6gmDr4EDqCLADjYlH5a
 Z2KXHXdq3tLPOX9ZxWkj0WMGesAE3jgWlsI6VzisWwcXR2AxafsEZ5kirQBQnBu+P/oH
 jDOTnzBZfVHJki7SdjhEWv9r3byR2sXcM61t+W1brQxRumjFVb/jWysG3TU7oegz6kMu
 l1DrhF82M1eK/wMOF0pnVRoVJaFhqjjzvxwZwb+UDinXPKg+qprOrybeG0JTAreNEsJ5
 R50r8wazjSc1msDCDTGPj9a6jzIq7c8y0rOpic1Mi+xCFCwBYInD9jQ7lwhAxP863aCK
 8UYw==
X-Gm-Message-State: AMke39nbOAicfBLNL8WMm+EpM60uwKbqLn8hz+/TomL96FSKIjyrC20zLN3CiaQ/wKV9SRsU
X-Received: by 10.28.147.147 with SMTP id v141mr29697441wmd.110.1489054764670; 
 Thu, 09 Mar 2017 02:19:24 -0800 (PST)
Received: from localhost ([109.74.56.122])
 by smtp.gmail.com with ESMTPSA id b17sm8188514wma.33.2017.03.09.02.19.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Mar 2017 02:19:24 -0800 (PST)
Date: Thu, 9 Mar 2017 02:19:23 -0800
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [PATCH RFC 2/7] ARM64: KVM: Add reset handlers for all ID
 registers
Message-ID: <20170309101923.GA114809@lvm>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-3-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1484559214-2248-3-git-send-email-zhaoshenglong@huawei.com>
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
X-TUID: JERaHjEzPR5K

On Mon, Jan 16, 2017 at 05:33:29PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Move invariant_sys_regs before emulate_sys_reg so that it can be used
> later.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 193 ++++++++++++++++++++++++++++------------------
>  1 file changed, 116 insertions(+), 77 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 87e7e66..bf71eb4 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1432,6 +1432,122 @@ static const struct sys_reg_desc cp15_64_regs[] = {
>  	{ Op1( 1), CRn( 0), CRm( 2), Op2( 0), access_vm_reg, NULL, c2_TTBR1 },
>  };
>  
> +/*
> + * These are the invariant sys_reg registers: we let the guest see the
> + * host versions of these, so they're part of the guest state.
> + *
> + * A future CPU may provide a mechanism to present different values to
> + * the guest, or a future kvm may trap them.
> + */
> +
> +#define FUNCTION_INVARIANT(reg)						\
> +	static void get_##reg(struct kvm_vcpu *v,			\
> +			      const struct sys_reg_desc *r)		\
> +	{								\
> +		((struct sys_reg_desc *)r)->val = read_sysreg(reg);	\
> +	}
> +
> +FUNCTION_INVARIANT(midr_el1)
> +FUNCTION_INVARIANT(ctr_el0)
> +FUNCTION_INVARIANT(revidr_el1)
> +FUNCTION_INVARIANT(id_pfr0_el1)
> +FUNCTION_INVARIANT(id_pfr1_el1)
> +FUNCTION_INVARIANT(id_dfr0_el1)
> +FUNCTION_INVARIANT(id_afr0_el1)
> +FUNCTION_INVARIANT(id_mmfr0_el1)
> +FUNCTION_INVARIANT(id_mmfr1_el1)
> +FUNCTION_INVARIANT(id_mmfr2_el1)
> +FUNCTION_INVARIANT(id_mmfr3_el1)
> +FUNCTION_INVARIANT(id_isar0_el1)
> +FUNCTION_INVARIANT(id_isar1_el1)
> +FUNCTION_INVARIANT(id_isar2_el1)
> +FUNCTION_INVARIANT(id_isar3_el1)
> +FUNCTION_INVARIANT(id_isar4_el1)
> +FUNCTION_INVARIANT(id_isar5_el1)
> +FUNCTION_INVARIANT(mvfr0_el1)
> +FUNCTION_INVARIANT(mvfr1_el1)
> +FUNCTION_INVARIANT(mvfr2_el1)
> +FUNCTION_INVARIANT(id_aa64pfr0_el1)
> +FUNCTION_INVARIANT(id_aa64pfr1_el1)
> +FUNCTION_INVARIANT(id_aa64dfr0_el1)
> +FUNCTION_INVARIANT(id_aa64dfr1_el1)
> +FUNCTION_INVARIANT(id_aa64afr0_el1)
> +FUNCTION_INVARIANT(id_aa64afr1_el1)
> +FUNCTION_INVARIANT(id_aa64isar0_el1)
> +FUNCTION_INVARIANT(id_aa64isar1_el1)
> +FUNCTION_INVARIANT(id_aa64mmfr0_el1)
> +FUNCTION_INVARIANT(id_aa64mmfr1_el1)
> +FUNCTION_INVARIANT(clidr_el1)
> +FUNCTION_INVARIANT(aidr_el1)
> +
> +/* ->val is filled in by kvm_sys_reg_table_init() */
> +static struct sys_reg_desc invariant_sys_regs[] = {
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b000),
> +	  NULL, get_midr_el1, MIDR_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b110),
> +	  NULL, get_revidr_el1, REVIDR_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b000),
> +	  NULL, get_id_pfr0_el1, ID_PFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b001),
> +	  NULL, get_id_pfr1_el1, ID_PFR1_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b010),
> +	  NULL, get_id_dfr0_el1, ID_DFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b011),
> +	  NULL, get_id_afr0_el1, ID_AFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b100),
> +	  NULL, get_id_mmfr0_el1, ID_MMFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b101),
> +	  NULL, get_id_mmfr1_el1, ID_MMFR1_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b110),
> +	  NULL, get_id_mmfr2_el1, ID_MMFR2_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b111),
> +	  NULL, get_id_mmfr3_el1, ID_MMFR3_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b000),
> +	  NULL, get_id_isar0_el1, ID_ISAR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b001),
> +	  NULL, get_id_isar1_el1, ID_ISAR1_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b010),
> +	  NULL, get_id_isar2_el1, ID_ISAR2_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b011),
> +	  NULL, get_id_isar3_el1, ID_ISAR3_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b100),
> +	  NULL, get_id_isar4_el1, ID_ISAR4_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b101),
> +	  NULL, get_id_isar5_el1, ID_ISAR5_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b000),
> +	  NULL, get_mvfr0_el1, MVFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b001),
> +	  NULL, get_mvfr1_el1, MVFR1_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b010),
> +	  NULL, get_mvfr2_el1, MVFR2_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0100), Op2(0b000),
> +	  NULL, get_id_aa64pfr0_el1, ID_AA64PFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0100), Op2(0b001),
> +	  NULL, get_id_aa64pfr1_el1, ID_AA64PFR1_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b000),
> +	  NULL, get_id_aa64dfr0_el1, ID_AA64DFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b001),
> +	  NULL, get_id_aa64dfr1_el1, ID_AA64DFR1_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b100),
> +	  NULL, get_id_aa64afr0_el1, ID_AA64AFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b101),
> +	  NULL, get_id_aa64afr1_el1, ID_AA64AFR1_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0110), Op2(0b000),
> +	  NULL, get_id_aa64isar0_el1, ID_AA64ISAR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0110), Op2(0b001),
> +	  NULL, get_id_aa64isar1_el1, ID_AA64ISAR1_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b000),
> +	  NULL, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1 },
> +	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b001),
> +	  NULL, get_id_aa64mmfr1_el1, ID_AA64MMFR1_EL1 },
> +	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b001),
> +	  NULL, get_clidr_el1, CLIDR_EL1 },
> +	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b111),
> +	  NULL, get_aidr_el1, AIDR_EL1 },
> +	{ Op0(0b11), Op1(0b011), CRn(0b0000), CRm(0b0000), Op2(0b001),
> +	  NULL, get_ctr_el0, CTR_EL0 },
> +};
> +
>  /* Target specific emulation tables */
>  static struct kvm_sys_reg_target_table *target_tables[KVM_ARM_NUM_TARGETS];
>  
> @@ -1822,83 +1938,6 @@ static const struct sys_reg_desc *index_to_sys_reg_desc(struct kvm_vcpu *vcpu,
>  	return r;
>  }
>  
> -/*
> - * These are the invariant sys_reg registers: we let the guest see the
> - * host versions of these, so they're part of the guest state.
> - *
> - * A future CPU may provide a mechanism to present different values to
> - * the guest, or a future kvm may trap them.
> - */
> -
> -#define FUNCTION_INVARIANT(reg)						\
> -	static void get_##reg(struct kvm_vcpu *v,			\
> -			      const struct sys_reg_desc *r)		\
> -	{								\
> -		((struct sys_reg_desc *)r)->val = read_sysreg(reg);	\
> -	}
> -
> -FUNCTION_INVARIANT(midr_el1)
> -FUNCTION_INVARIANT(ctr_el0)
> -FUNCTION_INVARIANT(revidr_el1)
> -FUNCTION_INVARIANT(id_pfr0_el1)
> -FUNCTION_INVARIANT(id_pfr1_el1)
> -FUNCTION_INVARIANT(id_dfr0_el1)
> -FUNCTION_INVARIANT(id_afr0_el1)
> -FUNCTION_INVARIANT(id_mmfr0_el1)
> -FUNCTION_INVARIANT(id_mmfr1_el1)
> -FUNCTION_INVARIANT(id_mmfr2_el1)
> -FUNCTION_INVARIANT(id_mmfr3_el1)
> -FUNCTION_INVARIANT(id_isar0_el1)
> -FUNCTION_INVARIANT(id_isar1_el1)
> -FUNCTION_INVARIANT(id_isar2_el1)
> -FUNCTION_INVARIANT(id_isar3_el1)
> -FUNCTION_INVARIANT(id_isar4_el1)
> -FUNCTION_INVARIANT(id_isar5_el1)
> -FUNCTION_INVARIANT(clidr_el1)
> -FUNCTION_INVARIANT(aidr_el1)
> -
> -/* ->val is filled in by kvm_sys_reg_table_init() */
> -static struct sys_reg_desc invariant_sys_regs[] = {
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b000),
> -	  NULL, get_midr_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b110),
> -	  NULL, get_revidr_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b000),
> -	  NULL, get_id_pfr0_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b001),
> -	  NULL, get_id_pfr1_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b010),
> -	  NULL, get_id_dfr0_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b011),
> -	  NULL, get_id_afr0_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b100),
> -	  NULL, get_id_mmfr0_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b101),
> -	  NULL, get_id_mmfr1_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b110),
> -	  NULL, get_id_mmfr2_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b111),
> -	  NULL, get_id_mmfr3_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b000),
> -	  NULL, get_id_isar0_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b001),
> -	  NULL, get_id_isar1_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b010),
> -	  NULL, get_id_isar2_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b011),
> -	  NULL, get_id_isar3_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b100),
> -	  NULL, get_id_isar4_el1 },
> -	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b101),
> -	  NULL, get_id_isar5_el1 },
> -	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b001),
> -	  NULL, get_clidr_el1 },
> -	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b111),
> -	  NULL, get_aidr_el1 },
> -	{ Op0(0b11), Op1(0b011), CRn(0b0000), CRm(0b0000), Op2(0b001),
> -	  NULL, get_ctr_el0 },
> -};
> -
>  static int reg_from_user(u64 *val, const void __user *uaddr, u64 id)
>  {
>  	if (copy_from_user(val, uaddr, KVM_REG_SIZE(id)) != 0)
> -- 
> 2.0.4
> 


Can we avoid this amount of churn by just adding a prototype above or do
something else like that?

Thanks,
-Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
