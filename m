Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b24a770c3sm6490450a12.20.2024.07.17.01.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 01:24:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 239605F738;
	Wed, 17 Jul 2024 09:24:03 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Akihiko Odaki <akihiko.odaki@daynix.com>,
  Gustavo Bueno Romero <gustavo.romero@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
In-Reply-To: <afa432f7-ed06-4074-8849-796984be0bc5@linaro.org> (Richard
	Henderson's message of "Wed, 17 Jul 2024 07:53:01 +1000")
References: <20240716114229.329355-1-alex.bennee@linaro.org>
	<b9b178fc-04f5-49a6-992a-f6920408b41f@linaro.org>
	<87cyndgtui.fsf@draig.linaro.org>
	<afa432f7-ed06-4074-8849-796984be0bc5@linaro.org>
Date: Wed, 17 Jul 2024 09:24:03 +0100
Message-ID: <878qy0h1ek.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PV4PigvreAYA

Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/17/24 02:55, Alex Benn=C3=A9e wrote:
>>> Are you expecting the same GdbCmdParseEntry object to be registered
>>> multiple times?  Can we fix that at a higher level?
>> Its basically a hack to deal with the fact everything is tied to the
>> CPUObject so we register everything multiple times. We could do a if
>> (!registerd) register() dance but I guess I'm thinking forward to a
>> hydrogenous future but I guess we'd need to do more work then anyway.
>
> Any chance we could move it all to the CPUClass?

We would have to move quite a bunch of stuff, including the system
register creation code. I don't think that's a re-factor I want to
attempt quite so close to soft-freeze.

>
>
> r~

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
