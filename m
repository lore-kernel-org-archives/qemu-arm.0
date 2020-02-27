Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l3sm6110602wrq.62.2020.02.27.04.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 04:31:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B03171FF87;
	Thu, 27 Feb 2020 12:31:50 +0000 (GMT)
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-5-alex.bennee@linaro.org>
 <2ca7b55b-5674-370d-5c4d-dc8b7782ca64@linaro.org>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
In-reply-to: <2ca7b55b-5674-370d-5c4d-dc8b7782ca64@linaro.org>
Date: Thu, 27 Feb 2020 12:31:50 +0000
Message-ID: <87pne0w6rt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Xw7MCIULCuWM


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/26/20 10:10 AM, Alex Benn=C3=A9e wrote:
>> While 32mb is certainly usable a full system boot ends up flushing the
>> codegen buffer nearly 100 times. Increase the default on 64 bit hosts
>> to take advantage of all that spare memory. After this change I can
>> boot my tests system without any TB flushes.
>
>> +#if TCG_TARGET_REG_BITS =3D=3D 32
>>  #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
>> +#else
>> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2 * GiB)
>> +#endif
>
> This particular number, I'm not so sure about.
>
> It makes sense for a lone vm, running in system mode, on a large-ish host.
> It's more questionable for a large-ish host running many system mode vm's,
> although one can tune that from the command-line, so perhaps it's
> still ok.

Yeah it would be nice to get some feedback from users. I suspect system
emulation means the mmap is less efficient due to the sharding of the
translation buffer.

> It does not make sense for a linux-user chroot, running make -jN, on just=
 about
> any host.  For linux-user, I could be happy with a modest increase, but n=
ot all
> the way out to 2GiB.
>
> Discuss.

Does it matter that much? Surely for small programs the kernel just
never pages in the used portions of the mmap?

That said does linux-user have a better idea of the size of the problem
set before we start running? Could we defer calling tcg_exec_init until
we have mapped in the main executable and then size based on that?

>
>
> r~


--=20
Alex Benn=C3=A9e
