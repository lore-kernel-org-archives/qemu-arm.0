Received: by 10.25.159.19 with SMTP id i19csp3243910lfe;
        Wed, 20 Jan 2016 09:22:29 -0800 (PST)
X-Received: by 10.140.16.225 with SMTP id 88mr47823867qgb.96.1453310549588;
        Wed, 20 Jan 2016 09:22:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t138si36600485qhb.115.2016.01.20.09.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 09:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLwSi-0004qy-Uw
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 12:22:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aLwSc-0004o3-I9
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 12:22:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aLwSZ-0003D8-5U
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 12:22:22 -0500
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b]:34289)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aLwSY-0003CP-Oh; Wed, 20 Jan 2016 12:22:19 -0500
Received: by mail-lb0-x22b.google.com with SMTP id cl12so9100975lbc.1;
	Wed, 20 Jan 2016 09:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=lOOruSylSvEYDevjOxLW2g0FXz9WaFqu2dKq5UP/Q1Y=;
	b=e15NVIYtJs24/jT0t7ULEsE4LYcrh7vaynTfEzabUh4RK2YlLucpn7ILxHK70DxFJz
	4sbFpO0u/r/pPnuiWiLQK4dQ0F2Pm6w44w3r5AdJM/Xz/g8N/Zo7CrsFn5MLbbD8qdaY
	TNjuzA1JvcLaPPRp5xtr5x43h5yxjPO3ELO8oOUmrdI87txNMsWe5EyJn3wq6kaQE+mp
	/VRdmE04WfVT/lj1AZXZ+P3h5uJrdyykCf7u4OL5P0krbShzC8SJfV+6bRGu5wIbTYfI
	LBfWoccsRcQ5fPJdS+R1v1wUN+YXdV64rVYYOPytYK5K0wTVwwiv/yNTefWFeZSjzaIW
	KSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lOOruSylSvEYDevjOxLW2g0FXz9WaFqu2dKq5UP/Q1Y=;
	b=JciJAnyaJx7iWv71JpkfQ3b+Mp+gAqns1SRPEbF6vGLCfR7Bndrxvcj6ZuOKlH2hP9
	vUJ+FrpH24sH17MpP57PjYmtkuiRNwQb4epeYdQ/+gkvf6D0JqRoEGI/yGeKETgcnkYz
	bbAk0HKYpmH4muKW197ahjeOEI/4MQc5EAFiC3kbSWlo06Ojw7hCwMzDQrULQkFnoBsa
	YaVnhj0Rk6w9a3ONi7UkiJgAbYLRGUsfQt08omkx5Ah6sze5Pp0XYt21imjLcxiCPU2y
	VX9bOlli0hFoU5+kJlxriHi0eCL9xentlX54xAPJzmGaivLWg1BW/gJjcB00g+TOokFN
	kT9w==
X-Gm-Message-State: ALoCoQm3U0aOoI56Y+b9ivmdKbLPj6aYcRPnfPIuWgui/PzaY1ugBBnWdPHIRhyZchWYZhFa+FSooSCBKdwX3C+IIVeFOSxJ6Q==
X-Received: by 10.112.211.168 with SMTP id nd8mr13477094lbc.116.1453310536007; 
	Wed, 20 Jan 2016 09:22:16 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-155.2com.net.
	[46.188.121.155]) by smtp.googlemail.com with ESMTPSA id
	d10sm4877424lfd.11.2016.01.20.09.22.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jan 2016 09:22:14 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1453227802-9991-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <569FC245.4030103@gmail.com>
Date: Wed, 20 Jan 2016 20:22:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453227802-9991-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22b
Cc: qemu-arm@nongnu.org, patches@linaro.org
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
X-TUID: qQRjRN8qUvK4

On 19.01.2016 21:23, Peter Maydell wrote:
> The AArch64 system registers DACR32_EL2, IFSR32_EL2, SPSR_IRQ,
> SPSR_ABT, SPSR_UND and SPSR_FIQ are visible and fully functional from
> EL3 even if the CPU has no EL2 (unlike some others which are RES0
> from EL3 in that configuration).  Move them from el2_cp_reginfo[] to
> v8_cp_reginfo[] so they are always present.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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

