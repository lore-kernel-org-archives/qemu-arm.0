Received: by 10.25.159.19 with SMTP id i19csp3076344lfe;
        Wed, 20 Jan 2016 04:20:21 -0800 (PST)
X-Received: by 10.140.162.130 with SMTP id i124mr47307790qhi.44.1453292421795;
        Wed, 20 Jan 2016 04:20:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z134si43492392qkz.51.2016.01.20.04.20.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 04:20:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLrkL-0006HR-7B
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 07:20:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aLrkE-00068w-E2
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 07:20:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aLrkA-0002nn-4q
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 07:20:14 -0500
Received: from mail-ob0-x244.google.com ([2607:f8b0:4003:c01::244]:35393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aLrk3-0002ki-Qw; Wed, 20 Jan 2016 07:20:03 -0500
Received: by mail-ob0-x244.google.com with SMTP id tr5so459126obc.2;
	Wed, 20 Jan 2016 04:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VhiPU9yZr6W36ZSqm7aciKHM/JoZaEQnAq60E6xwEsM=;
	b=OeuegIs5bpbDOkl98RLYZ8DFEp6y6frEOoJNuW1Buh1qQ46NNk1MU9gDyW9dgAhwxL
	/MDcziM80LoGynRYHVzPwtkmFXX4tF65rTVIdL2wZaR0uItBKxBpXI84frPRXS8/uxTp
	5d+T9UmNM7mkjaIq6mccn0Bb1rYWP8cRljocUGbtYkagCJ0XGwy1NetcVU8kvGnIWY+h
	7aUkjp5r+egW0S9PPhCF1tPNhBf/ObAYTvw/42KsysVtEmxSO5uH5xzqkPeXYVrtZ7M1
	V3gQvW9IHfIR9Xmwk1Evuu/zAWiWxkCVBl6z0wiwMGaXhaFyR67GfnQ2bLDaLnN4/AaT
	gyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=VhiPU9yZr6W36ZSqm7aciKHM/JoZaEQnAq60E6xwEsM=;
	b=T7NiC1T5/YTirBggEezU6eM+Fr3YAw8+03puDbHz0f8jPRFeb9abfMZA4w/rFo6zob
	lv0KdCifHye5yIawdluu/0zqdzni00Ic7M0EaivYQkxWsRRbDEYRtY3TdGBypxyuMh8N
	vt1ulWqfdH+C29+KRhiXj/I9nE4m6uRdsbYI02NsRWCFtTomytKe+mPLx2/zWwx1irqC
	i7ilwpcchmBz/9aLFRHLpSWimsD6laKpPBC/pBIdqCw8BZkM7E5zTUnzftVrYcnVx2PC
	6TdITMjzR0vsNKjTs+y0V5vTiNsYkFqKPtbom+isTzEaVL4jumPx9cqcUjKzZexrzoMa
	rRZw==
X-Gm-Message-State: ALoCoQnhQMGy8LbLHer/92or1VuW9GjOElBuVn+oRbHPLg5O1SDmbbo3HPqhfzxBK35JYNS/WI7BgsSBts/8OMggh4dNTeq4yg==
X-Received: by 10.60.138.67 with SMTP id qo3mr27018169oeb.80.1453292403413;
	Wed, 20 Jan 2016 04:20:03 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	l19sm18037516oig.27.2016.01.20.04.20.01
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 04:20:02 -0800 (PST)
Date: Wed, 20 Jan 2016 13:19:58 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160120121958.GV29396@toto>
References: <1453227802-9991-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453227802-9991-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::244
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] target-arm: Make various system registers
	visible to EL3
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MIVv+cQrWsgJ

