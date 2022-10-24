Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003c6f1732f65sm9113380wmn.38.2022.10.24.08.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:06:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0F6CF1FFB7;
	Mon, 24 Oct 2022 16:06:18 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-11-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 10/14] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Mon, 24 Oct 2022 16:06:13 +0100
In-reply-to: <20221024051851.3074715-11-richard.henderson@linaro.org>
Message-ID: <877d0p9s7p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: a8Ib+0JGhzYc


Richard Henderson <richard.henderson@linaro.org> writes:

> Both GP and DBM are in the upper attribute block.
> Extend the computation of attrs to include them,
> then simplify the setting of guarded.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
