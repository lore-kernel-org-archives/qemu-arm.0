Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp369544ejb;
        Mon, 13 Feb 2023 08:59:36 -0800 (PST)
X-Received: by 2002:a17:90b:1896:b0:230:9f49:4334 with SMTP id mn22-20020a17090b189600b002309f494334mr27932299pjb.31.1676307576616;
        Mon, 13 Feb 2023 08:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676307576; cv=none;
        d=google.com; s=arc-20160816;
        b=TYJP7InyklJfezAd+mqt+u1AbWaGAzvWTuqaCdeU88DQW0Oxlbno5DExDX+g9x5/R3
         PClBwwT9GPVm7oVco3J9EFU9CFA+ngtCilHdghykykKlIcwYKwp/NQEE59EIoOHngbMb
         xWMK8My6lYVrWUff4jTsLrV1UftV99dhHTobZd7htuHi++T8KpGKRIbP3yy8gbdCzAqa
         9/DYeg959pVA1iTwIwTS9GPHwb32rdbZpsD6/GR1woLUVYPMxa0nQ1FEXHc2LTU1uVUJ
         0HWWMNcD+4aMnrsQzcunQDRFxzlYzRx0vDLIA5Jm0o5uWFgvQG5igUIju78AlAQO6hR7
         VhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NsvtVvw7T1GMc9kMqiVnYI0aKhZu9oU9cluMSV24Bbc=;
        b=kOZOHvW4wrZKGWWxCxyNO/oibSGPOL+HrhNgIL0LrnEYsKhjkra2F7njDGc10nKV2T
         FwwJvPQtHCINsFhVRAPC3IVfo1Ai+wtiY4UEGPpsMVRoneX2xTDJvxvKoAsJhwdG2tjE
         vq+5YHRGB3FmF3M2xp6S6RBg/cVyCx37p3yV5sTY1Sp0UGLxgGwzUtNewNpvDuCKj7VR
         c53UlURlW7IYhwmP8sq9uX6pAElOjOwisaXmZtkiVLb2xmkYgpCy3Yh4BuLXpbeULpkO
         DWBLwKCktmztObPAskzyp60d3Up3UJ+zH5HOafGX/l4r6165/qQ5vflSYB6szdoPmDCx
         mxfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PA6gOXQ9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u22-20020a17090a0c5600b00228e5d8a8fdsor6768220pje.15.2023.02.13.08.59.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 08:59:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PA6gOXQ9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NsvtVvw7T1GMc9kMqiVnYI0aKhZu9oU9cluMSV24Bbc=;
        b=PA6gOXQ9Npf/QsQ5qXhZbIjfiBjehHiDP98K8KjDMBFzZiM+DUTiaj/xI78daqfUtV
         exC5V07HW9ygnVNOe+mQFmtyGKNAVm45y6DFIID4Z00VSX40hpkmQ4PDdD2gt8ShIzlN
         Wp1iGJxcgXngC4XvUe5iUMxZykJUKZDn35U/4NClzdULiFcVzT4IUMVB7bTL7OsjFDRm
         CQPOUPBgpvzQntX1OvFHyQ8hZtzuX5DB8b0wLT3k9ope7kv6QASSJMPnkLnud4vSXHAe
         EGZVJFXuL95ELsTclQ+Yi6LwYT86q3Yp2ZoWR2N4T4f6coLiToLx6b9UcLvZ9zh+2MrZ
         85Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsvtVvw7T1GMc9kMqiVnYI0aKhZu9oU9cluMSV24Bbc=;
        b=Rwv8PF29tlocMmJVF4eVNQdnsE1JubaGSU+ye4ae9HDfSvFngpUBbb+dJSlVON9jy0
         1Ko8LmF68yZQuj5wQz7uEFlySxzDvp1tNAtSMdCV6gZyANbLpwX6XdpMxxe+7ugMxFXj
         9hMmgPI60kubwS6b5hN7S+qeNoUs5CWGx90QK9mtnzdXoia35/C8yy+uLixnez+GzolU
         c7FoOc0S9xVOKUujKVGfjGo+ZHaXEaaBH2q8s0JQmtTeiGCyQrGavqgEdZvnA8QXM1oG
         SXDN64OVWx6ZqA2p9fnFos0qw2r02XG+ZAPS8vY+hcp/f4JVRSwxTBuO3kJglm/lkEdT
         Bcdg==
