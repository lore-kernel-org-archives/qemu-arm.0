Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v7sm9296931wme.47.2021.04.07.08.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:34:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A94DB1FF7E;
	Wed,  7 Apr 2021 16:34:55 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/12] target/arm: Check PAGE_WRITE_ORG for MTE
 writeability
Date: Wed, 07 Apr 2021 16:34:49 +0100
In-reply-to: <20210406174031.64299-3-richard.henderson@linaro.org>
Message-ID: <87o8equmzk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Rqvf8VVN7cFN


Richard Henderson <richard.henderson@linaro.org> writes:

> We can remove PAGE_WRITE when (internally) marking a page
> read-only because it contains translated code.
>
> This can be triggered by tests/tcg/aarch64/bti-2, after
> having serviced SIGILL trampolines on the stack.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
