Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l69sm7418981wmb.35.2017.09.11.02.12.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Sep 2017 02:12:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D0FB03E0142;
	Mon, 11 Sep 2017 10:12:34 +0100 (BST)
References: <20170817230114.3655-1-richard.henderson@linaro.org> <20170817230114.3655-3-richard.henderson@linaro.org> <877examon2.fsf@linaro.org> <05363152-8a66-af3f-7c66-9627cbdc290b@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/8] target/arm: Use generic vector infrastructure for aa64 add/sub/logic
In-reply-to: <05363152-8a66-af3f-7c66-9627cbdc290b@linaro.org>
Date: Mon, 11 Sep 2017 10:12:34 +0100
Message-ID: <8760cpbnul.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 34KWFZaAr0SY


Richard Henderson <richard.henderson@linaro.org> writes:

> On 09/07/2017 09:58 AM, Alex Bennée wrote:
>>> +    switch (size + 4 * is_u) {
>>
>> Hmm I find this switch a little too magical. I mean I can see that the
>> encoding abuses size for the final opcode when I look at the manual but
>> it reads badly.
>>
>>> +    case 0: /* AND */
>>> +        gvec_op = tcg_gen_gvec_and8;
>>> +        goto do_gvec;
>>> +    case 1: /* BIC */
>>> +        gvec_op = tcg_gen_gvec_andc8;
>>> +        goto do_gvec;
>>> +    case 2: /* ORR */
>>> +        gvec_op = tcg_gen_gvec_or8;
>>> +        goto do_gvec;
>>> +    case 3: /* ORN */
>>> +        gvec_op = tcg_gen_gvec_orc8;
>>> +        goto do_gvec;
>>> +    case 4: /* EOR */
>>> +        gvec_op = tcg_gen_gvec_xor8;
>>> +        goto do_gvec;
>>> +    do_gvec:
>>> +        gvec_op(vec_full_reg_offset(s, rd),
>>> +                vec_full_reg_offset(s, rn),
>>> +                vec_full_reg_offset(s, rm),
>>> +                is_q ? 16 : 8, vec_full_reg_size(s));
>>> +        return;
>>
>> No default case (although I guess we just fall through). What's wrong
>> with just having a !is_u test with gvec_op = tbl[size] and skipping all
>> the goto stuff?
>
> Because that would still leave EOR out in the woods.
> I do think this is the cleanest way to filter out these 5 operations.

Is this going to look better if the other operations in this branch of
the decode are converted as well?

--
Alex Bennée
