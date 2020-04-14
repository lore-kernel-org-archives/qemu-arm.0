Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a1sm10094358wrn.80.2020.04.14.07.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 07:22:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4D9FB1FF7E;
	Tue, 14 Apr 2020 15:22:19 +0100 (BST)
References: <20200414102427.7459-1-philmd@redhat.com>
 <CAFEAcA-PyMisjC25CSGyU5-ASjaAd7gQMabzMCR=uvudSBk-Fw@mail.gmail.com>
 <357e2335-b00f-cd28-4ade-d6286ace144f@redhat.com>
 <CAFEAcA8BgkqNQToJZy0=SOSxF2QWgxrP79Gj1qaVUm5xdvm65A@mail.gmail.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, QEMU
 Developers
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Max Filippov
 <jcmvbkbc@gmail.com>
Subject: Re: [PATCH-for-5.0] gdbstub: Do not use memset() on GByteArray
In-reply-to: <CAFEAcA8BgkqNQToJZy0=SOSxF2QWgxrP79Gj1qaVUm5xdvm65A@mail.gmail.com>
Date: Tue, 14 Apr 2020 15:22:19 +0100
Message-ID: <87d08a9mg4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BvfaJMvUKIVE


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 14 Apr 2020 at 12:05, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>> > The other implementation option here would be
>> >
>> >       guint oldlen =3D array->len;
>> >       g_byte_array_set_size(array, oldlen + len);
>> >       memset(array->data + oldlen, 0, len);
>>
>> I thought about it but I'd rather not access GByteArray internals.
>
> AIUI ->len and ->data are not internals -- they're
> in the documentation as "public fields" and the code
> example for GByteArray directly accesses ->data.

They are - and I do it in a few places in the gdbstub when it's easier
than going long form. FWIW I prefer Peter's formulation.

> (Contrast GBytes, where there are no defined public
> fields and instead there are functions g_bytes_get_data
> and g_bytes_get_size.)
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
