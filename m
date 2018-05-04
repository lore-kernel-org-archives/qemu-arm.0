Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 42-v6sm27913230wrx.24.2018.05.04.05.26.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 May 2018 05:26:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id DE5243E00E9;
	Fri,  4 May 2018 13:26:09 +0100 (BST)
References: <20180502154344.10585-1-alex.bennee@linaro.org> <20180502154344.10585-3-alex.bennee@linaro.org> <CAFEAcA80vTz25WHGKteTU3nxSi2fUHN8dp+z8paNP03conAghQ@mail.gmail.com> <9549d686-899d-7b3b-dae3-d3cc22528e50@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 2/3] fpu/softfloat: support ARM Alternative half-precision
In-reply-to: <9549d686-899d-7b3b-dae3-d3cc22528e50@linaro.org>
Date: Fri, 04 May 2018 13:26:09 +0100
Message-ID: <87y3gz8v4u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: r5U23EreOK5j


Richard Henderson <richard.henderson@linaro.org> writes:

> On 05/03/2018 11:17 AM, Peter Maydell wrote:
>> (target/i386 notably does not do this, we should check how
>> SSE and x87 handle NaNs in fp conversions first.)
>
> Hardware does silence NaNs.  I tested that earlier:
>
> https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg03114.html

Does that include SSE? I know the hardware will silence NaN's if the
value is ever pushed into an x87 register (as GCC will do when
spilling/filling float).

>
>
> r~


--
Alex Benn=C3=A9e
