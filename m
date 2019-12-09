Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4471328lff;
        Mon, 9 Dec 2019 06:44:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBmZwAQn7kJKES8KbJanFWSbas+kEpCIdfJvg2fl7NBv+DN7v+/1UfNT9cTGFJpV1UE+Bi
X-Received: by 2002:a37:a014:: with SMTP id j20mr10401427qke.456.1575902647491;
        Mon, 09 Dec 2019 06:44:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575902647; cv=none;
        d=google.com; s=arc-20160816;
        b=lb/z4jTe3G7yZGb2u0dz7q6PeQ5kRb7zYtGA1Hn3yeI+y0V5q/Yu7omXqCDhIY49Ta
         CHjeqaxN0G0tkquxzGzuQWGapneo6gb8SFBNC4mSj1oLbDVXR0gXkX3TQD7EzjMeLv24
         QM3/koOGjcS0yqAmISpkac+lcwOU+3hdqDuA2VPED5JHKqtDIWZp4lqfPkLLkYyRZb2z
         SZUOfsgFVXX2CeqjwOqte7gcDf3d5/EGLAb1Lj1uhZbX2pncE2y3q39maEqmNHVVhmZK
         NZGvH9hIgnEz6NS30YzZY4q1IS0bjMrj0kS0sN45KEFS9xyMK8PIFwumwJvkltMo+lGM
         sI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pZQkGXdsQ1RB30Jbju683CacArBZeBitZxh5soE8RrY=;
        b=mrW1aLKoWIigr5pTpgV7D2B54zoj5IpnXD9UND+7EKHoMHz0dwhpGX4AJ12hwWK5py
         4H5QQ2eoW2TmmpujL+b3Cnv5T9P8GqhJoiVhYpUP0nz9sD+KsNN4B06OpbOUIXjfcMlk
         NVc0hXkSor4SSSiBNBBR4tOyGHNQB1wAvfAMishQyiTpDbYzS93lw+NcPvo0KbmK2rWE
         x3FToSs6/WVlUqTpFTJrijvbmjhFrYjRdDcKsmwWQmjzv7AqE+BY2zlrGZE0LCGPvxK1
         L9ZPn3TTDY5I6kJI/CqSLfGsf2b80BReSEn0U+GfG5HXaHjfTbCzKf9UJnmO7p8xDCx8
         Xkmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ATlAoMgs;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id 31si14848746qtz.314.2019.12.09.06.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Dec 2019 06:44:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ATlAoMgs;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575902646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZQkGXdsQ1RB30Jbju683CacArBZeBitZxh5soE8RrY=;
	b=ATlAoMgsz9voUnMz+b1xLSwCiliG+FHICm6FlQQaymWBaXSjjSfO1v5rEgAON1/b7hFHpQ
	NCQf0cdZUU+Mduu8EFzXxlZXK30Es3hn+AxqEIT8/dSzwtNULsO45rt6VPaPfKmrgP70tm
	Eyp3wz6DIUza5AYYcUOUUtfbkgA+eh4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-H_ABlAR8M7qOO5KMWg9zqA-1; Mon, 09 Dec 2019 09:44:05 -0500
Received: by mail-wr1-f70.google.com with SMTP id c17so7534788wrp.10
        for <alex.bennee@linaro.org>; Mon, 09 Dec 2019 06:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qIxvmkrue2cTE6iOOQ2HHxg9X3QWCLMCv26POzpwbEY=;
        b=WdcUtem7ESAxY6Q/sEKMthB4p6bn8tGBbVKeHwla4PtL2CpvtYccM/KgSIrnfOVnPF
         o6/SS0n4TjTcgTf1zSe2tsTf30lC1ozOuZOC1lArSn2NYRZBJE5ZeNVDNEShMoSGo3GK
         lwpIHRuJr0nLQiIdhnpSwDBJLvlxa1+35Qt3HZQ2ffyzLfM0k4GvcQKi0mwBcj41WHXM
         kMiOXs0cNDHFWeiQPZ6TXJYlQJFUmEI+LHd8SGUO/o2r5zS3tljTLb8JcvDb8/Leb+7k
         8EmbBAvj3qg6aEZrMtv2s5q4UzgjpTDH6tpYwrdbs1MlbMDqF4Nv2nO8Hj00Zx0AYkyH
         AoOQ==
