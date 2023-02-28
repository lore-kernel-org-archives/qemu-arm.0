Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n33-20020a05600c502100b003e8dc7a03basm17256919wmr.41.2023.02.28.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 09:29:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0AC191FFB7;
	Tue, 28 Feb 2023 17:29:42 +0000 (GMT)
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 07/31] tcg: Add liveness_pass_0
Date: Tue, 28 Feb 2023 17:29:37 +0000
In-reply-to: <20230227053701.368744-8-richard.henderson@linaro.org>
Message-ID: <874jr5g0l6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lPuJChqDzL7p


Richard Henderson <richard.henderson@linaro.org> writes:

> Attempt to reduce the lifetime of TEMP_TB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
