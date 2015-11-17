Received: by 10.182.158.201 with SMTP id ww9csp856868obb;
        Tue, 17 Nov 2015 09:21:49 -0800 (PST)
X-Received: by 10.13.219.15 with SMTP id d15mr42070921ywe.51.1447780909648;
        Tue, 17 Nov 2015 09:21:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w63si16369430ywa.92.2015.11.17.09.21.49
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 09:21:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:59846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zyjwz-0008JI-41
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 12:21:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjwQ-0007i7-4o
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 12:21:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjwP-0000PL-7G
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 12:21:14 -0500
Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a]:34476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjwP-0000PG-0g
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 12:21:13 -0500
Received: by ykfs79 with SMTP id s79so17619889ykf.1
	for <qemu-devel@nongnu.org>; Tue, 17 Nov 2015 09:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LSAhocJJX4oJ/JIE9ypujS+tBVSwnAZ/XbR8hIuGgGA=;
	b=M8I6pLRfCX7NjPD/ovfKt5XnD3Jej4u4ZodtKmlyHEUBYx2xdxDOgMUnPHweSmlkuj
	pBzkpsUvRv9cHsxhC0Uitff/SOD+gS7w/sr/e1RyIV/U7lv1hIjF9276OjwQUQ7RUT3A
	St8mg/aBrDVEKCNKthMaH44QNUQ3Ivd39xslvSSgrqlFaN9O34X37dNv1kM0W0+/2/VS
	VPCw6lcHuSHActaYSO+NipRfJ6kslcaFlUOzr4UmRkpdGpjwBErgI2cwBQUW+cbW8cyg
	GQuLW4swvT+zwYQOWptnjBmiK5l2H8AytWHkGXh7K6S5dT23RmlMCBcQRjh1UTuMG4ja
	YdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LSAhocJJX4oJ/JIE9ypujS+tBVSwnAZ/XbR8hIuGgGA=;
	b=S14phkpOJSuRssbPgl00IPQIL0Pbs4Iy95I9VAxlVQxv8Z2Gzi4X9PCP0/8gg5i2Vx
	WY0udLus5hmw2HlNDsUJ+5aDiHJRyuhel+MyYQC4N2Fr/MSUo8RcTOBWwxuvwr/Yw0wQ
	Dyd9IdgFmZzzUaCleeNS2BXQ98oy0WoPrI+yVTbSWEXhaRPtc1hdhfgxT9rPOCjz3u1r
	yfu60UVoBuRiN106sedymO/1N11+KqAwWOdVPJBRPSrQOFufHdvGn3bs0fwCfBYcB7R5
	BbWgPkX+jW2bFR/whGcezKy9NJKOo2G4f+nlw2kLbLK6n6muCD37fw6rxIcxPmyTR+c+
	X5Qg==
X-Gm-Message-State: ALoCoQnGUj6NlddGqXvVEs4Y/MGtUqUzSGma4Uj1PmRwxAcl5gv0Lbte1F7WYlkuAqZ7Z2FVUHer
X-Received: by 10.129.110.70 with SMTP id j67mr45612264ywc.180.1447780871779; 
	Tue, 17 Nov 2015 09:21:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 09:20:52 -0800 (PST)
In-Reply-To: <1447031505-12477-4-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-4-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 17:20:52 +0000
Message-ID: <CAFEAcA_As6k3yg0roE1ZSgWo4bufsRXkXYLaO7Q7YZBk==FPAg@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22a
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH 03/18] armv7m: Complain about incorrect
	exception table entries.
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
X-TUID: zLT8jFmzpclT

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> For -M  These should always be thumb mode.
> Log a message if this is seen.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>

This one's not really correct, I'm afraid (though the spec-mandated
behaviour is a bit subtle).

> ---
>  target-arm/helper.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 4408100..4178400 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5396,7 +5396,8 @@ static void do_v7m_exception_exit(CPUARMState *env)
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "M profile return from interrupt with misaligned "
>                        "PC is UNPREDICTABLE\n");
> -        /* Actual hardware seems to ignore the lsbit, and there are several
> +        /* The ARM calls for UsageFault when the T bit isn't set, but
> +         * actual hardware seems to ignore the lsbit, and there are several

No, this is UNPREDICTABLE, as the error message above says. See the
PopStack() pseudocode. No fault of any kind is mandated here (and
ignoring the lsbit in the exception return frame is within the set
of things UNPREDICTABLE allows us and the hardware to do).

>           * RTOSes out there which incorrectly assume the r15 in the stack
>           * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
>           */
> @@ -5498,6 +5499,12 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
>      env->regs[15] = addr & 0xfffffffe;
>      env->thumb = addr & 1;
> +    if (!env->thumb) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "M profile interrupt handler %d with incorrect "
> +                      "instruction mode in PC is UNPREDICTABLE\n",
> +                      env->v7m.exception);
> +    }

This is also wrong -- the behaviour here is defined by the
ExceptionTaken pseudocode, which requires that we set the EPSR.T
bit from the low bit of the exception vector table entry, so it's
not UNPREDICTABLE at all. (See also section B1.5.3 of the v7M ARM ARM
rev E.b.)

The part we do not implement of this is that the architecture
mandates that attempts to *execute an instruction* with the T bit
clear should generate a UsageFault. (Similarly, it's valid to
execute a branch instruction with BX that clears the T bit, but
when you get to the destination you'll get a UsageFault on first
attempt to execute an instruction.)

The correct place to implement this behaviour is in translate.c:
in the bit of code that currently reads:

        if (dc->thumb) {
            disas_thumb_insn(env, dc);
            if (dc->condexec_mask) {
                dc->condexec_cond = (dc->condexec_cond & 0xe)
                                   | ((dc->condexec_mask >> 4) & 1);
                dc->condexec_mask = (dc->condexec_mask << 1) & 0x1f;
                if (dc->condexec_mask == 0) {
                    dc->condexec_cond = 0;
                }
            }
        } else {
            unsigned int insn = arm_ldl_code(env, dc->pc, dc->bswap_code);
            dc->pc += 4;
            disas_arm_insn(dc, insn);
        }

the else branch should have:
    if (arm_dc_feature(dc, ARM_FEATURE_M)) {
        /* For M profile any attempt to execute with EPSR.T clear triggers
         * an INVSTATE UsageFault.
         */
        gen_exception(something);
        goto done_generating;
    }

thanks
-- PMM
