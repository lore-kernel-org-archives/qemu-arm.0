Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x8sm3478724wmc.5.2019.07.04.03.21.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 03:21:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2C7051FF87;
	Thu,  4 Jul 2019 11:21:54 +0100 (BST)
References: <20190703155244.28166-1-alex.bennee@linaro.org> <20190703155244.28166-2-alex.bennee@linaro.org> <927219a5-a56d-bbbe-26ed-ffb8be12f006@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 1/4] target/arm: handle M-profile semihosting at translate time
In-reply-to: <927219a5-a56d-bbbe-26ed-ffb8be12f006@linaro.org>
Date: Thu, 04 Jul 2019 11:21:54 +0100
Message-ID: <87ef36w14t.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nJXZ8dhXkuWT


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/3/19 5:52 PM, Alex Benn=C3=A9e wrote:
>> +static inline void gen_thumb_bkpt(DisasContext *s, int imm8)
>> +{
>> +    if (arm_dc_feature(s, ARM_FEATURE_M) &&
>> +        semihosting_enabled() &&
>> +#ifndef CONFIG_USER_ONLY
>> +        s->current_el !=3D 0 &&
>> +#endif
>> +        (imm8 =3D=3D 0xab)) {
>
> Extra parenthesis.

The wrapping on imm8 =3D=3D 0xab? Do you want that cleaned up on the other
patches as well?

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


--
Alex Benn=C3=A9e
