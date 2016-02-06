Received: by 10.25.159.19 with SMTP id i19csp559614lfe;
        Sat, 6 Feb 2016 10:43:08 -0800 (PST)
X-Received: by 10.141.2.68 with SMTP id e65mr26199237qhd.64.1454784188357;
        Sat, 06 Feb 2016 10:43:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w138si22304985qhb.76.2016.02.06.10.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 10:43:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS7p5-0000pR-PN
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 13:43:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7p3-0000pB-PJ
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:43:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7oy-0003tb-JK
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:43:05 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:33528)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aS7oy-0003tW-6Y; Sat, 06 Feb 2016 13:43:00 -0500
Received: by mail-lb0-x244.google.com with SMTP id bc4so3434530lbc.0;
	Sat, 06 Feb 2016 10:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=IvnXvA+HYfOcMTZTTBtAegR0dozU5raFCgmwLIC0MuM=;
	b=atPOv1g8CDpuPEz1OWtixNE2/eeJDPMqs6oFqLBNt7qiEZBlrntAw4V4rR9eHleFhF
	BqKjC+kQmUGyW542C0tm0nhXOBsTHJNBqruTnmPQN8J7VCQQUuYTG3Y6YFJgpW0nK9IC
	rfwpEjWp3MOB63LvbZL85NpwT+Wgm7UPf+VkKvCDNxY7NXPB2aiGlO4vGHUBno1gjoXH
	l37+zDOoMpsT40CzX92gFzHCpjdGjs7Za7akoIReWnoRPjfPIIn3hzT5AsbEjTSNUQTA
	koQPzNZbE8mKsmmTTzpGlg7IqImAx56xB1Cn2IFS1G0HYXVyElRd3XeRR2um0BYH34I+
	J8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:references:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=IvnXvA+HYfOcMTZTTBtAegR0dozU5raFCgmwLIC0MuM=;
	b=TmZD7BesV2IWwwm764KZYYsZSXOE/FDJiOGKUHkUyGlFIGvThHUMyeuSYKykhgTGJ3
	byfjmS5P+WYu+XwzofLKYLstOMu57NVDYZAK5qA0j6+eoJn+f5DdenR+Cystr5YFbwjM
	CE6dfHbQnqXE2gyYIB9zYzAnp8gfXnsDwu9ty1zaCRTbs56BeBIqlK4mCbNpNWE6kZvS
	uLL427PxoKXs7xCawQvBqlOau4ILlTvF3WVhdACFG9btIXi7PVQk6v/BNDF6UeJEKvWn
	GufrEvzzkb5OiF7Aajo070Rclk0u9IMKBx8wGySPyjjf4rUE+/+y1o/wOWT79XDpdCvF
	X9JA==
X-Gm-Message-State: AG10YOTZfXTq1LEhapkn3jYGDn6LN7riO3zrO0xl9KLmdUZrJX2E/mFua79P+INiFpMy/w==
X-Received: by 10.112.202.70 with SMTP id kg6mr8504404lbc.2.1454784179181;
	Sat, 06 Feb 2016 10:42:59 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	n96sm2924578lfi.45.2016.02.06.10.42.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 10:42:57 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-3-git-send-email-peter.maydell@linaro.org>
Message-ID: <56B63EB1.8080905@gmail.com>
Date: Sat, 6 Feb 2016 21:42:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454506721-11843-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] target-arm: Implement
	MDCR_EL3 and SDCR
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
X-TUID: tuaubwXW4RxD

On 03.02.2016 16:38, Peter Maydell wrote:
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

Maybe we should also make a note that there is no secure EL1 if EL3 is
using AArch32 as it is done for ats_access()?

Kind regards,
Sergey

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

