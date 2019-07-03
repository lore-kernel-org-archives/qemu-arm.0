Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp998109wru;
        Wed, 3 Jul 2019 09:30:15 -0700 (PDT)
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr8736719wmd.131.1562171415917;
        Wed, 03 Jul 2019 09:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562171415; cv=none;
        d=google.com; s=arc-20160816;
        b=jrcAel5bsA+9vuAlK8zBTyx5MT9k2Bxx3G57ogtyZmyifFCGZ1xKoWOFyc1RZPQHM7
         sB0L1kFn7MIjiV7p/4H/uRLgCDYGjRlSfLGEB5N5q4ZB9qBrZh/s6g6Q7qv7fHLR+9mq
         v2LnRQIjqXIYOZSk0rA57Nmfop4BBITEzv7Vkoz/REXNwIsn1xWABXNREH9x0svgfjxw
         7KiR6bEddMXjb772up2KLfsys9duauKr3LBXh3qU34R2N2rND4zLADd+yuDHhwKo/M9V
         e06gchEDlSuue6Ewtf5ZWBdh/0K8jNRs+osLh+OZvazt9CjpLvtQ+I/7siXd22Ft8UqN
         kZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=fAgKoVc5rJpOBso8YWvFvQkqXAsIN6gxNQmHw50/uC0=;
        b=tyfwsQ42LbxZXkWUUMrXMtObtGo1LCl9sIRDmO5d2E00QvzVMiQgF28u2Xbl69tWoF
         /g+Yyy89rQRE5D2WaH0VGxQFKSKc+ttLVQVlVoZIUYKrSiVj7/e4aJ6LVfTxF/kFqz3p
         MiVJNWRGCew3U33rkPePAnhK5xPYXe0Kbb+lqFJwB+8lsT77HM1fhH3nHNUKnvMF3F9r
         SvYtqAQCX2Y4+3N8ierq+ockP5boKwgyJbCqV3dmrhEI5z5C+RnupFQaECkyutt1wy5W
         pE46ybcTSBakUe4oM/+NXDmP6N0sYuSPP3i4Ew7nhiGLFtV8kYSZkCrcNXlqxK7jcjJ3
         L/Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x6sor1625132wmb.29.2019.07.03.09.30.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jul 2019 09:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fAgKoVc5rJpOBso8YWvFvQkqXAsIN6gxNQmHw50/uC0=;
        b=E9gKMDYp228FDworJEouNNfUmchyw5yFZkzbWZRdVHVGj8Ws9qjgPCzuyY2IdCEmVl
         BU0WOrrunHpzsRjB2yo79h/Hxyy5uRuJYOx7li3OQKSfFexiTAXQuiaJBYUmRlJP2yRR
         SlYfc/XCTW+scGlOqHW6kXjcKQaixPBRmRrmwqXApkPhCFvTE7Ap74qTIRRaedbxO/6X
         1RmzMpQotddUDqwS1Ghto+sdp5ejiKT+T7CunHKOlDzFWACvoK1sHVzuetwzdb4jMUnt
         IK/aT7qiYG03LuxyHoaGkskrXmS+JKY8IiFCI2qAFhreNutjcV0n2cdRwuAuGNA0xutO
         tUaA==
X-Gm-Message-State: APjAAAUUKBquocFQs/ktGgxhAF6VcfL4MlAt+2iUmbouJ8AINGdDqAgK
	cNOxTkfWJyC3zJSAJ0ux535RwA==
X-Google-Smtp-Source: APXvYqwLi2R9eXlhAMaOttzbzkRGUsyUXAOfFnwFk0BXbgzimxRufBFJ2yYLXY2Ns3+3oP0tFxT+ug==
X-Received: by 2002:a1c:411:: with SMTP id 17mr7862812wme.74.1562171415654;
        Wed, 03 Jul 2019 09:30:15 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id h6sm3323312wre.82.2019.07.03.09.30.14
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:30:14 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 4/4] target/arm: remove run time
 semihosting checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190703155244.28166-1-alex.bennee@linaro.org>
 <20190703155244.28166-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2c0b9e7f-f4d1-b52b-1f3a-4100bf50c151@redhat.com>
Date: Wed, 3 Jul 2019 18:30:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190703155244.28166-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: G8jGQv+oUxG6

Hi Alex, Peter.

