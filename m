Received: by 10.25.0.144 with SMTP id 138csp337842lfa;
        Wed, 26 Apr 2017 08:11:37 -0700 (PDT)
X-Received: by 10.55.22.131 with SMTP id 3mr302668qkw.16.1493219496880;
        Wed, 26 Apr 2017 08:11:36 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v17si455522qta.213.2017.04.26.08.11.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 08:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56590624C5;
	Wed, 26 Apr 2017 15:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 56590624C5
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 56590624C5
Received: from [10.36.116.34] (ovpn-116-34.ams2.redhat.com [10.36.116.34])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v3QFBTE9008726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 26 Apr 2017 11:11:30 -0400
Subject: Re: [PATCH v3 01/10] tcg-runtime: add lookup_tb_ptr helper
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        "Emilio G. Cota" <cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-2-git-send-email-cota@braap.org> <87efwf8nsm.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Andrzej Zaborowski <balrogg@gmail.com>,
        Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
        Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
        Pranith Kumar <bobby.prani+qemu@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5af8f37b-3ffa-6689-bcfa-4e5601fb2087@redhat.com>
Date: Wed, 26 Apr 2017 17:11:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <87efwf8nsm.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 26 Apr 2017 15:11:36 +0000 (UTC)
X-TUID: jzxOYHSucbaX



On 26/04/2017 12:29, Alex Bennée wrote:
> 
> Emilio G. Cota <cota@braap.org> writes:
> 
>> This paves the way for upcoming work.
>>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>> ---
>>  tcg-runtime.c     | 21 +++++++++++++++++++++
>>  tcg/tcg-runtime.h |  2 ++
>>  tcg/tcg.h         |  1 +
>>  3 files changed, 24 insertions(+)
>>
>> diff --git a/tcg-runtime.c b/tcg-runtime.c
>> index 4c60c96..90d2d4b 100644
>> --- a/tcg-runtime.c
>> +++ b/tcg-runtime.c
>> @@ -27,6 +27,7 @@
>>  #include "exec/helper-proto.h"
>>  #include "exec/cpu_ldst.h"
>>  #include "exec/exec-all.h"
>> +#include "exec/tb-hash.h"
>>
>>  /* 32-bit helpers */
>>
>> @@ -141,6 +142,26 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
>>      return ctpop64(arg);
>>  }
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

It's not needed because this lookup is (if I understand it right) once
only and is not reused later.  This is why tb_find doesn't check
tb->invalid, but uses it to avoid adding the TB to the chain.

Good:

	tb_find			tb_phys_invalidate
				  tb_lock
				  tb->invalid = true
	  lookup cache
	  cache hit
				  tb_unlock
	  tb_lock
	  tb->invalid?
	    yes, skip tb_add_jump
	  tb_unlock
	  execute tb once

Bad (doesn't happen):

	tb_find			tb_phys_invalidate
				  tb_lock
				  tb->invalid = true
	  lookup cache
	  cache hit
				  tb_unlock
	  tb_lock
	  tb_add_jump
	  tb_unlock
	  execute tb many times

Paolo

>> +        return tb->tc_ptr;
>> +    }
>> + out_epilogue:
>> +    return tcg_ctx.code_gen_epilogue;
>> +}
>> +
>>  void HELPER(exit_atomic)(CPUArchState *env)
>>  {
>>      cpu_loop_exit_atomic(ENV_GET_CPU(env), GETPC());
>> diff --git a/tcg/tcg-runtime.h b/tcg/tcg-runtime.h
>> index 114ea6f..c41d38a 100644
>> --- a/tcg/tcg-runtime.h
>> +++ b/tcg/tcg-runtime.h
>> @@ -24,6 +24,8 @@ DEF_HELPER_FLAGS_1(clrsb_i64, TCG_CALL_NO_RWG_SE, i64, i64)
>>  DEF_HELPER_FLAGS_1(ctpop_i32, TCG_CALL_NO_RWG_SE, i32, i32)
>>  DEF_HELPER_FLAGS_1(ctpop_i64, TCG_CALL_NO_RWG_SE, i64, i64)
>>
>> +DEF_HELPER_FLAGS_2(lookup_tb_ptr, TCG_CALL_NO_WG_SE, ptr, env, tl)
>> +
>>  DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
>>
>>  #ifdef CONFIG_SOFTMMU
>> diff --git a/tcg/tcg.h b/tcg/tcg.h
>> index 6c216bb..5ec48d1 100644
>> --- a/tcg/tcg.h
>> +++ b/tcg/tcg.h
>> @@ -699,6 +699,7 @@ struct TCGContext {
>>         extension that allows arithmetic on void*.  */
>>      int code_gen_max_blocks;
>>      void *code_gen_prologue;
>> +    void *code_gen_epilogue;
>>      void *code_gen_buffer;
>>      size_t code_gen_buffer_size;
>>      void *code_gen_ptr;
> 
> 
> --
> Alex Bennée
> 
