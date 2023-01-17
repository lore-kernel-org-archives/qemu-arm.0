Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003b47b80cec3sm47993125wmb.42.2023.01.17.07.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 07:42:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2C47B1FFB7;
	Tue, 17 Jan 2023 15:42:23 +0000 (GMT)
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] target/arm: Reorg do_coproc_insn
Date: Tue, 17 Jan 2023 15:42:18 +0000
In-reply-to: <20230106194451.1213153-2-richard.henderson@linaro.org>
Message-ID: <87lem1cgm8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0VBJVJkwtpPa


Richard Henderson <richard.henderson@linaro.org> writes:

> Move the ri =3D=3D NULL case to the top of the function and return.
> This allows the else to be removed and the code unindented.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
