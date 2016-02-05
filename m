Received: by 10.25.159.19 with SMTP id i19csp23252lfe;
        Fri, 5 Feb 2016 08:23:04 -0800 (PST)
X-Received: by 10.31.3.67 with SMTP id 64mr10408104vkd.17.1454689384313;
        Fri, 05 Feb 2016 08:23:04 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com. [2607:f8b0:400c:c05::231])
        by mx.google.com with ESMTPS id p18si15248080vkd.97.2016.02.05.08.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 08:23:04 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) client-ip=2607:f8b0:400c:c05::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x231.google.com with SMTP id c3so13068199vkb.3
        for <alex.bennee@linaro.org>; Fri, 05 Feb 2016 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=eT/zjDvKR6iMb1Xv1Hi7WRpWQTH923zKGEMyeHLtEjY=;
        b=RYIhijta0xsEM0RVq2Tg4dh2XLkLhHbiNjHCOgkuaf/3N2icFv5BippNpVlMHVnhm7
         WjbO/vZ1ASMFqQzLw2ZzXW48fuJETEyAnHzlKpfjTl0RULsXlElDKw/eo3SXACzbPMaL
         vUN/YHDsJmQuNDd+fIMm7F4pMxXRjHukqnLy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=eT/zjDvKR6iMb1Xv1Hi7WRpWQTH923zKGEMyeHLtEjY=;
        b=j5p/a89oLUi/KhtpI+A2Iq16uTsXWUAeuPcbWFPzEKSFqKl7cnx/K01ph9hg5hlbM6
         il/rHNKuEwe1kYCv3fd3xUUk5kOO530YzIHuruWHFndY7HS8z9ZQzwWA21Xbrad+BULL
         C9bFJ+UEajxQ6s+8WhwnQ66/Tr9KCghvouoA8wwlbS45lczSCHb/JH/mRW2SgOM1tAQs
         f+kaiVHXSx2M0C4QG/2nJzi1vBr1GfoUdmSD+mc2v9X0i7otCnaTs3nvqO4x/dmSEfbZ
         lwdSymIkFyxJ2txlSTte9c1m2dsA4VrfgsfK/IcdlRJI3SBI4I2Mx4qLKIDRM69ejXHe
         XEkQ==
X-Gm-Message-State: AG10YORPjpv7y90eWFwbNbM0g6eUYKfpyg6eA4Taj7P/y4/ZNs9i150wWO1MNiPk5sv8P25mDIgmP7BPcdc1+ANuIME=
X-Received: by 10.31.194.130 with SMTP id s124mr10070349vkf.92.1454689383780;
 Fri, 05 Feb 2016 08:23:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 5 Feb 2016 08:22:44 -0800 (PST)
In-Reply-To: <87h9hnnns2.fsf@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
 <1454506721-11843-7-git-send-email-peter.maydell@linaro.org> <87h9hnnns2.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2016 16:22:44 +0000
Message-ID: <CAFEAcA_SmhPaSCNF03S=YjpyK1GgZJvoQm3LhV-iR8pCALWAMA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 6/7] target-arm: Implement NSACR trapping behaviour
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: OxGGFN3uEdmw

On 5 February 2016 at 16:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Implement some corner cases of the behaviour of the NSACR
>> register on ARMv8:
>>  * if EL3 is AArch64 then accessing the NSACR from Secure EL1
>>    with AArch32 should trap to EL3
>>  * if EL3 is not present or is AArch64 then reads from NS EL1 and
>>    NS EL2 return constant 0xc00
>>
>> It would in theory be possible to implement all these with
>> a single reginfo definition, but for clarity we use three
>> separate definitions for the three cases and install the
>> right one based on the CPU feature flags.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target-arm/helper.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++=
+++----
>>  1 file changed, 58 insertions(+), 4 deletions(-)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 8bc3ea3..34dc144 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -3562,6 +3562,25 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
>>      REGINFO_SENTINEL
>>  };
>>
>> +static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo=
 *ri,
