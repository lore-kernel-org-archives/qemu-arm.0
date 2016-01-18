Received: by 10.25.159.19 with SMTP id i19csp1999269lfe;
        Mon, 18 Jan 2016 08:06:20 -0800 (PST)
X-Received: by 10.55.77.17 with SMTP id a17mr31627784qkb.40.1453133180617;
        Mon, 18 Jan 2016 08:06:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37si8128562qgt.88.2016.01.18.08.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 08:06:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLCJw-0000CB-3J
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 11:06:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLCJZ-0008KZ-AN
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 11:05:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLCJY-0005k3-Em
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 11:05:57 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLCJY-0005jQ-0n
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 11:05:56 -0500
Received: by mail-vk0-x232.google.com with SMTP id a123so304240405vkh.1
	for <qemu-devel@nongnu.org>; Mon, 18 Jan 2016 08:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/XT8bK9YX1QvEHfS4kaOnMRfwyfynr5lTyAFGe+jyO0=;
	b=Z82AwFeBqTDvi6ab0X9nwnaSeYWTIo49mRrT1Ex2Jxo2u3n5PmCQQwjmd4KN9XTUgX
	wJ+E5ViSlAXKyAASacwUB6UchXeSEEHlHtYaDwgJ3ggGeYi+hDGQn1Ct0mAXo36cmJO4
	rtfdNH68iz1wCrqxfF5VBohf+jGsBWYgfPzl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/XT8bK9YX1QvEHfS4kaOnMRfwyfynr5lTyAFGe+jyO0=;
	b=gntiKbN7X3W09RE2RvoxikfyXk5iZJC/tjCWPR5NMAEIdXOZ1FTDWZ4masSAMnkqzN
	EQbylWI3NEYdCdDm6yKrrUQVVySUjszzWRUO9TS7rks4Ai12NYbTTqoNKTQdP+Ex2mgA
	Pr4PYVLvPReyvVxC/3poeG1RAxoLWXx5NtiyFmIN9Yw7iHbmDMdcj3KrHLIKnYsVpj3x
	1hpa9YNct38D0W8IHrM4Ng/Xnn78RXmO9cAV4qYCUa7zKbXjS5NuZNUXWSU3QQSYSN4c
	NdaKK+TM+fO42TyrLmm4vO7XUmVH/LeGN3+puhbiYKoVKhmmXOKM54BX/bOziPtYeYO0
	wXFA==
X-Gm-Message-State: ALoCoQm9E1tAHlvGGvO1hLJpHLiAOHrMSj1BwmI/97aovLK2ADZl3MiubhBVuV8e0Og/Ovj7vc1EEqflyaCmntCUs4GQwKgFaFdrE7VmQ8h8T7BN17AiyEg=
X-Received: by 10.31.131.203 with SMTP id f194mr17833877vkd.90.1453133155580; 
	Mon, 18 Jan 2016 08:05:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 18 Jan 2016 08:05:36 -0800 (PST)
In-Reply-To: <1453132414-8127-1-git-send-email-peter.maydell@linaro.org>
References: <1453132414-8127-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2016 16:05:36 +0000
Message-ID: <CAFEAcA9CaPT11M=Jdw8zy3XMfnUbm=psgRx+qmxYzG_96bg=Bw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH] target-arm: Implement FPEXC32_EL2 system
	register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QRphqaSF2ico

Oops, got the qemu-arm email address wrong...

On 18 January 2016 at 15:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> The AArch64 FPEXC32_EL2 system register is visible at EL2 and EL3,
> and allows those exception levels to read and write the FPEXC
> register for a lower exception level that is using AArch32.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> ARM Trusted Firmware expects this to exist (as does your average
> hypervisor, I expect).
>
>  target-arm/helper.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 196c111..e8ede3f 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -2890,6 +2890,17 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      tlb_flush(CPU(cpu), 1);
>  }
>
> +static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    if (env->cp15.cptr_el[3] & CPTR_TFP) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    return CP_ACCESS_OK;
> +}
> +
>  static const ARMCPRegInfo v8_cp_reginfo[] = {
>      /* Minimal set of EL0-visible registers. This will need to be expanded
>       * significantly for system emulation of AArch64 CPUs.
> @@ -3150,6 +3161,11 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
>        .type = ARM_CP_NO_RAW,
>        .access = PL1_RW, .readfn = spsel_read, .writefn = spsel_write },
> +    { .name = "FPEXC32_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 3, .opc2 = 0,
> +      .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]),
> +      .access = PL2_RW, .accessfn = fpexc32_access },
>      REGINFO_SENTINEL
>  };
>
> --
> 1.9.1
>

thanks
-- PMM
