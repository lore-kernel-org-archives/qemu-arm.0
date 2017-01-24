Received: by 10.25.77.65 with SMTP id a62csp1847806lfb;
        Tue, 24 Jan 2017 08:52:00 -0800 (PST)
X-Received: by 10.31.120.15 with SMTP id t15mr16639753vkc.152.1485276720100;
        Tue, 24 Jan 2017 08:52:00 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com. [2607:f8b0:400c:c08::22f])
        by mx.google.com with ESMTPS id n23si5384151uab.177.2017.01.24.08.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 08:52:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::22f as permitted sender) client-ip=2607:f8b0:400c:c08::22f;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::22f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-ua0-x22f.google.com with SMTP id i68so138154154uad.0
        for <alex.bennee@linaro.org>; Tue, 24 Jan 2017 08:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bdg8q2N/sJifdQOVG9tFTGYCEdb9dV94ETYxsAN70Lk=;
        b=K/xDUi2riiPKm4vCkFKCnfqfS27sSW4uYQeTWDcBJuIpYCQGomt1kS7qz3INkosQHn
         B0dTvTSEHNv/hKw3S0oo+SwJLk9Rc1CAKk4Qxd6FCRzzyl/OKfY4JgI3Aal3uMYDw+Iv
         oNaOc7PAePYoJH5BWfkPPqPo70VH35T6QkwxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bdg8q2N/sJifdQOVG9tFTGYCEdb9dV94ETYxsAN70Lk=;
        b=bQzrQLlcrHchdDDAafT0+Hv/4VsOF+pQ9ociEl1tsCx4jTQI4W5nBsBQ2bQTkAn9ZL
         oah6Rs7gNlX24qPtR/LyRHXxPFV/G/PgGJ1XrIQSwBf90NI7aFVl/Y+ky0G4x1SFDBtb
         7nvr/rf+icMU9o8MRcCyHeg7+DkiiYNQev5qSzIlBC/TLjnwQNSiLM8Mj4kKRSsgoAyw
         dHlvCvmuV1SFvoXZveXv1jG90CNvvlPC3n8iWhJWYtoyTDJSTQ93FAdZR8UNxZbPti+m
         WdGktxZsQwEaL0r4Jp2B9eIPfaY3K8cc7zv1c5tkH/bEUoausVWMcO48MVrX8LDNwB6E
         je3g==
X-Gm-Message-State: AIkVDXIP1dXGD/w5dMsCPV10hWNoJnj1McNtWZdY7caBCJ/RnfFEFqWiaZW47EjKe/VkH9dn1k0hwGuAYmQep+PtWok=
X-Received: by 10.176.75.149 with SMTP id v21mr16427680uaf.94.1485276719607;
 Tue, 24 Jan 2017 08:51:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 24 Jan 2017 08:51:39 -0800 (PST)
In-Reply-To: <87wpdka0hg.fsf@linaro.org>
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
 <1484937883-1068-2-git-send-email-peter.maydell@linaro.org> <87wpdka0hg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 16:51:39 +0000
Message-ID: <CAFEAcA82d2QcMgEk1VKMrQS6S0dzOY-D4PX=RzYf-E72viX72w@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 1/6] armv7m: MRS/MSR: handle unprivileged access
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: y8F3gq7um5Zz

On 24 January 2017 at 16:25, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> From: Michael Davidsaver <mdavidsaver@gmail.com>
>>
>> The MRS and MSR instruction handling has a number of flaws:
>>  * unprivileged accesses should only be able to read
>>    CONTROL and the xPSR subfields, and only write APSR
>>    (others RAZ/WI)
>>  * privileged access should not be able to write xPSR
>>    subfields other than APSR
>>  * accesses to unimplemented registers should log as
>>    guest errors, not abort QEMU
>>
>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> [PMM: rewrote commit message]
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/helper.c | 79 +++++++++++++++++++++++++---------------------=
-------
>>  1 file changed, 37 insertions(+), 42 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 7111c8c..ad23de3 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -8243,23 +8243,32 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUStat=
e *cs, vaddr addr,
>>
>>  uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
>>  {
>> -    ARMCPU *cpu =3D arm_env_get_cpu(env);
>> +    uint32_t mask;
>> +    unsigned el =3D arm_current_el(env);
>> +
>> +    /* First handle registers which unprivileged can read */
>> +
>> +    switch (reg) {
>> +    case 0 ... 7: /* xPSR sub-fields */
>
> This reads a little confusingly compared to the pseudo-code in the ARM
> ARM. Would it be clearer if we just went:
>
>   switch(extract32(reg, 3, 5)) {
>     case 0: /* xPSR */
>     ...
>     case 1: /* SP */
>     ...
>     case 2: /* Priority Mask or CONTROL.. */
>     ...
>   }
>
> ?

I think a simple switch on the register number is rather
less confusing than the pseudocode's nested switches on
the two halves of the register number -- this is a case where
we don't have to follow the pseudocode if it phrases something
weirdly.

>> +        mask =3D 0;
>> +        if ((reg & 1) && el) {
>> +            mask |=3D 0x000001ff; /* IPSR (unpriv. reads as zero) */
>
> As B5.2.2 doesn't imply any particular access limit perhaps the comment
> should read /* ISPR (reads as zero when not in exception) */

B5.2.2 Notes says "If unprivileged code attempts to read [...] the IPSR,
the read returns zero". In the pseudocode this is handled by an
architectural guarantee that you can't get here in unprivileged
mode with an IPSR value that isn't zero; however given the current
state of the QEMU code I'm not really prepared to make that assertion,
so it seems better to just report 0 here.

>> +        }
>> +        if (!(reg & 4)) {
>> +            mask |=3D 0xf8000000; /* APSR */
>> +        }
>> +        /* EPSR reads as zero */
>> +        return xpsr_read(env) & mask;
>> +        break;
>> +    case 20: /* CONTROL */
>> +        return env->v7m.control;
>
> I'm fairly sure this was meant to be 0x20 and either way the result is
> gated by current privilege.

No, it's decimal 20, binary 0b10100. CONTROL is the case
of 00010 in the outer switch and 100 in the inner, and
it isn't privilege-checked. (See how confusing the
pseudocode phrasing is ? :-))