>> +                                   bool isread)
>> +{
>> +    /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
>> +     * At Secure EL1 it traps to EL3.
>> +     */
>> +    if (arm_current_el(env) =3D=3D 3) {
>> +        return CP_ACCESS_OK;
>> +    }
>> +    if (arm_is_secure_below_el3(env)) {
>> +        return CP_ACCESS_TRAP_EL3;
>> +    }
>> +    /* Accesses from EL1 NS and EL2 NS are UNDEF for write but allow re=
ads. */
>> +    if (isread) {
>> +        return CP_ACCESS_OK;
>> +    }
>> +    return CP_ACCESS_TRAP_UNCATEGORIZED;
>> +}
>> +
>>  static const ARMCPRegInfo el3_cp_reginfo[] =3D {
>>      { .name =3D "SCR_EL3", .state =3D ARM_CP_STATE_AA64,
>>        .opc0 =3D 3, .opc1 =3D 6, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>> @@ -3587,10 +3606,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] =3D {
>>        .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 1, .opc2 =3D 1,
>>        .access =3D PL3_RW, .resetvalue =3D 0,
>>        .fieldoffset =3D offsetoflow32(CPUARMState, cp15.sder) },
>> -      /* TODO: Implement NSACR trapping of secure EL1 accesses to EL3 *=
/
>> -    { .name =3D "NSACR", .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D =
1, .opc2 =3D 2,
>> -      .access =3D PL3_W | PL1_R, .resetvalue =3D 0,
>> -      .fieldoffset =3D offsetof(CPUARMState, cp15.nsacr) },
>>      { .name =3D "MVBAR", .cp =3D 15, .opc1 =3D 0, .crn =3D 12, .crm =3D=
 0, .opc2 =3D 1,
>>        .access =3D PL1_RW, .accessfn =3D access_trap_aa32s_el1,
>>        .writefn =3D vbar_write, .resetvalue =3D 0,
>> @@ -4361,6 +4376,45 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>>          };
>>          define_one_arm_cp_reg(cpu, &rvbar);
>>      }
>> +    /* The behaviour of NSACR is sufficiently various that we don't
>> +     * try to describe it in a single reginfo:
>> +     *  if EL3 is 64 bit, then trap to EL3 from S EL1,
>> +     *     reads as constant 0xc00 from NS EL1 and NS EL2
>> +     *  if EL3 is 32 bit, then RW at EL3, RO at NS EL1 and NS EL2
>> +     *  if v7 without EL3, register doesn't exist
>> +     *  if v8 without EL3, reads as constant 0xc00 from NS EL1 and NS E=
L2
>> +     */
>> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
>> +        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
>> +            ARMCPRegInfo nsacr =3D {
>> +                .name =3D "NSACR", .type =3D ARM_CP_CONST,
>
> I was thrown by the ARM_CP_CONST here as there is EL dependency. If
> nsacr_access says CP_ACCESS_OK where does the write go?

nsacr_access can never say OK for a write here (because we can't
be at EL3 since it's a 32-bit register and this is in the
"EL3 is 64-bit" arm of the if). The register is genuinely
constant.

>> +                .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 1, .opc2 =
=3D 2,
>> +                .access =3D PL1_RW, .accessfn =3D nsacr_access,
>
> PL1_R?

No, because the .access checks happen before the access fn. If
we forbid writes in .access then a write from Secure EL1 will
fail UNDEF rather than trap to EL3. So instead we set a wider
permission set in .access and use .accessfn to get the exact
checks we need.

>> +                .resetvalue =3D 0xc00
>> +            };
>> +            define_one_arm_cp_reg(cpu, &nsacr);
>> +        } else {
>> +            ARMCPRegInfo nsacr =3D {
>> +                .name =3D "NSACR",
>> +                .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 1, .opc2 =
=3D 2,
>> +                .access =3D PL3_RW | PL1_R,
>> +                .resetvalue =3D 0,
>> +                .fieldoffset =3D offsetof(CPUARMState, cp15.nsacr)
>> +            };
>> +            define_one_arm_cp_reg(cpu, &nsacr);
>> +        }
>> +    } else {
>> +        if (arm_feature(env, ARM_FEATURE_V8)) {
>> +            ARMCPRegInfo nsacr =3D {
>> +                .name =3D "NSACR", .type =3D ARM_CP_CONST,
>> +                .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 1, .opc2 =
=3D 2,
>> +                .access =3D PL1_R,
>> +                .resetvalue =3D 0xc00
>> +            };
>> +            define_one_arm_cp_reg(cpu, &nsacr);
>> +        }
>> +    }
>> +
>>      if (arm_feature(env, ARM_FEATURE_MPU)) {
>>          if (arm_feature(env, ARM_FEATURE_V6)) {
>>              /* PMSAv6 not implemented */
>
> I don't know if a more compact definition would make this easier to
> follow?

>     /* The behaviour of NSACR is sufficiently various we tweak the reginf=
o:
>      *  if EL3 is 64 bit, then trap to EL3 from S EL1,
>      *     reads as constant 0xc00 from NS EL1 and NS EL2
>      *  if EL3 is 32 bit, then RW at EL3, RO at NS EL1 and NS EL2
>      *  if v7 without EL3, register doesn't exist
>      *  if v8 without EL3, reads as constant 0xc00 from NS EL1 and NS EL2
>      */
>     if (arm_feature(env, ARM_FEATURE_V8) || arm_feature(env, ARM_FEATURE_=
EL3)) {
>         ARMCPRegInfo nsacr =3D {
>             .name =3D "NSACR",
>             .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 1, .opc2 =3D 2,
>             .access =3D PL1_R,
>             .resetvalue =3D 0xc00
>         };
>
>         if (arm_feature(env, ARM_FEATURE_EL3)) {
>             if (arm_feature(env, ARM_FEATURE_AARCH64)) {
>                 nsacr.type =3D ARM_CP_CONST;      /* if no trap RO */
>                 nsacr.accessfn =3D nsacr_access;
>             } else {
>                 nsacr.access =3D PL3_RW | PL1_R;
>                 nsacr.resetvalue =3D 0;
>                 nsacr.fieldoffset =3D offsetof(CPUARMState, cp15.nsacr);
>             };
>         } else {
>             nsacr.type =3D ARM_CP_CONST;
>         }
>
>         define_one_arm_cp_reg(cpu, &nsacr);
>     }

I thought about this, but decided it was worse, because now you have
to read the whole dozen lines or so to figure out what the register
is defined as for each of the three interesting cases, and mentally
reassemble the regdef.

thanks
-- PMM
