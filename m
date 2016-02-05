Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id pu8sm16646194wjc.17.2016.02.05.08.43.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 08:43:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id DA30D3E0180;
	Fri,  5 Feb 2016 16:43:42 +0000 (GMT)
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org> <1454506721-11843-6-git-send-email-peter.maydell@linaro.org> <87io23nsqe.fsf@linaro.org> <CAFEAcA_RJs_DaBa2YqP3z+-ykMntPULEWAYO8LnQz8Qzs+dyXA@mail.gmail.com> <87egcrnnbe.fsf@linaro.org> <CAFEAcA_H-BoNJ_h8pHDanZ-OrqUKgmp7ubagOTNP1aTFQW4hCQ@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 5/7] target-arm: Add isread parameter to CPAccessFns
In-reply-to: <CAFEAcA_H-BoNJ_h8pHDanZ-OrqUKgmp7ubagOTNP1aTFQW4hCQ@mail.gmail.com>
Date: Fri, 05 Feb 2016 16:43:42 +0000
Message-ID: <878u2znm4h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: zoT0FA9b0US1


Peter Maydell <peter.maydell@linaro.org> writes:

> On 5 February 2016 at 16:17, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> I haven't measured, no, but since there are only 3 arguments the
>>> third argument is going to be in a register on any host architecture
>>> we care about, which means the overhead is just going to be a single
>>> "load constant 0 or 1 into register before the call". I think that's
>>> going to be lost in the noise compared to actually having to make
>>> the function call at all, the work the function call does, and then
>>> the second function call later to do the read or write.
>>
>> I was thinking of knock on effects on spilling other registers in the
>> TCG code. I guess this depends on how complex the code is around system
>> register access.
>
> The register in question is going to be caller-saves anyway, so no
> effect on spilling in the TCG code I think.

Well my only remaining objection is the additional line-wrapping looks
ugly which I don't think is a valid objection ;-)

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

>
> thanks
> -- PMM


--
Alex Bennée
