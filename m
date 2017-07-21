Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 91sm5991651wrg.83.2017.07.21.02.35.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 02:35:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8D2503E0127;
	Fri, 21 Jul 2017 10:35:43 +0100 (BST)
References: <20170720150426.12393-1-alex.bennee@linaro.org> <20170720150426.12393-16-alex.bennee@linaro.org> <38211f3f-b5c5-003c-f568-eb9088c09f4e@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH for 2.11 15/23] target/arm/translate-a64.c: AdvSIMD scalar 2 register misc decode
In-reply-to: <38211f3f-b5c5-003c-f568-eb9088c09f4e@twiddle.net>
Date: Fri, 21 Jul 2017 10:35:43 +0100
Message-ID: <87wp726sk0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: SXJpeOzvCJYk


Richard Henderson <rth@twiddle.net> writes:

> On 07/20/2017 05:04 AM, Alex Bennée wrote:
>> +    for (pass = 0; pass < elements; pass++) {
>> +        TCGv_i32 tcg_op1 = tcg_temp_new_i32();
>> +        TCGv_i32 tcg_res = tcg_temp_new_i32();
>> +
>> +        read_vec_element_i32(s, tcg_op1, rn, pass, MO_16);
>> +
>> +        switch (fpopcode) {
>> +        default:
>> +            fprintf(stderr,"%s: insn %#04x fpop %#2x\n", __func__, insn, fpopcode);
>> +            unsupported_encoding(s, insn);
>> +        }
>
> Just noticing that we ought not issue N copies of the
> unsupported_encoding exception.  Return afterwards seems in order.  Is
> this a pattern that you copied that wants fixing elsewhere?

No that's just me. I think all the other cases just define
g_assert_not_reached() as the unsupported encoding should be picked up
further up the call chain. I shall fix that.

--
Alex Bennée
