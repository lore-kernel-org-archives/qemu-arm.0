Received: by 10.25.0.144 with SMTP id 138csp174588lfa;
        Wed, 26 Apr 2017 01:40:48 -0700 (PDT)
X-Received: by 10.223.164.65 with SMTP id e1mr9581059wra.21.1493196048771;
        Wed, 26 Apr 2017 01:40:48 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id u6si7055951wmb.155.2017.04.26.01.40.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id d79so31360367wmi.2;
        Wed, 26 Apr 2017 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X9z3zg7QL3D2NQ43PRcV9+UUvQccz1YbklLxhCfeqXo=;
        b=tOzYrpdFett55UEJ4Q5uGEIIbgZbL3bGgErdWrj6B3F+IdgMEIIjTegg/YT1VjQNiE
         rCmaQkMtPjkMjhb7tiHW5mBfK+mdVxsLejGF945+HRk+B1Y26iM9J4A+LOHOgjke4DJg
         kcUoBePaKFctGkEuksGzD6QpoSHWDo3zaBkVoRTM2X9sRfcS4gV99mrKxpzoVfOKGD1j
         HY7EHiWWYph6st1QOTsBrK4SKzQJW3kd1idsMbGJArxBfymtKspOGFU77OjnsMAiCfCd
         +0PxQaJS4p2ALnHUK7cQUPVEV+Y8wP7upG8vcSS+c1i0QtbW+G8d7CtYXr6hosOMcZ2Q
         CR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X9z3zg7QL3D2NQ43PRcV9+UUvQccz1YbklLxhCfeqXo=;
        b=YxRqm2Mxpw1VG5MLJd4aortF7yfjKH8wafL6rMKIga7LH9Zg3hPG9jW8ThVsBFW7fN
         gnwRW9RrNgG+Q47owZNQedooT0OPKmEvQs5tHBqu82+PKhqz8S3k7txZXmNUvRGu5nj0
         H1GJLCR0MOVSoe93CMpZGdc2AIvUhB9cxuGybrSgkKuFr3wcGNbxn/inMy8rTJFRVDAE
         ETh1gJBR7pyDSoNd+9TOEzS87kBC2DldJVWXTbeiDfujQ/LuO4lJeCxEORP0YxsRXUGP
         Hej8aauCCY263UgCTm5iM/Cg6VDyBGRehv5Om13t5o2hAoJOPVq5UP6Fqjd+fVVh3xop
         4J7w==
X-Gm-Message-State: AN3rC/5naEpqC2Nu/nwzTwSgbBcr+mxETU//XsULZfvH16jLtdC3dq7x
	xiDuMYyqONLpqrCBccs=
X-Received: by 10.28.55.9 with SMTP id e9mr15326756wma.44.1493196048441;
        Wed, 26 Apr 2017 01:40:48 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id a67sm355315wmh.10.2017.04.26.01.40.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:40:47 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 01/10] tcg-runtime: add lookup_tb_ptr helper
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-2-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e206fe3e-5920-49c5-8f95-e4961aad5f89@twiddle.net>
Date: Wed, 26 Apr 2017 10:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-2-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 1zWbta+Vr7iQ

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> This paves the way for upcoming work.
> 
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>   tcg-runtime.c     | 21 +++++++++++++++++++++
>   tcg/tcg-runtime.h |  2 ++
>   tcg/tcg.h         |  1 +
>   3 files changed, 24 insertions(+)
> 
> diff --git a/tcg-runtime.c b/tcg-runtime.c
> index 4c60c96..90d2d4b 100644
> --- a/tcg-runtime.c
> +++ b/tcg-runtime.c
> @@ -27,6 +27,7 @@
>   #include "exec/helper-proto.h"
>   #include "exec/cpu_ldst.h"
>   #include "exec/exec-all.h"
> +#include "exec/tb-hash.h"
>   
>   /* 32-bit helpers */
>   
> @@ -141,6 +142,26 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
>       return ctpop64(arg);
>   }
>   
> +void *HELPER(lookup_tb_ptr)(CPUArchState *env, target_ulong addr)
> +{
> +    CPUState *cpu = ENV_GET_CPU(env);
> +    TranslationBlock *tb;
> +    target_ulong cs_base, pc;
> +    uint32_t flags;
> +
> +    if (unlikely(atomic_read(&cpu->exit_request))) {
> +        goto out_epilogue;
> +    }

Paolo is right.  This will also be checked by the first instructions of the TB 
and there's little point in repeating it here, especially if it is indeed unlikely.

> +    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> +    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
> +    if (likely(tb && tb->pc == addr && tb->cs_base == cs_base &&
> +               tb->flags == flags)) {

This comparison is wrong.  It will incorrectly reject a TB for i386 guest when 
CS_BASE != 0.  You really want

   tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
   if (tb) {
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
     if (tb->pc == pc && tb->cs_base == cs_base && tb->flags == flags) {
       return tb->tc_ptr;
     }
   }
   return tcg_ctx.code_gen_epilogue;

where you don't even load the cpu state if there isn't a preliminary hit in the 
cache.  (Note to self: That minor optimization would also apply to tb_find.)

I also wonder, if we've gone this far, if we wouldn't go all the way and also 
check tb_htable_lookup.


r~
