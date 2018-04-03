Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b13sm473666wmi.42.2018.04.03.08.41.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Apr 2018 08:41:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 9F63F3E0085;
	Tue,  3 Apr 2018 16:41:29 +0100 (BST)
References: <20180217182323.25885-1-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v2 00/67] target/arm: Scalable Vector Extension
In-reply-to: <20180217182323.25885-1-richard.henderson@linaro.org>
Date: Tue, 03 Apr 2018 16:41:29 +0100
Message-ID: <87woxocn6e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: zDWtPRJB8zjv


Richard Henderson <richard.henderson@linaro.org> writes:

> This is 99% of the instruction set.  There are a few things missing,
> notably first-fault and non-fault loads (even these are decoded, but
> simply treated as normal loads for now).

I've finished my quick pass, apart from the individual comments I think
it looks pretty good.

--
Alex Benn=C3=A9e
