Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1019880wru;
        Wed, 3 Jul 2019 09:53:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1c9:: with SMTP id t9mr18240461wrx.187.1562172805600;
        Wed, 03 Jul 2019 09:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562172805; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2iO3Ug7Noozu8i+Xom77Fp/qAukTvjWRArlo4i+RcEsr3y8A2Xldcgcu3aGc43t2x
         0rv8rxoWUowwtJDAhz5QGDr2wNpY5YdgI2VxHM2Zr1pla5g+qhag6Z+ytgWy1A4dvxiA
         JG9Soo3x6TymG19/yuKAw8mm9BVJTaugYkdSLnK0rYTIPQK82ejv+25tB45CF+MjfTDz
         GocIhEMPrxdy3i2A2be50xpgu3WcKEWikDns+GZE+lN96LYsvnq/OzaTvcdnbzKwqEvz
         2E7QFL3nddg2pISACVvw2w5RpvM+tDnIGFga7R8yXe8ZzBk6fL1ffXLwoZkm49EhNpKF
         Eh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=E37j4BpX3BZF5h2oUDDuHiS6QR9k8bhW8GZOQLRKgJ0=;
        b=pWiS6+Ppm5svskSegD+DjXmXlw1DSwdxdpoAKSREoSfreTY+semDPKOmgYzXqZwwBr
         y35wXXpst+DKwGOG7szc3K+5YMknFQ4Y8EI6CdAZeu0M0VQAPH4Eo6H0UPZylPRVcMaH
         SU4qCF60xJHL86MxVgdUBPsgne9Oz4ZmxJjYxQ20abyaxsHmV1DzFPCzJv78BOBAx6o9
         ArOa8xkcKSBPT0zS+vgH9ziE1IiQ+GP/Yi6JTbnE/RvbjQpRCFwK9mbzqQqMn/bGH1S1
         2DNX3HNOKsgmF6EXsQIhwTgflrD0cGGz9d2uRwXiqBI9yNJFhIohFe5iNSWTvcIutf7k
         G9Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i65sor4125515wmg.0.2019.07.03.09.53.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jul 2019 09:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E37j4BpX3BZF5h2oUDDuHiS6QR9k8bhW8GZOQLRKgJ0=;
        b=mpG3cd9fiLhWElb5hBoXnpmEDMNEK1N7SA32gjisZpL01wnyyJrYAaXQFjsZ0CsOdw
         b5vCDkUQzIj+WVUKqAXaoTHcUlYa+lr2QZfkuYRfZKtC1i2h9O3/P/btjqt0TpvIWCJb
         ZxWcoXV813wcdWH0agjQrCRNFtBO1Hk+YFhyzXfLERUpvMDCwZg62J0mVJckVKz9rOPh
         zl5fMvlqqJ/G+kBJwWO5aotaRa1JO970M5jI12stlIymX5GLuNJNWHlQyRY8QMH5Ggh9
         d6HUeaiPB9Hqr9PbmtCRGvPA1haq9A6teq7yq0gzAm5mHbevFl5NZcsfphYS0aKN/Rf+
         C8zA==
X-Gm-Message-State: APjAAAW3HQyi9rJxw/2xGi93D41UHKWhYw3elZdE5MXK3EMyCdgxO5Kz
	e+yzHxCmY5XqE5sUjUdxhFWNhA==
X-Google-Smtp-Source: APXvYqwgj/GdMOH0tI4azvlKeASk3sU/wySnd8D/VUrrMUoh00qfyOgTVKdEE/GvoAvdFu0dhF47GA==
X-Received: by 2002:a7b:c455:: with SMTP id l21mr8888260wmi.114.1562172805333;
        Wed, 03 Jul 2019 09:53:25 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id o12sm3062674wrx.63.2019.07.03.09.53.24
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:53:24 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 4/4] target/arm: remove run time
 semihosting checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20190703155244.28166-1-alex.bennee@linaro.org>
 <20190703155244.28166-5-alex.bennee@linaro.org>
 <2c0b9e7f-f4d1-b52b-1f3a-4100bf50c151@redhat.com>
 <87lfxfvzj1.fsf@zen.linaroharston>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e593b2ba-675e-947a-4188-33b87e1c29a4@redhat.com>
Date: Wed, 3 Jul 2019 18:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87lfxfvzj1.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bRbthHEQOt29

