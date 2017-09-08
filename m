Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 138sm821552wmf.23.2017.09.08.02.28.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Sep 2017 02:28:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7BDB33E00A6;
	Fri,  8 Sep 2017 10:28:33 +0100 (BST)
References: <20170817230114.3655-1-richard.henderson@linaro.org> <20170817230114.3655-5-richard.henderson@linaro.org> <874lsemj0d.fsf@linaro.org> <f18d9635-1ae5-08f0-3856-c2d445e62b99@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 4/8] tcg: Add operations for host vectors
In-reply-to: <f18d9635-1ae5-08f0-3856-c2d445e62b99@linaro.org>
Date: Fri, 08 Sep 2017 10:28:33 +0100
Message-ID: <877ex9iloe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: r76W9mUfmMlK


Richard Henderson <richard.henderson@linaro.org> writes:

> On 09/07/2017 12:00 PM, Alex Bennée wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> Nothing uses or implements them yet.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>  tcg/tcg-opc.h | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>  tcg/tcg.h     | 24 ++++++++++++++++
>>>  2 files changed, 113 insertions(+)
>>>
>>> diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
>>> index 956fb1e9f3..9162125fac 100644
>>> --- a/tcg/tcg-opc.h
>>> +++ b/tcg/tcg-opc.h
>>> @@ -206,6 +206,95 @@ DEF(qemu_st_i64, 0, TLADDR_ARGS + DATA64_ARGS, 1,
>>>
>>>  #undef TLADDR_ARGS
>>>  #undef DATA64_ARGS
>>> +
>>> +/* Host integer vector operations.  */
>>> +/* These opcodes are required whenever the base vector size is enabled.  */
>>> +
>>> +DEF(mov_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(mov_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(mov_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +DEF(movi_v64, 1, 0, 1, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(movi_v128, 1, 0, 1, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(movi_v256, 1, 0, 1, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +DEF(ld_v64, 1, 1, 1, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(ld_v128, 1, 1, 1, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(ld_v256, 1, 1, 1, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +DEF(st_v64, 0, 2, 1, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(st_v128, 0, 2, 1, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(st_v256, 0, 2, 1, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +DEF(and_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(and_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(and_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +DEF(or_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(or_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(or_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +DEF(xor_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(xor_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(xor_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +DEF(add8_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(add16_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(add32_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +
>>> +DEF(add8_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(add16_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(add32_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(add64_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +
>>> +DEF(add8_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +DEF(add16_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +DEF(add32_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +DEF(add64_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +DEF(sub8_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(sub16_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +DEF(sub32_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>>> +
>>> +DEF(sub8_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(sub16_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(sub32_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +DEF(sub64_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>>> +
>>> +DEF(sub8_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +DEF(sub16_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +DEF(sub32_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +DEF(sub64_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>>> +
>>> +/* These opcodes are optional.
>>> +   All element counts must be supported if any are.  */
>>> +
>>> +DEF(not_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v64))
>>> +DEF(not_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v128))
>>> +DEF(not_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v256))
>>> +
>>> +DEF(andc_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v64))
>>> +DEF(andc_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v128))
>>> +DEF(andc_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v256))
>>> +
>>> +DEF(orc_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v64))
>>> +DEF(orc_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v128))
>>> +DEF(orc_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v256))
>>> +
>>> +DEF(neg8_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
>>> +DEF(neg16_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
>>> +DEF(neg32_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
>>> +
>>> +DEF(neg8_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
>>> +DEF(neg16_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
>>> +DEF(neg32_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
>>> +DEF(neg64_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
>>> +
>>> +DEF(neg8_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
>>> +DEF(neg16_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
>>> +DEF(neg32_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
>>> +DEF(neg64_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
>>> +
>>>  #undef IMPL
>>>  #undef IMPL64
>>>  #undef DEF
>>> diff --git a/tcg/tcg.h b/tcg/tcg.h
>>> index 1277caed3d..b9e15da13b 100644
>>> --- a/tcg/tcg.h
>>> +++ b/tcg/tcg.h
>>> @@ -166,6 +166,30 @@ typedef uint64_t TCGRegSet;
>>>  #define TCG_TARGET_HAS_rem_i64          0
>>>  #endif
>>>
>>> +#ifndef TCG_TARGET_HAS_v64
>>> +#define TCG_TARGET_HAS_v64              0
>>> +#define TCG_TARGET_HAS_andc_v64         0
>>> +#define TCG_TARGET_HAS_orc_v64          0
>>> +#define TCG_TARGET_HAS_not_v64          0
>>> +#define TCG_TARGET_HAS_neg_v64          0
>>> +#endif
>>> +
>>> +#ifndef TCG_TARGET_HAS_v128
>>> +#define TCG_TARGET_HAS_v128             0
>>> +#define TCG_TARGET_HAS_andc_v128        0
>>> +#define TCG_TARGET_HAS_orc_v128         0
>>> +#define TCG_TARGET_HAS_not_v128         0
>>> +#define TCG_TARGET_HAS_neg_v128         0
>>> +#endif
>>> +
>>> +#ifndef TCG_TARGET_HAS_v256
>>> +#define TCG_TARGET_HAS_v256             0
>>> +#define TCG_TARGET_HAS_andc_v256        0
>>> +#define TCG_TARGET_HAS_orc_v256         0
>>> +#define TCG_TARGET_HAS_not_v256         0
>>> +#define TCG_TARGET_HAS_neg_v256         0
>>> +#endif
>>
>> Is it possible to use the DEF expanders to avoid manually defining all
>> the TCG_TARGET_HAS_op for each vector size?
>
> No.  The preprocessor doesn't work that way.

Ahh I follow now. tcg-target.h defines the TCG_TARGET_HAS_foo for all
ops it supports and this boilerplate ensures there is a concrete define
for the targets that don't support it (yet).

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
