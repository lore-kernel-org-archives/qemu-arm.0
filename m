Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b7sm2441545wrj.28.2019.09.11.06.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 06:14:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 26A601FF87;
	Wed, 11 Sep 2019 14:14:57 +0100 (BST)
References: <20190906202636.28642-1-alex.bennee@linaro.org>
 <CAFEAcA-DQ0Zq40Xnw5wkA6ojOUCf67xfX83nMEoKW_UrysJhjQ@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v4 0/4] semihosting at translate time fixes
In-reply-to: <CAFEAcA-DQ0Zq40Xnw5wkA6ojOUCf67xfX83nMEoKW_UrysJhjQ@mail.gmail.com>
Date: Wed, 11 Sep 2019 14:14:56 +0100
Message-ID: <871rwn0yb3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: UolVFqjd4ynS


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 6 Sep 2019 at 21:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Hi Peter,
>>
>> Hopefully this is the final version of the semihosting at translate
>> time patches. I've applied Richard's IS_USER changes and gated the SVN
>> for !M profile.
>>
>> Alex Benn=C3=A9e (3):
>>   target/arm: handle M-profile semihosting at translate time
>>   target/arm: handle A-profile semihosting at translate time
>>   target/arm: remove run time semihosting checks
>
> Hi. I've just been looking at these, and I noticed that
> they seem to accidentally extend the "no semihosting
> in user mode" check that is currently for softmmu only
> to also cover linux-user mode (where it would amount
> to "never provide semihosting").

I misread Richard's comments - he only actually said to drop the #ifndef
CONFIG_USER while using !IS_USER for M profile. I'll return the #ifndef
CONFIG_USER for A-profile.

It does seem a bit weird that userspace linux-user does do semihosting
whereas EL0 in softmmu doesn't. Is that because we are effectively
short-circuiting what a real ARM kernel would be doing for EL0?

> This is because we used
> to do the check in the helper.c code which is only used
> by softmmu, and not in the linux-user/arm/cpu_loop.c
> equivalent that linux-user uses. But now we do the check
> in translate.c, which is common to both.
>
> There's also some missed cleanup in that the linux-user
> code can also have the "maybe EXCP_BKPT/EXCP_SWI is a semihosting
> call" checks deleted.

I'll have a look at that.

>
>> Emilio G. Cota (1):
>>   atomic_template: fix indentation in GEN_ATOMIC_HELPER
>
> I've taken the atomic_template fix into target-arm.next,
> since it's unrelated.
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
