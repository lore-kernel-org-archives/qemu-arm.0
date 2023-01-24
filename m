Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d650f000000b002bdda9856b5sm1570418wru.50.2023.01.24.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:47:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3B6F41FFB7;
	Tue, 24 Jan 2023 10:47:46 +0000 (GMT)
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-3-richard.henderson@linaro.org>
 <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
 <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
Date: Tue, 24 Jan 2023 10:39:31 +0000
In-reply-to: <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
Message-ID: <87a628ryy5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: e9a4iUPplv2G


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/23/23 02:53, Peter Maydell wrote:
>> On Fri, 6 Jan 2023 at 19:45, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Do not encode the pointer as a constant in the opcode stream.
>>> This pointer is specific to the cpu that first generated the
>>> translation, which runs into problems with both hot-pluggable
>>> cpus and user-only threads, as cpus are removed.
>>>
>>> Perform the lookup in either helper_access_check_cp_reg,
>>> or a new helper_lookup_cp_reg.
>> As well as the use-after-free, this is also a correctness
>> bug, isn't it? If we hardwire in the cpregs pointer for
>> CPU 0 into the TB, and then CPU 1 with a slightly different
>> config executes the TB, it will get the cpregs of CPU 0,
>> not its own, so it might see a register it should not or
>> vice-versa.
>
> Existing assumption was that each cpu configuration would have its own
> cluster_index, which gets encoded into cpu->tcg_cflags, which is part
> of the comparison used when hashing TBs.

I understand the cluster_index is used for things like A/R and A/M
splits (and eventually heterogeneous). We also have language to cover
the increasingly weird set of big.LITTLE offspring like M1's
Performance/Efficiency split or the Tensor's X1/A76/A55 split.

 * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 CPUs i=
n an
 * Arm big.LITTLE system) they should be in different clusters. If the CPUs=
 do
 * not have the same view of memory (for example the main CPU and a managem=
ent
 * controller processor) they should be in different clusters.

> But including this patch allows relaxation of what constitutes a "cpu con=
figuration".
>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