On 7/3/19 6:44 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Hi Alex, Peter.
>>
>> On 7/3/19 5:52 PM, Alex Bennée wrote:
>>> Now we do all our checking and use a common EXCP_SEMIHOST for
>>> semihosting operations we can make helper code a lot simpler.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  target/arm/helper.c | 84 +++++++++------------------------------------
>>>  1 file changed, 17 insertions(+), 67 deletions(-)
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index ad29dc4072..5c1f741380 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -10364,83 +10364,33 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>>>                    new_el, env->pc, pstate_read(env));
>>>  }
>>>
>>> -static inline bool check_for_semihosting(CPUState *cs)
>>> +/*
>>> + * Check whether this exception is a semihosting call; if so
>>> + * then handle it and return true; otherwise return false.
>>> + *
>>> + * All the permission and validity checks are done at translate time.
>>> + */
>>> +static inline bool handle_semihosting(CPUState *cs)
>>>  {
>>> -    /* Check whether this exception is a semihosting call; if so
>>> -     * then handle it and return true; otherwise return false.
>>> -     */
>>>      ARMCPU *cpu = ARM_CPU(cs);
>>>      CPUARMState *env = &cpu->env;
>>>
>>> -    if (is_a64(env)) {
>>> -        if (cs->exception_index == EXCP_SEMIHOST) {
>>> -            /* This is always the 64-bit semihosting exception.
>>> -             * The "is this usermode" and "is semihosting enabled"
>>> -             * checks have been done at translate time.
>>> -             */
>>> +    if (cs->exception_index == EXCP_SEMIHOST) {
>>> +        if (is_a64(env)) {
>>>              qemu_log_mask(CPU_LOG_INT,
>>>                            "...handling as semihosting call 0x%" PRIx64 "\n",
>>>                            env->xregs[0]);
>>>              env->xregs[0] = do_arm_semihosting(env);
>>> -            return true;
>>> -        }
>>> -        return false;
>>> -    } else {
>>> -        uint32_t imm;
>>> -
>>> -        /* Only intercept calls from privileged modes, to provide some
>>> -         * semblance of security.
>>> -         */
>>> -        if (cs->exception_index != EXCP_SEMIHOST &&
>>> -            (!semihosting_enabled() ||
>>> -             ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR))) {
>>> -            return false;
>>> -        }
>>> -
>>> -        switch (cs->exception_index) {
>>> -        case EXCP_SEMIHOST:
>>> -            /* This is always a semihosting call; the "is this usermode"
>>> -             * and "is semihosting enabled" checks have been done at
>>> -             * translate time.
>>> -             */
>>> -            break;
>>> -        case EXCP_SWI:
>>> -            /* Check for semihosting interrupt.  */
>>> -            if (env->thumb) {
>>> -                imm = arm_lduw_code(env, env->regs[15] - 2, arm_sctlr_b(env))
>>> -                    & 0xff;
>>> -                if (imm == 0xab) {
>>> -                    break;
>>> -                }
>>> -            } else {
>>> -                imm = arm_ldl_code(env, env->regs[15] - 4, arm_sctlr_b(env))
>>> -                    & 0xffffff;
>>> -                if (imm == 0x123456) {
>>> -                    break;
>>> -                }
>>> -            }
>>> -            return false;
>>> -        case EXCP_BKPT:
>>> -            /* See if this is a semihosting syscall.  */
>>> -            if (env->thumb) {
>>> -                imm = arm_lduw_code(env, env->regs[15], arm_sctlr_b(env))
>>> -                    & 0xff;
>>> -                if (imm == 0xab) {
>>> -                    env->regs[15] += 2;
>>> -                    break;
>>> -                }
>>> -            }
>>> -            return false;
>>> -        default:
>>> -            return false;
>>> +        } else {
>>> +            qemu_log_mask(CPU_LOG_INT,
>>> +                          "...handling as semihosting call 0x%x\n",
>>> +                          env->regs[0]);
>>> +            env->regs[0] = do_arm_semihosting(env);
>>>          }
>>> -
>>> -        qemu_log_mask(CPU_LOG_INT,
>>> -                      "...handling as semihosting call 0x%x\n",
>>> -                      env->regs[0]);
>>> -        env->regs[0] = do_arm_semihosting(env);
>>>          return true;
>>>      }
>>> +
>>> +    return false;
>>>  }
>>>
>>>  /* Handle a CPU exception for A and R profile CPUs.
>>> @@ -10476,7 +10426,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>>>       * code that caused the exception, not the target exception level,
>>>       * so must be handled here.
>>>       */
>>> -    if (check_for_semihosting(cs)) {
>>> +    if (handle_semihosting(cs)) {
>>>          return;
>>>      }
>>>
>>>
>>
>> This patch clashes with this one:
>> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00343.html
>> that Peter already queued:
>> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00692.html
>>
>> Peter, if you want this for 4.1, it might be easier to dequeue "Restrict
>> semi-hosting to TCG", apply Alex series, and re-apply "Restrict
>> semi-hosting to TCG", the conflicts should be trivial (function name
>> changed check_for_semihosting -> handle_semihosting).
> 
> This isn't 4.1 material - unless I can figure out the weird single-step
> while semihosting bug.

Well I'm not sure it is ARM-specific... I remember something similar
with MIPS.

>>
>> Thanks,
>>
>> Phil.
