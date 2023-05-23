Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o10-20020a056000010a00b002c70ce264bfsm11454310wrx.76.2023.05.23.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:05:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 220F21FFBB;
	Tue, 23 May 2023 17:05:14 +0100 (BST)
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-3-richard.henderson@linaro.org>
 <b51a6df0-b53b-c6dc-b496-0c320aad463d@linaro.org>
 <dddfb5fc-31b6-9561-5d71-1e83534dc269@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Juan
 Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 02/27] util: Add cpuinfo-i386.c
Date: Tue, 23 May 2023 17:01:47 +0100
In-reply-to: <dddfb5fc-31b6-9561-5d71-1e83534dc269@linaro.org>
Message-ID: <87r0r72fut.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QeAY4JgtWbwh


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/21/23 04:28, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 20/5/23 18:26, Richard Henderson wrote:
>>> Add cpuinfo.h for i386 and x86_64, and the initialization
>>> for that in util/.=C2=A0 Populate that with a slightly altered
>>> copy of the tcg host probing code.=C2=A0 Other uses of cpuid.h
>>> will be adjusted one patch at a time.
>>>
>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>> =C2=A0 host/include/i386/host/cpuinfo.h=C2=A0=C2=A0 | 38 ++++++++++++
>>> =C2=A0 host/include/x86_64/host/cpuinfo.h |=C2=A0 1 +
>>> =C2=A0 util/cpuinfo-i386.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 97 ++++++++++++++++++++++++=
++++++
>>> =C2=A0 util/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
>>> =C2=A0 4 files changed, 140 insertions(+)
>>> =C2=A0 create mode 100644 host/include/i386/host/cpuinfo.h
>>> =C2=A0 create mode 100644 host/include/x86_64/host/cpuinfo.h
>>> =C2=A0 create mode 100644 util/cpuinfo-i386.c
>> Missing F: entry in MAINTAINERS file. We probably need new sections.
>
> What would you put there?

Part of Guest CPU cores (TCG) I guess.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
