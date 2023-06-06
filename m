Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t3-20020adfe103000000b0030ae6432504sm13071305wrz.38.2023.06.06.10.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 10:05:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9F9961FFBB;
	Tue,  6 Jun 2023 18:05:24 +0100 (BST)
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-6-philmd@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 5/5] tests/tcg/aarch64: Rename bti-crt.inc.c ->
 bti-crt.c.inc
Date: Tue, 06 Jun 2023 18:05:20 +0100
In-reply-to: <20230606141252.95032-6-philmd@linaro.org>
Message-ID: <87o7lsh67f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: roFti6PPFjJ6


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
>
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
>
>   If you do use template header files they should be named with
>   the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>   being included for expansion.
>
> Therefore rename 'bti-crt.inc.c' as 'bti-crt.c.inc'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
