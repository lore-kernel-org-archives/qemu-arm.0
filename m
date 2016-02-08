Received: by 10.25.159.19 with SMTP id i19csp1405509lfe;
        Mon, 8 Feb 2016 07:50:09 -0800 (PST)
X-Received: by 10.140.162.2 with SMTP id i2mr37507559qhi.44.1454946609447;
        Mon, 08 Feb 2016 07:50:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x69si30900896qha.127.2016.02.08.07.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 07:50:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSo4m-0003RV-Rq
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 10:50:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSo4l-0003Q5-0U
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSo4f-00031M-Sn
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:50:06 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:34958)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aSo4f-00030y-Fs; Mon, 08 Feb 2016 10:50:01 -0500
Received: by mail-lb0-x244.google.com with SMTP id dx9so4600852lbc.2;
	Mon, 08 Feb 2016 07:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=hHqsKSLR4QybzfgQTEdnpfTiqlYzHaI3afk2GnLBD4M=;
	b=ZhGtPFFdes33JwaCUNkWfrY6bvWnWwyfUT4L8RQdxTlMkYVjAbjoTIMBSInuOIfQFB
	DFAdZ67pE9pWp9NqlboLYOgX+gSuqou0AFj1MrgbJAAN0h2VtaWpHiOMFpZRvS49pyFr
	3qxGAN/GPQuYfvbOmA2R/THShgFb5uhG1Bg5OjPVqArqixk+bflT0wb/vBu+loJNb19i
	DFYXjDsSrFtWFcOPyBPW/UYdge6SVArRnsrrLHZ9xJPrSsgDnBadETlJ4o+ausfGLWIl
	YBTx6w3MQMuMvXjlNYeQDpm2gaW81r8L09udnMCib7Rq0ayxAKk0fmkRykGatXI1/plT
	FOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hHqsKSLR4QybzfgQTEdnpfTiqlYzHaI3afk2GnLBD4M=;
	b=AAol3h8Ckl3BFq4zogJ6pBG+R3FrZ8PYc0OA6s+v4H/v3un21YRq4QeAdzVn/lA0Xk
	W3lwGRVFHsfVhzjav1Pvt9UGvZUemHXcrFYAfSVrKwOzSi4UsjKXAuOOyRrDmMQA1f+d
	KYF8NmGOftxzkYAJqmAjxyxR2mAc9YcMOXdOo7AUtl5nNRcSmMY5/Ne9tOiuh4VmbGNM
	/ATvpzI2x576E4D53d/ra/l+xclQ/bRxfkldxDddNIpA1Y/o294An/lAuAi+vSSou5ZV
	XUJD/80uqIJkjEeBqVIaaWDK4W5s5CFjYwXsUmacFSOWkEVyzozriykClyPyTBn634LH
	k9pg==
X-Gm-Message-State: AG10YOSVgJD4KD1hUapLWfdclmqcLU+ekufBUEFtg1RbUy+qieB85hGZ+Wr8XxJVog2mCQ==
X-Received: by 10.112.25.99 with SMTP id b3mr4557101lbg.11.1454946600646;
	Mon, 08 Feb 2016 07:50:00 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	k3sm4079467lbp.9.2016.02.08.07.49.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 07:49:59 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-4-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B8B926.7020708@gmail.com>
Date: Mon, 8 Feb 2016 18:49:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454690704-16233-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 3/6] target-arm: Implement MDCR_EL3.TDOSA and
 MDCR_EL2.TDOSA traps
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
X-TUID: ez2UeFiy2Lpd

On 05.02.2016 19:45, Peter Maydell wrote:
> Implement the traps to EL2 and EL3 controlled by the bits
> MDCR_EL2.TDOSA MDCR_EL3.TDOSA. These can configurably trap
> accesses to the "powerdown debug" registers.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/cpu.h    | 12 ++++++++++++
>  target-arm/helper.c | 23 ++++++++++++++++++++++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 80391fa..d1d6886 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -595,6 +595,18 @@ void pmccntr_sync(CPUARMState *env);
>  #define CPTR_TTA      (1U << 20)
>  #define CPTR_TFP      (1U << 10)
>  
> +#define MDCR_EPMAD    (1U << 21)
> +#define MDCR_EDAD     (1U << 20)
> +#define MDCR_SPME     (1U << 17)
> +#define MDCR_SDD      (1U << 16)
> +#define MDCR_TDRA     (1U << 11)
> +#define MDCR_TDOSA    (1U << 10)
> +#define MDCR_TDA      (1U << 9)
> +#define MDCR_TDE      (1U << 8)
> +#define MDCR_HPME     (1U << 7)
> +#define MDCR_TPM      (1U << 6)
> +#define MDCR_TPMCR    (1U << 5)
> +
>  #define CPSR_M (0x1fU)
>  #define CPSR_T (1U << 5)
>  #define CPSR_F (1U << 6)
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 082701a..18e85fd 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -384,6 +384,24 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
>      return CP_ACCESS_TRAP_UNCATEGORIZED;
>  }
>  
> +/* Check for traps to "powerdown debug" registers, which are controlled
> + * by MDCR.TDOSA
> + */
> +static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                   bool isread)
> +{
> +    int el = arm_current_el(env);
> +
> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDOSA)
> +        && !arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDOSA)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    return CP_ACCESS_OK;
> +}
> +
>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -3779,15 +3797,18 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>      { .name = "OSLAR_EL1", .state = ARM_CP_STATE_BOTH,
>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
>        .access = PL1_W, .type = ARM_CP_NO_RAW,
> +      .accessfn = access_tdosa,
>        .writefn = oslar_write },
>      { .name = "OSLSR_EL1", .state = ARM_CP_STATE_BOTH,
>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 4,
>        .access = PL1_R, .resetvalue = 10,
> +      .accessfn = access_tdosa,
>        .fieldoffset = offsetof(CPUARMState, cp15.oslsr_el1) },
>      /* Dummy OSDLR_EL1: 32-bit Linux will read this */
>      { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
> -      .access = PL1_RW, .type = ARM_CP_NOP },
> +      .access = PL1_RW, .accessfn = access_tdosa,
> +      .type = ARM_CP_NOP },
>      /* Dummy DBGVCR: Linux wants to clear this on startup, but we don't
>       * implement vector catch debug events yet.
>       */

