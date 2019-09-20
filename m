Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2803717wrp;
        Fri, 20 Sep 2019 12:27:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXdLX1aP1A8Hb9UKY40PTrY0rEBA2Y1DpiYAwx8rosttkYRFtbFVKOl1eZXrGvHjTC/TEh
X-Received: by 2002:adf:ef49:: with SMTP id c9mr13128567wrp.122.1569007657207;
        Fri, 20 Sep 2019 12:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569007657; cv=none;
        d=google.com; s=arc-20160816;
        b=UuEq8xWncdNKkjTYAEdVA0nxiiYsFsCXiHLX64DRl/k8nn5Z9ZTlNeu4RdUXXzpLRI
         oca2lfpv7WXhmoj2PktfA/NDiCDUva15OeeFT/PET89pT2nHGv5TsZbGI+8ssIjViL3y
         sNgHAO5ki/hlXXZGaHTIPO6AGBM+fQmr136pwOmjwzut0l9eAPUz9UYRwWzxNI2/RiX+
         UzuDi9rfXWoLtdI8lSVDmkahNXgn3HcOQ/ox/L+tzwsYUmpDDVc+e7kskJZ3kuN4xoTC
         x4S9gkiska93EVRZPqaD/0Kf8UG+Q6ZNgTnvR6QPZKWV3WdZHZEaYxSwSYZ2+F2bXuC8
         kBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ZLbGt7AKAZtt83OO0UsDS6v7d5QP5N95kaRb+sY7icc=;
        b=F+4Y8a2/ypVVGwvlyPnkX/A+iC+4kEV0tMVkgE0eKxpcaOQ/xr7CZHAfKbcZHjVMGz
         2y0EOYOlDV/DrWO0oCVLJYClHJVHJJXGE7HklahMbNL9NQRsfN4kuhrh6KiKYZr9klzL
         KttoRNXjPhjgNVxLNRGbLTphvrDByLaUJ3jV1S5uQRI5wQMOnpFQr5JGSGfR/rlfOUcL
         blW6f5DR6+tqEKZ8J8RtK1mWv9qad0UpliM0yY5l5LZsGqFfvbI99YfFWKd/NRxAtFWy
         le54EbTTpV7e5C/Yq02k6hv3eorwCtOzg3bUDI1raRaAsfFkNsRFWrX7wHZl1zLrpEPZ
         KCAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.131])
        by mx.google.com with ESMTPS id n16si439171wrg.43.2019.09.20.12.27.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 12:27:36 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.131;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M1JJC-1iE8eh0JBK-002oJ8; Fri, 20 Sep 2019 21:27:29 +0200
Subject: Re: [PATCH v2 06/16] target/ppc: fix signal delivery for ppc64abi32
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-7-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3a341d3e-ff80-2af5-8163-da6469d89d6e@vivier.eu>
Date: Fri, 20 Sep 2019 21:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190919171015.12681-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nxZl/62RJ0y43RIGrlYlNwhTB6TEv6JQ/X7nkTGgsXplZWufv49
 YRZZi2IjYtrc8d1isdlcDG8XQajcO6bpMizb1CWYuflVngJerLFYiO6NA9P6tSiE8xhonng
 MYCN2UB00J3dqnRHOax2XkkeOmS+LGBB2zMjY/J55TZtQimXjCO19a1kaLjKd9FSBRl/jGh
 vorgUKwpHIhfKVqWpIRqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1aVzMhnyIRY=:ntk5TOdy9Dk+KiqR8hBP4/
 ZEX5CO/573aED8IvjDXO+r3qJW7HriEeV7T6eKdFKPmqLEQlU//HITUZZHkDb4rZdJO2et2JJ
 /6gyXD1S0bO47oKsPEgyTuAHKXpDDca6SsI2SGiUGdlb/x8mmvrfwsFohHu8iH87PQRkenWbu
 Q0s6+WWPssKFwCeOVnA1j3CSrcmIqu5a4KKvJHh11WPMqNAWsGbmlAvBaWX+ET2Gwm8KrulbT
 TIx0q987vgVFlEhSOEI36sGiBDPVfXYNQYPq8rxgz+epspXN6g9PNnMysmEFy76HczYiMT9oE
 /FALlJUkvAoSvlrxek34srQXLQpMCowvwkrvbAaJ3BdzNcZ8QT+7GqnN/6V9xLAv6EzjUrgHk
 6/b2b1j8Loz8Es5pX9Gzkq3F2bsYokHDm+mN3JkTKhyZq9uFZOEjQAEprr2IiyZ34hyO0Jgqw
 /hSJeuGN6HS9A0OhjShWs5dlYAZK6Liowt+hzDlPtxYgsmoRx1oP5hkwIJ4gQJeaq5pkjtU6f
 rpVcl2jGTR/5fk8RqOky5L1eD5blgaXrDYK7KvzwQ70PZKCMoZzS8AmxcmNzRurBdisaTHgrU
 YnQSN/lUqe3hXUJESwPgs0l6MEOpg6XU2BKFWiYRUIJMVlNYmDWMvq5Cb9s2xufqqKxq0p2i5
 XuBflIiG/8uvx9WncP0xswOyHM5nll2Lj5nwRxGW45lpjubzNGCorsCLpAN99aaVuYfdp82nA
 6gnC1Q6xkZVwsTQb67UhmPTUVtIJP0xPwbJT6g6CN2PHqgfaCclRxsH29nC/prNi/xnJG7s+U
 rG0ClQLiK4cE1PeB3iy2L/fczQmjfbUpvDXZJ8lVe9ltZr6gniiPe5umMaWWe/uBm+QcCl4aH
 DT88S7A5qf/hp2eRXiubHnc9MeETG4DM7oWU+g8cw=
X-TUID: oHMd+J7eFn1a

Le 19/09/2019 à 19:10, Alex Bennée a écrit :
> We were incorrectly using the 64-bit AIX ABI instead of the 32-bit
> SYSV ABI for setting NIP for the signal handler.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v2
>    - change to wording
> ---
>   linux-user/ppc/signal.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index 619a56950df..5b82af6cb62 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -501,7 +501,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       int i, err = 0;
>   #if defined(TARGET_PPC64)
>       struct target_sigcontext *sc = 0;
> +#if !defined(TARGET_ABI32)
>       struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
> +#endif
>   #endif
>   
>       rt_sf_addr = get_sigframe(ka, env, sizeof(*rt_sf));
> @@ -557,7 +559,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       env->gpr[5] = (target_ulong) h2g(&rt_sf->uc);
>       env->gpr[6] = (target_ulong) h2g(rt_sf);
>   
> -#if defined(TARGET_PPC64)
> +#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
>       if (get_ppc64_abi(image) < 2) {
>           /* ELFv1 PPC64 function pointers are pointers to OPD entries. */
>           struct target_func_ptr *handler =
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
