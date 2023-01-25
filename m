Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p23-20020a1c5457000000b003da286f8332sm983539wmi.18.2023.01.25.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:32:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A75F81FFB7;
	Wed, 25 Jan 2023 08:32:02 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 04/36] tcg: Introduce tcg_out_addi_ptr
Date: Wed, 25 Jan 2023 08:31:57 +0000
In-reply-to: <20230108023719.2466341-5-richard.henderson@linaro.org>
Message-ID: <87wn5bqakd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7jruFIPfehha


Richard Henderson <richard.henderson@linaro.org> writes:

> Implement the function for arm, i386, and s390x, which will use it.
> Add stubs for all other backends.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
