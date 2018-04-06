Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r109sm7854516wrb.54.2018.04.06.06.03.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Apr 2018 06:03:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A20FF3E029C;
	Fri,  6 Apr 2018 14:03:36 +0100 (BST)
References: <20180217182323.25885-1-richard.henderson@linaro.org> <20180217182323.25885-6-richard.henderson@linaro.org> <87y3i4d4jv.fsf@linaro.org> <abef9b59-9f7e-8871-7d36-67c7612457ed@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 05/67] target/arm: Implement SVE load vector/predicate
In-reply-to: <abef9b59-9f7e-8871-7d36-67c7612457ed@linaro.org>
Date: Fri, 06 Apr 2018 14:03:36 +0100
Message-ID: <876054cwrb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NHlzkdi1R/Pg


Richard Henderson <richard.henderson@linaro.org> writes:

> On 04/03/2018 07:26 PM, Alex Benn=C3=A9e wrote:
>> You don't use it yet but probably worth a:
>>
>> static inline int ffr_full_reg_offset(DisasContext *s)
>> {
>>     return pred_full_reg_offset(s, 16);
>> }
>>
>> here when you get to it to avoid the magic 16 appearing in the main code.
>
> Hum.  Most of the places that ffr is touched is in sve.decode.
> I could certainly enhance the grammar there to allow a symbol
> there instead of a number.
>
> But I don't think treating ffr differently from a regular pr
> register, as above, is a good idea.  At best I would use
>
>   pred_full_reg_offset(s, FFR_PRED_NUM)

That would a fine alternative ;-)

--
Alex Benn=C3=A9e