>> +    }
>> +
>> +    if (el =3D=3D 0) {
>> +        return 0; /* unprivileged reads others as zero */
>> +    }
>>
>>      switch (reg) {
>> -    case 0: /* APSR */
>> -        return xpsr_read(env) & 0xf8000000;
>> -    case 1: /* IAPSR */
>> -        return xpsr_read(env) & 0xf80001ff;
>> -    case 2: /* EAPSR */
>> -        return xpsr_read(env) & 0xff00fc00;
>> -    case 3: /* xPSR */
>> -        return xpsr_read(env) & 0xff00fdff;
>> -    case 5: /* IPSR */
>> -        return xpsr_read(env) & 0x000001ff;
>> -    case 6: /* EPSR */
>> -        return xpsr_read(env) & 0x0700fc00;
>> -    case 7: /* IEPSR */
>> -        return xpsr_read(env) & 0x0700edff;
>>      case 8: /* MSP */
>>          return env->v7m.current_sp ? env->v7m.other_sp : env->regs[13];
>>      case 9: /* PSP */
>> @@ -8271,40 +8280,26 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint3=
2_t reg)
>>          return env->v7m.basepri;
>>      case 19: /* FAULTMASK */
>>          return (env->daif & PSTATE_F) !=3D 0;
>> -    case 20: /* CONTROL */
>> -        return env->v7m.control;
>>      default:
>> -        /* ??? For debugging only.  */
>> -        cpu_abort(CPU(cpu), "Unimplemented system register read (%d)\n"=
, reg);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "Attempt to read unknown special=
"
>> +                                       " register %d\n", reg);
>>          return 0;
>>      }
>>  }
>>
>>  void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
>>  {
>> -    ARMCPU *cpu =3D arm_env_get_cpu(env);
>> +    if (arm_current_el(env) =3D=3D 0 && reg > 7) {
>> +        /* only xPSR sub-fields may be written by unprivileged */
>> +        return;
>> +    }
>>
>>      switch (reg) {
>> -    case 0: /* APSR */
>> -        xpsr_write(env, val, 0xf8000000);
>> -        break;
>> -    case 1: /* IAPSR */
>> -        xpsr_write(env, val, 0xf8000000);
>> -        break;
>> -    case 2: /* EAPSR */
>> -        xpsr_write(env, val, 0xfe00fc00);
>> -        break;
>> -    case 3: /* xPSR */
>> -        xpsr_write(env, val, 0xfe00fc00);
>> -        break;
>> -    case 5: /* IPSR */
>> -        /* IPSR bits are readonly.  */
>> -        break;
>> -    case 6: /* EPSR */
>> -        xpsr_write(env, val, 0x0600fc00);
>> -        break;
>> -    case 7: /* IEPSR */
>> -        xpsr_write(env, val, 0x0600fc00);
>> +    case 0 ... 7: /* xPSR sub-fields */
>> +        /* only APSR is actually writable */
>> +        if (reg & 4) {
>> +            xpsr_write(env, val, 0xf8000000); /* APSR */
>> +        }
>
> I assuming insn<10> selects a different helper....

insn<10> is mask<0> -- the behaviour is UNPREDICTABLE unless
the DSP extension is implemented. This code all predates the
attempt to support that in our cortex-m4 model (and indeed
predates the existence of M profile DSP extns), so it doesn't
care about the mask bits. I think the translate.c code is
probably just going to get that decode wrong at the moment.
We should tighten it up but it will likely be a different
helper and definitely a separate patch.

>>          break;
>>      case 8: /* MSP */
>>          if (env->v7m.current_sp)
>> @@ -8345,8 +8340,8 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t re=
g, uint32_t val)
>>          switch_v7m_sp(env, (val & 2) !=3D 0);
>>          break;
>>      default:
>> -        /* ??? For debugging only.  */
>> -        cpu_abort(CPU(cpu), "Unimplemented system register write (%d)\n=
", reg);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "Attempt to write unknown specia=
l"
>> +                                       " register %d\n", reg);
>>          return;
>>      }
>>  }

thanks
-- PMM
