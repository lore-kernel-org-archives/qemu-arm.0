Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id cq24-20020a056402221800b00420ad7d2dd0sm8397686edb.29.2022.04.19.04.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 04:17:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3C1891FFB7;
	Tue, 19 Apr 2022 12:17:04 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-6-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 05/60] target/arm: Change DisasContext.aarch64 to bool
Date: Tue, 19 Apr 2022 12:16:59 +0100
In-reply-to: <20220417174426.711829-6-richard.henderson@linaro.org>
Message-ID: <87pmldwcen.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cA2fk27dqFxs


Richard Henderson <richard.henderson@linaro.org> writes:

> Bool is a more appropriate type for this value.
> Move the member down in the struct to keep the
> bool type members together and remove a hole.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
