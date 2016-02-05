Received: by 10.25.159.19 with SMTP id i19csp986520lfe;
        Fri, 5 Feb 2016 03:28:21 -0800 (PST)
X-Received: by 10.31.166.200 with SMTP id p191mr8863540vke.53.1454671701216;
        Fri, 05 Feb 2016 03:28:21 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com. [2607:f8b0:400c:c05::229])
        by mx.google.com with ESMTPS id j65si14359938vkf.106.2016.02.05.03.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 03:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) client-ip=2607:f8b0:400c:c05::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x229.google.com with SMTP id e185so54543855vkb.1
        for <alex.bennee@linaro.org>; Fri, 05 Feb 2016 03:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=woA0ZEGf2KizKO79582+fS+qgCD2js+4Q1gt/6V45n8=;
        b=GdvjyDfK2CSPpsReGlxYkNFW9I32VMd66nweNdvw94oQy0EMwlxoXRNynpaXnm6SFF
         Ayy9HWPmOyOBPnkP5r1gzQ1qTMlZhq5NB2SxyKtSpKsF7L428SuVg47XKJ1VOErtTG15
         rig/1MF7OHKHMoAXI5JB0Os32Sz94iigEDWVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=woA0ZEGf2KizKO79582+fS+qgCD2js+4Q1gt/6V45n8=;
        b=RVuurcVxfcD49gkTIX5RMHYXIrGLN8HL5Z3onKpNFVsUhl8KLsjVSybB6JnDezOV7k
         w8P9T4cEe8ReBDRI9QDuesRvtrHHq80kersDX1EPMjM4dsrdpUwmVtOhA9pyA/ZuOo3h
         FtmZ+xrvqbFCnYC0j2CHHUaUePBcJ5wH7Mt/E3ua3UpDjL+BCRKRWXl4uGUROG7q+fQk
         JGHQ1oJRnj5rAI9FKFRQFds1XhcALuVaWqWdIoDtw8xT6hK0GG/IIJXSx+H5ZCMADJfe
         QCE1WLNsnLlkel0aL1D2ypubVyHMWXulNVpd4nR01zyGSjGsmPkrVc93wFbmTBUuRtE9
         w6lQ==
X-Gm-Message-State: AG10YOStQzmmMUc+UDxL8k8b158J9VOpJ0BHAvUsnQwcU38oWlYXc2CMseG1hxQHpnFwGFCPu3JWDkUlMODjsLXreuo=
X-Received: by 10.31.194.130 with SMTP id s124mr8982510vkf.92.1454671700802;
 Fri, 05 Feb 2016 03:28:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 5 Feb 2016 03:28:01 -0800 (PST)
In-Reply-To: <87powbo1ei.fsf@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
 <1454506721-11843-3-git-send-email-peter.maydell@linaro.org> <87powbo1ei.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2016 11:28:01 +0000
Message-ID: <CAFEAcA9FjHd_aYLGFns-QKGPRqi6kvrpZzpL5kiaGW5GtT4j8g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/7] target-arm: Implement MDCR_EL3 and SDCR
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: C5syoe06PVC0

On 5 February 2016 at 11:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> Implement the MDCR_EL3 register (which is SDCR for AArch32).
>> For the moment we implement it as reads-as-written.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +/* Some secure-only AArch32 registers trap to EL3 if used from
>> + * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
>> + * We assume that the .access field is set to PL1_RW.
>> + */
>> +static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
>> +                                            const ARMCPRegInfo *ri)
>> +{
>
> I wonder if we should assert the fact we are in AArch32 here in case the
> wrong access function gets added to a AArch64 register?

We mostly don't do that kind of checking in these access
functions. If you add the wrong access function to your regdef
then your register misbehaves anyway :-)

>> +    if (arm_current_el(env) =3D=3D 3) {
>> +        return CP_ACCESS_OK;
>> +    }
>> +    if (arm_is_secure_below_el3(env)) {
>> +        return CP_ACCESS_TRAP_EL3;
>> +    }
>> +    /* This will be EL1 NS and EL2 NS, which just UNDEF */
>> +    return CP_ACCESS_TRAP_UNCATEGORIZED;
>> +}
>> +
>>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64=
_t value)
>>  {
>>      ARMCPU *cpu =3D arm_env_get_cpu(env);
>> @@ -3532,6 +3549,13 @@ static const ARMCPRegInfo el3_cp_reginfo[] =3D {
>>        .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>>        .access =3D PL3_RW, .fieldoffset =3D offsetoflow32(CPUARMState, c=
p15.scr_el3),
>>        .writefn =3D scr_write },
>> +    { .name =3D "MDCR_EL3", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 6, .crn =3D 1, .crm =3D 3, .opc2 =3D 1,
>> +      .access =3D PL3_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.m=
dcr_el3) },
>> +    { .name =3D "SDCR", .type =3D ARM_CP_ALIAS,
>> +      .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 3, .opc2 =3D 1,
>> +      .access =3D PL1_RW, .accessfn =3D access_trap_aa32s_el1,
>> +      .fieldoffset =3D offsetoflow32(CPUARMState, cp15.mdcr_el3) },
>
> Does anything ensure the fields are reset to 0 on a warm reset?

Yes, the cpreg framework resets things. arm_cpu_reset() calls
cp_reg_reset() on every register the CPU knows about. Note that
.resetvalue is 0 as usual for unspecified fields in structure
initializers, but it would be clearer to specifically state it
(ie ".resetvalue =3D 0") as we do in most cases.

thanks
-- PMM
