Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o6sm7841658wrp.3.2020.06.19.10.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 10:15:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 30BE21FF7E;
	Fri, 19 Jun 2020 18:15:22 +0100 (BST)
References: <20200619170324.12093-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Pavel
 Dovgalyuk <dovgaluk@ispras.ru>
Subject: Re: [PATCH] target/arm: Remove unnecessary gen_io_end() calls
In-reply-to: <20200619170324.12093-1-peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 18:15:22 +0100
Message-ID: <875zbnugd1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 43HbyzGh10BT


Peter Maydell <peter.maydell@linaro.org> writes:

> Since commit ba3e7926691ed3 it has been unnecessary for target code
> to call gen_io_end() after an IO instruction in icount mode; it is
> sufficient to call gen_io_start() before it and to force the end of
> the TB.
>
> Many now-unnecessary calls to gen_io_end() were removed in commit
> 9e9b10c6491153b, but some were missed or accidentally added later.
> Remove unneeded calls from the arm target:
>
>  * the call in the handling of exception-return-via-LDM is
>    unnecessary, and the code is already forcing end-of-TB
>  * the call in the VFP access check code is more complicated:
>    we weren't ending the TB, so we need to add the code to
>    force that by setting DISAS_UPDATE

That was the thing I was staring at trying to puzzle out.

I guess going forward we want to base the base DisasContext to
gen_io_start so we can flip a bit and then assert we don't start a new
instruction having already handled an IO instruction which should have
been the last one.

>  * the doc comment for ARM_CP_IO doesn't need to mention
>    gen_io_end() any more
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
