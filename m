Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3590147lfk;
        Sat, 5 Feb 2022 18:10:56 -0800 (PST)
X-Received: by 2002:a63:8b4c:: with SMTP id j73mr4704232pge.580.1644113456493;
        Sat, 05 Feb 2022 18:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644113456; cv=none;
        d=google.com; s=arc-20160816;
        b=uqwGlwnlb3yI0o+hBUpLPp/2GhOWCL+/qlGjSispx+60EuG6CnDdSEYBrI+FnIUMWw
         YRMMYQjqwCZDuzCTZL5l9RLdXtXHDRLr3FBZEOJhZZw+U5VT7ka+UelB194VeaKSotfk
         K84RBrvOq7NgcNqt/NdwJW/bCxNIskbyuO5bOESUl7fJSPJc8AgrYnar5c8ME9i2P3Vz
         2iKm9MMwCh0jurIjUqJksfXclZS65kJjgS1e5zZg79YKZx1zDgrcC6V+2hbF7Pwlbsr0
         XC0abCar2Ofre0fB9f5lfWnfQ9yl7JWD5gU3O/cji2C9rgjf34U38mY5ZBqcpVGaQ71T
         y8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=schmzfMhhpKQ1PwUv1iJuqca/R5eJgSH9k9LB3Uj6Nk=;
        b=nSsg/x7FyuVj3Je0YRbrPgjTTk5NNPNqi1iNhaucx9TqBZVLsm4QJx2OwiRpGSFZDl
         QEYgaf7mexCwHuMfgxBoWBQ+j9Icj6+kzgnbY1g2l++p1TS2DJhouwikwqSEbPz4/QKT
         V8p+RUhwMBcXp9YhwPK55YDHVmjc+J56oM+181D2MdF/aJzDLX5RmB1FRE0iKfEjRxct
         dk1saoywsVgew+tdJxeDRRpWlhvFvLVRMWS7RHoz8U5NaYmqt1xA/t+ZH9A5g26sQLch
         etTZoe5U8fwvwxkoZ5GMDAGQfS+16hH6LLtrCMWSV9sIS6YtgIIJ7+FPsgodmS1TRrht
         w3/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yKIAr5AS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fs17sor2501058pjb.13.2022.02.05.18.10.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Feb 2022 18:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yKIAr5AS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=schmzfMhhpKQ1PwUv1iJuqca/R5eJgSH9k9LB3Uj6Nk=;
        b=yKIAr5ASg8r5Rb3H69QmMHGu0HcoPzzBj4BpRazpuRe1g71a6WY30T3cgDmH4uR4YW
         dfwyPzUZ4XAvZRnCqzeYgFrWoSpW6VlTfd/WRYJhGNuEB0wCouEL7E72WXnThq/l7dA1
         m4haSYpkFujNyFVjxpa++1zH/jf8fx8twzpaAQ4y6gwjmnJGn2onE2Lp9q7n5ChA+WlT
         Hzr49MOTaVaSYpeNwjCnLl95zJyZ/fNM40Ryr/MGqbrveWtzwvG73Huck0CiyYucC+gv
         JPDFE3AExJDpY3f8ZeKanekVsCDnfX+naal7Sn7hyoPGy9aobAlQDwUjye87rNt93hHK
         ZnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=schmzfMhhpKQ1PwUv1iJuqca/R5eJgSH9k9LB3Uj6Nk=;
        b=nmhVngGslsb1qVLH/FlTEnUwD8v1MHUzcQhZ8Eg2D3mwMl9vxW/PeCits3+6ekqaYQ
         C0ouKLOGCFFF7XfAfWVoxeYp4hAqBw1RHVkd+BTgFv1p1NfaWw0JEcOjnnJVPUtqtFES
         TAG/6zVD/0EAlL/wJBX4S8RZOC0k8JACRcmc+oL5v4xcxDAdoU9UVMS697+EAKSxFomn
         tSVNfF+FMpOKuKH7JUCbJTB0BU7akvT8IHo8wYEjKe3wjuhXAMNYH57ssTPgde1oqPRX
         NvD6t211WXgPMs0h38Naf7jpDtbpqR91TUTZQVlgVyC19/IJeCzUAC9Lh9rIabXe6f0V
         cLEw==
X-Gm-Message-State: AOAM5328Bo7R5uI777gok+ZY4ECGiUvTseO4E4C+e5y5Q+heojSl5jsS
	WsBVr7oCdu0fVFYYPzwfpyK6bhjfeO+ICl8Z2Ak=
X-Google-Smtp-Source: ABdhPJxwHRodrPdHE/vWHgvYwefe3cEbKckxrrCmnF5o9b4j1wIilVEvoerwgzGhZLiSVxYZH2vcyg==
X-Received: by 2002:a17:90a:4045:: with SMTP id k5mr11377589pjg.98.1644113455851;
        Sat, 05 Feb 2022 18:10:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.118] ([220.235.247.127])
        by smtp.gmail.com with ESMTPSA id c11sm4783061pgl.92.2022.02.05.18.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 18:10:55 -0800 (PST)
Message-ID: <9d460def-1d50-94af-f6c8-e6208421eb41@linaro.org>
Date: Sun, 6 Feb 2022 13:10:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] arm: force flag recalculation when messing with DAIF
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220202122353.457084-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202122353.457084-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZJIVbKwgu++6

On 2/2/22 23:23, Alex Bennée wrote:
> The recently introduced debug tests in kvm-unit-tests exposed an error
> in our handling of singlestep cause by stale hflags. This is caught by
> --enable-debug-tcg when running the tests.

You could mention that PSTATE_D is used by aa64_generate_debug_exceptions.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Andrew Jones <drjones@redhat.com>
> ---
>   target/arm/helper-a64.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index d6a6fd73d9..7cf953b1e6 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -83,12 +83,14 @@ void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t imm)
>   {
>       daif_check(env, 0x1e, imm, GETPC());
>       env->daif |= (imm << 6) & PSTATE_DAIF;
> +    arm_rebuild_hflags(env);
>   }
>   
>   void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
>   {
>       daif_check(env, 0x1f, imm, GETPC());
>       env->daif &= ~((imm << 6) & PSTATE_DAIF);
> +    arm_rebuild_hflags(env);
>   }

You could call helper_rebuild_hflags_a64 directly, since we know that we must be in a64 
state to get here.  Regardless,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
