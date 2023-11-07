Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id je3-20020a05600c1f8300b004083bc9ac90sm15280611wmb.24.2023.11.07.02.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:24:52 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7F7485F790;
	Tue,  7 Nov 2023 10:24:51 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  Cleber Rosa <crosa@redhat.com>,
  Wainer dos Santos Moschetta <wainersm@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,  John Snow
 <jsnow@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Chris
 Wulff <crwulff@gmail.com>,  Marek Vasut <marex@denx.de>,  Richard
 Henderson <richard.henderson@linaro.org>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 08/22] gdbstub: Add num_regs member to GDBFeature
In-Reply-To: <3bf96059-44a8-4af3-9b0b-c9f070cd498b@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 7 Nov 2023 11:07:11
 +0100 (15
	minutes, 33 seconds ago)")
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
	<20231106185112.2755262-9-alex.bennee@linaro.org>
	<3bf96059-44a8-4af3-9b0b-c9f070cd498b@linaro.org>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Tue, 07 Nov 2023 10:24:51 +0000
Message-ID: <878r797te4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /wSadQdVkS7F

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Alex,
>
> On 6/11/23 19:50, Alex Benn=C3=A9e wrote:
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Currently the number of registers exposed to GDB is written as magic
>> numbers in code. Derive the number of registers GDB actually see from
>> XML files to replace the magic numbers in code later.
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20231025093128.33116-2-akihiko.odaki@daynix.com>
>
> Something in your workflow is odd, you should keep this Message-Id,
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20231103195956.1998255-9-alex.bennee@linaro.org>
>
> and not propagate this one, IMO.

Why not - it tracks all the review stuff. I explicitly keep on
Message-Id per domain so we see the original posting and the last time
it was posted (which you can then follow the chain of reviews from
there).

If we want to have an explicit policy on which Message-Id's to keep then
we should document it.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
