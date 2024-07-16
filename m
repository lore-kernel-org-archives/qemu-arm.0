Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a3a93sm319615066b.6.2024.07.16.06.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 06:48:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B160D5F7A0;
	Tue, 16 Jul 2024 14:48:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  Akihiko Odaki <akihiko.odaki@daynix.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
In-Reply-To: <b9690162-170e-1f74-f148-0642a8503002@linaro.org> (Gustavo
	Romero's message of "Tue, 16 Jul 2024 09:42:51 -0300")
References: <20240716114229.329355-1-alex.bennee@linaro.org>
	<b9690162-170e-1f74-f148-0642a8503002@linaro.org>
Date: Tue, 16 Jul 2024 14:48:04 +0100
Message-ID: <87plrdh2i3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qBrElILJpCEE

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Hi Alex,
>
> On 7/16/24 8:42 AM, Alex Benn=C3=A9e wrote:
>> Coverity reported a memory leak (CID 1549757) in this code and its
>> admittedly rather clumsy handling of extending the command table.
>> Instead of handing over a full array of the commands lets use the
>> lighter weight GPtrArray and simply test for the presence of each
>> entry as we go. This avoids complications of transferring ownership of
>> arrays and keeps the final command entries as static entries in the
>> target code.
> How did you run Coverity to find the leak? I'm wondering what's the
> quickest way to check it next time.

Coverity is only run in the cloud on the released build. There is a
container somewhere but I don't know how its used.

I did test on a build with --enable-sanitizers though.

>
>
>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Cc: Gustavo Bueno Romero <gustavo.romero@linaro.org>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>
>
> Cheers,
> Gustavo

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
