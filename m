Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r2sm15739134wrr.65.2019.05.01.08.10.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 08:10:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4DA111FF87;
	Wed,  1 May 2019 16:10:12 +0100 (BST)
References: <20190430165234.32272-1-alex.bennee@linaro.org> <20190430165234.32272-10-alex.bennee@linaro.org> <357d799d-898f-3e1e-d4cb-beeac89cb528@linaro.org>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
Subject: Re: [Qemu-devel] [PATCH v5 09/15] accel/tcg: remove softmmu_template.h
In-reply-to: <357d799d-898f-3e1e-d4cb-beeac89cb528@linaro.org>
Date: Wed, 01 May 2019 16:10:12 +0100
Message-ID: <87zho65hyj.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dqUJKOyAiunA


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/30/19 9:52 AM, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  accel/tcg/softmmu_template.h | 454 -----------------------------------
>>  1 file changed, 454 deletions(-)
>>  delete mode 100644 accel/tcg/softmmu_template.h
>
> Why is this separate from patch 7?

No particular reason, we can certainly merge them.

>
>
> r~


--
Alex Benn=C3=A9e
