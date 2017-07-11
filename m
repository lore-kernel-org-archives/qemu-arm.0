Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m123sm151079wmb.3.2017.07.11.12.20.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 12:20:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 009053E025C;
	Tue, 11 Jul 2017 20:20:31 +0100 (BST)
References: <20170711175937.23140-1-alex.bennee@linaro.org> <20170711175937.23140-5-alex.bennee@linaro.org> <d0d0750b-127e-79e8-4307-57e187cd302f@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: peter.maydell@linaro.org, cota@braap.org, qemu-devel@nongnu.org, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 4/6] target/arm/translate: ensure gen_goto_tb sets exit flags
In-reply-to: <d0d0750b-127e-79e8-4307-57e187cd302f@twiddle.net>
Date: Tue, 11 Jul 2017 20:20:31 +0100
Message-ID: <87fue2aigw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: bFNPqVLuS4bO


Richard Henderson <rth@twiddle.net> writes:

> On 07/11/2017 07:59 AM, Alex Bennée wrote:
>>       if (use_goto_tb(s, dest)) {
>>           tcg_gen_goto_tb(n);
>>           gen_set_pc_im(s, dest);
>>           tcg_gen_exit_tb((uintptr_t)s->tb + n);
>> +        s->is_jmp = DISAS_TB_JUMP;
>>       } else {
>>           gen_set_pc_im(s, dest);
>>           gen_goto_ptr();
>> +        s->is_jmp = DISAS_JUMP;
>>       }
>
> I think DISAS_TB_JUMP is appropriate for both cases.  When not using
> goto_tb, the jump is still static and we still chain to the next TB
> via goto_ptr.

OK - I guess we need to nail down what the essential difference is
between the two. I understood DISAS_TB_JUMP as a static known PC which
can be patched in the generated code because we know the two addresses
are in the same page - whereas DISAS_JUMP is a "computed" jump although
in this case the PC is already known.

Does making a distinction between computed and non-computer inter-page
jumps make any sense anyway?

>
> Otherwise,
>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
>
>
> r~


--
Alex Bennée