X-Gm-Message-State: APjAAAUjkgZkpAqm15umBW7SFaiwjqwEx9kGWB1dLpO2Fd6hptM/2ZQB
	bn8z+3LnXxETzz7fRFX3EkOQrz8EYdbCRp3Ok4wfNfLVDowbULm0xaZzt0BUQjhmgbWEblg1VJx
	1dJ4Xk4fWfl2jv2R7
X-Received: by 2002:a05:6000:1052:: with SMTP id c18mr2596164wrx.268.1575902644440;
        Mon, 09 Dec 2019 06:44:04 -0800 (PST)
X-Received: by 2002:a05:6000:1052:: with SMTP id c18mr2596136wrx.268.1575902644187;
        Mon, 09 Dec 2019 06:44:04 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net. [88.21.103.182])
        by smtp.gmail.com with ESMTPSA id n10sm27352635wrt.14.2019.12.09.06.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 06:44:03 -0800 (PST)
Subject: Re: [PATCH] target/arm: ensure we use current exception state after
 SCR update
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191209143723.6368-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1042c399-0bf4-ef61-dec3-0c35822cf530@redhat.com>
Date: Mon, 9 Dec 2019 15:44:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191209143723.6368-1-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: H_ABlAR8M7qOO5KMWg9zqA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: pckEgDuhQXvi

On 12/9/19 3:37 PM, Alex Benn=C3=A9e wrote:
> A write to the SCR can change the effective EL by droppping the system
> from secure to non-secure mode. However if we use a cached current_el
> from before the change we'll rebuild the flags incorrectly. To fix
> this we overload the ARM_CP_CURRENTEL flag for the register and ensure
> the new EL is used when recomputing the flags.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks! This patch indeed fixes my problem :)

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/cpu.h       |  1 +
>   target/arm/helper.h    |  1 +
>   target/arm/helper.c    | 14 +++++++++++++-
>   target/arm/translate.c |  6 +++++-
>   4 files changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index bd4d5b4445b..d2ef4644d8f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2262,6 +2262,7 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpr=
egid)
>   #define ARM_CP_NOP               (ARM_CP_SPECIAL | 0x0100)
>   #define ARM_CP_WFI               (ARM_CP_SPECIAL | 0x0200)
>   #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
> +/* Re-read the current EL, don't use cached values */
>   #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
>   #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
>   #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 3d4ec267a2c..e345bdb726a 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -91,6 +91,7 @@ DEF_HELPER_2(get_user_reg, i32, env, i32)
>   DEF_HELPER_3(set_user_reg, void, env, i32, i32)
>  =20
>   DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
> +DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
>   DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
>   DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
>  =20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 489c31504a6..db2e33224d6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5179,7 +5179,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] =3D {
>         .opc0 =3D 3, .opc1 =3D 6, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>         .access =3D PL3_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.s=
cr_el3),
>         .resetvalue =3D 0, .writefn =3D scr_write },
> -    { .name =3D "SCR",  .type =3D ARM_CP_ALIAS,
> +    { .name =3D "SCR",  .type =3D ARM_CP_ALIAS | ARM_CP_CURRENTEL,
>         .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>         .access =3D PL1_RW, .accessfn =3D access_trap_aa32s_el1,
>         .fieldoffset =3D offsetoflow32(CPUARMState, cp15.scr_el3),
> @@ -11437,6 +11437,18 @@ void HELPER(rebuild_hflags_m32)(CPUARMState *env=
, int el)
>       env->hflags =3D rebuild_hflags_m32(env, fp_el, mmu_idx);
>   }
>  =20
> +/*
> + * If we have triggered a EL state change we can't rely on the
> + * translator having passed it too us, we need to recompute.
> + */
> +void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
> +{
> +    int el =3D arm_current_el(env);
> +    int fp_el =3D fp_exception_el(env, el);
> +    ARMMMUIdx mmu_idx =3D arm_mmu_idx_el(env, el);
> +    env->hflags =3D rebuild_hflags_a32(env, fp_el, mmu_idx);
> +}
> +
>   void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
>   {
>       int fp_el =3D fp_exception_el(env, el);
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4d5d4bd8886..59213310065 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7083,7 +7083,11 @@ static int disas_coproc_insn(DisasContext *s, uint=
32_t insn)
>               if (arm_dc_feature(s, ARM_FEATURE_M)) {
>                   gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
>               } else {
> -                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
> +                if (ri->type & ARM_CP_CURRENTEL) {
> +                    gen_helper_rebuild_hflags_a32_newel(cpu_env);
> +                } else {
> +                    gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
> +                }
>               }
>               tcg_temp_free_i32(tcg_el);
>               /*
>=20
