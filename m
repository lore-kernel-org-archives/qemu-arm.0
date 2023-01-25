Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id bj7-20020a0560001e0700b002bfb5618ee7sm3692468wrb.91.2023.01.25.13.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 13:13:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 86BB71FFB7;
	Wed, 25 Jan 2023 21:13:34 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 07/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Wed, 25 Jan 2023 21:13:30 +0000
In-reply-to: <20230108023719.2466341-8-richard.henderson@linaro.org>
Message-ID: <87357yqpvl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GmZcCzZ1ZowR


Richard Henderson <richard.henderson@linaro.org> writes:

> This will be used by _WIN64 to return i128.  Not yet used,
> because allocation is not yet enabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
