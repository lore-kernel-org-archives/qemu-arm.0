Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 189sm5353773wma.6.2019.09.13.06.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 06:48:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 757DF1FF87;
	Fri, 13 Sep 2019 14:48:45 +0100 (BST)
References: <20190911164959.11003-1-alex.bennee@linaro.org>
 <20190911164959.11003-3-alex.bennee@linaro.org>
 <CAFEAcA8NsdpEMOH1MFDta0LUswyqSDHCgtOh6g5k3+EU0FVuHA@mail.gmail.com>
 <875zlwz5o1.fsf@linaro.org>
 <CAFEAcA-6BmxkFND4nZBFs70nVPEFzSFrE6RMQ1O3ftqozYYoBA@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 2/5] target/arm: handle M-profile semihosting at
 translate time
In-reply-to: <CAFEAcA-6BmxkFND4nZBFs70nVPEFzSFrE6RMQ1O3ftqozYYoBA@mail.gmail.com>
Date: Fri, 13 Sep 2019 14:48:45 +0100
Message-ID: <874l1gz4qq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xA2iTu4u7PEP


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 13 Sep 2019 at 14:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > This is still disabling semihosting for the linux-user-mode
>> > build for M-profile, isn't it ?
>>
>> Sure - as rth suggested. But m-profile doesn't run Linux so why would we
>> support it in linux-user?
>
> (a) Linux does support Cortex-M, since it has no-mmu uCLinux style
> support these days

TIL

> (b) gcc test case binaries, which tend to get run on linux-user
> even though in theory they're not actually Linux binaries

Ahh ok - that's fair. I'll add the ifndef for that then.

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
