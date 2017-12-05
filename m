Received: by 10.223.159.74 with SMTP id f10csp3309614wrg;
        Tue, 5 Dec 2017 13:24:58 -0800 (PST)
X-Received: by 10.55.192.19 with SMTP id o19mr22386124qki.148.1512509098295;
        Tue, 05 Dec 2017 13:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512509098; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMsSENSgJzN2R1CC2HcNnb9QUUoUF/CrSZRzJPKVE4IAAi7jal4r14bwqq0SnjUL8Y
         RB+tOYZ+iUUVPiTeasboH0KajhT0zKryFCG3sWMKbwBEIg8zcxY6BEiqezHw2iw2uWXb
         hlF0ko1ab/o3tMms6v7QlJ5G3VtLBgzYO2oHIn/93A9aVGRd8hEb/j6atybNCL+96Uid
         zY/5Ux154mhx3t+mtfMhXPK4ADaBTFHfPqBU63vnM6vmWDqSKVQbMg1qOhUtEd+H7jR1
         4tBUAkMqOV6VQJOwAjI48m7oBvhETsUwyJdnjDG8cjX+wWvufcQi3COPMVSGv4ZSNK7T
         4F+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=J+09x2DaH6VskbojKdAn0vSYRJyK7NAPPjCsq4wJOIA=;
        b=rfHgWaT88YmmEsU6q3mMcm7cqoWY92/+Et2xsmbgyqjq//GYcp4wRQUVIblmzGTM9w
         Nr0Vg9iIAaBiM1Gt55HF09ZIBmCfjRnpOkupvMkKESUEH98nYRJQ03tMf3pRTWOKks0U
         Ru1xuJhBADZEN+o/2sh5nIBawQroloHZ4XD7zr0ExP9Bmsxh+ENdteSjaqwFT4/LUlGC
         GB4+JdMU1OKaPeZWuqgGK0n3KOfTHnYoOWuv9SN/g141OJvmJgRE+/leC1jH7Vc0gjRx
         lBAZphlLWY9bjHj2Mi1TzMf7GhgHXMS6fkFMN3jkP14/l0YfiFhZegIn4NLIPpDMP4oh
         rHcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFsA4pOR;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f4sor852003qkj.104.2017.12.05.13.24.58
        (Google Transport Security);
        Tue, 05 Dec 2017 13:24:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFsA4pOR;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J+09x2DaH6VskbojKdAn0vSYRJyK7NAPPjCsq4wJOIA=;
        b=UFsA4pOR8fKXVDaNyYiXL31O5nztZM2R5+4PVxFQ6G8W/gT86ETCx987c4Gib1X81A
         oJwe1/BR8vpa+9Q3eTKcRZYtJgKBlDEKhNauiKoBHLpp0sVyUAmN2ytGL0g7JEz/3/Hc
         E+GV+/ag8wI+pmaCZ0iXknrh6jR9NWKC2TMx3xge5cGgAts4VtjGZcpG7yklRE0IsFhT
         rAM0qVFXF5pWxOPYfcj4dT1sJbwSSUtAJeEJxn/8IhqBrLve6Z/3PrijCoiyewivW73S
         SQeFyYDhQida3wuEB7O9kPbm2IRMY0+nIUrnPbx4STq1sSDTfb4qVPhL/fDJ1hSsfP/8
         fDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=J+09x2DaH6VskbojKdAn0vSYRJyK7NAPPjCsq4wJOIA=;
        b=WUg6RIb9gLjP7Riwsmt8euT4eHcfa+EPU1D1R9ltb831UGLvE8Kh1XA3jvs+7OjKR6
         N4PGH3+gDloTZJ2CwH6QSU23eFAdiV1VlehlpN8bM/BalttEadxNuQ3FAlPzqh2U3YrX
         xmXjXsRXyYj+4BC5vkajZv/WznY/68VEMqfIHAL9VjfaDefUOA5mXHTViFxaV2zG5kXR
         6WI0dPy3ZpnlFD+kN8YofGa1FhCGy9nO/sFoP00SqF8IQm64D1LsIx1V/CCiTj7/8KY7
         tKMGR8AwxRp6l+uj7BDZCCUFN/dq49PVllAdciRuju2e7qlxinpsVC5nQgMQpuy3+aqF
         Yhfg==
X-Gm-Message-State: AKGB3mL08fvfmmL8haK0HA5UTWv9vX8OVBvcDULvJbEou20idsDckluB
	06j5j965bmObv9XryuD3+48=
X-Google-Smtp-Source: AGs4zMbic9O8uSAFz02mkjL7YzQKgKjg2JrppR2SSubj+FfzpS7E9nfOcwer0m2jTdStNLZPTxrXYw==
X-Received: by 10.55.40.76 with SMTP id o73mr23956775qkh.301.1512509097914;
        Tue, 05 Dec 2017 13:24:57 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.211])
        by smtp.gmail.com with ESMTPSA id j1sm643302qkc.5.2017.12.05.13.24.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Dec 2017 13:24:57 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 5/7] target/arm: Create new
 arm_v7m_mmu_idx_for_secstate_and_priv()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-6-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <db3a4f0f-361f-eeaa-9092-22d6f24528bd@amsat.org>
Date: Tue, 5 Dec 2017 18:24:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: q24RxqMbOC50

On 12/01/2017 03:44 PM, Peter Maydell wrote:
> The TT instruction is going to need to look up the MMU index
> for a specified security and privilege state. Refactor the
> existing arm_v7m_mmu_idx_for_secstate() into a version that
> lets you specify the privilege state and one that uses the
> current state of the CPU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.h | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d228fe6..1f414fd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2334,14 +2334,16 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
>      }
>  }
>  
> -/* Return the MMU index for a v7M CPU in the specified security state */
> -static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
> -                                                     bool secstate)
> +/* Return the MMU index for a v7M CPU in the specified security and
> + * privilege state
> + */
> +static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
> +                                                              bool secstate,
> +                                                              bool priv)
>  {
> -    int el = arm_current_el(env);
>      ARMMMUIdx mmu_idx = ARM_MMU_IDX_M;
>  
> -    if (el != 0) {
> +    if (priv) {
>          mmu_idx |= 1;
>      }
>  
> @@ -2356,6 +2358,15 @@ static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
>      return mmu_idx;
>  }
>  
> +/* Return the MMU index for a v7M CPU in the specified security state */
> +static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
> +                                                     bool secstate)
> +{
> +    bool priv = arm_current_el(env) != 0;
> +
> +    return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
> +}
> +
>  /* Determine the current mmu_idx to use for normal loads/stores */
>  static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
>  {
> 