X-Gm-Message-State: AO0yUKXdpKft2EiPKyvq/gXTMpr8j0avKPtihlewhJ2CTsW5Ms+YL/a4
	dCJygaRBGUbgExQQIR3KXvYsIJuDKqFkWUMoEJ0OLONC
X-Google-Smtp-Source: AK7set9B2He/riW52EJ9DOMBhNIHTE9r2V8WCim/fYUAsYxzSxXz1HNe+BGykFh0iYpCP38+mwoQ4YEzkEaFp1fGstI=
X-Received: by 2002:a17:90a:3cc5:b0:229:fe24:91c with SMTP id
 k5-20020a17090a3cc500b00229fe24091cmr4676856pjd.16.1676307576004; Mon, 13 Feb
 2023 08:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com> <20230202211129.984060-7-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-7-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:59:24 +0000
Message-ID: <CAFEAcA_Vyi7EaEC92WZGT0vujxuiUoZLorXdVhux8A2PASsWeQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: elZ610xEJIfD

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/pauth_helper.c | 26 ++++++++++++++++++++++++++
>  target/arm/syndrome.h     |  6 ++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index 66dc90a289..3a2772de0e 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -385,6 +385,21 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
>      return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
>  }
>
> +static G_NORETURN
> +void pauth_fail_exception(CPUARMState *env, int error_code)
> +{
> +    int target_el = arm_current_el(env);
> +    if (target_el == 0) {
> +        uint64_t hcr = arm_hcr_el2_eff(env);
> +        if (arm_is_el2_enabled(env) && (hcr & HCR_TGE))
> +            target_el = 2;
> +        else
> +            target_el = 1;
> +    }
> +
> +    raise_exception_ra(env, EXCP_UDEF, syn_pacfail(error_code), target_el, GETPC());

This won't work -- you must call GETPC() from the top-level helper
function directly called from JITted code, so that it can get the
PC of the callsite in the JITted code. Otherwise you'll get a PC
somewhere inside QEMU's C code, which won't do the right thing.
This is why pauth_check_trap() takes an 'ra' argument (for
'return address') and all the top level helper functions call
GETPC() to get the value to pass.

> +}
> +
>  static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>                             ARMPACKey *key, bool data, int keynumber,
>                             bool is_combined)
> @@ -403,6 +418,17 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>          uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
>              ~MAKE_64BIT_MASK(55, 1);
>          result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
> +        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
> +                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
> +                 !is_combined)) {
> +            int fpac_top = param.tbi ? 55 : 64;
> +            uint64_t fpac_mask = MAKE_64BIT_MASK(bot_bit, fpac_top - bot_bit);
> +            test = (result ^ sextract64(result, 55, 1)) & fpac_mask;
> +            if (unlikely(test)) {
> +                int error_code = ((data ? 1 : 0) << 1) | (keynumber);
> +                pauth_fail_exception(env, error_code);
> +            }
> +        }
>      } else {
>          test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
>          if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
> diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
> index 73df5e3793..885a85735c 100644
> --- a/target/arm/syndrome.h
> +++ b/target/arm/syndrome.h
> @@ -48,6 +48,7 @@ enum arm_exception_class {
>      EC_AA64_SMC               = 0x17,
>      EC_SYSTEMREGISTERTRAP     = 0x18,
>      EC_SVEACCESSTRAP          = 0x19,
> +    EC_PACFAIL                = 0x1c,
>      EC_SMETRAP                = 0x1d,
>      EC_INSNABORT              = 0x20,
>      EC_INSNABORT_SAME_EL      = 0x21,
> @@ -221,6 +222,11 @@ static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
>          | (is_16bit ? 0 : ARM_EL_IL) | etype;
>  }
>
> +static inline uint32_t syn_pacfail(int error_code)
> +{
> +    return (EC_PACFAIL << ARM_EL_EC_SHIFT) | error_code;

You need ARM_EL_IL here too, I think.

I would suggest that you make the syn_pacfail() function take
two arguments (bool data and int keynumber), and put them in to
bits 0 and 1 in this function. That avoids the need to
construct an error code at the callsite.

> +}
> +
>  static inline uint32_t syn_pactrap(void)
>  {
>      return EC_PACTRAP << ARM_EL_EC_SHIFT;
> --
> 2.25.1

thanks
-- PMM
