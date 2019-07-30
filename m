Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4519214wrv;
        Tue, 30 Jul 2019 08:31:12 -0700 (PDT)
X-Received: by 2002:a05:6000:11c6:: with SMTP id i6mr27469539wrx.193.1564500672002;
        Tue, 30 Jul 2019 08:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564500671; cv=none;
        d=google.com; s=arc-20160816;
        b=BbktgOOL4G6XhIZ2qm5Ui84Qcv0+U51Fld/2yJJJTPAM5VU/AnJoMhIIxUi+ZoeHIK
         KEFyC0cI1ADiZuhiYCjmbRzP0g20jYHhiBTMKUOSh25Mt5KMNmQwbtyD2EhLWMsaeEKI
         mkDAjrVdD54TTo5dlYYDT9b8S6Eq+lFKuz8Eb7gf81gEybWFI2NCfn7rlrJER2+mRHrZ
         hmS2tUVEgwKSUmCAoOyeRGz4z4g8HTsZKISBgnJ6FVf8NkuTAfxs6vvxUtsIVDnQhpNu
         dykFrNO295j1OJi69oBzzmCzVzhHkMdRQx5ArM5RxEfHpzpoXuav84aNozZ4oaI1xTO5
         qJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=8J3NE8IIlpYqZdQ6IG202nyQ8353ntqIWj2xg30dRhw=;
        b=QDv0Wd3yQbdWJZF0+WR30sgg8YkaeHCPYXVkM3Ul93Hf0uNa9VF+8AXdds2gPcb3yr
         ihSOCcUJFWPTIunrQycAR48jpQGHRevlk2JocKKIHdO349dUOOVxVqo2ixo1fzS8UiN5
         1gSm15D+sufIpjA4j2RF7rbdjlzSJpwNoEdr81HWExmcQHRHDyv2w1NEWQ2H6KIgMakP
         rLkozNoX9aPj8XlinthYr9ZdvonQxz69Jyf4Z/SDn6204GMBPSTXUzjUR8ZShG+6tETn
         pGXJ5BM/1tZw1avrvynvvd1ZNBWezg7JsUaLr8e7ZS4qRDOxlCP/nlusZpe6hufmddQq
         MNVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 103sor51078090wrc.8.2019.07.30.08.31.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Jul 2019 08:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8J3NE8IIlpYqZdQ6IG202nyQ8353ntqIWj2xg30dRhw=;
        b=VDj92FVKpdCQUO+qHIjPDWDeJwR5++IElGkwNJ3Lo3VJaHtGfB7XBkAOg/xOIX5OEK
         ynNAXCzZOnRxjG5lGpuguBDOjJ+c202Sobv8FyE8WOVwEg9uUtocpJQXGAdaKhyBF99q
         7Ztj0v9gjTsyDXc2AtegA8V6+KSZ2xvPMIRRN78TT6Pcv0GBwPXMSWtVAJd5t9bqkxWx
         goSdLgILRjod+713xFSDtbtdWlXeL7l5w+/jBgAZVniBhQ+nTFvqje6Z8FbNZlfXRzPs
         dnNAJnWrHD/eLI9gHQxxvJ2iq1zM2V7vktZi27XZq065Y9Bq/RIhktAgoDU92NMiY2bn
         T/YQ==
X-Gm-Message-State: APjAAAXt68+NqDZnCTurtie3el8X/CbmD8cCCH40+lU2ytol8CCVyjZv
	QOP3lVv5vxQr5BnelddG2105fA==
X-Google-Smtp-Source: APXvYqw3WgMSeg7XBhU7eFym5HuqYb7GgcWUJyL6k4foIGyEBDgkjxa9FLW7drasgo7uQpcFdxmGuw==
X-Received: by 2002:a5d:6a84:: with SMTP id s4mr50866969wru.125.1564500671769;
        Tue, 30 Jul 2019 08:31:11 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.43.238] (63.red-95-127-155.staticip.rima-tde.net. [95.127.155.63])
        by smtp.gmail.com with ESMTPSA id n8sm53148891wro.89.2019.07.30.08.31.10
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 08:31:11 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH for-4.1?] target/arm: Deliver BKPT/BRK
 exceptions to correct exception level
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20190730132522.27086-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c8d89a39-a711-a416-b069-5710d672b4e7@redhat.com>
Date: Tue, 30 Jul 2019 17:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190730132522.27086-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: eNhKH+8HBeaV

On 7/30/19 3:25 PM, Peter Maydell wrote:
> Most Arm architectural debug exceptions (eg watchpoints) are ignored
> if the configured "debug exception level" is below the current
> exception level (so for example EL1 can't arrange to get debug exceptions
> for EL2 execution). Exceptions generated by the BRK or BPKT instructions
> are a special case -- they must always cause an exception, so if
> we're executing above the debug exception level then we
> must take them to the current exception level.
> 
> This fixes a bug where executing BRK at EL2 could result in an
> exception being taken at EL1 (which is strictly forbidden by the
> architecture).
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1838277
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> At this point in the release cycle I'm not sure we should put this
> into 4.1 -- it is definitely a bug but it's not a regression as
> we've been wrong like this for multiple releases, pretty much
> since we put in the debug handling code I suspect.

The fix is quite trivial, and the user reported using a release, so
having it in the next release would be nice.
Or as usual, wait for 'last-minute-bugfix-that-postpone-another-rc' and
squeeze this fix in.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
>  target/arm/op_helper.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 1ab91f915e4..5e1625a1c8a 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -370,6 +370,9 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
>   */
>  void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
>  {
> +    int debug_el = arm_debug_target_el(env);
> +    int cur_el = arm_current_el(env);
> +
>      /* FSR will only be used if the debug target EL is AArch32. */
>      env->exception.fsr = arm_debug_exception_fsr(env);
>      /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
> @@ -377,7 +380,18 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
>       * exception/security level.
>       */
>      env->exception.vaddress = 0;
> -    raise_exception(env, EXCP_BKPT, syndrome, arm_debug_target_el(env));
> +    /*
> +     * Other kinds of architectural debug exception are ignored if
> +     * they target an exception level below the current one (in QEMU
> +     * this is checked by arm_generate_debug_exceptions()). Breakpoint
> +     * instructions are special because they always generate an exception
> +     * to somewhere: if they can't go to the configured debug exception
> +     * level they are taken to the current exception level.
> +     */
> +    if (debug_el < cur_el) {
> +        debug_el = cur_el;
> +    }
> +    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
>  }
>  
>  uint32_t HELPER(cpsr_read)(CPUARMState *env)
> 
