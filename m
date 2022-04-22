Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c4f4600b003918d69b334sm5005544wmq.42.2022.04.22.06.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 06:58:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5E99E1FFB7;
	Fri, 22 Apr 2022 14:58:50 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-8-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 07/60] target/arm: Extend store_cpu_offset to take
 field size
Date: Fri, 22 Apr 2022 14:58:39 +0100
In-reply-to: <20220417174426.711829-8-richard.henderson@linaro.org>
Message-ID: <87a6cdusmd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hDf8y2UWYTNu


Richard Henderson <richard.henderson@linaro.org> writes:

> Currently we assume all fields are 32-bit.
> Prepare for fields of a single byte, using sizeof.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
