Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2474586wro;
        Mon, 5 Nov 2018 03:48:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5ekWAndrByS6jsZFckobKiLQi1K+hqjqKRQO6qpaJF8tqRno4EEoTr5GhhomEqqVSOrNYKa
X-Received: by 2002:ae9:de46:: with SMTP id s67-v6mr1223169qkf.257.1541418492295;
        Mon, 05 Nov 2018 03:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541418492; cv=none;
        d=google.com; s=arc-20160816;
        b=WCG2WOVqV6wwZm/N/HJfh/KZJX24kSBwTBRsPLYmvC+7F9Dm6lWrv5QmzZ9bV5rLhr
         A69yEqsPVYf55PzHocCaIEAQ8Y5g6zr/+FPbAkG8DmTpQbOYutxvfHrLdTIxkdsLAgIu
         df3mTqnR9AlzoH9CpqcfpJQCXJoDgwDKg6S31QAjUqWp0S4XiWsRsHSKRpl7vp41lsTy
         StiYPoyQXPs8mw4QOZvsuSBoy8QZo2NX3Xz7MTnSJnLgB37sGpQl46Y+t4/KYpKBAnAM
         p8IB3Y7oYbtdGjsQJqTjLTicUN3owl7TgOjr1P+IU0rimru7HY+RHGwomYbCzNm3a0I1
         accg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=LlUa7QpDUCn3/tTBxcQ0pl6ARvqlnJeHFWxtDx5fOK0=;
        b=zBDECgOQYgBvQFRwuqe+6q530+DspBS4wA4T6hr8q31I9tmZbl9xYHT/OGwwuaC0wB
         OX7V7rHXohGKVdhbNwibv+PAloUpH61keseG/B1Uj+S7tvsDw/HbHr006dStSkHL5KAM
         QGUhr8j1jd3YKHA0VxGiHloU342jm+dMekM2f8kbW4dlT+mv83gmENlYj5m5ZExbjroe
         FDyR2LHuaFTNa87wcUmBUWtBY5LPfFnHmZ/7xB6qfvoQXRldfSsTsAuHxhcZv/KElrEA
         0ua2szPPcyQBtNKjbnYrkKQl6bouZGUIeK6NZXpaxjCfFl9KPdoQW3NalT3KUcPOEyq7
         XRpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k41si4707986qvh.67.2018.11.05.03.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 03:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJdMZ-0007Gu-Px
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 06:48:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.rutland@arm.com>) id 1gJdMP-0007Ga-8g
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 06:48:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.rutland@arm.com>) id 1gJdML-0006sx-VG
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 06:48:01 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:49106
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.rutland@arm.com>)
	id 1gJdML-0006VB-Mx; Mon, 05 Nov 2018 06:47:57 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9797180D;
	Mon,  5 Nov 2018 03:47:55 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41B203F5BD;
	Mon,  5 Nov 2018 03:47:54 -0800 (PST)
Date: Mon, 5 Nov 2018 11:47:51 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <20181105114751.7d3xulnflnmamjbq@lakrids.cambridge.arm.com>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
	<CAFEAcA_tcR_33Q+2ZFHdzo4_9khXggum=gRfZ8+L49KmP3hHiw@mail.gmail.com>
	<20181102193529.GB12057@e113682-lin.lund.arm.com>
	<effa3839-f0ab-e6ab-e034-a1a6d1d06923@linaro.org>
	<20181103123246.16b5b101@why.wild-wind.fr.eu.org>
	<1ee4127a-aa3e-4e19-1dde-af83147f8bc4@linaro.org>
	<86zhupdr03.wl-marc.zyngier@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zhupdr03.wl-marc.zyngier@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [PATCH v2 0/5] target/arm: KVM vs ARMISARegisters
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
	Richard Henderson <richard.henderson@linaro.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zCDAnGkKykdb

On Sun, Nov 04, 2018 at 11:25:00AM +0000, Marc Zyngier wrote:
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 22fbbdbece3c..d50f912d3f4a 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -314,10 +314,15 @@ static bool trap_raz_wi(struct kvm_vcpu *vcpu,
>  		return read_zero(vcpu, p);
>  }
>  
> -static bool trap_undef(struct kvm_vcpu *vcpu,
> -		       struct sys_reg_params *p,
> -		       const struct sys_reg_desc *r)

We should probably have a comment here, like:

/*
 * ARMv8.1 mandates at least a trivial LORegion implementation, where
 * all the RW registers are RES0 (which we can implement as RAZ/WI). On
 * an ARMv8.0 system, these registers should UNDEF.
 */

> +static bool trap_loregion(struct kvm_vcpu *vcpu,
> +			  struct sys_reg_params *p,
> +			  const struct sys_reg_desc *r)
>  {
> +	u64 val = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
> +
> +	if (val & (0xfUL << ID_AA64MMFR1_LOR_SHIFT))
> +		return trap_raz_wi(vcpu, p, r);
> +
>  	kvm_inject_undefined(vcpu);
>  	return false;
>  }
> @@ -1040,11 +1045,6 @@ static u64 read_id_reg(struct sys_reg_desc const *r, bool raz)
>  			kvm_debug("SVE unsupported for guests, suppressing\n");
>  
>  		val &= ~(0xfUL << ID_AA64PFR0_SVE_SHIFT);
> -	} else if (id == SYS_ID_AA64MMFR1_EL1) {
> -		if (val & (0xfUL << ID_AA64MMFR1_LOR_SHIFT))
> -			kvm_debug("LORegions unsupported for guests, suppressing\n");
> -
> -		val &= ~(0xfUL << ID_AA64MMFR1_LOR_SHIFT);
>  	}
>  
>  	return val;
> @@ -1330,11 +1330,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_MAIR_EL1), access_vm_reg, reset_unknown, MAIR_EL1 },
>  	{ SYS_DESC(SYS_AMAIR_EL1), access_vm_reg, reset_amair_el1, AMAIR_EL1 },
>  
> -	{ SYS_DESC(SYS_LORSA_EL1), trap_undef },
> -	{ SYS_DESC(SYS_LOREA_EL1), trap_undef },
> -	{ SYS_DESC(SYS_LORN_EL1), trap_undef },
> -	{ SYS_DESC(SYS_LORC_EL1), trap_undef },
> -	{ SYS_DESC(SYS_LORID_EL1), trap_undef },
> +	{ SYS_DESC(SYS_LORSA_EL1), trap_loregion },
> +	{ SYS_DESC(SYS_LOREA_EL1), trap_loregion },
> +	{ SYS_DESC(SYS_LORN_EL1), trap_loregion },
> +	{ SYS_DESC(SYS_LORC_EL1), trap_loregion },
> +	{ SYS_DESC(SYS_LORID_EL1), trap_loregion },

LORID_EL1 is always RO, so we need to UNDEF on writes. Either we add a
separate helper, or special-case LORID_EL1 in trap_loregion().

Otherwise, this looks good to me.

Thanks,
Mark.
