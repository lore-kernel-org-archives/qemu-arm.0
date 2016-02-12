Received: by 10.25.159.19 with SMTP id i19csp863934lfe;
        Fri, 12 Feb 2016 06:48:37 -0800 (PST)
X-Received: by 10.140.101.70 with SMTP id t64mr2304774qge.61.1455288516944;
        Fri, 12 Feb 2016 06:48:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si16104576qgz.58.2016.02.12.06.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:48:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUF1Q-0008MJ-G1
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 09:48:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUF1J-0008Am-Fo
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 09:48:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUF1D-0005ZA-NN
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 09:48:29 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aUF17-0005Xy-Kc; Fri, 12 Feb 2016 09:48:17 -0500
Received: by mail-pf0-x241.google.com with SMTP id w128so3487360pfb.2;
	Fri, 12 Feb 2016 06:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ht228FigfLjF6XipDFi4aZAsfLtiAzA03gdgCqEnWEk=;
	b=lCE3fw474KBH2DEIt2ETkTmyUdumUJqV/NPPqb119xrovpi6HPihGor5LULmQVmpcT
	fk1w0G0YCVuO9PaeE0jXIfQodiPdHv1YB8JI0fQy951r4F4VM3EwM7sGydHe3/2h6eTn
	9cTRJnd2bQ4j+Co1wlQIlLgU6nyxcAIw6QLArBsYk4VjrsirciZjSipTQfULQFmiKav6
	8K7rjz2PZV8zQ71tSAam88NaX1SjdcUrEk1x5EX6BYIoWRT9SAcm3pffqcyUk2ZkskrX
	TyKhobYyH7N6c4wDb9D/a2b4/f+53mhJrNFowvTEn+9YhKYsw0RDufIM7kB5GreWvS65
	M9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ht228FigfLjF6XipDFi4aZAsfLtiAzA03gdgCqEnWEk=;
	b=Z5dMzQqS1WuDvYlmYQmSvH/z/yzugUxUzyc0mdtdXusF2blG/lV+zanT+NIveoEYkI
	3FYGOSS0xfwnfwI1DMUomqFydnLOHCJJBUhwOhqXylTCtc3v5Qlp7eFGwmgkR97PPrLc
	cIRMxTyXOVZWgM7eckczOUHfKFv1s2IE0Zytj/vVbnFrZLP4BrzqS2gNL2XYkUpNuE04
	YjaGJ6P709jSuVoU/JXh8ZY9iK6FN0mWljlnbKx6+5HsjslQG2mKmTVP+fEx3vpGfsH4
	zJoFeHcpDwtp+W+JBorxJ60pc6Pn5S1VoRNYxNPzZHVdgMJ0NhYsLcQuggjO8Wt+d/Ry
	Wvkg==
X-Gm-Message-State: AG10YOQGhM6PC5lh5xhknF0j+HI8e6dXyWf+9vEMBWok3557LOrhGkSmJm/XrlA4zkyN2Q==
X-Received: by 10.98.34.84 with SMTP id i81mr2645282pfi.160.1455288496755;
	Fri, 12 Feb 2016 06:48:16 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	xv2sm20099602pab.10.2016.02.12.06.48.14
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 06:48:15 -0800 (PST)
Date: Fri, 12 Feb 2016 15:45:46 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160212144546.GD31433@toto>
References: <1455206609-28009-1-git-send-email-peter.maydell@linaro.org>
	<1455206609-28009-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455206609-28009-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH v2 1/6] target-arm: correct CNTFRQ access
	rights
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
X-TUID: B7i+zsKdWeza

On Thu, Feb 11, 2016 at 04:03:24PM +0000, Peter Maydell wrote:
> Correct some corner cases we were getting wrong for
> CNTFRQ access rights:
>  * should UNDEF from 32-bit Secure EL1
>  * only writable from the highest implemented exception level,
>    which might not be EL1 now
> 
> To clarify the code, provide a new utility function
> arm_highest_el() which returns the highest implemented
> exception level.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Rewritten to use arm_highest_el() to improve clarity
> ---
>  target-arm/cpu.h    | 12 ++++++++++++
>  target-arm/helper.c | 29 ++++++++++++++++++++++++++---
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 5137632..afbf366 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1255,6 +1255,18 @@ static inline bool cptype_valid(int cptype)
>  #define PL1_RW (PL1_R | PL1_W)
>  #define PL0_RW (PL0_R | PL0_W)
>  
> +/* Return the highest implemented Exception Level */
> +static inline int arm_highest_el(CPUARMState *env)
> +{
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        return 3;
> +    }
> +    if (arm_feature(env, ARM_FEATURE_EL2)) {
> +        return 2;
> +    }
> +    return 1;
> +}
> +
>  /* Return the current Exception Level (as per ARMv8; note that this differs
>   * from the ARMv7 Privilege Level).
>   */
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 2f9db72..4d27c00 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -1218,10 +1218,33 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
>  static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
>                                         bool isread)
>  {
> -    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero */
> -    if (arm_current_el(env) == 0 && !extract32(env->cp15.c14_cntkctl, 0, 2)) {
> -        return CP_ACCESS_TRAP;
> +    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero.
> +     * Writable only at the highest implemented exception level.
> +     */
> +    int el = arm_current_el(env);
> +
> +    switch (el) {
> +    case 0:
> +        if (!extract32(env->cp15.c14_cntkctl, 0, 2)) {
> +            return CP_ACCESS_TRAP;
> +        }
> +        break;
> +    case 1:
> +        if (!isread && ri->state == ARM_CP_STATE_AA32 &&
> +            arm_is_secure_below_el3(env)) {
> +            /* Accesses from 32-bit Secure EL1 UNDEF (*not* trap to EL3!) */
> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
> +        }
> +        break;
> +    case 2:
> +    case 3:
> +        break;
>      }
> +
> +    if (!isread && el < arm_highest_el(env)) {
> +        return CP_ACCESS_TRAP_UNCATEGORIZED;
> +    }
> +
>      return CP_ACCESS_OK;
>  }
>  
> -- 
> 1.9.1
> 
