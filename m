Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4221683wrg;
        Tue, 14 May 2019 09:56:08 -0700 (PDT)
X-Received: by 2002:adf:eb02:: with SMTP id s2mr15921545wrn.29.1557852968792;
        Tue, 14 May 2019 09:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557852968; cv=none;
        d=google.com; s=arc-20160816;
        b=U1PC2YF2EAcIZzOR8FPZybntUPym53iWr1lSipTr13gcHi1K3FdmEez1eDw4qcVn2Q
         6kAe0dHbrUaWHfIlAU0GTwnYBD7BHaiA/4pXGdjA+EQb9ogHLD+1wh/avoSglOZPTkiH
         RE7ZpO37YdtujUJW2GDoPoHjJDymcbY0vxTm2aWN8pBHy7mjlNmqrW3mNbJdmTZzOtTa
         vJNk8LlSfejcONaSEeVwVoAcqJ6wjPqG/I+5VGnCqPI8voILhnprKrHoLbrytdPNm9/8
         S23asE4dhovaVTt/MoSusma4NOgce0nd6NCb9IsJJVL16pUTheChm/T8BFoSKOLDzeHI
         dbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=wVzWKCSgq0uOq8MbdDKMrwMceaiMFq2iCJT4QoKJH5g=;
        b=06PNF97zYkK9Q/ze2jPRR7Eh4SoBZoJKq4bAg2d+t59RxcbPykitW41qg0Po4YUALK
         3dpiFiu/yr8tmvzpGti5zgacjHdLCqC2/VCCfyNIiyO2jgK7hjCepr7lEJmqncbu+hSI
         rZXTy8f2n202N0JefQJhfVDaJgAhZqczENxgyXoFE4yNFM94P9llUKj8K8GQFlUELDjA
         k2tfnt2p0nni5hdH1s2DSVQF8ivrWDxM3S50r2j4wygFnwG6Wmh6r3YUuMbddrIvSNQJ
         UJ/B+NRzTwlqFrZrKJMdFl0XeAtWcI6tSCB6of2BAFiUEBm1vznwSa+oRs6g0qzPHgQB
         mbQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v17sor3655156wrn.11.2019.05.14.09.56.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2019 09:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wVzWKCSgq0uOq8MbdDKMrwMceaiMFq2iCJT4QoKJH5g=;
        b=YNyetekJqyDpH5zkwt1Hs6PCA1EegbI905fueplAaiA2nlvkNC1slwPJOrTPACMWNI
         urtu/B35p2D4LMWeQXDOrGMEcS005+s81Alq4wvBOLA1duSli1wEaG2Rfk0Xq9RgK9KP
         K3+ssyaYmpgreDIKtiABJZEmmFlm5neNkpCT+7cBmOiNK+dymaAz46riU6yHzhlvca4D
         diR1kpvG7EnoAewXskGqYiLSqNIAr/eVR31slXfajwiNvsO8fmFoX2yELb6N7+Nvtm6V
         RPT9dHoUxRZ+mJStmbDNmin4+90bTL8Yb7C87r6CwB1tdPsJb1Xb9+Q9Ch4JyyVFBTEw
         rFSQ==
X-Gm-Message-State: APjAAAVG85AgKPWOFhZGH8pkr2iMeUfBxQ82hSz7Nne5nhfpK+1u9xiZ
	73+qc31hymySLq9O6Q2+EuCex0BwHXc=
X-Google-Smtp-Source: APXvYqzP0sEAlpzXDtC5kiXCCF5L09AJcI5lZ2idu32vaVrD+fPhBPctFVsV7DCHlCxY8HjoFFfVGw==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr19179232wrn.201.1557852968579;
        Tue, 14 May 2019 09:56:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id m187sm2053932wmm.37.2019.05.14.09.56.07
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:56:08 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 05/11] target/arm: fixup some of the
 commentary for arm-semi
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1a9c7ca7-59a9-7075-c4a4-470a8342f1bd@redhat.com>
Date: Tue, 14 May 2019 18:56:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514155301.16123-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /9W8YyTCHquG

On 5/14/19 5:52 PM, Alex Bennée wrote:
> This cleans up a number of the block comments to fit the proper style.
> While we are at it we also reference the official specification and
> document what the return register value can be.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/arm-semi.c | 40 +++++++++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 3273306c8ea..9e5a414dd89 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -2,6 +2,7 @@
>   *  Arm "Angel" semihosting syscalls
>   *
>   *  Copyright (c) 2005, 2007 CodeSourcery.
> + *  Copyright (c) 2019 Linaro
>   *  Written by Paul Brook.
>   *
>   *  This program is free software; you can redistribute it and/or modify
> @@ -16,6 +17,10 @@
>   *
>   *  You should have received a copy of the GNU General Public License
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + *  ARM Semihosting is documented in:
> + *     Semihosting for AArch32 and AArch64 Release 2.0
> + *     https://static.docs.arm.com/100863/0200/semihosting.pdf
>   */
>  
>  #include "qemu/osdep.h"
> @@ -240,6 +245,15 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
>       put_user_u64(val, args + (n) * 8) :                \
>       put_user_u32(val, args + (n) * 4))
>  
> +/*
> + * Do a semihosting call.
> + *
> + * The specification always says that the "return register" either
> + * returns a specific value or is corrupted, so we don't need to
> + * report to our caller whether we are returning a value or trying to
> + * leave the register unchanged. We use 0xdeadbeef as the return value
> + * when there isn't a defined return value for the call.
> + */
>  target_ulong do_arm_semihosting(CPUARMState *env)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -510,14 +524,16 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>  
>              output_size = ts->info->arg_end - ts->info->arg_start;
>              if (!output_size) {
> -                /* We special-case the "empty command line" case (argc==0).
> -                   Just provide the terminating 0. */
> +                /*
> +                 * We special-case the "empty command line" case (argc==0).
> +                 * Just provide the terminating 0.
> +                 */
>                  output_size = 1;
>              }
>  #endif
>  
>              if (output_size > input_size) {
> -                 /* Not enough space to store command-line arguments.  */
> +                /* Not enough space to store command-line arguments.  */
>                  return -1;
>              }
>  
> @@ -571,8 +587,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              GET_ARG(0);
>  
>  #ifdef CONFIG_USER_ONLY
> -            /* Some C libraries assume the heap immediately follows .bss, so
> -               allocate it using sbrk.  */
> +            /*
> +             * Some C libraries assume the heap immediately follows .bss, so
> +             * allocate it using sbrk.
> +             */
>              if (!ts->heap_limit) {
>                  abi_ulong ret;
>  
> @@ -620,7 +638,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>          }
>      case TARGET_SYS_EXIT:
>          if (is_a64(env)) {
> -            /* The A64 version of this call takes a parameter block,
> +            /*
> +             * The A64 version of this call takes a parameter block,
>               * so the application-exit type can return a subcode which
>               * is the exit status code from the application.
>               */
> @@ -633,14 +652,17 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>                  ret = 1;
>              }
>          } else {
> -            /* ARM specifies only Stopped_ApplicationExit as normal
> -             * exit, everything else is considered an error */
> +            /*
> +             * ARM specifies only Stopped_ApplicationExit as normal
> +             * exit, everything else is considered an error
> +             */
>              ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
>          }
>          gdb_exit(env, ret);
>          exit(ret);
>      case TARGET_SYS_SYNCCACHE:
> -        /* Clean the D-cache and invalidate the I-cache for the specified
> +        /*
> +         * Clean the D-cache and invalidate the I-cache for the specified
>           * virtual address range. This is a nop for us since we don't
>           * implement caches. This is only present on A64.
>           */
> 
