Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e26-20020a50a69a000000b00425c11446fasm705269edc.3.2022.04.22.08.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 08:21:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5B9721FFB7;
	Fri, 22 Apr 2022 16:21:39 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-25-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 24/60] target/arm: Split out cpregs.h
Date: Fri, 22 Apr 2022 16:21:30 +0100
In-reply-to: <20220417174426.711829-25-richard.henderson@linaro.org>
Message-ID: <87sfq5ta7w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cFPdwG2MqGXq


Richard Henderson <richard.henderson@linaro.org> writes:

> Move ARMCPRegInfo and all related declarations to a new
> internal header, out of the public cpu.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
