Received: by 10.25.159.19 with SMTP id i19csp415128lfe;
        Sat, 6 Feb 2016 04:10:08 -0800 (PST)
X-Received: by 10.140.109.100 with SMTP id k91mr23029352qgf.54.1454760607975;
        Sat, 06 Feb 2016 04:10:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w132si20861868qka.53.2016.02.06.04.10.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 04:10:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS1gl-0004Ym-Cf
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 07:10:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS1gi-0004Wh-UW
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 07:10:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS1gi-00058Q-0D
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 07:10:04 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:33077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aS1gd-00057q-Bn; Sat, 06 Feb 2016 07:09:59 -0500
Received: by mail-pa0-x242.google.com with SMTP id pv5so3613031pac.0;
	Sat, 06 Feb 2016 04:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lvGvrQKpBmvCE1poxoOVI5zqVpN0lW92Jpaq+UqDInE=;
	b=SqCgOKhz553rgdxPJaMAsU7z4MKAxiZliHOkI7E2rCxpnW3itA9kOVwxcJeig7Fj0k
	UO1eMTB3Pu8apNJDU6YFpu12KbTilcvjfSQEALbAwm0kN0MhJvpamxbNMmnuj+6nTMjM
	neOaDTORKUOJdAThYxdascm5MRE9jk1vXdlFzA+wjW5MVqlCjGZPas3wHAbN8WCd2rul
	TI6P3WlZUCjb/zvkoq/JkOhxNlyAoTnonDE7lCs/A2mEY3GGy6T+Q7JaXTVelHFWjgAk
	tIpbwbcrAQwpdJwyqcDLwKZNKqyk/FWlXw7B6VdT2NAI+wovy4gMB/3IzeJ7OCuy4U9E
	0H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=lvGvrQKpBmvCE1poxoOVI5zqVpN0lW92Jpaq+UqDInE=;
	b=CzqoFkEQmsZJlo1ACGX/7CAsRZEYtozXeU+nSxXFnrqf9Yg/zGeO8BK7qC5MFMbow+
	3Bojiev47fGO7XsrByvuPRAEMZ+byiahQP80XIbLexVRIMOJDbmdkI8BeGdk3IPbuhkp
	ywU0UNx2MJkiWq1JdkROEtrr8V5mOw2EN0bf8A+heE2v6DoYm0Kj+KZuOSmN4TlDT+8E
	Ydxcq43lQJ6l6jaNiY/fhAoJy2JwzOeRjcIfVxf2EgTjuHNVMt4pwi3QmOzmwI8T1A6g
	h8CG7Y90vh0eDBsfNI+G6gNo9LtoxftZ4r51PoOnAoJd3S4gWkmODIJ1sT8oWwShs/Wh
	xGOg==
X-Gm-Message-State: AG10YOT0HbeXyhrkoQacHfdzPltZSvmms9D+olsVEe0UPlyj2zZHLnS7wTEPNfTC65pVaw==
X-Received: by 10.66.124.200 with SMTP id mk8mr27446255pab.43.1454760598615;
	Sat, 06 Feb 2016 04:09:58 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	o90sm31005677pfi.17.2016.02.06.04.09.57
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 04:09:57 -0800 (PST)
Date: Sat, 6 Feb 2016 13:04:03 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160206120403.GB3913@toto>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454506721-11843-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 2/7] target-arm: Implement MDCR_EL3 and SDCR
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
X-TUID: 8fEUtQ2VToO9

On Wed, Feb 03, 2016 at 01:38:36PM +0000, Peter Maydell wrote:
> Implement the MDCR_EL3 register (which is SDCR for AArch32).
> For the moment we implement it as reads-as-written.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h    |  1 +
>  target-arm/helper.c | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 52284e9..cf2df50 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -382,6 +382,7 @@ typedef struct CPUARMState {
>          uint64_t mdscr_el1;
>          uint64_t oslsr_el1; /* OS Lock Status */
>          uint64_t mdcr_el2;
> +        uint64_t mdcr_el3;


Should we maybe arrayify these even if we waste space?

Anyway:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



>          /* If the counter is enabled, this stores the last time the counter
>           * was reset. Otherwise it stores the counter value
>           */
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index b631b83..8b96b80 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -364,6 +364,23 @@ static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
>      return CP_ACCESS_OK;
>  }
>  
> +/* Some secure-only AArch32 registers trap to EL3 if used from
> + * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
> + * We assume that the .access field is set to PL1_RW.
> + */
> +static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
> +                                            const ARMCPRegInfo *ri)
> +{
> +    if (arm_current_el(env) == 3) {
> +        return CP_ACCESS_OK;
> +    }
> +    if (arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    /* This will be EL1 NS and EL2 NS, which just UNDEF */
> +    return CP_ACCESS_TRAP_UNCATEGORIZED;
> +}
> +
>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -3532,6 +3549,13 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL3_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
>        .writefn = scr_write },
> +    { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
> +      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
> +    { .name = "SDCR", .type = ARM_CP_ALIAS,
> +      .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
>      { .name = "SDER32_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 1,
>        .access = PL3_RW, .resetvalue = 0,
> -- 
> 1.9.1
> 