On Tue, Jan 19, 2016 at 06:23:22PM +0000, Peter Maydell wrote:
> The AArch64 system registers DACR32_EL2, IFSR32_EL2, SPSR_IRQ,
> SPSR_ABT, SPSR_UND and SPSR_FIQ are visible and fully functional from
> EL3 even if the CPU has no EL2 (unlike some others which are RES0
> from EL3 in that configuration).  Move them from el2_cp_reginfo[] to
> v8_cp_reginfo[] so they are always present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/helper.c | 58 ++++++++++++++++++++++++++---------------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index e8ede3f..999c617 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3166,6 +3166,35 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]),
>        .access = PL2_RW, .accessfn = fpexc32_access },
> +    { .name = "DACR32_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 0, .opc2 = 0,
> +      .access = PL2_RW, .resetvalue = 0,
> +      .writefn = dacr_write, .raw_writefn = raw_write,
> +      .fieldoffset = offsetof(CPUARMState, cp15.dacr32_el2) },
> +    { .name = "IFSR32_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 0, .opc2 = 1,
> +      .access = PL2_RW, .resetvalue = 0,
> +      .fieldoffset = offsetof(CPUARMState, cp15.ifsr32_el2) },
> +    { .name = "SPSR_IRQ", .state = ARM_CP_STATE_AA64,
> +      .type = ARM_CP_ALIAS,
> +      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 0,
> +      .access = PL2_RW,
> +      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_IRQ]) },
> +    { .name = "SPSR_ABT", .state = ARM_CP_STATE_AA64,
> +      .type = ARM_CP_ALIAS,
> +      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 1,
> +      .access = PL2_RW,
> +      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_ABT]) },
> +    { .name = "SPSR_UND", .state = ARM_CP_STATE_AA64,
> +      .type = ARM_CP_ALIAS,
> +      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 2,
> +      .access = PL2_RW,
> +      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_UND]) },
> +    { .name = "SPSR_FIQ", .state = ARM_CP_STATE_AA64,
> +      .type = ARM_CP_ALIAS,
> +      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 3,
> +      .access = PL2_RW,
> +      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_FIQ]) },
>      REGINFO_SENTINEL
>  };
>  
> @@ -3293,11 +3322,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
>        .writefn = hcr_write },
> -    { .name = "DACR32_EL2", .state = ARM_CP_STATE_AA64,
> -      .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 0, .opc2 = 0,
> -      .access = PL2_RW, .resetvalue = 0,
> -      .writefn = dacr_write, .raw_writefn = raw_write,
> -      .fieldoffset = offsetof(CPUARMState, cp15.dacr32_el2) },
>      { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS,
>        .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
> @@ -3307,10 +3331,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .type = ARM_CP_ALIAS,
>        .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[2]) },
> -    { .name = "IFSR32_EL2", .state = ARM_CP_STATE_AA64,
> -      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 0, .opc2 = 1,
> -      .access = PL2_RW, .resetvalue = 0,
> -      .fieldoffset = offsetof(CPUARMState, cp15.ifsr32_el2) },
>      { .name = "FAR_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.far_el[2]) },
> @@ -3319,26 +3339,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 0,
>        .access = PL2_RW,
>        .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_HYP]) },
> -    { .name = "SPSR_IRQ", .state = ARM_CP_STATE_AA64,
> -      .type = ARM_CP_ALIAS,
> -      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 0,
> -      .access = PL2_RW,
> -      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_IRQ]) },
> -    { .name = "SPSR_ABT", .state = ARM_CP_STATE_AA64,
> -      .type = ARM_CP_ALIAS,
> -      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 1,
> -      .access = PL2_RW,
> -      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_ABT]) },
> -    { .name = "SPSR_UND", .state = ARM_CP_STATE_AA64,
> -      .type = ARM_CP_ALIAS,
> -      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 2,
> -      .access = PL2_RW,
> -      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_UND]) },
> -    { .name = "SPSR_FIQ", .state = ARM_CP_STATE_AA64,
> -      .type = ARM_CP_ALIAS,
> -      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 3,
> -      .access = PL2_RW,
> -      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_FIQ]) },
>      { .name = "VBAR_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
>        .access = PL2_RW, .writefn = vbar_write,
> -- 
> 1.9.1
> 
