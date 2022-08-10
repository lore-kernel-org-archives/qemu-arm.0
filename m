Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id j4-20020a05600c1c0400b003a31fd05e0fsm7506692wms.2.2022.08.10.06.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:27:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C2E451FFB7;
	Wed, 10 Aug 2022 14:27:44 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-30-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 29/62] target/arm: Add is_secure parameter to
 v7m_read_half_insn
Date: Wed, 10 Aug 2022 14:27:40 +0100
In-reply-to: <20220703082419.770989-30-richard.henderson@linaro.org>
Message-ID: <87pmh8jkj3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sH5zNKZq5Oix


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from v7m_read_half_insn.
> As it happens, both callers pass true, but that is a detail
> of v7m_handle_execute_nsc we need not expose to the callee.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
