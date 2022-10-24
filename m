Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id n4-20020a1ca404000000b003c41144b3cfsm8367942wme.20.2022.10.24.07.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:53:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7DFC31FFB7;
	Mon, 24 Oct 2022 15:53:43 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-7-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v6 06/14] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Mon, 24 Oct 2022 15:53:15 +0100
In-reply-to: <20221024051851.3074715-7-richard.henderson@linaro.org>
Message-ID: <87fsfd9sso.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ywk0WYQ/knSd


Richard Henderson <richard.henderson@linaro.org> writes:

> This fault type is to be used with FEAT_HAFDBS when
> the guest enables hw updates, but places the tables
> in memory where atomic updates are unsupported.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
