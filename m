Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id gb9sm15080579wjb.26.2016.02.05.01.52.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 01:52:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id CB87C3E025C;
	Fri,  5 Feb 2016 09:52:16 +0000 (GMT)
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org> <1454506721-11843-2-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 1/7] target-arm: Fix typo in comment in arm_is_secure_below_el3()
In-reply-to: <1454506721-11843-2-git-send-email-peter.maydell@linaro.org>
Date: Fri, 05 Feb 2016 09:52:16 +0000
Message-ID: <87r3gro567.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: KLheJ0Hbsg92


Peter Maydell <peter.maydell@linaro.org> writes:

> Fix a typo where "EL2" was written but "EL3" intended.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index b8b3364..52284e9 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -931,7 +931,7 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
>          return !(env->cp15.scr_el3 & SCR_NS);
>      } else {
> -        /* If EL2 is not supported then the secure state is implementation
> +        /* If EL3 is not supported then the secure state is implementation
>           * defined, in which case QEMU defaults to non-secure.
>           */
>          return false;

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
