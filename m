Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d4f91000000b0031433d8af0dsm6999544wru.18.2023.07.04.09.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:02:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D8C3D1FFBB;
	Tue,  4 Jul 2023 17:02:26 +0100 (BST)
References: <20230704154332.3014896-1-peter.maydell@linaro.org>
User-agent: mu4e 1.11.8; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: Avoid over-length shift in
 arm_cpu_sve_finalize() error case
Date: Tue, 04 Jul 2023 17:00:33 +0100
In-reply-to: <20230704154332.3014896-1-peter.maydell@linaro.org>
Message-ID: <87jzvffywd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dtWIzmD7gEhW


Peter Maydell <peter.maydell@linaro.org> writes:

> If you build QEMU with the clang sanitizer enabled, you can see it
> fire when running the arm-cpu-features test:
>
> $ QTEST_QEMU_BINARY=3D./build/arm-clang/qemu-system-aarch64 ./build/arm-c=
lang/tests/qtest/arm-cpu-features
> [...]
> ../../target/arm/cpu64.c:125:19: runtime error: shift exponent 64 is too =
large for 64-bit type 'unsigned long long'
> [...]
>
> This happens because the user can specify some incorrect SVE
> properties that result in our calculating a max_vq of 0.  We catch
> this and error out, but before we do that we calculate
>
>  vq_mask =3D MAKE_64BIT_MASK(0, max_vq);$
>
> and the MAKE_64BIT_MASK() call is only valid for lengths that are
> greater than zero, so we hit the undefined behaviour.

Hmm that does make me worry we could have more land mines waiting to be
found. Would converting MAKE_64BIT_MASK into an inline function and
asserting be a better solution?

>
> Change the logic so that if max_vq is 0 we specifically set vq_mask
> to 0 without going via MAKE_64BIT_MASK().  This lets us drop the
> max_vq check from the error-exit logic, because if max_vq is 0 then
> vq_map must now be 0.
>
> The UB only happens in the case where the user passed us an incorrect
> set of SVE properties, so it's not a big problem in practice.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
