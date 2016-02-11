Received: by 10.25.159.19 with SMTP id i19csp305818lfe;
        Thu, 11 Feb 2016 08:10:50 -0800 (PST)
X-Received: by 10.140.96.245 with SMTP id k108mr58716774qge.31.1455207050470;
        Thu, 11 Feb 2016 08:10:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81si10214045qhz.3.2016.02.11.08.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 08:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTtpR-0001uw-Rm
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 11:10:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aTtpL-0001ud-Hr
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 11:10:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aTtpF-0001hV-M1
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 11:10:43 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aTtpE-0001hO-Vt; Thu, 11 Feb 2016 11:10:37 -0500
Received: by mail-lf0-x241.google.com with SMTP id j99so2912264lfi.2;
	Thu, 11 Feb 2016 08:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=6ECHC+5KPgOHBAAwhbBXWLZ+wzUvMYRQne7CoS7X0IE=;
	b=CBd2FoctXBoYrArboFB+O/ZKi9b/r9FLMPwOaAVGsHngqFpBeMZFa0tazcD1VGY/Il
	Km6osUCnONkjTSAB9KpfXoOGwilx+2SxRTnqEwfKEjtxlihpMlzFxfHXalVOO5AqVDni
	Jz2yzg2suVDdvNPwn3wGk0T+U3dl5qOfavUHP0A/RW7oCC7OG0z474IRMR0+L2Msg3a/
	HN0dVA/UvUmfLCO+xpYj1De+rgz1xB6Dh0yfRJLSC+esiZ3Ocos4w3YohaOXTHOMBSLx
	L0IWL9EaBBwSoz6b/xgGNr7rsCDf0iuO/blAZ59ByAn7/kJmpx9rMJ6fTsb46vCUoIld
	14MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=6ECHC+5KPgOHBAAwhbBXWLZ+wzUvMYRQne7CoS7X0IE=;
	b=kdFsojUaOY3853TfNieL4e/GHc1Yz4mbp8rugTW5xQm+K3tyAyVDvVEonKxQmh0CRG
	wAzr+kURcxnF2EyRfqxsc9OQGT06PXUEP7Nw9oOiB8OLTpfN3p5MRU5DbnNOoKsqr9iM
	ep8mRiiGxebWYPUWriW391kgwY9Wwcd6tb26YZKmMQPgPGA6vY6EPMptjykJU2QZ5iwT
	FbMmPrp2vrtvaHudrET4Pvl/ZKmpwWn8ZQrkUEhWN9k1Cha6ZxPYUB/WUn+AMVG3QidG
	T2Y2IrMw3FIKx9937QH/Gbg9MYUTnTe6uaX00xpxuL17Ohgl39oViAUhTo91h4UIVfcS
	cqxA==
X-Gm-Message-State: AG10YORGl0pwYj/msellP82oAtjUiDEBZXWHk9Y34tqkR4w0n7UV0gv2ECykSlEEGIugYQ==
X-Received: by 10.25.21.90 with SMTP id l87mr18781821lfi.64.1455207035817;
	Thu, 11 Feb 2016 08:10:35 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	n96sm1322380lfi.45.2016.02.11.08.10.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 08:10:34 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455206609-28009-1-git-send-email-peter.maydell@linaro.org>
	<1455206609-28009-2-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56BCB279.8050403@gmail.com>
Date: Thu, 11 Feb 2016 19:10:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455206609-28009-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: qemu-arm@nongnu.org, patches@linaro.org
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
X-TUID: nmTIcOEefMMW

On 11.02.2016 19:03, Peter Maydell wrote:
> Correct some corner cases we were getting wrong for
> CNTFRQ access rights:
>  * should UNDEF from 32-bit Secure EL1
>  * only writable from the highest implemented exception level,
>    which might not be EL1 now
>
> To clarify the code, provide a new utility function
> arm_highest_el() which returns the highest implemented
> exception level.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

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

