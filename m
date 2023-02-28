Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b003e209b45f6bsm18020644wmq.29.2023.02.28.09.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 09:49:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4ABD31FFB7;
	Tue, 28 Feb 2023 17:49:00 +0000 (GMT)
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-18-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 17/31] tcg: Don't re-use TEMP_TB temporaries
Date: Tue, 28 Feb 2023 17:48:52 +0000
In-reply-to: <20230227053701.368744-18-richard.henderson@linaro.org>
Message-ID: <87zg8xel4j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: O+nKwsba3Ep7


Richard Henderson <richard.henderson@linaro.org> writes:

> Reusing TEMP_TB interferes with detecting whether the
> temp can be adjusted to TEMP_EBB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
