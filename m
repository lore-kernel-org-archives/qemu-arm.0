Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id y12-20020adfd08c000000b00220592005edsm16087164wrh.85.2022.08.10.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:18:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E82E51FFB7;
	Wed, 10 Aug 2022 14:18:33 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-27-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 26/62] target/arm: Add is_secure parameter to
 regime_translation_disabled
Date: Wed, 10 Aug 2022 14:18:28 +0100
In-reply-to: <20220703082419.770989-27-richard.henderson@linaro.org>
Message-ID: <87y1vwjkye.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2Q1GHtxEP7P5


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from regime_translation_disabled.
>
> This fixes a bug in S1_ptw_translate and get_phys_addr where we had
> passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
> Stage2 is disabled, affecting FEAT_SEL2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
