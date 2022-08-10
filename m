Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id e12-20020adfa44c000000b0021e5cc26dd0sm16054100wra.62.2022.08.10.06.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:17:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4B6ED1FFB7;
	Wed, 10 Aug 2022 14:17:27 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-24-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 23/62] target/arm: Add is_secure parameter to
 pmsav7_use_background_region
Date: Wed, 10 Aug 2022 14:17:22 +0100
In-reply-to: <20220703082419.770989-24-richard.henderson@linaro.org>
Message-ID: <87bksskzko.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pZ2YzFUbpQNQ


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from pmsav7_use_background_region.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
