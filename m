Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id i2-20020adfdec2000000b002b9b9445149sm14528493wrn.54.2023.01.10.15.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 15:27:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E441B1FFB7;
	Tue, 10 Jan 2023 23:27:10 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 01/36] tcg: Define TCG_TYPE_I128 and related helper
 macros
Date: Tue, 10 Jan 2023 23:27:05 +0000
In-reply-to: <20230108023719.2466341-2-richard.henderson@linaro.org>
Message-ID: <878riam0mp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AZIoXLWAYcM4


Richard Henderson <richard.henderson@linaro.org> writes:

> Begin staging in support for TCGv_i128 with Int128.
> Define the type enumerator, the typedef, and the
> helper-head.h macros.
>
> This cannot yet be used, because you can't allocate
> temporaries of this new type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