On 7/3/19 5:52 PM, Alex Bennée wrote:
> Now we do all our checking and use a common EXCP_SEMIHOST for
> semihosting operations we can make helper code a lot simpler.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 84 +++++++++------------------------------------
>  1 file changed, 17 insertions(+), 67 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ad29dc4072..5c1f741380 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10364,83 +10364,33 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>                    new_el, env->pc, pstate_read(env));
>  }
>  
> -static inline bool check_for_semihosting(CPUState *cs)
> +/*
> + * Check whether this exception is a semihosting call; if so
> + * then handle it and return true; otherwise return false.
> + *
> + * All the permission and validity checks are done at translate time.
> + */
> +static inline bool handle_semihosting(CPUState *cs)
>  {
> -    /* Check whether this exception is a semihosting call; if so
> -     * then handle it and return true; otherwise return false.
> -     */
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
>  
> -    if (is_a64(env)) {
> -        if (cs->exception_index == EXCP_SEMIHOST) {
> -            /* This is always the 64-bit semihosting exception.
> -             * The "is this usermode" and "is semihosting enabled"
> -             * checks have been done at translate time.
> -             */
> +    if (cs->exception_index == EXCP_SEMIHOST) {
> +        if (is_a64(env)) {
>              qemu_log_mask(CPU_LOG_INT,
>                            "...handling as semihosting call 0x%" PRIx64 "\n",
>                            env->xregs[0]);
>              env->xregs[0] = do_arm_semihosting(env);
> -            return true;
> -        }
> -        return false;
> -    } else {
> -        uint32_t imm;
> -
> -        /* Only intercept calls from privileged modes, to provide some
> -         * semblance of security.
> -         */
> -        if (cs->exception_index != EXCP_SEMIHOST &&
> -            (!semihosting_enabled() ||
> -             ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR))) {
> -            return false;
> -        }
> -
> -        switch (cs->exception_index) {
> -        case EXCP_SEMIHOST:
> -            /* This is always a semihosting call; the "is this usermode"
> -             * and "is semihosting enabled" checks have been done at
> -             * translate time.
> -             */
> -            break;
> -        case EXCP_SWI:
> -            /* Check for semihosting interrupt.  */
> -            if (env->thumb) {
> -                imm = arm_lduw_code(env, env->regs[15] - 2, arm_sctlr_b(env))
> -                    & 0xff;
> -                if (imm == 0xab) {
> -                    break;
> -                }
> -            } else {
> -                imm = arm_ldl_code(env, env->regs[15] - 4, arm_sctlr_b(env))
> -                    & 0xffffff;
> -                if (imm == 0x123456) {
> -                    break;
> -                }
> -            }
> -            return false;
> -        case EXCP_BKPT:
> -            /* See if this is a semihosting syscall.  */
> -            if (env->thumb) {
> -                imm = arm_lduw_code(env, env->regs[15], arm_sctlr_b(env))
> -                    & 0xff;
> -                if (imm == 0xab) {
> -                    env->regs[15] += 2;
> -                    break;
> -                }
> -            }
> -            return false;
> -        default:
> -            return false;
> +        } else {
> +            qemu_log_mask(CPU_LOG_INT,
> +                          "...handling as semihosting call 0x%x\n",
> +                          env->regs[0]);
> +            env->regs[0] = do_arm_semihosting(env);
>          }
> -
> -        qemu_log_mask(CPU_LOG_INT,
> -                      "...handling as semihosting call 0x%x\n",
> -                      env->regs[0]);
> -        env->regs[0] = do_arm_semihosting(env);
>          return true;
>      }
> +
> +    return false;
>  }
>  
>  /* Handle a CPU exception for A and R profile CPUs.
> @@ -10476,7 +10426,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>       * code that caused the exception, not the target exception level,
>       * so must be handled here.
>       */
> -    if (check_for_semihosting(cs)) {
> +    if (handle_semihosting(cs)) {
>          return;
>      }
>  
> 

This patch clashes with this one:
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00343.html
that Peter already queued:
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00692.html

Peter, if you want this for 4.1, it might be easier to dequeue "Restrict
semi-hosting to TCG", apply Alex series, and re-apply "Restrict
semi-hosting to TCG", the conflicts should be trivial (function name
changed check_for_semihosting -> handle_semihosting).

Thanks,

Phil.
