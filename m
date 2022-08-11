Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id m4-20020aa7d344000000b0043b7917b1a4sm9250143edr.43.2022.08.11.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:19:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EBB261FFB7;
	Thu, 11 Aug 2022 16:19:57 +0100 (BST)
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
 <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
 <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Vitaly Buka <vitalybuka@google.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Date: Thu, 11 Aug 2022 16:18:39 +0100
In-reply-to: <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu>
Message-ID: <87r11miz8i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: bgNvcvwXXEtx


Laurent Vivier <laurent@vivier.eu> writes:

> Le 11/08/2022 =C3=A0 13:54, Peter Maydell a =C3=A9crit=C2=A0:
>> On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> Le 10/08/2022 =C3=A0 22:47, Richard Henderson a =C3=A9crit :
>>>> On 8/10/22 13:32, Vitaly Buka wrote:
>>>>> Sorry, I only noticed today that it's not submitted.
>>>>> Version is not critical for us, as we build from masters anyway.
>>>>> Richard, do you know a reason to consider this critical?
>>>>>
>>>>> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org
>>>>> <mailto:peter.maydell@linaro.org>> wrote:
>>>>>
>>>>>      On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>>>>>      <mailto:vitalybuka@google.com>> wrote:
>>>>>       >
>>>>>       > How can we land this one?
>>>>>
>>>>>      Pinging it a week ago rather than now would have been a good sta=
rt :-(
>>>>>      I think it got missed because you didn't cc the linux-user maint=
ainer.
>>>>>
>>>>>      Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>>>>
>>>> It's unfortunate that it got missed.  It's not critical, but it would =
be nice, because support for
>>>> MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
>>>>
>>>> I'll note there are missing braces for coding style on an IF.
>>>>
>>>> Laurent, do you have an objection to merging this for rc3?
>>>>
>>>
>>> No objection.
>>>
>>> Do you want it goes via the arm branch or via the linux-user branch?
>>>
>>> If it goes via linux-user I can run the LTP testsuite but it takes 1 da=
y.
>> I think we should definitely run the LTP testsuite on it, so
>> taking it via linux-user probably makes more sense.
>
> ok, applied to my linux-user-for-7.1 branch.
>
> Running tests.

Any chance you could pick up:

  Subject: [PATCH v2] linux-user: un-parent OBJECT(cpu) when closing thread
  Date: Wed,  3 Aug 2022 14:05:37 +0100
  Message-Id: <20220803130537.763666-1-alex.bennee@linaro.org>

before you run the tests?

>
> Thanks,
> Laurent


--=20
Alex Benn=C3=A9e
