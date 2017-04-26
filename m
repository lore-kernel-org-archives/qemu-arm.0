Received: by 10.25.0.144 with SMTP id 138csp215113lfa;
        Wed, 26 Apr 2017 03:44:00 -0700 (PDT)
X-Received: by 10.223.151.146 with SMTP id s18mr12679766wrb.40.1493203440183;
        Wed, 26 Apr 2017 03:44:00 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id r5si6532925wmf.88.2017.04.26.03.43.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 03:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id z129so32122694wmb.1;
        Wed, 26 Apr 2017 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HAt7OOJFPlXd0THEwgyG4GjXKfGwaSfuV4vXn+aZe9A=;
        b=OozIDTDVUFj9ke5bwqacxWHeVx5zULtekepkV1QuySUhtLrVRF5HDECdjdl9yEgrqt
         SuwYPboo0ua1HbJS26C6JM9VZCKpagTGmbo3E0gvL1YJGylvyHuKclXsvbJKKrKxqWKD
         teJmXfJ7sLAwOcQfP1gMD9Yg8wGBeg3PqgFmMHt0ZKMZkoZg6tr2EU6wAqryBDhY3oX9
         uryXzbv2fQ0sC2J2keE3KAs04ARJMXItX8KbcHqZowKJsZcxCXfOKMP6vfA64kWo6sNJ
         DcofQAgLX23M+vxfXP86mvx6okHQQFcHhuOZu4fjBmrPgcZqApecRy+A1bUK3C8J4fOL
         z/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HAt7OOJFPlXd0THEwgyG4GjXKfGwaSfuV4vXn+aZe9A=;
        b=TRJU8prlDWMCMEbgCVyOSsKdOXgXe24DS8e769FEDjcs+bvwlhjLu1NRqNc28Z0ULL
         wT8c2JFxmnumxnjjPsElePxIsxcbzZ41XIz474Ma+pZ1qbFDyJ+uGSadk95e3QlvR3tE
         JT8FgJyfvtigOGJmaSiVMKwBDnn4k3gGN5G0anOK9uXCONBnNDxdaUFKYjKGeONzJqRH
         DFa50qEvaKTDrRin9srEGc5VqmQfcxjDdJrQ7jZR6B4F2MZVvF7RJO/+Jj/DoqIfJO1z
         ENS9dCtPXX6YUhICzWbdMaiqyezPIA9Iy4RrPtxtq6rtE9W8arA0F2mmFnkpMknwPtPX
         EPJQ==
X-Gm-Message-State: AN3rC/4v7wX9e8zElfPV+VxschYjUNDZU5gutLk1RkTSCSvLAGZ9r8Rf
	YRGUT6lKI3GD0Q==
X-Received: by 10.28.129.65 with SMTP id c62mr304209wmd.79.1493203439731;
        Wed, 26 Apr 2017 03:43:59 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id h199sm6042896wme.4.2017.04.26.03.43.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 03:43:58 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 01/10] tcg-runtime: add lookup_tb_ptr helper
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-2-git-send-email-cota@braap.org> <87efwf8nsm.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <4f999ad8-7208-7980-c17a-e9450176d1df@twiddle.net>
Date: Wed, 26 Apr 2017 12:43:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <87efwf8nsm.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7CCciSdOphu5

On 04/26/2017 12:29 PM, Alex Bennée wrote:
> 
> Emilio G. Cota <cota@braap.org> writes:
> 
>> This paves the way for upcoming work.
>>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>> ---
>>   tcg-runtime.c     | 21 +++++++++++++++++++++
>>   tcg/tcg-runtime.h |  2 ++
>>   tcg/tcg.h         |  1 +
>>   3 files changed, 24 insertions(+)
>>
>> diff --git a/tcg-runtime.c b/tcg-runtime.c
>> index 4c60c96..90d2d4b 100644
>> --- a/tcg-runtime.c
>> +++ b/tcg-runtime.c
>> @@ -27,6 +27,7 @@
>>   #include "exec/helper-proto.h"
>>   #include "exec/cpu_ldst.h"
>>   #include "exec/exec-all.h"
>> +#include "exec/tb-hash.h"
>>
>>   /* 32-bit helpers */
>>
>> @@ -141,6 +142,26 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
>>       return ctpop64(arg);
>>   }
>>
>> +void *HELPER(lookup_tb_ptr)(CPUArchState *env, target_ulong addr)
>> +{
>> +    CPUState *cpu = ENV_GET_CPU(env);
>> +    TranslationBlock *tb;
>> +    target_ulong cs_base, pc;
>> +    uint32_t flags;
>> +
>> +    if (unlikely(atomic_read(&cpu->exit_request))) {
>> +        goto out_epilogue;
>> +    }
>> +    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>> +    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
>> +    if (likely(tb && tb->pc == addr && tb->cs_base == cs_base &&
>> +               tb->flags == flags)) {
> 
> Should we also not be checking the TB hasn't been invalidated: tb->invalid?

We don't check in tb_find.

I guess we're assuming that such have been purged from the tb_jmp_cache.  That 
said, tb_phys_invalidate assumes tb_locked, and I don't immediately remember 
how all that is supposed to tie together.


r~
