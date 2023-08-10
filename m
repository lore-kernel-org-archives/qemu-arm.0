Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w17-20020adfee51000000b00317eee26bf0sm2674971wro.69.2023.08.10.09.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:36:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EB7161FFBB;
	Thu, 10 Aug 2023 17:36:36 +0100 (BST)
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <CAFEAcA9bOS7tJDe_TRKOUGFcCDq_CjUfzAF7dYYRJbZA=5hvqw@mail.gmail.com>
User-agent: mu4e 1.11.13; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang
 Luo <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, David Hildenbrand
 <david@redhat.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, Wainer dos
 Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 0/8] some testing and gdbstub fixes
Date: Thu, 10 Aug 2023 17:35:40 +0100
In-reply-to: <CAFEAcA9bOS7tJDe_TRKOUGFcCDq_CjUfzAF7dYYRJbZA=5hvqw@mail.gmail.com>
Message-ID: <87il9m3ld7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FYSl11lzktt/


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Aug 2023 at 16:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This is mostly gdbstub focused but I cleaned up some bits while I was
>> in the testing makefiles. This is mostly to make the "check-tcg"
>> output as clean as possible without ugly line wraps. I tried to
>> eliminate the gdbstub info() output but sadly this is harder than
>> expected.
>>
>> I've tweaked the gdbstub handling for Ctrl-c packets as suggested by
>> Matheus. While I was there I also noticed we were being a bit precious
>> about gdb sending preemptive ACKS so I fixed that as well.
>>
>> I don't know if this is all late 8.1-rc material but its fairly simple
>> testing updates and the ccache stuff from Daniel should help as well.
>
> At this point in the cycle I would favour putting in
> the minimum that actually fixes bugs / test failure issues.

So 7 and 8? I would argue for 6 as well given that's a foot gun just
waiting to happen.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
