Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g15sm4611183wmk.17.2019.09.12.04.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:02:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 469A11FF87;
	Thu, 12 Sep 2019 12:02:16 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-4-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 03/13] target/arm/arm-semi: Make semihosting
 code hand out its own file descriptors
In-reply-to: <20190910144428.32597-4-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:02:16 +0100
Message-ID: <87pnk5zsjr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WbnPFpUVI+d/


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently the Arm semihosting code returns the guest file descriptors
> (handles) which are simply the fd values from the host OS or the
> remote gdbstub. Part of the semihosting 2.0 specification requires
> that we implement special handling of opening a ":semihosting-features"
> filename. Guest fds which result from opening the special file
> won't correspond to host fds, so to ensure that we don't end up
> with duplicate fds we need to have QEMU code control the allocation
> of the fd values we give the guest.
>
> Add in an abstraction layer which lets us allocate new guest FD
> values, and translate from a guest FD value back to the host one.
> This also fixes an odd hole where a semihosting guest could
> use the semihosting API to read, write or close file descriptors
> that it had never allocated but which were being used by QEMU itself.

I'm kind surprised QEMU doesn't already need this sort of facility for
something else. I guess virtfs and 9p have their own thing?
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e
