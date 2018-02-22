Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x10sm686778wrc.64.2018.02.22.09.23.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Feb 2018 09:23:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 59D913E004E;
	Thu, 22 Feb 2018 17:23:54 +0000 (GMT)
References: <20180208173157.24705-1-alex.bennee@linaro.org> <20180208173157.24705-21-alex.bennee@linaro.org> <d6f98bba-04ca-80f6-1fad-cfed416f4127@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 20/32] arm/translate-a64: add FP16 FCMxx (zero) to simd_two_reg_misc_fp16
In-reply-to: <d6f98bba-04ca-80f6-1fad-cfed416f4127@linaro.org>
Date: Thu, 22 Feb 2018 17:23:54 +0000
Message-ID: <87h8q99bv9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: aaJTuh2vVjdk


Richard Henderson <richard.henderson@linaro.org> writes:

> On 02/08/2018 09:31 AM, Alex Benn=C3=A9e wrote:
>> +            maxpasses =3D hp ? (is_q ? 8 : 4) : (is_q ? 4 : 2);
>
>   (8 << is_q) >> size
>
> ?

Hmm I'm not so sure about this. While mine is longer form at least the
intent is clear. What about:

    maxpasses =3D (is_q ? 4 : 2) << hp

It's still a little magical IMHO though...

--
Alex Benn=C3=A9e
