Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id eq7-20020a056402298700b00419d8d46a8asm7949706edb.39.2022.04.19.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 03:41:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CF8CC1FFB7;
	Tue, 19 Apr 2022 11:41:56 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 01/60] tcg: Add tcg_constant_ptr
Date: Tue, 19 Apr 2022 11:41:52 +0100
In-reply-to: <20220417174426.711829-2-richard.henderson@linaro.org>
Message-ID: <87bkwxxsln.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rs4V0wAAdrip


Richard Henderson <richard.henderson@linaro.org> writes:

> Similar to tcg_const_ptr, defer to tcg_constant_{i32,i64}.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
