Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t21-20020a1c7715000000b003fe0bb31a6asm20911776wmi.43.2023.08.16.05.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 05:36:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 39EDE1FFBB;
	Wed, 16 Aug 2023 13:36:40 +0100 (BST)
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
 <20230815145126.3444183-5-alex.bennee@linaro.org>
 <130aa9ee49dffd9ecc1006b17b9e82734837d7d9.camel@linux.ibm.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Ilya
 Leoshkevich <iii@linux.ibm.com>
Cc: Beraldo Leal <bleal@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Akihiko
  Odaki <akihiko.odaki@daynix.com>, Thomas Huth <thuth@redhat.com>, David
  Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas
  Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/9] tests: remove test-gdbstub.py
Date: Wed, 16 Aug 2023 13:33:11 +0100
In-reply-to: <130aa9ee49dffd9ecc1006b17b9e82734837d7d9.camel@linux.ibm.com>
Message-ID: <87zg2rnoyv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ifdiI4nqM8Dq


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> On Tue, 2023-08-15 at 15:51 +0100, Alex Benn=C3=A9e wrote:
>> This isn't directly called by our CI and because it doesn't run via
>> our run-test.py script does things slightly differently. Lets remove
>> it as we have plenty of working in-tree tests now for various aspects
>> of gdbstub.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> =C2=A0tests/guest-debug/test-gdbstub.py | 177 --------------------------=
--
>> --
>> =C2=A01 file changed, 177 deletions(-)
>> =C2=A0delete mode 100644 tests/guest-debug/test-gdbstub.py
>
> There doesn't seem to be a hbreak test elsewhere, but according to a
> comment in tcg/multiarch/gdbstub/memory.py it would be mapped to a
> normal break anyway.

It is for TCG but for other accelerators there will be different
handling (although I'm fairly sure only x86 and aarch64 are currently
plumbed to use the CPUs hbreak bits on KVM).

However this particular script was a very early addition when I was
testing stuff manually with images I'd built on my system. If we want to
exercise the gdbstub for accelerators it might be better porting the
test to avocado?

>
> Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
