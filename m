Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r1sm16280104wrw.60.2019.10.23.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 08:17:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7ED5E1FF87;
	Wed, 23 Oct 2019 16:17:26 +0100 (BST)
References: <20191018174431.1784-1-richard.henderson@linaro.org>
 <CAFEAcA-MyKoA63UF6DYQ6J-dKihYn9iyG09eFCgWT8j4OqsQnw@mail.gmail.com>
 <CAFEAcA-Xj-6CdVzgfcVONipApD5b5PZ84nPnvbbOQjQkqQLnqA@mail.gmail.com>
 <6e06dede-2470-92e1-eba9-40646ed56af0@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 00/22] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
In-reply-to: <6e06dede-2470-92e1-eba9-40646ed56af0@linaro.org>
Date: Wed, 23 Oct 2019 16:17:26 +0100
Message-ID: <87zhhrmqyh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: bO6XdmRrAyr8


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/22/19 11:38 AM, Peter Maydell wrote:
>> Turns out this asserts in qemu-armeb :-(
>>
>> /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/armeb-linux=
-user/qemu-armeb
>> -L ./gnemul/qemu-armeb armeb/ls -l dummyfile
>> qemu-armeb: /home/petmay01/linaro/qemu-for-merges/target/arm/helper.c:11=
267:
>> cpu_get_tb_cpu_state: Assertion `flags =3D=3D
>> rebuild_hflags_internal(env)' failed.
>> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>> Segmentation fault (core dumped)
>>
>> Dropping this series again for the moment.
> Argh!  I had forgotten that we have no testing of armeb in check-tcg.

Does it need it's own toolchain or can it be done with flags?

>
> Yes, I see now that we need a recompute in linux-user/{aarch64,arm}/cpu_l=
oop.c
> specific to TARGET_WORDS_BIGENDIAN.
>
>
> r~


--
Alex Benn=C3=A9e
