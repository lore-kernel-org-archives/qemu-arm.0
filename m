Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id t189-20020a1c46c6000000b003c701c12a17sm8373306wma.12.2022.10.24.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:20:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 72DBC1FFB7;
	Mon, 24 Oct 2022 16:20:57 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-12-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 11/14] target/arm: Tidy merging of attributes from
 descriptor and table
Date: Mon, 24 Oct 2022 16:20:53 +0100
In-reply-to: <20221024051851.3074715-12-richard.henderson@linaro.org>
Message-ID: <8735bd9rja.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ww4qhA2j6trT


Richard Henderson <richard.henderson@linaro.org> writes:

> Replace some gotos with some nested if statements.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
