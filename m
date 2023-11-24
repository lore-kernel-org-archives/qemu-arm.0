Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e15-20020a056000120f00b0032da35baf7bsm3925756wrx.113.2023.11.24.02.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:24:19 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A69255F7AA;
	Fri, 24 Nov 2023 10:24:18 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
  qemu-devel@nongnu.org,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Gavin
 Shan
 <gshan@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Evgeny Iakovlev
 <eiakovlev@linux.microsoft.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.2 v4 00/10] hw/char/pl011: Implement TX (async)
 FIFO to avoid blocking the main loop
In-Reply-To: <CAFEAcA_0BfGVDZWJUPs8hwYRKS8FmzppQgY+s83qxBXHjLJvnw@mail.gmail.com>
	(Peter Maydell's message of "Mon, 13 Nov 2023 13:11:22 +0000")
References: <20231109192814.95977-1-philmd@linaro.org>
	<CAFEAcA8MJeX1Jk_-ONP1nNgHYadL7Oa8P3jGQXwNoofQnJWk8g@mail.gmail.com>
	<4ffed8f5-6624-4488-a74f-567cbd926b78@linaro.org>
	<CAFEAcA_0BfGVDZWJUPs8hwYRKS8FmzppQgY+s83qxBXHjLJvnw@mail.gmail.com>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Fri, 24 Nov 2023 10:24:18 +0000
Message-ID: <87jzq7cuul.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: LxBQKe/wdiBN

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 9 Nov 2023 at 20:59, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>>
>> Hi Peter,
>>
>> On 9/11/23 20:29, Peter Maydell wrote:
>> > On Thu, 9 Nov 2023 at 19:28, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
>> >>
>> >> Missing review: #10
>> >>
>> >> Hi,
>> >>
>> >> This series add support for (async) FIFO on the transmit path
>> >> of the PL011 UART.
>> >
>> > Hi; what's the rationale for the "for-8.2" targeting here?
>> > What bug are we fixing?
>>
>> The bug is on Trusted Substrate when the ZynqMP machine is used:
>> https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=3D149574
>
> And have we confirmed that the async FIFO support fixes that problem?
> That bug report seems to have mostly just speculation in it that
> maybe this XXX comment is why...

I've been fighting with numerous issues with the TRS build over the last
week so I can confirm I have seen a) a lock up with pl011_write blocking
everything under the BQL because data wasn't read fast enough and b) the
problem goes away with Philippe's patches. So have a:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

for the series.

>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
